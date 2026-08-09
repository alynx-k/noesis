-- Rewrite of exercise_questions for fr-coordination. A matching
-- ecole-ci.org source was identified last session (id 2339,
-- categoryid=77) but could not be fetched then because the Claude-in-Chrome
-- extension disconnected mid-session (see
-- 20260806650000_fr_coordination_content.sql). Revisited this session:
-- still unreachable, but for a different reason -- course pages 404 without
-- authentication, and all four login flows require credentials unavailable
-- in this session, with no anonymous browsing path (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding). These exercises remain original, from general knowledge of the
-- standard 3ème programme, grounded in this lesson's content (conjonctions
-- de coordination, adverbes de liaison, ponctuation d'une énumération) and
-- matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Relie avec « car » : « Il a pris un parapluie. » / « Le ciel était très nuageux. »$$,
    'hint', $$« Car » exprime une cause.$$,
    'expected', $$Il a pris un parapluie, car le ciel était très nuageux.$$
  ),
  jsonb_build_object(
    'question', $$Quelle est la valeur logique de « ni » dans : « Il n'aime ni le café ni le thé. » ?$$,
    'hint', $$Pense à ce que ce mot exprime quand il est répété.$$,
    'expected', $$« Ni » exprime une négation qui porte sur deux (ou plusieurs) éléments à la fois.$$
  ),
  jsonb_build_object(
    'question', $$Ponctue cette énumération : « Il a rangé ses cahiers ses stylos et sa trousse. »$$,
    'hint', $$Sépare les éléments par des virgules, sauf avant « et ».$$,
    'expected', $$Il a rangé ses cahiers, ses stylos et sa trousse.$$
  ),
  jsonb_build_object(
    'question', $$Remplace « donc » par un adverbe de liaison de sens proche dans : « Il n'a pas révisé, donc il a eu une mauvaise note. »$$,
    'hint', $$Cherche un adverbe qui exprime aussi une conséquence.$$,
    'expected', $$Il n'a pas révisé, ainsi il a eu une mauvaise note.$$
  )
)
where id = 'fr-coordination';
