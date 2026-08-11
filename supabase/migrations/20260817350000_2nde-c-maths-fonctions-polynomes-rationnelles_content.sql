-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3136: "MATH_2C L6: FONCTIONS POLYNÔMES ET FONCTIONS
-- RATIONNELLES" (https://lyc.ecole-ci.org/course/view.php?id=3136)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30907, redirecting
-- to pluginfile "Maths 2C_L6_Fonctions polynomes et fonctions
-- rationnelles.pdf" (18 pages).
-- Rewritten/paraphrased from the source PDF: définition d'un polynôme,
-- degré, égalité de deux polynômes, zéro d'un polynôme, opérations (somme,
-- produit), forme canonique et factorisation du second degré, signe de
-- ax+b et de ax²+bx+c, factorisation par (x−α) et division euclidienne,
-- fractions rationnelles et leur ensemble de définition. La situation
-- complexe d'évaluation (carte de la Saint-Valentin avec marges, aire de la
-- zone imprimable) est reformulée avec d'autres valeurs numériques. 100%
-- original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-fonctions-polynomes-rationnelles',
  '2nde',
  'C',
  'mathematiques',
  $$Fonctions polynômes et fonctions rationnelles$$,
  6,
  '2nde-c-maths-droites-plans-espace',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La coopérative scolaire d'un lycée utilise un terrain rectangulaire de 8 m sur 5 m pour produire des tomates. Pour mieux organiser l'espace disponible, le proviseur demande que les deux côtés du terrain soient augmentés chacun d'une même longueur x, afin d'obtenir un nouveau terrain rectangulaire dont l'aire vaudrait 88 m². Pour répondre à cette exigence, les élèves de la classe décident d'étudier les fonctions polynômes et les fonctions rationnelles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Polynômes : définition, degré et égalité$$,
        'body', $$Un polynôme est une expression qui peut s'écrire, de façon unique, sous la forme réduite et ordonnée aₙxⁿ + aₙ₋₁xⁿ⁻¹ + ⋯ + a₁x + a₀, où n est un entier naturel et a₀, a₁, …, aₙ sont des nombres réels appelés coefficients, avec aₙ ≠ 0. L'entier n est appelé degré du polynôme, noté d°P. Deux polynômes P et Q sont égaux si et seulement s'ils ont le même degré et que leurs coefficients de même degré sont deux à deux égaux. On appelle zéro d'un polynôme P tout nombre réel α tel que P(α) = 0 ; chercher les zéros de P revient à résoudre l'équation P(x) = 0.$$,
        'highlights', array[$$polynôme$$, $$degré d'un polynôme$$, $$zéro d'un polynôme$$]::text[],
        'example', jsonb_build_object('statement', $$Le polynôme G est défini par G(x) = x²−9. Détermine ses zéros.$$, 'solution', $$G(x) = 0 équivaut à x²−9 = 0, soit (x−3)(x+3) = 0, donc x = 3 ou x = −3 : les zéros de G sont 3 et −3.$$),
        'fixation', jsonb_build_object('question', $$Les polynômes P(x) = ax²−3x+2 et Q(x) = 5x²+bx+2 sont égaux. Détermine a et b.$$, 'solution', $$Pour que P et Q soient égaux, il faut que leurs coefficients de même degré coïncident : a = 5 et −3 = b, donc b = −3.$$)
      ),
      jsonb_build_object(
        'heading', $$Opérations sur les polynômes et forme canonique$$,
        'body', $$La somme (P+Q) et le produit (P×Q) de deux polynômes sont eux-mêmes des polynômes : (P+Q)(x) = P(x)+Q(x) et (P×Q)(x) = P(x)×Q(x). Si P et Q sont non nuls, le degré du produit est la somme de leurs degrés : d°(P×Q) = d°P + d°Q. Pour un polynôme du second degré P(x) = ax²+bx+c (a≠0), on peut toujours l'écrire sous une forme canonique a[(x+α)²+β], obtenue en utilisant l'identité remarquable du carré ; cette forme facilite l'étude du signe de P et sa factorisation.$$,
        'highlights', array[$$somme, produit de polynômes$$, $$forme canonique$$]::text[],
        'property', jsonb_build_object('label', $$Factorisation à partir de la forme canonique$$, 'text', $$Soit P(x) = a[(x+α)²+β] la forme canonique de P. Si β > 0, P n'est pas factorisable (il n'a pas de zéro réel). Si β < 0, P est factorisable et admet deux zéros distincts. Si β = 0, P admet un seul zéro (zéro double).$$),
        'example', jsonb_build_object('statement', $$Écris Q(x) = x²−x−2 sous forme canonique, puis factorise-le.$$, 'solution', $$Q(x) = (x−1/2)² − (1/2)² − 2 = (x−1/2)² − 9/4. Comme 9/4 s'écrit (3/2)², on a Q(x) = (x−1/2−3/2)(x−1/2+3/2) = (x−2)(x+1).$$),
        'fixation', jsonb_build_object('question', $$Un polynôme du second degré a pour forme canonique 2[(x−1)²+5]. Est-il factorisable ? Pourquoi ?$$, 'solution', $$Non, car β = 5 > 0, donc ce polynôme n'a pas de zéro réel et n'est pas factorisable.$$)
      ),
      jsonb_build_object(
        'heading', $$Signe de ax+b et de ax²+bx+c$$,
        'body', $$Pour étudier le signe d'une expression du premier degré ax+b, on résout l'équation ax+b=0 pour trouver le nombre qui l'annule, puis on dresse un tableau de signes qui change de signe exactement en ce nombre (le signe est celui de a après le zéro, celui de −a avant). Pour étudier le signe d'une expression du second degré ax²+bx+c, on utilise sa forme canonique : lorsqu'elle est factorisable, on obtient un tableau de signes avec deux changements de signe aux deux zéros ; lorsqu'elle ne l'est pas, l'expression garde un signe constant, celui de a, sur tout R.$$,
        'highlights', array[$$signe de ax+b$$, $$signe de ax²+bx+c$$, $$tableau de signes$$]::text[],
        'example', jsonb_build_object('statement', $$Étudie le signe de S(x) = −9x²+6x−1.$$, 'solution', $$La forme canonique de S est S(x) = −9(x−1/3)². Comme (x−1/3)² ≥ 0 pour tout x et que le facteur −9 est négatif, on a S(x) ≤ 0 pour tout x réel, avec égalité uniquement en x=1/3.$$),
        'fixation', jsonb_build_object('question', $$Comment varie le signe de l'expression −2x+2 sur R ?$$, 'solution', $$Elle s'annule en x=1 ; elle est positive pour x<1 et négative pour x>1 (le coefficient de x étant négatif).$$)
      ),
      jsonb_build_object(
        'heading', $$Factorisation par (x−α) et division euclidienne$$,
        'body', $$Si α est un zéro d'un polynôme P, alors il existe un unique polynôme Q, de degré d°P−1, tel que P(x) = (x−α)Q(x) : on dit que P est factorisable par (x−α). Le polynôme Q, appelé quotient de P par (x−α), peut être déterminé par la méthode des coefficients indéterminés, ou par une division euclidienne posée comme celle des nombres entiers. Une conséquence utile de cette propriété est qu'un polynôme de degré n admet au plus n zéros distincts.$$,
        'highlights', array[$$zéro et factorisation$$, $$division euclidienne de polynômes$$]::text[],
        'example', jsonb_build_object('statement', $$Vérifie que 1 est un zéro de P(x) = 2x³−x²+x−2, puis détermine le quotient de P par (x−1).$$, 'solution', $$P(1) = 2−1+1−2 = 0, donc 1 est bien un zéro de P. En posant la division euclidienne de P(x) par (x−1), on obtient P(x) = (x−1)(2x²+x+2).$$),
        'fixation', jsonb_build_object('question', $$Un polynôme de degré 4 peut-il avoir 5 zéros distincts ?$$, 'solution', $$Non, un polynôme de degré n admet au plus n zéros distincts, donc un polynôme de degré 4 a au plus 4 zéros distincts.$$)
      ),
      jsonb_build_object(
        'heading', $$Fractions rationnelles$$,
        'body', $$On appelle fraction rationnelle le quotient P/Q de deux polynômes non nuls P et Q. L'ensemble de définition d'une fraction rationnelle P/Q est l'ensemble des nombres réels privé des zéros du dénominateur Q. Lorsque le numérateur et le dénominateur ont un facteur commun, on peut simplifier la fraction rationnelle en factorisant chacun d'eux (souvent grâce aux zéros communs ou à la forme canonique), ce qui permet parfois d'agrandir l'ensemble de définition apparent ou, en tout cas, de rendre l'expression plus simple à étudier.$$,
        'highlights', array[$$fraction rationnelle$$, $$ensemble de définition$$, $$simplification$$]::text[],
        'example', jsonb_build_object('statement', $$Simplifie la fraction rationnelle f(x) = (2x³−x²+x−2)/(2x²+4x−6) après avoir vérifié que 1 est un zéro commun au numérateur et au dénominateur.$$, 'solution', $$On factorise le numérateur par (x−1) : 2x³−x²+x−2 = (x−1)(2x²+x+2). On factorise aussi le dénominateur : 2x²+4x−6 = 2(x−1)(x+3). En simplifiant par (x−1), on obtient f(x) = (2x²+x+2)/(2(x+3)) pour x≠1.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'ensemble de définition d'une fraction rationnelle P/Q ?$$, 'solution', $$C'est l'ensemble des nombres réels privé des zéros du dénominateur Q.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour la fête des mères, un artisan souhaite imprimer une carte de forme carrée de côté x, avec x compris entre 9 cm et 20 cm, sur du papier photo. Il doit laisser une marge de 3 cm en haut et en bas de la carte, ainsi qu'une marge de 2 cm à gauche et à droite. Il souhaite que l'aire de la surface imprimable (celle qui reste une fois les marges retirées) soit exactement égale à 24 cm².$$,
      'questions', array[
        $$Exprime les dimensions de la surface imprimable en fonction de x, en tenant compte des marges données.$$,
        $$Exprime l'aire A(x) de la surface imprimable comme un produit de deux expressions en x.$$,
        $$Résous l'équation A(x) = 24 pour déterminer la valeur de x, en n'oubliant pas la contrainte 9 ≤ x ≤ 20.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel est le degré du polynôme P(x) = 5x⁴ − 3x + 7 ?$$,
      'hint', $$Le degré est l'exposant le plus élevé qui apparaît dans l'écriture réduite.$$,
      'expected', $$Le degré de P est 4.$$
    ),
    jsonb_build_object(
      'question', $$Détermine les zéros du polynôme R(x) = x² − 16.$$,
      'hint', $$Utilise l'identité remarquable a²−b² = (a−b)(a+b).$$,
      'expected', $$R(x) = (x−4)(x+4), donc les zéros de R sont 4 et −4.$$
    ),
    jsonb_build_object(
      'question', $$Étudie le signe de l'expression 3x − 9 sur R.$$,
      'hint', $$Trouve d'abord la valeur qui annule l'expression.$$,
      'expected', $$3x−9 = 0 pour x=3 ; l'expression est négative pour x<3 et positive pour x>3.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'ensemble de définition de la fraction rationnelle f(x) = (x+2)/((x−1)(x+5)) ?$$,
      'hint', $$Il faut exclure les zéros du dénominateur.$$,
      'expected', $$Df = R\{1 ; −5}, car le dénominateur s'annule pour x=1 et x=−5.$$
    )
  ),
  now()
);
