-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2038: "MATHS_1C L17: STATISTIQUES"
-- (https://lyc.ecole-ci.org/course/view.php?id=2038), resource id 17918.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-statistiques',
  '1ere',
  'C',
  'mathematiques',
  $$Statistiques$$,
  17,
  '1ere-c-maths-vecteurs-espace',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'équipe de course à pied d'un lycée a un nouvel entraîneur, qui reçoit le tableau des temps (en minutes) de chaque membre lors de la dernière épreuve de 10 km. Il veut partager l'équipe en cinq groupes de même effectif et de niveau équivalent, en s'appuyant sur un histogramme et sur le classement de chacun via le premier quart, la moitié et le troisième quart des temps.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Densité et classe modale$$,
        'body', $$Pour une série regroupée en classes [xi;xi+1[, l'amplitude est xi+1−xi et le centre ci=(xi+xi+1)/2. La densité d'une classe est le quotient de son effectif par son amplitude. La classe modale est la classe dont la densité est maximale (si toutes les classes ont la même amplitude, c'est celle d'effectif maximal).$$,
        'highlights', array[$$densité d'une classe = effectif / amplitude$$, $$classe modale = classe de densité maximale$$]::text[],
        'example', jsonb_build_object('statement', $$Une série a les classes [0;30[ (effectif 13), [30;45[ (effectif 20), [45;70[ (effectif 25), [70;80[ (effectif 15), [80;100[ (effectif 17). Détermine la classe modale.$$, 'solution', $$Densités : 13/30≈0,43 ; 20/15≈1,33 ; 25/25=1 ; 15/10=1,5 ; 17/20=0,85. La densité maximale est 1,5, donc la classe modale est [70;80[.$$),
        'fixation', jsonb_build_object('question', $$Si toutes les classes d'une série ont la même amplitude, comment identifie-t-on simplement la classe modale ?$$, 'solution', $$C'est la classe dont l'effectif est maximal.$$)
      ),
      jsonb_build_object(
        'heading', $$Moyenne et médiane$$,
        'body', $$La moyenne est x̄ = (Σ ni·ci)/N = Σ fi·ci (avec les fréquences). La médiane Me sépare la série ordonnée en deux effectifs égaux ; elle se détermine graphiquement (abscisse du point de la courbe cumulative d'ordonnée N/2), ou par interpolation linéaire : si Me∈[xi;xi+1[, alors (Me−xi)/(xi+1−xi) = (N/2−Ni)/(Ni+1−Ni), où Ni, Ni+1 sont les effectifs cumulés croissants encadrant N/2.$$,
        'highlights', array[$$x̄ = (Σ ni·ci)/N$$, $$médiane par interpolation : (Me−xi)/(xi+1−xi) = (N/2−Ni)/(Ni+1−Ni)$$]::text[],
        'example', jsonb_build_object('statement', $$Une série d'effectif total 104 a pour effectifs cumulés croissants : 12, 40, 72, 96, 104 sur les classes [1;5[,[5;8[,[8;13[,[13;14[,[14;21[. Calcule la médiane.$$, 'solution', $$N/2=52, compris entre 40 (à x=8) et 72 (à x=13), donc Me∈[8;13[. (Me−8)/(13−8)=(52−40)/(72−40), donc Me=9,87.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule de la moyenne d'une série regroupée en classes, en utilisant les fréquences fi ?$$, 'solution', $$x̄ = Σ fi·ci = f1c1+f2c2+...+fpcp.$$)
      ),
      jsonb_build_object(
        'heading', $$Quartiles et écart interquartile$$,
        'body', $$Le premier quartile Q1 est la valeur telle que 25% des valeurs lui sont inférieures ou égales ; Q2 est la médiane ; Q3 est telle que 75% des valeurs lui sont inférieures ou égales. Ils se déterminent graphiquement (25% et 75% de l'effectif sur le polygone des effectifs cumulés croissants) ou par interpolation linéaire, comme pour la médiane. L'écart interquartile Q3−Q1 mesure l'étendue de l'intervalle contenant les 50% centraux des valeurs.$$,
        'highlights', array[$$Q1 : 25% des valeurs inférieures ou égales ; Q3 : 75%$$, $$écart interquartile = Q3−Q1 : contient 50% des valeurs$$]::text[],
        'example', jsonb_build_object('statement', $$Avec les mêmes effectifs cumulés croissants (12,40,72,96,104 sur [1;5[,[5;8[,[8;13[,[13;14[,[14;21[), calcule Q1.$$, 'solution', $$N×25/100=26, compris entre 12 (à x=5) et 40 (à x=8), donc Q1∈[5;8[. (Q1−5)/(8−5)=(26−12)/(40−12), donc Q1=6,5.$$),
        'fixation', jsonb_build_object('question', $$Que représente l'écart interquartile Q3−Q1 ?$$, 'solution', $$L'amplitude de l'intervalle qui contient 50% des valeurs de la série, centré sur la médiane.$$)
      ),
      jsonb_build_object(
        'heading', $$Variance, écart type et écart absolu moyen$$,
        'body', $$La variance V = (Σ ni(ci−x̄)²)/N = (Σ ni·ci²)/N − x̄². L'écart type σ=√V ; plus il est élevé, plus les valeurs sont dispersées autour de la moyenne. L'écart absolu moyen em = (Σ ni|ci−x̄|)/N indique la distance moyenne entre la moyenne et les valeurs de la série.$$,
        'highlights', array[$$V = (Σ ni·ci²)/N − x̄² ; σ = √V$$, $$em = (Σ ni|ci−x̄|)/N$$]::text[],
        'example', jsonb_build_object('statement', $$Une série de 125 élèves a x̄=39,84 et Σni·ci²=322000. Calcule la variance et l'écart type.$$, 'solution', $$V = 322000/125 − 39,84² = 2576 − 1587,2 = 988,77 (arrondi). σ = √988,77 ≈ 31,44.$$),
        'fixation', jsonb_build_object('question', $$Comment interprète-t-on un écart type élevé ?$$, 'solution', $$Il indique que les valeurs de la série sont fortement dispersées autour de la moyenne, donc peu concentrées près d'elle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le COGES d'un lycée teste deux machines A et B pour stocker sa récolte en sacs de 50 kg, chacune sur 80 sacs, réparties en classes de poids. Une machine est jugée bonne si : la moyenne est comprise entre 49,7 et 50,3 kg ; l'écart type est inférieur à 0,5 kg ; l'intervalle [49,3;50,5] contient au moins 85% des sacs.$$,
      'questions', array[
        $$Pour chaque machine, calcule la moyenne x̄ à partir du tableau des effectifs et des centres de classes.$$,
        $$Pour chaque machine, calcule la variance puis l'écart type, et vérifie s'il est inférieur à 0,5 kg.$$,
        $$Par interpolation linéaire sur les fréquences cumulées croissantes, estime le pourcentage de sacs dans l'intervalle [49,3;50,5] pour chaque machine, puis détermine laquelle des deux machines satisfait les trois critères et doit être choisie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment calcule-t-on la densité d'une classe statistique ?$$,
      'hint', $$C'est un quotient entre deux grandeurs de la classe.$$,
      'expected', $$La densité est le quotient de l'effectif de la classe par son amplitude.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule générale de la variance V d'une série statistique regroupée en classes ?$$,
      'hint', $$Il existe deux formes équivalentes.$$,
      'expected', $$V = (Σ ni(ci−x̄)²)/N, ou de façon équivalente V = (Σ ni·ci²)/N − x̄².$$
    ),
    jsonb_build_object(
      'question', $$Que signifie que Q1=17,86 pour une série statistique ?$$,
      'hint', $$C'est lié à un pourcentage précis de la population.$$,
      'expected', $$25% des valeurs de la série sont inférieures ou égales à 17,86, et 75% lui sont supérieures.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre l'écart type et l'écart absolu moyen ?$$,
      'hint', $$Les deux mesurent la dispersion, mais avec des opérations différentes sur les écarts à la moyenne.$$,
      'expected', $$L'écart type est la racine carrée de la variance (moyenne des carrés des écarts) ; l'écart absolu moyen est la moyenne des valeurs absolues des écarts à la moyenne. Ce sont deux mesures différentes de la dispersion autour de la moyenne.$$
    )
  ),
  now()
);
