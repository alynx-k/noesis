-- Rewrite of exercise_questions for fr-lecture-texte-argumentatif. No
-- ecole-ci.org source was ever identified for this lesson (see
-- 20260806540000_fr_lecture_texte_argumentatif_content.sql). Revisited this
-- session: the site is unreachable without login credentials this session
-- doesn't have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding). These exercises are original, from general
-- knowledge of the standard 3ème programme, grounded in this lesson's
-- content (thèse et arguments, connecteurs logiques, types d'arguments) and
-- matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Identifie la thèse de ce texte : « Les cantines scolaires devraient proposer davantage de repas locaux, car cela soutient les producteurs de la région. »$$,
    'hint', $$Cherche l'opinion principale que l'auteur défend.$$,
    'expected', $$La thèse est que les cantines scolaires devraient proposer davantage de repas locaux.$$
  ),
  jsonb_build_object(
    'question', $$Ce passage s'appuie-t-il sur un fait, une valeur ou une conséquence : « Si rien ne change, la circulation en ville deviendra bientôt insupportable. » ?$$,
    'hint', $$Cette phrase annonce ce qui risque de se produire.$$,
    'expected', $$C'est un argument fondé sur une conséquence, car il décrit ce qui arrivera si la situation actuelle continue.$$
  ),
  jsonb_build_object(
    'question', $$Quel connecteur logique manque ici : « Les transports scolaires réduisent les embouteillages. ... , ils permettent aux élèves d'arriver à l'heure. » ?$$,
    'hint', $$Il faut un connecteur qui ajoute un second argument.$$,
    'expected', $$De plus (ou par ailleurs), ils permettent aux élèves d'arriver à l'heure.$$
  ),
  jsonb_build_object(
    'question', $$Quelle est la valeur logique du connecteur « en effet » dans un texte argumentatif ?$$,
    'hint', $$Pense à ce qu'il annonce juste après une affirmation.$$,
    'expected', $$« En effet » introduit une justification ou une explication de ce qui vient d'être affirmé.$$
  )
)
where id = 'fr-lecture-texte-argumentatif';
