-- SVT 3ème catalog, sourced from the official DPFC programme éducatif PDF
-- (Compétence 1: nutrition chez l'Homme, Compétence 2: reproduction
-- humaine et infection au VIH, Compétence 3: relations sols-plantes,
-- Compétence 4: dégradation/protection/amélioration des sols) — titles and
-- order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('svt-aliments-homme', '3eme', 'svt', $$Les aliments et l'Homme$$, 1, null),
('svt-digestion', '3eme', 'svt', 'La digestion des aliments', 2, 'svt-aliments-homme'),
('svt-sang', '3eme', 'svt', 'Le sang', 3, 'svt-digestion'),
('svt-transfusion', '3eme', 'svt', 'La transfusion sanguine', 4, 'svt-sang'),
('svt-circulation-sanguine', '3eme', 'svt', 'La circulation sanguine', 5, 'svt-transfusion'),
('svt-grossesses-precoces', '3eme', 'svt', 'Les grossesses précoces et les moyens de prévention', 6, 'svt-circulation-sanguine'),
('svt-infection-vih', '3eme', 'svt', $$L'infection au VIH$$, 7, 'svt-grossesses-precoces'),
('svt-caracteristiques-sol', '3eme', 'svt', $$Les caractéristiques d'un sol$$, 8, 'svt-infection-vih'),
('svt-relations-sols-plantes', '3eme', 'svt', 'Les relations sols-plantes', 9, 'svt-caracteristiques-sol'),
('svt-degradation-sols', '3eme', 'svt', 'La dégradation des sols', 10, 'svt-relations-sols-plantes'),
('svt-protection-sols', '3eme', 'svt', $$La protection et l'amélioration des sols$$, 11, 'svt-degradation-sols');
