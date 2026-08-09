-- Rewrites 'maths-calcul-litteral' with the richer, source-grounded content
-- shape (situation d'apprentissage -> sections with a boxed property +
-- worked example + tappable fixation check -> situation d'évaluation) —
-- see lib/courses.ts's CourseContentV2 and components/course-content.tsx.
-- Structure/pedagogy follows the official DPFC/MENA "Leçon 1: Calcul
-- littéral" programme document (retrieved via ecole-ci.org), but every
-- sentence, example and exercise here is an original rewrite, never a copy
-- or close paraphrase of that copyrighted document. No diagram: this lesson
-- is purely algebraic, nothing geometric to draw.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un opérateur téléphonique propose un forfait dont le prix dépend du nombre de Go consommés, mais personne dans la classe ne connaît la formule exacte. Pour comparer plusieurs offres sans refaire le calcul à chaque fois, les élèves de troisième décident d'écrire cette formule avec des lettres plutôt qu'avec des nombres fixes — c'est tout l'enjeu du calcul littéral : manipuler des expressions qui restent valables quels que soient les nombres qu'on y met.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Égalité de deux quotients$$,
        'body', $$Deux fractions peuvent être égales sans que leurs numérateurs et dénominateurs soient identiques. Il existe une règle simple pour le vérifier sans calculer chaque quotient séparément, en comparant des produits en croix.$$,
        'highlights', array[$$produits en croix$$, $$quotients$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour des nombres a, b, c et d avec b ≠ 0 et d ≠ 0 : a/b = c/d équivaut à a × d = b × c.$$),
        'example', jsonb_build_object('statement', $$Détermine a tel que a/4 = 3/6.$$, 'solution', $$a/4 = 3/6 équivaut à a × 6 = 4 × 3, donc 6a = 12, donc a = 2.$$),
        'fixation', jsonb_build_object('question', $$Détermine x tel que x/5 = 4/10.$$, 'solution', $$x/5 = 4/10 équivaut à 10x = 20, donc x = 2.$$)
      ),
      jsonb_build_object(
        'heading', $$Puissances à exposant négatif$$,
        'body', $$Quand l'exposant d'une puissance est négatif, ça ne veut pas dire que le résultat est négatif : ça signifie simplement qu'on prend l'inverse de la puissance positive correspondante.$$,
        'highlights', array[$$exposant négatif$$, $$inverse$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a différent de 0 et n entier naturel non nul : a⁻ⁿ = 1/aⁿ. On garde aussi : aⁿ × aᵃ = aⁿ⁺ᵃ ; (aᵃ)ⁿ = aᵃˣⁿ ; aᵃ/aⁿ = aᵃ⁻ⁿ.$$),
        'example', jsonb_build_object('statement', $$Calcule 2⁻⁴.$$, 'solution', $$2⁻⁴ = 1/2⁴ = 1/16.$$),
        'fixation', jsonb_build_object('question', $$Écris plus simplement : 5³ × 5⁻⁵.$$, 'solution', $$5³ × 5⁻⁵ = 5⁻² = 1/25.$$)
      ),
      jsonb_build_object(
        'heading', $$Développer et réduire une expression$$,
        'body', $$Avant de simplifier une expression avec des parenthèses, il faut d'abord les supprimer correctement : le signe devant la parenthèse change tout, et la multiplication passe toujours avant l'addition.$$,
        'highlights', array[$$développer$$, $$réduire$$, $$distributivité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$a(x + y) = ax + ay ; a(x − y) = ax − ay ; a − (b + c) = a − b − c ; a − (b − c) = a − b + c.$$),
        'example', jsonb_build_object('statement', $$Développe et réduis : 3x(x + 2) − 2x(x − 1).$$, 'solution', $$3x(x+2) − 2x(x−1) = 3x² + 6x − 2x² + 2x = x² + 8x.$$),
        'fixation', jsonb_build_object('question', $$Développe et réduis : 4x(x − 3) + 2x(x + 5).$$, 'solution', $$4x(x−3)+2x(x+5) = 4x² − 12x + 2x² + 10x = 6x² − 2x.$$)
      ),
      jsonb_build_object(
        'heading', $$Identités remarquables$$,
        'body', $$Certains produits reviennent si souvent qu'il vaut mieux connaître leur résultat par cœur plutôt que de les redévelopper chaque fois : ce sont les identités remarquables.$$,
        'highlights', array[$$identités remarquables$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$(a+b)² = a² + 2ab + b² ; (a−b)² = a² − 2ab + b² ; (a+b)(a−b) = a² − b².$$),
        'example', jsonb_build_object('statement', $$Développe (2x − 3)².$$, 'solution', $$(2x−3)² = (2x)² − 2×2x×3 + 3² = 4x² − 12x + 9.$$),
        'fixation', jsonb_build_object('question', $$Développe (x + 5)(x − 5).$$, 'solution', $$(x+5)(x−5) = x² − 25.$$)
      ),
      jsonb_build_object(
        'heading', $$Factoriser une expression$$,
        'body', $$Factoriser, c'est l'inverse de développer : on part d'une somme et on la transforme en produit, souvent en repérant un facteur commun ou en reconnaissant une identité remarquable à l'envers.$$,
        'highlights', array[$$factoriser$$, $$facteur commun$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si une même expression apparaît dans chaque terme, on peut la mettre en facteur : ax + bx = x(a + b).$$),
        'example', jsonb_build_object('statement', $$Factorise 5x(x+1) − 3(x+1).$$, 'solution', $$5x(x+1) − 3(x+1) = (x+1)(5x − 3).$$),
        'fixation', jsonb_build_object('question', $$Factorise x² − 49.$$, 'solution', $$x² − 49 = x² − 7² = (x−7)(x+7).$$)
      ),
      jsonb_build_object(
        'heading', $$Produit nul et nombres de même carré$$,
        'body', $$Pour résoudre une équation où un produit vaut zéro, pas besoin de tout développer : il suffit qu'un seul des facteurs soit nul. Une équation du type x² = un nombre positif a, elle, presque toujours deux solutions opposées.$$,
        'highlights', array[$$produit nul$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$a × b = 0 équivaut à a = 0 ou b = 0. Et si a² = b², alors a = b ou a = −b.$$),
        'example', jsonb_build_object('statement', $$Résous (x−4)(x+2) = 0.$$, 'solution', $$(x−4)(x+2) = 0 équivaut à x−4=0 ou x+2=0, donc x = 4 ou x = −2.$$),
        'fixation', jsonb_build_object('question', $$Résous x² = 36.$$, 'solution', $$x² = 36 équivaut à x² = 6², donc x = 6 ou x = −6.$$)
      ),
      jsonb_build_object(
        'heading', $$Monômes et polynômes$$,
        'body', $$Une expression comme 5x² a un nom précis : c'est un monôme, avec un coefficient et un degré. Quand on additionne plusieurs monômes différents, on obtient un polynôme, dont le degré est celui du monôme le plus élevé.$$,
        'highlights', array[$$monôme$$, $$polynôme$$, $$degré$$, $$coefficient$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans le monôme 5x², 5 est le coefficient et 2 est le degré. Un polynôme est une somme de monômes ; son degré est le plus grand des degrés de ses monômes.$$),
        'example', jsonb_build_object('statement', $$Donne le coefficient et le degré de −3x⁴.$$, 'solution', $$Le coefficient est −3 et le degré est 4.$$),
        'fixation', jsonb_build_object('question', $$Quel est le degré du polynôme 7x³ − 2x⁵ + 4 ?$$, 'solution', $$Le degré est 5 : c'est le plus grand exposant présent.$$)
      ),
      jsonb_build_object(
        'heading', $$Fractions rationnelles$$,
        'body', $$Une fraction rationnelle existe seulement quand son dénominateur n'est pas nul : c'est la toute première chose à vérifier avant de simplifier quoi que ce soit.$$,
        'highlights', array[$$fraction rationnelle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une fraction A/B existe si et seulement si B ≠ 0. Pour la simplifier, on factorise le numérateur et le dénominateur, puis on élimine les facteurs communs.$$),
        'example', jsonb_build_object('statement', $$Simplifie (x−2)(x+2) / [(x+2)(x−1)] pour x ≠ −2 et x ≠ 1.$$, 'solution', $$En éliminant le facteur commun (x+2), on obtient (x−2)/(x−1).$$),
        'fixation', jsonb_build_object('question', $$Pour quelles valeurs de x la fraction (x+1)/(2x−6) existe-t-elle ?$$, 'solution', $$Elle existe si 2x−6 ≠ 0, c'est-à-dire si x ≠ 3.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un atelier de couture fabrique des boubous pour un salon artisanal. Chaque boubou est vendu 8000 F. Le coût de fabrication journalier de x boubous est donné par C = 7940x + x². La couturière responsable de l'atelier veut savoir combien de boubous elle doit produire pour que les dépenses et les recettes s'équilibrent exactement.$$,
      'questions', array[
        $$Exprime en fonction de x la recette R de x boubous vendus.$$,
        $$Sachant que le bénéfice est B = R − C, montre que B = x(60 − x).$$,
        $$Déduis-en le nombre de boubous pour lequel les dépenses et la recette s'équilibrent.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Détermine la valeur de a telle que a/7 = 3/21.$$,
      'hint', $$Relis le passage sur l'égalité de deux quotients : a/b = c/d équivaut à a × d = b × c.$$,
      'expected', $$a/7 = 3/21 équivaut à 21a = 21, donc a = 1.$$
    ),
    jsonb_build_object(
      'question', $$Écris plus simplement 4⁻² × 4⁵.$$,
      'hint', $$Relis les propriétés des puissances à exposant négatif : aⁿ × aᵃ = aⁿ⁺ᵃ.$$,
      'expected', $$4⁻² × 4⁵ = 4³ = 64.$$
    ),
    jsonb_build_object(
      'question', $$Développe, réduis puis factorise si possible : (x+3)² − 9.$$,
      'hint', $$Relis d'abord les identités remarquables, puis la factorisation par facteur commun.$$,
      'expected', $$(x+3)² − 9 = x² + 6x + 9 − 9 = x² + 6x = x(x+6).$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation (2x−5)(x+4) = 0, puis explique pourquoi il y a deux solutions.$$,
      'hint', $$Relis la propriété du produit nul : un produit est nul si l'un au moins de ses facteurs est nul.$$,
      'expected', $$(2x−5)(x+4)=0 équivaut à 2x−5=0 ou x+4=0, donc x=2,5 ou x=−4 ; deux valeurs différentes annulent chacune l'un des deux facteurs, d'où les deux solutions.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-calcul-litteral';
