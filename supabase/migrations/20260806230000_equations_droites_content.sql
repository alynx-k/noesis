-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 10: Equations de droites"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. Diagram: a generic line through two points against an
-- (O,I,J) frame (own coordinates, not the source's A(0;3)/B(-1;1) example).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une agricultrice veut irriguer son champ en installant un tuyau rectiligne reliant deux bornes d'arrosage repérées par leurs coordonnées sur le plan du terrain. Elle a entendu parler d'équations du type ax+by+c=0 qui permettraient de vérifier si une troisième borne, déjà installée, se trouve bien alignée avec les deux premières. Elle demande à sa fille, en classe de troisième, de l'aider à comprendre ces équations de droites.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équation d'une droite$$,
        'body', $$Dans un plan muni d'un repère, toute droite peut s'écrire sous une même forme générale, à condition que les deux coefficients devant x et y ne soient pas simultanément nuls. Réciproquement, toute équation de cette forme représente une droite.$$,
        'highlights', array[$$équation d'une droite$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Toute droite du plan a une équation de la forme ax+by+c=0, où (a;b)≠(0;0). Réciproquement, toute équation ax+by+c=0 avec (a;b)≠(0;0) est l'équation d'une droite.$$),
        'example', jsonb_build_object('statement', $$L'équation 5x−2y+1=0 peut-elle être celle d'une droite ?$$, 'solution', $$Ici a=5 et b=−2, donc (a;b)≠(0;0) : c'est bien l'équation d'une droite.$$),
        'fixation', jsonb_build_object('question', $$L'équation 0x+0y+7=0 peut-elle être celle d'une droite ?$$, 'solution', $$Ici a=0 et b=0, donc (a;b)=(0;0) : ce n'est pas l'équation d'une droite.$$)
      ),
      jsonb_build_object(
        'heading', $$Déterminer l'équation d'une droite passant par deux points$$,
        'body', $$Pour trouver l'équation d'une droite (AB), on exprime qu'un point M(x;y) lui appartient exactement quand le vecteur AM est colinéaire au vecteur AB, puis on développe cette condition.$$,
        'highlights', array[$$colinéaire$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$M(x;y) appartient à (AB) équivaut à AM et AB colinéaires, soit (xB−xA)(y−yA)−(yB−yA)(x−xA)=0, qu'on développe pour obtenir une équation ax+by+c=0.$$),
        'example', jsonb_build_object('statement', $$A(2;1) et B(4;5). Détermine une équation de (AB).$$, 'solution', $$AB(2;4). M(x;y)∈(AB) équivaut à 2(y−1)−4(x−2)=0, soit 2y−2−4x+8=0, soit −4x+2y+6=0, soit 2x−y−3=0.$$),
        'fixation', jsonb_build_object('question', $$A(1;−2) et B(3;2). Détermine une équation de (AB).$$, 'solution', $$AB(2;4). M(x;y)∈(AB) équivaut à 2(y+2)−4(x−1)=0, soit 2y+4−4x+4=0, soit −4x+2y+8=0, soit 2x−y−4=0.$$)
      ),
      jsonb_build_object(
        'heading', $$Le coefficient directeur d'une droite$$,
        'body', $$Le coefficient directeur d'une droite mesure à quelle vitesse elle monte ou descend : il peut se calculer à partir de deux de ses points, ou se lire directement une fois l'équation mise sous la forme y=Ax+B.$$,
        'highlights', array[$$coefficient directeur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si (D) passe par A(xA;yA) et B(xB;yB) avec xA≠xB, son coefficient directeur est a=(yB−yA)/(xB−xA). Si l'équation de (D) se met sous la forme y=Ax+B, alors A est le coefficient directeur et B l'ordonnée à l'origine.$$),
        'example', jsonb_build_object('statement', $$A(2;−1) et B(6;7). Calcule le coefficient directeur de (AB).$$, 'solution', $$a = (7−(−1))/(6−2) = 8/4 = 2.$$),
        'fixation', jsonb_build_object('question', $$Une droite (D) a pour équation 4x+2y−6=0. Détermine son coefficient directeur et son ordonnée à l'origine.$$, 'solution', $$2y=−4x+6, donc y=−2x+3. Le coefficient directeur est −2, l'ordonnée à l'origine est 3.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire une droite connaissant son équation$$,
        'body', $$Pour tracer une droite dont on connaît l'équation, il suffit de trouver deux points qui la vérifient, en choisissant deux valeurs simples de x, puis de tracer la droite qui les relie.$$,
        'highlights', array[$$tracer$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Choisir deux valeurs de x, calculer le y correspondant à l'aide de l'équation pour obtenir deux points, les placer dans le repère, puis tracer la droite qui les relie.$$),
        'example', jsonb_build_object('statement', $$Trouve deux points de la droite d'équation 3x−y+2=0.$$, 'solution', $$Si x=0 : −y+2=0, donc y=2, point (0;2). Si x=1 : 3−y+2=0, donc y=5, point (1;5).$$),
        'fixation', jsonb_build_object('question', $$Trouve deux points de la droite d'équation x+2y−4=0.$$, 'solution', $$Si x=0 : 2y−4=0, donc y=2, point (0;2). Si x=4 : 4+2y−4=0, donc y=0, point (4;0).$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(150, 170),
          'points', jsonb_build_array(
            jsonb_build_object('x', 30, 'y', 150, 'label', $$O$$),
            jsonb_build_object('x', 55, 'y', 150, 'label', $$I$$),
            jsonb_build_object('x', 30, 'y', 125, 'label', $$J$$),
            jsonb_build_object('x', 30, 'y', 90, 'label', $$A$$),
            jsonb_build_object('x', 120, 'y', 30, 'label', $$B$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2), jsonb_build_array(3,4))
        )
      ),
      jsonb_build_object(
        'heading', $$Droites parallèles$$,
        'body', $$Deux droites sont parallèles exactement quand elles montent (ou descendent) au même rythme, c'est-à-dire quand elles ont le même coefficient directeur.$$,
        'highlights', array[$$parallèles$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les droites (D) et (D′), de coefficients directeurs a et a′, sont parallèles si et seulement si a=a′.$$),
        'example', jsonb_build_object('statement', $$(D): y=2x+5 et (D′): 4x−2y+1=0. Ces droites sont-elles parallèles ?$$, 'solution', $$(D′) : −2y=−4x−1, donc y=2x+0,5. Les deux droites ont le coefficient directeur 2, donc elles sont parallèles.$$),
        'fixation', jsonb_build_object('question', $$(D): y=−3x+1 et (D′): 6x+2y−4=0. Ces droites sont-elles parallèles ?$$, 'solution', $$(D′) : 2y=−6x+4, donc y=−3x+2. Les deux droites ont le coefficient directeur −3, donc elles sont parallèles.$$)
      ),
      jsonb_build_object(
        'heading', $$Droites perpendiculaires$$,
        'body', $$Dans un repère orthonormé, deux droites sont perpendiculaires exactement quand le produit de leurs coefficients directeurs vaut −1 : l'une monte pendant que l'autre descend, dans une proportion bien précise.$$,
        'highlights', array[$$perpendiculaires$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un repère orthonormé, les droites (D) et (D′), de coefficients directeurs a et a′, sont perpendiculaires si et seulement si a×a′=−1.$$),
        'example', jsonb_build_object('statement', $$(D): y=4x−1 et (D′): y=−0,25x+3. Ces droites sont-elles perpendiculaires ?$$, 'solution', $$a×a′ = 4×(−0,25) = −1, donc (D) et (D′) sont perpendiculaires.$$),
        'fixation', jsonb_build_object('question', $$(D): y=−2x+3 et (D′): x−2y+2=0. Ces droites sont-elles perpendiculaires ?$$, 'solution', $$(D′) : −2y=−x−2, donc y=0,5x+1. a×a′ = (−2)×0,5 = −1, donc les droites sont perpendiculaires.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un géomètre vérifie le tracé d'un lotissement. Dans un repère (O,I,J) où l'unité représente 10 mètres, l'allée (D1) passe par les points R(0;4) et S(6;1), et l'allée (D2) passe par les points T(0;1) et U(4;3).$$,
      'questions', array[
        $$Détermine l'équation réduite de l'allée (D1) passant par R et S.$$,
        $$Détermine l'équation réduite de l'allée (D2) passant par T et U.$$,
        $$Le cahier des charges impose que ces deux allées soient perpendiculaires. Cette condition est-elle respectée ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une équation peut-elle s'écrire xy+3x−2=0 pour une droite ? Justifie.$$,
      'hint', $$Relis la propriété : une équation de droite est de la forme ax+by+c=0, sans terme en xy.$$,
      'expected', $$Non, car le terme xy n'est pas de la forme ax+by+c=0 : ce n'est pas l'équation d'une droite.$$
    ),
    jsonb_build_object(
      'question', $$A(−1;3) et B(3;−5). Détermine une équation de la droite (AB).$$,
      'hint', $$Utilise la colinéarité de AM et AB pour un point M(x;y).$$,
      'expected', $$AB(4;−8). M(x;y)∈(AB) équivaut à 4(y−3)−(−8)(x+1)=0, soit 4y−12+8x+8=0, soit 8x+4y−4=0, soit 2x+y−1=0.$$
    ),
    jsonb_build_object(
      'question', $$Une droite (D) a pour équation 5x−y+2=0. Détermine son coefficient directeur et son ordonnée à l'origine.$$,
      'hint', $$Mets l'équation sous la forme y=Ax+B.$$,
      'expected', $$−y=−5x−2, donc y=5x+2. Le coefficient directeur est 5, l'ordonnée à l'origine est 2.$$
    ),
    jsonb_build_object(
      'question', $$(D): 2x+4y−8=0 et (D′): y=−0,5x+3. Ces deux droites sont-elles parallèles, perpendiculaires, ou ni l'un ni l'autre ?$$,
      'hint', $$Mets (D) sous la forme y=ax+b et compare les coefficients directeurs.$$,
      'expected', $$(D): 4y=−2x+8, donc y=−0,5x+2. (D) et (D′) ont toutes deux le coefficient directeur −0,5 : elles sont parallèles.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-equations-droites';
