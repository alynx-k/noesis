-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 4: Triangle rectangle"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. First lesson to use a diagram: a simple right triangle
-- (own coordinates, not copied from the source's figure) illustrating the
-- Pythagoras property.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un menuisier doit vérifier si le cadre d'une porte qu'il vient de construire est parfaitement rectangulaire, sans disposer d'une équerre assez grande. Il se souvient qu'il existe une relation entre les trois côtés d'un triangle rectangle qui permet de vérifier un angle droit uniquement à l'aide d'un mètre ruban — c'est le théorème de Pythagore.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La propriété de Pythagore$$,
        'body', $$Dans un triangle rectangle, il existe une relation exacte entre les longueurs de ses trois côtés : le carré du plus grand côté (l'hypoténuse, en face de l'angle droit) est égal à la somme des carrés des deux autres.$$,
        'highlights', array[$$hypoténuse$$, $$propriété de Pythagore$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si un triangle est rectangle, alors le carré de l'hypoténuse est égal à la somme des carrés des deux autres côtés.$$),
        'example', jsonb_build_object('statement', $$ABC est rectangle en A avec AB=6 et AC=8. Calcule BC.$$, 'solution', $$BC² = AB²+AC² = 36+64 = 100, donc BC = √100 = 10.$$),
        'fixation', jsonb_build_object('question', $$DEF est rectangle en D avec DE=9 et DF=12. Calcule EF.$$, 'solution', $$EF² = 81+144 = 225, donc EF = √225 = 15.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 40, 'y', 140, 'label', $$A$$),
            jsonb_build_object('x', 40, 'y', 40, 'label', $$B$$),
            jsonb_build_object('x', 160, 'y', 140, 'label', $$C$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,0)),
          'rightAngleAt', jsonb_build_array(0)
        )
      ),
      jsonb_build_object(
        'heading', $$La réciproque de Pythagore$$,
        'body', $$La réciproque permet de faire l'inverse : à partir des trois longueurs d'un triangle, on peut vérifier s'il est rectangle, sans même avoir besoin d'équerre.$$,
        'highlights', array[$$réciproque$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un triangle, si le carré d'un côté est égal à la somme des carrés des deux autres, alors ce triangle est rectangle (l'angle droit étant opposé au plus grand côté).$$),
        'example', jsonb_build_object('statement', $$Vérifie si le triangle de côtés 9, 12, 15 est rectangle.$$, 'solution', $$15² = 225 et 9²+12² = 81+144 = 225. Comme les deux sont égaux, le triangle est rectangle.$$),
        'fixation', jsonb_build_object('question', $$Vérifie si le triangle de côtés 5, 12, 13 est rectangle.$$, 'solution', $$13² = 169 et 5²+12² = 25+144 = 169. Comme les deux sont égaux, le triangle est rectangle.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriété métrique déduite de l'aire$$,
        'body', $$Dans un triangle rectangle, on peut calculer l'aire de deux façons différentes — à partir des côtés de l'angle droit, ou à partir de l'hypoténuse et de la hauteur — ce qui donne une relation utile entre ces longueurs.$$,
        'highlights', array[$$hauteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un triangle rectangle, le produit des côtés de l'angle droit est égal au produit de l'hypoténuse par la hauteur issue du sommet de l'angle droit.$$),
        'example', jsonb_build_object('statement', $$ABC est rectangle en A, avec AB=3, AC=4 et BC=5. Calcule la hauteur AH issue de A.$$, 'solution', $$AB×AC = BC×AH, donc 3×4 = 5×AH, donc AH = 12/5 = 2,4.$$),
        'fixation', jsonb_build_object('question', $$MNP est rectangle en M, avec MN=6, MP=8 et NP=10. Calcule la hauteur MK issue de M.$$, 'solution', $$MN×MP = NP×MK, donc 6×8 = 10×MK, donc MK = 48/10 = 4,8.$$)
      ),
      jsonb_build_object(
        'heading', $$Sinus, cosinus et tangente d'un angle aigu$$,
        'body', $$Dans un triangle rectangle, chaque angle aigu est lié à trois quotients de longueurs bien précis, qui permettent de calculer un côté ou un angle sans avoir à tout mesurer directement.$$,
        'highlights', array[$$sinus$$, $$cosinus$$, $$tangente$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$sin(angle) = côté opposé / hypoténuse. cos(angle) = côté adjacent / hypoténuse. tan(angle) = côté opposé / côté adjacent = sin(angle)/cos(angle).$$),
        'example', jsonb_build_object('statement', $$ABC est rectangle en B, avec AB=3, BC=4 et AC=5. Calcule sin(BAC), cos(BAC) et tan(BAC).$$, 'solution', $$sin(BAC) = BC/AC = 4/5. cos(BAC) = AB/AC = 3/5. tan(BAC) = BC/AB = 4/3.$$),
        'fixation', jsonb_build_object('question', $$Avec les mêmes données, vérifie que sin²(BAC)+cos²(BAC)=1.$$, 'solution', $$(4/5)² + (3/5)² = 16/25 + 9/25 = 25/25 = 1. La relation est bien vérifiée.$$)
      ),
      jsonb_build_object(
        'heading', $$Angles complémentaires$$,
        'body', $$Deux angles sont complémentaires quand leur somme vaut 90°. Dans un triangle rectangle, les deux angles aigus sont toujours complémentaires, ce qui relie directement leurs sinus et cosinus.$$,
        'highlights', array[$$complémentaires$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si deux angles sont complémentaires, le sinus de l'un est égal au cosinus de l'autre.$$),
        'example', jsonb_build_object('statement', $$Sachant que sin 35° ≈ 0,574, donne cos 55°.$$, 'solution', $$35°+55°=90°, donc cos 55° = sin 35° ≈ 0,574.$$),
        'fixation', jsonb_build_object('question', $$Sachant que cos 28° ≈ 0,883, donne sin 62°.$$, 'solution', $$28°+62°=90°, donc sin 62° = cos 28° ≈ 0,883.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour installer une antenne sur le toit d'une maison, un technicien appuie une échelle de 5 m contre le mur. Le pied de l'échelle est à 3 m du mur. Un responsable de sécurité exige que l'angle entre l'échelle et le sol soit compris entre 65° et 75° pour garantir la stabilité.$$,
      'questions', array[
        $$Calcule la hauteur atteinte par le sommet de l'échelle sur le mur.$$,
        $$Calcule le cosinus de l'angle formé par l'échelle et le sol.$$,
        $$Sachant que cos 53°≈0,602 et cos 54°≈0,588, donne un encadrement de cet angle, puis dis si l'installation respecte la consigne de sécurité.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$ABC est un triangle rectangle en A avec AB=5 et AC=12. Calcule BC.$$,
      'hint', $$Relis la propriété de Pythagore : le carré de l'hypoténuse est la somme des carrés des deux autres côtés.$$,
      'expected', $$BC² = 5²+12² = 25+144 = 169, donc BC = √169 = 13.$$
    ),
    jsonb_build_object(
      'question', $$Un triangle a pour côtés 7, 24 et 25. Est-il rectangle ? Justifie avec la réciproque de Pythagore.$$,
      'hint', $$Relis la réciproque : compare le carré du plus grand côté à la somme des carrés des deux autres.$$,
      'expected', $$25² = 625 et 7²+24² = 49+576 = 625. Comme les deux sont égaux, le triangle est rectangle.$$
    ),
    jsonb_build_object(
      'question', $$RST est rectangle en R, avec RS=6, RT=8 et ST=10. Calcule sin(RST) et cos(RST).$$,
      'hint', $$Relis les définitions : sinus = côté opposé/hypoténuse, cosinus = côté adjacent/hypoténuse.$$,
      'expected', $$sin(RST) = RT/ST = 8/10 = 0,8. cos(RST) = RS/ST = 6/10 = 0,6.$$
    ),
    jsonb_build_object(
      'question', $$Sachant que sin 42° ≈ 0,669, donne cos 48° et explique pourquoi ces deux valeurs sont égales.$$,
      'hint', $$Relis la propriété des angles complémentaires : le sinus de l'un est le cosinus de l'autre.$$,
      'expected', $$42°+48°=90°, donc cos 48° = sin 42° ≈ 0,669, car ces deux angles sont complémentaires.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-triangle-rectangle';
