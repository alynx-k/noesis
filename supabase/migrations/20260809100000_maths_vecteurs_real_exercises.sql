-- Fallback exercises for 'maths-vecteurs': same unreachable-source situation
-- as 20260809000000_maths_calcul_litteral_real_exercises.sql. Original
-- exercises from general knowledge of the standard 3ème programme topic
-- (vecteurs: caractéristiques, relation de Chasles, différence, vecteur
-- directeur et orthogonalité), matching the difficulty/structure of this
-- lesson's own content sections. Entirely original wording;
-- exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Les vecteurs EF et GH ont la même direction et la même longueur, mais des sens opposés. Que peut-on dire de leur relation ?$$,
    'hint', $$Relis les trois caractéristiques d'un vecteur : direction, sens, longueur.$$,
    'expected', $$EF est l'opposé de GH, donc EF = −GH.$$
  ),
  jsonb_build_object(
    'question', $$Simplifie l'écriture PQ + QR + RS + ST.$$,
    'hint', $$Applique plusieurs fois la relation de Chasles, deux termes à la fois.$$,
    'expected', $$PQ+QR = PR, puis PR+RS = PS, puis PS+ST = PT. Donc PQ+QR+RS+ST = PT.$$
  ),
  jsonb_build_object(
    'question', $$Simplifie l'écriture AB − CB.$$,
    'hint', $$Transforme la différence en somme grâce à l'opposé, puis applique Chasles.$$,
    'expected', $$AB − CB = AB + BC (car −CB = BC) = AC (Chasles).$$
  ),
  jsonb_build_object(
    'question', $$Un vecteur directeur d'une droite (D) est IJ. Un vecteur KL est orthogonal à IJ. Que peut-on dire des droites (D) et (KL) ?$$,
    'hint', $$Relis la définition : deux vecteurs orthogonaux dirigent deux droites perpendiculaires.$$,
    'expected', $$Comme KL est orthogonal à IJ, qui dirige (D), la droite (KL) est perpendiculaire à (D).$$
  )
)
where id = 'maths-vecteurs';
