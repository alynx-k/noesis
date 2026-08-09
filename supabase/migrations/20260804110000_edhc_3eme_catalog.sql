-- EDHC 3ème catalog, sourced from the official DPFC (Direction de la
-- Pédagogie et de la Formation Continue, Ministère de l'Éducation
-- Nationale de Côte d'Ivoire) programme éducatif PDF — titles and order
-- only, matching the 13 leçons across the 5 compétences of the official
-- program. Content stays null: generated on demand (see generate-course)
-- the first time a student opens each lesson.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('edhc-devoirs-parents', '3eme', 'edhc', $$Les devoirs de parents et l'épanouissement de l'enfant$$, 1, null),
('edhc-protection-vulnerables', '3eme', 'edhc', $$Les instruments et les mécanismes juridiques de protection contre les violences faites aux personnes vulnérables$$, 2, 'edhc-devoirs-parents'),
('edhc-organisations-humanitaires', '3eme', 'edhc', $$Les organisations humanitaires et la promotion de l'assistance aux populations en détresse$$, 3, 'edhc-protection-vulnerables'),
('edhc-partis-institutions', '3eme', 'edhc', $$Les comportements responsables face aux partis politiques et aux institutions de la République et la préservation de la paix sociale$$, 4, 'edhc-organisations-humanitaires'),
('edhc-vote-citoyen', '3eme', 'edhc', $$Le vote et la participation du citoyen à la vie de la Nation$$, 5, 'edhc-partis-institutions'),
('edhc-impot-nation', '3eme', 'edhc', $$L'impôt et le développement de la nation$$, 6, 'edhc-vote-citoyen'),
('edhc-biens-publics', '3eme', 'edhc', $$L'utilisation rationnelle des biens publics et le bien-être de la communauté$$, 7, 'edhc-impot-nation'),
('edhc-projet-entreprise', '3eme', 'edhc', $$Le projet d'entreprise et l'insertion sociale$$, 8, 'edhc-biens-publics'),
('edhc-alliances-peuples', '3eme', 'edhc', $$Les alliances entre les peuples Mandé et les peuples Gour et la cohésion sociale$$, 9, 'edhc-projet-entreprise'),
('edhc-centres-sante', '3eme', 'edhc', $$La fréquentation des centres de santé et la lutte contre l'automédication, les maladies endémiques et parasitaires$$, 10, 'edhc-alliances-peuples'),
('edhc-depistage-vih', '3eme', 'edhc', $$Les bienfaits du dépistage du VIH et la gestion de la vie$$, 11, 'edhc-centres-sante'),
('edhc-parcs-reserves', '3eme', 'edhc', $$La protection des parcs nationaux et des réserves forestières et la sauvegarde de l'environnement$$, 12, 'edhc-depistage-vih'),
('edhc-gestion-eau', '3eme', 'edhc', $$La gestion rationnelle de l'eau et la sauvegarde de la paix sociale$$, 13, 'edhc-parcs-reserves');
