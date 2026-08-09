-- One row per focus session attempt (Forest-style: a tree grows while the
-- student stays on the focus screen; leaving early kills it). succeeded is
-- only set true if the full planned duration elapsed without the student
-- leaving the screen or backgrounding the app.
create table public.focus_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  duration_minutes integer not null,
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  succeeded boolean not null default false
);

create index focus_sessions_user_succeeded_idx
  on public.focus_sessions (user_id, succeeded);

alter table public.focus_sessions enable row level security;

create policy "Users can view their own focus sessions"
  on public.focus_sessions for select
  using (auth.uid() = user_id);

create policy "Users can insert their own focus sessions"
  on public.focus_sessions for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own focus sessions"
  on public.focus_sessions for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
