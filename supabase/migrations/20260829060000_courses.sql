-- Phase 2 : Cours
-- Matières, leçons (pipeline brouillon -> relecture admin -> publication),
-- progression élève, XP et séries (moteur partagé, réutilisé par les phases suivantes).

create table public.subjects (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  sort_order int not null default 0
);

comment on table public.subjects is 'Matières du programme (Mathématiques, Français, ...).';

create table public.lessons (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid not null references public.subjects (id) on delete restrict,
  grade text not null check (grade in ('6e', '5e', '4e', '3e', '2nde', '1ere', 'terminale')),
  serie text check (serie in ('A', 'C', 'D')),
  chapter_order int not null default 0,
  title text not null,
  content_md text not null default '',
  status text not null default 'draft' check (status in ('draft', 'published')),
  generated_by text not null default 'manual' check (generated_by in ('manual', 'gemini')),
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint lessons_serie_requires_lycee_check check (serie is null or grade in ('1ere', 'terminale'))
);

comment on table public.lessons is 'Leçon d''une matière pour une classe (et série au lycée). Statut brouillon tant qu''un admin ne l''a pas publiée.';

create index lessons_subject_grade_serie_idx on public.lessons (subject_id, grade, serie, chapter_order);
create index lessons_status_idx on public.lessons (status);

create trigger lessons_set_updated_at
  before update on public.lessons
  for each row
  execute function public.set_updated_at();

create table public.lesson_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  completed_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

comment on table public.lesson_progress is 'Leçons terminées par un élève. Écrite uniquement via public.complete_lesson().';

create table public.xp_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  source_type text not null check (source_type in ('lesson', 'exercise', 'flashcard', 'focus_session')),
  source_id uuid,
  amount int not null check (amount > 0),
  created_at timestamptz not null default now()
);

comment on table public.xp_events is 'Historique d''XP gagné. Écrite uniquement via public.record_xp_event() (jamais directement par le client).';

create index xp_events_user_created_idx on public.xp_events (user_id, created_at);

create table public.streaks (
  user_id uuid primary key references auth.users (id) on delete cascade,
  current_streak int not null default 0,
  longest_streak int not null default 0,
  last_active_date date,
  freezes_available int not null default 2,
  updated_at timestamptz not null default now()
);

comment on table public.streaks is 'Série quotidienne par élève. Mise à jour uniquement via public.record_xp_event().';

create table public.admins (
  user_id uuid primary key references auth.users (id) on delete cascade,
  created_at timestamptz not null default now()
);

comment on table public.admins is 'Comptes autorisés à relire/publier du contenu depuis l''admin web.';

-- ---------------------------------------------------------------------------
-- Fonctions
-- ---------------------------------------------------------------------------

create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (select 1 from public.admins where user_id = auth.uid());
$$;

-- Fonction interne : jamais appelée directement par le client (voir revoke plus bas).
-- Centralise XP + incrément de série pour que toutes les activités (leçon, puis
-- exercice/flashcard/focus session dans les phases suivantes) partagent la même logique.
create or replace function public.record_xp_event(p_source_type text, p_source_id uuid, p_amount int)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_last_active date;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  insert into public.xp_events (user_id, source_type, source_id, amount)
  values (v_user, p_source_type, p_source_id, p_amount);

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
    null; -- déjà actif aujourd'hui, la série ne bouge pas
  elsif v_last_active = current_date - 1 then
    update public.streaks
      set current_streak = current_streak + 1,
          longest_streak = greatest(longest_streak, current_streak + 1),
          last_active_date = current_date,
          updated_at = now()
      where user_id = v_user;
  else
    -- écart de plus d'un jour : série rompue (le gel de série arrive en Phase 9)
    update public.streaks
      set current_streak = 1,
          last_active_date = current_date,
          updated_at = now()
      where user_id = v_user;
  end if;
end;
$$;

revoke execute on function public.record_xp_event(text, uuid, int) from public;

