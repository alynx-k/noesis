-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3141: "MATH_2C L11: ÉQUATIONS ET INÉQUATIONS DANS ℝ"
-- (https://lyc.ecole-ci.org/course/view.php?id=3141)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30967, redirecting
-- to pluginfile "Maths 2C_L11_Equation et inequation dans IR.pdf" (7 pages).
-- Rewritten/paraphrased from the source PDF: définition d'une équation et
-- équations équivalentes, résolution d'équations polynomiales et
-- rationnelles (avec ensemble de validité), équations avec valeurs
-- absolues, définition d'une inéquation, résolution d'inéquations liant
-- deux polynômes ou deux fractions rationnelles par tableau de signes. La
-- situation complexe d'évaluation (partage d'une épargne entre héritiers)
-- est reformulée avec d'autres valeurs numériques. 100% original wording;
-- no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-equations-inequations-reels',
  '2nde',
  'C',
  'mathematiques',
  $$Équations et inéquations dans ℝ$$,
  11,
  '2nde-c-maths-produit-scalaire',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un père, sentant sa mort approcher, réunit ses quatre enfants pour leur confier la répartition d'une somme d'argent placée en banque. Il décide que 15% de la somme revient à l'aîné, deux cinquièmes à un deuxième enfant, un quart à un troisième, et que 600 000 francs reviennent au cadet. Pour savoir combien de francs le père a placés en banque, le cadet, élève en classe de seconde C, approche ses amis de classe et décide avec eux d'utiliser leurs connaissances sur les équations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équations dans R : définition et équivalence$$,
        'body', $$Soient f et g deux fonctions de R vers R et x un réel. On appelle équation dans R d'inconnue x l'égalité (E) : f(x) = g(x). Résoudre cette équation, c'est déterminer l'ensemble des réels x pour lesquels cette égalité est vraie. Deux équations sont dites équivalentes lorsqu'elles ont exactement le même ensemble de solutions ; cette notion permet de transformer une équation en une autre, plus simple à résoudre, sans changer sa solution. Avant de résoudre une équation, il faut souvent préciser son ensemble de validité, c'est-à-dire l'ensemble des réels pour lesquels les deux membres de l'équation ont bien un sens.$$,
        'highlights', array[$$équation$$, $$équations équivalentes$$, $$ensemble de validité$$]::text[],
        'example', jsonb_build_object('statement', $$Vérifie que 2 est une solution de l'équation (E) : x²−1 = x+1, et donne une équation équivalente à (E) sous la forme P(x)=0.$$, 'solution', $$f(2)=2²−1=3 et g(2)=2+1=3, donc f(2)=g(2) : 2 est bien une solution de (E). En transposant, x²−1=x+1 équivaut à x²−x−2=0, qui est une équation équivalente à (E).$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire que deux équations sont équivalentes ?$$, 'solution', $$Cela signifie qu'elles ont exactement le même ensemble de solutions.$$)
      ),
      jsonb_build_object(
        'heading', $$Résolution d'équations polynomiales et rationnelles$$,
        'body', $$Pour résoudre une équation du type P(x) = Q(x) où P et Q sont des polynômes, on se ramène à une équation du type H(x) = 0 où H(x) = P(x) − Q(x), puis on factorise H si possible, ce qui permet de résoudre l'équation en utilisant la propriété du produit nul (un produit de facteurs est nul si et seulement si l'un au moins des facteurs est nul). Pour une équation liant deux fractions rationnelles, on détermine d'abord l'ensemble de validité (en excluant les valeurs qui annulent un dénominateur), puis on transforme l'équation, souvent en multipliant par les dénominateurs, avant de conclure en tenant compte de l'ensemble de validité.$$,
        'highlights', array[$$équation polynomiale$$, $$équation rationnelle$$, $$produit nul$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans R l'équation 3/(x²−4) = 1/(x+2).$$, 'solution', $$Il faut x ≠ −2 et x ≠ 2. L'équation équivaut à 3(x+2) = x²−4, soit 3(x+2)−(x−2)(x+2)=0, soit (x+2)(3−(x−2))=0, soit (x+2)(5−x)=0. On obtient x=−2 (exclu par l'ensemble de validité) ou x=5. Donc S = {5}.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi doit-on toujours préciser l'ensemble de validité avant de résoudre une équation avec des fractions rationnelles ?$$, 'solution', $$Pour exclure les valeurs qui annuleraient un dénominateur, ce qui rendrait l'équation privée de sens pour ces valeurs.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations avec valeurs absolues$$,
        'body', $$Pour résoudre une équation du type |f(x)| = |g(x)|, on utilise l'équivalence suivante : cette égalité équivaut à f(x) = g(x) ou f(x) = −g(x). On résout donc successivement les deux équations f(x)=g(x) et f(x)=−g(x), et l'ensemble des solutions de l'équation de départ est la réunion des ensembles de solutions de ces deux équations.$$,
        'highlights', array[$$|f(x)|=|g(x)|$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans R l'équation |2x−1| = |x+3|.$$, 'solution', $$Cela équivaut à 2x−1=x+3 ou 2x−1=−(x+3). La première équation donne x=4. La seconde donne 2x−1=−x−3, soit 3x=−2, soit x=−2/3. Donc S = {4 ; −2/3}.$$),
        'fixation', jsonb_build_object('question', $$À quelles deux équations est équivalente l'équation |f(x)|=|g(x)| ?$$, 'solution', $$f(x)=g(x) ou f(x)=−g(x).$$)
      ),
      jsonb_build_object(
        'heading', $$Inéquations dans R : définition$$,
        'body', $$Soient f et g deux fonctions de R vers R. L'inégalité (I) : f(x) ≤ g(x) (ou avec un autre symbole d'inégalité) est appelée inéquation dans R d'inconnue x. Tout réel x qui vérifie f(x) ≤ g(x) est appelé solution de l'inéquation (I), et résoudre l'inéquation, c'est rechercher l'ensemble de toutes ses solutions. Comme pour les équations, deux inéquations sont équivalentes lorsqu'elles ont le même ensemble de solutions, et il convient de préciser les contraintes sur l'inconnue avant de résoudre.$$,
        'highlights', array[$$inéquation$$, $$solution d'une inéquation$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie « résoudre une inéquation » ?$$, 'solution', $$Cela signifie rechercher l'ensemble de tous les réels qui vérifient l'inéquation, c'est-à-dire l'ensemble de ses solutions.$$)
      ),
      jsonb_build_object(
        'heading', $$Résoudre une inéquation par un tableau de signes$$,
        'body', $$Pour résoudre une inéquation du type f(x) < g(x) où f et g sont des polynômes, on se ramène au cas d'une inéquation du type P(x) < 0, où P(x) = f(x) − g(x) ; on factorise P si possible, puis on étudie son signe à l'aide d'un tableau de signes qui recense le signe de chaque facteur. Pour une inéquation liant deux fractions rationnelles, on détermine d'abord l'ensemble de validité, on se ramène de même à une inéquation du type P(x) < 0 où P est la fraction rationnelle obtenue en faisant la différence des deux membres, on étudie le signe du numérateur et du dénominateur dans un même tableau, puis on conclut en tenant compte de l'ensemble de validité.$$,
        'highlights', array[$$tableau de signes$$, $$inéquation rationnelle$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans R l'inéquation (n−2)(n−3) > 0.$$, 'solution', $$Le tableau de signes montre que (n−2)(n−3) est positif pour n<2 ou n>3 (et négatif entre 2 et 3). Donc S = ]−∞;2[ ∪ ]3;+∞[.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la première étape pour résoudre une inéquation liant deux fractions rationnelles ?$$, 'solution', $$Déterminer l'ensemble de validité, c'est-à-dire exclure les valeurs qui annulent un dénominateur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le souci d'éviter des tensions après sa mort, un père de famille, sentant le poids de l'âge, propose de partager son épargne entre ses quatre enfants et sa femme de la manière suivante : l'aîné a le tiers de l'épargne diminué de 270 000 FCFA ; le deuxième enfant a le tiers du reste diminué de 270 000 FCFA ; le troisième enfant a le tiers du nouveau reste diminué de 270 000 FCFA ; le cadet a le tiers du reste suivant diminué de 270 000 FCFA ; et ce qui reste après ces quatre parts revient à la femme. Le cadet, en classe de seconde C, veut déterminer le montant minimum de l'épargne du père afin qu'il puisse en avoir au moins 2 000 000 FCFA, et connaître ensuite la part de chacun.$$,
      'questions', array[
        $$En notant x le montant total de l'épargne, exprime la part de l'aîné, puis le reste après cette première part.$$,
        $$En poursuivant le même raisonnement, exprime successivement la part du deuxième enfant, celle du troisième enfant, et celle du cadet, en fonction de x.$$,
        $$Traduis la condition « le cadet doit avoir au moins 2 000 000 FCFA » par une inéquation en x, résous-la, puis donne le montant minimum de l'épargne et la part de chaque enfant pour ce montant.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Résous dans R l'équation x²−5x+6 = 0 en la factorisant.$$,
      'hint', $$Cherche deux nombres dont la somme est 5 et le produit est 6.$$,
      'expected', $$x²−5x+6 = (x−2)(x−3), donc S = {2 ; 3}.$$
    ),
    jsonb_build_object(
      'question', $$Résous dans R l'équation |3x−2| = |x+4|.$$,
      'hint', $$Utilise l'équivalence : f(x)=g(x) ou f(x)=−g(x).$$,
      'expected', $$3x−2=x+4 donne x=3. 3x−2=−(x+4) donne 4x=−2, soit x=−1/2. Donc S={3 ; −1/2}.$$
    ),
    jsonb_build_object(
      'question', $$Résous dans R l'inéquation (2x−4)(x+1) < 0.$$,
      'hint', $$Trouve les valeurs qui annulent chaque facteur, puis dresse un tableau de signes.$$,
      'expected', $$Les facteurs s'annulent en x=2 et x=−1. Le produit est négatif entre les deux racines : S = ]−1 ; 2[.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'ensemble de validité de l'inéquation 5/(x−3) ≤ 2/x ?$$,
      'hint', $$Exclus les valeurs qui annulent chacun des deux dénominateurs.$$,
      'expected', $$Il faut x ≠ 3 et x ≠ 0, donc l'ensemble de validité est R\{0 ; 3}.$$
    )
  ),
  now()
);
