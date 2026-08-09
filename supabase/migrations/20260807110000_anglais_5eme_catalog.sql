-- Anglais 5ème catalog, sourced from the official DPFC programme éducatif
-- PDF (8 compétences, each with one thème and 3 leçons) — titles and
-- order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('anglais-5e-salutations', '5eme', 'anglais', 'Les salutations (Greetings)', 1, null),
('anglais-5e-salle-de-classe', '5eme', 'anglais', 'La salle de classe (In the classroom)', 2, 'anglais-5e-salutations'),
('anglais-5e-nombres-fournitures', '5eme', 'anglais', $$Les nombres et les fournitures scolaires (Numbers and school things)$$, 3, 'anglais-5e-salle-de-classe'),
('anglais-5e-famille', '5eme', 'anglais', 'La famille (My family)', 4, 'anglais-5e-nombres-fournitures'),
('anglais-5e-pieces-maison', '5eme', 'anglais', $$Les pièces d'une maison (My house)$$, 5, 'anglais-5e-famille'),
('anglais-5e-cuisine', '5eme', 'anglais', 'Dans la cuisine (In the kitchen)', 6, 'anglais-5e-pieces-maison'),
('anglais-5e-date', '5eme', 'anglais', 'La date (The date)', 7, 'anglais-5e-cuisine'),
('anglais-5e-heure', '5eme', 'anglais', $$L'heure (The time)$$, 8, 'anglais-5e-date'),
('anglais-5e-emploi-temps', '5eme', 'anglais', $$L'emploi du temps (The time table)$$, 9, 'anglais-5e-heure'),
('anglais-5e-metiers-professions', '5eme', 'anglais', 'Métiers et professions (Jobs and occupations)', 10, 'anglais-5e-emploi-temps'),
('anglais-5e-outils-travail', '5eme', 'anglais', 'Outils de travail (Tools)', 11, 'anglais-5e-metiers-professions'),
('anglais-5e-lieux-travail', '5eme', 'anglais', 'Lieux de travail (Work places)', 12, 'anglais-5e-outils-travail'),
('anglais-5e-vetements', '5eme', 'anglais', $$Vêtements (Clothes)$$, 13, 'anglais-5e-lieux-travail'),
('anglais-5e-vetements-couleurs', '5eme', 'anglais', $$Vêtements et couleurs (Clothes and colours)$$, 14, 'anglais-5e-vetements'),
('anglais-5e-marchand-vetements', '5eme', 'anglais', 'Chez le marchand de vêtements (Buying clothes)', 15, 'anglais-5e-vetements-couleurs'),
('anglais-5e-repas-boissons', '5eme', 'anglais', 'Repas et boissons (Meals and drinks)', 16, 'anglais-5e-marchand-vetements'),
('anglais-5e-fruits-legumes', '5eme', 'anglais', 'Fruits et légumes (Fruit and vegetables)', 17, 'anglais-5e-repas-boissons'),
('anglais-5e-recettes-cuisine', '5eme', 'anglais', 'Recettes de cuisine (Recipes)', 18, 'anglais-5e-fruits-legumes'),
('anglais-5e-hygiene-corporelle', '5eme', 'anglais', $$Les parties du corps et l'hygiène corporelle (Hygiene and the parts of the body)$$, 19, 'anglais-5e-recettes-cuisine'),
('anglais-5e-insalubrite-maladies', '5eme', 'anglais', $$Insalubrité et maladies courantes (Insalubrity and common diseases)$$, 20, 'anglais-5e-hygiene-corporelle'),
('anglais-5e-eau-sante', '5eme', 'anglais', $$L'eau et la santé (Water and health)$$, 21, 'anglais-5e-insalubrite-maladies'),
('anglais-5e-importance-sport', '5eme', 'anglais', $$L'importance du sport (The importance of sport)$$, 22, 'anglais-5e-eau-sante'),
('anglais-5e-can', '5eme', 'anglais', 'La CAN (The CAN)', 23, 'anglais-5e-importance-sport'),
('anglais-5e-jeux-traditionnels', '5eme', 'anglais', 'Les jeux traditionnels (Traditional games)', 24, 'anglais-5e-can');
