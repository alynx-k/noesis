-- Lycée classes (2nde/1ère/Terminale) are split into séries (A/C/D) on the
-- real source (lyc.ecole-ci.org), each with a genuinely different subject
-- list and lesson content — unlike collège, where one subject list fits
-- every grade. `serie` is null for collège rows/profiles and non-null for
-- lycée ones.
alter table public.profiles
  add column serie text check (serie in ('A', 'C', 'D'));

alter table public.courses
  add column serie text check (serie in ('A', 'C', 'D'));

drop index public.courses_grade_subject_idx;
create index courses_grade_serie_subject_idx on public.courses (grade, serie, subject, order_index);
