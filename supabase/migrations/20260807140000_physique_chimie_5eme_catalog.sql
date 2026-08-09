-- Physique-Chimie 5ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: électricité; Compétence 2: propriétés
-- physiques de la matière; Compétence 3: mesure de grandeurs physiques;
-- Compétence 4: mélanges et réactions chimiques) — titles and order only,
-- matching the 13 leçons of the official program. Content stays null:
-- generated on demand (see generate-course) the first time a student opens
-- each lesson.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('pc-5e-adaptation-generateur-recepteur', '5eme', 'physique-chimie', $$Adaptation d'un générateur à un récepteur$$, 1, null),
('pc-5e-association-lampes-electriques', '5eme', 'physique-chimie', 'Association de lampes électriques', 2, 'pc-5e-adaptation-generateur-recepteur'),
('pc-5e-association-piles-serie', '5eme', 'physique-chimie', 'Association de piles en série', 3, 'pc-5e-association-lampes-electriques'),
('pc-5e-dilatation-solides', '5eme', 'physique-chimie', 'Dilatation des solides', 4, 'pc-5e-association-piles-serie'),
('pc-5e-dilatation-liquides', '5eme', 'physique-chimie', 'Dilatation des liquides', 5, 'pc-5e-dilatation-solides'),
('pc-5e-dilatation-gaz', '5eme', 'physique-chimie', 'Dilatation des gaz', 6, 'pc-5e-dilatation-liquides'),
('pc-5e-intensite-courant-electrique', '5eme', 'physique-chimie', 'Intensité du courant électrique', 7, 'pc-5e-dilatation-gaz'),
('pc-5e-tension-electrique', '5eme', 'physique-chimie', 'Tension électrique', 8, 'pc-5e-intensite-courant-electrique'),
('pc-5e-pression-atmospherique', '5eme', 'physique-chimie', 'Pression atmosphérique', 9, 'pc-5e-tension-electrique'),
('pc-5e-melanges', '5eme', 'physique-chimie', 'Les mélanges', 10, 'pc-5e-pression-atmospherique'),
('pc-5e-atomes-molecules', '5eme', 'physique-chimie', 'Atomes et molécules', 11, 'pc-5e-melanges'),
('pc-5e-combustion-carbone', '5eme', 'physique-chimie', 'Combustion du carbone', 12, 'pc-5e-atomes-molecules'),
('pc-5e-combustion-soufre', '5eme', 'physique-chimie', 'Combustion du soufre', 13, 'pc-5e-combustion-carbone');
