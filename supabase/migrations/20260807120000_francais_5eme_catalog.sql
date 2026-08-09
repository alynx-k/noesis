-- Français 5ème catalog, sourced from the official DPFC programme éducatif
-- PDF (5 compétences: expression orale, lecture, expression écrite,
-- grammaire, orthographe) — titles and order only, content generated on
-- demand. "Étudier une œuvre intégrale" is kept as a methodology lesson
-- (how to study any full-length literary work) since the official program
-- leaves the specific work to each teacher's choice rather than naming one.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('fr-5e-expose-oral', '5eme', 'francais', $$L'exposé oral$$, 1, null),
('fr-5e-oeuvre-integrale', '5eme', 'francais', $$Étudier une œuvre intégrale$$, 2, 'fr-5e-expose-oral'),
('fr-5e-lecture-portrait', '5eme', 'francais', 'Lire et comprendre un portrait', 3, 'fr-5e-oeuvre-integrale'),
('fr-5e-lecture-description-lieu', '5eme', 'francais', $$Lire et comprendre la description d'un lieu animé$$, 4, 'fr-5e-lecture-portrait'),
('fr-5e-lecture-poeme', '5eme', 'francais', 'Lire et comprendre un poème en vers libres', 5, 'fr-5e-lecture-description-lieu'),
('fr-5e-ecriture-portrait', '5eme', 'francais', 'Rédiger un portrait', 6, 'fr-5e-lecture-poeme'),
('fr-5e-ecriture-description-lieu', '5eme', 'francais', $$Rédiger la description d'un lieu animé$$, 7, 'fr-5e-ecriture-portrait'),
('fr-5e-ecriture-poeme', '5eme', 'francais', 'Rédiger un poème en vers libres', 8, 'fr-5e-ecriture-description-lieu'),
('fr-5e-compte-rendu-lecture', '5eme', 'francais', 'Le compte rendu de lecture', 9, 'fr-5e-ecriture-poeme'),
('fr-5e-groupe-nominal', '5eme', 'francais', 'Le groupe nominal', 10, 'fr-5e-compte-rendu-lecture'),
('fr-5e-groupe-adjectif', '5eme', 'francais', $$Le groupe adjectif$$, 11, 'fr-5e-groupe-nominal'),
('fr-5e-pronominalisation', '5eme', 'francais', 'La pronominalisation', 12, 'fr-5e-groupe-adjectif'),
('fr-5e-verbe-formes-emplois', '5eme', 'francais', $$Le verbe : formes et emplois$$, 13, 'fr-5e-pronominalisation'),
('fr-5e-phrase-simple-complexe', '5eme', 'francais', 'De la phrase simple à la phrase complexe', 14, 'fr-5e-verbe-formes-emplois'),
('fr-5e-orthographe-lexicale', '5eme', 'francais', 'Orthographe lexicale', 15, 'fr-5e-phrase-simple-complexe'),
('fr-5e-orthographe-grammaticale', '5eme', 'francais', 'Orthographe grammaticale', 16, 'fr-5e-orthographe-lexicale');
