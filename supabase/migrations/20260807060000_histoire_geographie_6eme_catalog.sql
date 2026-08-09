-- Histoire-Géographie 6ème catalog, sourced from the official DPFC
-- programme éducatif PDF (combined Histoire/Géographie booklet). Histoire
-- (Compétence 1: méthodologie de la science historique, Compétence 2: la
-- préhistoire de la Côte d'Ivoire) and Géographie (Compétence 1: la
-- science géographique et ses éléments, Compétence 2: l'interdépendance
-- entre l'homme et le milieu local en Côte d'Ivoire) are two independent
-- subjects with their own order_index/requires_course_id chains —
-- titles and order only, content generated on demand.

-- Histoire
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('hist-6e-histoire-objet', '6eme', 'histoire', $$L'histoire et son objet$$, 1, null),
('hist-6e-sources-histoire', '6eme', 'histoire', $$Les sources de l'histoire$$, 2, 'hist-6e-histoire-objet'),
('hist-6e-sources-info-dignite-humaine', '6eme', 'histoire', $$Les sources d'information et la dignité humaine en temps de guerre ou de violence$$, 3, 'hist-6e-sources-histoire'),
('hist-6e-notion-chronologie', '6eme', 'histoire', 'La notion de chronologie', 4, 'hist-6e-sources-info-dignite-humaine'),
('hist-6e-grandes-periodes-histoire', '6eme', 'histoire', $$Les grandes périodes de l'histoire$$, 5, 'hist-6e-notion-chronologie'),
('hist-6e-paleolithique-ivoirien', '6eme', 'histoire', 'Le paléolithique ivoirien', 6, 'hist-6e-grandes-periodes-histoire'),
('hist-6e-neolithique-cote-ivoire', '6eme', 'histoire', $$La révolution du néolithique en Côte d'Ivoire$$, 7, 'hist-6e-paleolithique-ivoirien'),
('hist-6e-metallurgie-fer-cote-ivoire', '6eme', 'histoire', $$La métallurgie du fer en Côte d'Ivoire$$, 8, 'hist-6e-neolithique-cote-ivoire');

-- Géographie
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('geo-6e-geographie-objet', '6eme', 'geographie', 'La géographie et son objet', 1, null),
('geo-6e-relief', '6eme', 'geographie', 'Le relief', 2, 'geo-6e-geographie-objet'),
('geo-6e-climat', '6eme', 'geographie', 'Le climat', 3, 'geo-6e-relief'),
('geo-6e-interrelation-sols-climat-vegetation', '6eme', 'geographie', $$L'interrelation entre les sols, le climat et la végétation$$, 4, 'geo-6e-climat'),
('geo-6e-representation-terre', '6eme', 'geographie', 'Les moyens de représentation de la terre', 5, 'geo-6e-interrelation-sols-climat-vegetation'),
('geo-6e-mouvements-terre', '6eme', 'geographie', 'Les mouvements de la terre et leurs influences sur la vie quotidienne', 6, 'geo-6e-representation-terre'),
('geo-6e-population-environnement-local', '6eme', 'geographie', 'Population et environnement local', 7, 'geo-6e-mouvements-terre'),
('geo-6e-homme-cycle-eau', '6eme', 'geographie', $$L'homme et le cycle de l'eau$$, 8, 'geo-6e-population-environnement-local'),
('geo-6e-importance-impot', '6eme', 'geographie', $$L'importance de l'impôt dans le développement de ma région$$, 9, 'geo-6e-homme-cycle-eau');
