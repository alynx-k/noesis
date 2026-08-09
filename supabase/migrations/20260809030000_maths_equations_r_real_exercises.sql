-- Fallback exercises for 'maths-equations-r': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (équations et inéquations du premier degré dans ℝ), matching the
-- difficulty/structure of this lesson's own content sections. Entirely
-- original wording; exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Résous l'équation 7x − 4 = 3x + 16.$$,
    'hint', $$Relis la méthode : regroupe les termes en x d'un côté, les nombres de l'autre.$$,
    'expected', $$7x−3x = 16+4, donc 4x=20, donc x=5.$$
  ),
  jsonb_build_object(
    'question', $$Résous l'équation (4x+8)(x−3)=0.$$,
    'hint', $$Relis la propriété du produit nul : un produit est nul si l'un au moins de ses facteurs est nul.$$,
    'expected', $$4x+8=0 ou x−3=0, donc x=−2 ou x=3.$$
  ),
  jsonb_build_object(
    'question', $$Résous l'inéquation 5x + 2 ≤ 3x − 6, en précisant le sens de l'inégalité obtenue.$$,
    'hint', $$Relis les inéquations du premier degré : regroupe d'abord les termes en x, sans diviser par un nombre négatif ici.$$,
    'expected', $$5x−3x ≤ −6−2, donc 2x ≤ −8, donc x ≤ −4. L'ensemble des solutions est ]←;−4].$$
  ),
  jsonb_build_object(
    'question', $$Résous le système {2x−3>0 ; −x+5≥0}.$$,
    'hint', $$Relis la méthode : résous chaque inéquation séparément, puis prends l'intersection des deux ensembles de solutions.$$,
    'expected', $$2x−3>0 donne x>1,5, S1=]1,5;→[. −x+5≥0 donne x≤5, S2=]←;5]. Donc S = ]1,5;5].$$
  )
)
where id = 'maths-equations-r';
