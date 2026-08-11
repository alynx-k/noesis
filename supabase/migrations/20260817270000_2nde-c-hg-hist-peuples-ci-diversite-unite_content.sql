-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3657: "2nde H10-Les
-- peuples de Côte d'Ivoire diversité et unité"
-- (https://lyc.ecole-ci.org/course/view.php?id=3657). Resource "Je lis le
-- résumé de la leçon", mod_resource id 37087, redirecting to pluginfile "2nde
-- H10-Les peuples de Côte dIvoire diversité et unité.pdf". Cross-checked
-- against the already-sourced Seconde A lesson for this exact same
-- title/filename (categoryid=102): identical PDF filename and, on page-1
-- inspection of the situation d'apprentissage, identical wording, confirming
-- this Histoire-Géographie lesson is common-trunk content shared by Seconde A
-- and Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 3, Leçon 2). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-hist-peuples-ci-diversite-unite',
  '2nde',
  'C',
  'histoire',
  $$Les peuples de Côte d'Ivoire : diversité et unité$$,
  10,
  '2nde-c-hg-hist-revolution-neolithique-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence sur la mise en place des peuples de Côte d'Ivoire, un conférencier affirme qu'il existe une réelle nécessité de réconciliation nationale, car malgré la diversité de leurs origines, les peuples ivoiriens partagent en réalité de nombreux traits communs. Marqués par cette déclaration, des élèves de seconde décident de rechercher l'origine de ces peuples, leurs vagues migratoires et ce qui fait leur unité au-delà de leur diversité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les Pygmées, premiers habitants supposés de l'espace ivoirien$$,
        'body', $$Selon la tradition orale de nombreuses ethnies ivoiriennes, les véritables premiers occupants du territoire seraient des Pygmées (ou Négrilles), hommes de petite taille (1,44 à 1,55 m), à la peau plus claire, aux jambes courtes et aux bras longs, désignés différemment selon les peuples (« Kakatika » chez les Baoulé, « Akwatika » chez les Agni, « Yônin » chez les Gour). Les vestiges du paléolithique et du néolithique confirment la présence humaine ancienne sur le territoire. Sont ensuite venues les toutes premières ethnies, dites « proto-ethnies » : les Protoakan (comme les ancêtres des Ebrié ou des Baoulé), les Protokrou (ancêtres des Bété, des Wobé), les Protomandé et les Protosénoufo.$$,
        'highlights', array[$$Pygmées$$, $$proto-ethnies$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment les Baoulé désignent-ils les Pygmées dans leur tradition orale ?$$, 'solution', $$« Kakatika ».$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes vagues migratoires (Xe-XVIIIe siècle)$$,
        'body', $$Entre le Xe et le XVIIIe siècle, la Côte d'Ivoire connaît ses plus grandes vagues migratoires, pour des raisons économiques (recherche de l'or et de la cola pour les Mandé, de terres cultivables pour les Sénoufo), politiques et militaires (fondation de nouveaux royaumes, crises de succession, razzias) ou encore sociales et religieuses (fuite face à la traite négrière, expansion de l'islam). Du Xe au XVIe siècle, Mandé et Gour arrivent dans les savanes du Nord tandis que des Krou franchissent le fleuve Cavally à l'ouest. Entre le XVIe et le XVIIe siècle migrent les Mandé, les Krou, les Voltaïques et les Akan lagunaires. Enfin, entre le XVIIe et le XVIIIe siècle, le peuple baoulé se forme et s'implante dans les savanes pré-forestières, tandis que les Abron s'installent autour de Bondoukou.$$,
        'highlights', array[$$migrations Xe-XVIIIe siècle$$, $$causes économiques et politiques$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Période$$, $$Peuples concernés$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Xe-XVIe siècle$$, $$Mandé et Gour (Nord), Krou (Ouest)$$),
            jsonb_build_array($$XVIe-XVIIe siècle$$, $$Mandé, Krou, Voltaïques, Akan lagunaires$$),
            jsonb_build_array($$XVIIe-XVIIIe siècle$$, $$Baoulé, Abron, Lobi, N'zima$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi la traite négrière est-elle citée comme une cause de migration des Akan à partir du XVIe siècle ?$$, 'solution', $$Parce que la terreur qu'elle provoquait poussait des familles, puis des groupes entiers, à fuir leurs terres pour échapper à la capture et à la destruction.$$),
        'fixation', jsonb_build_object('question', $$Quel peuple se forme et s'implante dans les savanes pré-forestières entre le XVIIe et le XVIIIe siècle ?$$, 'solution', $$Le peuple baoulé.$$)
      ),
      jsonb_build_object(
        'heading', $$Une diversité réelle d'organisations sociales et politiques$$,
        'body', $$Les grands groupes ethniques de Côte d'Ivoire ont développé des organisations très différentes. Chez les Mandé du Nord et les Akan forestiers, le pouvoir est centralisé et héréditaire, organisé en véritables monarchies dirigées par un roi assisté de notables. À l'inverse, les Krou, les Mandé du Sud, les Akan lagunaires et les Sénoufo ont plutôt fondé des démocraties villageoises, dirigées par un chef assisté d'un conseil de notables. Sur le plan de la filiation, certains peuples comme les Akan et les Sénoufo sont matrilinéaires (l'héritage se transmet par la mère), tandis que d'autres, comme les Mandé et les Krou, sont patrilinéaires.$$,
        'highlights', array[$$monarchie$$, $$démocratie villageoise$$, $$matrilinéaire / patrilinéaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Groupe ethnique$$, $$Organisation politique$$, $$Filiation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Mandé du Nord$$, $$Monarchie (roi = Mansa)$$, $$Patrilinéaire$$),
            jsonb_build_array($$Akan forestiers$$, $$Monarchie (roi = Nanan)$$, $$Matrilinéaire$$),
            jsonb_build_array($$Krou, Mandé du Sud$$, $$Démocratie villageoise$$, $$Patrilinéaire$$),
            jsonb_build_array($$Sénoufo, Akan lagunaires$$, $$Démocratie villageoise$$, $$Matrilinéaire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle différence de filiation distingue les Akan des Mandé ?$$, 'solution', $$Les Akan sont matrilinéaires (héritage transmis par la mère) alors que les Mandé sont patrilinéaires (héritage transmis par le père).$$)
      ),
      jsonb_build_object(
        'heading', $$Ce qui unit les peuples de Côte d'Ivoire au-delà de leur diversité$$,
        'body', $$Malgré ces différences, les peuples ivoiriens partagent de nombreux traits. Des emprunts culturels (comme le masque Ouan-Gouro-Baoulé, le goli) et des échanges matrimoniaux (par exemple entre Tagouana et Baoulé) témoignent de contacts anciens et durables. Surtout, des alliances à plaisanterie (le « tukpê ») se sont tissées entre certains peuples — comme entre Akyé et Dida, ou entre Baoulé et Agni — permettant d'entretenir des relations pacifiques et une bonne cohabitation. Enfin, tous ces peuples partagent un même territoire, un attachement commun à celui-ci, et depuis la colonisation, une langue commune, le français, qui facilite la communication entre groupes d'origines si diverses.$$,
        'highlights', array[$$alliance à plaisanterie$$, $$langue commune$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'une « alliance à plaisanterie » (tukpê) entre deux peuples ivoiriens ?$$, 'solution', $$Une alliance traditionnelle, comme celle entre Akyé et Dida ou entre Baoulé et Agni, qui permet d'entretenir des relations pacifiques et une bonne cohabitation entre les peuples concernés.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conférencier affirme qu'il existe une réelle obligation de réconciliation nationale entre les peuples de Côte d'Ivoire, car malgré leurs diversités d'origines, ils présentent surtout de nombreux traits communs. Un élève de seconde doit vérifier cette affirmation en s'appuyant sur ce qu'il sait du peuplement et de l'organisation des peuples ivoiriens.$$,
      'questions', array[
        $$Cite les quatre grands groupes de « proto-ethnies » présents en Côte d'Ivoire avant les grandes migrations.$$,
        $$Donne un exemple de cause économique et un exemple de cause politique des migrations en Côte d'Ivoire.$$,
        $$Compare l'organisation politique des Mandé du Nord à celle des Krou.$$,
        $$Cite deux éléments qui unissent les peuples de Côte d'Ivoire malgré leur diversité d'origine.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on, dans la tradition orale ivoirienne, les tout premiers habitants supposés du territoire, de petite taille ?$$,
      'hint', $$On les appelle aussi « Négrilles ».$$,
      'expected', $$Les Pygmées.$$
    ),
    jsonb_build_object(
      'question', $$Quel peuple ivoirien se forme et s'implante dans les savanes pré-forestières entre le XVIIe et le XVIIIe siècle ?$$,
      'hint', $$Son nom est associé à la légende d'Abla Pokou.$$,
      'expected', $$Le peuple baoulé.$$
    ),
    jsonb_build_object(
      'question', $$Quel type d'organisation politique caractérise les Mandé du Nord et les Akan forestiers, avec un pouvoir centralisé et héréditaire ?$$,
      'hint', $$C'est l'inverse d'une démocratie villageoise.$$,
      'expected', $$La monarchie.$$
    ),
    jsonb_build_object(
      'question', $$Quelle langue commune, héritée de la colonisation, facilite la communication entre les différents peuples de Côte d'Ivoire ?$$,
      'hint', $$C'est la langue officielle actuelle du pays.$$,
      'expected', $$Le français.$$
    )
  ),
  now()
);
