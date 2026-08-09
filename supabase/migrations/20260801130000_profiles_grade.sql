-- One row per user: the class/grade they're enrolled in, plus the two
-- timestamps needed to enforce the grade-change rule (see lib/grade.ts):
-- free changes within 48h of the first pick, then at most one change per
-- calendar month afterwards.
create table public.profiles (
  user_id uuid primary key references auth.users (id) on delete cascade,
  grade text not null check (grade in ('6eme', '5eme', '4eme', '3eme', '2nde', '1ere', 'terminale')),
  grade_first_selected_at timestamptz not null default now(),
  grade_last_changed_at timestamptz not null default now(),
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy "Users can view their own profile"
  on public.profiles for select
  using (auth.uid() = user_id);

create policy "Users can insert their own profile"
  on public.profiles for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own profile"
  on public.profiles for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
