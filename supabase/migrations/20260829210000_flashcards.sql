-- Phase 5 : Flashcards gratuites
-- Decks pré-faits liés à une leçon, répétition espacée (SM-2 simplifié),
-- accessibles gratuitement à tout élève (contrairement aux exercices Premium).

create table public.flashcard_decks (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  title text not null,
  status text not null default 'draft' check (status in ('draft', 'published')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.flashcard_decks is 'Deck de flashcards pré-fait lié à une leçon (chapitre).';

create index flashcard_decks_lesson_status_idx on public.flashcard_decks (lesson_id, status);

create trigger flashcard_decks_set_updated_at
  before update on public.flashcard_decks
  for each row
  execute function public.set_updated_at();

create table public.flashcards (
  id uuid primary key default gen_random_uuid(),
  deck_id uuid not null references public.flashcard_decks (id) on delete cascade,
  front_md text not null,
  back_md text not null,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.flashcards is 'Carte (recto/verso) d''un deck.';

create index flashcards_deck_idx on public.flashcards (deck_id, sort_order);

create trigger flashcards_set_updated_at
  before update on public.flashcards
  for each row
  execute function public.set_updated_at();

create table public.srs_reviews (
  user_id uuid not null references auth.users (id) on delete cascade,
  flashcard_id uuid not null references public.flashcards (id) on delete cascade,
  repetitions int not null default 0,
  ease_factor numeric not null default 2.5,
  interval_days int not null default 0,
  due_at date not null default current_date,
  last_reviewed_at timestamptz,
  primary key (user_id, flashcard_id)
);

comment on table public.srs_reviews is 'État de répétition espacée par élève/carte. Écrite uniquement via public.review_flashcard().';

create index srs_reviews_user_due_idx on public.srs_reviews (user_id, due_at);

-- ---------------------------------------------------------------------------
-- Fonctions
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

  select * into v_deck from public.flashcard_decks where id = v_card.deck_id and status = 'published';
  if not found then
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

grant execute on function public.review_flashcard(uuid, boolean) to authenticated;

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------

alter table public.flashcard_decks enable row level security;

create policy "Admin voit tout le contenu"
  on public.flashcard_decks for select
  to authenticated
  using (public.is_admin());

create policy "Élève voit les decks publiés de sa classe"
  on public.flashcard_decks for select
  to authenticated
  using (
    status = 'published'
    and exists (
      select 1 from public.lessons l
      join public.profiles p on p.id = auth.uid()
      where l.id = flashcard_decks.lesson_id
        and l.status = 'published'
        and p.grade = l.grade
        and (l.serie is null or p.serie = l.serie)
    )
  );

create policy "Admin crée et modifie le contenu"
  on public.flashcard_decks for all
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

alter table public.flashcards enable row level security;

create policy "Admin voit tout le contenu"
  on public.flashcards for select
  to authenticated
  using (public.is_admin());

create policy "Élève voit les cartes des decks publiés de sa classe"
  on public.flashcards for select
  to authenticated
  using (
    exists (
      select 1 from public.flashcard_decks d
      join public.lessons l on l.id = d.lesson_id
      join public.profiles p on p.id = auth.uid()
      where d.id = flashcards.deck_id
        and d.status = 'published'
        and l.status = 'published'
        and p.grade = l.grade
        and (l.serie is null or p.serie = l.serie)
    )
  );

create policy "Admin crée et modifie le contenu"
  on public.flashcards for all
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

alter table public.srs_reviews enable row level security;

create policy "Élève voit son propre historique de révision"
  on public.srs_reviews for select
  to authenticated
  using (auth.uid() = user_id);
