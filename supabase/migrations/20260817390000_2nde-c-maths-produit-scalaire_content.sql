-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3140: "MATH_2C L10: PRODUIT SCALAIRE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3140)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30955, redirecting
-- to pluginfile "Maths 2C_L10_Produit scalaire.pdf" (13 pages).
-- Rewritten/paraphrased from the source PDF: définition du produit
-- scalaire de deux vecteurs, carré scalaire, orthogonalité (droites
-- perpendiculaires, cercle de diamètre), opérations et identités
-- remarquables sur le produit scalaire, formule AB.AC via les normes,
-- théorème d'Al Kashi, et expression du produit scalaire à partir des
-- coordonnées dans une base orthonormée. La situation complexe d'évaluation
-- (calcul d'un angle dans un carré à l'aide du produit scalaire) est
-- reformulée avec d'autres noms de points. 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-produit-scalaire',
  '2nde',
  'C',
  'mathematiques',
  $$Produit scalaire$$,
  10,
  '2nde-c-maths-statistique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un enseignant de physique demande à ses élèves de calculer le travail de plusieurs forces qui s'appliquent sur un objet lors d'un déplacement de 10 mètres en ligne droite. Un élève affirme qu'il suffit de calculer le produit des vecteurs représentant chaque force et du vecteur déplacement pour obtenir la réponse. Intrigués par cette affirmation, les élèves de la classe font des recherches sur le produit scalaire de deux vecteurs.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition du produit scalaire$$,
        'body', $$Soient u et v deux vecteurs. On appelle produit scalaire de u par v le nombre réel noté u.v défini ainsi : si u et v sont tous deux non nuls, u.v = ‖u‖×‖v‖×cos(u,v), où (u,v) est l'angle orienté (ou géométrique) formé par les deux vecteurs ; si l'un des deux vecteurs est nul, alors u.v = 0. Lorsque u et v sont colinéaires, le calcul se simplifie : u.v = ‖u‖×‖v‖ s'ils sont de même sens, et u.v = −‖u‖×‖v‖ s'ils sont de sens contraires. On appelle carré scalaire d'un vecteur u le produit scalaire u.u, noté u², qui vaut toujours ‖u‖².$$,
        'highlights', array[$$produit scalaire$$, $$carré scalaire$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$u.v = ‖u‖×‖v‖×cos(u,v) si u et v sont non nuls ; u.v = 0 si u ou v est nul. u² = ‖u‖².$$),
        'example', jsonb_build_object('statement', $$Calcule le produit scalaire u.v sachant que ‖u‖=15, ‖v‖=7, et que u et v sont colinéaires et de sens contraires.$$, 'solution', $$Comme u et v sont colinéaires et de sens contraires, u.v = −‖u‖×‖v‖ = −15×7 = −105.$$),
        'fixation', jsonb_build_object('question', $$Que vaut le produit scalaire u.v lorsque u ou v est le vecteur nul ?$$, 'solution', $$Il vaut toujours 0.$$)
      ),
      jsonb_build_object(
        'heading', $$Orthogonalité et calcul par projection$$,
        'body', $$Deux vecteurs non nuls u et v sont orthogonaux si et seulement si leur produit scalaire est nul : u.v = 0. Cette propriété permet de démontrer que deux droites sont perpendiculaires, en montrant que deux vecteurs directeurs de ces droites ont un produit scalaire nul. Elle permet aussi de caractériser le cercle de diamètre [AB] : un point M appartient à ce cercle si et seulement si MA.MB = 0. Par ailleurs, si H et K sont les projetés orthogonaux respectifs de C et D sur la droite (AB), on a la propriété utile AB.CD = AB×HK (produit des mesures algébriques sur la droite (AB)).$$,
        'highlights', array[$$orthogonalité$$, $$cercle de diamètre$$, $$projeté orthogonal$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD est un carré. Calcule le produit scalaire AC.DB.$$, 'solution', $$Dans un carré, les diagonales (AC) et (DB) sont perpendiculaires, donc AC.DB = 0.$$),
        'fixation', jsonb_build_object('question', $$À quelle condition un point M appartient-il au cercle de diamètre [AB] ?$$, 'solution', $$À condition que MA.MB = 0.$$)
      ),
      jsonb_build_object(
        'heading', $$Opérations sur le produit scalaire et identités remarquables$$,
        'body', $$Pour tous vecteurs u, v, w du plan et tout réel k, le produit scalaire est distributif par rapport à l'addition et se comporte bien avec la multiplication par un réel : u.(v+w) = u.v + u.w, et (ku).v = u.(kv) = k(u.v). On en déduit des identités remarquables très utiles : (u+v)² = u² + 2u.v + v², (u−v)² = u² − 2u.v + v², et (u+v).(u−v) = u² − v². Ces identités permettent notamment de calculer un produit scalaire à partir des normes de deux vecteurs et de leur somme (ou différence), sans connaître directement l'angle qu'ils forment.$$,
        'highlights', array[$$distributivité$$, $$identités remarquables$$]::text[],
        'example', jsonb_build_object('statement', $$u et v sont deux vecteurs tels que ‖u‖=2, ‖v‖=3 et u.v=1. Démontre que (2u+v).(u−v) = −2.$$, 'solution', $$(2u+v).(u−v) = 2u² − 2u.v + v.u − v² = 2u² − u.v − v² = 2×4 − 1 − 9 = 8−1−9 = −2.$$),
        'fixation', jsonb_build_object('question', $$Développe (u−v)² en fonction de u², u.v et v².$$, 'solution', $$(u−v)² = u² − 2u.v + v².$$)
      ),
      jsonb_build_object(
        'heading', $$Formule AB.AC et théorème d'Al Kashi$$,
        'body', $$Dans un triangle ABC, on peut exprimer le produit scalaire AB.AC uniquement à partir des longueurs des côtés : AB.AC = (1/2)(AB² + AC² − BC²). Le théorème d'Al Kashi généralise le théorème de Pythagore à un triangle quelconque : en posant BC=a, AC=b, AB=c, on a a² = b² + c² − 2bc×cosA, et des formules analogues pour b² et c². Ce théorème permet de calculer un côté d'un triangle connaissant les deux autres côtés et l'angle qu'ils forment, même lorsque le triangle n'est pas rectangle.$$,
        'highlights', array[$$formule AB.AC$$, $$théorème d'Al Kashi$$]::text[],
        'example', jsonb_build_object('statement', $$ABC est un triangle tel que AB=8, AC=3 et mesBAC=π/3 (on donne cos(π/3)=1/2). Calcule BC.$$, 'solution', $$BC² = AB²+AC²−2×AB×AC×cos(BAC) = 64+9−2×8×3×(1/2) = 73−24 = 49, donc BC = 7.$$),
        'fixation', jsonb_build_object('question', $$Comment exprimer AB.AC uniquement à partir des longueurs AB, AC et BC d'un triangle ABC ?$$, 'solution', $$AB.AC = (1/2)(AB² + AC² − BC²).$$)
      ),
      jsonb_build_object(
        'heading', $$Produit scalaire à partir des coordonnées$$,
        'body', $$Dans une base orthonormée (i,j), si un vecteur u a pour coordonnées (x ; y) et un vecteur v a pour coordonnées (x' ; y'), alors leur produit scalaire se calcule simplement par u.v = xx' + yy'. Cette formule, beaucoup plus rapide que le calcul avec les normes et le cosinus, permet aussi de vérifier facilement une orthogonalité (le produit scalaire est nul) ou de retrouver la norme d'un vecteur (‖u‖² = u.u = x²+y²).$$,
        'highlights', array[$$produit scalaire en coordonnées$$, $$base orthonormée$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un repère orthonormé, u a pour coordonnées (2 ; −3) et v a pour coordonnées (−5 ; 2). Calcule u.v.$$, 'solution', $$u.v = 2×(−5) + (−3)×2 = −10 − 6 = −16.$$),
        'fixation', jsonb_build_object('question', $$Dans une base orthonormée, u(x;y) et v(x';y'). Quelle est la formule du produit scalaire u.v ?$$, 'solution', $$u.v = xx' + yy'.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$MNPQ est un carré de côté a (a strictement positif). E est le point du segment [NP] tel que NE = (1/2)NP et F le point du segment [PQ] tel que PF = (1/2)PQ. On souhaite déterminer la mesure de l'angle θ formé au sommet M par les segments [ME] et [MF], en utilisant le produit scalaire ME.MF calculé de deux façons différentes.$$,
      'questions', array[
        $$Exprime les vecteurs ME et MF en fonction des vecteurs MN et MQ (côtés du carré), en utilisant les positions de E et F.$$,
        $$Calcule le produit scalaire ME.MF à l'aide de cette expression et des propriétés du carré (côtés perpendiculaires, longueur a).$$,
        $$Exprime ME.MF sous la forme ‖ME‖×‖MF‖×cosθ, calcule les normes ‖ME‖ et ‖MF‖ en fonction de a, puis déduis-en la valeur de cosθ.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule le produit scalaire u.v sachant que ‖u‖=4, ‖v‖=9, et que u et v sont colinéaires et de même sens.$$,
      'hint', $$Pour des vecteurs colinéaires de même sens, u.v = ‖u‖×‖v‖.$$,
      'expected', $$u.v = 4×9 = 36.$$
    ),
    jsonb_build_object(
      'question', $$ABC est un triangle tel que AB=7, AC=4 et BC=5. Calcule AB.AC.$$,
      'hint', $$Utilise la formule AB.AC = (1/2)(AB²+AC²−BC²).$$,
      'expected', $$AB.AC = (1/2)(49+16−25) = (1/2)(40) = 20.$$
    ),
    jsonb_build_object(
      'question', $$Dans un repère orthonormé, u(3;1) et v(−1;3). Que peut-on dire de u et v ? Justifie avec le produit scalaire.$$,
      'hint', $$Calcule u.v et regarde si le résultat est nul.$$,
      'expected', $$u.v = 3×(−1)+1×3 = −3+3 = 0, donc u et v sont orthogonaux.$$
    ),
    jsonb_build_object(
      'question', $$u et v sont deux vecteurs tels que ‖u‖=5, ‖v‖=2 et u.v=3. Calcule (u+v)².$$,
      'hint', $$Utilise l'identité (u+v)² = u²+2u.v+v².$$,
      'expected', $$(u+v)² = 25 + 2×3 + 4 = 25+6+4 = 35.$$
    )
  ),
  now()
);
