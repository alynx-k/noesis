-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- complements the official Ivorian Seconde A programme (Compétence 2:
-- Organisation et gestion de données — Statistiques) with original,
-- general-knowledge content adapted to the série A (littéraire) level:
-- statistical vocabulary, cumulative effectifs/fréquences, the position
-- parameters (mode, moyenne, médiane), the étendue as a simple dispersion
-- parameter, and the usual graphical representations. No source PDF was
-- available for this topic; entirely original wording, examples and
-- exercises (different scenarios/numbers from the 3ème "Statistique"
-- lesson already in the catalogue).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-statistiques',
  '2nde',
  'A',
  'mathematiques',
  $$Statistiques$$,
  7,
  '2nde-a-maths-generalites-fonctions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le comité des parents d'élèves d'un lycée a recueilli le nombre de frères et sœurs de chacun des 40 élèves d'une classe de seconde A, afin de mieux organiser le transport scolaire en minibus. Les chiffres bruts, notés dans le désordre sur une feuille, ne permettent pas de décider directement de la taille des minibus à louer : il faut d'abord organiser ces données, c'est tout l'objet de la statistique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulaire de la statistique$$,
        'body', $$Une étude statistique porte sur une population, c'est-à-dire l'ensemble des individus étudiés. Chaque individu possède une valeur pour le caractère étudié. L'effectif d'une valeur est le nombre d'individus qui la possèdent, et l'effectif total est le nombre total d'individus de la population.$$,
        'highlights', array[$$population$$, $$caractère$$, $$effectif$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La population est l'ensemble des individus étudiés. Le caractère est la propriété observée chez chaque individu. L'effectif d'une valeur du caractère est le nombre d'individus qui présentent cette valeur.$$),
        'example', jsonb_build_object('statement', $$Dans une classe de 40 élèves, 6 élèves ont exactement 2 frères et sœurs. Identifie la population, le caractère étudié et l'effectif de la valeur « 2 ».$$, 'solution', $$La population est l'ensemble des 40 élèves de la classe, le caractère étudié est le nombre de frères et sœurs, et l'effectif de la valeur 2 est 6.$$),
        'fixation', jsonb_build_object('question', $$Dans la même classe, 40 élèves au total ont été interrogés. Quel est l'effectif total de la population ?$$, 'solution', $$L'effectif total est 40, puisque tous les élèves de la classe ont été interrogés.$$)
      ),
      jsonb_build_object(
        'heading', $$Fréquence et effectifs cumulés croissants$$,
        'body', $$La fréquence d'une valeur mesure la part qu'elle représente dans la population totale, en la comparant à l'effectif total. L'effectif cumulé croissant d'une valeur additionne les effectifs de toutes les valeurs qui lui sont inférieures ou égales, ce qui permet de répondre directement à des questions du type « combien d'individus ont au plus... ».$$,
        'highlights', array[$$fréquence$$, $$effectif cumulé croissant$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La fréquence d'une valeur est le quotient de son effectif par l'effectif total (multiplié par 100 pour l'exprimer en pourcentage). L'effectif cumulé croissant d'une valeur n est la somme des effectifs de toutes les valeurs inférieures ou égales à n.$$),
        'table', jsonb_build_object(
          'headers', array[$$Nombre de frères et sœurs$$, $$0$$, $$1$$, $$2$$, $$3$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Effectif$$, $$10$$, $$16$$, $$10$$, $$4$$),
            jsonb_build_array($$Effectif cumulé croissant$$, $$10$$, $$26$$, $$36$$, $$40$$)
          )
        ),
        'example', jsonb_build_object('statement', $$D'après le tableau, calcule la fréquence de la valeur 1 (16 élèves sur 40).$$, 'solution', $$Fréquence = 16/40 × 100 = 40%.$$),
        'fixation', jsonb_build_object('question', $$D'après le tableau, combien d'élèves ont au plus 2 frères et sœurs ?$$, 'solution', $$L'effectif cumulé croissant de la valeur 2 est 36 : 36 élèves ont au plus 2 frères et sœurs.$$)
      ),
      jsonb_build_object(
        'heading', $$Mode et moyenne d'une série$$,
        'body', $$Le mode d'une série statistique est la valeur qui a le plus grand effectif. La moyenne, elle, résume toute la série par un seul nombre : quand chaque valeur est associée à un effectif, on utilise une moyenne pondérée, en multipliant chaque valeur par son effectif avant de diviser par l'effectif total.$$,
        'highlights', array[$$mode$$, $$moyenne pondérée$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le mode est la valeur dont l'effectif est le plus élevé. La moyenne pondérée d'une série est la somme des produits (valeur × effectif), divisée par l'effectif total.$$),
        'example', jsonb_build_object('statement', $$D'après le tableau précédent (valeurs 0, 1, 2, 3 d'effectifs 10, 16, 10, 4), donne le mode de la série.$$, 'solution', $$L'effectif le plus élevé est 16, atteint pour la valeur 1 : le mode de la série est donc 1.$$),
        'fixation', jsonb_build_object('question', $$Calcule la moyenne de cette série : (0×10 + 1×16 + 2×10 + 3×4) / 40.$$, 'solution', $$(0+16+20+12)/40 = 48/40 = 1,2. La moyenne est 1,2 frère ou sœur par élève.$$)
      ),
      jsonb_build_object(
        'heading', $$Médiane d'une série$$,
        'body', $$La médiane partage une série ordonnée en deux groupes de même effectif. Sa position dépend de la parité de l'effectif total : au milieu exact s'il est impair, entre les deux valeurs centrales s'il est pair.$$,
        'highlights', array[$$médiane$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour une série ordonnée d'effectif total N impair, la médiane est la valeur de rang (N+1)/2. Si N est pair, la médiane est la moyenne des valeurs de rang N/2 et N/2+1.$$),
        'example', jsonb_build_object('statement', $$Détermine la médiane de la série ordonnée : 3, 5, 5, 8, 9 (5 valeurs).$$, 'solution', $$L'effectif est 5 (impair), la médiane est donc la valeur de rang (5+1)/2 = 3, soit 5.$$),
        'fixation', jsonb_build_object('question', $$Détermine la médiane de la série ordonnée : 2, 4, 7, 10 (4 valeurs).$$, 'solution', $$L'effectif est 4 (pair), la médiane est la moyenne des valeurs de rang 2 et 3 : (4+7)/2 = 5,5.$$)
      ),
      jsonb_build_object(
        'heading', $$Étendue d'une série$$,
        'body', $$L'étendue d'une série statistique mesure l'écart entre ses valeurs extrêmes. C'est un premier indicateur de la dispersion des données : une étendue élevée signale des valeurs très éparpillées, une étendue faible des valeurs regroupées.$$,
        'highlights', array[$$étendue$$, $$dispersion$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'étendue d'une série est la différence entre sa plus grande valeur et sa plus petite valeur : étendue = valeur maximale − valeur minimale.$$),
        'example', jsonb_build_object('statement', $$Une série de notes va de 6 à 18. Calcule son étendue.$$, 'solution', $$Étendue = 18 − 6 = 12.$$),
        'fixation', jsonb_build_object('question', $$Une série de tailles va de 1,52 m à 1,79 m. Calcule son étendue.$$, 'solution', $$Étendue = 1,79 − 1,52 = 0,27 m.$$)
      ),
      jsonb_build_object(
        'heading', $$Représentations graphiques$$,
        'body', $$Un diagramme en bâtons représente chaque valeur du caractère par une barre verticale dont la hauteur est proportionnelle à son effectif. Un diagramme circulaire répartit un disque entier de 360° en secteurs proportionnels aux effectifs ou aux fréquences de chaque valeur.$$,
        'highlights', array[$$diagramme en bâtons$$, $$diagramme circulaire$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Dans un diagramme en bâtons, la hauteur de chaque bâton est égale à l'effectif de la valeur qu'il représente. Dans un diagramme circulaire, l'angle du secteur associé à une valeur est : angle = (effectif de la valeur × 360°) ÷ effectif total.$$),
        'example', jsonb_build_object('statement', $$Sur 40 élèves, 10 ont 2 frères et sœurs. Calcule l'angle du secteur circulaire correspondant.$$, 'solution', $$Angle = 10×360/40 = 90°.$$),
        'fixation', jsonb_build_object('question', $$Sur 40 élèves, 4 ont 3 frères et sœurs. Calcule l'angle du secteur circulaire correspondant.$$, 'solution', $$Angle = 4×360/40 = 36°.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le comité des parents veut louer des minibus de 20 places pour transporter les 40 élèves de la classe étudiée (répartition des frères et sœurs : 10 avec 0, 16 avec 1, 10 avec 2, 4 avec 3). Un responsable affirme qu'en connaissant seulement la moyenne du nombre de frères et sœurs, on peut aussi connaître le nombre exact de minibus nécessaires pour transporter toute la famille de chaque élève.$$,
      'questions', array[
        $$Calcule la moyenne du nombre de frères et sœurs par élève de cette classe.$$,
        $$La moyenne calculée permet-elle, à elle seule, de connaître le nombre total de frères et sœurs de tous les élèves réunis ? Justifie en utilisant la formule de la moyenne pondérée.$$,
        $$Calcule le nombre total de frères et sœurs de la classe, puis le nombre de minibus de 20 places nécessaires pour transporter toutes ces personnes en plus des 40 élèves.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans un village de 60 habitants interrogés, 15 déclarent pratiquer l'agriculture comme activité principale. Calcule la fréquence de cette valeur en pourcentage.$$,
      'hint', $$Relis la définition de la fréquence : effectif de la valeur divisé par effectif total.$$,
      'expected', $$Fréquence = 15/60 × 100 = 25%.$$
    ),
    jsonb_build_object(
      'question', $$Calcule la moyenne pondérée de la série : valeur 4 (effectif 3), valeur 7 (effectif 5), valeur 10 (effectif 2).$$,
      'hint', $$Relis la formule de la moyenne pondérée : somme des produits valeur×effectif, divisée par l'effectif total.$$,
      'expected', $$Moyenne = (4×3+7×5+10×2)/(3+5+2) = (12+35+20)/10 = 67/10 = 6,7.$$
    ),
    jsonb_build_object(
      'question', $$Détermine la médiane de la série ordonnée : 5, 7, 9, 9, 12, 14 (6 valeurs), et calcule aussi son étendue.$$,
      'hint', $$Pour un effectif pair, la médiane est la moyenne des deux valeurs centrales. L'étendue est la différence entre la valeur maximale et la valeur minimale.$$,
      'expected', $$Médiane = (9+9)/2 = 9. Étendue = 14 − 5 = 9.$$
    ),
    jsonb_build_object(
      'question', $$Sur 50 personnes interrogées, 20 préfèrent le thé, 15 le café, et 15 le jus de fruit. Calcule l'angle du secteur circulaire correspondant à chaque boisson.$$,
      'hint', $$Utilise la formule angle = (effectif × 360°) ÷ effectif total pour chaque boisson.$$,
      'expected', $$Thé : 20×360/50 = 144°. Café : 15×360/50 = 108°. Jus de fruit : 15×360/50 = 108°.$$
    )
  ),
  now()
);
