-- Phase 4 : Exercices corrigés
-- QCM liés à une leçon. Réservés à Premium pour la soumission/correction ;
-- visibles (mais non complétables) par les élèves gratuits (US-8).
--
-- La question (exercises) et la réponse (exercise_answers) sont dans deux
-- tables séparées : RLS ne filtre que des lignes, pas des colonnes, donc si
-- correct_option_id/explanation_md vivaient dans exercises, un select('*')
-- côté client les exposerait avant toute soumission. exercise_answers n'a
-- aucune policy select élève : seule submit_exercise_attempt() (security
-- definer) peut la lire.

create table public.exercises (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  question_md text not null,
  options jsonb not null,
  sort_order int not null default 0,
  status text not null default 'draft' check (status in ('draft', 'published')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint exercises_options_is_array check (jsonb_typeof(options) = 'array')
);

comment on table public.exercises is 'Question d''un QCM lié à une leçon. options: [{"id": "a", "text": "..."}, ...], sans indication de la bonne réponse.';

create index exercises_lesson_status_idx on public.exercises (lesson_id, status, sort_order);

create trigger exercises_set_updated_at
  before update on public.exercises
  for each row
  execute function public.set_updated_at();

create table public.exercise_answers (
  exercise_id uuid primary key references public.exercises (id) on delete cascade,
  correct_option_id text not null,
  explanation_md text not null default ''
);

comment on table public.exercise_answers is 'Bonne réponse + explication d''un exercice. Jamais lisible par le client ; uniquement via public.submit_exercise_attempt() (security definer).';

create table public.exercise_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  exercise_id uuid not null references public.exercises (id) on delete cascade,
  selected_option_id text not null,
  is_correct boolean not null,
  completed_at timestamptz not null default now(),
  primary key (user_id, exercise_id)
);

comment on table public.exercise_progress is 'Tentatives d''exercices par élève. Écrite uniquement via public.submit_exercise_attempt().';

-- ---------------------------------------------------------------------------
-- Fonctions
-- ---------------------------------------------------------------------------

create or replace function public.submit_exercise_attempt(p_exercise_id uuid, p_selected_option_id text)
returns table (already_completed boolean, is_correct boolean, correct_option_id text, explanation_md text, xp_awarded int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_exercise public.exercises%rowtype;
  v_answer public.exercise_answers%rowtype;
  v_lesson public.lessons%rowtype;
  v_grade text;
  v_serie text;
  v_existing public.exercise_progress%rowtype;
  v_correct boolean;
  v_xp constant int := 10;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  if not public.is_premium() then
    raise exception 'Réservé aux élèves Premium';
  end if;

  select * into v_exercise from public.exercises where id = p_exercise_id and status = 'published';
  if not found then
    raise exception 'Exercice introuvable ou non publié';
  end if;

  select * into v_lesson from public.lessons where id = v_exercise.lesson_id and status = 'published';
  if not found then
    raise exception 'Leçon introuvable ou non publiée';
  end if;

  select grade, serie into v_grade, v_serie from public.profiles where id = v_user;
  if v_grade is distinct from v_lesson.grade
     or (v_lesson.serie is not null and v_serie is distinct from v_lesson.serie) then
    raise exception 'Cet exercice ne correspond pas à ta classe';
  end if;

  select * into v_answer from public.exercise_answers where exercise_id = p_exercise_id;
  if not found then
    raise exception 'Correction introuvable pour cet exercice';
  end if;

  select * into v_existing from public.exercise_progress where user_id = v_user and exercise_id = p_exercise_id;
  if found then
    return query select true, v_existing.is_correct, v_answer.correct_option_id, v_answer.explanation_md, 0;
    return;
  end if;

  v_correct := p_selected_option_id = v_answer.correct_option_id;

  insert into public.exercise_progress (user_id, exercise_id, selected_option_id, is_correct)
  values (v_user, p_exercise_id, p_selected_option_id, v_correct);

  perform public.record_xp_event('exercise', p_exercise_id, v_xp);

  return query select false, v_correct, v_answer.correct_option_id, v_answer.explanation_md, v_xp;
end;
$$;

grant execute on function public.submit_exercise_attempt(uuid, text) to authenticated;

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------

alter table public.exercises enable row level security;

create policy "Admin voit tout le contenu"
  on public.exercises for select
  to authenticated
  using (public.is_admin());

-- La question reste visible aux élèves gratuits (verrouillée côté app, pas côté
-- lecture) : seule la soumission/correction est bloquée par submit_exercise_attempt().
create policy "Élève voit les exercices publiés de sa classe"
  on public.exercises for select
  to authenticated
  using (
    status = 'published'
    and exists (
      select 1 from public.lessons l
      join public.profiles p on p.id = auth.uid()
      where l.id = exercises.lesson_id
        and l.status = 'published'
        and p.grade = l.grade
        and (l.serie is null or p.serie = l.serie)
    )
  );

create policy "Admin crée et modifie le contenu"
  on public.exercises for all
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

alter table public.exercise_answers enable row level security;

-- Aucune policy select pour les élèves : la réponse ne transite que par
-- submit_exercise_attempt() (security definer, contourne RLS).
create policy "Admin gère les réponses"
  on public.exercise_answers for all
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

alter table public.exercise_progress enable row level security;

create policy "Élève voit sa propre progression"
  on public.exercise_progress for select
  to authenticated
  using (auth.uid() = user_id);
