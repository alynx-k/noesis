-- Duolingo-style leagues: students are grouped by grade + tier into ~30-
-- person cohorts for the week (Monday-Sunday, matching lib/objectives.ts's
-- startOfWeekIso), ranked by real lessons completed that week (not lifetime
-- totals — a lifetime leaderboard never lets anyone catch up, which is
-- exactly why the old get_leaderboard() demotivated most students). Every
-- Monday, the top ~30% of each group is promoted a tier, the bottom ~30% is
-- relegated, and everyone gets grouped fresh for the new week.
--
-- Like get_leaderboard() before it, this is entirely mediated by security
-- definer functions: the two tables below are never touched directly by a
-- client (no RLS policy grants them anything), sidestepping the whole
-- column-privilege lockdown that broke onboarding earlier this project.

alter table public.profiles
  add column league_tier text not null default 'bronze' check (league_tier in ('bronze', 'argent', 'or'));

create table public.league_groups (
  id uuid primary key default gen_random_uuid(),
  grade text not null,
  tier text not null check (tier in ('bronze', 'argent', 'or')),
  week_start date not null,
  created_at timestamptz not null default now()
);
create index league_groups_lookup_idx on public.league_groups (grade, tier, week_start);

create table public.league_memberships (
  group_id uuid not null references public.league_groups (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  primary key (group_id, user_id)
);
create index league_memberships_user_idx on public.league_memberships (user_id);

alter table public.league_groups enable row level security;
alter table public.league_memberships enable row level security;
-- No policies at all: only the security definer functions below (running as
-- the function owner) ever read or write these two tables.

-- Called from the client (see lib/leaderboard.ts): returns the caller's
-- current league standing, lazily joining them into a group for the current
-- week the first time they ask (handles new signups and returning students
-- without waiting for the weekly cron below to have run).
create or replace function public.get_my_league()
returns table (
  member_user_id uuid,
  pseudonym text,
  lessons_this_week bigint,
  rank bigint,
  is_you boolean,
  tier text,
  promotion_zone boolean,
  relegation_zone boolean,
  group_size bigint,
  week_start date
)
language plpgsql
security definer
set search_path = public
as $$
declare
  me uuid := auth.uid();
  my_grade text;
  my_tier text;
  this_week date := (date_trunc('week', now()))::date;
  my_group_id uuid;
  capacity constant int := 30;
begin
  select p.grade, p.league_tier into my_grade, my_tier from public.profiles p where p.user_id = me;
  if my_grade is null then
    return; -- no grade yet (still onboarding, or on the niveau waitlist) — nothing to show
  end if;

  select lm.group_id into my_group_id
  from public.league_memberships lm
  join public.league_groups lg on lg.id = lm.group_id
  where lm.user_id = me and lg.week_start = this_week;

  if my_group_id is null then
    select lg.id into my_group_id
    from public.league_groups lg
    where lg.grade = my_grade and lg.tier = my_tier and lg.week_start = this_week
      and (select count(*) from public.league_memberships m where m.group_id = lg.id) < capacity
    limit 1;

    if my_group_id is null then
      insert into public.league_groups (grade, tier, week_start) values (my_grade, my_tier, this_week)
      returning id into my_group_id;
    end if;

    insert into public.league_memberships (group_id, user_id) values (my_group_id, me)
    on conflict do nothing;
  end if;

  return query
  with counts as (
    select
      lm.user_id as u_id,
      count(*) filter (
        where cp.completed = true and cp.completed_at >= this_week and cp.completed_at < this_week + 7
      ) as lessons
    from public.league_memberships lm
    left join public.course_progress cp on cp.user_id = lm.user_id
    where lm.group_id = my_group_id
    group by lm.user_id
  ),
  ranked as (
    select
      u_id,
      lessons,
      row_number() over (order by lessons desc, u_id) as rnk,
      count(*) over () as grp_size
    from counts
  )
  select
    ranked.u_id,
    'Élève ' || coalesce(nullif(trim(u.raw_user_meta_data ->> 'prenom'), ''), '#' || substr(ranked.u_id::text, 1, 4)),
    ranked.lessons,
    ranked.rnk,
    ranked.u_id = me,
    my_tier,
    ranked.rnk <= greatest(1, ceil(ranked.grp_size * 0.3)) and my_tier <> 'or',
    ranked.rnk > (ranked.grp_size - greatest(1, ceil(ranked.grp_size * 0.3))) and my_tier <> 'bronze',
    ranked.grp_size,
    this_week
  from ranked
  join auth.users u on u.id = ranked.u_id
  order by ranked.rnk;
end;
$$;

revoke all on function public.get_my_league() from public;
grant execute on function public.get_my_league() to authenticated;

-- Scheduled weekly (see the pg_cron job below) — never called by clients.
-- Promotes/relegates every group whose week just ended; next week's groups
-- are formed lazily by get_my_league() above, not eagerly here.
create or replace function public.rotate_leagues()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  grp record;
  member record;
  member_count int;
  promote_cutoff int;
  relegate_cutoff int;
  rnk int;
  week_end date;
begin
  for grp in
    select id, tier, week_start from public.league_groups
    where week_start = (date_trunc('week', now() - interval '7 days'))::date
  loop
    week_end := grp.week_start + 7;

    select count(*) into member_count from public.league_memberships where group_id = grp.id;
    if member_count = 0 then
      continue;
    end if;
    promote_cutoff := greatest(1, ceil(member_count * 0.3));
    relegate_cutoff := greatest(1, ceil(member_count * 0.3));

    rnk := 0;
    for member in
      select lm.user_id,
        (
          select count(*) from public.course_progress cp
          where cp.user_id = lm.user_id and cp.completed = true
            and cp.completed_at >= grp.week_start and cp.completed_at < week_end
        ) as lessons
      from public.league_memberships lm
      where lm.group_id = grp.id
      order by lessons desc, lm.user_id
    loop
      rnk := rnk + 1;
      if rnk <= promote_cutoff and grp.tier <> 'or' then
        update public.profiles
          set league_tier = case grp.tier when 'bronze' then 'argent' when 'argent' then 'or' else grp.tier end
          where user_id = member.user_id;
      elsif rnk > (member_count - relegate_cutoff) and grp.tier <> 'bronze' then
        update public.profiles
          set league_tier = case grp.tier when 'or' then 'argent' when 'argent' then 'bronze' else grp.tier end
          where user_id = member.user_id;
      end if;
    end loop;
  end loop;
end;
$$;

revoke all on function public.rotate_leagues() from public, authenticated, anon;

create extension if not exists pg_cron with schema extensions;

select cron.schedule(
  'rotate-leagues-weekly',
  '5 0 * * 1', -- every Monday at 00:05 (Côte d'Ivoire is UTC+0, no offset needed)
  $$select public.rotate_leagues();$$
);
