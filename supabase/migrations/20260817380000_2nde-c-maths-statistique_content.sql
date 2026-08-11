-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3139: "MATH_2C L9: STATISTIQUE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3139)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30943, redirecting
-- to pluginfile "Maths 2C_L9_Statistiques.pdf" (13 pages).
-- Rewritten/paraphrased from the source PDF: effectifs et fréquences
-- cumulés, polygone des effectifs cumulés, mode et classe modale, moyenne,
-- médiane, étendue, écart moyen, variance et écart-type. La situation
-- complexe d'évaluation (institut de consommation analysant le taux de
-- matières grasses de fromages) est reformulée avec d'autres valeurs
-- numériques. 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-statistique',
  '2nde',
  'C',
  'mathematiques',
  $$Statistique$$,
  9,
  '2nde-c-maths-angles-orientes-trigonometrie',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au premier trimestre, les meilleurs élèves en mathématiques de deux classes de seconde C d'un même lycée ont obtenu les notes suivantes : 14 ; 13 ; 14 ; 9 ; 18 ; 13 ; 16 ; 17 pour le premier, et 7 ; 8 ; 17 ; 16 ; 19 ; 10 ; 20 ; 17 pour le second. Des élèves des deux classes veulent savoir qui, des deux premiers, est réellement « le plus fort » en mathématiques. Sachant que les deux séries ont la même moyenne, ces élèves décident de comparer la répartition de chacune des séries de notes autour de cette moyenne.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Effectifs cumulés et fréquences cumulées$$,
        'body', $$Pour une série statistique dont les modalités ne sont pas regroupées en classes, l'effectif cumulé croissant (respectivement décroissant) d'une modalité est la somme des effectifs des modalités inférieures ou égales à celle-ci (respectivement supérieures ou égales). La fréquence cumulée croissante (respectivement décroissante) se définit de façon analogue à partir des fréquences. Ces indicateurs permettent notamment de tracer le polygone des effectifs cumulés, en plaçant pour chaque classe un point d'abscisse la borne supérieure (ou inférieure) de la classe et d'ordonnée l'effectif cumulé correspondant, puis en reliant ces points par des segments.$$,
        'highlights', array[$$effectif cumulé$$, $$fréquence cumulée$$, $$polygone des effectifs cumulés$$]::text[],
        'example', jsonb_build_object('statement', $$Une série statistique a pour effectifs 10, 25, 35, 12 et 6 pour cinq classes successives. Quel est l'effectif cumulé croissant de la troisième classe ?$$, 'solution', $$C'est la somme des effectifs des trois premières classes : 10+25+35 = 70.$$),
        'fixation', jsonb_build_object('question', $$Que représente l'effectif cumulé décroissant d'une modalité ?$$, 'solution', $$C'est la somme des effectifs de toutes les modalités supérieures ou égales à celle-ci.$$)
      ),
      jsonb_build_object(
        'heading', $$Mode, classe modale et moyenne$$,
        'body', $$Le mode d'une série statistique est toute modalité d'effectif (ou de fréquence) maximal. Lorsque les modalités sont regroupées en classes de même amplitude, on parle de classe modale : c'est la classe d'effectif maximal, et son centre est appelé mode de la série. La moyenne d'une série statistique (xᵢ,nᵢ), notée x̄, se calcule en multipliant chaque valeur (ou chaque centre de classe) par son effectif, en additionnant tous ces produits, puis en divisant par l'effectif total N.$$,
        'highlights', array[$$mode, classe modale$$, $$moyenne$$]::text[],
        'example', jsonb_build_object('statement', $$Un relevé du nombre de postes dans les cybercafés d'une commune donne : 6 postes (4 cybercafés), 11 postes (6 cybercafés), 12 postes (5 cybercafés), 13 postes (3 cybercafés). Calcule la moyenne de cette série.$$, 'solution', $$x̄ = (6×4 + 11×6 + 12×5 + 13×3)/(4+6+5+3) = (24+66+60+39)/18 = 189/18 = 10,5.$$),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on le mode d'une série statistique ?$$, 'solution', $$C'est la modalité qui a l'effectif (ou la fréquence) le plus élevé.$$)
      ),
      jsonb_build_object(
        'heading', $$La médiane d'une série statistique$$,
        'body', $$La médiane d'une série statistique est la modalité qui partage la population étudiée en deux parties de même effectif (ou de même fréquence) : c'est la modalité dont l'effectif cumulé est égal à N/2, où N est l'effectif total. Lorsque la série a un effectif impair, la médiane correspond à la modalité de rang (N+1)/2. Lorsqu'elle a un effectif pair, la médiane est la moyenne des modalités de rangs N/2 et N/2+1. Pour déterminer une médiane, il faut toujours ranger les modalités par ordre croissant, ce que l'on peut aussi faire à l'aide des polygones des effectifs cumulés.$$,
        'highlights', array[$$médiane$$, $$rang$$]::text[],
        'example', jsonb_build_object('statement', $$Un groupe d'élèves a obtenu les notes suivantes, déjà rangées : 5 ; 7 ; 8 ; 11 ; 15 ; 17 ; 10. Détermine la médiane (attention, il faut d'abord ranger correctement).$$, 'solution', $$En rangeant dans l'ordre croissant : 5 ; 7 ; 8 ; 10 ; 11 ; 15 ; 17. L'effectif est impair (7), donc la médiane est la modalité de rang (7+1)/2 = 4, c'est-à-dire 10.$$),
        'fixation', jsonb_build_object('question', $$Une série a un effectif pair de 8. Quels sont les rangs des deux modalités dont on fait la moyenne pour obtenir la médiane ?$$, 'solution', $$Les rangs 8/2 = 4 et 8/2+1 = 5.$$)
      ),
      jsonb_build_object(
        'heading', $$Étendue et écart moyen$$,
        'body', $$L'étendue d'une série statistique est la différence entre sa plus grande et sa plus petite valeur observée : elle donne une première idée, très grossière, de la dispersion des données. L'écart moyen, noté e, est une mesure plus fine de cette dispersion : c'est la moyenne des valeurs absolues des écarts entre chaque valeur et la moyenne de la série, pondérée par les effectifs. Plus l'écart moyen est petit, plus les valeurs de la série sont regroupées autour de la moyenne ; plus il est grand, plus elles sont dispersées.$$,
        'highlights', array[$$étendue$$, $$écart moyen$$]::text[],
        'example', jsonb_build_object('statement', $$Une série a pour étendue 250−0 = 250. Que peut-on en conclure sur la dispersion ?$$, 'solution', $$Une étendue de 250 signifie que l'écart entre la plus petite et la plus grande valeur de la série est de 250 ; cela suggère une forte dispersion, mais l'étendue seule ne dit rien sur la répartition entre ces deux extrêmes.$$),
        'fixation', jsonb_build_object('question', $$Comment calcule-t-on l'étendue d'une série statistique ?$$, 'solution', $$C'est la différence entre la plus grande et la plus petite valeur de la série.$$)
      ),
      jsonb_build_object(
        'heading', $$Variance et écart-type$$,
        'body', $$La variance V d'une série statistique de moyenne x̄ est la moyenne des carrés des écarts entre chaque valeur et la moyenne, pondérée par les effectifs. En pratique, on utilise souvent la formule équivalente V = (moyenne des carrés des valeurs) − (x̄)², plus rapide à calculer. L'écart-type, noté σ (sigma), est la racine carrée de la variance : σ = √V. Comme l'écart moyen, l'écart-type mesure la dispersion des valeurs autour de la moyenne, mais il est plus utilisé en pratique car il se prête mieux aux calculs et aux comparaisons entre séries.$$,
        'highlights', array[$$variance$$, $$écart-type$$]::text[],
        'example', jsonb_build_object('statement', $$Une série de moyenne 10,5 a pour valeurs 6, 11, 12, 13 avec les effectifs 4, 6, 5, 3 (effectif total 18). Sachant que la variance vaut environ 1,61, calcule l'écart-type.$$, 'solution', $$σ = √1,61 ≈ 1,27.$$),
        'fixation', jsonb_build_object('question', $$Comment obtient-on l'écart-type à partir de la variance ?$$, 'solution', $$L'écart-type est la racine carrée de la variance : σ = √V.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves de seconde C découvrent, dans une revue, le texte suivant : « Un institut de consommation analyse 100 fromages d'une laiterie qui les fabrique et les vend avec la mention 45% de matières grasses. » L'institut a obtenu la répartition suivante du taux de matières grasses (en %) sur les 100 fromages testés, classés par intervalles : [41;42[ (2 fromages), [42;43[ (10), [43;44[ (25), [44;45[ (40), [45;46[ (21), [46;47[ (2).$$,
      'questions', array[
        $$Calcule la moyenne des taux de matières grasses de cette série (en utilisant le centre de chaque classe).$$,
        $$Calcule la variance puis l'écart-type de cette série de taux de matières grasses.$$,
        $$En utilisant le tableau des effectifs cumulés croissants, détermine une estimation du taux de matières grasses correspondant à 95 fromages sur les 100 testés, puis commente le résultat par rapport à la mention affichée par la laiterie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Une série statistique a pour effectifs 8, 15, 22 et 5 pour quatre classes successives. Calcule l'effectif cumulé croissant de la deuxième classe.$$,
      'hint', $$Additionne les effectifs des classes inférieures ou égales.$$,
      'expected', $$8+15 = 23.$$
    ),
    jsonb_build_object(
      'question', $$Une série a pour valeurs 5, 9, 9, 12 avec les effectifs 2, 3, 3, 2 (effectif total 10). Calcule la moyenne de cette série.$$,
      'hint', $$Multiplie chaque valeur par son effectif, additionne, puis divise par l'effectif total.$$,
      'expected', $$x̄ = (5×2+9×3+9×3+12×2)/10 = (10+27+27+24)/10 = 88/10 = 8,8.$$
    ),
    jsonb_build_object(
      'question', $$Une série rangée par ordre croissant a pour valeurs 3 ; 6 ; 7 ; 9 ; 12 ; 15 (effectif pair de 6). Détermine la médiane.$$,
      'hint', $$Fais la moyenne des modalités de rangs 3 et 4.$$,
      'expected', $$La médiane est (7+9)/2 = 8.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la plus petite valeur d'une série dont l'étendue est 40 et dont la plus grande valeur est 95 ?$$,
      'hint', $$Étendue = plus grande valeur − plus petite valeur.$$,
      'expected', $$95 − 40 = 55.$$
    )
  ),
  now()
);
