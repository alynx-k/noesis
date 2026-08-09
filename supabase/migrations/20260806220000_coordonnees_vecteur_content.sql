-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 9: Coordonnées d'un
-- vecteur" programme document, but every sentence, example and exercise is
-- an original rewrite. Diagram: a generic vector built from its (a;b)
-- components against an (O,I,J) frame (own coordinates/values, not the
-- source's A(0;2)/AB(2;-3) example).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une application de covoiturage affiche le trajet d'un chauffeur sous forme de points GPS simplifiés O, A, B et C, reliés par des vecteurs OA, AB et BC sur un repère du quartier. Les passagers veulent connaître la distance totale parcourue entre le départ O et l'arrivée C, mais aussi vérifier si deux portions du trajet sont parallèles, pour éviter un détour inutile.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Repère du plan$$,
        'body', $$Pour repérer un point ou un vecteur de façon précise, on choisit trois points non alignés O, I et J : O est l'origine, (OI) sert d'axe des abscisses et (OJ) d'axe des ordonnées. Selon les angles et les longueurs choisis, on obtient différents types de repères.$$,
        'highlights', array[$$repère$$, $$origine$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un repère du plan est un triplet (O, I, J) de points non alignés. Il est orthogonal si (OI) et (OJ) sont perpendiculaires, et orthonormé s'il est en plus orthogonal avec OI = OJ.$$),
        'example', jsonb_build_object('statement', $$Dans un repère (O,I,J), on a (OI)⊥(OJ) et OI=OJ=1 cm. Quel type de repère est-ce ?$$, 'solution', $$Comme les deux axes sont perpendiculaires et de même longueur, c'est un repère orthonormé.$$),
        'fixation', jsonb_build_object('question', $$Dans un repère (O,I,J), on a (OI)⊥(OJ) mais OI≠OJ. Quel type de repère est-ce ?$$, 'solution', $$Comme les axes sont perpendiculaires mais de longueurs différentes, c'est un repère orthogonal (non orthonormé).$$)
      ),
      jsonb_build_object(
        'heading', $$Coordonnées d'un point$$,
        'body', $$Dans un repère, chaque point du plan est associé à un unique couple de nombres réels (x;y) : x est l'abscisse, y est l'ordonnée. Deux couples ne sont égaux que si leurs deux termes coïncident chacun.$$,
        'highlights', array[$$abscisse$$, $$ordonnée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les couples (x;y) et (x′;y′) sont égaux si et seulement si x=x′ et y=y′.$$),
        'example', jsonb_build_object('statement', $$Détermine x et y pour que (x+2;5) et (7;y−1) soient égaux.$$, 'solution', $$x+2=7 donc x=5, et 5=y−1 donc y=6.$$),
        'fixation', jsonb_build_object('question', $$Détermine x et y pour que (3x;−4) et (9;2y+2) soient égaux.$$, 'solution', $$3x=9 donc x=3, et −4=2y+2 donc y=−3.$$)
      ),
      jsonb_build_object(
        'heading', $$Coordonnées d'un vecteur$$,
        'body', $$Le couple de coordonnées d'un vecteur AB est le couple (x;y) tel que AB = x·OI + y·OJ. Pour construire un vecteur à partir de ses coordonnées, on avance de x unités horizontalement puis de y unités verticalement depuis son origine.$$,
        'highlights', array[$$couple de coordonnées$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$AB(x;y) signifie AB = x·OI + y·OJ. Le vecteur nul a pour coordonnées (0;0).$$),
        'example', jsonb_build_object('statement', $$AB = 3·OI − 2·OJ. Donne le couple de coordonnées de AB.$$, 'solution', $$AB(3;−2).$$),
        'fixation', jsonb_build_object('question', $$CD = −5·OJ. Donne le couple de coordonnées de CD.$$, 'solution', $$CD(0;−5).$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(160, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 30, 'y', 160, 'label', $$O$$),
            jsonb_build_object('x', 55, 'y', 160, 'label', $$I$$),
            jsonb_build_object('x', 30, 'y', 135, 'label', $$J$$),
            jsonb_build_object('x', 30, 'y', 60, 'label', $$A$$),
            jsonb_build_object('x', 105, 'y', 60, 'label', $$C$$),
            jsonb_build_object('x', 105, 'y', 110, 'label', $$B$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2), jsonb_build_array(3,4), jsonb_build_array(4,5)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(3,5))
        )
      ),
      jsonb_build_object(
        'heading', $$Somme et produit d'un vecteur par un réel, en coordonnées$$,
        'body', $$Pour additionner deux vecteurs donnés par leurs coordonnées, il suffit d'additionner les abscisses entre elles et les ordonnées entre elles. Pour multiplier un vecteur par un nombre k, on multiplie chacune de ses deux coordonnées par k.$$,
        'highlights', array[$$somme$$, $$produit$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si AB(x;y) et A′B′(x′;y′), alors (AB+A′B′)(x+x′;y+y′). Et pour tout réel k, k·AB(kx;ky).$$),
        'example', jsonb_build_object('statement', $$AB(4;−1) et CD(−3;5). Calcule les coordonnées de AB+CD, puis de 2·AB.$$, 'solution', $$AB+CD (4−3;−1+5) = (1;4). 2·AB (2×4;2×(−1)) = (8;−2).$$),
        'fixation', jsonb_build_object('question', $$AB(−2;6) et CD(5;−3). Calcule les coordonnées de AB+CD, puis de −3·AB.$$, 'solution', $$AB+CD (−2+5;6−3) = (3;3). −3·AB (−3×(−2);−3×6) = (6;−18).$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs colinéaires et vecteurs orthogonaux$$,
        'body', $$En coordonnées, on peut tester la colinéarité et l'orthogonalité de deux vecteurs par un simple calcul, sans avoir à tracer la moindre figure.$$,
        'highlights', array[$$colinéaires$$, $$orthogonaux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$AB(x;y) et A′B′(x′;y′) sont colinéaires si et seulement si xy′−x′y=0. Dans un repère orthonormé, ils sont orthogonaux si et seulement si xx′+yy′=0.$$),
        'example', jsonb_build_object('statement', $$AB(4;6) et CD(−2;−3). Les vecteurs sont-ils colinéaires ?$$, 'solution', $$xy′−x′y = 4×(−3)−(−2)×6 = −12+12 = 0, donc AB et CD sont colinéaires.$$),
        'fixation', jsonb_build_object('question', $$AB(3;4) et CD(−4;3). Les vecteurs sont-ils orthogonaux ?$$, 'solution', $$xx′+yy′ = 3×(−4)+4×3 = −12+12 = 0, donc AB et CD sont orthogonaux.$$)
      ),
      jsonb_build_object(
        'heading', $$Calculs dans un repère : vecteur, milieu, distance$$,
        'body', $$Connaissant seulement les coordonnées de deux points, on peut retrouver directement les coordonnées du vecteur qui les relie, celles du milieu du segment qu'ils forment, et même la distance qui les sépare.$$,
        'highlights', array[$$milieu$$, $$distance$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si A(x;y) et B(x′;y′), alors AB(x′−x;y′−y), le milieu K de [AB] a pour coordonnées ((x+x′)/2;(y+y′)/2), et dans un repère orthonormé, AB = √((x′−x)²+(y′−y)²).$$),
        'example', jsonb_build_object('statement', $$A(1;−2) et B(5;4). Calcule les coordonnées de AB, du milieu K de [AB], puis la distance AB.$$, 'solution', $$AB(5−1;4−(−2)) = (4;6). K((1+5)/2;(−2+4)/2) = (3;1). AB = √(4²+6²) = √52.$$),
        'fixation', jsonb_build_object('question', $$A(−3;2) et B(1;−1). Calcule les coordonnées de AB, du milieu K de [AB], puis la distance AB.$$, 'solution', $$AB(1−(−3);−1−2) = (4;−3). K((−3+1)/2;(2−1)/2) = (−1;0,5). AB = √(4²+(−3)²) = √25 = 5.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un repère (O,I,J), un urbaniste place quatre bornes du futur parc : A(2;1), B(−1;3), C(−4;−1) et un point F(6;5). Le point E est le symétrique de A par rapport à B. L'urbaniste veut savoir si les allées (CF) et (EA) seront parallèles, pour éviter deux allées qui se croisent inutilement.$$,
      'questions', array[
        $$Justifie que le point E a pour coordonnées (−4;5).$$,
        $$Détermine les coordonnées des vecteurs CF et EA.$$,
        $$Les allées (CF) et (EA) seront-elles parallèles ? Justifie à l'aide de la colinéarité.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Détermine x et y pour que les couples (x−1;6) et (5;y+3) soient égaux.$$,
      'hint', $$Utilise l'égalité de couples : les deux abscisses sont égales, les deux ordonnées sont égales.$$,
      'expected', $$x−1=5 donc x=6, et 6=y+3 donc y=3.$$
    ),
    jsonb_build_object(
      'question', $$On donne AB(−2;5) et CD(6;1). Calcule les coordonnées du vecteur AB+CD, puis de 3·CD.$$,
      'hint', $$Additionne les abscisses entre elles et les ordonnées entre elles ; pour le produit, multiplie chaque coordonnée par le réel.$$,
      'expected', $$AB+CD (−2+6;5+1) = (4;6). 3·CD (3×6;3×1) = (18;3).$$
    ),
    jsonb_build_object(
      'question', $$Dans un repère orthonormé, on donne AB(5;−2) et CD(2;5). Les vecteurs sont-ils orthogonaux ?$$,
      'hint', $$Calcule xx′+yy′ ; s'il vaut 0, les vecteurs sont orthogonaux.$$,
      'expected', $$xx′+yy′ = 5×2+(−2)×5 = 10−10 = 0, donc AB et CD sont orthogonaux.$$
    ),
    jsonb_build_object(
      'question', $$On donne A(2;5) et B(−4;1). Calcule les coordonnées du vecteur AB, du milieu K de [AB], puis la distance AB.$$,
      'hint', $$Utilise les formules : AB(xB−xA;yB−yA), K((xA+xB)/2;(yA+yB)/2), AB=√((xB−xA)²+(yB−yA)²).$$,
      'expected', $$AB(−4−2;1−5) = (−6;−4). K((2−4)/2;(5+1)/2) = (−1;3). AB = √((−6)²+(−4)²) = √52.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-coordonnees-vecteur';
