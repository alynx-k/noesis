-- Français 4ème catalog, sourced from the official DPFC programme éducatif
-- PDF (5 compétences: expression orale, lecture, expression écrite,
-- grammaire, orthographe) — titles and order only, content generated on
-- demand. Under "Lecture" and "Expression écrite" the official programme
-- studies the same two text types (texte explicatif, dialogue
-- argumentatif) first as reading then as writing tasks, hence the
-- "Lire et comprendre..." / "Rédiger..." pairs below.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('fr-4e-debat', '4eme', 'francais', 'Le débat', 1, null),
('fr-4e-oeuvre-integrale', '4eme', 'francais', $$Étudier une œuvre intégrale$$, 2, 'fr-4e-debat'),
('fr-4e-lecture-texte-explicatif', '4eme', 'francais', 'Lire et comprendre un texte explicatif', 3, 'fr-4e-oeuvre-integrale'),
('fr-4e-lecture-dialogue-argumentatif', '4eme', 'francais', 'Lire et comprendre un dialogue argumentatif', 4, 'fr-4e-lecture-texte-explicatif'),
('fr-4e-redaction-texte-explicatif', '4eme', 'francais', 'Rédiger un texte explicatif', 5, 'fr-4e-lecture-dialogue-argumentatif'),
('fr-4e-redaction-dialogue-argumentatif', '4eme', 'francais', 'Rédiger un dialogue argumentatif', 6, 'fr-4e-redaction-texte-explicatif'),
('fr-4e-resume-texte-informatif', '4eme', 'francais', 'Le résumé du texte informatif', 7, 'fr-4e-redaction-dialogue-argumentatif'),
('fr-4e-compte-rendu-reunion', '4eme', 'francais', 'Le compte rendu de réunion', 8, 'fr-4e-resume-texte-informatif'),
('fr-4e-lettre-officielle', '4eme', 'francais', 'La lettre officielle', 9, 'fr-4e-compte-rendu-reunion'),
('fr-4e-groupe-nominal', '4eme', 'francais', 'Le groupe nominal', 10, 'fr-4e-lettre-officielle'),
('fr-4e-pronominalisation', '4eme', 'francais', 'La pronominalisation', 11, 'fr-4e-groupe-nominal'),
('fr-4e-verbe-formes-emplois', '4eme', 'francais', 'Le verbe : formes et emplois', 12, 'fr-4e-pronominalisation'),
('fr-4e-propositions-subordonnees', '4eme', 'francais', $$L'étude de quelques propositions subordonnées$$, 13, 'fr-4e-verbe-formes-emplois'),
('fr-4e-orthographe-lexicale', '4eme', 'francais', 'Orthographe lexicale', 14, 'fr-4e-propositions-subordonnees'),
('fr-4e-orthographe-grammaticale', '4eme', 'francais', 'Orthographe grammaticale', 15, 'fr-4e-orthographe-lexicale');
