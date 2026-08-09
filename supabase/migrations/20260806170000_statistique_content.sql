-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 11: Statistique"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. No diagram: pie-chart/polygon constructions are
-- described in words rather than plotted, to keep scope tight.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le chef d'un village veut savoir si les habitants gagnent suffisamment pour financer la construction d'un nouveau puits. Il a recueilli les revenus mensuels de 40 familles, mais ces chiffres bruts ne lui disent rien tant qu'ils ne sont pas organisés — c'est exactement le travail de la statistique : ranger les données pour en tirer des informations utiles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mode et fréquence$$,
        'body', $$Le mode est la valeur qui revient le plus souvent dans une série. La fréquence, elle, mesure la part que représente une valeur par rapport à l'ensemble des données.$$,
        'highlights', array[$$mode$$, $$fréquence$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le mode d'une série est la modalité dont l'effectif est maximal. La fréquence d'une modalité est le quotient de son effectif par l'effectif total (multiplié par 100 pour l'exprimer en pourcentage).$$),
        'example', jsonb_build_object('statement', $$Dans une série de 50 élèves, 20 préfèrent le football. Donne la fréquence en pourcentage.$$, 'solution', $$Fréquence = 20/50 × 100 = 40%.$$),
        'fixation', jsonb_build_object('question', $$Dans une classe de 30 élèves, 12 sont nés en janvier. Donne la fréquence en pourcentage.$$, 'solution', $$Fréquence = 12/30 × 100 = 40%.$$)
      ),
      jsonb_build_object(
        'heading', $$Moyenne d'une série$$,
        'body', $$La moyenne résume une série de nombres par une seule valeur : on additionne toutes les données puis on divise par leur nombre total. Quand les données se répètent, on utilise plutôt une moyenne pondérée.$$,
        'highlights', array[$$moyenne$$, $$moyenne pondérée$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Moyenne = somme de toutes les données ÷ effectif total. Moyenne pondérée = somme des produits (valeur × effectif) ÷ effectif total.$$),
        'example', jsonb_build_object('statement', $$Calcule la moyenne pondérée de la série : valeur 5 (effectif 3), valeur 8 (effectif 2).$$, 'solution', $$Moyenne = (5×3 + 8×2) / (3+2) = (15+16)/5 = 31/5 = 6,2.$$),
        'fixation', jsonb_build_object('question', $$Calcule la moyenne pondérée : valeur 10 (effectif 4), valeur 14 (effectif 6).$$, 'solution', $$Moyenne = (10×4 + 14×6) / (4+6) = (40+84)/10 = 124/10 = 12,4.$$)
      ),
      jsonb_build_object(
        'heading', $$Effectifs et fréquences cumulés croissants$$,
        'body', $$L'effectif cumulé croissant d'une modalité additionne tous les effectifs des modalités qui lui sont inférieures ou égales — il permet de répondre directement à des questions du type « combien de personnes ont moins de... ».$$,
        'highlights', array[$$effectif cumulé croissant$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'effectif cumulé croissant d'une modalité n est la somme des effectifs de toutes les modalités inférieures ou égales à n. La fréquence cumulée croissante correspondante est ce total divisé par l'effectif total.$$),
        'example', jsonb_build_object('statement', $$Pour les modalités 4 (effectif 3), 6 (effectif 5), 9 (effectif 2), donne l'effectif cumulé croissant de la modalité 6.$$, 'solution', $$Effectif cumulé croissant de 6 = 3+5 = 8.$$),
        'fixation', jsonb_build_object('question', $$Avec les mêmes données, donne l'effectif cumulé croissant de la modalité 9.$$, 'solution', $$Effectif cumulé croissant de 9 = 3+5+2 = 10.$$)
      ),
      jsonb_build_object(
        'heading', $$Médiane d'une série$$,
        'body', $$La médiane partage une série ordonnée en deux groupes de même taille. Sa position dépend de si l'effectif total est pair ou impair.$$,
        'highlights', array[$$médiane$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si l'effectif total N est impair, la médiane est la valeur de rang (N+1)/2 dans la liste ordonnée. Si N est pair, la médiane est la moyenne des valeurs de rang N/2 et N/2+1.$$),
        'example', jsonb_build_object('statement', $$Détermine la médiane de : 3, 7, 8, 12, 15 (déjà ordonnée).$$, 'solution', $$L'effectif est 5 (impair), donc la médiane est la valeur de rang (5+1)/2=3, soit 8.$$),
        'fixation', jsonb_build_object('question', $$Détermine la médiane de : 4, 6, 9, 11 (déjà ordonnée).$$, 'solution', $$L'effectif est 4 (pair), donc la médiane est la moyenne des valeurs de rang 2 et 3 : (6+9)/2 = 7,5.$$)
      ),
      jsonb_build_object(
        'heading', $$Regroupement en classes$$,
        'body', $$Quand une série contient beaucoup de valeurs différentes, on les regroupe en intervalles appelés classes, tous de même amplitude, pour rendre le tableau plus lisible.$$,
        'highlights', array[$$classes$$, $$classe modale$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'amplitude d'une classe [a;b[ est b−a. La classe modale est celle qui a le plus grand effectif. Le centre d'une classe [a;b[ est (a+b)/2, utilisé pour calculer la moyenne d'une série groupée.$$),
        'example', jsonb_build_object('statement', $$Donne le centre de la classe [20;30[.$$, 'solution', $$Centre = (20+30)/2 = 25.$$),
        'fixation', jsonb_build_object('question', $$Donne le centre de la classe [8;14[.$$, 'solution', $$Centre = (8+14)/2 = 11.$$)
      ),
      jsonb_build_object(
        'heading', $$Diagramme circulaire$$,
        'body', $$Un diagramme circulaire répartit un disque entier (360°) en secteurs, chacun proportionnel à l'effectif ou à la fréquence de la modalité qu'il représente.$$,
        'highlights', array[$$diagramme circulaire$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$L'angle d'un secteur associé à une modalité se calcule par : angle = (effectif de la modalité × 360°) ÷ effectif total.$$),
        'example', jsonb_build_object('statement', $$Sur 40 personnes, 10 préfèrent le thé. Calcule l'angle de son secteur.$$, 'solution', $$Angle = 10×360/40 = 90°.$$),
        'fixation', jsonb_build_object('question', $$Sur 60 personnes, 15 préfèrent le café. Calcule l'angle de son secteur.$$, 'solution', $$Angle = 15×360/60 = 90°.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une coopérative de planteurs veut savoir si la majorité de ses 60 membres a récolté au moins la quantité médiane de cacao cette saison, pour juger si la campagne est réussie. Un membre estime la campagne réussie si au moins 55% des planteurs ont récolté une quantité supérieure ou égale à la médiane.$$,
      'questions', array[
        $$Explique comment on détermine la position de la médiane dans une série de 60 valeurs ordonnées.$$,
        $$Sachant que 33 planteurs sur 60 ont récolté une quantité supérieure ou égale à la médiane, calcule ce pourcentage.$$,
        $$La campagne peut-elle être jugée réussie selon le critère fixé ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans une série de 25 personnes, 5 ont répondu « oui ». Calcule la fréquence en pourcentage.$$,
      'hint', $$Relis la définition de la fréquence : effectif de la modalité divisé par effectif total.$$,
      'expected', $$Fréquence = 5/25 × 100 = 20%.$$
    ),
    jsonb_build_object(
      'question', $$Calcule la moyenne pondérée de la série : valeur 6 (effectif 2), valeur 9 (effectif 3), valeur 12 (effectif 5).$$,
      'hint', $$Relis la formule de la moyenne pondérée : somme des produits valeur×effectif, divisée par l'effectif total.$$,
      'expected', $$Moyenne = (6×2+9×3+12×5)/(2+3+5) = (12+27+60)/10 = 99/10 = 9,9.$$
    ),
    jsonb_build_object(
      'question', $$Détermine la médiane de la série ordonnée : 2, 5, 5, 8, 9, 11 (6 valeurs).$$,
      'hint', $$Relis la règle pour un effectif pair : la médiane est la moyenne des valeurs de rang N/2 et N/2+1.$$,
      'expected', $$L'effectif est 6, donc la médiane est la moyenne des valeurs de rang 3 et 4 : (5+8)/2 = 6,5.$$
    ),
    jsonb_build_object(
      'question', $$Sur une classe de 45 élèves, 18 ont eu la moyenne. Calcule l'angle du secteur qui leur correspond dans un diagramme circulaire.$$,
      'hint', $$Relis la formule de l'angle : (effectif × 360°) ÷ effectif total.$$,
      'expected', $$Angle = 18×360/45 = 144°.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-statistique';
