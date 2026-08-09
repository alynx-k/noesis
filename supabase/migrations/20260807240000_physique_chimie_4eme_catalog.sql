-- Physique-Chimie 4ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: optique, Compétence 2: courants et tensions
-- alternatifs, Compétence 3: les ions, Compétence 4: qualité de l'eau) —
-- titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('pc-4e-sources-recepteurs-lumiere', '4eme', 'physique-chimie', 'Sources et récepteurs de lumière', 1, null),
('pc-4e-propagation-lumiere', '4eme', 'physique-chimie', 'Propagation de la lumière', 2, 'pc-4e-sources-recepteurs-lumiere'),
('pc-4e-phases-lune-eclipses', '4eme', 'physique-chimie', 'Les phases de la Lune et les éclipses', 3, 'pc-4e-propagation-lumiere'),
('pc-4e-analyse-synthese-lumiere-blanche', '4eme', 'physique-chimie', 'Analyse et synthèse de la lumière blanche', 4, 'pc-4e-phases-lune-eclipses'),
('pc-4e-aimant-bobine', '4eme', 'physique-chimie', 'Aimant et bobine', 5, 'pc-4e-analyse-synthese-lumiere-blanche'),
('pc-4e-production-tension-alternative', '4eme', 'physique-chimie', $$Production d'une tension alternative$$, 6, 'pc-4e-aimant-bobine'),
('pc-4e-tension-alternative-sinusoidale', '4eme', 'physique-chimie', 'Tension alternative sinusoïdale', 7, 'pc-4e-production-tension-alternative'),
('pc-4e-dangers-courant-secteur', '4eme', 'physique-chimie', 'Les dangers du courant du secteur', 8, 'pc-4e-tension-alternative-sinusoidale'),
('pc-4e-transformation-redressement-lissage', '4eme', 'physique-chimie', $$Transformation, redressement et lissage d'une tension alternative sinusoïdale$$, 9, 'pc-4e-dangers-courant-secteur'),
('pc-4e-atomes-ions', '4eme', 'physique-chimie', 'Atomes et ions', 10, 'pc-4e-transformation-redressement-lissage'),
('pc-4e-transformation-metal-ion', '4eme', 'physique-chimie', $$Transformation d'un métal en ion et inversement$$, 11, 'pc-4e-atomes-ions'),
('pc-4e-traitement-eau', '4eme', 'physique-chimie', $$Traitement de l'eau$$, 12, 'pc-4e-transformation-metal-ion'),
('pc-4e-qualite-eau', '4eme', 'physique-chimie', $$Qualité de l'eau$$, 13, 'pc-4e-traitement-eau');
