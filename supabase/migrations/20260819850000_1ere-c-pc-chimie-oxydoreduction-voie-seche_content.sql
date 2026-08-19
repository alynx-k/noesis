-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2396: "LEÇON 13: OXYDORÉDUCTION PAR VOIE SÈCHE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2396), resource id 22110.
-- Contenu réécrit à partir du PDF source (oxydation du magnésium par le
-- dioxygène, réduction de l'oxyde de cuivre par le carbone, aluminothermie
-- de l'oxyde ferrique, nombre d'oxydation). Tout le contenu est factuel
-- (chimie inorganique) : demi-équations, règles de calcul du nombre
-- d'oxydation et exercices numériques sont repris/adaptés tels quels ;
-- explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-oxydoreduction-voie-seche',
  '1ere',
  'C',
  'physique-chimie',
  $$Oxydoréduction par voie sèche$$,
  9,
  '1ere-c-pc-chimie-couples-oxydoreducteurs-solution-dosage',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'occasion de la fête du nouvel an, des élèves de 1ère C du Lycée Moderne Arsène Assouan Usher observent un feu d'artifices et sont émerveillés par l'éclat, la beauté des couleurs et des figures. Leur professeur de physique-chimie leur explique que ce feu d'artifices résulte de réactions d'oxydation par voie sèche, faisant intervenir divers composés solides (magnésium, oxyde ferrique Fe2O3...). Pour les aider à comprendre ce phénomène, il décide avec eux d'écrire les équations-bilans de ces réactions, de les interpréter et de définir le nombre d'oxydation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Oxydation du magnésium par le dioxygène$$,
        'body', $$La combustion du magnésium dans le dioxygène, très vive, produit une lumière blanche intense et une fumée blanche d'oxyde de magnésium (MgO), un solide de structure ionique (empilement d'ions Mg²⁺ et O²⁻). Chaque atome de magnésium cède 2 électrons pour devenir Mg²⁺ (oxydation : Mg → Mg²⁺ + 2e⁻), tandis que chaque molécule de dioxygène capte 4 électrons pour devenir 2 ions O²⁻ (réduction : O2 + 4e⁻ → 2O²⁻). L'équation-bilan est 2 Mg + O2 → 2 Mg²⁺ + 2 O²⁻. Cette réaction, qui se déroule en dehors de tout milieu aqueux, est une réaction d'oxydoréduction par voie sèche, entre les couples Mg²⁺/Mg et O2/O²⁻.$$,
        'highlights', array[$$Mg → Mg²⁺ + 2e⁻ (oxydation) ; O2 + 4e⁻ → 2O²⁻ (réduction)$$, $$équation-bilan : 2 Mg + O2 → 2 Mg²⁺ + 2 O²⁻$$, $$oxydoréduction « par voie sèche » = en dehors du milieu aqueux$$]::text[],
        'fixation', jsonb_build_object('question', $$Que veut-on dire lorsqu'on qualifie une réaction d'oxydoréduction « par voie sèche » ?$$, 'solution', $$Qu'elle se déroule en dehors de tout milieu aqueux.$$)
      ),
      jsonb_build_object(
        'heading', $$Réduction de l'oxyde de cuivre II par le carbone$$,
        'body', $$Lorsqu'on chauffe un mélange d'oxyde de cuivre II (CuO) et de carbone, il se forme un dépôt rouge de cuivre métallique (réduction : 2 CuO → 2 Cu + O2) et un gaz qui trouble l'eau de chaux, le dioxyde de carbone (oxydation du carbone : C + O2 → CO2). L'équation-bilan de cette réaction d'oxydoréduction par voie sèche est : 2 CuO + C → 2 Cu + CO2.$$,
        'highlights', array[$$2 CuO + C → 2 Cu + CO2$$, $$le CO2 formé trouble l'eau de chaux (test caractéristique)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel test permet de mettre en évidence le dioxyde de carbone formé lors de cette réaction ?$$, 'solution', $$Le trouble de l'eau de chaux.$$)
      ),
      jsonb_build_object(
        'heading', $$Réduction de l'oxyde ferrique par l'aluminium (aluminothermie)$$,
        'body', $$Les oxydes Fe2O3 et Al2O3 sont des oxydes ioniques, formés respectivement des ions (Fe³⁺, O²⁻) et (Al³⁺, O²⁻). Lorsqu'on enflamme un mélange de poudre d'aluminium et d'oxyde ferrique, les ions Fe³⁺ sont réduits en fer métallique (Fe³⁺ + 3e⁻ → Fe) tandis que l'aluminium est oxydé (Al → Al³⁺ + 3e⁻), formant de l'alumine (Al2O3), une poudre blanche. L'équation-bilan est Fe³⁺ + Al → Fe + Al³⁺. Cette réaction, appelée aluminothermie, est une réaction d'oxydoréduction par voie sèche au cours de laquelle il y a transfert d'électrons entre l'aluminium et les ions Fe³⁺ ; elle est utilisée industriellement, par exemple pour préparer certains métaux comme le chrome à partir de son oxyde.$$,
        'highlights', array[$$Fe³⁺ + 3e⁻ → Fe (réduction) ; Al → Al³⁺ + 3e⁻ (oxydation)$$, $$équation-bilan : Fe³⁺ + Al → Fe + Al³⁺$$, $$aluminothermie : réaction utilisée pour préparer industriellement certains métaux$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la réaction de réduction de l'oxyde ferrique par l'aluminium ?$$, 'solution', $$L'aluminothermie.$$)
      ),
      jsonb_build_object(
        'heading', $$Le nombre d'oxydation$$,
        'body', $$Le nombre d'oxydation (n.o) d'un élément dans une espèce chimique (atome, ion ou molécule) est un nombre algébrique, écrit en chiffre romain précédé d'un signe, qui indique son état d'oxydation. Il est nul dans un corps pur simple (n.o(Fe) = 0). Dans un ion monoatomique, il est égal à la charge de l'ion (n.o(Fe²⁺) = +II). Dans un ion polyatomique ou une molécule, la somme algébrique des n.o de tous les éléments est égale respectivement à la charge globale de l'ion, ou à zéro pour une molécule. Par convention, sauf dans O2, l'oxygène a le n.o -II ; sauf dans H2, l'hydrogène a le n.o +I. Au cours d'une réaction, si le n.o d'un élément augmente, l'espèce qui le contient a subi une oxydation (c'est le réducteur) ; si son n.o diminue, l'espèce a subi une réduction (c'est l'oxydant).$$,
        'highlights', array[$$n.o d'un corps pur simple = 0 ; n.o d'un ion monoatomique = sa charge$$, $$dans une molécule : somme des n.o = 0$$, $$n.o augmente → oxydation (réducteur) ; n.o diminue → réduction (oxydant)$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine le nombre d'oxydation du carbone dans CO2, sachant que n.o(O) = -II.$$, 'solution', $$n.o(C) + 2·n.o(O) = 0, donc n.o(C) = -2 × (-II) = +IV.$$),
        'fixation', jsonb_build_object('question', $$Quel est le nombre d'oxydation de l'aluminium à l'état de métal Al pur ?$$, 'solution', $$0, car c'est un corps pur simple.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le professeur informe ses élèves que le chrome (Cr) est préparé industriellement par aluminothermie à partir de l'oxyde de chrome (III) Cr2O3 et de l'aluminium métallique. On obtient ainsi du chrome métallique et de l'oxyde d'aluminium (alumine, Al2O3). On donne les masses molaires atomiques : M(Cr) = 52 g/mol ; M(O) = 16 g/mol.$$,
      'questions', array[
        $$Écris l'équation chimique de la réaction qui a lieu.$$,
        $$Montre qu'il s'agit d'une réaction redox, et précise le réactif oxydant et le réactif réducteur.$$,
        $$Calcule la masse de chrome obtenue lorsqu'on fait réagir 5,0 g d'oxyde de chrome (III) avec 8,5 g d'aluminium.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris la demi-équation d'oxydation du magnésium.$$,
      'hint', $$Mg perd 2 électrons.$$,
      'expected', $$Mg → Mg²⁺ + 2e⁻.$$
    ),
    jsonb_build_object(
      'question', $$Dans la réaction 2 CuO + C → 2 Cu + CO2, quelle espèce chimique est l'oxydant ?$$,
      'hint', $$C'est celle dont le n.o de l'élément métallique diminue.$$,
      'expected', $$L'oxyde de cuivre CuO (le cuivre y passe du n.o +II au n.o 0).$$
    ),
    jsonb_build_object(
      'question', $$Comment détermine-t-on le nombre d'oxydation d'un élément dans une molécule neutre ?$$,
      'hint', $$La somme de tous les n.o obéit à une règle simple.$$,
      'expected', $$La somme algébrique des nombres d'oxydation de tous les éléments de la molécule est égale à zéro.$$
    ),
    jsonb_build_object(
      'question', $$Dans la réaction d'aluminothermie Fe³⁺ + Al → Fe + Al³⁺, quel élément subit une oxydation ?$$,
      'hint', $$Son nombre d'oxydation augmente, de 0 à +III.$$,
      'expected', $$L'aluminium (Al), dont le n.o passe de 0 à +III.$$
    )
  ),
  now()
);
