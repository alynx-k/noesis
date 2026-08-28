-- Expands the ladder from 3 tiers to 8 (League-of-Legends-style): bronze,
-- argent, or, platine, diamant, heroique, maitre, grand_maitre — ordered
-- lowest to highest. rotate_leagues() is rewritten to move one step up/down
-- an ordered array instead of a hardcoded 3-way case statement, so the
-- tier count never needs touching this function again.

alter table public.profiles drop constraint profiles_league_tier_check;
alter table public.profiles
  add constraint profiles_league_tier_check
  check (league_tier in ('bronze', 'argent', 'or', 'platine', 'diamant', 'heroique', 'maitre', 'grand_maitre'));

alter table public.league_groups drop constraint league_groups_tier_check;
alter table public.league_groups
  add constraint league_groups_tier_check
  check (tier in ('bronze', 'argent', 'or', 'platine', 'diamant', 'heroique', 'maitre', 'grand_maitre'));

create or replace function public.rotate_leagues()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  tiers constant text[] := array['bronze', 'argent', 'or', 'platine', 'diamant', 'heroique', 'maitre', 'grand_maitre'];
  grp record;
  member record;
  member_count int;
  promote_cutoff int;
  relegate_cutoff int;
  rnk int;
  week_end date;
  tier_idx int;
  new_tier text;
begin
  for grp in
    select id, tier, week_start from public.league_groups
    where week_start = (date_trunc('week', now() - interval '7 days'))::date
  loop
    week_end := grp.week_start + 7;
    tier_idx := array_position(tiers, grp.tier);

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
      new_tier := null;
      if rnk <= promote_cutoff and tier_idx < array_length(tiers, 1) then
        new_tier := tiers[tier_idx + 1];
      elsif rnk > (member_count - relegate_cutoff) and tier_idx > 1 then
        new_tier := tiers[tier_idx - 1];
      end if;

      if new_tier is not null then
        update public.profiles set league_tier = new_tier where user_id = member.user_id;
      end if;
    end loop;
  end loop;
end;
$$;

-- Only the top/bottom-tier literals change here (grand_maitre can't promote
-- further, bronze can't relegate further) — everything else is identical to
-- the version in 20260828110000_leagues.sql.
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
    return;
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
    ranked.rnk <= greatest(1, ceil(ranked.grp_size * 0.3)) and my_tier <> 'grand_maitre',
    ranked.rnk > (ranked.grp_size - greatest(1, ceil(ranked.grp_size * 0.3))) and my_tier <> 'bronze',
    ranked.grp_size,
    this_week
  from ranked
  join auth.users u on u.id = ranked.u_id
  order by ranked.rnk;
end;
$$;
