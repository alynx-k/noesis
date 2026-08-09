-- Fallback exercises for 'maths-equations-droites': same
-- unreachable-source situation as
-- 20260809000000_maths_calcul_litteral_real_exercises.sql. Original
-- exercises from general knowledge of the standard 3ème programme topic
-- (équations de droites: forme générale, coefficient directeur, points
-- d'une droite, perpendicularité), matching the difficulty/structure of
-- this lesson's own content sections. Entirely original wording;
-- exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$L'équation −3y+6=0 peut-elle être celle d'une droite ? Justifie.$$,
    'hint', $$Relis la propriété : une équation ax+by+c=0 est celle d'une droite dès que (a;b)≠(0;0), même si a=0.$$,
    'expected', $$Ici a=0 et b=−3, donc (a;b)≠(0;0) : c'est bien l'équation d'une droite (une droite horizontale).$$
  ),
  jsonb_build_object(
    'question', $$A(0;−2) et B(5;3). Calcule le coefficient directeur de la droite (AB).$$,
    'hint', $$Relis la formule : a=(yB−yA)/(xB−xA).$$,
    'expected', $$a = (3−(−2))/(5−0) = 5/5 = 1.$$
  ),
  jsonb_build_object(
    'question', $$Trouve deux points de la droite d'équation 2x+3y−6=0.$$,
    'hint', $$Relis la méthode : choisis deux valeurs de x, calcule le y correspondant.$$,
    'expected', $$Si x=0 : 3y−6=0, donc y=2, point (0;2). Si x=3 : 6+3y−6=0, donc y=0, point (3;0).$$
  ),
  jsonb_build_object(
    'question', $$(D): y=3x−2 et (D′): x+3y−9=0. Ces droites sont-elles perpendiculaires ?$$,
    'hint', $$Mets (D′) sous la forme y=ax+b, puis vérifie si le produit des coefficients directeurs vaut −1.$$,
    'expected', $$(D′) : 3y=−x+9, donc y=−(1/3)x+3. a×a′ = 3×(−1/3) = −1, donc (D) et (D′) sont perpendiculaires.$$
  )
)
where id = 'maths-equations-droites';
