-- Correction : la 2nde a aussi des séries (A/C) en Côte d'Ivoire, ce n'est pas
-- un tronc commun contrairement à l'hypothèse initiale des migrations Phase 1/2.

alter table public.profiles
  drop constraint profiles_serie_requires_lycee_check;

alter table public.profiles
  add constraint profiles_serie_requires_lycee_check
  check (serie is null or grade in ('2nde', '1ere', 'terminale'));

alter table public.lessons
  drop constraint lessons_serie_requires_lycee_check;

alter table public.lessons
  add constraint lessons_serie_requires_lycee_check
  check (serie is null or grade in ('2nde', '1ere', 'terminale'));
