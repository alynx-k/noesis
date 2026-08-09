-- SVT 6ème catalog, sourced from the official DPFC programme éducatif PDF
-- (Compétence 1: reproduction chez les plantes à fleurs et chez les
-- vertébrés, Compétence 2: facteurs de croissance chez les plantes à
-- fleurs et chez les vertébrés, Compétence 3: dégradation et
-- préservation de l'environnement) — titles and order only, content
-- generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('svt-6e-formation-graine', '6eme', 'svt', 'La formation de la graine', 1, null),
('svt-6e-germination-graine', '6eme', 'svt', $$La germination d'une graine$$, 2, 'svt-6e-formation-graine'),
('svt-6e-reproduction-mammiferes', '6eme', 'svt', 'La reproduction chez les mammifères', 3, 'svt-6e-germination-graine'),
('svt-6e-reproduction-oiseaux', '6eme', 'svt', 'La reproduction chez les oiseaux', 4, 'svt-6e-reproduction-mammiferes'),
('svt-6e-facteurs-croissance-plantes', '6eme', 'svt', $$Les facteurs de croissance chez les plantes à fleurs$$, 5, 'svt-6e-reproduction-oiseaux'),
('svt-6e-influence-aliments-croissance', '6eme', 'svt', $$L'influence des aliments sur la croissance des vertébrés$$, 6, 'svt-6e-facteurs-croissance-plantes'),
('svt-6e-actions-nefastes-environnement', '6eme', 'svt', $$Les actions néfastes de l'Homme et leurs conséquences sur l'environnement$$, 7, 'svt-6e-influence-aliments-croissance'),
('svt-6e-lutte-degradation-environnement', '6eme', 'svt', $$La lutte contre la dégradation de l'environnement$$, 8, 'svt-6e-actions-nefastes-environnement');
