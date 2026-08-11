-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3311: "2nde_HISTOIRE_T3_L1: LA REVOLUTION DU NEOLITHIQUE
-- EN CÔTE D'IVOIRE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3311)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32971, redirecting
-- to pluginfile "2nde H9- la révolution du néolithique en Côte divoire.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 1): the varied
-- Neolithic sites and remains found across Côte d'Ivoire (shell middens,
-- polished axes, rock engravings, tool workshops), the reasons behind the
-- Neolithic revolution (agriculture, animal domestication, sedentarization),
-- and the resulting economic and social transformations (new activities,
-- villages/chiefdoms, birth of art and religion). 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-hist-revolution-neolithique-ci',
  '2nde',
  'A',
  'histoire',
  $$La révolution du néolithique en Côte d'Ivoire$$,
  9,
  '2nde-a-hg-hist-traites-des-noirs',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une causerie-débat en classe de seconde, deux élèves affirment que l'espace ivoirien n'a jamais été concerné par les grandes transformations de la préhistoire, notamment celles du néolithique. Pour vérifier cette affirmation, la classe décide de rechercher les sites et vestiges néolithiques présents sur le territoire ivoirien et d'analyser le mode de vie des populations de cette époque.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Des vestiges néolithiques répartis sur tout le territoire$$,
        'body', $$Contrairement à l'idée reçue, la Côte d'Ivoire a livré de très nombreux vestiges néolithiques, s'étendant entre -8000 et -1500 ans, dans presque toutes ses régions. Sur le littoral (Dabou, Bingerville, Grand-Lahou, Aboisso), on trouve d'importants amas de coquillages. Au nord, des grandes dalles ont été découvertes à Odienné, et des gravures rupestres à Man, Daloa, Dabakala et Niakaramandougou. Un peu partout dans le pays, notamment autour de Toumodi, Dimbokro, Bouaké ou Guiglo, de véritables ateliers où l'on fabriquait des haches polies en série ont également été mis au jour, aux côtés de fragments de poteries et de perles.$$,
        'highlights', array[$$amas de coquillages$$, $$gravures rupestres$$, $$ateliers de haches polies$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quelle partie du territoire ivoirien trouve-t-on principalement des amas de coquillages néolithiques ?$$, 'solution', $$Sur le littoral (par exemple à Dabou, Bingerville, Grand-Lahou ou Aboisso).$$)
      ),
      jsonb_build_object(
        'heading', $$Ce que révèlent ces vestiges$$,
        'body', $$Les amas de coquillages du littoral n'étaient pas de simples déchets : ils servaient aussi de nourriture, d'appâts pour la pêche, voire de lieux de sépulture, et contenaient des outils ainsi que des ossements d'animaux. Sur le plan technique, l'ensemble de ces vestiges témoigne d'un net progrès par rapport au paléolithique : les outils retrouvés (haches, faucilles, meules, polissoirs) sont plus perfectionnés, plus tranchants, finement taillés et polis, signe d'un savoir-faire artisanal en pleine évolution.$$,
        'highlights', array[$$outils polis$$, $$progrès technique$$]::text[],
        'fixation', jsonb_build_object('question', $$Outre la nourriture, à quoi pouvaient aussi servir les amas de coquillages découverts sur le littoral ivoirien ?$$, 'solution', $$D'appâts pour la pêche, ou encore de lieux de sépulture.$$)
      ),
      jsonb_build_object(
        'heading', $$Les raisons de la révolution néolithique$$,
        'body', $$Le basculement du néolithique s'explique par l'invention de l'agriculture et la domestication des premières espèces animales, qui ont permis aux populations de se fixer durablement sur un territoire plutôt que de se déplacer sans cesse à la recherche de nourriture. Cette sédentarisation a entraîné un véritable essor démographique, à l'origine de profonds changements économiques et sociaux.$$,
        'highlights', array[$$domestication$$, $$sédentarisation$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la domestication des animaux et l'agriculture ont-elles favorisé un essor démographique ?$$, 'solution', $$Parce qu'elles offraient une alimentation plus abondante et régulière que la chasse et la cueillette, permettant de nourrir davantage de personnes et de réduire les risques de famine liés aux déplacements constants.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux innovations principales à l'origine de la sédentarisation au néolithique ?$$, 'solution', $$L'agriculture et la domestication des animaux (élevage).$$)
      ),
      jsonb_build_object(
        'heading', $$De nouvelles activités économiques$$,
        'body', $$Aux activités héritées du paléolithique (chasse, pêche, cueillette) s'ajoutent désormais l'agriculture, avec la sélection et la culture de céréales et de tubercules, et l'élevage d'espèces domestiquées comme les chèvres, les moutons ou les bœufs. Ces deux activités assurent aux populations une alimentation plus régulière. Parallèlement se développent l'art (notamment l'art rupestre), le commerce sous forme de troc, et un artisanat de la pierre polie de plus en plus raffiné.$$,
        'highlights', array[$$agriculture$$, $$élevage$$, $$troc$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite trois animaux domestiqués par les populations néolithiques de Côte d'Ivoire.$$, 'solution', $$Les chèvres, les moutons et les bœufs.$$)
      ),
      jsonb_build_object(
        'heading', $$Des transformations sociales profondes$$,
        'body', $$Devenues sédentaires, les populations néolithiques forment désormais des familles et des tribus, puis s'organisent en villages, en chefferies et en royaumes. Des règles sociales et des structures d'autorité commencent à se mettre progressivement en place. Sur le plan spirituel, les hommes se mettent à enterrer leurs morts et à vénérer des représentations assimilées à des divinités, marquant l'apparition d'une religion structurée aux côtés de l'art.$$,
        'highlights', array[$$organisation en villages$$, $$naissance de la religion$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels nouveaux types d'organisation sociale apparaissent au néolithique en Côte d'Ivoire ?$$, 'solution', $$Les familles, les tribus, les villages, les chefferies et les royaumes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un documentaire projeté par le club d'histoire-géographie montre des objets en pierre variés et fins, répartis sur tout le territoire ivoirien, et évoque un nouveau mode de vie des peuples du néolithique. Un élève de seconde doit identifier ces vestiges et expliquer ce changement de mode de vie.$$,
      'questions', array[
        $$Cite trois types de vestiges néolithiques retrouvés en Côte d'Ivoire et leur localisation.$$,
        $$Explique pourquoi l'agriculture et l'élevage ont permis la sédentarisation des populations.$$,
        $$Décris les nouvelles activités économiques apparues au néolithique.$$,
        $$Explique les transformations sociales survenues au néolithique en Côte d'Ivoire.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Entre quelles dates se situe le néolithique en Côte d'Ivoire ?$$,
      'hint', $$Il commence bien après le paléolithique et se termine avant l'ère historique locale.$$,
      'expected', $$De -8000 ans à -1500 ans.$$
    ),
    jsonb_build_object(
      'question', $$Quel type de vestige néolithique trouve-t-on en grande quantité sur le littoral ivoirien (Dabou, Bingerville, Grand-Lahou) ?$$,
      'hint', $$Ce sont des restes issus de la pêche et de la cueillette.$$,
      'expected', $$Des amas de coquillages.$$
    ),
    jsonb_build_object(
      'question', $$Quelles deux innovations économiques majeures caractérisent le néolithique ?$$,
      'hint', $$L'une concerne les plantes, l'autre les animaux.$$,
      'expected', $$L'agriculture et l'élevage.$$
    ),
    jsonb_build_object(
      'question', $$Cite une région du nord de la Côte d'Ivoire où des vestiges néolithiques (gravures rupestres, boules de pierre) ont été découverts.$$,
      'hint', $$Par exemple Niakaramandougou, Ferkessédougou ou Korhogo.$$,
      'expected', $$Par exemple Niakaramandougou (ou Ferkessédougou, ou Korhogo).$$
    )
  ),
  now()
);
