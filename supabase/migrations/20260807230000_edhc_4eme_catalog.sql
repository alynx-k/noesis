-- EDHC 4ème catalog, sourced from the official DPFC (Direction de la
-- Pédagogie et de la Formation Continue, Ministère de l'Éducation
-- Nationale de Côte d'Ivoire) programme éducatif PDF — titles and order
-- only, matching the 13 leçons across the 5 compétences of the official
-- program. Content stays null: generated on demand (see generate-course)
-- the first time a student opens each lesson.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('edhc-4e-droits-enfant', '4eme', 'edhc', $$La promotion des droits de l'enfant et son épanouissement$$, 1, null),
('edhc-4e-reinsertion-enfants-soldats', '4eme', 'edhc', 'La réinsertion des enfants-soldats et la préservation de la paix sociale', 2, 'edhc-4e-droits-enfant'),
('edhc-4e-instruments-protection-discriminations', '4eme', 'edhc', 'Les instruments et les mécanismes juridiques de protection contre les discriminations', 3, 'edhc-4e-reinsertion-enfants-soldats'),
('edhc-4e-institutions-republique', '4eme', 'edhc', $$Les comportements responsables face aux symboles et aux institutions de la République et la consolidation de l'autorité de l'État$$, 4, 'edhc-4e-instruments-protection-discriminations'),
('edhc-4e-impot-responsabilites-fiscales', '4eme', 'edhc', $$L'impôt et les responsabilités fiscales du citoyen$$, 5, 'edhc-4e-institutions-republique'),
('edhc-4e-societe-civile', '4eme', 'edhc', $$La promotion d'une société civile forte et le bien-être des populations$$, 6, 'edhc-4e-impot-responsabilites-fiscales'),
('edhc-4e-ressources-famille', '4eme', 'edhc', $$L'utilisation rationnelle des ressources de la famille et le bien-être de ses membres$$, 7, 'edhc-4e-societe-civile'),
('edhc-4e-entreprise-insertion', '4eme', 'edhc', $$L'entreprise et l'insertion dans la vie active$$, 8, 'edhc-4e-ressources-famille'),
('edhc-4e-alliances-kwa-krou', '4eme', 'edhc', 'Les alliances entre les peuples KWA et les peuples KROU et la cohésion sociale', 9, 'edhc-4e-entreprise-insertion'),
('edhc-4e-grossesses-risques-ist-vih', '4eme', 'edhc', 'Les comportements responsables et la lutte contre les grossesses à risques, les IST et le VIH-SIDA', 10, 'edhc-4e-alliances-kwa-krou'),
('edhc-4e-adolescent-integration-sociale', '4eme', 'edhc', $$Les comportements responsables de l'adolescent(e) et l'intégration sociale harmonieuse$$, 11, 'edhc-4e-grossesses-risques-ist-vih'),
('edhc-4e-preservation-environnement', '4eme', 'edhc', $$La préservation de l'environnement et le bien-être de la population$$, 12, 'edhc-4e-adolescent-integration-sociale'),
('edhc-4e-entretien-points-eau', '4eme', 'edhc', $$L'entretien des points d'eau et la préservation de la santé des populations$$, 13, 'edhc-4e-preservation-environnement');
