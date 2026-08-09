-- Mathématiques 6ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: calculs algébriques, Compétence 2:
-- organisation et traitement de données, Compétence 3: géométrie du plan,
-- géométrie de l'espace et transformations du plan) — titles and order
-- only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('maths-6e-nombres-entiers-naturels', '6eme', 'mathematiques', 'Nombres entiers naturels', 1, null),
('maths-6e-nombres-decimaux-relatifs', '6eme', 'mathematiques', 'Nombres décimaux relatifs', 2, 'maths-6e-nombres-entiers-naturels'),
('maths-6e-fractions', '6eme', 'mathematiques', 'Fractions', 3, 'maths-6e-nombres-decimaux-relatifs'),
('maths-6e-proportionnalite', '6eme', 'mathematiques', $$Proportionnalité$$, 4, 'maths-6e-fractions'),
('maths-6e-statistique', '6eme', 'mathematiques', 'Statistique', 5, 'maths-6e-proportionnalite'),
('maths-6e-droites-points', '6eme', 'mathematiques', 'Droites et points', 6, 'maths-6e-statistique'),
('maths-6e-segments', '6eme', 'mathematiques', 'Segments', 7, 'maths-6e-droites-points'),
('maths-6e-cercles-disques', '6eme', 'mathematiques', 'Cercles et disques', 8, 'maths-6e-segments'),
('maths-6e-angles', '6eme', 'mathematiques', 'Angles', 9, 'maths-6e-cercles-disques'),
('maths-6e-triangles', '6eme', 'mathematiques', 'Triangles', 10, 'maths-6e-angles'),
('maths-6e-parallelogramme', '6eme', 'mathematiques', 'Parallélogramme', 11, 'maths-6e-triangles'),
('maths-6e-paves-cylindres', '6eme', 'mathematiques', 'Pavés droits et cylindres droits', 12, 'maths-6e-parallelogramme'),
('maths-6e-symetrie-centrale', '6eme', 'mathematiques', $$Figures symétriques par rapport à un point$$, 13, 'maths-6e-paves-cylindres');
