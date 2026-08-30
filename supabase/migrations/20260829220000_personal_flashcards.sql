-- Phase 6 : Flashcards personnalisées
-- Un élève Premium peut créer ses propres decks (question/réponse) et les
-- réviser avec le même moteur de répétition espacée que les decks pré-faits
-- (review_flashcard(), inchangé côté SRS/XP). Un deck est soit pré-fait
-- (lesson_id, géré par l'admin) soit personnel (user_id, géré par son
-- propriétaire) — jamais les deux.

alter table public.flashcard_decks alter column lesson_id drop not null;

alter table public.flashcard_decks
  add column user_id uuid references auth.users (id) on delete cascade;

alter table public.flashcard_decks
  add constraint flashcard_decks_owner_xor_lesson_check
  check ((lesson_id is not null) <> (user_id is not null));

comment on column public.flashcard_decks.user_id is 'Renseigné pour un deck personnalisé (Phase 6) ; lesson_id est alors null.';

-- ---------------------------------------------------------------------------
-- RLS : decks personnels
-- ---------------------------------------------------------------------------

-- La lecture (et donc la révision) d'un deck perso reste possible même si
-- l'abonnement Premium a expiré depuis (c'est le contenu de l'élève) ; seules
-- création/édition/suppression sont gatées Premium (critères d'acceptation).

create policy "Élève voit ses propres decks"
  on public.flashcard_decks for select
  to authenticated
  using (auth.uid() = user_id);

create policy "Élève crée ses propres decks"
  on public.flashcard_decks for insert
  to authenticated
  with check (auth.uid() = user_id and lesson_id is null and public.is_premium());

create policy "Élève modifie ses propres decks"
  on public.flashcard_decks for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id and public.is_premium());

create policy "Élève supprime ses propres decks"
  on public.flashcard_decks for delete
  to authenticated
  using (auth.uid() = user_id and public.is_premium());

-- ---------------------------------------------------------------------------
-- RLS : cartes des decks personnels
-- ---------------------------------------------------------------------------

create policy "Élève voit les cartes de ses propres decks"
  on public.flashcards for select
  to authenticated
  using (
    exists (
      select 1 from public.flashcard_decks d
      where d.id = flashcards.deck_id and d.user_id = auth.uid()
    )
  );

create policy "Élève crée des cartes dans ses propres decks"
  on public.flashcards for insert
  to authenticated
  with check (
    public.is_premium()
    and exists (
      select 1 from public.flashcard_decks d
      where d.id = flashcards.deck_id and d.user_id = auth.uid()
    )
  );

create policy "Élève modifie ses propres cartes"
  on public.flashcards for update
  to authenticated
  using (
    exists (
      select 1 from public.flashcard_decks d
      where d.id = flashcards.deck_id and d.user_id = auth.uid()
    )
  )
  with check (
    public.is_premium()
    and exists (
      select 1 from public.flashcard_decks d
      where d.id = flashcards.deck_id and d.user_id = auth.uid()
    )
  );

create policy "Élève supprime ses propres cartes"
  on public.flashcards for delete
  to authenticated
  using (
    public.is_premium()
    and exists (
      select 1 from public.flashcard_decks d
      where d.id = flashcards.deck_id and d.user_id = auth.uid()
    )
  );

-- ---------------------------------------------------------------------------
-- review_flashcard() : branche deck pré-fait (grade/série) vs deck perso (propriétaire)
-- ---------------------------------------------------------------------------

create or replace function public.review_flashcard(p_flashcard_id uuid, p_known boolean)
returns table (due_at date, interval_days int, xp_awarded int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_card public.flashcards%rowtype;
  v_deck public.flashcard_decks%rowtype;
  v_lesson public.lessons%rowtype;
  v_grade text;
  v_serie text;
  v_existing public.srs_reviews%rowtype;
  v_was_due boolean;
  v_repetitions int;
  v_ease numeric;
  v_interval int;
  v_due date;
  v_xp constant int := 3;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  select * into v_card from public.flashcards where id = p_flashcard_id;
  if not found then
    raise exception 'Carte introuvable';
  end if;

  select * into v_deck from public.flashcard_decks where id = v_card.deck_id;
  if not found then
    raise exception 'Deck introuvable';
  end if;

  if v_deck.user_id is not null then
    if v_deck.user_id is distinct from v_user then
      raise exception 'Ce deck ne t''appartient pas';
    end if;
  else
    if v_deck.status is distinct from 'published' then
      raise exception 'Deck introuvable ou non publié';
    end if;

    select * into v_lesson from public.lessons where id = v_deck.lesson_id and status = 'published';
    if not found then
      raise exception 'Leçon introuvable ou non publiée';
    end if;

    select grade, serie into v_grade, v_serie from public.profiles where id = v_user;
    if v_grade is distinct from v_lesson.grade
       or (v_lesson.serie is not null and v_serie is distinct from v_lesson.serie) then
      raise exception 'Cette carte ne correspond pas à ta classe';
    end if;
  end if;

  select * into v_existing from public.srs_reviews where user_id = v_user and flashcard_id = p_flashcard_id;
  v_was_due := (not found) or (v_existing.due_at <= current_date);
  if not v_was_due then
    raise exception 'Cette carte n''est pas encore due';
  end if;

  if not p_known then
    v_repetitions := 0;
    v_interval := 1;
    v_ease := greatest(1.3, coalesce(v_existing.ease_factor, 2.5) - 0.2);
  else
    v_repetitions := coalesce(v_existing.repetitions, 0) + 1;
    v_ease := least(2.5, coalesce(v_existing.ease_factor, 2.5) + 0.1);
    v_interval := case
      when v_repetitions = 1 then 1
      when v_repetitions = 2 then 6
      else round(coalesce(v_existing.interval_days, 1) * v_ease)::int
    end;
  end if;

  v_due := current_date + v_interval;

  insert into public.srs_reviews (user_id, flashcard_id, repetitions, ease_factor, interval_days, due_at, last_reviewed_at)
  values (v_user, p_flashcard_id, v_repetitions, v_ease, v_interval, v_due, now())
  on conflict (user_id, flashcard_id) do update
    set repetitions = excluded.repetitions,
        ease_factor = excluded.ease_factor,
        interval_days = excluded.interval_days,
        due_at = excluded.due_at,
        last_reviewed_at = excluded.last_reviewed_at;

  perform public.record_xp_event('flashcard', p_flashcard_id, v_xp);

  return query select v_due, v_interval, v_xp;
end;
$$;
