-- Phase 10 : Ligues hebdomadaires
-- Classement hebdomadaire par XP, groupé par classe+série (fusionné si trop
-- petit), 8 paliers avec promotion/relégation automatique chaque lundi via
-- pg_cron. Aucune lecture directe des tables par le client : tout passe par
-- get_my_league_board() (security definer), qui ne révèle jamais l'identité
-- des autres membres (pas de PII sur un classement partagé avec sa classe).

create table public.leagues (
  id uuid primary key default gen_random_uuid(),
  week_start date not null,
  tier int not null check (tier between 1 and 8),
  cohort_key text not null,
  status text not null default 'active' check (status in ('active', 'closed')),
  created_at timestamptz not null default now(),
  unique (week_start, tier, cohort_key)
);

comment on table public.leagues is 'Groupe de classement hebdomadaire pour un palier + une cohorte classe/série (éventuellement fusionnée, cohort_key = "3e" ou "2nde-A+2nde-C").';

create index leagues_active_week_idx on public.leagues (status, week_start);

create table public.league_memberships (
  id uuid primary key default gen_random_uuid(),
  league_id uuid not null references public.leagues (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  xp_this_week int not null default 0,
  outcome text check (outcome in ('promoted', 'relegated', 'stayed')),
  next_tier int check (next_tier between 1 and 8),
  created_at timestamptz not null default now(),
  unique (league_id, user_id)
);

comment on table public.league_memberships is 'Participation d''un élève à une ligue. outcome/next_tier renseignés au rollover hebdomadaire (run_league_rollover). Écrite uniquement via les fonctions security definer.';

create index league_memberships_user_idx on public.league_memberships (user_id);
create index league_memberships_league_xp_idx on public.league_memberships (league_id, xp_this_week desc);

alter table public.leagues enable row level security;
alter table public.league_memberships enable row level security;
-- Aucune policy select/insert/update/delete pour les élèves : la seule voie
-- de lecture est get_my_league_board(), qui ne renvoie jamais le user_id des
-- autres membres. Les écritures passent par ensure_active_league() (appelée
-- par record_xp_event) et run_league_rollover() (pg_cron).

-- ---------------------------------------------------------------------------
-- ensure_active_league() : garantit une place dans la ligue de la semaine en
-- cours pour l'utilisateur, au palier hérité de son dernier rollover (ou le
-- palier le plus bas pour un nouvel élève). Idempotent.
-- ---------------------------------------------------------------------------

create or replace function public.ensure_active_league(p_user uuid)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_grade text;
  v_serie text;
  v_cohort text;
  v_week date := date_trunc('week', current_date)::date;
  v_league_id uuid;
  v_tier int;
begin
  select grade, serie into v_grade, v_serie from public.profiles where id = p_user;
  if v_grade is null then
    return null; -- onboarding incomplet : pas de classe, pas de ligue possible
  end if;

  v_cohort := v_grade || coalesce('-' || v_serie, '');

  select lm.league_id into v_league_id
  from public.league_memberships lm
  join public.leagues l on l.id = lm.league_id
  where lm.user_id = p_user and l.week_start = v_week and l.status = 'active'
  limit 1;

  if v_league_id is not null then
    return v_league_id;
  end if;

  select next_tier into v_tier
  from public.league_memberships lm
  join public.leagues l on l.id = lm.league_id
  where lm.user_id = p_user and l.status = 'closed' and lm.next_tier is not null
  order by l.week_start desc
  limit 1;

  v_tier := coalesce(v_tier, 8);

  select id into v_league_id
  from public.leagues
  where week_start = v_week and tier = v_tier and status = 'active'
    and v_cohort = any(string_to_array(cohort_key, '+'))
  limit 1;

  if v_league_id is null then
    insert into public.leagues (week_start, tier, cohort_key)
    values (v_week, v_tier, v_cohort)
    returning id into v_league_id;
  end if;

  insert into public.league_memberships (league_id, user_id)
  values (v_league_id, p_user)
  on conflict (league_id, user_id) do nothing;

  return v_league_id;
end;
$$;

revoke execute on function public.ensure_active_league(uuid) from public;

-- ---------------------------------------------------------------------------
-- record_xp_event() : alimente aussi le classement de la ligue en cours.
-- Recréée en entier (même corps que Phase 2) avec l'ajout de la mise à jour
-- de xp_this_week.
-- ---------------------------------------------------------------------------

