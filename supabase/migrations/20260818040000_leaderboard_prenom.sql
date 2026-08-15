-- The leaderboard pseudonym was a raw "Élève #<uuid prefix>" hash — unreadable
-- and cold, and the redesign pass asks for a human pseudonym instead (e.g.
-- "Élève Dona"). Join auth.users to read the prénom captured at signup
-- (stored in raw_user_meta_data, same source as lib/profile.ts's
-- getDisplayName — see 20260808010000_get_leaderboard.sql's original
-- comment for why this stays a security definer function: RLS on
-- course_progress blocks any client-side cross-user read). Accounts with no
-- captured prénom (pre-signup-prompt accounts, Google/Apple sign-in) keep
-- the old hash-suffix format as a safe fallback rather than showing nothing.
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
    'Élève ' || coalesce(
      nullif(trim(u.raw_user_meta_data ->> 'prenom'), ''),
      '#' || substr(ranked.user_id::text, 1, 4)
    ) as pseudonym,
    ranked.completed_count,
    ranked.user_id = auth.uid() as is_you
  from ranked
  join auth.users u on u.id = ranked.user_id
  where ranked.rank <= 20 or ranked.user_id = auth.uid()
  order by ranked.rank;
$$;

revoke all on function public.get_leaderboard() from public;
grant execute on function public.get_leaderboard() to authenticated;
