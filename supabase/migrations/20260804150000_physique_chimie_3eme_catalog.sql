-- Physique-Chimie 3ème catalog, sourced from the official DPFC programme
-- éducatif PDF (Compétence 1: optique, Compétence 2: mécanique,
-- Compétence 3: électricité, Compétence 4: réactions chimiques) — titles
-- and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('pc-lentilles', '3eme', 'physique-chimie', 'Les lentilles', 1, null),
('pc-defauts-oeil', '3eme', 'physique-chimie', $$Les défauts de l'œil et leurs corrections$$, 2, 'pc-lentilles'),
('pc-masse-poids', '3eme', 'physique-chimie', $$Masse et poids d'un corps$$, 3, 'pc-defauts-oeil'),
('pc-forces', '3eme', 'physique-chimie', 'Les forces', 4, 'pc-masse-poids'),
('pc-equilibre-solide', '3eme', 'physique-chimie', $$Équilibre d'un solide soumis à deux forces$$, 5, 'pc-forces'),
('pc-travail-puissance', '3eme', 'physique-chimie', 'Travail et puissance mécaniques', 6, 'pc-equilibre-solide'),
('pc-energie-mecanique', '3eme', 'physique-chimie', $$Énergie mécanique$$, 7, 'pc-travail-puissance'),
('pc-puissance-energie-electriques', '3eme', 'physique-chimie', $$Puissance et énergie électriques$$, 8, 'pc-energie-mecanique'),
('pc-conducteur-ohmique', '3eme', 'physique-chimie', 'Le conducteur ohmique', 9, 'pc-puissance-energie-electriques'),
('pc-electrolyse-eau', '3eme', 'physique-chimie', $$Électrolyse et synthèse de l'eau$$, 10, 'pc-conducteur-ohmique'),
('pc-alcanes', '3eme', 'physique-chimie', 'Les alcanes', 11, 'pc-electrolyse-eau'),
('pc-oxydation', '3eme', 'physique-chimie', 'Oxydation des corps purs simples', 12, 'pc-alcanes'),
('pc-reduction-oxydes', '3eme', 'physique-chimie', 'Réduction des oxydes', 13, 'pc-oxydation'),
('pc-solutions-acides-basiques', '3eme', 'physique-chimie', 'Solutions acides, basiques et neutres', 14, 'pc-reduction-oxydes');
