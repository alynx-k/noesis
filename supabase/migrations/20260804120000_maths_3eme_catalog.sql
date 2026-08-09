-- Mathématiques 3ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: calculs algébriques et fonctions, Compétence
-- 2: organisation et traitement de données, Compétence 3: géométrie du
-- plan/espace) — titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('maths-calcul-litteral', '3eme', 'mathematiques', 'Calcul littéral', 1, null),
('maths-racines-carrees', '3eme', 'mathematiques', 'Racines carrées', 2, 'maths-calcul-litteral'),
('maths-calcul-numerique', '3eme', 'mathematiques', 'Calcul numérique', 3, 'maths-racines-carrees'),
('maths-equations-r', '3eme', 'mathematiques', $$Équations et inéquations du premier degré dans ℝ$$, 4, 'maths-calcul-numerique'),
('maths-equations-rxr', '3eme', 'mathematiques', $$Équations et inéquations du premier degré dans ℝ×ℝ$$, 5, 'maths-equations-r'),
('maths-applications-affines', '3eme', 'mathematiques', 'Applications affines', 6, 'maths-equations-rxr'),
('maths-statistique', '3eme', 'mathematiques', 'Statistique', 7, 'maths-applications-affines'),
('maths-triangle-rectangle', '3eme', 'mathematiques', 'Triangle rectangle', 8, 'maths-statistique'),
('maths-thales', '3eme', 'mathematiques', $$Propriétés de Thalès dans un triangle$$, 9, 'maths-triangle-rectangle'),
('maths-angles-inscrits', '3eme', 'mathematiques', 'Angles inscrits', 10, 'maths-thales'),
('maths-vecteurs', '3eme', 'mathematiques', 'Vecteurs', 11, 'maths-angles-inscrits'),
('maths-coordonnees-vecteur', '3eme', 'mathematiques', $$Coordonnées d'un vecteur$$, 12, 'maths-vecteurs'),
('maths-equations-droites', '3eme', 'mathematiques', $$Équations de droites$$, 13, 'maths-coordonnees-vecteur'),
('maths-pyramides-cones', '3eme', 'mathematiques', $$Pyramides et cônes$$, 14, 'maths-equations-droites');
