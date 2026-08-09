-- Fallback exercises for 'maths-angles-inscrits': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (angles inscrits: identification, angle au centre associé, même arc
-- intercepté), matching the difficulty/structure of this lesson's own
-- content sections. Entirely original wording; exercise_questions only,
-- content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Sur un cercle, les points D, E et F sont placés. Nomme l'angle inscrit de sommet E et précise l'arc qu'il intercepte.$$,
    'hint', $$Relis la définition : le sommet est sur le cercle, les côtés recoupent le cercle en deux points.$$,
    'expected', $$C'est l'angle DEF ; il intercepte l'arc DF qui ne contient pas E.$$
  ),
  jsonb_build_object(
    'question', $$Dans un cercle de centre O, l'angle au centre HOI mesure 130°. Calcule la mesure de l'angle inscrit HJI associé.$$,
    'hint', $$Relis la propriété : l'angle inscrit vaut la moitié de l'angle au centre associé.$$,
    'expected', $$mes HJI = (1/2) × 130° = 65°.$$
  ),
  jsonb_build_object(
    'question', $$Dans un cercle, les angles inscrits ABC et ADC interceptent tous les deux l'arc AC. On donne mes ABC = 72°. Calcule mes ADC.$$,
    'hint', $$Relis la propriété des angles inscrits interceptant le même arc.$$,
    'expected', $$mes ADC = mes ABC = 72°.$$
  ),
  jsonb_build_object(
    'question', $$Dans un cercle de centre O, l'angle inscrit UVW mesure 51°. Calcule la mesure de l'angle au centre UOW associé, puis déduis-en s'il est aigu, droit ou obtus.$$,
    'hint', $$Relis la propriété : angle au centre = 2 × angle inscrit associé.$$,
    'expected', $$mes UOW = 2 × 51° = 102°. Comme 102°>90°, UOW est un angle obtus.$$
  )
)
where id = 'maths-angles-inscrits';
