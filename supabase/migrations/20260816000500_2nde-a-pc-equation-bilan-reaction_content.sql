-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3290: "LEÇON 6: EQUATION-BILAN D'UNE REACTION CHIMIQUE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3290)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32719, redirecting
-- to pluginfile "2nd AC - C6 Equation _ bilan dune réaction chimique.pdf"
-- (8 pages).
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 6): writing an
-- equation-bilan from an experiment (carbon reducing copper(II) oxide),
-- stoichiometric coefficients, the molar-then-mass balance table showing
-- conservation of mass (2 CuO + C → 2 Cu + CO2, 171 g = 171 g), the
-- proportionality relation nA/a = nB/b = nC/c = nD/d with a worked example
-- (4 HCl + O2 → 2 H2O + 2 Cl2), the notions of limiting and excess reagent,
-- conservation of elements, Lavoisier's law of mass conservation, and mass
-- / volume balances (Fe/O2/Fe3O4 mass example; C3H8/O2/CO2/H2O volume
-- example, valid only for gases under identical T,P). 100% original
-- wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-equation-bilan-reaction',
  '2nde',
  'A',
  'physique-chimie',
  $$L'équation-bilan d'une réaction chimique$$,
  6,
  '2nde-a-pc-mole-grandeurs-molaires',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une revue scientifique, des élèves de seconde découvrent une phrase qui les intrigue : l'un des problèmes de l'industrie chimique est d'éviter toute perte de matière, ce qui exige de respecter des proportions précises entre les réactifs -- c'est l'objet de la stœchiométrie. Avec leur professeur de Physique-Chimie, ils décident d'apprendre à écrire l'équation-bilan d'une réaction chimique et à l'utiliser pour calculer des quantités de matière, des masses et des volumes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Écrire l'équation-bilan d'une réaction chimique$$,
        'body', $$Reprenons l'expérience où l'on chauffe un mélange de carbone et d'oxyde de cuivre (II) : il se forme un dépôt rouge de cuivre, tandis que l'eau de chaux se trouble, preuve d'un dégagement de dioxyde de carbone. On identifie ainsi les réactifs (le carbone C et l'oxyde de cuivre CuO) et les produits (le cuivre Cu et le dioxyde de carbone CO2) de cette transformation chimique. L'équation-bilan traduit cette transformation par une écriture symbolique : C + 2 CuO → 2 Cu + CO2, où les réactifs figurent à gauche de la flèche et les produits à droite.$$,
        'highlights', array[$$réactifs$$, $$produits$$, $$équation-bilan$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans une équation-bilan, où se trouvent les réactifs et où se trouvent les produits ?$$, 'solution', $$Les réactifs se trouvent à gauche de la flèche, les produits à droite.$$)
      ),
      jsonb_build_object(
        'heading', $$Coefficients stœchiométriques et bilan molaire$$,
        'body', $$Les nombres placés devant les formules des réactifs et des produits sont appelés coefficients stœchiométriques ; ils permettent d'assurer la conservation du nombre d'atomes de chaque élément entre les réactifs et les produits. Dans l'écriture, le signe + signifie « réagit avec » du côté des réactifs et « et » du côté des produits, tandis que la flèche → signifie « pour donner ». Ainsi, l'équation C + 2 CuO → 2 Cu + CO2 se lit : une mole d'atomes de carbone réagit avec deux moles d'oxyde de cuivre (II) pour donner deux moles d'atomes de cuivre et une mole de molécules de dioxyde de carbone. Un bilan molaire, complété par les masses molaires, permet même de vérifier que la masse totale est conservée : 12 g de carbone plus 159 g d'oxyde de cuivre (soit 171 g de réactifs) donnent 127 g de cuivre plus 44 g de dioxyde de carbone (soit également 171 g de produits).$$,
        'highlights', array[$$coefficients stœchiométriques$$, $$bilan molaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$$$, $$C$$, $$2 CuO$$, $$2 Cu$$, $$CO2$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Quantité de matière$$, $$1 mol$$, $$2 mol$$, $$2 mol$$, $$1 mol$$),
            jsonb_build_array($$Masse$$, $$12 g$$, $$159 g$$, $$127 g$$, $$44 g$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Vérifie que la masse est conservée dans l'équation C + 2 CuO → 2 Cu + CO2 à partir des masses données (12 g, 159 g, 127 g, 44 g).$$, 'solution', $$Masse des réactifs : 12 + 159 = 171 g. Masse des produits : 127 + 44 = 171 g. Les deux sommes sont égales : la masse totale est bien conservée.$$),
        'fixation', jsonb_build_object('question', $$Que permettent d'assurer les coefficients stœchiométriques d'une équation-bilan ?$$, 'solution', $$Ils assurent la conservation du nombre d'atomes de chaque élément chimique entre les réactifs et les produits.$$)
      ),
      jsonb_build_object(
        'heading', $$Proportions stœchiométriques, réactif limitant et réactif en excès$$,
        'body', $$Pour une équation-bilan générale aA + bB → cC + dD, les quantités de matière des réactifs et des produits, une fois la réaction terminée, vérifient la relation de proportionnalité nA/a = nB/b = nC/c = nD/d lorsque les réactifs sont introduits dans des proportions stœchiométriques : dans ce cas, il ne reste, en fin de réaction, ni excès de réactif A, ni excès de réactif B. En pratique, il arrive souvent que les réactifs ne soient pas mélangés dans ces proportions exactes : l'un d'eux, appelé réactif limitant, est alors entièrement consommé le premier et arrête la réaction, tandis que l'autre, en excès, subsiste partiellement à la fin. On peut repérer le réactif limitant en comparant les rapports nA/a et nB/b : celui pour lequel ce rapport est le plus petit est le réactif limitant.$$,
        'highlights', array[$$proportions stœchiométriques$$, $$réactif limitant$$, $$réactif en excès$$]::text[],
        'example', jsonb_build_object('statement', $$Le chlorure d'hydrogène HCl réagit avec le dioxygène selon 4 HCl + O2 → 2 H2O + 2 Cl2. Si 5 moles de HCl réagissent totalement, quelle quantité de matière de dichlore est obtenue, et quelle quantité de dioxygène a été nécessaire ?$$, 'solution', $$D'après la proportionnalité n(HCl)/4 = n(Cl2)/2, on a n(Cl2) = 5×2/4 = 2,5 mol. De même, n(HCl)/4 = n(O2)/1 donne n(O2) = 5/4 = 1,25 mol.$$),
        'fixation', jsonb_build_object('question', $$Que devient le réactif limitant à la fin d'une réaction chimique ?$$, 'solution', $$Il est entièrement consommé : sa quantité de matière restante est nulle.$$)
      ),
      jsonb_build_object(
        'heading', $$Conservation des éléments et loi de Lavoisier$$,
        'body', $$Au cours d'une réaction chimique, chacun des éléments chimiques présents dans les réactifs se retrouve intégralement dans les produits : c'est la conservation des éléments, déjà rencontrée avec l'élément cuivre qui persiste à travers ses différentes formes chimiques. Cette conservation se traduit, à l'échelle de la masse totale, par la loi de Lavoisier : la somme des masses des produits formés au cours d'une réaction est égale à la somme des masses des réactifs qui ont été transformés. Le bilan molaire d'une équation-bilan permet ainsi d'établir soit un bilan massique (en multipliant chaque quantité de matière par sa masse molaire, m = n×M), soit, uniquement pour les corps gazeux placés dans les mêmes conditions de température et de pression, un bilan volumique fondé sur la loi d'Avogadro-Ampère.$$,
        'highlights', array[$$conservation des éléments$$, $$loi de Lavoisier$$, $$bilan massique$$, $$bilan volumique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Équation-bilan$$, $$3 Fe$$, $$2 O2$$, $$Fe3O4$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Bilan molaire$$, $$3 mol$$, $$2 mol$$, $$1 mol$$),
            jsonb_build_array($$Bilan massique (m = n×M)$$, $$167,4 g$$, $$64 g$$, $$231,4 g$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pour la réaction C3H8 + 5 O2 → 3 CO2 + 4 H2O, tous les corps étant gazeux dans les mêmes conditions, écris la relation entre les volumes de chaque espèce.$$, 'solution', $$V(C3H8) correspond à 1 mol, 5×V(C3H8) à O2, 3×V(C3H8) à CO2 et 4×V(C3H8) à H2O, en vertu de la loi d'Avogadro-Ampère qui donne le même volume molaire à tous les gaz dans les mêmes conditions.$$),
        'fixation', jsonb_build_object('question', $$Énonce la loi de Lavoisier.$$, 'solution', $$La somme des masses des produits d'une réaction chimique est égale à la somme des masses des réactifs qui ont été transformés.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On considère la combustion complète du méthane selon l'équation-bilan CH4 + 2 O2 → CO2 + 2 H2O. Un technicien dispose de 3 moles de méthane et souhaite calculer les quantités mises en jeu.$$,
      'questions', array[
        $$Vérifie que l'équation-bilan donnée respecte la conservation des atomes de carbone, d'hydrogène et d'oxygène.$$,
        $$Calcule la quantité de matière de dioxygène nécessaire pour faire réagir totalement les 3 moles de méthane.$$,
        $$Calcule les quantités de matière de dioxyde de carbone et d'eau obtenues.$$,
        $$Énonce la loi de Lavoisier et explique en quoi elle est illustrée par cette réaction.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on les nombres placés devant les formules chimiques dans une équation-bilan ?$$,
      'hint', $$Ils assurent la conservation des atomes.$$,
      'expected', $$Les coefficients stœchiométriques.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie la flèche dans une équation-bilan ?$$,
      'hint', $$Elle relie les réactifs aux produits.$$,
      'expected', $$« Pour donner » : elle indique que les réactifs se transforment en produits.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on le réactif limitant d'une réaction ?$$,
      'hint', $$C'est celui qui s'épuise le premier.$$,
      'expected', $$Le réactif entièrement consommé le premier, qui arrête la réaction, contrairement au réactif en excès dont il subsiste une partie.$$
    ),
    jsonb_build_object(
      'question', $$Énonce la loi de Lavoisier.$$,
      'hint', $$Elle concerne la masse totale d'une réaction.$$,
      'expected', $$La somme des masses des produits obtenus est égale à la somme des masses des réactifs transformés.$$
    )
  ),
  now()
);
