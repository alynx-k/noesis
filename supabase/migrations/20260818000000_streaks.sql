-- One row per user, maintained incrementally instead of derived on every
-- read from answer_attempts/course_progress/focus_sessions (the old
-- lib/streak.ts approach — three table scans per screen open). Call
-- public.record_activity() from any activity-producing mutation (course
-- completed, focus session succeeded, flashcard reviewed) to bump it.
create table public.streaks (
  user_id uuid primary key references auth.users (id) on delete cascade,
  current_streak integer not null default 0,
  longest_streak integer not null default 0,
  last_activity_date date,
  updated_at timestamptz not null default now()
);

alter table public.streaks enable row level security;

create policy "Users can view their own streak"
  on public.streaks for select
  using (auth.uid() = user_id);

-- No insert/update policy for regular clients: the only writer is
-- record_activity() below (security definer, scoped to auth.uid()), so the
-- increment/reset logic can't be bypassed by a client sending an arbitrary
-- current_streak value directly.

create or replace function public.record_activity()
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.streaks (user_id, current_streak, longest_streak, last_activity_date)
  values (auth.uid(), 1, 1, current_date)
  on conflict (user_id) do update set
    current_streak = case
      when streaks.last_activity_date = current_date then streaks.current_streak
      when streaks.last_activity_date = current_date - 1 then streaks.current_streak + 1
      else 1
    end,
    longest_streak = greatest(
      streaks.longest_streak,
      case
        when streaks.last_activity_date = current_date then streaks.current_streak
        when streaks.last_activity_date = current_date - 1 then streaks.current_streak + 1
        else 1
      end
    ),
    last_activity_date = current_date,
    updated_at = now();
end;
$$;

revoke all on function public.record_activity() from public;
grant execute on function public.record_activity() to authenticated;
