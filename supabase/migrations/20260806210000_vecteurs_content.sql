-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 7: Vecteurs" programme
-- document, but every sentence, example and exercise is an original
-- rewrite. Diagram: a generic Chasles triangle (own coordinates/labels, not
-- the source's parallelogram/drone figure).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur un jeu vidéo de gestion de drones, l'écran affiche le déplacement d'un drone sous la forme d'une égalité vectorielle : DM⃗ = BF⃗ + 2·DA⃗ − 2·BD⃗ − FB⃗, où D, M, A, B et F sont des points repérés sur la carte. Un joueur affirme que les trajectoires (DM) et (AF) sont parallèles. Son coéquipier n'est pas convaincu, et ils décident de vérifier cette affirmation grâce aux propriétés des vecteurs.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractéristiques d'un vecteur$$,
        'body', $$Un vecteur AB est déterminé par trois éléments indissociables : la droite qui le porte, le sens dans lequel on le parcourt, et la distance entre ses deux extrémités. Changer un seul de ces trois éléments donne un vecteur différent.$$,
        'highlights', array[$$direction$$, $$sens$$, $$longueur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un vecteur AB est caractérisé par sa direction (la droite (AB)), son sens (de A vers B) et sa longueur (la distance AB). Le vecteur BA est l'opposé du vecteur AB : on note AB = −BA.$$),
        'example', jsonb_build_object('statement', $$Les vecteurs PQ et RS ont la même direction, le même sens et la même longueur. Que peut-on en conclure ?$$, 'solution', $$Comme les trois caractéristiques coïncident, les vecteurs PQ et RS sont égaux.$$),
        'fixation', jsonb_build_object('question', $$Les vecteurs UV et VU ont-ils la même direction ? le même sens ? Que peut-on dire de leur relation ?$$, 'solution', $$Ils ont la même direction mais des sens opposés : UV est l'opposé de VU, donc UV = −VU.$$)
      ),
      jsonb_build_object(
        'heading', $$Somme de vecteurs : la relation de Chasles$$,
        'body', $$Pour additionner deux vecteurs placés bout à bout, on peut directement écrire le vecteur qui va du point de départ du premier au point d'arrivée du second, sans calcul supplémentaire. C'est la relation de Chasles, l'outil le plus utilisé pour manipuler des sommes de vecteurs.$$,
        'highlights', array[$$relation de Chasles$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tous points A, B et C du plan : AB + BC = AC.$$),
        'example', jsonb_build_object('statement', $$Simplifie l'écriture PQ + QR + RS.$$, 'solution', $$PQ + QR = PR (Chasles), puis PR + RS = PS (Chasles). Donc PQ + QR + RS = PS.$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture MN + NO.$$, 'solution', $$D'après la relation de Chasles, MN + NO = MO.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(220, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 30, 'y', 150, 'label', $$A$$),
            jsonb_build_object('x', 120, 'y', 60, 'label', $$B$$),
            jsonb_build_object('x', 190, 'y', 150, 'label', $$C$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Différence de deux vecteurs$$,
        'body', $$Soustraire un vecteur revient à ajouter son opposé. Cette astuce permet, combinée à la relation de Chasles, de réduire n'importe quelle somme ou différence de vecteurs à un seul vecteur.$$,
        'highlights', array[$$différence$$, $$opposé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tous points A, B, C et D du plan : AB − CD = AB + DC.$$),
        'example', jsonb_build_object('statement', $$Simplifie l'écriture RS − TS.$$, 'solution', $$RS − TS = RS + ST (car −TS = ST) = RT (Chasles).$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture GH − IH.$$, 'solution', $$GH − IH = GH + HI (car −IH = HI) = GI (Chasles).$$)
      ),
      jsonb_build_object(
        'heading', $$Produit d'un vecteur par un nombre réel$$,
        'body', $$Multiplier un vecteur par un nombre k change sa longueur (multipliée par la valeur absolue de k) et, selon le signe de k, conserve ou inverse son sens, sans jamais changer sa direction.$$,
        'highlights', array[$$produit d'un vecteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le produit du vecteur AB (non nul) par le réel k (non nul) est le vecteur MN tel que (MN) a la même direction que (AB), MN et AB ont le même sens si k>0 (sens contraires si k<0), et MN = |k|×AB.$$),
        'example', jsonb_build_object('statement', $$Simplifie l'écriture 3(2·AB).$$, 'solution', $$3(2·AB) = (3×2)·AB = 6·AB.$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture −4AB + 6AB.$$, 'solution', $$−4AB + 6AB = (−4+6)·AB = 2·AB.$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs colinéaires$$,
        'body', $$Deux vecteurs sont colinéaires lorsqu'ils ont la même direction — autrement dit, quand on peut écrire l'un comme le produit de l'autre par un nombre réel. Cette notion permet de démontrer qu'un point appartient à une droite, sans avoir à tracer quoi que ce soit.$$,
        'highlights', array[$$colinéaires$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les vecteurs AB et CD sont colinéaires lorsqu'ils ont la même direction, ou lorsque l'un des deux est nul, ce qui équivaut à trouver un réel k tel que AB = k·CD. De plus, un point M appartient à la droite (AB) si et seulement si les vecteurs AM et AB sont colinéaires.$$),
        'example', jsonb_build_object('statement', $$On donne AB = 4·CD. Que peut-on dire des droites (AB) et (CD) ?$$, 'solution', $$AB et CD sont colinéaires, donc les droites (AB) et (CD) ont la même direction : elles sont parallèles (ou confondues).$$),
        'fixation', jsonb_build_object('question', $$On donne AM = −2·AB, où A, M et B sont des points du plan. Que peut-on en déduire pour le point M ?$$, 'solution', $$AM et AB sont colinéaires, donc M appartient à la droite (AB).$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs directeurs et vecteurs orthogonaux$$,
        'body', $$Un vecteur directeur d'une droite indique simplement la direction de cette droite. Deux vecteurs sont dits orthogonaux quand les droites qu'ils dirigent sont perpendiculaires — une façon vectorielle d'exprimer une perpendicularité.$$,
        'highlights', array[$$vecteur directeur$$, $$orthogonaux$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un vecteur non nul AB est un vecteur directeur d'une droite (D) lorsque (AB) est parallèle à (D). Deux vecteurs non nuls sont orthogonaux lorsqu'ils dirigent deux droites perpendiculaires.$$),
        'example', jsonb_build_object('statement', $$Les droites (AB) et (CD) sont perpendiculaires. Que peut-on dire des vecteurs AB et CD ?$$, 'solution', $$Comme (AB) et (CD) sont perpendiculaires, les vecteurs AB et CD sont orthogonaux.$$),
        'fixation', jsonb_build_object('question', $$Un vecteur directeur d'une droite (D) est EF. Un vecteur GH est orthogonal à EF. Que peut-on dire des droites (D) et (GH) ?$$, 'solution', $$Comme GH est orthogonal à EF, qui dirige (D), la droite (GH) est perpendiculaire à (D).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un urbaniste trace sur un plan un parallélogramme ABCD. Il ajoute un point P tel que AP⃗ = BA⃗, puis un point Q tel que CQ⃗ = BC⃗. Un collègue affirme que le point D est le milieu du segment [PQ].$$,
      'questions', array[
        $$Exprime le vecteur PD à l'aide des vecteurs PA et AD, puis simplifie-le à l'aide de la relation de Chasles et des données du parallélogramme.$$,
        $$Exprime de la même façon le vecteur DQ, puis simplifie-le.$$,
        $$Les deux résultats obtenus permettent-ils de confirmer l'affirmation du collègue ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Simplifie l'écriture AB + BC + CD.$$,
      'hint', $$Applique deux fois la relation de Chasles.$$,
      'expected', $$AB+BC=AC (Chasles), puis AC+CD=AD (Chasles). Donc AB+BC+CD = AD.$$
    ),
    jsonb_build_object(
      'question', $$Simplifie l'écriture MN − PN.$$,
      'hint', $$Transforme la différence en somme grâce à l'opposé, puis applique Chasles.$$,
      'expected', $$MN − PN = MN + NP (car −PN = NP) = MP (Chasles).$$
    ),
    jsonb_build_object(
      'question', $$Simplifie l'écriture −5AB + 2AB.$$,
      'hint', $$Regroupe les coefficients d'un même vecteur.$$,
      'expected', $$−5AB + 2AB = (−5+2)AB = −3AB.$$
    ),
    jsonb_build_object(
      'question', $$On donne AM = 3·AB, où A, M et B sont des points du plan. Que peut-on en déduire sur la position du point M ? Justifie à l'aide de la notion de vecteurs colinéaires.$$,
      'hint', $$Relis la propriété : M appartient à (AB) si et seulement si AM et AB sont colinéaires.$$,
      'expected', $$AM et AB sont colinéaires (AM=3·AB), donc M appartient à la droite (AB).$$
    )
  ),
  content_generated_at = now()
where id = 'maths-vecteurs';
