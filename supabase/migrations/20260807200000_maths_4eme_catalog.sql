-- Mathématiques 4ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: calculs algébriques, Compétence 2:
-- organisation et traitement de données, Compétence 3: géométrie du
-- plan/espace) — titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('maths-4e-nombres-decimaux-relatifs', '4eme', 'mathematiques', 'Nombres décimaux relatifs', 1, null),
('maths-4e-nombres-rationnels', '4eme', 'mathematiques', 'Nombres rationnels', 2, 'maths-4e-nombres-decimaux-relatifs'),
('maths-4e-calcul-litteral', '4eme', 'mathematiques', 'Calcul littéral', 3, 'maths-4e-nombres-rationnels'),
('maths-4e-equations-inequations-q', '4eme', 'mathematiques', $$Équations et inéquations du premier degré dans ℚ$$, 4, 'maths-4e-calcul-litteral'),
('maths-4e-statistique', '4eme', 'mathematiques', 'Statistique', 5, 'maths-4e-equations-inequations-q'),
('maths-4e-angles', '4eme', 'mathematiques', 'Angles', 6, 'maths-4e-statistique'),
('maths-4e-distances', '4eme', 'mathematiques', 'Distances', 7, 'maths-4e-angles'),
('maths-4e-cercles-triangles', '4eme', 'mathematiques', 'Cercles et triangles', 8, 'maths-4e-distances'),
('maths-4e-vecteurs', '4eme', 'mathematiques', 'Vecteurs', 9, 'maths-4e-cercles-triangles'),
('maths-4e-perspective-cavaliere', '4eme', 'mathematiques', 'Perspective cavalière', 10, 'maths-4e-vecteurs'),
('maths-4e-symetries-translations', '4eme', 'mathematiques', 'Symétries et translations', 11, 'maths-4e-perspective-cavaliere');
