-- Anglais 6ème catalog, sourced from the official DPFC programme éducatif
-- PDF (Compétences 1-8, one theme and 3 leçons each: à l'école, à la
-- maison, l'heure et la date, métiers et professions, vêtements et
-- couleurs, nourriture et boissons, environnement et santé, jeux et
-- sports) — titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('anglais-6e-salutations', '6eme', 'anglais', 'Les salutations', 1, null),
('anglais-6e-salle-classe', '6eme', 'anglais', 'La salle de classe', 2, 'anglais-6e-salutations'),
('anglais-6e-nombres-fournitures', '6eme', 'anglais', 'Les nombres et les fournitures scolaires', 3, 'anglais-6e-salle-classe'),
('anglais-6e-famille', '6eme', 'anglais', 'La famille', 4, 'anglais-6e-nombres-fournitures'),
('anglais-6e-pieces-maison', '6eme', 'anglais', $$Les pièces d'une maison$$, 5, 'anglais-6e-famille'),
('anglais-6e-cuisine', '6eme', 'anglais', 'Dans la cuisine', 6, 'anglais-6e-pieces-maison'),
('anglais-6e-date', '6eme', 'anglais', 'La date', 7, 'anglais-6e-cuisine'),
('anglais-6e-heure', '6eme', 'anglais', $$L'heure$$, 8, 'anglais-6e-date'),
('anglais-6e-emploi-temps', '6eme', 'anglais', $$L'emploi du temps$$, 9, 'anglais-6e-heure'),
('anglais-6e-metiers-professions', '6eme', 'anglais', 'Métiers et professions', 10, 'anglais-6e-emploi-temps'),
('anglais-6e-outils-travail', '6eme', 'anglais', 'Les outils de travail', 11, 'anglais-6e-metiers-professions'),
('anglais-6e-lieux-travail', '6eme', 'anglais', 'Les lieux de travail', 12, 'anglais-6e-outils-travail'),
('anglais-6e-vetements', '6eme', 'anglais', 'Les vêtements', 13, 'anglais-6e-lieux-travail'),
('anglais-6e-vetements-couleurs', '6eme', 'anglais', 'Vêtements et couleurs', 14, 'anglais-6e-vetements'),
('anglais-6e-achats-vetements', '6eme', 'anglais', 'Chez le marchand de vêtements', 15, 'anglais-6e-vetements-couleurs'),
('anglais-6e-repas-boissons', '6eme', 'anglais', 'Repas et boissons', 16, 'anglais-6e-achats-vetements'),
('anglais-6e-fruits-legumes', '6eme', 'anglais', $$Fruits et légumes$$, 17, 'anglais-6e-repas-boissons'),
('anglais-6e-recettes-cuisine', '6eme', 'anglais', 'Les recettes de cuisine', 18, 'anglais-6e-fruits-legumes'),
('anglais-6e-hygiene-corporelle', '6eme', 'anglais', $$Les parties du corps et l'hygiène corporelle$$, 19, 'anglais-6e-recettes-cuisine'),
('anglais-6e-maladies-courantes', '6eme', 'anglais', $$Insalubrité et maladies courantes$$, 20, 'anglais-6e-hygiene-corporelle'),
('anglais-6e-eau-sante', '6eme', 'anglais', $$L'eau et la santé$$, 21, 'anglais-6e-maladies-courantes'),
('anglais-6e-importance-sport', '6eme', 'anglais', $$L'importance du sport$$, 22, 'anglais-6e-eau-sante'),
('anglais-6e-can', '6eme', 'anglais', 'La CAN', 23, 'anglais-6e-importance-sport'),
('anglais-6e-jeux-traditionnels', '6eme', 'anglais', 'Les jeux traditionnels', 24, 'anglais-6e-can');
