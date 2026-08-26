-- Chapters group several courses of the same grade/serie/subject under one
-- named unit with its own aggregate progress (see app/subject/[disciplineId].tsx).
-- Nullable FK on courses: only grades/series with a curated breakdown get
-- chapters — everything else keeps rendering as a flat course list, no
-- migration needed for those until their chapters are curated too.
create table public.chapters (
  id text primary key,
  grade text not null,
  serie text check (serie in ('A', 'C', 'D')),
  subject text not null,
  title text not null,
  order_index integer not null
);

create index chapters_grade_serie_subject_idx on public.chapters (grade, serie, subject, order_index);

alter table public.courses
  add column chapter_id text references public.chapters (id);

alter table public.chapters enable row level security;

-- Same shape as courses' own policy: shared curriculum structure, readable
-- by any signed-in student, writable only by migrations/service role.
create policy "Authenticated users can read chapters"
  on public.chapters for select
  to authenticated
  using (true);

-- Seconde (séries A and C) Histoire-Géographie: first curated breakdown,
-- following each subject's existing requires_course_id chain — Géographie
-- (outils du géographe → milieux ivoiriens → enjeux mondiaux) then Histoire
-- (méthodologie → civilisations antiques/médiévales → traite et peuplement
-- ivoirien). Both séries share the exact same lesson chain (mirrored course
-- rows, same titles/order), so the same six chapters apply to both.
insert into public.chapters (id, grade, serie, subject, title, order_index) values
('2nde-a-hg-geo-ch1', '2nde', 'A', 'geographie', $$Les outils du géographe$$, 1),
('2nde-a-hg-geo-ch2', '2nde', 'A', 'geographie', $$Les milieux ivoiriens$$, 2),
('2nde-a-hg-geo-ch3', '2nde', 'A', 'geographie', $$Enjeux environnementaux mondiaux$$, 3),
('2nde-a-hg-hist-ch1', '2nde', 'A', 'histoire', $$Comprendre et écrire l'histoire$$, 1),
('2nde-a-hg-hist-ch2', '2nde', 'A', 'histoire', $$Civilisations antiques et médiévales$$, 2),
('2nde-a-hg-hist-ch3', '2nde', 'A', 'histoire', $$De la traite au peuplement ivoirien$$, 3),
('2nde-c-hg-geo-ch1', '2nde', 'C', 'geographie', $$Les outils du géographe$$, 1),
('2nde-c-hg-geo-ch2', '2nde', 'C', 'geographie', $$Les milieux ivoiriens$$, 2),
('2nde-c-hg-geo-ch3', '2nde', 'C', 'geographie', $$Enjeux environnementaux mondiaux$$, 3),
('2nde-c-hg-hist-ch1', '2nde', 'C', 'histoire', $$Comprendre et écrire l'histoire$$, 1),
('2nde-c-hg-hist-ch2', '2nde', 'C', 'histoire', $$Civilisations antiques et médiévales$$, 2),
('2nde-c-hg-hist-ch3', '2nde', 'C', 'histoire', $$De la traite au peuplement ivoirien$$, 3);

-- Série A
update public.courses set chapter_id = '2nde-a-hg-geo-ch1' where id in
  ('2nde-a-hg-geo-objet-interet-demarche', '2nde-a-hg-geo-planete-terre', '2nde-a-hg-geo-techniques-representation-terre');
update public.courses set chapter_id = '2nde-a-hg-geo-ch2' where id in
  ('2nde-a-hg-geo-milieu-subequatorial-ivoirien', '2nde-a-hg-geo-milieu-tropical-ivoirien', '2nde-a-hg-geo-espace-ivoirien-environnement-menace');
update public.courses set chapter_id = '2nde-a-hg-geo-ch3' where id in
  ('2nde-a-hg-geo-grands-milieux-biogeographiques-monde', '2nde-a-hg-geo-problemes-environnementaux-actuels');
update public.courses set chapter_id = '2nde-a-hg-hist-ch1' where id in
  ('2nde-a-hg-hist-histoire-formation-citoyen', '2nde-a-hg-hist-methodes-etude-histoire', '2nde-a-hg-hist-methodologie-dissertation-commentaire');
update public.courses set chapter_id = '2nde-a-hg-hist-ch2' where id in
  ('2nde-a-hg-hist-prehistoire-afrique-monde', '2nde-a-hg-hist-civilisation-egypte-ancienne', '2nde-a-hg-hist-democratie-athenienne', '2nde-a-hg-hist-civilisation-soudan-occidental');
update public.courses set chapter_id = '2nde-a-hg-hist-ch3' where id in
  ('2nde-a-hg-hist-traites-des-noirs', '2nde-a-hg-hist-revolution-neolithique-ci', '2nde-a-hg-hist-peuples-ci-diversite-unite');

-- Série C (mirrored course ids)
update public.courses set chapter_id = '2nde-c-hg-geo-ch1' where id in
  ('2nde-c-hg-geo-objet-interet-demarche', '2nde-c-hg-geo-planete-terre', '2nde-c-hg-geo-techniques-representation-terre');
update public.courses set chapter_id = '2nde-c-hg-geo-ch2' where id in
  ('2nde-c-hg-geo-milieu-subequatorial-ivoirien', '2nde-c-hg-geo-milieu-tropical-ivoirien', '2nde-c-hg-geo-espace-ivoirien-environnement-menace');
update public.courses set chapter_id = '2nde-c-hg-geo-ch3' where id in
  ('2nde-c-hg-geo-grands-milieux-biogeographiques-monde', '2nde-c-hg-geo-problemes-environnementaux-actuels');
update public.courses set chapter_id = '2nde-c-hg-hist-ch1' where id in
  ('2nde-c-hg-hist-histoire-formation-citoyen', '2nde-c-hg-hist-methodes-etude-histoire', '2nde-c-hg-hist-methodologie-dissertation-commentaire');
update public.courses set chapter_id = '2nde-c-hg-hist-ch2' where id in
  ('2nde-c-hg-hist-prehistoire-afrique-monde', '2nde-c-hg-hist-civilisation-egypte-ancienne', '2nde-c-hg-hist-democratie-athenienne', '2nde-c-hg-hist-civilisation-soudan-occidental');
update public.courses set chapter_id = '2nde-c-hg-hist-ch3' where id in
  ('2nde-c-hg-hist-traites-des-noirs', '2nde-c-hg-hist-revolution-neolithique-ci', '2nde-c-hg-hist-peuples-ci-diversite-unite');
