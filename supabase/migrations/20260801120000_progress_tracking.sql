-- Progress tracking, spaced repetition, and answer grading history.
-- Written from the app's usage of these tables (context/progress.tsx,
-- lib/spaced-repetition.ts, app/exercise.tsx, app/profile.tsx,
-- supabase/functions/grade-answer) as a record of the schema, not a
-- character-perfect dump pulled from the remote database.

-- One row per (user, course): whether the course has been completed.
-- Composite primary key so `.upsert({ user_id, course_id, ... })` from
-- context/progress.tsx resolves conflicts on (user_id, course_id) by default.
create table public.course_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  course_id text not null,
  completed boolean not null default false,
  completed_at timestamptz,
  created_at timestamptz not null default now(),
  primary key (user_id, course_id)
);

alter table public.course_progress enable row level security;

create policy "Users can view their own course progress"
  on public.course_progress for select
  using (auth.uid() = user_id);

create policy "Users can upsert their own course progress"
  on public.course_progress for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own course progress"
  on public.course_progress for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- One row per (user, course): FSRS (ts-fsrs) scheduling state driving the
-- next spaced-repetition review date. Column names mirror the ts-fsrs Card
-- shape (see lib/spaced-repetition.ts).
create table public.spaced_repetition_state (
  user_id uuid not null references auth.users (id) on delete cascade,
  course_id text not null,
  due timestamptz not null,
  stability double precision not null,
  difficulty double precision not null,
  elapsed_days double precision not null,
  scheduled_days double precision not null,
  learning_steps integer not null,
  reps integer not null,
  lapses integer not null,
  state smallint not null,
  last_review timestamptz,
  updated_at timestamptz not null default now(),
  primary key (user_id, course_id)
);

alter table public.spaced_repetition_state enable row level security;

create policy "Users can view their own spaced repetition state"
  on public.spaced_repetition_state for select
  using (auth.uid() = user_id);

create policy "Users can upsert their own spaced repetition state"
  on public.spaced_repetition_state for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own spaced repetition state"
  on public.spaced_repetition_state for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- One row per graded answer submission, written by the grade-answer edge
-- function. verdict/error_type mirror the categories the grading prompt is
-- constrained to (see supabase/functions/grade-answer/index.ts).
create table public.answer_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  course_id text not null,
  question_number integer not null,
  verdict text not null check (verdict in ('correct', 'partial', 'incorrect')),
  error_type text check (error_type in ('étourderie', 'confusion', 'méthode')),
  created_at timestamptz not null default now()
);

-- Supports getConsecutiveWrongCount's per-(course, question) recent-attempts
-- lookup in app/exercise.tsx.
create index answer_attempts_course_question_created_idx
  on public.answer_attempts (course_id, question_number, created_at desc);

alter table public.answer_attempts enable row level security;

create policy "Users can view their own answer attempts"
  on public.answer_attempts for select
  using (auth.uid() = user_id);

create policy "Users can insert their own answer attempts"
  on public.answer_attempts for insert
  with check (auth.uid() = user_id);
