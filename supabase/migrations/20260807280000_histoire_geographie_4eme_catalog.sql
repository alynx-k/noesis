-- Histoire et Géographie 4ème catalog, sourced from the official DPFC
-- programme éducatif PDF (single PDF covering both subjects, each with
-- its own compétences/thèmes/leçons). Two independent subjects/chains:
-- histoire (7 leçons across 2 compétences) and géographie (5 leçons
-- across 2 compétences) — titles and order only, content generated on
-- demand.

-- HISTOIRE
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('hist-4e-mise-en-place-peuples', '4eme', 'histoire', $$La mise en place des peuples de Côte d'Ivoire du XVIème au XVIIIème siècle$$, 1, null),
('hist-4e-organisation-sociopolitique', '4eme', 'histoire', $$L'organisation socio-politique des peuples de Côte d'Ivoire$$, 2, 'hist-4e-mise-en-place-peuples'),
('hist-4e-mecanismes-prevention-conflits', '4eme', 'histoire', $$Les mécanismes de prévention et de résolution des conflits chez les peuples de Côte d'Ivoire$$, 3, 'hist-4e-organisation-sociopolitique'),
('hist-4e-evolution-contacts-europe', '4eme', 'histoire', $$L'évolution des contacts entre la Côte d'Ivoire et l'Europe du XVIème au XVIIIème siècle$$, 4, 'hist-4e-mecanismes-prevention-conflits'),
('hist-4e-traite-negriere', '4eme', 'histoire', $$La traite négrière dans l'histoire de l'humanité$$, 5, 'hist-4e-evolution-contacts-europe'),
('hist-4e-revolution-francaise', '4eme', 'histoire', 'La Révolution française de 1789', 6, 'hist-4e-traite-negriere'),
('hist-4e-revolution-industrielle', '4eme', 'histoire', $$La Révolution industrielle aux XVIIIème et XIXème siècles en Europe$$, 7, 'hist-4e-revolution-francaise');

-- GEOGRAPHIE
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('geo-4e-deconcentration-administrative', '4eme', 'geographie', $$La déconcentration administrative en Côte d'Ivoire$$, 1, null),
('geo-4e-decentralisation-administrative', '4eme', 'geographie', $$La décentralisation administrative en Côte d'Ivoire$$, 2, 'geo-4e-deconcentration-administrative'),
('geo-4e-insuffisances-organisation-administrative', '4eme', 'geographie', $$Les insuffisances de l'organisation administrative dans le développement de la Côte d'Ivoire$$, 3, 'geo-4e-decentralisation-administrative'),
('geo-4e-cedeao', '4eme', 'geographie', $$La Communauté économique des États de l'Afrique de l'Ouest (CEDEAO)$$, 4, 'geo-4e-insuffisances-organisation-administrative'),
('geo-4e-union-europeenne', '4eme', 'geographie', $$L'Union européenne (UE) : un exemple d'intégration régionale$$, 5, 'geo-4e-cedeao');
