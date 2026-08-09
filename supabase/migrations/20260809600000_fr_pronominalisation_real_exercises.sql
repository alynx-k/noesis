-- Rewrite of exercise_questions for fr-pronominalisation. No ecole-ci.org
-- source was ever identified for this lesson (absent from the
-- "Grammaire-Orthographe" category listing -- see
-- 20260806590000_fr_pronominalisation_content.sql). Revisited this session:
-- the site is unreachable without login credentials this session doesn't
-- have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for the
-- detailed finding). These exercises are original, from general knowledge
-- of the standard 3ème programme, grounded in this lesson's content
-- (pronoms de reprise selon la fonction, ambiguïté) and matching the
-- existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Remplace la répétition : « Aya a écrit une lettre. Aya a envoyé la lettre à sa cousine. »$$,
    'hint', $$Remplace le second groupe nominal par un pronom COD.$$,
    'expected', $$Aya a écrit une lettre. Elle l'a envoyée à sa cousine.$$
  ),
  jsonb_build_object(
    'question', $$Quel pronom reprend « à ses parents » dans : « Il téléphone ... tous les dimanches » ?$$,
    'hint', $$« à » + personne se reprend par lui/leur.$$,
    'expected', $$Il leur téléphone tous les dimanches.$$
  ),
  jsonb_build_object(
    'question', $$Quel pronom reprend « de ce livre » dans : « Elle a beaucoup parlé ... à ses amis » ?$$,
    'hint', $$« de » se reprend par « en ».$$,
    'expected', $$Elle en a beaucoup parlé à ses amis.$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi cette phrase est-elle ambiguë : « La maîtresse a félicité l'élève car elle avait bien travaillé. » ?$$,
    'hint', $$Cherche les deux personnes auxquelles « elle » pourrait renvoyer.$$,
    'expected', $$Parce que le pronom « elle » pourrait désigner aussi bien la maîtresse que l'élève.$$
  )
)
where id = 'fr-pronominalisation';
