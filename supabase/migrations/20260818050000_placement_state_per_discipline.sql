-- The "où en es-tu dans ton programme ?" placement step moves from a single
-- one-time onboarding screen (covering only histoire-géographie) to a
-- per-discipline prompt shown the first time a student opens each subject
-- (app/subject/[disciplineId].tsx) — so the old single-row-per-user shape
-- ("have they been through placement, period") no longer fits: it needs to
-- track "have they been through placement for THIS discipline". No real
-- users have gone through this step in any meaningful volume yet (this
-- project hasn't launched), so this drops and recreates rather than
-- attempting a data migration for a handful of rows.
drop table if exists public.placement_state;

create table public.placement_state (
  user_id uuid not null references auth.users (id) on delete cascade,
  discipline_id text not null,
  skipped boolean not null default false,
  handled_at timestamptz not null default now(),
  primary key (user_id, discipline_id)
);

alter table public.placement_state enable row level security;

create policy "Users can view their own placement state"
  on public.placement_state for select
  using (auth.uid() = user_id);

create policy "Users can insert their own placement state"
  on public.placement_state for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own placement state"
  on public.placement_state for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
