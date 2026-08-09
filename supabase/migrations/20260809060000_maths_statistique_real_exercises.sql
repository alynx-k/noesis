-- Fallback exercises for 'maths-statistique': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (statistique: fréquence, effectif cumulé croissant, médiane,
-- classes), matching the difficulty/structure of this lesson's own content
-- sections. Entirely original wording; exercise_questions only, content
-- untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Dans une série de 80 supporters interrogés, 24 soutiennent l'équipe locale. Calcule la fréquence en pourcentage.$$,
    'hint', $$Relis la définition de la fréquence : effectif de la modalité divisé par effectif total.$$,
    'expected', $$Fréquence = 24/80 × 100 = 30%.$$
  ),
  jsonb_build_object(
    'question', $$Pour les modalités 2 (effectif 4), 5 (effectif 6), 7 (effectif 3), donne l'effectif cumulé croissant de la modalité 5.$$,
    'hint', $$Relis la définition : l'effectif cumulé croissant additionne les effectifs des modalités inférieures ou égales.$$,
    'expected', $$Effectif cumulé croissant de 5 = 4+6 = 10.$$
  ),
  jsonb_build_object(
    'question', $$Détermine la médiane de la série ordonnée : 3, 6, 9, 12, 20 (5 valeurs).$$,
    'hint', $$Relis la règle pour un effectif impair : la médiane est la valeur de rang (N+1)/2.$$,
    'expected', $$L'effectif est 5 (impair), donc la médiane est la valeur de rang (5+1)/2=3, soit 9.$$
  ),
  jsonb_build_object(
    'question', $$Donne le centre de la classe [35;45[, puis dis si un individu de la classe [45;55[ appartient aussi à [35;45[.$$,
    'hint', $$Relis la définition du centre d'une classe [a;b[ : (a+b)/2. Deux classes différentes ne se chevauchent pas.$$,
    'expected', $$Centre = (35+45)/2 = 40. Non, un individu de [45;55[ n'appartient pas à [35;45[, car ce sont deux classes distinctes qui ne se chevauchent pas.$$
  )
)
where id = 'maths-statistique';
