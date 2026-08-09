-- Allemand 4ème catalog, sourced from the official DPFC programme éducatif
-- PDF. The "corps du programme" section only formally details 2 leçons
-- (premiers contacts, l'emploi du temps et les activités de classes); the
-- guide d'exécution's annual progression reveals the full 8-unit structure
-- actually taught over the year, matching the "Ihr und Wir Plus 1"
-- textbook chapters (Willkommen in Afrika, In der Schule, Herzlichen
-- Glückwunsch, Probier mal, Gute Besserung, Besuch im Dorf, Unser
-- Deutschclub, Schönes Wochenende) — used here as the catalog, titles and
-- order only, content generated on demand. FALLBACK: titles below are
-- French descriptions of each chapter's theme (inferred from the
-- progression annuelle table), not verbatim official leçon titles, since
-- the source PDF does not name a leçon for each of the 8 units.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('allemand-4e-bienvenue-afrique', '4eme', 'allemand', 'Bienvenue en Afrique', 1, null),
('allemand-4e-vie-ecole', '4eme', 'allemand', $$La vie à l'école$$, 2, 'allemand-4e-bienvenue-afrique'),
('allemand-4e-joyeux-anniversaire', '4eme', 'allemand', 'Joyeux anniversaire', 3, 'allemand-4e-vie-ecole'),
('allemand-4e-goute-donc', '4eme', 'allemand', $$Goûte donc !$$, 4, 'allemand-4e-joyeux-anniversaire'),
('allemand-4e-bon-retablissement', '4eme', 'allemand', 'Bon rétablissement', 5, 'allemand-4e-goute-donc'),
('allemand-4e-visite-village', '4eme', 'allemand', 'Visite au village', 6, 'allemand-4e-bon-retablissement'),
('allemand-4e-club-allemand', '4eme', 'allemand', $$Notre club d'allemand$$, 7, 'allemand-4e-visite-village'),
('allemand-4e-bon-weekend', '4eme', 'allemand', 'Bon week-end', 8, 'allemand-4e-club-allemand');
