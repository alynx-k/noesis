-- Physique-Chimie 6ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: électricité, Compétence 2: propriétés
-- physiques de la matière, Compétence 3: mesure de grandeurs physiques,
-- Compétence 4: l'air et les combustions) — titles and order only,
-- content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('pc-6e-circuit-electrique', '6eme', 'physique-chimie', $$Le circuit électrique$$, 1, null),
('pc-6e-commande-circuit', '6eme', 'physique-chimie', $$Commande d'un circuit électrique$$, 2, 'pc-6e-circuit-electrique'),
('pc-6e-court-circuit-protection', '6eme', 'physique-chimie', $$Court-circuit et protection des installations électriques$$, 3, 'pc-6e-commande-circuit'),
('pc-6e-solides-liquides', '6eme', 'physique-chimie', 'Solides et liquides', 4, 'pc-6e-court-circuit-protection'),
('pc-6e-gaz', '6eme', 'physique-chimie', 'Les gaz', 5, 'pc-6e-solides-liquides'),
('pc-6e-temperature-corps', '6eme', 'physique-chimie', $$Température d'un corps$$, 6, 'pc-6e-gaz'),
('pc-6e-changements-etat-eau', '6eme', 'physique-chimie', $$Les changements d'état de l'eau$$, 7, 'pc-6e-temperature-corps'),
('pc-6e-volume-liquide-solide', '6eme', 'physique-chimie', $$Volume d'un liquide et d'un solide$$, 8, 'pc-6e-changements-etat-eau'),
('pc-6e-masse-solide-liquide', '6eme', 'physique-chimie', $$Masse d'un solide et d'un liquide$$, 9, 'pc-6e-volume-liquide-solide'),
('pc-6e-constituants-air', '6eme', 'physique-chimie', $$Les constituants de l'air$$, 10, 'pc-6e-masse-solide-liquide'),
('pc-6e-combustion-solide-liquide', '6eme', 'physique-chimie', $$Combustion d'un solide et d'un liquide dans l'air$$, 11, 'pc-6e-constituants-air'),
('pc-6e-combustion-gaz', '6eme', 'physique-chimie', $$Combustion d'un gaz dans l'air$$, 12, 'pc-6e-combustion-solide-liquide'),
('pc-6e-dangers-combustions', '6eme', 'physique-chimie', 'Dangers des combustions', 13, 'pc-6e-combustion-gaz');
