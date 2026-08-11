-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Mathématiques, categoryid=99.
-- The category lists only two "leçons": Moodle course id 3245
-- ("Math_2A L1: CALCULS NUMERIQUES") and Moodle course id 3920
-- ("Math_2A L2: CALCULS NUMERIQUES COPIE copie 1"). Verified by fetching
-- both resources: L1's resource (mod_resource id 32179, pluginfile 74437)
-- and L2's resource (mod_resource id 40530, pluginfile 89397) point to a
-- PDF with the exact same filename "Maths 2A_L1_CALCULS NUMERIQUES.pdf",
-- and the two downloaded files are byte-identical (same MD5 checksum,
-- same size 404734 bytes). L2 is therefore a duplicate copy of L1, not a
-- distinct lesson — the category effectively contains a single real
-- lesson, "Calculs numériques" (Compétence 1, Thème 2).
-- Rewritten/paraphrased from the source PDF: operations on quotients
-- (fractions), powers of a real number, operations on square roots,
-- proportional quantities and percentages (amount, increase/decrease,
-- product of percentages), and decimal approximation/rounding of a real
-- number. 100% original wording, worked examples and numbers changed from
-- the source; no sentence copied verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-calculs-numeriques',
  '2nde',
  'A',
  'mathematiques',
  $$Calculs numériques$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une classe de seconde A3 de 50 élèves, 40% des élèves sont des garçons, et 55% de ces garçons ont moins de 17 ans. Un élève affirme que cela signifie forcément que 45% des garçons ont 17 ans ou plus. Curieux, ses camarades décident de reprendre le calcul en détail avant de se prononcer sur cette affirmation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Opérations sur les quotients$$,
        'body', $$Additionner ou soustraire deux fractions de même dénominateur revient à additionner ou soustraire leurs numérateurs. Quand les dénominateurs diffèrent, on réduit d'abord au même dénominateur. Multiplier deux fractions se fait numérateur avec numérateur et dénominateur avec dénominateur, et diviser par une fraction revient à multiplier par son inverse.$$,
        'highlights', array[$$dénominateur commun$$, $$inverse$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Pour a, b, c, d réels avec b et d non nuls : a/b + c/b = (a+c)/b ; a/b − c/b = (a−c)/b ; a/b + c/d = (ad+bc)/bd ; a/b − c/d = (ad−bc)/bd. Pour le produit : a×(1/b) = a/b et (a/b)×(c/d) = ac/bd. Pour la division, avec b, c, d non nuls : a/(c/d) = a×d/c et (a/b)/(c/d) = ad/bc.$$),
        'example', jsonb_build_object('statement', $$Calcule 5/6 − 1/4.$$, 'solution', $$5/6 − 1/4 = (5×4 − 6×1)/(6×4) = (20−6)/24 = 14/24 = 7/12.$$),
        'fixation', jsonb_build_object('question', $$Calcule 2/3 × 9/4.$$, 'solution', $$2/3 × 9/4 = (2×9)/(3×4) = 18/12 = 3/2.$$)
      ),
      jsonb_build_object(
        'heading', $$Puissances d'un nombre réel$$,
        'body', $$Pour un nombre réel a non nul et un entier naturel n, la puissance a^n est le produit de n facteurs égaux à a. Par convention, a^0 = 1, et a^(−n) est l'inverse de a^n. Ces puissances obéissent à des règles de calcul qui évitent d'écrire tous les facteurs à chaque fois.$$,
        'highlights', array[$$puissance$$, $$exposant$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Pour a et b réels non nuls, n et p entiers relatifs : a^n × a^p = a^(n+p) ; a^n/a^p = a^(n−p) ; (a/b)^n = a^n/b^n ; a^n × b^n = (ab)^n ; (a^n)^p = a^(np).$$),
        'example', jsonb_build_object('statement', $$Écris sous la forme a^n : 2^5 × 2^(−3).$$, 'solution', $$2^5 × 2^(−3) = 2^(5−3) = 2^2.$$),
        'fixation', jsonb_build_object('question', $$Écris sous la forme a^n : (3^4)^2.$$, 'solution', $$(3^4)^2 = 3^(4×2) = 3^8.$$)
      ),
      jsonb_build_object(
        'heading', $$Calculs avec les racines carrées$$,
        'body', $$La racine carrée d'un produit de deux nombres positifs est le produit de leurs racines carrées, et la racine carrée d'un quotient est le quotient de leurs racines carrées, à condition que le dénominateur ne soit pas nul. Ces règles permettent de simplifier une expression contenant des radicaux sans passer par une valeur approchée.$$,
        'highlights', array[$$racine carrée$$, $$radical$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Pour a et b réels positifs et n entier naturel : √(ab) = √a × √b ; pour b ≠ 0, √(a/b) = √a/√b ; √(a^n) = (√a)^n.$$),
        'example', jsonb_build_object('statement', $$Calcule √(49 × 4).$$, 'solution', $$√(49×4) = √49 × √4 = 7 × 2 = 14.$$),
        'fixation', jsonb_build_object('question', $$Calcule √(81/25).$$, 'solution', $$√(81/25) = √81/√25 = 9/5.$$)
      ),
      jsonb_build_object(
        'heading', $$Grandeurs proportionnelles$$,
        'body', $$Deux grandeurs x et y sont dites proportionnelles lorsque l'une s'obtient en multipliant l'autre par un même nombre k, appelé coefficient de proportionnalité : y = kx. On organise souvent ces valeurs dans un tableau de proportionnalité, où l'on passe d'une ligne à l'autre en multipliant par k.$$,
        'highlights', array[$$coefficient de proportionnalité$$, $$tableau de proportionnalité$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$x et y sont proportionnelles s'il existe un nombre non nul k tel que y = kx pour toutes les valeurs considérées ; k est le coefficient de proportionnalité.$$),
        'table', jsonb_build_object(
          'headers', array[$$x$$, $$4$$, $$6$$, $$10$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$y (coefficient 5)$$, $$20$$, $$30$$, $$50$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans un tableau de proportionnalité, la première ligne est 4 ; 6 et la deuxième 12 ; 18. Détermine le coefficient de proportionnalité.$$, 'solution', $$k = 12/4 = 3, et on vérifie que 18/6 = 3 également ; le coefficient est donc 3.$$),
        'fixation', jsonb_build_object('question', $$Dans un tableau de proportionnalité de coefficient 4, à quelle valeur correspond 7 sur la première ligne ?$$, 'solution', $$7 × 4 = 28.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourcentages$$,
        'body', $$Prendre k% d'une quantité a revient à la multiplier par k/100. Augmenter une quantité de k% revient à la multiplier par (1 + k/100), et la réduire de k% revient à la multiplier par (1 − k/100). Pour calculer a% de b% d'une quantité, on multiplie cette quantité par le produit a×b/10000.$$,
        'highlights', array[$$pourcentage$$, $$augmentation$$, $$réduction$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$k% d'une quantité a est a×k/100. Augmenter a de k% : a×(1+k/100). Réduire a de k% : a×(1−k/100). a% de b% d'une quantité c : c×(a×b)/10000.$$),
        'example', jsonb_build_object('statement', $$Un article coûte initialement 3000 F. Calcule son prix après une réduction de 25%.$$, 'solution', $$3000 × (1 − 25/100) = 3000 × 75/100 = 2250 F.$$),
        'fixation', jsonb_build_object('question', $$Calcule 4% de 3% de 500 g.$$, 'solution', $$500 × (4×3)/10000 = 500 × 12/10000 = 0,6 g.$$)
      ),
      jsonb_build_object(
        'heading', $$Approximation décimale et arrondi$$,
        'body', $$Un nombre irrationnel comme √3 possède une infinité de décimales, qu'on ne peut pas toutes écrire. On l'encadre alors par deux décimaux consécutifs d'un ordre donné : le plus petit est l'approximation décimale par défaut, le plus grand par excès. L'arrondi, lui, choisit la décimale la plus proche en observant le chiffre suivant.$$,
        'highlights', array[$$approximation décimale$$, $$arrondi$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour approcher un réel à l'ordre n : on l'encadre par deux décimaux consécutifs d'ordre n, le plus petit étant l'approximation par défaut, le plus grand par excès. Pour l'arrondi d'ordre n, on regarde le chiffre situé juste après le rang n : s'il est inférieur à 5, on garde l'approximation par défaut ; sinon, on prend celle par excès.$$),
        'example', jsonb_build_object('statement', $$On donne √3 ≈ 1,7320508. Donne l'approximation décimale d'ordre 2 par défaut et par excès de √3.$$, 'solution', $$1,73 < √3 < 1,74, donc l'approximation par défaut à l'ordre 2 est 1,73 et celle par excès est 1,74.$$),
        'fixation', jsonb_build_object('question', $$On donne √3 ≈ 1,7320508. Donne l'arrondi d'ordre 3 de √3.$$, 'solution', $$Le quatrième chiffre après la virgule est 0, inférieur à 5, donc l'arrondi d'ordre 3 est 1,732.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans la classe de seconde A4 d'un lycée, il y a 50 élèves. 44% de ces élèves sont des garçons, et 20% de ces garçons ont moins de 16 ans. Un élève de la classe voisine affirme que 85% des garçons de la seconde A4 ont 16 ans ou plus. Certains camarades doutent de ce chiffre et veulent le vérifier avec les outils du calcul numérique.$$,
      'questions', array[
        $$Calcule le nombre de garçons de la classe de seconde A4.$$,
        $$Calcule le nombre de garçons qui ont moins de 16 ans.$$,
        $$Déduis-en le pourcentage réel de garçons qui ont 16 ans ou plus, et dis si l'affirmation de l'élève est juste.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule 5/8 + 3/4.$$,
      'hint', $$Réduis d'abord les deux fractions au même dénominateur.$$,
      'expected', $$5/8 + 3/4 = 5/8 + 6/8 = 11/8.$$
    ),
    jsonb_build_object(
      'question', $$Écris sous la forme a^n : 6^10/6^4.$$,
      'hint', $$Relis la règle de division de deux puissances de même base : on soustrait les exposants.$$,
      'expected', $$6^10/6^4 = 6^(10−4) = 6^6.$$
    ),
    jsonb_build_object(
      'question', $$Dans un tableau de proportionnalité, la première ligne est 3 ; 5 ; 8 et le coefficient de proportionnalité est 6. Complète la deuxième ligne.$$,
      'hint', $$Multiplie chaque valeur de la première ligne par le coefficient.$$,
      'expected', $$3×6=18 ; 5×6=30 ; 8×6=48. La deuxième ligne est donc 18 ; 30 ; 48.$$
    ),
    jsonb_build_object(
      'question', $$Un sac de riz de 250 g coûte 800 F. Il contient 60% de riz local et 40% de riz importé. Calcule la masse de chaque variété, puis le nouveau prix du sac après une réduction de 20%.$$,
      'hint', $$Calcule d'abord chaque masse avec la formule du pourcentage d'une quantité, puis applique la formule de la réduction au prix.$$,
      'expected', $$Riz local : 250×60/100 = 150 g. Riz importé : 250×40/100 = 100 g. Nouveau prix : 800×(1−20/100) = 800×80/100 = 640 F.$$
    )
  ),
  now()
);
