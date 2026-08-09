-- Rewrite of exercise_questions for fr-ecriture-texte-argumentatif. The
-- ecole-ci.org page previously found (id 2343, "Expression Écrite") loaded
-- with no content at all (see
-- 20260806560000_fr_ecriture_texte_argumentatif_content.sql). Revisited this
-- session: the site is unreachable without login credentials this session
-- doesn't have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding), so even that empty page could not be re-checked.
-- These exercises are original, from general knowledge of the standard
-- 3ème programme, grounded in this lesson's content (formuler une thèse,
-- structurer un paragraphe argumentatif, rédiger une conclusion) and
-- matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Formule une thèse claire sur l'utilité des bibliothèques scolaires.$$,
    'hint', $$Énonce une opinion défendable en une phrase.$$,
    'expected', $$« Les bibliothèques scolaires devraient être davantage fréquentées, car elles offrent un accès gratuit à la culture et au savoir. »$$
  ),
  jsonb_build_object(
    'question', $$Complète ce paragraphe avec une explication : « Marcher pour se rendre à l'école est bénéfique. [...] »$$,
    'hint', $$Développe pourquoi cet argument est valable.$$,
    'expected', $$En effet, cela permet de faire de l'exercice physique tout en évitant de contribuer à la pollution automobile.$$
  ),
  jsonb_build_object(
    'question', $$Ajoute un exemple concret à cet argument : « Apprendre une langue étrangère ouvre de nombreuses opportunités. »$$,
    'hint', $$Illustre l'argument par un cas précis.$$,
    'expected', $$Par exemple, un élève qui maîtrise l'anglais peut plus facilement poursuivre des études ou travailler à l'international.$$
  ),
  jsonb_build_object(
    'question', $$Rédige une phrase de conclusion pour un texte qui défend l'importance de trier ses déchets.$$,
    'hint', $$Rappelle la thèse et propose une ouverture.$$,
    'expected', $$« En définitive, trier ses déchets est un geste simple qui a un impact réel : et si chacun s'y mettait dès aujourd'hui ? »$$
  )
)
where id = 'fr-ecriture-texte-argumentatif';
