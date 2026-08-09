-- Fallback exercises for 'maths-racines-carrees': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql (the
-- ecole-ci.org login wall requires phone verification with no credentials
-- available). Original exercises from general knowledge of the standard
-- 3ème programme topic (racines carrées: définition, valeur absolue,
-- produit/quotient, rendre un dénominateur sans radical), matching the
-- difficulty/structure of this lesson's own content sections. Entirely
-- original wording; exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Calcule √121 puis vérifie ta réponse en calculant son carré.$$,
    'hint', $$Relis la définition : √a est le nombre positif dont le carré vaut a.$$,
    'expected', $$√121 = 11, car 11² = 121 et 11 est positif.$$
  ),
  jsonb_build_object(
    'question', $$Simplifie √((−7)²).$$,
    'hint', $$Relis la propriété : pour tout réel a, √(a²) = |a|.$$,
    'expected', $$√((−7)²) = |−7| = 7.$$
  ),
  jsonb_build_object(
    'question', $$Écris √45 sous la forme a√b avec b le plus petit possible.$$,
    'hint', $$Relis le passage sur la racine carrée d'un produit : cherche un facteur carré parfait dans 45.$$,
    'expected', $$√45 = √(9×5) = √9×√5 = 3√5.$$
  ),
  jsonb_build_object(
    'question', $$Écris 7/(2+√5) sans radical au dénominateur, en détaillant l'étape de multiplication.$$,
    'hint', $$Relis la méthode avec l'expression conjuguée : multiplie haut et bas par 2−√5.$$,
    'expected', $$7/(2+√5) = 7(2−√5) / [(2+√5)(2−√5)] = (14−7√5)/(4−5) = (14−7√5)/(−1) = 7√5 − 14.$$
  )
)
where id = 'maths-racines-carrees';
