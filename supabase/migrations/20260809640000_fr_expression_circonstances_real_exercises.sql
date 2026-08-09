-- Rewrite of exercise_questions for fr-expression-circonstances. Matching
-- ecole-ci.org sources were identified last session (ids 2333-2338,
-- categoryid=77, split across six sub-sessions) but could not be fetched
-- then because the Claude-in-Chrome extension disconnected mid-session (see
-- 20260806660000_fr_expression_circonstances_content.sql). Revisited this
-- session: still unreachable, but for a different reason -- course pages
-- 404 without authentication, and all four login flows require credentials
-- unavailable in this session, with no anonymous browsing path (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding). These exercises remain original, from general knowledge of the
-- standard 3ème programme, grounded in this lesson's content (cause,
-- conséquence, but, condition, opposition/concession, en phrase simple et
-- complexe) and matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Relie ces deux phrases avec une conjonction de cause : « La récolte a été mauvaise. » / « La pluie a manqué tout l'été. »$$,
    'hint', $$Utilise « parce que » ou « car ».$$,
    'expected', $$La récolte a été mauvaise parce que la pluie a manqué tout l'été.$$
  ),
  jsonb_build_object(
    'question', $$Relie ces deux phrases avec une conjonction de conséquence : « Le vent soufflait très fort. » / « Les arbres se sont couchés sur la route. »$$,
    'hint', $$Utilise « si bien que » ou « tellement...que ».$$,
    'expected', $$Le vent soufflait si fort que les arbres se sont couchés sur la route.$$
  ),
  jsonb_build_object(
    'question', $$Exprime le but en phrase simple : « Elle range son bureau. » (retrouver ses affaires facilement)$$,
    'hint', $$pour + infinitif.$$,
    'expected', $$Elle range son bureau pour retrouver ses affaires facilement.$$
  ),
  jsonb_build_object(
    'question', $$Relie avec une concession : « Il n'avait pas beaucoup d'expérience. » / « Il a remporté la compétition. »$$,
    'hint', $$« Bien que » est suivi du subjonctif.$$,
    'expected', $$Bien qu'il n'ait pas beaucoup d'expérience, il a remporté la compétition.$$
  )
)
where id = 'fr-expression-circonstances';
