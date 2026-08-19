-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 820: "LEÇON 3: HYDROCARBURES INSATURÉS : ALCÈNES ET
-- ALCYNES" (https://lyc.ecole-ci.org/course/view.php?id=820), resource
-- id 3489. Contenu réécrit à partir du PDF source (structure, nomenclature,
-- isomérie, réactions d'addition et de polymérisation). Tout le contenu
-- est factuel (chimie organique) : formules, règles IUPAC, équations-bilans
-- et exercices numériques sont repris/adaptés tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-hydrocarbures-insatures-alcenes-alcynes',
  '1ere',
  'C',
  'physique-chimie',
  $$Hydrocarbures insaturés : alcènes et alcynes$$,
  2,
  '1ere-c-pc-chimie-hydrocarbures-satures-alcanes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 1ère C accompagne son père au garage pour souder son pot d'échappement. Le tôlier utilise un chalumeau soudeur muni de deux bouteilles : l'une contient un hydrocarbure insaturé appelé acétylène, l'autre du dioxygène. La flamme bleue produite par la combustion de l'acétylène dans le dioxygène est très chaude et permet de faire les soudures. Curieux, les élèves décident de connaître la structure des alcènes et des alcynes, d'en nommer quelques-uns et d'expliquer l'importance industrielle des composés insaturés.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Structure et nomenclature des alcènes$$,
        'body', $$Les alcènes sont des hydrocarbures possédant une double liaison carbone-carbone (C=C), de formule générale CnH2n. L'éthylène (C2H4) en est le plus simple : molécule plane, carbone trigonal (lié à 3 atomes), rotation impossible autour de la double liaison (molécule rigide). La chaîne principale est la plus longue chaîne contenant la double liaison ; le suffixe « -ène » est précédé de l'indice de position le plus petit possible. Deux alcènes peuvent être isomères de position (double liaison à des endroits différents, ex. but-1-ène et but-2-ène) ou isomères Z/E (disposition différente des atomes autour de la double liaison, ex. (Z)-but-2-ène et (E)-but-2-ène).$$,
        'highlights', array[$$alcènes : CnH2n, double liaison C=C, carbone trigonal$$, $$isomérie de position (ex. but-1-ène/but-2-ène) et isomérie Z/E$$]::text[],
        'property', jsonb_build_object('label', $$Formule générale$$, 'text', $$Alcènes : CnH2n. Alcynes : CnH2n-2.$$),
        'fixation', jsonb_build_object('question', $$Que signifie l'isomérie Z-E pour un alcène ?$$, 'solution', $$Elle traduit deux dispositions différentes des atomes dans l'espace autour de la double liaison C=C, pour une même formule semi-développée.$$)
      ),
      jsonb_build_object(
        'heading', $$Structure et nomenclature des alcynes$$,
        'body', $$Les alcynes possèdent une triple liaison carbone-carbone, de formule générale CnH2n-2. L'acétylène (éthyne, C2H2) en est le plus simple : molécule linéaire, carbone digonal (lié à 2 atomes), rotation impossible autour de la triple liaison. La nomenclature est semblable à celle des alcènes, avec le suffixe « -yne » à la place de « -ène ». Comme les alcènes, les alcynes présentent une isomérie de chaîne et de position.$$,
        'highlights', array[$$alcynes : CnH2n-2, triple liaison C≡C, carbone digonal$$, $$suffixe « -yne » (ex. prop-1-yne, but-2-yne)$$]::text[],
        'example', jsonb_build_object('statement', $$Nomme l'alcyne CH3-C≡C-CH3.$$, 'solution', $$But-2-yne (triple liaison entre les carbones 2 et 3 d'une chaîne de 4 carbones).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la géométrie de la molécule d'acétylène ?$$, 'solution', $$Elle est linéaire, chaque atome de carbone étant digonal (lié à seulement deux autres atomes).$$)
      ),
      jsonb_build_object(
        'heading', $$Réactions d'addition$$,
        'body', $$Alcènes et alcynes subissent des réactions d'addition qui rompent la double ou la triple liaison. L'hydrogénation (H2, catalyseur Ni ou Pd) transforme un alcène en alcane, un alcyne en alcène (catalyseur Pd) ou en alcane (catalyseur Ni/Pt, 2 H2). L'action d'un dihalogène (Cl2, Br2) se fait même à l'obscurité (contrairement à la chloration des alcanes, photochimique) : les alcènes décolorent l'eau de brome, ce qui constitue un test caractéristique de la double liaison. L'action de HCl ou de l'eau (hydratation, catalysée par H2SO4) suit la règle de Markovnikov : le chlore (ou le groupe OH) se fixe préférentiellement sur le carbone le moins hydrogéné, l'hydrogène sur le carbone le plus hydrogéné.$$,
        'highlights', array[$$hydrogénation : alcène/alcyne + H2 (Ni/Pd) → alcane$$, $$dihalogène : addition possible à l'obscurité ; eau de brome décolorée = test de la double liaison$$, $$règle de Markovnikov : X (ou OH) sur le carbone le moins hydrogéné$$]::text[],
        'example', jsonb_build_object('statement', $$Écris le produit de l'hydratation du propène (CH3-CH=CH2) en présence de H2SO4.$$, 'solution', $$CH3-CH(OH)-CH3 (le groupe OH se fixe sur le carbone central, le moins hydrogéné, conformément à la règle de Markovnikov).$$),
        'fixation', jsonb_build_object('question', $$Quel test chimique simple permet de mettre en évidence une double liaison C=C ?$$, 'solution', $$La décoloration de l'eau de brome (le dibrome s'additionne sur la double liaison).$$)
      ),
      jsonb_build_object(
        'heading', $$Réactions de polymérisation$$,
        'body', $$Une réaction de polymérisation est une addition de nombreuses molécules identiques (monomères) qui s'enchaînent par rupture de leur double liaison, formant un polymère. La polymérisation de l'éthylène (CH2=CH2) donne le polyéthylène, utilisé pour les sachets, jouets et bouteilles plastiques. La polymérisation du chlorure de vinyle (CH2=CHCl) donne le polychlorure de vinyle (PVC), utilisé en tuyauterie. La polymérisation du styrène donne le polystyrène, utilisé pour les emballages anti-chocs et récipients.$$,
        'highlights', array[$$polymérisation : n monomères → 1 polymère (rupture de la double liaison)$$, $$éthylène → polyéthylène ; chlorure de vinyle → PVC ; styrène → polystyrène$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on le « monomère » dans une réaction de polymérisation ?$$, 'solution', $$La molécule initiale qui, en s'additionnant à de nombreux exemplaires d'elle-même, forme le polymère.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$L'analyse quantitative d'un alcyne A montre qu'il contient, en proportion de masse, 12 fois plus de carbone que d'hydrogène. L'hydrogénation complète d'un volume V = 20 cm³ de A, en présence de nickel, donne un alcane B de masse mB. Données : M(C) = 12 g/mol ; M(H) = 1 g/mol ; Vm = 22,4 L/mol.$$,
      'questions', array[
        $$Donne la formule brute générale des alcynes.$$,
        $$Écris l'équation-bilan de la réaction d'hydrogénation d'un alcyne.$$,
        $$Détermine la formule brute de l'alcyne A, puis la masse mB de l'alcane formé.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la formule brute générale des alcènes ?$$,
      'hint', $$Elle diffère de celle des alcanes par 2 atomes d'hydrogène en moins.$$,
      'expected', $$CnH2n.$$
    ),
    jsonb_build_object(
      'question', $$Quel type d'isomérie distingue le but-1-ène du but-2-ène ?$$,
      'hint', $$Ce n'est pas l'isomérie Z/E.$$,
      'expected', $$L'isomérie de position (la double liaison n'occupe pas la même position dans la chaîne).$$
    ),
    jsonb_build_object(
      'question', $$Selon la règle de Markovnikov, sur quel carbone se fixe préférentiellement l'atome de chlore lors de l'addition de HCl sur un alcène ?$$,
      'hint', $$C'est l'inverse de l'hydrogène.$$,
      'expected', $$Sur le carbone le moins hydrogéné (l'hydrogène de HCl se fixant sur le carbone le plus hydrogéné).$$
    ),
    jsonb_build_object(
      'question', $$Quel polymère obtient-on en polymérisant le chlorure de vinyle, et à quoi sert-il ?$$,
      'hint', $$Son sigle est bien connu (PVC).$$,
      'expected', $$Le polychlorure de vinyle (PVC), utilisé notamment en tuyauterie et canalisation.$$
    )
  ),
  now()
);
