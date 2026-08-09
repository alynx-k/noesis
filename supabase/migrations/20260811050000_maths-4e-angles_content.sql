-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths leçon 2 Angles"
-- (Collège Numérique, Thème "Configurations du plan", Leçon 2, course id
-- 1994, resource id 16224, downloaded from coll.ecole-ci.org and read
-- directly). NOTE: an earlier pass in this catalog was believed to have
-- already grounded this file in a real source, but on inspection the file
-- still carried the original fallback content (complémentaire/
-- supplémentaire/opposés par le sommet/bissectrice) — a different topic
-- set from what the real PDF actually covers (angles alternes-internes,
-- angles correspondants, angle au centre, arcs et cordes). Redone here
-- from the real PDF for correctness. Every sentence, example and exercise
-- below is an original composition in our own wording — no sentence is
-- copied verbatim from the source PDF. Diagrams: a generic pair of
-- parallel lines cut by a transversal (alternes-internes/correspondants),
-- and a generic circle with an angle au centre, own coordinates.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour le logo du club de mathématiques de son collège, une élève de 4ème propose un motif fait d'un cercle et de plusieurs droites : deux droites parallèles, et une sécante qui les coupe toutes les deux. Le meilleur élève de la classe affirme qu'à l'intérieur de cette figure, plusieurs angles ont exactement la même mesure qu'un angle donné. Ses camarades se lancent alors dans une recherche méthodique pour retrouver tous ces angles égaux.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Angles alternes-internes$$,
        'body', $$Quand une sécante coupe deux droites en deux points distincts, elle forme quatre angles en chaque point. Deux de ces angles, situés entre les deux droites mais de part et d'autre de la sécante, sont appelés angles alternes-internes. Si les deux droites sont parallèles, ces angles ont toujours la même mesure — et réciproquement, deux angles alternes-internes égaux prouvent que les droites sont parallèles.$$,
        'highlights', array[$$angles alternes-internes$$]::text[],
        'property', jsonb_build_object('label', $$Propriété et réciproque$$, 'text', $$Si deux angles alternes-internes sont formés par deux droites parallèles et une sécante, alors ils ont la même mesure. Réciproquement, si deux droites forment avec une sécante deux angles alternes-internes de même mesure, alors ces deux droites sont parallèles.$$),
        'example', jsonb_build_object('statement', $$Les droites (AE) et (KI) sont parallèles ; la droite (OM) les coupe respectivement en O et M. Que peut-on dire des angles AOM et OMI, alternes-internes ?$$, 'solution', $$Comme (AE) et (KI) sont parallèles et que AOM et OMI sont alternes-internes formés par la sécante (OM), ces deux angles ont la même mesure.$$),
        'fixation', jsonb_build_object('question', $$Deux droites (D) et (L) sont coupées par une sécante en A et B. Les angles EAB et ABF, alternes-internes, ont la même mesure. Que peut-on en conclure sur (D) et (L) ?$$, 'solution', $$Deux angles alternes-internes de même mesure prouvent que les droites (D) et (L) sont parallèles.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 20, 'y', 50, 'label', $$D1$$),
            jsonb_build_object('x', 180, 'y', 50, 'label', $$$$),
            jsonb_build_object('x', 20, 'y', 130, 'label', $$D2$$),
            jsonb_build_object('x', 180, 'y', 130, 'label', $$$$),
            jsonb_build_object('x', 70, 'y', 50, 'label', $$A$$),
            jsonb_build_object('x', 130, 'y', 130, 'label', $$B$$),
            jsonb_build_object('x', 40, 'y', 10, 'label', $$$$),
            jsonb_build_object('x', 160, 'y', 170, 'label', $$$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(2,3), jsonb_build_array(6,7))
        )
      ),
      jsonb_build_object(
        'heading', $$Angles correspondants$$,
        'body', $$Deux angles sont dits correspondants quand ils occupent la même position par rapport à la sécante et à leur droite respective (par exemple, tous deux « en haut à droite » de leur point d'intersection). Comme pour les angles alternes-internes, deux droites parallèles coupées par une sécante donnent des angles correspondants de même mesure, et la réciproque est vraie aussi.$$,
        'highlights', array[$$angles correspondants$$]::text[],
        'property', jsonb_build_object('label', $$Propriété et réciproque$$, 'text', $$Si deux angles correspondants sont formés par deux droites parallèles et une sécante, alors ils ont la même mesure. Réciproquement, si deux droites forment avec une sécante deux angles correspondants de même mesure, alors ces deux droites sont parallèles.$$),
        'example', jsonb_build_object('statement', $$Les droites (AB) et (DF) sont parallèles et coupées par la sécante (BD). L'angle BDF mesure 68°. Que vaut l'angle correspondant HBG ?$$, 'solution', $$Comme (AB) et (DF) sont parallèles, l'angle correspondant HBG a la même mesure que BDF, donc HBG mesure 68°.$$),
        'fixation', jsonb_build_object('question', $$Une sécante coupe deux droites (D) et (L) en A et B, formant deux angles correspondants KAB et TBH de même mesure. Que peut-on en déduire sur (D) et (L) ?$$, 'solution', $$Deux angles correspondants de même mesure prouvent que les droites (D) et (L) sont parallèles.$$)
      ),
      jsonb_build_object(
        'heading', $$Angle au centre et arc intercepté$$,
        'body', $$Dans un cercle, un angle au centre est un angle dont le sommet est le centre du cercle. Un tel angle « intercepte » un arc de cercle, c'est-à-dire la portion du cercle comprise entre ses deux côtés. La longueur de cet arc est proportionnelle à la mesure de l'angle au centre qui l'intercepte.$$,
        'highlights', array[$$angle au centre$$, $$arc intercepté$$]::text[],
        'property', jsonb_build_object('label', $$Définition et formule$$, 'text', $$Un angle au centre a pour sommet le centre du cercle. Pour un cercle de rayon r, la longueur de l'arc intercepté par un angle au centre de mesure m (en degrés) vaut : longueur = π×r×(m/180°).$$),
        'example', jsonb_build_object('statement', $$Un cercle de centre O a un rayon de 3 cm. A et B sont deux points du cercle tels que l'angle AOB mesure 60°. Calcule la longueur de l'arc AB (on prendra π ≈ 3,14).$$, 'solution', $$Longueur AB = 3×3,14×(60/180) = 3×3,14×(1/3) = 3,14 cm.$$),
        'fixation', jsonb_build_object('question', $$Un cercle de centre O a un rayon de 5 cm. Un angle au centre mesure 90°. Calcule la longueur de l'arc intercepté (π ≈ 3,14).$$, 'solution', $$Longueur = 5×3,14×(90/180) = 5×3,14×0,5 = 7,85 cm.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'circle', jsonb_build_object('cx', 100, 'cy', 100, 'r', 70),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 100, 'label', $$O$$),
            jsonb_build_object('x', 170, 'y', 100, 'label', $$A$$),
            jsonb_build_object('x', 135, 'y', 39, 'label', $$B$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Cordes et arcs de même longueur$$,
        'body', $$Une corde d'un cercle est un segment reliant deux points du cercle. Il existe un lien direct entre deux angles au centre de même mesure, les arcs qu'ils interceptent et les cordes qui sous-tendent ces arcs : les trois notions « avancent ensemble ».$$,
        'highlights', array[$$corde$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Dans un même cercle : si deux angles au centre ont la même mesure, alors ils interceptent deux arcs de même longueur, et les cordes qui sous-tendent ces arcs ont aussi la même longueur (et réciproquement dans chaque cas).$$),
        'example', jsonb_build_object('statement', $$Dans un cercle de centre O, les angles au centre AOB et COD ont la même mesure. Que peut-on dire des cordes [AB] et [CD] ?$$, 'solution', $$Deux angles au centre de même mesure interceptent des arcs de même longueur, sous-tendus par des cordes de même longueur : donc AB = CD.$$),
        'fixation', jsonb_build_object('question', $$Dans un cercle de centre E, les cordes [IJ] et [KS] ont la même longueur. Que peut-on dire des angles au centre IEJ et KES ?$$, 'solution', $$Des cordes de même longueur sous-tendent des arcs de même longueur, interceptés par des angles au centre de même mesure : donc les angles IEJ et KES ont la même mesure.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur le motif du logo, O est le centre du cercle ; les droites (AC) et (FD) sont parallèles, tout comme les droites (OF) et (CE). Le meilleur élève affirme que plusieurs angles de la figure ont la même mesure que l'angle AOF.$$,
      'questions', array[
        $$Nomme un angle opposé par le sommet à l'angle AOF, et justifie pourquoi il a la même mesure.$$,
        $$Nomme un angle correspondant à AOF, formé par les parallèles (OF) et (CE) avec une sécante commune, et justifie l'égalité des mesures.$$,
        $$Nomme un angle alterne-interne à AOF, formé par les parallèles (AC) et (FD), et justifie l'égalité des mesures.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Deux droites parallèles (D1) et (D2) sont coupées par une sécante. Deux angles alternes-internes sont formés, et l'un mesure 74°. Calcule la mesure de l'autre.$$,
      'hint', $$Relis la propriété : deux angles alternes-internes formés par des droites parallèles ont la même mesure.$$,
      'expected', $$Comme les droites sont parallèles, les angles alternes-internes sont égaux : l'autre mesure aussi 74°.$$
    ),
    jsonb_build_object(
      'question', $$Deux droites parallèles sont coupées par une sécante. Deux angles correspondants sont formés, et l'un mesure 105°. Calcule la mesure de l'autre.$$,
      'hint', $$Relis la propriété des angles correspondants formés par des droites parallèles.$$,
      'expected', $$Comme les droites sont parallèles, les angles correspondants sont égaux : l'autre mesure aussi 105°.$$
    ),
    jsonb_build_object(
      'question', $$Un cercle de centre O a un rayon de 4 cm. Un angle au centre mesure 45°. Calcule la longueur de l'arc intercepté (π ≈ 3,14).$$,
      'hint', $$Utilise la formule : longueur = π×r×(mesure de l'angle/180°).$$,
      'expected', $$Longueur = 4×3,14×(45/180) = 4×3,14×0,25 = 3,14 cm.$$
    ),
    jsonb_build_object(
      'question', $$Dans un cercle de centre O, les cordes [MN] et [PQ] ont la même longueur. Compare les angles au centre MON et POQ, puis les arcs MN et PQ, et justifie chaque comparaison.$$,
      'hint', $$Relis les propriétés reliant cordes, arcs et angles au centre de même mesure.$$,
      'expected', $$Des cordes de même longueur sous-tendent des arcs de même longueur, eux-mêmes interceptés par des angles au centre de même mesure. Donc MON = POQ et les arcs MN et PQ ont la même longueur.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-angles';
