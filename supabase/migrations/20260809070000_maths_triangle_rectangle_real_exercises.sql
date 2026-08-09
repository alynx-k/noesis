-- Fallback exercises for 'maths-triangle-rectangle': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (triangle rectangle: Pythagore, réciproque, propriété métrique,
-- sinus/cosinus), matching the difficulty/structure of this lesson's own
-- content sections. Entirely original wording; exercise_questions only,
-- content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$ABC est un triangle rectangle en A avec AB=9 et AC=12. Calcule BC.$$,
    'hint', $$Relis la propriété de Pythagore : le carré de l'hypoténuse est la somme des carrés des deux autres côtés.$$,
    'expected', $$BC² = 9²+12² = 81+144 = 225, donc BC = √225 = 15.$$
  ),
  jsonb_build_object(
    'question', $$Un triangle a pour côtés 10, 24 et 26. Est-il rectangle ? Justifie avec la réciproque de Pythagore.$$,
    'hint', $$Relis la réciproque : compare le carré du plus grand côté à la somme des carrés des deux autres.$$,
    'expected', $$26² = 676 et 10²+24² = 100+576 = 676. Comme les deux sont égaux, le triangle est rectangle.$$
  ),
  jsonb_build_object(
    'question', $$MNP est rectangle en M, avec MN=9, MP=12 et NP=15. Calcule la hauteur MK issue de M.$$,
    'hint', $$Relis la propriété métrique : le produit des côtés de l'angle droit égale le produit de l'hypoténuse par la hauteur.$$,
    'expected', $$MN×MP = NP×MK, donc 9×12 = 15×MK, donc MK = 108/15 = 7,2.$$
  ),
  jsonb_build_object(
    'question', $$RST est rectangle en R, avec RS=8, RT=15 et ST=17. Calcule sin(RST) et cos(RST).$$,
    'hint', $$Relis les définitions : sinus = côté opposé/hypoténuse, cosinus = côté adjacent/hypoténuse.$$,
    'expected', $$sin(RST) = RT/ST = 15/17. cos(RST) = RS/ST = 8/17.$$
  )
)
where id = 'maths-triangle-rectangle';
