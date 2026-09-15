-- Durcissement suite à la revue de code du fix multi-jours (20260914170000) :
--   1. v_missed_days pouvait devenir négatif si last_active_date se retrouve
--      après current_date (dérive d'horloge, édition manuelle) ; le calcul
--      augmentait alors les gels au-delà du plafond de 2. Bordé à 0.
--   2. La lecture du streak n'était pas verrouillée : deux appels concurrents
--      pour le même élève pouvaient se marcher dessus (perte de mise à jour).
--      Ajout de `for update`.
--   3. Aucune contrainte de base ne garantissait freezes_available >= 0.

alter table public.streaks
  add constraint streaks_freezes_available_non_negative check (freezes_available >= 0);

create or replace function public.record_xp_event(p_source_type text, p_source_id uuid, p_amount int)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_last_active date;
  v_freezes int;
  v_reset_month text;
  v_current_month constant text := to_char(current_date, 'YYYY-MM');
  v_league_id uuid;
  v_missed_days int;
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

  select last_active_date, freezes_available, freezes_reset_month
    into v_last_active, v_freezes, v_reset_month
    from public.streaks where user_id = v_user
    for update;

  -- Renouvellement mensuel : à chaque activité, si on a changé de mois
  -- depuis le dernier renouvellement, les gels repassent à 2 (pas de cumul).
  -- Comportement confirmé : ce renouvellement prime sur le calcul d'écart
  -- ci-dessous, y compris pour une absence à cheval sur le changement de mois.
  if v_reset_month is distinct from v_current_month then
    v_freezes := 2;
  end if;

  if v_last_active is null then
    insert into public.streaks (user_id, current_streak, longest_streak, last_active_date, freezes_available, freezes_reset_month)
    values (v_user, 1, 1, current_date, v_freezes, v_current_month)
    on conflict (user_id) do update
      set current_streak = 1,
          longest_streak = greatest(public.streaks.longest_streak, 1),
          last_active_date = current_date,
          freezes_available = v_freezes,
          freezes_reset_month = v_current_month,
          updated_at = now();
  elsif v_last_active = current_date then
    update public.streaks
      set freezes_available = v_freezes,
          freezes_reset_month = v_current_month
      where user_id = v_user;
  elsif v_last_active = current_date - 1 then
    update public.streaks
      set current_streak = current_streak + 1,
          longest_streak = greatest(longest_streak, current_streak + 1),
          last_active_date = current_date,
          freezes_available = v_freezes,
          freezes_reset_month = v_current_month,
          updated_at = now()
      where user_id = v_user;
  else
    -- Écart de 2 jours ou plus : un gel protège exactement un jour manqué.
    -- La série n'est préservée que si les gels disponibles couvrent tout
    -- l'écart ; sinon elle casse et aucun gel n'est consommé (tout ou rien).
    -- Bordé à 0 : last_active_date ne devrait jamais être postérieur à
    -- current_date, mais une dérive d'horloge ne doit pas gonfler les gels.
    v_missed_days := greatest((current_date - v_last_active) - 1, 0);
    if v_freezes >= v_missed_days then
      update public.streaks
        set freezes_available = v_freezes - v_missed_days,
            freezes_reset_month = v_current_month,
            last_active_date = current_date,
            updated_at = now()
        where user_id = v_user;
    else
      update public.streaks
        set current_streak = 1,
            freezes_available = v_freezes,
            freezes_reset_month = v_current_month,
            last_active_date = current_date,
            updated_at = now()
        where user_id = v_user;
    end if;
  end if;
end;
$$;

revoke execute on function public.record_xp_event(text, uuid, int) from public;
