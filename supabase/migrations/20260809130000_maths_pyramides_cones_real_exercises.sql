-- Fallback exercises for 'maths-pyramides-cones': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (pyramides et cônes: vocabulaire, aire latérale et volume,
-- génératrice, réduction et tronc), matching the difficulty/structure of
-- this lesson's own content sections. Entirely original wording;
-- exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Dans une pyramide SABCDEF de base hexagonale, combien y a-t-il de faces latérales, puis d'arêtes en tout ?$$,
    'hint', $$Relis le vocabulaire : autant de faces latérales et d'arêtes latérales que de côtés à la base, plus les arêtes de la base elle-même.$$,
    'expected', $$La base ABCDEF a 6 côtés, donc il y a 6 faces latérales. Il y a aussi 6 arêtes de base et 6 arêtes latérales, soit 12 arêtes en tout.$$
  ),
  jsonb_build_object(
    'question', $$SABC est une pyramide régulière de base un triangle équilatéral, de périmètre 21 cm et d'aire 24 cm², d'apothème 9 cm et de hauteur 9 cm. Calcule son aire latérale et son volume.$$,
    'hint', $$Utilise A=(P×a)/2 et V=(B×h)/3.$$,
    'expected', $$A = (21×9)/2 = 94,5 cm². V = (24×9)/3 = 72 cm³.$$
  ),
  jsonb_build_object(
    'question', $$Un cône a pour hauteur SO=9 cm et pour rayon de base OA=12 cm. Calcule sa génératrice SA.$$,
    'hint', $$Relis la propriété : le triangle SOA est rectangle en O, donc le théorème de Pythagore s'applique.$$,
    'expected', $$SA² = SO²+OA² = 81+144 = 225, donc SA = √225 = 15 cm.$$
  ),
  jsonb_build_object(
    'question', $$Une pyramide a un volume de 189 cm³. On la coupe par un plan parallèle à la base avec un rapport de réduction k=2/3. Calcule le volume de la petite pyramide, puis celui du tronc de pyramide.$$,
    'hint', $$Utilise Vréduit=k³×V, puis Vtronc=Vgrand−Vréduit.$$,
    'expected', $$Petite pyramide : (2/3)³×189 = (8/27)×189 = 56 cm³. Tronc : 189−56 = 133 cm³.$$
  )
)
where id = 'maths-pyramides-cones';
