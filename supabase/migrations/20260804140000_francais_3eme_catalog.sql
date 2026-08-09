-- Français 3ème catalog, sourced from the official DPFC programme éducatif
-- PDF (5 compétences: expression orale, lecture, expression écrite,
-- grammaire, orthographe) — titles and order only, content generated on
-- demand. "Étudier une œuvre intégrale" is kept as a methodology lesson
-- (how to study any full-length literary work) since the official program
-- leaves the specific work to each teacher's choice rather than naming one.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('fr-dialogue-oral', '3eme', 'francais', 'Le dialogue oral', 1, null),
('fr-expose-oral', '3eme', 'francais', $$L'exposé oral$$, 2, 'fr-dialogue-oral'),
('fr-debat', '3eme', 'francais', 'Le débat', 3, 'fr-expose-oral'),
('fr-oeuvre-integrale', '3eme', 'francais', $$Étudier une œuvre intégrale$$, 4, 'fr-debat'),
('fr-lecture-texte-argumentatif', '3eme', 'francais', 'Lire et comprendre un texte argumentatif', 5, 'fr-oeuvre-integrale'),
('fr-lecture-article-journal', '3eme', 'francais', 'Lire et comprendre un article de journal', 6, 'fr-lecture-texte-argumentatif'),
('fr-ecriture-texte-argumentatif', '3eme', 'francais', $$Rédiger un texte argumentatif : étayer ou réfuter un point de vue$$, 7, 'fr-lecture-article-journal'),
('fr-resume-texte-argumentatif', '3eme', 'francais', 'Le résumé du texte argumentatif', 8, 'fr-ecriture-texte-argumentatif'),
('fr-ecriture-article-journal', '3eme', 'francais', $$Rédiger un article de journal$$, 9, 'fr-resume-texte-argumentatif'),
('fr-communication', '3eme', 'francais', 'La communication', 10, 'fr-ecriture-article-journal'),
('fr-pronominalisation', '3eme', 'francais', 'La pronominalisation', 11, 'fr-communication'),
('fr-adverbe', '3eme', 'francais', $$L'adverbe et le groupe adverbial$$, 12, 'fr-pronominalisation'),
('fr-infinitif-participe', '3eme', 'francais', $$L'infinitif et le participe$$, 13, 'fr-adverbe'),
('fr-coordination', '3eme', 'francais', 'La coordination', 14, 'fr-infinitif-participe'),
('fr-expression-circonstances', '3eme', 'francais', $$L'expression des circonstances dans la phrase simple et complexe$$, 15, 'fr-coordination'),
('fr-orthographe-lexicale', '3eme', 'francais', 'Orthographe lexicale', 16, 'fr-expression-circonstances'),
('fr-orthographe-grammaticale', '3eme', 'francais', 'Orthographe grammaticale', 17, 'fr-orthographe-lexicale');
