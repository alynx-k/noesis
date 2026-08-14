-- Replaces lib/placement-storage.ts's AsyncStorage-only "handled" flag,
-- which doesn't survive a reinstall. The placement flow's actual effect
-- (seeding neutral spaced_repetition_state rows) is unchanged and still
-- applied client-side via lib/placement.ts — this table only tracks whether
-- the user has been through the step, so the gate can skip it going forward.
create table public.placement_state (
  user_id uuid primary key references auth.users (id) on delete cascade,
  skipped boolean not null default false,
  handled_at timestamptz not null default now()
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
