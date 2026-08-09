-- Fallback exercises for 'maths-calcul-numerique': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (calcul numérique: intervalles, intersection, comparaison de carrés,
-- encadrements), matching the difficulty/structure of this lesson's own
-- content sections. Entirely original wording; exercise_questions only,
-- content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Traduis par un intervalle : −5 ≤ x < 2.$$,
    'hint', $$Relis le vocabulaire des intervalles : crochet fermé pour une borne incluse, crochet ouvert pour une borne exclue.$$,
    'expected', $$−5 ≤ x < 2 équivaut à x ∈ [−5;2[.$$
  ),
  jsonb_build_object(
    'question', $$Détermine [2;7] ∩ [5;10].$$,
    'hint', $$Relis la définition de l'intersection : ce que les deux intervalles ont en commun.$$,
    'expected', $$Les deux intervalles se chevauchent entre 5 et 7, donc [2;7] ∩ [5;10] = [5;7].$$
  ),
  jsonb_build_object(
    'question', $$Compare 5√2 et 3√6 en comparant leurs carrés.$$,
    'hint', $$Relis la propriété de comparaison des carrés pour des nombres positifs.$$,
    'expected', $$(5√2)² = 50 et (3√6)² = 54. Comme 50 < 54, on a 5√2 < 3√6.$$
  ),
  jsonb_build_object(
    'question', $$Sachant que 3,60<√13<3,61 et 4,58<√21<4,59, donne un encadrement de √21−√13.$$,
    'hint', $$Relis la méthode d'encadrement d'une différence : il faut inverser le sens de l'encadrement du nombre soustrait avant d'additionner.$$,
    'expected', $$On inverse l'encadrement de √13 : −3,61<−√13<−3,60. En additionnant avec celui de √21 : 4,58−3,61 < √21−√13 < 4,59−3,60, soit 0,97 < √21−√13 < 0,99.$$
  )
)
where id = 'maths-calcul-numerique';
