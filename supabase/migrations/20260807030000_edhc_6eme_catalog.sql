-- EDHC 6ème catalog, sourced from the official DPFC (Direction de la
-- Pédagogie et de la Formation Continue, Ministère de l'Éducation
-- Nationale de Côte d'Ivoire) programme éducatif PDF — titles and order
-- only, matching the 12 leçons across the 5 compétences of the official
-- program. Content stays null: generated on demand (see generate-course)
-- the first time a student opens each lesson.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('edhc-6e-droits-survie-protection-enfant', '6eme', 'edhc', $$Les droits à la survie et à la protection de l'enfant et son épanouissement$$, 1, null),
('edhc-6e-droits-homme', '6eme', 'edhc', $$Les droits de l'homme et l'épanouissement individuel et collectif$$, 2, 'edhc-6e-droits-survie-protection-enfant'),
('edhc-6e-dih', '6eme', 'edhc', $$Le Droit International Humanitaire (DIH) et la préservation de la dignité humaine$$, 3, 'edhc-6e-droits-homme'),
('edhc-6e-principes-vie-famille-communaute', '6eme', 'edhc', 'Les principes et règles de vie en famille et en communauté', 4, 'edhc-6e-dih'),
('edhc-6e-constitution-cote-ivoire', '6eme', 'edhc', $$La constitution de la Côte-d'Ivoire et la préservation de la paix$$, 5, 'edhc-6e-principes-vie-famille-communaute'),
('edhc-6e-principes-democratiques', '6eme', 'edhc', 'Les principes démocratiques et la justice sociale', 6, 'edhc-6e-constitution-cote-ivoire'),
('edhc-6e-circulation-routiere', '6eme', 'edhc', 'Les règles de la circulation routière et la sécurité des usagers', 7, 'edhc-6e-principes-democratiques'),
('edhc-6e-activites-agro-pastorales', '6eme', 'edhc', 'Les activités agro-pastorales et la lutte contre le chômage', 8, 'edhc-6e-circulation-routiere'),
('edhc-6e-puberte', '6eme', 'edhc', $$La puberté et l'épanouissement physique, moral et social de l'adolescent$$, 9, 'edhc-6e-activites-agro-pastorales'),
('edhc-6e-abstinence-sexuelle', '6eme', 'edhc', $$L'abstinence sexuelle et la préservation de la santé$$, 10, 'edhc-6e-puberte'),
('edhc-6e-entretien-cadre-vie', '6eme', 'edhc', $$L'entretien du cadre de vie et la santé des populations$$, 11, 'edhc-6e-abstinence-sexuelle'),
('edhc-6e-entretien-latrines-toilettes', '6eme', 'edhc', $$L'entretien des latrines et des toilettes et la préservation du cadre de vie$$, 12, 'edhc-6e-entretien-cadre-vie');
