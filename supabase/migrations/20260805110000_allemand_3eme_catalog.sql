-- Allemand 3ème catalog, sourced from the official DPFC programme éducatif
-- PDF. The "corps du programme" section only formally details 2 leçons
-- (voyage, famille); the guide d'exécution's annual progression reveals the
-- full 7-unit structure actually taught over the year, matching the
-- "Ihr und Wir Plus 2" textbook chapters — used here as the catalog,
-- titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('allemand-preparatifs-voyage', '3eme', 'allemand', $$Les préparatifs d'un voyage en Allemagne$$, 1, null),
('allemand-arrivee-installation', '3eme', 'allemand', $$L'arrivée et l'installation en Allemagne$$, 2, 'allemand-preparatifs-voyage'),
('allemand-sejour-famille-allemande', '3eme', 'allemand', 'Un séjour dans une famille allemande', 3, 'allemand-arrivee-installation'),
('allemand-jeunes-allemagne', '3eme', 'allemand', 'Les jeunes en Allemagne', 4, 'allemand-sejour-famille-allemande'),
('allemand-decouverte-cologne', '3eme', 'allemand', 'Découverte de Cologne', 5, 'allemand-jeunes-allemagne'),
('allemand-afrique-allemagne', '3eme', 'allemand', $$L'Afrique en Allemagne$$, 6, 'allemand-decouverte-cologne'),
('allemand-visite-berlin', '3eme', 'allemand', 'Visite à Berlin', 7, 'allemand-afrique-allemagne');
