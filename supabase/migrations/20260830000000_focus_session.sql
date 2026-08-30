-- Phase 9 : Focus session
-- Une session de concentration chronométrée crédite de l'XP à la fin. Le
-- blocage des notifications est géré côté app (guidage manuel Android/iOS,
-- voir README) — cette fonction ne fait que valider la durée et créditer l'XP.

create or replace function public.complete_focus_session(p_duration_minutes int)
returns table (xp_awarded int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_xp int;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  -- Durées limitées à des paliers fixes : empêche de créditer une durée
  -- arbitraire non réellement chronométrée par l'app.
  if p_duration_minutes not in (15, 25, 45, 60) then
    raise exception 'Durée de session invalide';
  end if;

  v_xp := p_duration_minutes;

  perform public.record_xp_event('focus_session', null, v_xp);

  return query select v_xp;
end;
$$;

grant execute on function public.complete_focus_session(int) to authenticated;
