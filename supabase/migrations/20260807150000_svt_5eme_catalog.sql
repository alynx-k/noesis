-- SVT 5ème catalog, sourced from the official DPFC programme éducatif PDF
-- (Compétence 1: reproduction chez les plantes sans fleurs et croissance
-- chez les invertébrés; Compétence 2: nutrition chez les plantes sans
-- chlorophylle et chez les invertébrés; Compétence 3: actions néfastes de
-- certains invertébrés sur l'Homme, sur l'environnement et la lutte contre
-- ces invertébrés) — titles and order only, matching the 8 leçons of the
-- official program. Content stays null: generated on demand (see
-- generate-course) the first time a student opens each lesson.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('svt-5e-reproduction-champignons-chapeau', '5eme', 'svt', 'La reproduction chez les champignons à chapeau', 1, null),
('svt-5e-croissance-insectes', '5eme', 'svt', 'La croissance chez les insectes', 2, 'svt-5e-reproduction-champignons-chapeau'),
('svt-5e-croissance-mollusques', '5eme', 'svt', 'La croissance chez les mollusques', 3, 'svt-5e-croissance-insectes'),
('svt-5e-nutrition-plantes-sans-chlorophylle', '5eme', 'svt', 'La nutrition des plantes sans chlorophylle', 4, 'svt-5e-croissance-mollusques'),
('svt-5e-nutrition-invertebres', '5eme', 'svt', 'La nutrition des invertébrés', 5, 'svt-5e-nutrition-plantes-sans-chlorophylle'),
('svt-5e-consequences-proliferation-criquet', '5eme', 'svt', 'Les conséquences de la prolifération du criquet', 6, 'svt-5e-nutrition-invertebres'),
('svt-5e-consequences-proliferation-moustique', '5eme', 'svt', 'Les conséquences de la prolifération du moustique', 7, 'svt-5e-consequences-proliferation-criquet'),
('svt-5e-lutte-criquet-moustique', '5eme', 'svt', 'La lutte contre le criquet et le moustique', 8, 'svt-5e-consequences-proliferation-moustique');
