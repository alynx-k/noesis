-- Fallback exercises for 'maths-thales': same unreachable-source situation
-- as 20260809000000_maths_calcul_litteral_real_exercises.sql. Original
-- exercises from general knowledge of the standard 3ème programme topic
-- (propriétés de Thalès: calcul de longueur, réciproque, troisième quotient,
-- partage de segment), matching the difficulty/structure of this lesson's
-- own content sections. Entirely original wording; exercise_questions only,
-- content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Dans un triangle ABC, M∈[AB], N∈[AC], (MN)//(BC). On donne AM=6, AB=15 et AC=20. Calcule AN.$$,
    'hint', $$Relis la propriété de Thalès : AM/AB = AN/AC.$$,
    'expected', $$AM/AB = 6/15, donc AN = 6×20/15 = 8.$$
  ),
  jsonb_build_object(
    'question', $$ABC est un triangle avec AB=16 et AC=20. Les points M∈[AB] et N∈[AC] sont tels que AM=4 et AN=5. Les droites (MN) et (BC) sont-elles parallèles ? Justifie.$$,
    'hint', $$Relis la réciproque de Thalès : compare AM/AB et AN/AC.$$,
    'expected', $$AM/AB = 4/16 = 0,25 et AN/AC = 5/20 = 0,25. Les deux quotients sont égaux, donc (MN) est parallèle à (BC).$$
  ),
  jsonb_build_object(
    'question', $$Dans un triangle ABC, (MN)//(BC), avec AM=9, AB=12 et BC=16. Calcule MN.$$,
    'hint', $$Relis la conséquence de Thalès : MN/BC = AM/AB.$$,
    'expected', $$MN/16 = 9/12, donc MN = 9×16/12 = 12.$$
  ),
  jsonb_build_object(
    'question', $$Explique la méthode pour partager un segment [AB] en 5 parties égales à la règle et au compas.$$,
    'hint', $$Relis la méthode : demi-droite auxiliaire, écartements égaux, parallèles.$$,
    'expected', $$On trace une demi-droite [AX) différente de (AB), on y reporte 5 écartements de compas égaux à partir de A, on relie le dernier point reporté à B, puis on trace les parallèles à cette droite passant par chaque point reporté : elles partagent [AB] en 5 segments égaux.$$
  )
)
where id = 'maths-thales';
