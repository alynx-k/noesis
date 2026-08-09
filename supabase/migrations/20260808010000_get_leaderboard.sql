-- Cross-user aggregate for the Communauté leaderboard. RLS on
-- course_progress restricts every user to their own rows (see
-- 20260801120000_progress_tracking.sql), so a plain client-side query can
-- never build a cross-user ranking — this security definer function
-- bypasses RLS deliberately, but is written to only ever return a rank, a
-- stable pseudonym derived from user_id, and a completed count: never an
-- email, a real name, or raw table access.
create or replace function public.get_leaderboard()
returns table (
  rank bigint,
  pseudonym text,
  completed_count bigint,
  is_you boolean
)
language sql
security definer
set search_path = public
as $$
  with counts as (
    select
      user_id,
      count(*) filter (where completed) as completed_count,
      min(completed_at) filter (where completed) as first_completed_at
    from public.course_progress
    group by user_id
    having count(*) filter (where completed) > 0
  ),
  ranked as (
    select
      user_id,
      completed_count,
      row_number() over (order by completed_count desc, first_completed_at asc nulls last) as rank
    from counts
  )
  select
    ranked.rank,
    'Élève #' || substr(ranked.user_id::text, 1, 4) as pseudonym,
    ranked.completed_count,
    ranked.user_id = auth.uid() as is_you
  from ranked
  where ranked.rank <= 20 or ranked.user_id = auth.uid()
  order by ranked.rank;
$$;

revoke all on function public.get_leaderboard() from public;
grant execute on function public.get_leaderboard() to authenticated;
