-- Histoire-Géographie 5ème catalog, sourced from the official DPFC
-- programme éducatif PDF (combined Histoire/Géographie booklet). Histoire
-- (Compétence 1: évolution et traits de civilisation des peuples des
-- régions de Côte d'Ivoire; Compétence 2: le peuplement de la Côte d'Ivoire
-- des origines à l'éclatement de l'empire du Mali) and Géographie
-- (Compétence 1: l'interdépendance entre l'homme et son milieu local en
-- Côte d'Ivoire; Compétence 2: les incidences des activités économiques sur
-- l'environnement) are two independent subjects with their own
-- order_index/requires_course_id chains — titles and order only, content
-- generated on demand.

-- Histoire
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('hist-5e-origine-installation-peuples-region', '5eme', 'histoire', $$L'origine et l'installation des peuples des régions de Côte d'Ivoire$$, 1, null),
('hist-5e-traits-civilisation-peuples-regions', '5eme', 'histoire', $$Les traits de civilisation des peuples des différentes régions de Côte d'Ivoire$$, 2, 'hist-5e-origine-installation-peuples-region'),
('hist-5e-codes-reglementation-conflits-dih', '5eme', 'histoire', $$Les codes de réglementation des conflits dans les régions de Côte d'Ivoire et le droit international humanitaire$$, 3, 'hist-5e-traits-civilisation-peuples-regions'),
('hist-5e-premiers-habitants-cote-ivoire', '5eme', 'histoire', $$Les premiers habitants de la Côte d'Ivoire$$, 4, 'hist-5e-codes-reglementation-conflits-dih'),
('hist-5e-premiers-mouvements-migratoires', '5eme', 'histoire', $$Les premiers mouvements migratoires en Côte d'Ivoire$$, 5, 'hist-5e-premiers-habitants-cote-ivoire'),
('hist-5e-grands-empires-afrique-ouest-mali', '5eme', 'histoire', $$Les grands empires de l'Afrique de l'Ouest : exemple du Mali$$, 6, 'hist-5e-premiers-mouvements-migratoires');

-- Géographie
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('geo-5e-milieu-physique-installation-populations', '5eme', 'geographie', $$Le milieu physique en Côte d'Ivoire et l'installation des populations$$, 1, null),
('geo-5e-croissance-demographique', '5eme', 'geographie', $$La croissance démographique en Côte d'Ivoire$$, 2, 'geo-5e-milieu-physique-installation-populations'),
('geo-5e-eau-developpement-cote-ivoire', '5eme', 'geographie', $$L'eau dans le développement de la Côte d'Ivoire$$, 3, 'geo-5e-croissance-demographique'),
('geo-5e-consequences-methodes-techniques-agricoles', '5eme', 'geographie', $$Les conséquences des méthodes et techniques agricoles sur l'environnement$$, 4, 'geo-5e-eau-developpement-cote-ivoire'),
('geo-5e-pollution-industrielle-commerciale', '5eme', 'geographie', $$Les effets de la pollution industrielle et commerciale sur l'environnement$$, 5, 'geo-5e-consequences-methodes-techniques-agricoles'),
('geo-5e-impot-amenagement-territoire', '5eme', 'geographie', $$L'impôt et l'aménagement du territoire ivoirien$$, 6, 'geo-5e-pollution-industrielle-commerciale');