create or replace function public.record_xp_event(p_source_type text, p_source_id uuid, p_amount int)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_last_active date;
  v_league_id uuid;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  insert into public.xp_events (user_id, source_type, source_id, amount)
  values (v_user, p_source_type, p_source_id, p_amount);

  v_league_id := public.ensure_active_league(v_user);
  if v_league_id is not null then
    update public.league_memberships
      set xp_this_week = xp_this_week + p_amount
      where league_id = v_league_id and user_id = v_user;
  end if;

  select last_active_date into v_last_active from public.streaks where user_id = v_user;

  if v_last_active is null then
    insert into public.streaks (user_id, current_streak, longest_streak, last_active_date)
    values (v_user, 1, 1, current_date)
    on conflict (user_id) do update
      set current_streak = 1,
          longest_streak = greatest(public.streaks.longest_streak, 1),
          last_active_date = current_date,
          updated_at = now();
  elsif v_last_active = current_date then
    null;
  elsif v_last_active = current_date - 1 then
    update public.streaks
      set current_streak = current_streak + 1,
          longest_streak = greatest(longest_streak, current_streak + 1),
          last_active_date = current_date,
          updated_at = now()
      where user_id = v_user;
  else
    update public.streaks
      set current_streak = 1,
          last_active_date = current_date,
          updated_at = now()
      where user_id = v_user;
  end if;
end;
$$;

revoke execute on function public.record_xp_event(text, uuid, int) from public;

-- ---------------------------------------------------------------------------
-- get_my_league_board() : seule voie de lecture pour le client.
-- ---------------------------------------------------------------------------

create or replace function public.get_my_league_board()
returns table (rank int, xp int, is_me boolean, tier int, week_start date)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_league_id uuid;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  v_league_id := public.ensure_active_league(v_user);
  if v_league_id is null then
    return;
  end if;

  return query
  select
    (row_number() over (order by lm.xp_this_week desc, lm.created_at asc))::int as rank,
    lm.xp_this_week as xp,
    (lm.user_id = v_user) as is_me,
    l.tier,
    l.week_start
  from public.league_memberships lm
  join public.leagues l on l.id = lm.league_id
  where lm.league_id = v_league_id
  order by 1;
end;
$$;

grant execute on function public.get_my_league_board() to authenticated;

-- ---------------------------------------------------------------------------
-- run_league_rollover() : appelée chaque lundi par pg_cron. Calcule
-- promotion/relégation (~10% du groupe, min 1) pour chaque ligue active,
-- clôture la semaine, puis reconstruit les ligues de la semaine suivante en
-- fusionnant les cohortes classe/série trop petites (< 5 élèves) avec la
-- cohorte voisine suivante dans l'ordre du programme.
-- ---------------------------------------------------------------------------

create or replace function public.run_league_rollover()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_old_week date;
  v_new_week date;
  rec record;
  v_count int;
  v_promote int;
  v_relegate int;
  cohort_order constant text[] := array[
    '6e','5e','4e','3e',
    '2nde-A','2nde-C',
    '1ere-A','1ere-C','1ere-D',
    'terminale-A','terminale-C','terminale-D'
  ];
  min_size constant int := 5;
  v_tier int;
  v_bucket_keys text[];
  v_bucket_count int;
  v_key text;
  v_key_count int;
  v_new_league_id uuid;
  v_last_league_id uuid;
