-- Phase 18 : Synthèse de cours par photo (US-40, US-41).
-- L'élève prend une ou plusieurs photos de ses notes ; le tuteur IA en
-- extrait une synthèse fidèle au contenu photographié (pas d'ancrage sur le
-- programme officiel — à la différence du chat/correction de devoir). Seul
-- le texte généré est conservé, pas les photos sources.

create table public.course_summaries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles (id) on delete cascade,
  title text not null,
  content_md text not null,
  created_at timestamptz not null default now()
);

comment on table public.course_summaries is 'Synthèse de cours générée à partir de photos de notes, propriété de l''élève. Écrite uniquement par l''edge function course-summary (service role) ; lue/supprimée directement par l''élève.';

create index course_summaries_user_id_idx on public.course_summaries (user_id, created_at desc);

alter table public.course_summaries enable row level security;

create policy "Élève voit ses propres synthèses"
  on public.course_summaries for select
  to authenticated
  using (auth.uid() = user_id);

create policy "Élève supprime ses propres synthèses"
  on public.course_summaries for delete
  to authenticated
  using (auth.uid() = user_id);

-- Pas de policy insert/update pour authenticated : la création passe
-- uniquement par l'edge function course-summary (service role), pour
-- garantir que le quota d'essais est bien vérifié/consommé.
