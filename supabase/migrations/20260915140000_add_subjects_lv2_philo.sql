-- Ajoute Allemand, Espagnol (LV2) et Philosophie, matières couvertes par le
-- fonds de PDF de cours disponible mais absentes du référentiel initial.

insert into public.subjects (slug, name, sort_order) values
  ('allemand', 'Allemand', 8),
  ('espagnol', 'Espagnol', 9),
  ('philosophie', 'Philosophie', 10);