begin
  select min(week_start) into v_old_week from public.leagues where status = 'active';
  if v_old_week is null then
    return;
  end if;
  v_new_week := v_old_week + 7;

  -- 1) Promotion/relégation par ligue active.
  for rec in select id, tier from public.leagues where status = 'active' and week_start = v_old_week loop
    select count(*) into v_count from public.league_memberships where league_id = rec.id;

    v_promote := 0;
    v_relegate := 0;
    if rec.tier > 1 then v_promote := greatest(1, ceil(v_count * 0.1)::int); end if;
    if rec.tier < 8 then v_relegate := greatest(1, ceil(v_count * 0.1)::int); end if;
    if v_promote + v_relegate > v_count then
      v_promote := least(v_promote, v_count / 2);
      v_relegate := least(v_relegate, v_count / 2);
    end if;

    with ranked as (
      select id, row_number() over (order by xp_this_week desc, created_at asc) as rnk
      from public.league_memberships
      where league_id = rec.id
    )
    update public.league_memberships lm
    set
      outcome = case
        when ranked.rnk <= v_promote then 'promoted'
        when ranked.rnk > v_count - v_relegate then 'relegated'
        else 'stayed'
      end,
      next_tier = case
        when ranked.rnk <= v_promote then greatest(1, rec.tier - 1)
        when ranked.rnk > v_count - v_relegate then least(8, rec.tier + 1)
        else rec.tier
      end
    from ranked
    where lm.id = ranked.id;
  end loop;

  -- 2) Clôture la semaine.
  update public.leagues set status = 'closed' where status = 'active' and week_start = v_old_week;

  -- 3) Reconstruit les cohortes de la semaine suivante, palier par palier,
  -- en regroupant les cohortes classe/série dans l'ordre du programme
  -- jusqu'à atteindre min_size élèves.
  for v_tier in 1..8 loop
    v_bucket_keys := array[]::text[];
    v_bucket_count := 0;
    v_last_league_id := null;

    foreach v_key in array cohort_order loop
      select count(*) into v_key_count
      from public.league_memberships lm
      join public.leagues l on l.id = lm.league_id
      join public.profiles p on p.id = lm.user_id
      where l.status = 'closed' and l.week_start = v_old_week
        and lm.next_tier = v_tier
        and (p.grade || coalesce('-' || p.serie, '')) = v_key;

      if v_key_count = 0 then
        continue;
      end if;

      v_bucket_keys := array_append(v_bucket_keys, v_key);
      v_bucket_count := v_bucket_count + v_key_count;

      if v_bucket_count >= min_size then
        insert into public.leagues (week_start, tier, cohort_key)
        values (v_new_week, v_tier, array_to_string(v_bucket_keys, '+'))
        returning id into v_new_league_id;

        insert into public.league_memberships (league_id, user_id)
        select v_new_league_id, lm.user_id
        from public.league_memberships lm
        join public.leagues l on l.id = lm.league_id
        join public.profiles p on p.id = lm.user_id
        where l.status = 'closed' and l.week_start = v_old_week
          and lm.next_tier = v_tier
          and (p.grade || coalesce('-' || p.serie, '')) = any(v_bucket_keys);

        v_last_league_id := v_new_league_id;
        v_bucket_keys := array[]::text[];
        v_bucket_count := 0;
      end if;
    end loop;

    -- Reliquat trop petit pour former un groupe seul.
    if v_bucket_count > 0 then
      if v_last_league_id is not null then
        insert into public.league_memberships (league_id, user_id)
        select v_last_league_id, lm.user_id
        from public.league_memberships lm
        join public.leagues l on l.id = lm.league_id
        join public.profiles p on p.id = lm.user_id
        where l.status = 'closed' and l.week_start = v_old_week
          and lm.next_tier = v_tier
          and (p.grade || coalesce('-' || p.serie, '')) = any(v_bucket_keys)
        on conflict (league_id, user_id) do nothing;

        update public.leagues
          set cohort_key = cohort_key || '+' || array_to_string(v_bucket_keys, '+')
          where id = v_last_league_id;
      else
        insert into public.leagues (week_start, tier, cohort_key)
        values (v_new_week, v_tier, array_to_string(v_bucket_keys, '+'))
        returning id into v_new_league_id;

        insert into public.league_memberships (league_id, user_id)
        select v_new_league_id, lm.user_id
        from public.league_memberships lm
        join public.leagues l on l.id = lm.league_id
        join public.profiles p on p.id = lm.user_id
        where l.status = 'closed' and l.week_start = v_old_week
          and lm.next_tier = v_tier
          and (p.grade || coalesce('-' || p.serie, '')) = any(v_bucket_keys);
      end if;
    end if;
  end loop;
end;
$$;

revoke execute on function public.run_league_rollover() from public;

-- ---------------------------------------------------------------------------
-- Planification hebdomadaire (pg_cron).
-- ---------------------------------------------------------------------------

create extension if not exists pg_cron;

select cron.schedule(
  'weekly-league-rollover',
  '0 0 * * 1',
  $$select public.run_league_rollover();$$
);
