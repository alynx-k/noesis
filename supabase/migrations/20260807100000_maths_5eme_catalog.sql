-- Mathématiques 5ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: calculs algébriques, Compétence 2:
-- organisation et traitement de données, Compétence 3: géométrie du
-- plan/espace et transformations du plan) — titles and order only,
-- content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('maths-5e-nombres-premiers', '5eme', 'mathematiques', 'Nombres premiers', 1, null),
('maths-5e-nombres-decimaux-relatifs', '5eme', 'mathematiques', 'Nombres décimaux relatifs', 2, 'maths-5e-nombres-premiers'),
('maths-5e-fractions', '5eme', 'mathematiques', 'Fractions', 3, 'maths-5e-nombres-decimaux-relatifs'),
('maths-5e-proportionnalite', '5eme', 'mathematiques', $$Proportionnalité$$, 4, 'maths-5e-fractions'),
('maths-5e-statistique', '5eme', 'mathematiques', 'Statistique', 5, 'maths-5e-proportionnalite'),
('maths-5e-angles', '5eme', 'mathematiques', 'Angles', 6, 'maths-5e-statistique'),
('maths-5e-segments', '5eme', 'mathematiques', 'Segments', 7, 'maths-5e-angles'),
('maths-5e-triangles', '5eme', 'mathematiques', 'Triangles', 8, 'maths-5e-segments'),
('maths-5e-cercles', '5eme', 'mathematiques', 'Cercles', 9, 'maths-5e-triangles'),
('maths-5e-parallelogrammes-particuliers', '5eme', 'mathematiques', $$Parallélogrammes particuliers$$, 10, 'maths-5e-cercles'),
('maths-5e-prisme-droit', '5eme', 'mathematiques', 'Prisme droit', 11, 'maths-5e-parallelogrammes-particuliers'),
('maths-5e-figures-symetriques-droite', '5eme', 'mathematiques', $$Figures symétriques par rapport à une droite$$, 12, 'maths-5e-prisme-droit');
