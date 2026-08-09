-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths lecon 8 Statistiques"
-- (Collège Numérique, Thème "Organisation et traitement des données",
-- Leçon 10, course id 1988, resource id 16152, downloaded from
-- coll.ecole-ci.org and read directly). The real lesson covers mode,
-- moyenne (simple and pondérée), and specifically the diagramme
-- semi-circulaire (180° secteurs, not a full 360° circle) both to
-- construct and to read back into an effectifs/fréquences table — a
-- different toolkit from the earlier fallback's qualitatif/quantitatif +
-- full-circle diagram framing. Every sentence, example and exercise below
-- is an original composition in our own wording — no sentence is copied
-- verbatim from the source PDF. Uses the optional 'table' field for the
-- effectifs/angle example, since CourseDiagram has no dedicated
-- semicircular-sector primitive.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une entreprise de Korhogo a accueilli cinq stagiaires d'un lycée technique et leur a attribué des notes régulières tout au long du stage. À la fin, l'entreprise veut embaucher les trois meilleurs stagiaires en les classant par mérite. Le petit frère de l'un d'eux, élève en 4ème, se propose de calculer les moyennes de chacun pour savoir si son frère sera repris.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mode d'une série statistique$$,
        'body', $$Le mode d'une série statistique est la modalité qui possède le plus grand effectif, c'est-à-dire la valeur la plus fréquemment observée. Une série peut avoir un seul mode, mais aussi plusieurs modalités à égalité, auquel cas elle admet plusieurs modes.$$,
        'highlights', array[$$mode$$, $$effectif$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le mode d'une série statistique est toute modalité ayant le plus grand effectif (ou la plus grande fréquence). Une série statistique peut avoir un ou plusieurs modes.$$),
        'example', jsonb_build_object('statement', $$Une classe compte 3 élèves nés en janvier, 9 en mars et 5 en juin. Donne le mode de cette série.$$, 'solution', $$Le plus grand effectif est 9, associé au mois de mars. Le mode de cette série est donc mars.$$),
        'fixation', jsonb_build_object('question', $$Un sondage donne : Bio 12, Anglais 18, Sport 18, Musique 6. Donne le ou les modes de cette série.$$, 'solution', $$Le plus grand effectif est 18, atteint deux fois : la série a deux modes, Anglais et Sport.$$)
      ),
      jsonb_build_object(
        'heading', $$Moyenne d'une série statistique$$,
        'body', $$La moyenne d'une série est le quotient de la somme de toutes les valeurs par l'effectif total. Quand une même valeur revient plusieurs fois, on utilise sa moyenne pondérée : on multiplie chaque valeur par son effectif, on additionne ces produits, puis on divise par l'effectif total.$$,
        'highlights', array[$$moyenne$$, $$moyenne pondérée$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Moyenne = (somme des valeurs) ÷ (effectif total). Moyenne pondérée = (somme des produits valeur×effectif) ÷ (effectif total).$$),
        'example', jsonb_build_object('statement', $$Un stagiaire a obtenu les notes 14 ; 16 ; 12 ; 14 ; 13 ; 14. Calcule sa moyenne.$$, 'solution', $$Moyenne = (14+16+12+14+13+14)/6 = 83/6 ≈ 13,83.$$),
        'fixation', jsonb_build_object('question', $$Un tableau donne : note 8 (effectif 3), note 12 (effectif 5), note 15 (effectif 2). Calcule la moyenne pondérée.$$, 'solution', $$Moyenne = (8×3+12×5+15×2)/(3+5+2) = (24+60+30)/10 = 114/10 = 11,4.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire un diagramme semi-circulaire$$,
        'body', $$Un diagramme semi-circulaire répartit les effectifs d'une série en secteurs angulaires découpés dans un demi-disque, dont la somme des mesures d'angle vaut 180°. Chaque modalité reçoit un secteur dont la mesure est proportionnelle à son effectif.$$,
        'highlights', array[$$diagramme semi-circulaire$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$Mesure de l'angle du secteur = (180° × effectif de la modalité) ÷ effectif total. Dans un diagramme semi-circulaire, la somme de toutes les mesures d'angle vaut exactement 180°.$$),
        'example', jsonb_build_object('statement', $$Un vendeur a écoulé 90 articles : 36 bananes, 27 mangues et 27 papayes. Calcule la mesure d'angle du secteur des bananes.$$, 'solution', $$Angle = 180×36/90 = 72°.$$),
        'fixation', jsonb_build_object('question', $$Dans la même série (90 articles au total), calcule la mesure d'angle du secteur des mangues (effectif 27).$$, 'solution', $$Angle = 180×27/90 = 54°.$$),
        'table', jsonb_build_object(
          'headers', array[$$Fruit$$, $$Effectif$$, $$Angle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Bananes$$, $$36$$, $$72°$$),
            jsonb_build_array($$Mangues$$, $$27$$, $$54°$$),
            jsonb_build_array($$Papayes$$, $$27$$, $$54°$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Lire un diagramme semi-circulaire$$,
        'body', $$Face à un diagramme semi-circulaire déjà tracé, on peut retrouver l'effectif de chaque modalité connaissant l'effectif total, ou retrouver sa fréquence, à l'aide d'un tableau de proportionnalité entre la mesure d'angle (sur 180°) et l'effectif (ou la fréquence) cherchés.$$,
        'highlights', array[$$tableau de proportionnalité$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour retrouver un effectif : effectif de la modalité = (mesure d'angle × effectif total) ÷ 180°. Pour retrouver une fréquence : fréquence de la modalité = mesure d'angle ÷ 180°.$$),
        'example', jsonb_build_object('statement', $$Un diagramme semi-circulaire de 60 votants donne un secteur de 108° pour le candidat A. Calcule son effectif et sa fréquence.$$, 'solution', $$Effectif = 108×60/180 = 36. Fréquence = 108/180 = 0,6, soit 60 %.$$),
        'fixation', jsonb_build_object('question', $$Dans le même diagramme (60 votants), un secteur de 36° correspond au candidat B. Calcule son effectif.$$, 'solution', $$Effectif = 36×60/180 = 12.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour préparer une soirée de fin d'année, une classe de 4ème vote pour l'artiste qu'elle préfère parmi quatre propositions. Le dépouillement donne : 14 voix pour l'artiste A, 21 pour B, 9 pour C et 16 pour D.$$,
      'questions', array[
        $$Calcule l'effectif total des votants, puis donne le mode de cette série (l'artiste le plus voté).$$,
        $$Calcule la mesure d'angle, dans un diagramme semi-circulaire, du secteur associé à l'artiste B.$$,
        $$Calcule la fréquence, en pourcentage, des votes obtenus par l'artiste C.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un tableau donne : modalité Football (effectif 22), Basketball (effectif 30), Judo (effectif 30), Natation (effectif 8). Donne le ou les modes de cette série.$$,
      'hint', $$Cherche la ou les modalités qui ont le plus grand effectif.$$,
      'expected', $$Le plus grand effectif est 30, atteint deux fois : la série a deux modes, Basketball et Judo.$$
    ),
    jsonb_build_object(
      'question', $$Une série donne : valeur 5 (effectif 4), valeur 9 (effectif 6), valeur 12 (effectif 10). Calcule la moyenne pondérée.$$,
      'hint', $$Multiplie chaque valeur par son effectif, additionne les produits, puis divise par l'effectif total.$$,
      'expected', $$Moyenne = (5×4+9×6+12×10)/(4+6+10) = (20+54+120)/20 = 194/20 = 9,7.$$
    ),
    jsonb_build_object(
      'question', $$Sur 120 élèves interrogés sur leur matière préférée, 40 préfèrent les mathématiques. Calcule la mesure d'angle du secteur correspondant dans un diagramme semi-circulaire.$$,
      'hint', $$Utilise la formule : angle = (180° × effectif) ÷ effectif total.$$,
      'expected', $$Angle = 180×40/120 = 60°.$$
    ),
    jsonb_build_object(
      'question', $$Un diagramme semi-circulaire de 50 clients donne un secteur de 90° pour un produit donné. Calcule l'effectif et la fréquence, en pourcentage, de ce produit.$$,
      'hint', $$Utilise le tableau de proportionnalité entre la mesure d'angle sur 180° et l'effectif ou la fréquence.$$,
      'expected', $$Effectif = 90×50/180 = 25. Fréquence = 90/180 = 0,5, soit 50 %.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-statistique';
