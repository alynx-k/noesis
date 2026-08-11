-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- complements the official Ivorian Seconde A programme (Compétence 3:
-- Configurations géométriques et transformations du plan — Vecteurs) with
-- original, general-knowledge content adapted to the série A (littéraire)
-- level: the three characteristics of a vector, equal vectors, the
-- relation de Chasles, the difference of two vectors, the product of a
-- vector by a real number, and colinear vectors. No source PDF was
-- available for this topic; entirely original wording, examples and
-- exercises, with an own-coordinates diagram for the relation de Chasles.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-vecteurs-du-plan',
  '2nde',
  'A',
  'mathematiques',
  $$Vecteurs du plan$$,
  8,
  '2nde-a-maths-statistiques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur une carte de randonnée, un guide indique le déplacement d'un groupe par une égalité entre translations : le trajet du village V au campement C est décrit comme équivalent au trajet du point A au point B, suivi du trajet du point B au point D. Un randonneur se demande comment vérifier, sans refaire toute la marche, que ces deux descriptions correspondent bien au même déplacement global. Les vecteurs permettent justement de manipuler des déplacements sans avoir à les parcourir.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractéristiques d'un vecteur$$,
        'body', $$Un vecteur AB représente un déplacement du point A vers le point B. Il est entièrement déterminé par trois éléments : sa direction (la droite (AB)), son sens (de A vers B), et sa norme, c'est-à-dire la longueur AB. Deux vecteurs sont égaux lorsque ces trois caractéristiques coïncident.$$,
        'highlights', array[$$direction$$, $$sens$$, $$norme$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le vecteur AB est caractérisé par sa direction (la droite (AB)), son sens (de A vers B) et sa norme (la longueur AB, notée ‖AB‖). Le vecteur BA a la même direction et la même norme que AB, mais un sens opposé : BA = −AB.$$),
        'example', jsonb_build_object('statement', $$Les vecteurs EF et GH ont la même direction, le même sens et la même norme. Que peut-on en conclure ?$$, 'solution', $$Comme leurs trois caractéristiques coïncident, les vecteurs EF et GH sont égaux : EF = GH.$$),
        'fixation', jsonb_build_object('question', $$Les vecteurs KL et LK ont-ils la même direction ? le même sens ?$$, 'solution', $$Ils ont la même direction (la droite (KL)) mais des sens opposés : LK est l'opposé de KL, donc LK = −KL.$$)
      ),
      jsonb_build_object(
        'heading', $$Somme de vecteurs : la relation de Chasles$$,
        'body', $$Quand deux vecteurs sont placés bout à bout, leur somme se lit directement : c'est le vecteur qui va du point de départ du premier vecteur au point d'arrivée du second. Cette règle, appelée relation de Chasles, simplifie considérablement l'écriture des sommes de vecteurs.$$,
        'highlights', array[$$relation de Chasles$$, $$somme de vecteurs$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tous points A, B et C du plan : AB + BC = AC.$$),
        'example', jsonb_build_object('statement', $$Simplifie l'écriture VA + AC + CD.$$, 'solution', $$VA + AC = VC (Chasles), puis VC + CD = VD (Chasles). Donc VA + AC + CD = VD.$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture PQ + QR.$$, 'solution', $$D'après la relation de Chasles, PQ + QR = PR.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(240, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 20, 'y', 130, 'label', $$V$$),
            jsonb_build_object('x', 110, 'y', 30, 'label', $$A$$),
            jsonb_build_object('x', 210, 'y', 130, 'label', $$C$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Différence de deux vecteurs$$,
        'body', $$Soustraire un vecteur revient à ajouter son opposé. En combinant cette idée avec la relation de Chasles, on peut réduire n'importe quelle différence de vecteurs à un seul vecteur reliant deux points.$$,
        'highlights', array[$$différence de vecteurs$$, $$opposé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tous points A, B, C et D du plan : AB − CD = AB + DC.$$),
        'example', jsonb_build_object('statement', $$Simplifie l'écriture MN − PN.$$, 'solution', $$MN − PN = MN + NP (car −PN = NP) = MP (Chasles).$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture RS − TS.$$, 'solution', $$RS − TS = RS + ST (car −TS = ST) = RT (Chasles).$$)
      ),
      jsonb_build_object(
        'heading', $$Produit d'un vecteur par un réel$$,
        'body', $$Multiplier un vecteur non nul par un nombre réel k modifie sa norme (multipliée par la valeur absolue de k), conserve sa direction, et conserve ou inverse son sens selon que k est positif ou négatif.$$,
        'highlights', array[$$produit d'un vecteur par un réel$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Pour AB non nul et k réel non nul, le vecteur k·AB a la même direction que AB, le même sens si k>0 (un sens opposé si k<0), et une norme égale à |k|×‖AB‖.$$),
        'example', jsonb_build_object('statement', $$Simplifie l'écriture 4(3·AB).$$, 'solution', $$4(3·AB) = (4×3)·AB = 12·AB.$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture −5AB + 8AB.$$, 'solution', $$−5AB + 8AB = (−5+8)·AB = 3·AB.$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs colinéaires$$,
        'body', $$Deux vecteurs non nuls sont colinéaires lorsqu'ils ont la même direction, autrement dit lorsqu'on peut écrire l'un comme le produit de l'autre par un réel. Cette notion sert notamment à démontrer qu'un point appartient à une droite, ou que deux droites sont parallèles, sans avoir besoin de les tracer.$$,
        'highlights', array[$$vecteurs colinéaires$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les vecteurs AB et CD sont colinéaires lorsque l'un des deux est nul, ou lorsqu'il existe un réel k tel que AB = k·CD. Un point M appartient à la droite (AB) si et seulement si les vecteurs AM et AB sont colinéaires.$$),
        'example', jsonb_build_object('statement', $$On donne EF = 3·GH. Que peut-on dire des droites (EF) et (GH) ?$$, 'solution', $$EF et GH sont colinéaires, donc les droites (EF) et (GH) ont la même direction : elles sont parallèles (ou confondues).$$),
        'fixation', jsonb_build_object('question', $$On donne AM = −3·AB, où A, M et B sont des points du plan. Que peut-on en déduire pour le point M ?$$, 'solution', $$AM et AB sont colinéaires (AM = −3·AB), donc M appartient à la droite (AB).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur un plan de quartier, ABCD est un parallélogramme. On place un point P tel que AP⃗ = DA⃗, puis un point Q tel que CQ⃗ = DC⃗. Un urbaniste affirme que le point D est le milieu du segment [PQ], ce qui simplifierait le tracé d'une nouvelle route reliant P à Q en passant par D.$$,
      'questions', array[
        $$Exprime le vecteur PD à l'aide des vecteurs PA et AD, puis simplifie-le à l'aide de la relation de Chasles et des propriétés du parallélogramme ABCD.$$,
        $$Exprime de la même façon le vecteur DQ, puis simplifie-le.$$,
        $$Les deux résultats obtenus confirment-ils l'affirmation de l'urbaniste ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Simplifie l'écriture AB + BC + CD.$$,
      'hint', $$Applique deux fois la relation de Chasles.$$,
      'expected', $$AB+BC=AC (Chasles), puis AC+CD=AD (Chasles). Donc AB+BC+CD = AD.$$
    ),
    jsonb_build_object(
      'question', $$Simplifie l'écriture UV − WV.$$,
      'hint', $$Transforme la différence en somme grâce à l'opposé, puis applique la relation de Chasles.$$,
      'expected', $$UV − WV = UV + VW (car −WV = VW) = UW (Chasles).$$
    ),
    jsonb_build_object(
      'question', $$Simplifie l'écriture 7AB − 2AB.$$,
      'hint', $$Regroupe les coefficients d'un même vecteur.$$,
      'expected', $$7AB − 2AB = (7−2)AB = 5AB.$$
    ),
    jsonb_build_object(
      'question', $$On donne AM = 4·AB, où A, M et B sont des points du plan. Que peut-on en déduire sur la position du point M ? Justifie à l'aide de la notion de vecteurs colinéaires.$$,
      'hint', $$Relis la propriété : M appartient à (AB) si et seulement si AM et AB sont colinéaires.$$,
      'expected', $$AM et AB sont colinéaires (AM=4·AB), donc M appartient à la droite (AB).$$
    )
  ),
  now()
);
