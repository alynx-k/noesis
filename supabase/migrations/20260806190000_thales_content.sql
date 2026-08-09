-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 2: Propriétés de Thalès
-- dans le triangle" programme document, but every sentence, example and
-- exercise is an original rewrite. Diagram: a generic Thalès triangle
-- configuration (own coordinates/labels, not the source's toit/appâtâmes
-- figure).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Amara installe un étendoir à linge pliant en forme de triangle. Pour le stabiliser, elle doit fixer une barre transversale parallèle à la base, à l'endroit précis où les côtés obliques mesurent 90 cm et 60 cm depuis le sommet, alors que ces côtés mesurent en entier 150 cm et 100 cm, et que la base mesure 80 cm. Elle se souvient qu'un théorème de géométrie relie exactement ces longueurs entre elles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La propriété de Thalès$$,
        'body', $$Lorsqu'une droite coupe deux côtés d'un triangle en restant parallèle au troisième côté, elle partage les deux côtés coupés exactement dans les mêmes proportions. C'est la propriété de Thalès, l'un des outils les plus utilisés en géométrie pour calculer une longueur sans la mesurer directement.$$,
        'highlights', array[$$propriété de Thalès$$, $$parallèle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Soit ABC un triangle. Si M est un point de la droite (AB), N un point de la droite (AC), et si (MN) est parallèle à (BC), alors AM/AB = AN/AC.$$),
        'example', jsonb_build_object('statement', $$Dans un triangle ABC, M appartient à [AB] et N à [AC], avec (MN)//(BC). On donne AM=4, AB=10 et AC=15. Calcule AN.$$, 'solution', $$AM/AB = AN/AC, donc 4/10 = AN/15, donc AN = 4×15/10 = 6.$$),
        'fixation', jsonb_build_object('question', $$Dans un triangle RST, U appartient à [RS] et V à [RT], avec (UV)//(ST). On donne RU=3, RS=9 et RT=12. Calcule RV.$$, 'solution', $$RU/RS = RV/RT, donc 3/9 = RV/12, donc RV = 3×12/9 = 4.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 20, 'label', $$A$$),
            jsonb_build_object('x', 30, 'y', 160, 'label', $$B$$),
            jsonb_build_object('x', 170, 'y', 160, 'label', $$C$$),
            jsonb_build_object('x', 65, 'y', 90, 'label', $$M$$),
            jsonb_build_object('x', 135, 'y', 90, 'label', $$N$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2), jsonb_build_array(1,2), jsonb_build_array(3,4))
        )
      ),
      jsonb_build_object(
        'heading', $$Réciproque de la propriété de Thalès$$,
        'body', $$La réciproque fonctionne dans l'autre sens : si l'on connaît déjà des longueurs proportionnelles sur deux côtés d'un triangle, on peut en déduire que la droite reliant ces deux points est parallèle au troisième côté, sans avoir besoin de mesurer un seul angle.$$,
        'highlights', array[$$réciproque$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$ABC est un triangle, M un point de (AB) et N un point de (AC), situés dans le même sens par rapport aux sommets A, B et C. Si AM/AB = AN/AC, alors (MN) est parallèle à (BC).$$),
        'example', jsonb_build_object('statement', $$ABC est un triangle avec AB=12 et AC=8. M∈[AB] et N∈[AC] sont tels que AM=9 et AN=6. Les droites (MN) et (BC) sont-elles parallèles ?$$, 'solution', $$AM/AB = 9/12 = 3/4 et AN/AC = 6/8 = 3/4. Les deux quotients sont égaux, donc (MN) est parallèle à (BC).$$),
        'fixation', jsonb_build_object('question', $$ABC est un triangle avec AB=20 et AC=16. M∈[AB] et N∈[AC] sont tels que AM=5 et AN=4. (MN) et (BC) sont-elles parallèles ?$$, 'solution', $$AM/AB = 5/20 = 1/4 et AN/AC = 4/16 = 1/4. Les deux quotients sont égaux, donc (MN) est parallèle à (BC).$$)
      ),
      jsonb_build_object(
        'heading', $$Conséquence : le troisième quotient$$,
        'body', $$Quand (MN) est parallèle à (BC), on peut ajouter un troisième quotient égal aux deux premiers : celui qui compare directement les longueurs MN et BC. Cette conséquence est particulièrement pratique pour calculer une longueur qu'on ne peut pas mesurer sur le terrain.$$,
        'highlights', array[$$troisième quotient$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si (MN) est parallèle à (BC) dans le triangle ABC, alors MN/BC = AM/AB = AN/AC.$$),
        'example', jsonb_build_object('statement', $$Dans un triangle ABC, (MN)//(BC), avec AM=6, AB=8 et BC=20. Calcule MN.$$, 'solution', $$MN/BC = AM/AB, donc MN/20 = 6/8, donc MN = 6×20/8 = 15.$$),
        'fixation', jsonb_build_object('question', $$Dans un triangle ABC, (MN)//(BC), avec AM=5, AB=15 et BC=27. Calcule MN.$$, 'solution', $$MN/BC = AM/AB, donc MN/27 = 5/15, donc MN = 5×27/15 = 9.$$)
      ),
      jsonb_build_object(
        'heading', $$Partager un segment en parties égales$$,
        'body', $$La propriété de Thalès permet aussi de construire, à la règle et au compas, un segment partagé en plusieurs parties parfaitement égales, sans avoir à mesurer chaque partie une par une.$$,
        'highlights', array[$$partager un segment$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour partager [AB] en n parts égales : tracer une demi-droite [AX) différente de (AB), y reporter n écartements de compas identiques à partir de A, relier le dernier point reporté à B, puis tracer les parallèles à cette droite passant par chaque point reporté : elles partagent [AB] en n segments égaux.$$),
        'example', jsonb_build_object('statement', $$Explique pourquoi cette méthode donne bien des segments égaux sur [AB].$$, 'solution', $$Chaque parallèle tracée crée une configuration de Thalès : comme les écartements reportés sur [AX) sont égaux, les quotients de longueurs obtenus sont égaux, donc les segments correspondants sur [AB] le sont aussi.$$),
        'fixation', jsonb_build_object('question', $$Combien de traits de graduation identiques doit-on reporter sur la demi-droite [AX) pour partager [AB] en 7 parties égales ?$$, 'solution', $$Il faut reporter 7 écartements de compas identiques à partir de A.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour estimer la hauteur d'une antenne relais sans instrument de mesure, Kader tient une règle verticale à bout de bras. La longueur de son bras est de 60 cm. Il recule jusqu'à ce que le haut de la règle, qui dépasse de 8 cm au-dessus de sa main, soit exactement aligné avec le sommet de l'antenne, et que le bas de la règle soit aligné avec le pied de l'antenne. À cet instant, il se trouve à 45 m de l'antenne.$$,
      'questions', array[
        $$Fais un schéma identifiant les deux triangles semblables formés par le bras de Kader d'une part, et la distance à l'antenne d'autre part.$$,
        $$Sachant que la hauteur des objets est proportionnelle à leur distance par rapport à l'œil de Kader, écris l'égalité de quotients donnée par la propriété de Thalès.$$,
        $$Calcule la hauteur de l'antenne.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans un triangle ABC, M∈[AB], N∈[AC], (MN)//(BC). On donne AM=3, AB=7 et AC=14. Calcule AN.$$,
      'hint', $$Relis la propriété de Thalès : AM/AB = AN/AC.$$,
      'expected', $$AM/AB = 3/7, donc AN = 3×14/7 = 6.$$
    ),
    jsonb_build_object(
      'question', $$ABC est un triangle avec AB=18 et AC=24. Les points M∈[AB] et N∈[AC] sont tels que AM=6 et AN=8. Les droites (MN) et (BC) sont-elles parallèles ? Justifie.$$,
      'hint', $$Relis la réciproque de Thalès : compare AM/AB et AN/AC.$$,
      'expected', $$AM/AB = 6/18 = 1/3 et AN/AC = 8/24 = 1/3. Les deux quotients sont égaux, donc (MN) est parallèle à (BC).$$
    ),
    jsonb_build_object(
      'question', $$Dans un triangle ABC, (MN)//(BC), avec AM=4, AB=10 et BC=25. Calcule MN.$$,
      'hint', $$Relis la conséquence de Thalès : MN/BC = AM/AB.$$,
      'expected', $$MN/25 = 4/10, donc MN = 4×25/10 = 10.$$
    ),
    jsonb_build_object(
      'question', $$Explique la méthode pour partager un segment [AB] en 4 parties égales à la règle et au compas.$$,
      'hint', $$Relis la méthode : demi-droite auxiliaire, écartements égaux, parallèles.$$,
      'expected', $$On trace une demi-droite [AX) différente de (AB), on y reporte 4 écartements de compas égaux à partir de A, on relie le dernier point reporté à B, puis on trace les parallèles à cette droite passant par chaque point reporté : elles partagent [AB] en 4 segments égaux.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-thales';
