-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2023: "MATHS_1C L2: BARYCENTRE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2023), resource id 17738.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-barycentre',
  '1ere',
  'C',
  'mathematiques',
  $$Barycentre$$,
  2,
  '1ere-c-maths-equations-inequations-second-degre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves découvrent une plaque triangulaire ABC de masse négligeable, avec des masses suspendues à chaque sommet (mA = 2g, mB = 5g, mC = 3g). Ils veulent déterminer le point G où accrocher un fil pour que la plaque reste en équilibre, sachant que G doit vérifier 2GA⃗ + 5GB⃗ + 3GC⃗ = 0⃗.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Barycentre de deux points pondérés$$,
        'body', $$Un point pondéré est un couple (A, a) où A est un point et a un réel non nul. Si A, B sont deux points et a, b deux réels tels que a+b ≠ 0, il existe un unique point G tel que aGA⃗ + bGB⃗ = 0⃗ : G est le barycentre des points pondérés (A,a) et (B,b), noté G = bar{(A,a);(B,b)}. Conséquence : AG⃗ = [b/(a+b)]AB⃗. Le barycentre de deux points appartient toujours à la droite (AB) ; si les coefficients sont de même signe, G ∈ [AB] ; s'ils sont opposés, G ∈ (AB)\\[AB] ; s'ils sont égaux, G est le milieu de [AB] (isobarycentre).$$,
        'highlights', array[$$aGA⃗ + bGB⃗ = 0⃗ définit G, le barycentre$$, $$AG⃗ = [b/(a+b)]AB⃗$$, $$coefficients égaux → G = milieu de [AB]$$]::text[],
        'example', jsonb_build_object('statement', $$Soient A, B, G tels que 2GA⃗ − 3BG⃗ = 0⃗. Détermine les points pondérés dont G est le barycentre.$$, 'solution', $$2GA⃗ − 3BG⃗ = 0⃗ ⟺ 2GA⃗ + 3GB⃗ = 0⃗. Donc G = bar{(A,2);(B,3)}.$$),
        'fixation', jsonb_build_object('question', $$Si G = bar{(A,2);(B,7)}, détermine a tel que G = bar{(A,a);(B,21)}.$$, 'solution', $$Comme 21 = 3×7, par homogénéité a = 3×2 = 6, donc G = bar{(A,6);(B,21)}.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés du barycentre : réduction vectorielle et coordonnées$$,
        'body', $$Pour tout point M du plan, si G = bar{(A,a);(B,b)} avec a+b≠0, alors aMA⃗ + bMB⃗ = (a+b)MG⃗ — c'est la réduction de la somme. Si a+b = 0, l'expression aMA⃗ + bMB⃗ est indépendante de M et vaut aBA⃗. Dans un repère, si A(xA;yA) et B(xB;yB), les coordonnées du barycentre G sont : G((axA+bxB)/(a+b), (ayA+byB)/(a+b)).$$,
        'highlights', array[$$aMA⃗ + bMB⃗ = (a+b)MG⃗ pour tout point M (réduction vectorielle)$$, $$G((axA+bxB)/(a+b), (ayA+byB)/(a+b))$$]::text[],
        'example', jsonb_build_object('statement', $$Soit A(1,2) et B(−1,3). Détermine les coordonnées du barycentre G de {(A,−1);(B,2)}.$$, 'solution', $$G = ((−1×1+2×(−1))/(−1+2) , (−1×2+2×3)/(−1+2)) = (−3, 4).$$),
        'fixation', jsonb_build_object('question', $$Soit K = bar{(C,3);(D,1)}. Exprime 3MC⃗ + MD⃗ en fonction de MK⃗, pour tout point M.$$, 'solution', $$3MC⃗ + MD⃗ = (3+1)MK⃗ = 4MK⃗.$$)
      ),
      jsonb_build_object(
        'heading', $$Barycentre de trois points pondérés et barycentre partiel$$,
        'body', $$Soit (A,a), (B,b), (C,c) trois points pondérés avec a+b+c≠0. Il existe un unique point G tel que aGA⃗+bGB⃗+cGC⃗=0⃗, appelé barycentre, noté G = bar{(A,a);(B,b);(C,c)}. Propriété du barycentre partiel : si a+b≠0, on peut remplacer (A,a) et (B,b) par leur barycentre partiel H = bar{(A,a);(B,b)} affecté du coefficient (a+b) : G = bar{(H,a+b);(C,c)}. Cette propriété permet de ramener un barycentre de 3 points à un barycentre de 2 points, très utile pour les problèmes d'alignement et de concours de droites.$$,
        'highlights', array[$$G = bar{(A,a);(B,b);(C,c)} : aGA⃗+bGB⃗+cGC⃗=0⃗$$, $$barycentre partiel : remplacer 2 points par leur barycentre affecté de la somme des coefficients$$, $$isobarycentre de 3 points non alignés = centre de gravité du triangle$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le problème d'équilibre de la plaque triangulaire (mA=2g, mB=5g, mC=3g), détermine la position du point G = bar{(A,2);(B,5);(C,3)} en utilisant un barycentre partiel.$$, 'solution', $$Soit H = bar{(A,2);(C,3)} le barycentre partiel (avec AH⃗ = 3/5 AC⃗). Alors G = bar{(H,5);(B,5)} : G est l'isobarycentre de H et B, donc le milieu du segment [BH].$$),
        'fixation', jsonb_build_object('question', $$Soit G = bar{(A,1);(B,2);(C,3)}. Exprime G comme l'isobarycentre de deux points.$$, 'solution', $$Soit H = bar{(A,1);(B,2)}. Alors G = bar{(H,3);(C,3)} : G est l'isobarycentre de H et C.$$)
      ),
      jsonb_build_object(
        'heading', $$Lignes de niveau : MA²+MB² et MA/MB$$,
        'body', $$Pour A, B distincts et a, b réels non nuls avec a+b≠0, la ligne de niveau k de M ↦ aMA²+bMB² (où G = bar{(A,a);(B,b)}) est soit vide, soit réduite au point G, soit un cercle de centre G. Pour l'application M ↦ MA/MB, la ligne de niveau k est la médiatrice de [AB] si k=1, et un cercle si k≠1 (dont le centre est un barycentre approprié de A et B).$$,
        'highlights', array[$$ligne de niveau de aMA²+bMB² : ∅, point G, ou cercle de centre G$$, $$ligne de niveau de MA/MB : médiatrice si k=1, cercle sinon$$]::text[],
        'example', jsonb_build_object('statement', $$A et B sont tels que AB=12. Détermine la ligne de niveau 122 de f: M ↦ MA²+MB².$$, 'solution', $$G étant le milieu de [AB] (isobarycentre), on montre que MA²+MB² = 2MG²+GA²+GB² = 2MG²+72 = 122, donc MG²=25, MG=5. La ligne de niveau est le cercle de centre G et de rayon 5.$$),
        'fixation', jsonb_build_object('question', $$Pour A et B tels que AB=6, quelle est la ligne de niveau 1 de f: M ↦ MA/MB ?$$, 'solution', $$C'est la médiatrice du segment [AB], car k=1.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une plaque triangulaire ABC de masse négligeable porte des masses mA=2g, mB=5g, mC=3g suspendues à ses sommets. On cherche le point G où accrocher un fil pour l'équilibre.$$,
      'questions', array[
        $$Détermine H, le barycentre partiel du système {(A,2);(C,3)}, et exprime AH⃗ en fonction de AC⃗.$$,
        $$Montre que G, barycentre du système {(A,2);(B,5);(C,3)}, s'écrit G = bar{(H,5);(B,5)}.$$,
        $$Conclus sur la position exacte de G par rapport au segment [BH].$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle relation vectorielle définit G comme barycentre de (A,a) et (B,b) ?$$,
      'hint', $$Elle fait intervenir GA⃗ et GB⃗.$$,
      'expected', $$aGA⃗ + bGB⃗ = 0⃗.$$
    ),
    jsonb_build_object(
      'question', $$Que représente l'isobarycentre de deux points A et B ?$$,
      'hint', $$C'est le cas où les coefficients sont égaux.$$,
      'expected', $$Le milieu du segment [AB].$$
    ),
    jsonb_build_object(
      'question', $$À quoi sert le barycentre partiel dans un problème à trois points pondérés ?$$,
      'hint', $$Il permet de simplifier un problème à 3 points.$$,
      'expected', $$À remplacer deux des trois points pondérés par leur barycentre, affecté de la somme de leurs deux coefficients, ce qui ramène le problème à un barycentre de deux points.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la ligne de niveau 1 de l'application M ↦ MA/MB (A et B distincts) ?$$,
      'hint', $$C'est un cas particulier, pas un cercle.$$,
      'expected', $$La médiatrice du segment [AB].$$
    )
  ),
  now()
);
