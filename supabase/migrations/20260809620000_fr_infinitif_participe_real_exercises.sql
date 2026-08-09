-- Rewrite of exercise_questions for fr-infinitif-participe. Matching
-- ecole-ci.org sources were identified last session (ids 2340-2342,
-- categoryid=77) but could not be fetched then because the Claude-in-Chrome
-- extension disconnected mid-session (see
-- 20260806640000_fr_infinitif_participe_content.sql). Revisited this
-- session: still unreachable, but for a different reason -- course pages
-- 404 without authentication, and all four login flows require credentials
-- unavailable in this session, with no anonymous browsing path (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding). These exercises remain original, from general knowledge of the
-- standard 3ème programme, grounded in this lesson's content (fonctions de
-- l'infinitif, participe passé adjectif vs temps composé, participe
-- présent et gérondif) and matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Quelle est la fonction de l'infinitif dans : « Lire chaque soir aide à s'endormir. » ?$$,
    'hint', $$Pense à ce qui fait l'action du verbe « aide ».$$,
    'expected', $$« Lire » est sujet du verbe « aide ».$$
  ),
  jsonb_build_object(
    'question', $$« Épuisé » dans « des coureurs épuisés » est-il un participe passé employé comme adjectif ou dans un temps composé ?$$,
    'hint', $$Cherche s'il y a un auxiliaire dans cette expression.$$,
    'expected', $$Il est employé comme un adjectif, car il qualifie directement « coureurs » sans auxiliaire.$$
  ),
  jsonb_build_object(
    'question', $$Forme le participe présent du verbe « choisir ».$$,
    'hint', $$Base-toi sur la forme « nous choisissons ».$$,
    'expected', $$Choisissant.$$
  ),
  jsonb_build_object(
    'question', $$Transforme en gérondif : « Elle range sa chambre et elle écoute la radio en même temps. »$$,
    'hint', $$Utilise « en » + participe présent.$$,
    'expected', $$Elle range sa chambre en écoutant la radio.$$
  )
)
where id = 'fr-infinitif-participe';
