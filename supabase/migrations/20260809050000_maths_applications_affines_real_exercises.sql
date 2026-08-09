-- Fallback exercises for 'maths-applications-affines': same
-- unreachable-source situation as
-- 20260809000000_maths_calcul_litteral_real_exercises.sql. Original
-- exercises from general knowledge of the standard 3ème programme topic
-- (applications affines: image, antécédent, sens de variation, application
-- linéaire), matching the difficulty/structure of this lesson's own content
-- sections. Entirely original wording; exercise_questions only, content
-- untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Calcule l'image de −2 par l'application f : x ↦ 5x−3.$$,
    'hint', $$Relis la méthode : remplace x par la valeur donnée dans l'expression de f(x).$$,
    'expected', $$f(−2) = 5×(−2)−3 = −10−3 = −13.$$
  ),
  jsonb_build_object(
    'question', $$Détermine x tel que g(x)=17, avec g : x ↦ 4x−3.$$,
    'hint', $$Relis la méthode pour trouver un antécédent : résous l'équation f(x)=y.$$,
    'expected', $$4x−3=17 équivaut à 4x=20, donc x=5.$$
  ),
  jsonb_build_object(
    'question', $$f est une application affine croissante. Compare f(−1) et f(4), puis explique ta réponse.$$,
    'hint', $$Relis la propriété du sens de variation : pour une fonction croissante, un nombre plus petit a une image plus petite.$$,
    'expected', $$−1<4 et f est croissante, donc f(−1)<f(4), car une fonction croissante conserve l'ordre des nombres sur leurs images.$$
  ),
  jsonb_build_object(
    'question', $$Un litre d'essence coûte 750 F. Exprime le prix p(x) de x litres, puis précise s'il s'agit d'une application affine ou linéaire.$$,
    'hint', $$Relis la définition d'une application linéaire : le terme constant b vaut 0, cas d'une grandeur proportionnelle.$$,
    'expected', $$p(x)=750x. Comme il n'y a pas de terme constant, c'est une application linéaire, correspondant à une situation de proportionnalité.$$
  )
)
where id = 'maths-applications-affines';
