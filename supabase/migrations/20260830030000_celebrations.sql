-- Phase 14 : Célébrations (palier de ligue, jalon de série)
-- Un élève voit un écran de célébration dédié à la promotion de palier de
-- ligue (fin de semaine) ou à un jalon de série (7/30/100 jours), une seule
-- fois par événement. seen_celebrations enregistre ce qui a déjà été vu ;
-- get_pending_celebrations() calcule ce qui reste à montrer en comparant
-- l'état actuel (league_memberships.outcome, streaks.current_streak) à ce
-- qui a déjà été marqué vu.

create table public.seen_celebrations (
  user_id uuid not null references auth.users (id) on delete cascade,
  event_type text not null check (event_type in ('league_promotion', 'streak_milestone')),
  event_key text not null,
  seen_at timestamptz not null default now(),
  primary key (user_id, event_type, event_key)
);

comment on table public.seen_celebrations is 'Événements de célébration déjà montrés à l''élève, pour ne jamais les remontrer. Écrite uniquement via mark_celebration_seen().';

alter table public.seen_celebrations enable row level security;

create policy "Élève voit ses célébrations vues" on public.seen_celebrations
  for select using (auth.uid() = user_id);

-- ---------------------------------------------------------------------------
-- get_pending_celebrations() : événements de célébration pas encore vus.
-- ---------------------------------------------------------------------------

create or replace function public.get_pending_celebrations()
returns table (event_type text, event_key text, tier int, streak_days int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  return query
  select 'league_promotion'::text, lm.league_id::text, lm.next_tier, null::int
  from public.league_memberships lm
  join public.leagues l on l.id = lm.league_id
  where lm.user_id = v_user
    and lm.outcome = 'promoted'
    and l.status = 'closed'
    and not exists (
      select 1 from public.seen_celebrations sc
      where sc.user_id = v_user and sc.event_type = 'league_promotion' and sc.event_key = lm.league_id::text
    )
  order by l.week_start desc
  limit 1;

  return query
  select 'streak_milestone'::text, m.milestone::text, null::int, m.milestone
  from (values (7), (30), (100)) as m(milestone)
  join public.streaks s on s.user_id = v_user
  where s.current_streak >= m.milestone
    and not exists (
      select 1 from public.seen_celebrations sc
      where sc.user_id = v_user and sc.event_type = 'streak_milestone' and sc.event_key = m.milestone::text
    )
  order by m.milestone desc
  limit 1;
end;
$$;

grant execute on function public.get_pending_celebrations() to authenticated;

-- ---------------------------------------------------------------------------
-- mark_celebration_seen() : idempotent, appelée quand l'élève ferme l'écran.
-- ---------------------------------------------------------------------------

create or replace function public.mark_celebration_seen(p_event_type text, p_event_key text)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  insert into public.seen_celebrations (user_id, event_type, event_key)
  values (v_user, p_event_type, p_event_key)
  on conflict (user_id, event_type, event_key) do nothing;
end;
$$;

grant execute on function public.mark_celebration_seen(text, text) to authenticated;