create or replace function public.complete_lesson(p_lesson_id uuid)
returns table (already_completed boolean, xp_awarded int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_lesson public.lessons%rowtype;
  v_grade text;
  v_serie text;
  v_row_count int;
  v_xp constant int := 20;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  select * into v_lesson from public.lessons where id = p_lesson_id and status = 'published';
  if not found then
    raise exception 'Leçon introuvable ou non publiée';
  end if;

  select grade, serie into v_grade, v_serie from public.profiles where id = v_user;
  if v_grade is distinct from v_lesson.grade
     or (v_lesson.serie is not null and v_serie is distinct from v_lesson.serie) then
    raise exception 'Cette leçon ne correspond pas à ta classe';
  end if;

  insert into public.lesson_progress (user_id, lesson_id)
  values (v_user, p_lesson_id)
  on conflict (user_id, lesson_id) do nothing;
  get diagnostics v_row_count = row_count;

  if v_row_count = 0 then
    return query select true, 0;
    return;
  end if;

  perform public.record_xp_event('lesson', p_lesson_id, v_xp);
  return query select false, v_xp;
end;
$$;

grant execute on function public.complete_lesson(uuid) to authenticated;

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------

alter table public.subjects enable row level security;

create policy "Tout élève authentifié lit les matières"
  on public.subjects for select
  to authenticated
  using (true);

create policy "Admin gère les matières"
  on public.subjects for all
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

alter table public.lessons enable row level security;

create policy "Admin voit tout le contenu"
  on public.lessons for select
  to authenticated
  using (public.is_admin());

create policy "Élève voit le contenu publié de sa classe"
  on public.lessons for select
  to authenticated
  using (
    status = 'published'
    and exists (
      select 1 from public.profiles p
      where p.id = auth.uid()
        and p.grade = lessons.grade
        and (lessons.serie is null or p.serie = lessons.serie)
    )
  );

create policy "Admin crée et modifie le contenu"
  on public.lessons for all
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

alter table public.lesson_progress enable row level security;

create policy "Élève voit sa propre progression"
  on public.lesson_progress for select
  to authenticated
  using (auth.uid() = user_id);

alter table public.xp_events enable row level security;

create policy "Élève voit ses propres événements XP"
  on public.xp_events for select
  to authenticated
  using (auth.uid() = user_id);

alter table public.streaks enable row level security;

create policy "Élève voit sa propre série"
  on public.streaks for select
  to authenticated
  using (auth.uid() = user_id);

alter table public.admins enable row level security;

create policy "Un admin voit la liste des admins"
  on public.admins for select
  to authenticated
  using (public.is_admin());

-- ---------------------------------------------------------------------------
-- Seed : matières + quelques leçons publiées en 3ème pour pouvoir tester
-- l'app élève avant que le pipeline de génération IA soit branché.
-- ---------------------------------------------------------------------------

insert into public.subjects (slug, name, sort_order) values
  ('maths', 'Mathématiques', 1),
  ('francais', 'Français', 2),
  ('anglais', 'Anglais', 3),
  ('physique-chimie', 'Physique-Chimie', 4),
  ('svt', 'SVT', 5),
  ('histoire-geo', 'Histoire-Géographie', 6),
  ('edhc', 'EDHC', 7);

insert into public.lessons (subject_id, grade, chapter_order, title, content_md, status, generated_by, published_at)
select id, '3e', 1,
  'Le calcul littéral',
  E'## Le calcul littéral\n\nLe calcul littéral consiste à effectuer des calculs avec des lettres qui représentent des nombres inconnus ou variables.\n\n### Développer\n\nDévelopper une expression, c''est transformer un produit en somme :\n\n`k(a + b) = ka + kb`\n\n**Exemple** : `3(x + 5) = 3x + 15`\n\n### Réduire\n\nRéduire une expression, c''est regrouper les termes de même nature :\n\n**Exemple** : `2x + 5x - 3 = 7x - 3`\n\n### À retenir\n\nOn développe toujours avant de réduire.',
  'published', 'manual', now()
from public.subjects where slug = 'maths';

insert into public.lessons (subject_id, grade, chapter_order, title, content_md, status, generated_by, published_at)
select id, '3e', 1,
  'Les figures de style',
  E'## Les figures de style\n\nLes figures de style permettent d''exprimer une idée avec plus de force ou d''originalité.\n\n### La comparaison\n\nElle rapproche deux éléments à l''aide d''un mot comparatif (*comme, tel que, pareil à*).\n\n**Exemple** : *"Il courait comme le vent."*\n\n### La métaphore\n\nElle rapproche deux éléments sans mot comparatif.\n\n**Exemple** : *"Cet élève est un lion en mathématiques."*\n\n### À retenir\n\nLa métaphore est une comparaison sans outil de comparaison.',
  'published', 'manual', now()
from public.subjects where slug = 'francais';
