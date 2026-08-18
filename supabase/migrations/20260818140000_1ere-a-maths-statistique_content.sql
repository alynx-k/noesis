-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 870: "MATHS_1A L6: STATISTIQUES"
-- (https://lyc.ecole-ci.org/course/view.php?id=870), resource id 4089.
-- Contenu réécrit à partir du PDF source (séries en classes, amplitude,
-- centre, densité, classe modale, moyenne, médiane et quartiles par
-- interpolation linéaire, variance, écart type, écart absolu moyen, écart
-- interquartile). Formules reprises telles quelles ; explications,
-- exemples et situation d'apprentissage/complexe reformulés avec un autre
-- contexte (achat de café au lieu d'anacarde) et d'autres valeurs
-- numériques que la source. Aucune phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-statistique',
  '1ere',
  'A',
  'mathematiques',
  $$Statistique$$,
  6,
  '1ere-a-maths-suites-numeriques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après un devoir de mathématiques, le professeur d'une classe de 1ère A communique les notes obtenues par les élèves. Curieux de savoir comment la classe a globalement travaillé, les élèves décident de regrouper ces notes en classes, puis de calculer des indicateurs (moyenne, médiane) et de les représenter graphiquement pour mieux interpréter les résultats.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Classes, amplitude, centre et densité$$,
        'body', $$Pour une série statistique regroupée en classes [x1;x2[, [x2;x3[..., l'amplitude d'une classe [xi;xi+1[ est xi+1−xi, et son centre est ci=(xi+xi+1)/2. La densité d'une classe est le quotient de son effectif par son amplitude. On appelle classe modale toute classe dont la densité est maximale ; si toutes les classes ont la même amplitude, il suffit de comparer les effectifs.$$,
        'highlights', array[$$amplitude = xi+1 − xi$$, $$centre = (xi+xi+1)/2$$, $$densité = effectif/amplitude$$, $$classe modale$$]::text[],
        'example', jsonb_build_object('statement', $$Pour la classe [10;16[ d'effectif 18, calcule son amplitude, son centre et sa densité.$$, 'solution', $$Amplitude=16−10=6. Centre=(10+16)/2=13. Densité=18/6=3.$$),
        'fixation', jsonb_build_object('question', $$Comment détermine-t-on la classe modale lorsque les classes n'ont pas toutes la même amplitude ?$$, 'solution', $$C'est la classe dont la densité (effectif/amplitude) est la plus grande, pas nécessairement celle dont l'effectif est le plus grand.$$)
      ),
      jsonb_build_object(
        'heading', $$Moyenne$$,
        'body', $$La moyenne d'une série statistique regroupée en classes, notée x̄, se calcule par x̄=(1/N)(n1c1+n2c2+...+npcp), où N est l'effectif total et ci le centre de chaque classe. Avec les fréquences, x̄=f1c1+f2c2+...+fpcp.$$,
        'highlights', array[$$x̄ = (1/N)(n1c1+n2c2+...+npcp)$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule la moyenne de la série : classes [0;10[, [10;20[, [20;30[ d'effectifs respectifs 10, 15, 5 (centres 5, 15, 25).$$, 'solution', $$N=30. x̄=(10×5+15×15+5×25)/30=(50+225+125)/30=400/30≈13,33.$$),
        'fixation', jsonb_build_object('question', $$Que représente N dans la formule de la moyenne d'une série regroupée en classes ?$$, 'solution', $$L'effectif total de la série (la somme de tous les effectifs).$$)
      ),
      jsonb_build_object(
        'heading', $$Médiane et quartiles par interpolation linéaire$$,
        'body', $$La médiane Me sépare la série ordonnée en deux parties de même effectif. On la détermine par interpolation linéaire : on calcule N/2, on repère la classe [xi;xi+1[ où l'effectif cumulé croissant atteint cette valeur, puis on résout (Me−xi)/(xi+1−xi)=(N/2−Ni)/(Ni+1−Ni). Les quartiles Q1 et Q3 (25% et 75% des valeurs) se calculent de la même façon, en remplaçant N/2 par N×25/100 et N×75/100. L'écart interquartile est Q3−Q1.$$,
        'highlights', array[$$interpolation linéaire$$, $$Q1 : 25%, Q3 : 75%$$, $$écart interquartile = Q3 − Q1$$]::text[],
        'example', jsonb_build_object('statement', $$Une série a pour effectifs cumulés croissants : 10 (sur [0;10[), 25 (sur [10;20[), 30 (sur [20;30[). Détermine la classe où se trouve la médiane si N=30.$$, 'solution', $$N/2=15. 15 est compris entre 10 (rang de [0;10[) et 25 (rang de [10;20[), donc Me∈[10;20[.$$),
        'fixation', jsonb_build_object('question', $$Par quelle valeur remplace-t-on N/2 dans le calcul du premier quartile Q1 ?$$, 'solution', $$Par N×25/100 (soit 25% de l'effectif total).$$)
      ),
      jsonb_build_object(
        'heading', $$Caractéristiques de dispersion : variance, écart type, écart absolu moyen$$,
        'body', $$La variance V=(1/N)[n1(c1−x̄)²+n2(c2−x̄)²+...+np(cp−x̄)²], ou de façon équivalente V=(1/N)(n1c1²+...+npcp²)−x̄². L'écart type est σ=√V. L'écart absolu moyen est em=(1/N)(n1|c1−x̄|+n2|c2−x̄|+...+np|cp−x̄|). Ces indicateurs mesurent la dispersion des valeurs autour de la moyenne : plus ils sont grands, plus les valeurs sont dispersées.$$,
        'highlights', array[$$V = (1/N)Σni(ci−x̄)²$$, $$σ = √V$$, $$em = (1/N)Σni|ci−x̄|$$]::text[],
        'example', jsonb_build_object('statement', $$Pour la série [0;10[, [10;20[, [20;30[ d'effectifs 10, 15, 5, on a x̄≈13,33. Calcule (c1−x̄)² pour la première classe (c1=5).$$, 'solution', $$(5−13,33)²=(−8,33)²≈69,4.$$),
        'fixation', jsonb_build_object('question', $$Que mesurent la variance et l'écart type d'une série statistique ?$$, 'solution', $$Ils mesurent la dispersion des valeurs de la série autour de la moyenne : plus ils sont élevés, plus les valeurs sont étalées.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une centrale d'achat de café à Man a acheté du café auprès de coopératives affiliées durant la dernière campagne, réparties ainsi : [1;3[ tonnes : 14 coopératives ; [3;5[ tonnes : 10 ; [5;7[ tonnes : 9 ; [7;9[ tonnes : 6 ; [9;11[ tonnes : 3. La banque exige un tonnage moyen d'au moins 4,5 tonnes et un tonnage médian supérieur à 4 tonnes pour accorder un crédit à la centrale.$$,
      'questions', array[
        $$Complète le tableau avec les centres des classes et les effectifs cumulés croissants.$$,
        $$Calcule le tonnage moyen acheté par la centrale.$$,
        $$Calcule le tonnage médian par interpolation linéaire, puis conclus si la centrale peut obtenir le crédit.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Pour la classe [20;25[ d'effectif 15, calcule sa densité.$$,
      'hint', $$Densité = effectif / amplitude.$$,
      'expected', $$Amplitude=5, donc densité=15/5=3.$$
    ),
    jsonb_build_object(
      'question', $$Une série a deux classes : [0;4[ d'effectif 8 (centre 2) et [4;10[ d'effectif 12 (centre 7). Calcule sa moyenne.$$,
      'hint', $$x̄=(n1c1+n2c2)/N avec N=n1+n2.$$,
      'expected', $$N=20. x̄=(8×2+12×7)/20=(16+84)/20=5.$$
    ),
    jsonb_build_object(
      'question', $$Que représente l'écart interquartile Q3−Q1 ?$$,
      'hint', $$Pense à l'intervalle qui contient la moitié centrale des valeurs.$$,
      'expected', $$C'est l'étendue de l'intervalle contenant les 50% des valeurs centrales de la série (entre le premier et le troisième quartile).$$
    ),
    jsonb_build_object(
      'question', $$Comment calcule-t-on l'écart type σ à partir de la variance V ?$$,
      'hint', $$C'est une opération simple sur V.$$,
      'expected', $$σ = √V (la racine carrée de la variance).$$
    )
  ),
  now()
);
