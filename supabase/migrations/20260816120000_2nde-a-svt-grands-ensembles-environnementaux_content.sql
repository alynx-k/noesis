-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3705: "SVT 2nd A_L5_Les grands ensembles environnementaux"
-- (https://lyc.ecole-ci.org/course/view.php?id=3705)
-- Resource "Je lis le résumé de la leçon", pluginfile "SVT 2nd A_L5_Les
-- grands ensembles environnementaux.pdf" (6 pages; internally "Leçon 3").
-- Rewritten/paraphrased from the source PDF: the four environmental spheres
-- (atmosphere, hydrosphere, lithosphere, biosphere) and their defining
-- characteristics (atmosphere sub-layers troposphere/stratosphere/
-- mesosphere/thermosphere/ionosphere; lithosphere = crust + upper mantle;
-- hydrosphere composition; biosphere as the thin band of life at their
-- boundary), and the distinct roles each sphere plays (gas exchange and
-- photosynthesis, internal/external geological activity and mineral
-- supply, water availability, habitat for life). 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-grands-ensembles-environnementaux',
  '2nde',
  'A',
  'svt',
  $$Les grands ensembles environnementaux$$,
  5,
  '2nde-a-svt-transmission-message-hormonal',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'une sortie pédagogique dans une réserve forestière, des élèves de seconde A découvrent un paysage varié : des cours d'eau, d'immenses étendues rocheuses, une végétation dense et de nombreux animaux. Émerveillés par cette diversité, ils cherchent à savoir comment regrouper tous ces éléments en grands ensembles et à déterminer les caractéristiques propres à chacun de ces ensembles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Quatre grands ensembles composent notre environnement$$,
        'body', $$L'observation de documents variés permet de regrouper les éléments de notre environnement en quatre grands ensembles. L'atmosphère est l'enveloppe gazeuse qui entoure la Terre ; elle est composée de diazote, de dioxygène, de dioxyde de carbone et de dihydrogène, répartis en plusieurs sous-couches superposées. La plus proche du sol, la troposphère, s'étend jusqu'à 12 km d'altitude environ et concentre les vents, les nuages et les phénomènes météorologiques. Au-dessus, la stratosphère (ou ozonosphère), qui va jusqu'à 50 km, contient la couche d'ozone qui absorbe une partie des rayons ultraviolets. Viennent ensuite la mésosphère jusqu'à 80 km, la thermosphère jusqu'à 500 km, où les températures sont élevées à cause de la proximité des rayons solaires, puis l'ionosphère au-delà de 500 km. L'hydrosphère regroupe la totalité des eaux de la planète, à l'état liquide, solide ou gazeux : océans, mers, lacs, eaux souterraines, calottes polaires et vapeur atmosphérique. La lithosphère est la partie solide de la Terre, formée de l'écorce terrestre et du manteau supérieur, elle-même constituée de roches, de minéraux et de sols.$$,
        'highlights', array[$$atmosphère$$, $$hydrosphère$$, $$lithosphère$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Sous-couche de l'atmosphère$$, $$Altitude approximative$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Troposphère$$, $$0 à 12 km$$),
            jsonb_build_array($$Stratosphère (ozonosphère)$$, $$12 à 50 km$$),
            jsonb_build_array($$Mésosphère$$, $$50 à 80 km$$),
            jsonb_build_array($$Thermosphère$$, $$80 à 500 km$$),
            jsonb_build_array($$Ionosphère$$, $$au-delà de 500 km$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle sous-couche de l'atmosphère contient la couche d'ozone qui absorbe les rayons ultraviolets ?$$, 'solution', $$La stratosphère, aussi appelée ozonosphère.$$)
      ),
      jsonb_build_object(
        'heading', $$La biosphère, une mince couche de vie entre les autres ensembles$$,
        'body', $$La biosphère n'occupe pas un espace propre et séparé : c'est la mince couche, comprise approximativement entre 9000 m d'altitude et 11000 m de profondeur océanique, où se concentre l'ensemble des êtres vivants, végétaux comme animaux. Elle se situe donc au contact de l'atmosphère, de la lithosphère et de l'hydrosphère, sans laquelle aucun organisme ne pourrait exister. Chaque écosystème présent dans cette biosphère possède une organisation propre, avec des relations alimentaires précises entre les espèces qui le composent. Contrairement à l'atmosphère, à la lithosphère et à l'hydrosphère, qui existeraient même en l'absence de vie, la biosphère est définie par la présence même des organismes vivants.$$,
        'highlights', array[$$biosphère$$, $$écosystème$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La biosphère est la fine couche de la planète, à la limite de l'atmosphère, de la lithosphère et de l'hydrosphère, dans laquelle vivent tous les organismes vivants.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi peut-on dire que la biosphère n'est pas un ensemble indépendant des trois autres ?$$, 'solution', $$Parce qu'elle correspond à la zone de contact entre l'atmosphère, la lithosphère et l'hydrosphère, et que la vie qui s'y développe dépend de ces trois ensembles.$$)
      ),
      jsonb_build_object(
        'heading', $$Chaque grand ensemble joue un rôle précis pour la vie$$,
        'body', $$Au-delà de leurs caractéristiques propres, ces quatre ensembles se distinguent aussi par leurs rôles. L'atmosphère fournit le dioxygène indispensable à la respiration des êtres vivants, qui y rejettent en retour le dioxyde de carbone utilisé par les plantes pour la photosynthèse grâce à l'énergie solaire. La lithosphère est le siège d'une intense activité interne (tectonique des plaques, séismes, volcanisme, radioactivité) et externe ; sa partie superficielle sert de support aux végétaux, qui y puisent l'eau et les sels minéraux indispensables à leur croissance, et c'est également le lieu de formation des roches. L'hydrosphère est indispensable à tout être vivant et constitue un maillon essentiel des phénomènes atmosphériques comme les précipitations. Quant à la biosphère, elle représente la sphère favorable à toute forme de vie, à la croisée des trois autres ensembles.$$,
        'highlights', array[$$photosynthèse$$, $$activité interne$$, $$activité externe$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi l'atmosphère et les végétaux dépendent-ils l'un de l'autre pour les échanges gazeux ?$$, 'solution', $$Les êtres vivants prélèvent le dioxygène de l'atmosphère pour respirer et y rejettent du dioxyde de carbone ; les plantes utilisent ensuite ce dioxyde de carbone, avec l'énergie solaire, pour réaliser la photosynthèse.$$),
        'fixation', jsonb_build_object('question', $$Quel rôle joue la partie superficielle de la lithosphère pour les végétaux ?$$, 'solution', $$Elle leur sert de support et leur fournit l'eau et les sels minéraux nécessaires à leur développement.$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : un environnement fait de quatre ensembles complémentaires$$,
        'body', $$Notre environnement est constitué de l'atmosphère, de la lithosphère, de l'hydrosphère et de la biosphère. Ces grands ensembles environnementaux ne sont pas localisés aux mêmes endroits et présentent des caractéristiques différentes, mais ils sont complémentaires : réunis, ils offrent un cadre harmonieux et équilibré à l'ensemble des êtres vivants, comme on peut l'observer dans la diversité des paysages d'une réserve forestière.$$,
        'highlights', array[$$cadre harmonieux$$, $$équilibré$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite les quatre grands ensembles environnementaux qui composent notre environnement.$$, 'solution', $$L'atmosphère, l'hydrosphère, la lithosphère et la biosphère.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$De retour de leur sortie dans la réserve forestière, les élèves rédigent un compte rendu. Ils doivent y associer chaque élément observé sur le terrain (roches affleurantes, cours d'eau, air frais en altitude, présence d'animaux et de végétaux) au grand ensemble environnemental correspondant, puis expliquer le rôle de cet ensemble dans le fonctionnement global de la réserve.$$,
      'questions', array[
        $$À quel grand ensemble environnemental appartiennent les roches observées dans la réserve ?$$,
        $$À quel grand ensemble environnemental appartient le cours d'eau traversant la réserve ?$$,
        $$Explique pourquoi les animaux et les végétaux de la réserve ne peuvent se développer que dans une fine couche à la surface de la Terre.$$,
        $$Explique en quoi l'atmosphère et la lithosphère sont indispensables à la vie des organismes observés dans la réserve.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les quatre grands ensembles environnementaux qui composent notre environnement ?$$,
      'hint', $$Ils correspondent à l'air, à l'eau, à la terre solide et à la fine couche de vie.$$,
      'expected', $$L'atmosphère, l'hydrosphère, la lithosphère et la biosphère.$$
    ),
    jsonb_build_object(
      'question', $$Quelle sous-couche de l'atmosphère contient la couche d'ozone qui absorbe les rayons ultraviolets ?$$,
      'hint', $$Elle se situe entre 12 et 50 km d'altitude environ.$$,
      'expected', $$La stratosphère (ozonosphère).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la lithosphère est-elle indispensable aux végétaux ?$$,
      'hint', $$Sa partie superficielle leur fournit deux ressources puisées dans le sol.$$,
      'expected', $$Parce que sa partie superficielle leur apporte l'eau et les sels minéraux nécessaires à leur développement.$$
    ),
    jsonb_build_object(
      'question', $$Quel rôle joue l'hydrosphère pour l'ensemble des êtres vivants ?$$,
      'hint', $$C'est une ressource sans laquelle aucun organisme ne peut survivre.$$,
      'expected', $$Elle est indispensable à tout être vivant et constitue un maillon important des phénomènes atmosphériques.$$
    )
  ),
  now()
);
