-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3625: "2nde G2- La
-- planète Terre." (https://lyc.ecole-ci.org/course/view.php?id=3625).
-- Resource "Je lis le résumé de la leçon", mod_resource id 36703, redirecting
-- to pluginfile "2nde G2- La planète Terre..pdf". Cross-checked against the
-- already-sourced Seconde A lesson for this exact same title/filename
-- (categoryid=102): identical PDF filename and, on page-1 inspection of the
-- situation d'apprentissage, identical wording, confirming this
-- Histoire-Géographie lesson is common-trunk content shared by Seconde A and
-- Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 1, Leçon 2). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-geo-planete-terre',
  '2nde',
  'C',
  'geographie',
  $$La planète Terre$$,
  2,
  '2nde-c-hg-geo-objet-interet-demarche',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un documentaire scientifique affirme que le Soleil est environ 109 fois plus grand que la Terre. De retour en classe de seconde, tu partages cette information avec tes camarades, ce qui déclenche une discussion : quelle est vraiment la place de la Terre dans l'univers, et quelles sont ses caractéristiques essentielles ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La Terre, une planète du système solaire$$,
        'body', $$Le système solaire regroupe le Soleil et huit planètes qui gravitent autour de lui (Pluton en a été exclue en raison de son trop grand éloignement) : Mercure, Vénus, Terre, Mars, Jupiter, Saturne, Uranus et Neptune. La Terre se situe à environ 150 millions de kilomètres du Soleil et possède un unique satellite naturel, la Lune. Pendant longtemps, on a cru que la Terre occupait le centre de l'univers, immobile : c'est la théorie du géocentrisme, défendue dans l'Antiquité par Aristote puis Ptolémée. À partir du XVIe siècle, Nicolas Copernic démontre au contraire que c'est le Soleil qui occupe le centre du système et que la Terre, comme les autres planètes, tourne autour de lui : c'est l'héliocentrisme, confirmé ensuite par les observations de Galilée.$$,
        'highlights', array[$$système solaire$$, $$géocentrisme$$, $$héliocentrisme$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'héliocentrisme est la théorie, démontrée par Copernic, selon laquelle le Soleil occupe le centre du système solaire et la Terre tourne autour de lui ; elle a remplacé le géocentrisme, qui plaçait la Terre immobile au centre de l'univers.$$),
        'fixation', jsonb_build_object('question', $$Quel savant a démontré l'héliocentrisme, remplaçant la théorie du géocentrisme ?$$, 'solution', $$Nicolas Copernic, au XVIe siècle.$$)
      ),
      jsonb_build_object(
        'heading', $$Une planète sphérique et aux dimensions considérables$$,
        'body', $$La question de la forme de la Terre a occupé plusieurs savants de l'Antiquité : Thalès de Milet l'imaginait comme un disque plat, Aristote a apporté des indices en faveur d'une forme arrondie en observant l'ombre portée de la Terre sur la Lune lors des éclipses, et Pythagore puis Platon ont défendu l'idée d'une sphère. On sait aujourd'hui que la Terre n'est pas une sphère parfaite : légèrement aplatie aux pôles et renflée à l'équateur, elle a une forme dite ellipsoïdale. Ses dimensions sont considérables : sa circonférence, calculée dès l'Antiquité par Ératosthène, atteint environ 40 000 km, et son diamètre à l'équateur dépasse 12 750 km.$$,
        'highlights', array[$$forme ellipsoïdale$$, $$Ératosthène$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Grandeur$$, $$Valeur approximative$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Superficie$$, $$510 millions de km²$$),
            jsonb_build_array($$Circonférence$$, $$40 000 km (calculée par Ératosthène)$$),
            jsonb_build_array($$Diamètre à l'équateur$$, $$Environ 12 756 km$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que la Terre a une forme « ellipsoïdale » plutôt que parfaitement sphérique ?$$, 'solution', $$Parce qu'elle est légèrement aplatie aux pôles et renflée au niveau de l'équateur.$$)
      ),
      jsonb_build_object(
        'heading', $$La structure externe et interne de la Terre$$,
        'body', $$À sa surface, la Terre associe des terres émergées (les continents, qui n'occupent qu'environ 29 % de sa superficie) et des étendues d'eau salée (océans et mers, qui en couvrent environ 71 %) — ce qui lui vaut le surnom de « planète bleue ». L'équateur la partage en deux hémisphères, Nord et Sud. En profondeur, la Terre est organisée en trois couches concentriques d'épaisseurs très différentes : une écorce superficielle et rigide, un manteau intermédiaire très chaud où la roche reste partiellement en fusion, et un noyau central riche en fer et en nickel, dont la partie externe est liquide et la partie interne solide.$$,
        'highlights', array[$$71 % d'eau$$, $$écorce, manteau, noyau$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Couche interne$$, $$Caractéristique$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Écorce terrestre$$, $$Couche superficielle rigide, 10 à 70 km d'épaisseur$$),
            jsonb_build_array($$Manteau$$, $$Couche intermédiaire très chaude, roche en fusion partielle$$),
            jsonb_build_array($$Noyau$$, $$Centre riche en fer et nickel ; partie externe liquide, partie interne solide$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle proportion de la surface terrestre est occupée par les océans et les mers ?$$, 'solution', $$Environ 71 % (contre 29 % pour les terres émergées).$$)
      ),
      jsonb_build_object(
        'heading', $$La rotation de la Terre et ses conséquences$$,
        'body', $$La Terre tourne sur elle-même autour de l'axe des pôles, d'ouest en est, en un peu moins de 24 heures : c'est la rotation. Ce mouvement explique l'alternance du jour et de la nuit, chaque partie du globe passant tour à tour dans la lumière solaire puis dans l'ombre. Il explique aussi les fuseaux horaires : la Terre est divisée en 24 fuseaux de 15° de longitude chacun, l'heure augmentant d'une heure par fuseau vers l'est et diminuant d'une heure vers l'ouest à partir du méridien de Greenwich, qui sert de référence (heure GMT). Enfin, la rotation dévie les corps en mouvement (vents, cours d'eau) vers la droite dans l'hémisphère Nord et vers la gauche dans l'hémisphère Sud — un phénomène appelé effet Coriolis.$$,
        'highlights', array[$$rotation$$, $$fuseaux horaires$$, $$effet Coriolis$$]::text[],
        'example', jsonb_build_object('statement', $$Il est 12h au méridien de Greenwich (0°). Quelle heure est-il en un lieu situé à 45° de longitude Ouest ?$$, 'solution', $$45° correspond à 3 fuseaux horaires (45 ÷ 15 = 3). Comme ce lieu est à l'ouest, on retranche 3 heures : il est donc 9h.$$),
        'fixation', jsonb_build_object('question', $$Dans quel sens la Terre tourne-t-elle sur elle-même ?$$, 'solution', $$D'ouest en est, autour de l'axe des pôles.$$)
      ),
      jsonb_build_object(
        'heading', $$La révolution de la Terre et la dynamique du globe$$,
        'body', $$La Terre tourne aussi autour du Soleil en un peu plus de 365 jours, en suivant une trajectoire elliptique appelée orbite terrestre : c'est la révolution. Comme l'axe des pôles est incliné par rapport au plan de cette orbite, l'ensoleillement varie selon les saisons, produisant les solstices (jours les plus longs ou les plus courts de l'année) et les équinoxes (durées égales du jour et de la nuit). Par ailleurs, la surface terrestre n'est pas figée : selon la théorie de la dérive des continents, proposée par Alfred Wegener en 1912, tous les continents actuels formaient autrefois un unique bloc, la Pangée, qui s'est ensuite fragmenté. Cette idée a été confirmée et complétée par la théorie de la tectonique des plaques, selon laquelle l'écorce terrestre est découpée en plaques qui se rapprochent, s'écartent ou frottent entre elles, ce qui explique la formation des chaînes de montagnes, des séismes et des volcans.$$,
        'highlights', array[$$révolution$$, $$dérive des continents$$, $$tectonique des plaques$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel savant a proposé la théorie de la dérive des continents, et en quelle année ?$$, 'solution', $$Alfred Wegener, en 1912.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit expliquer à un camarade pourquoi il ne fait pas la même heure partout sur Terre au même instant, et pourquoi les saisons ne sont pas les mêmes dans l'hémisphère Nord et dans l'hémisphère Sud.$$,
      'questions', array[
        $$Explique la différence entre le géocentrisme et l'héliocentrisme.$$,
        $$Cite les trois couches internes de la Terre, de la plus superficielle à la plus profonde.$$,
        $$Un lieu est à 30° de longitude Est de Greenwich. S'il est 8h à Greenwich, quelle heure est-il en ce lieu ?$$,
        $$Explique en quoi consiste la théorie de la dérive des continents de Wegener.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de planètes compte le système solaire depuis l'exclusion de Pluton ?$$,
      'hint', $$Un chiffre inférieur à dix.$$,
      'expected', $$Huit planètes.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on le mouvement par lequel la Terre tourne sur elle-même en environ 24 heures ?$$,
      'hint', $$Ce mouvement explique l'alternance du jour et de la nuit.$$,
      'expected', $$La rotation.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le nom du supercontinent unique que formaient, selon Wegener, tous les continents actuels ?$$,
      'hint', $$Le nom vient du grec et signifie « toute la terre ».$$,
      'expected', $$La Pangée.$$
    ),
    jsonb_build_object(
      'question', $$Quelle couche interne de la Terre est essentiellement composée de fer et de nickel ?$$,
      'hint', $$C'est la couche la plus centrale.$$,
      'expected', $$Le noyau.$$
    )
  ),
  now()
);
