-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3709: "SVT 2nd A_L9_La reproduction conforme de la
-- cellule" (https://lyc.ecole-ci.org/course/view.php?id=3709)
-- Resource "Je lis le résumé de la leçon", pluginfile "SVT 2nd A_L9_La
-- reproduction conforme de la cellule.pdf" (9 pages).
-- Rewritten/paraphrased from the source PDF: the four successive phases of
-- mitosis (prophase, metaphase, anaphase, telophase), why the two daughter
-- cells end up genetically identical to the mother cell (chromatid
-- separation at anaphase after equatorial alignment at metaphase),
-- cytoplasm division (simple constriction in the animal cell vs a new
-- cell wall in the plant cell), and the importance of mitosis in the life
-- of an organism (renewal of worn/dead cells, growth from the egg cell,
-- reproduction of unicellular organisms, conservation of hereditary
-- material). 100% original wording; no sentence copied from the source.
-- categoryid=159 has no further subcategories (confirmed via
-- a[href*="categoryid"] listing: only SECONDE > SECONDE A > Sciences de la
-- vie et de la terre) and this is the last lesson listed under "Cours de
-- SVT 2nd A" (L1 to L9) — SVT Seconde A course sourcing is now complete.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-reproduction-conforme-cellule',
  '2nde',
  'A',
  'svt',
  $$La reproduction conforme de la cellule$$,
  9,
  '2nde-a-svt-structure-cellule-animale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de seconde A montre à ses camarades la plaie qu'elle s'était faite au bras quelques jours plus tôt : la peau est aujourd'hui presque entièrement cicatrisée. Intrigués par cette réparation rendue possible par la multiplication des cellules, les élèves cherchent à savoir si cette division cellulaire se déroule selon des étapes précises et pourquoi elle est si importante dans la vie d'un organisme.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La mitose se déroule en quatre phases successives$$,
        'body', $$L'observation de photographies présentant des cellules en division révèle que la division cellulaire, appelée mitose, comporte quatre étapes toujours liées entre elles et se déroulant dans le même ordre chronologique. À la prophase, le noyau gonfle, le centrosome se divise en deux et chaque centrosome fils migre vers un pôle de la cellule où il forme un aster (une calotte polaire chez la cellule végétale) ; entre les deux asters se met en place le fuseau de division pendant que les chromosomes se spiralisent jusqu'à devenir bien individualisés, chacun formé de deux chromatides réunies au niveau du centromère, tandis que la membrane nucléaire et les nucléoles disparaissent. À la métaphase, de courte durée, les chromosomes migrent et se positionnent tous à l'équateur du fuseau, où les microtubules rattachent chaque centromère aux deux pôles ; cette disposition forme une figure appelée plaque équatoriale. À l'anaphase, également courte, chaque centromère se divise à son tour : les deux chromatides d'un même chromosome, devenues chromosomes indépendants, s'écartent l'une de l'autre et migrent en sens opposé vers les pôles du fuseau par raccourcissement des microtubules. À la télophase enfin, dont la durée est comparable à celle de la prophase, un noyau se reforme au niveau de chacun des deux lots de chromosomes : ceux-ci se déspiralisent pour redevenir de la chromatine, le fuseau disparaît et la membrane nucléaire se reconstitue, donnant naissance à deux noyaux fils.$$,
        'highlights', array[$$prophase$$, $$métaphase$$, $$anaphase$$, $$télophase$$, $$plaque équatoriale$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Phase de la mitose$$, $$Événement principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Prophase$$, $$Condensation des chromosomes en deux chromatides ; disparition du noyau et des nucléoles ; mise en place du fuseau$$),
            jsonb_build_array($$Métaphase$$, $$Alignement des chromosomes à l'équateur du fuseau (plaque équatoriale)$$),
            jsonb_build_array($$Anaphase$$, $$Division des centromères ; migration des chromatides vers les pôles opposés$$),
            jsonb_build_array($$Télophase$$, $$Reformation de deux noyaux ; disparition du fuseau ; division du cytoplasme$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la figure formée par les chromosomes alignés à l'équateur du fuseau pendant la métaphase ?$$, 'solution', $$La plaque équatoriale.$$)
      ),
      jsonb_build_object(
        'heading', $$La mitose donne deux cellules filles identiques à la cellule mère$$,
        'body', $$À la fin de la télophase, on obtient deux noyaux fils distincts ; la division du cytoplasme qui suit sépare ensuite ces deux noyaux en deux cellules filles à part entière. Cette séparation cytoplasmique se réalise par un simple étranglement du cytoplasme chez la cellule animale, et par l'élaboration d'une nouvelle paroi squelettique chez la cellule végétale. Une division cellulaire qui, à partir d'une cellule mère, produit ainsi deux cellules filles identiques entre elles et identiques à la cellule mère est appelée mitose, ou reproduction conforme. Cette identité s'explique par le déroulement même des phases précédentes : à la métaphase, chaque chromosome dédoublé s'aligne à l'équateur, puis à l'anaphase ses deux chromatides, rigoureusement identiques, se séparent et migrent chacune vers un pôle opposé ; chaque cellule fille reçoit donc, à l'issue de la division, une garniture chromosomique strictement identique à celle de la cellule mère.$$,
        'highlights', array[$$mitose$$, $$reproduction conforme$$, $$garniture chromosomique$$]::text[],
        'property', jsonb_build_object('label', $$Définition de la mitose$$, 'text', $$La mitose est le mode de division cellulaire qui, à partir d'une cellule mère, produit deux cellules filles identiques entre elles et identiques à la cellule mère du point de vue de leur garniture chromosomique.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les deux cellules filles obtenues à l'issue de la mitose ont-elles la même garniture chromosomique que la cellule mère ?$$, 'solution', $$Parce qu'à la métaphase chaque chromosome dédoublé s'aligne à l'équateur, puis à l'anaphase ses deux chromatides identiques se séparent et migrent chacune vers un pôle : chaque cellule fille reçoit ainsi un jeu de chromosomes identique à celui de la cellule mère.$$)
      ),
      jsonb_build_object(
        'heading', $$La mitose est indispensable à la vie de l'organisme$$,
        'body', $$La mitose ne se contente pas de multiplier les cellules : elle assure plusieurs fonctions essentielles à la vie d'un organisme. Elle permet le renouvellement des cellules mortes ou usées, comme les cellules de la peau ou les cellules sanguines, ce qui explique la cicatrisation d'une plaie. Chez les organismes unicellulaires, elle constitue le mode de reproduction lui-même, puisqu'elle engendre deux individus identiques à partir d'un seul. Chez les organismes pluricellulaires, elle assure la croissance de l'organisme par l'augmentation du nombre de cellules, depuis la cellule-œuf issue de la fécondation jusqu'à l'individu adulte, formé de milliards de cellules. Enfin, en produisant des cellules filles de garniture chromosomique identique, elle assure la conservation du patrimoine héréditaire d'une génération de cellules à l'autre. La division de la cellule se fait donc effectivement par étapes précises, et cette division, la mitose, est très importante dans la vie des organismes vivants.$$,
        'highlights', array[$$renouvellement cellulaire$$, $$croissance$$, $$patrimoine héréditaire$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux exemples de tissus humains renouvelés grâce à la mitose.$$, 'solution', $$La peau et le sang (cellules sanguines), par exemple.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une séance de travaux pratiques, des élèves de seconde prélèvent de jeunes racines d'ail et observent au microscope des cellules provenant de l'extrémité de la racine. Sur leurs préparations, ils repèrent des cellules dont le noyau et les chromosomes présentent un aspect très différent d'une cellule à l'autre.$$,
      'questions', array[
        $$Identifie, parmi les aspects observés, celui qui pourrait correspondre à une cellule en métaphase, et justifie ta réponse.$$,
        $$Explique pourquoi les cellules obtenues à l'issue de cette division possèdent le même nombre de chromosomes que la cellule d'origine.$$,
        $$Nomme le phénomène observé dans ces cellules de l'extrémité de la racine et donne-en une définition.$$,
        $$Indique deux rôles que joue ce type de division dans la vie de la plante.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on la figure formée par l'alignement des chromosomes à l'équateur de la cellule pendant la métaphase ?$$,
      'hint', $$C'est une étape intermédiaire entre la prophase et l'anaphase.$$,
      'expected', $$La plaque équatoriale.$$
    ),
    jsonb_build_object(
      'question', $$Quel événement caractérise le passage de la métaphase à l'anaphase ?$$,
      'hint', $$Il concerne le point d'attache des deux chromatides d'un même chromosome.$$,
      'expected', $$La division du centromère, qui sépare les deux chromatides d'un même chromosome.$$
    ),
    jsonb_build_object(
      'question', $$Comment le cytoplasme se divise-t-il à la fin de la mitose chez une cellule animale ?$$,
      'hint', $$C'est différent de ce qui se passe chez une cellule végétale.$$,
      'expected', $$Par un simple étranglement (constriction) du cytoplasme entre les deux noyaux fils.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux rôles de la mitose dans la vie d'un organisme.$$,
      'hint', $$Pense à la réparation d'une plaie et à la croissance depuis la cellule-œuf.$$,
      'expected', $$Le renouvellement des cellules usées ou mortes et la croissance de l'organisme (on peut aussi citer la multiplication chez les unicellulaires ou la conservation du patrimoine héréditaire).$$
    )
  ),
  now()
);
