-- Premium flag: groundwork for the subscription-gated cosmetic achievement
-- skin (see components/achievement-badge.tsx's shimmer effect). This flag
-- only controls which visual skin renders — actual payment collection
-- (App Store/Play Store subscription products + webhook to flip this flag)
-- is a separate integration, not built here.
alter table public.profiles add column is_premium boolean not null default false;

-- One row per (user, achievement) unlock, permanent once granted. The
-- achievement catalog itself (title, tier, unlock criteria) lives in
-- constants/achievements.ts, not the database, since it's static app
-- content evaluated client-side against existing progress tables, not
-- per-user editable data.
create table public.user_achievements (
  user_id uuid not null references auth.users (id) on delete cascade,
  achievement_id text not null,
  unlocked_at timestamptz not null default now(),
  primary key (user_id, achievement_id)
);

alter table public.user_achievements enable row level security;

create policy "Users can view their own achievements"
  on public.user_achievements for select
  using (auth.uid() = user_id);

create policy "Users can insert their own achievements"
  on public.user_achievements for insert
  with check (auth.uid() = user_id);
