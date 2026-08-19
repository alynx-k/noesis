-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2037: "MATHS_1C L16: VECTEURS DE L'ESPACE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2037), resource id 17906.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-vecteurs-espace',
  '1ere',
  'C',
  'mathematiques',
  $$Vecteurs de l'espace$$,
  16,
  '1ere-c-maths-suites-numeriques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un professeur d'arts plastiques demande à ses élèves de dessiner un bâtiment qui les a marqués. L'un d'eux demande à son frère, élève en 1ère C, de l'aider à reproduire la pyramide du Plateau à Abidjan. Désireux d'avoir le plus beau dessin, les deux élèves décident d'utiliser les vecteurs de l'espace pour mieux reproduire cette image.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vecteurs colinéaires et orthogonaux$$,
        'body', $$Deux vecteurs sont colinéaires si l'un est nul, ou s'ils ont la même direction : u⃗ et v⃗ colinéaires ⟺ il existe k∈ℝ tel que u⃗=kv⃗ ou v⃗=ku⃗. L'ensemble des points M tels que AM⃗=ku⃗ (k∈ℝ), pour u⃗ non nul, est la droite D(A,u⃗) ; avec k∈[0;+∞[, c'est la demi-droite [AB) ; avec k∈[0;1], c'est le segment [AB]. Deux vecteurs sont orthogonaux si l'un est nul, ou si leurs directions sont orthogonales (vecteurs directeurs de deux droites orthogonales).$$,
        'highlights', array[$$u⃗, v⃗ colinéaires ⟺ ∃k∈ℝ, u⃗=kv⃗ (ou v⃗=ku⃗)$$, $${M : AM⃗=ku⃗, k∈ℝ} = droite D(A,u⃗) ; k∈[0;1] donne le segment [AB]$$]::text[],
        'example', jsonb_build_object('statement', $$ABCDEFGH est un pavé droit. u⃗ dirige (DH), v⃗ dirige (BC). Justifie que u⃗⊥v⃗.$$, 'solution', $$Dans un pavé droit, (HD) est orthogonale au plan (ABC), donc orthogonale à (BC) qui y est incluse. Comme u⃗ et v⃗ dirigent respectivement (HD) et (BC), on a u⃗⊥v⃗.$$),
        'fixation', jsonb_build_object('question', $$ABCD est un parallélogramme, I milieu de [AB]. Exprime AI⃗ en fonction de DC⃗.$$, 'solution', $$AI⃗ = (1/2)AB⃗ = (1/2)DC⃗ (car AB⃗=DC⃗ dans un parallélogramme).$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs coplanaires$$,
        'body', $$Pour u⃗, v⃗ non colinéaires, l'ensemble des points M tels que AM⃗=λu⃗+μv⃗ (λ,μ∈ℝ) est le plan P(A,u⃗,v⃗). Des vecteurs u⃗, v⃗, w⃗ sont coplanaires s'il est possible de construire un représentant de chacun dans un même plan. Deux vecteurs sont toujours coplanaires ; si deux des trois vecteurs sont colinéaires, les trois sont coplanaires. u⃗, v⃗, w⃗ (avec u⃗,v⃗ non colinéaires) sont coplanaires ⟺ w⃗ est combinaison linéaire de u⃗ et v⃗ ⟺ il existe (λ,μ,ν)≠(0,0,0) tel que λu⃗+μv⃗+νw⃗=0⃗. Ils sont non coplanaires ⟺ λu⃗+μv⃗+νw⃗=0⃗ implique λ=μ=ν=0.$$,
        'highlights', array[$$u⃗,v⃗,w⃗ coplanaires ⟺ combinaison linéaire nulle non triviale existe$$, $$u⃗,v⃗,w⃗ non coplanaires ⟺ seule la combinaison triviale (0,0,0) donne 0⃗$$]::text[],
        'example', jsonb_build_object('statement', $$ABCDEFGH est un cube. On pose AB⃗=i⃗, AD⃗=j⃗, AE⃗=k⃗. Montre que i⃗, i⃗+j⃗ et i⃗+j⃗+k⃗ sont non coplanaires.$$, 'solution', $$Soit α,β,γ tels que αi⃗+β(i⃗+j⃗)+γ(i⃗+j⃗+k⃗)=0⃗. On obtient (α+β+γ)i⃗+(β+γ)j⃗+γk⃗=0⃗. Comme i⃗,j⃗,k⃗ sont non coplanaires : α+β+γ=0, β+γ=0, γ=0, d'où α=β=γ=0. Les vecteurs sont donc non coplanaires.$$),
        'fixation', jsonb_build_object('question', $$Si deux des trois vecteurs u⃗, v⃗, w⃗ sont colinéaires, que peut-on conclure sur leur coplanarité ?$$, 'solution', $$Les trois vecteurs sont nécessairement coplanaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Bases et repères de l'espace$$,
        'body', $$Tout triplet (i⃗,j⃗,k⃗) de vecteurs non coplanaires est une base de W. Pour tout vecteur u⃗, il existe un unique triplet (x,y,z) tel que u⃗=xi⃗+yj⃗+zk⃗ (coordonnées de u⃗ dans la base). Si u⃗(x;y;z) et u⃗'(x';y';z'), alors (u⃗+u⃗')(x+x';y+y';z+z') et (λu⃗)(λx;λy;λz). Une base est orthogonale si ses trois vecteurs sont deux à deux orthogonaux ; orthonormée si en plus ils sont unitaires. Un repère (O,i⃗,j⃗,k⃗) est un point O muni d'une base ; pour M de l'espace, l'unique triplet (x,y,z) tel que OM⃗=xi⃗+yj⃗+zk⃗ donne les coordonnées de M (abscisse, ordonnée, cote).$$,
        'highlights', array[$$base = triplet de vecteurs non coplanaires ; tout vecteur s'y décompose de façon unique$$, $$base orthonormée : vecteurs deux à deux orthogonaux et unitaires$$]::text[],
        'example', jsonb_build_object('statement', $$Soit A(xA;yA;zA), B(xB;yB;zB) dans un repère (O,i⃗,j⃗,k⃗). Exprime les coordonnées de AB⃗.$$, 'solution', $$AB⃗(xB−xA ; yB−yA ; zB−zA).$$),
        'fixation', jsonb_build_object('question', $$Dans une base (i⃗,j⃗,k⃗), on donne u⃗(2;−1;3) et v⃗(1;2;−1). Calcule les coordonnées de u⃗+v⃗.$$, 'solution', $$u⃗+v⃗ = (2+1 ; −1+2 ; 3−1) = (3;1;2).$$)
      ),
      jsonb_build_object(
        'heading', $$Produit scalaire dans l'espace$$,
        'body', $$Pour u⃗=AB⃗, v⃗=AC⃗ : u⃗·v⃗=0 si l'un est nul ; sinon u⃗·v⃗=‖u⃗‖×‖v⃗‖×cos(BAC). On a aussi u⃗·v⃗ = (1/2)(‖u⃗+v⃗‖²−‖u⃗‖²−‖v⃗‖²). Dans une base orthonormée, pour u⃗(x;y;z) et v⃗(x';y';z') : u⃗·v⃗=xx'+yy'+zz' et ‖u⃗‖=√(x²+y²+z²). Conséquence : pour A(xA,yA,zA), B(xB,yB,zB) dans un repère orthonormé, AB=√[(xB−xA)²+(yB−yA)²+(zB−zA)²].$$,
        'highlights', array[$$u⃗·v⃗ = ‖u⃗‖‖v⃗‖cos(angle) ; en base orthonormée : u⃗·v⃗ = xx'+yy'+zz'$$, $$AB = √[(xB−xA)²+(yB−yA)²+(zB−zA)²]$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD est un tétraèdre régulier de côté a. Calcule AB⃗·AC⃗ et AB⃗·CD⃗.$$, 'solution', $$AB⃗·AC⃗ = ‖AB⃗‖‖AC⃗‖cos(60°) = a×a×(1/2) = a²/2. AB⃗·CD⃗ = 0 (arêtes opposées orthogonales dans un tétraèdre régulier).$$),
        'fixation', jsonb_build_object('question', $$Dans une base orthonormée, u⃗(1;2;−3) et v⃗(2;−1;2). Calcule u⃗·v⃗.$$, 'solution', $$u⃗·v⃗ = 1×2+2×(−1)+(−3)×2 = 2−2−6 = −6.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur dessine un cube ABCDEFGH et demande de déterminer les coordonnées d'un vecteur t⃗ orthogonal aux vecteurs BH⃗ et EG⃗, dans la base orthonormée (AB⃗,AD⃗,AE⃗). Un élève affirme que tout vecteur solution est de la forme t⃗(α;−α;2α), α∈ℝ. Son voisin n'est pas d'accord.$$,
      'questions', array[
        $$Exprime les coordonnées de BH⃗ et EG⃗ dans la base (AB⃗,AD⃗,AE⃗), sachant que BH⃗=−AB⃗+AD⃗+AE⃗ et EG⃗=AC⃗=AB⃗+AD⃗.$$,
        $$Pose t⃗(x;y;z) dans cette base et traduis les conditions t⃗⊥BH⃗ et t⃗⊥EG⃗ en un système de deux équations (en utilisant le produit scalaire en coordonnées).$$,
        $$Résous ce système en posant x=α, et détermine y et z en fonction de α pour vérifier ou infirmer l'affirmation du premier élève.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la condition de colinéarité de deux vecteurs u⃗ et v⃗ ?$$,
      'hint', $$Elle fait intervenir un réel k.$$,
      'expected', $$Il existe un réel k tel que u⃗=kv⃗ (ou v⃗=ku⃗), ou l'un des deux vecteurs est nul.$$
    ),
    jsonb_build_object(
      'question', $$Comment reconnaît-on que trois vecteurs u⃗, v⃗, w⃗ sont non coplanaires, à l'aide d'une combinaison linéaire ?$$,
      'hint', $$C'est une condition sur les coefficients d'une combinaison nulle.$$,
      'expected', $$Ils sont non coplanaires si et seulement si la seule combinaison λu⃗+μv⃗+νw⃗=0⃗ est celle où λ=μ=ν=0.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une base orthonormée de l'espace ?$$,
      'hint', $$Elle combine deux propriétés : orthogonalité et normes.$$,
      'expected', $$Une base orthogonale (vecteurs deux à deux orthogonaux) dont les trois vecteurs sont en plus unitaires (de norme 1).$$
    ),
    jsonb_build_object(
      'question', $$Dans une base orthonormée, quelle est la formule du produit scalaire de u⃗(x;y;z) et v⃗(x';y';z') ?$$,
      'hint', $$C'est une somme de trois produits.$$,
      'expected', $$u⃗·v⃗ = xx' + yy' + zz'.$$
    )
  ),
  now()
);
