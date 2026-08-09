-- Rewrite of exercise_questions for fr-orthographe-grammaticale. No
-- ecole-ci.org source was ever identified for this lesson (the
-- "Orthographe" category is empty -- see
-- 20260806610000_fr_orthographe_grammaticale_content.sql). Revisited this
-- session: the site is unreachable without login credentials this session
-- doesn't have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding). These exercises are original, from general
-- knowledge of the standard 3ème programme, grounded in this lesson's
-- content (accord sujet-verbe, accord de l'adjectif, accord du participe
-- passé) and matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Accorde le verbe : « Dans le tiroir (se cacher) plusieurs vieilles photographies. »$$,
    'hint', $$Cherche le vrai sujet, même s'il est placé après le verbe.$$,
    'expected', $$Dans le tiroir se cachent plusieurs vieilles photographies (sujet inversé « plusieurs vieilles photographies », pluriel).$$
  ),
  jsonb_build_object(
    'question', $$Accorde l'adjectif : « une veste et un pantalon (usé) »$$,
    'hint', $$Deux noms de genres différents : quel genre l'emporte ?$$,
    'expected', $$une veste et un pantalon usés (genres différents = masculin pluriel).$$
  ),
  jsonb_build_object(
    'question', $$Accorde le participe passé : « Les chansons qu'elle a (composer) sont très appréciées. »$$,
    'hint', $$Repère le COD et sa position par rapport au verbe.$$,
    'expected', $$Les chansons qu'elle a composées sont très appréciées (COD « que » placé avant, accord avec « les chansons »).$$
  ),
  jsonb_build_object(
    'question', $$Accorde le participe passé : « Elle a (ranger) toutes ses affaires avant de partir. »$$,
    'hint', $$Le COD est-il placé avant ou après le verbe ?$$,
    'expected', $$Elle a rangé toutes ses affaires avant de partir (COD « toutes ses affaires » placé après le verbe, donc pas d'accord).$$
  )
)
where id = 'fr-orthographe-grammaticale';
