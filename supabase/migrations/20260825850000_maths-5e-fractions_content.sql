-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Calculs algébriques).
-- Cours : "Leçon 6 : Fractions". Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés,
-- valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une O.N.G. offre un lot à une classe de 5ème pour récompenser ses trois meilleurs élèves. Le professeur informe que 2/7 du lot reviendront au deuxième élève, et le troisième recevra 1/5 de la part du deuxième. Les élèves veulent calculer la part qui revient au premier élève, et pour cela approfondissent leurs connaissances sur les fractions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Différence et produit de fractions$$,
        'body', $$Pour des fractions de même dénominateur : a/c - b/c = (a-b)/c. Pour des dénominateurs différents, on réduit d'abord au même dénominateur avant de soustraire. Pour le produit : (a/b) × k = (k×a)/b, et (a/b) × (c/d) = (a×c)/(b×d).$$,
        'highlights', array[$$même dénominateur : a/c - b/c = (a-b)/c$$, $$dénominateurs différents : réduire au même dénominateur d'abord$$, $$produit : (a/b)×(c/d) = (a×c)/(b×d)$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule 9/4 - 5/3.$$, 'solution', $$9/4 - 5/3 = 27/12 - 20/12 = 7/12.$$),
        'fixation', jsonb_build_object('question', $$Calcule 8/21 × 12/4.$$, 'solution', $$(8×12)/(21×4) = 96/84 = 8/7 (fraction simplifiée).$$)
      ),
      jsonb_build_object(
        'heading', $$Puissance entière d'une fraction$$,
        'body', $$(a/b)ⁿ désigne le produit de n facteurs égaux à a/b. Propriété : (a/b)ⁿ = aⁿ/bⁿ. Par convention, (a/b)⁰ = 1 et (a/b)¹ = a/b.$$,
        'highlights', array[$$(a/b)ⁿ = aⁿ/bⁿ$$, $$(a/b)⁰=1 ; (a/b)¹=a/b$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule (3/2)⁵.$$, 'solution', $$(3/2)⁵ = 3⁵/2⁵ = 243/32.$$),
        'fixation', jsonb_build_object('question', $$Calcule (4/9)².$$, 'solution', $$4²/9² = 16/81.$$)
      ),
      jsonb_build_object(
        'heading', $$Encadrement d'une fraction par des nombres décimaux$$,
        'body', $$Pour encadrer une fraction a/b par deux nombres décimaux consécutifs d'un ordre donné, on effectue la division de a par b jusqu'à l'ordre souhaité, puis on choisit les deux décimaux consécutifs appropriés.$$,
        'highlights', array[$$encadrement : diviser a par b à l'ordre voulu, encadrer avec les décimaux consécutifs obtenus$$]::text[],
        'example', jsonb_build_object('statement', $$Encadre 48/7 par deux entiers consécutifs, puis par deux décimaux consécutifs d'ordre 2.$$, 'solution', $$48/7 ≈ 6,85..., donc 6 < 48/7 < 7, et 6,85 < 48/7 < 6,86.$$),
        'fixation', jsonb_build_object('question', $$Encadre 11/21 à l'unité (entre deux entiers consécutifs).$$, 'solution', $$0 < 11/21 < 1 (car 11/21 ≈ 0,523).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À sa création en 2016, un collège comptait 64 élèves en classe de 5ème. Depuis, l'effectif de chaque année représente les 3/2 de celui de l'année précédente. L'éducateur du niveau a besoin de connaître l'effectif de 2018 pour un rapport, mais son bureau a été cambriolé.$$,
      'questions', array[
        $$Détermine la proportion de l'effectif de 2018 par rapport à celui de 2016 (utilise une puissance de 3/2).$$,
        $$Calcule l'effectif des élèves de 5ème en 2018.$$,
        $$Explique pourquoi on utilise une puissance de la fraction 3/2 pour ce calcul.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule 9/5 - 2/5.$$,
      'hint', $$Même dénominateur : soustrais directement les numérateurs.$$,
      'expected', $$7/5.$$
    ),
    jsonb_build_object(
      'question', $$Calcule 3 × 5/7.$$,
      'hint', $$Multiplie l'entier par le numérateur.$$,
      'expected', $$15/7.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (1/2)⁴.$$,
      'hint', $$Élève le numérateur et le dénominateur à la puissance 4 séparément.$$,
      'expected', $$1/16.$$
    ),
    jsonb_build_object(
      'question', $$Un restaurant sert trois plats A, B, C. 3/7 des clients ont pris A, 1/4 ont pris B. Quelle proportion a pris C ?$$,
      'hint', $$La somme des trois proportions vaut 1.$$,
      'expected', $$1 - (3/7 + 1/4) = 1 - 19/28 = 9/28.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-fractions';
