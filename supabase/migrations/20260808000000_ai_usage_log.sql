-- Shared daily-quota counter for the two new AI homework features
-- ("Corrige mon devoir" / "Me prépare pour un devoir") — kept separate from
-- grade-answer's own counter (answer_attempts) so neither feature's quota
-- interferes with the other's.
create table public.ai_usage_log (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  feature text not null check (feature in ('correct_homework', 'prepare_homework')),
  created_at timestamptz not null default now()
);

create index ai_usage_log_user_created_idx on public.ai_usage_log (user_id, created_at desc);

alter table public.ai_usage_log enable row level security;

create policy "Users can view their own ai usage"
  on public.ai_usage_log for select
  using (auth.uid() = user_id);

create policy "Users can insert their own ai usage"
  on public.ai_usage_log for insert
  with check (auth.uid() = user_id);
