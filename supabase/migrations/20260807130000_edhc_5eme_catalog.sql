-- EDHC 5ème catalog, sourced from the official DPFC programme éducatif PDF
-- (Compétence 1: droits de l'enfant, droits de l'homme et Droit international
-- humanitaire; Compétence 2: règles de vie communautaire et principes
-- démocratiques; Compétence 3: éducation routière et entrepreneuriat;
-- Compétence 4: manifestations de la puberté; Compétence 5: assainissement
-- du cadre de vie) — titles and order only, matching the 14 leçons of the
-- official program. Content stays null: generated on demand (see
-- generate-course) the first time a student opens each lesson.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('edhc-5e-droits-developpement-participation-enfant', '5eme', 'edhc', $$Les droits au développement et à la participation de l'enfant et son épanouissement$$, 1, null),
('edhc-5e-principes-droits-homme', '5eme', 'edhc', $$Les principes des Droits de l'Homme et la consolidation de l'équilibre social$$, 2, 'edhc-5e-droits-developpement-participation-enfant'),
('edhc-5e-protection-victimes-conflits-armes', '5eme', 'edhc', $$Les règles de protection des victimes de conflits armés et l'assistance aux populations en détresse$$, 3, 'edhc-5e-principes-droits-homme'),
('edhc-5e-droits-devoirs-citoyen', '5eme', 'edhc', 'Les droits et devoirs du citoyen et la cohésion sociale', 4, 'edhc-5e-protection-victimes-conflits-armes'),
('edhc-5e-pouvoirs-politiques-cote-ivoire', '5eme', 'edhc', $$Les différents pouvoirs politiques de la Côte d'Ivoire$$, 5, 'edhc-5e-droits-devoirs-citoyen'),
('edhc-5e-principes-democratiques-associations-clubs', '5eme', 'edhc', 'Les principes démocratiques de base et la gestion des associations et des clubs', 6, 'edhc-5e-pouvoirs-politiques-cote-ivoire'),
('edhc-5e-entente-peuples-paix-sociale', '5eme', 'edhc', $$L'entente entre les peuples et la consolidation de la paix sociale$$, 7, 'edhc-5e-principes-democratiques-associations-clubs'),
('edhc-5e-comportements-engins-deux-roues-automobiles', '5eme', 'edhc', 'Les comportements responsables sur les engins à deux roues et à bord des automobiles et la sécurité des individus', 8, 'edhc-5e-entente-peuples-paix-sociale'),
('edhc-5e-activites-generatrices-revenus', '5eme', 'edhc', $$Les activités génératrices de revenus et l'insertion sociale$$, 9, 'edhc-5e-comportements-engins-deux-roues-automobiles'),
('edhc-5e-comportements-sexuels-risques-ist-vih', '5eme', 'edhc', 'Les comportements sexuels à risques et la propagation des IST et du VIH/SIDA', 10, 'edhc-5e-activites-generatrices-revenus'),
('edhc-5e-grossesses-precoces', '5eme', 'edhc', $$Les grossesses précoces et les obstacles à l'épanouissement moral, physique et social de la mère$$, 11, 'edhc-5e-comportements-sexuels-risques-ist-vih'),
('edhc-5e-consommation-alcool-drogue', '5eme', 'edhc', $$La consommation de l'alcool et de la drogue et l'insécurité sociale$$, 12, 'edhc-5e-grossesses-precoces'),
('edhc-5e-hygiene-publique-assainissement', '5eme', 'edhc', $$Les règles d'hygiène publique et d'assainissement et la préservation du cadre de vie$$, 13, 'edhc-5e-consommation-alcool-drogue'),
('edhc-5e-gestion-ordures-menageres', '5eme', 'edhc', 'La gestion des ordures ménagères et la préservation du cadre de vie', 14, 'edhc-5e-hygiene-publique-assainissement');
