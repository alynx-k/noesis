-- Phase 16 : Ancrage du tuteur IA (chat) sur le contenu des cours.
-- Chaque leçon publiée est découpée en sections (par titre ## / ###), avec un
-- embedding vectoriel par section (Gemini gemini-embedding-2, dimension 768
-- via outputDimensionality — la dimension par défaut du modèle, 3072,
-- dépasse la limite d'index HNSW de pgvector). La recherche par similarité
-- retrouve le passage de cours le plus pertinent pour une question donnée.
-- Le calcul des embeddings et le découpage se font depuis l'edge function
-- (voir _shared/lesson-grounding.ts), pas ici — cette migration ne pose que
-- le schéma.

create extension if not exists vector;

create table public.lesson_sections (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  grade text not null,
  serie text,
  heading text,
  content text not null,
  embedding vector(768) not null,
  lesson_content_hash text not null,
  created_at timestamptz not null default now()
);

comment on table public.lesson_sections is 'Sections de leçons publiées (découpées par titre markdown) avec embedding, pour la recherche par similarité du tuteur IA. Régénérées par lesson-grounding.ts quand lesson_content_hash ne correspond plus au contenu actuel de la leçon.';
comment on column public.lesson_sections.lesson_content_hash is 'Hash du content_md de la leçon au moment du découpage — permet de détecter qu''une leçon a été modifiée et que ses sections doivent être régénérées.';

create index lesson_sections_lesson_id_idx on public.lesson_sections (lesson_id);
create index lesson_sections_grade_serie_idx on public.lesson_sections (grade, serie);
create index lesson_sections_embedding_idx on public.lesson_sections using hnsw (embedding vector_cosine_ops);

alter table public.lesson_sections enable row level security;
-- Aucune policy pour authenticated/anon : accès uniquement via le client
-- service_role des edge functions (comme ai_conversations/ai_messages).

create or replace function public.match_lesson_sections(
  p_query_embedding vector(768),
  p_grade text,
  p_serie text,
  p_match_count int default 1
)
returns table (lesson_id uuid, heading text, content text, similarity float)
language sql
stable
set search_path = public
as $$
  select
    ls.lesson_id,
    ls.heading,
    ls.content,
    1 - (ls.embedding <=> p_query_embedding) as similarity
  from public.lesson_sections ls
  where ls.grade = p_grade
    and (ls.serie is null or p_serie is null or ls.serie = p_serie)
  order by ls.embedding <=> p_query_embedding
  limit p_match_count;
$$;

revoke execute on function public.match_lesson_sections(vector, text, text, int) from public;

-- Quota d'essais gratuits du tuteur IA : passe d'un total fixe à vie à un
-- volume renouvelé chaque semaine (voir _shared/ai-trials.ts).
alter table public.profiles
  add column ai_trials_reset_week text;

comment on column public.profiles.ai_trials_reset_week is 'Semaine ISO (YYYY-IW) du dernier renouvellement de ai_trials_used à 0. Géré par _shared/ai-trials.ts.';
