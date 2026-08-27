-- Real XP ledger for the home screen's weekly quiz challenge. A "quiz" is
-- a completed practice test (ai_usage_log.feature = 'prepare_homework',
-- already the real, existing signal for "the student built and finished a
-- test"). The bonus is claimed client-side the first time the weekly
-- target is crossed (same unlock-on-detection pattern as
-- user_achievements), guarded by last_weekly_bonus_week so it can't be
-- claimed twice for the same week.
create table public.user_xp (
  user_id uuid primary key references auth.users (id) on delete cascade,
  total_xp integer not null default 0,
  last_weekly_bonus_week date,
  updated_at timestamptz not null default now()
);

alter table public.user_xp enable row level security;

create policy "Users can view their own xp"
  on public.user_xp for select
  using (auth.uid() = user_id);

create policy "Users can insert their own xp"
  on public.user_xp for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own xp"
  on public.user_xp for update
  using (auth.uid() = user_id);
