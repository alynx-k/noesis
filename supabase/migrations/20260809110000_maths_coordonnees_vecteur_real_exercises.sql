-- Fallback exercises for 'maths-coordonnees-vecteur': same
-- unreachable-source situation as
-- 20260809000000_maths_calcul_litteral_real_exercises.sql. Original
-- exercises from general knowledge of the standard 3ème programme topic
-- (coordonnées d'un vecteur: type de repère, coordonnées, colinéarité,
-- milieu et distance), matching the difficulty/structure of this lesson's
-- own content sections. Entirely original wording; exercise_questions only,
-- content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Dans un repère (O,I,J), on a (OI)⊥(OJ) et OI=OJ=2 cm. Quel type de repère est-ce ?$$,
    'hint', $$Relis la définition : un repère est orthonormé s'il est orthogonal et si OI=OJ.$$,
    'expected', $$Comme les axes sont perpendiculaires et de même longueur, c'est un repère orthonormé.$$
  ),
  jsonb_build_object(
    'question', $$AB = −4·OI + 7·OJ. Donne le couple de coordonnées de AB.$$,
    'hint', $$Relis la définition : AB(x;y) signifie AB = x·OI + y·OJ.$$,
    'expected', $$AB(−4;7).$$
  ),
  jsonb_build_object(
    'question', $$AB(6;−3) et CD(−2;1). Les vecteurs sont-ils colinéaires ?$$,
    'hint', $$Calcule xy′−x′y ; s'il vaut 0, les vecteurs sont colinéaires.$$,
    'expected', $$xy′−x′y = 6×1−(−2)×(−3) = 6−6 = 0, donc AB et CD sont colinéaires.$$
  ),
  jsonb_build_object(
    'question', $$On donne A(−2;4) et B(3;−2). Calcule les coordonnées du vecteur AB, du milieu K de [AB], puis la distance AB.$$,
    'hint', $$Utilise les formules : AB(xB−xA;yB−yA), K((xA+xB)/2;(yA+yB)/2), AB=√((xB−xA)²+(yB−yA)²).$$,
    'expected', $$AB(3−(−2);−2−4) = (5;−6). K((−2+3)/2;(4−2)/2) = (0,5;1). AB = √(5²+(−6)²) = √61.$$
  )
)
where id = 'maths-coordonnees-vecteur';
