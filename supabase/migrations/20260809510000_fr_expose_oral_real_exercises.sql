-- Rewrite of exercise_questions for fr-expose-oral. No ecole-ci.org source
-- was ever identified for this lesson (see 20260806510000_fr_expose_oral_content.sql).
-- Revisited this session: the site's course pages 404 without authentication
-- and all login flows require credentials unavailable here (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding), so it is treated as unreachable again. These exercises are
-- original, from general knowledge of the standard 3ème programme, grounded
-- in this lesson's content (plan de l'exposé, connecteurs logiques, posture
-- à l'oral) and matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Quelle étape de l'exposé annonce ce connecteur : « Enfin, n'oublions pas l'impact de ce projet sur l'emploi local. » ?$$,
    'hint', $$Pense à la position habituelle de ce connecteur dans un discours.$$,
    'expected', $$« Enfin » annonce la dernière idée ou la conclusion de l'exposé.$$
  ),
  jsonb_build_object(
    'question', $$Complète avec un connecteur d'opposition : « Les réseaux sociaux permettent de rester en contact. ..., ils peuvent aussi isoler certains jeunes. »$$,
    'hint', $$Cherche un connecteur qui nuance l'idée précédente.$$,
    'expected', $$Cependant (ou toutefois), ils peuvent aussi isoler certains jeunes.$$
  ),
  jsonb_build_object(
    'question', $$Propose une phrase d'introduction pour un exposé sur la déforestation en Côte d'Ivoire.$$,
    'hint', $$Présente le sujet en une phrase qui capte l'attention.$$,
    'expected', $$« Aujourd'hui, je vais vous parler d'un phénomène préoccupant pour notre pays : la déforestation. »$$
  ),
  jsonb_build_object(
    'question', $$Donne un conseil pour éviter de parler trop vite ou de bafouiller pendant un exposé.$$,
    'hint', $$Pense au rythme de la voix et à la respiration.$$,
    'expected', $$Il faut respirer calmement entre les idées et marquer de courtes pauses, ce qui ralentit le débit et rend l'articulation plus claire.$$
  )
)
where id = 'fr-expose-oral';
