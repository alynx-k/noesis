-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3627: "2nde G3-Les
-- techniques de représentation de la terre"
-- (https://lyc.ecole-ci.org/course/view.php?id=3627). Resource "Je lis le
-- résumé de la leçon", mod_resource id 36727, redirecting to pluginfile "2nde
-- G3-Les techniques de représentation de la terre.pdf". Cross-checked against
-- the already-sourced Seconde A lesson for this exact same title/filename
-- (categoryid=102): identical PDF filename and, on page-1 inspection of the
-- situation d'apprentissage, identical wording, confirming this
-- Histoire-Géographie lesson is common-trunk content shared by Seconde A and
-- Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 1, Leçon 3). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-geo-techniques-representation-terre',
  '2nde',
  'C',
  'geographie',
  $$Les techniques de représentation de la Terre$$,
  3,
  '2nde-c-hg-geo-planete-terre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une journée portes ouvertes, le stand d'histoire-géographie de ton établissement expose un globe terrestre et plusieurs cartes très différentes les unes des autres. Un visiteur se demande comment une planète aussi immense a pu être réduite et représentée sur d'aussi petits supports, et pourquoi il existe autant de types de cartes différents.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le globe terrestre et la carte, deux représentations complémentaires$$,
        'body', $$Le globe terrestre est une représentation sphérique réduite de la Terre : il respecte fidèlement les proportions réelles des continents et des océans ainsi que le mouvement de rotation, mais il ne peut être ni plié ni observé dans son intégralité d'un seul coup d'œil, et il ne comporte ni échelle ni légende. La carte, elle, est une représentation plane, réduite et simplifiée : elle est facile à transporter, à interpréter et donne une vue d'ensemble immédiate, mais en aplatissant une surface sphérique sur un plan, elle déforme nécessairement certaines proportions ou certaines formes.$$,
        'highlights', array[$$globe terrestre$$, $$carte$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Représentation$$, $$Principale qualité$$, $$Principale limite$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Globe terrestre$$, $$Fidèle aux proportions réelles$$, $$Ne montre jamais la Terre entière d'un coup d'œil$$),
            jsonb_build_array($$Carte$$, $$Facile à transporter et à lire, avec échelle et légende$$, $$Déforme la forme sphérique de la Terre$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi une carte, contrairement au globe terrestre, déforme-t-elle nécessairement une partie de la réalité ?$$, 'solution', $$Parce qu'elle transpose une surface sphérique sur un support plan, ce qui empêche de conserver parfaitement toutes les proportions.$$)
      ),
      jsonb_build_object(
        'heading', $$Les différents types de cartes et leur utilité$$,
        'body', $$Parmi les cartes générales, le planisphère représente toute la Terre d'un seul tenant sur une seule surface, tandis que la mappemonde la représente sur deux disques juxtaposés correspondant chacun à un hémisphère. Les cartes thématiques, elles, se concentrent sur un phénomène précis (relief, climat, population, réseau hydrographique...), et les cartes topographiques représentent le relief à l'aide de courbes de niveau. Ces outils ne servent pas qu'à l'école : ils permettent de s'orienter et de se localiser au quotidien, aident les chercheurs à comprendre la diffusion d'un phénomène (par exemple la propagation d'une épidémie), et servent de base à des décisions d'aménagement du territoire ou même à des opérations de défense.$$,
        'highlights', array[$$planisphère$$, $$carte thématique$$, $$carte topographique$$]::text[],
        'example', jsonb_build_object('statement', $$Quel type de carte choisirais-tu pour étudier uniquement la répartition de la population dans une région ?$$, 'solution', $$Une carte thématique consacrée à la population.$$),
        'fixation', jsonb_build_object('question', $$Quelle ligne particulière permet à une carte topographique de représenter le relief ?$$, 'solution', $$La courbe de niveau, qui relie les points de même altitude.$$)
      ),
      jsonb_build_object(
        'heading', $$Les techniques de projection cartographique$$,
        'body', $$Une projection cartographique est le procédé géométrique qui permet de reporter chaque point du globe sur un support plan. La projection cylindrique de Mercator (du nom du géographe flamand Gérard Kremer) reproduit fidèlement la zone intertropicale mais exagère fortement la taille des régions polaires. La projection conique de Lambert, tangente aux latitudes moyennes, avantage plutôt les zones tempérées. La projection polaire (ou zénithale) privilégie la représentation des pôles, tandis que la projection UTM, dérivée de celle de Mercator, découpe le globe en fuseaux de 6° de longitude pour limiter les déformations sur chaque bande.$$,
        'highlights', array[$$projection de Mercator$$, $$projection conique de Lambert$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Projection$$, $$Zone la mieux représentée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Mercator (cylindrique)$$, $$Zone intertropicale$$),
            jsonb_build_array($$Lambert (conique)$$, $$Zones tempérées$$),
            jsonb_build_array($$Polaire (zénithale)$$, $$Zones polaires$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel inconvénient présente la projection de Mercator dans les régions éloignées de l'équateur ?$$, 'solution', $$Elle en exagère fortement la surface (par exemple, celle du Groenland apparaît démesurée).$$)
      ),
      jsonb_build_object(
        'heading', $$Des outils modernes au service de la cartographie$$,
        'body', $$La réalisation des cartes s'appuie aujourd'hui sur plusieurs technologies. La photographie aérienne, prise depuis un avion ou un ballon, fournit une vue d'ensemble d'un terrain qui sert de base à la carte. La cartographie assistée par ordinateur (CAO), réalisée avec des logiciels spécialisés, permet de produire des cartes de façon automatisée. La télédétection, enfin, consiste à recueillir des informations à distance grâce à des satellites : les satellites géostationnaires restent fixes au-dessus d'un point donné du globe, tandis que les satellites à défilement suivent une orbite polaire et balayent progressivement toute la surface terrestre.$$,
        'highlights', array[$$télédétection$$, $$cartographie assistée par ordinateur$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un satellite géostationnaire et un satellite à défilement ?$$, 'solution', $$Le satellite géostationnaire reste fixe au-dessus d'un point précis de la Terre, tandis que le satellite à défilement suit une orbite polaire et balaie progressivement toute la surface du globe.$$)
      ),
      jsonb_build_object(
        'heading', $$De la collecte des données au profil topographique$$,
        'body', $$Élaborer une carte suit un ordre précis : on collecte d'abord les données utiles (enquêtes, documents, photographies aériennes), on choisit ensuite l'échelle adaptée, on traite les données recueillies, puis on choisit les symboles qui formeront la légende avant de renseigner le fond de carte ; le titre, la date d'édition et l'orientation du Nord complètent enfin la carte. Le profil topographique, lui, se construit à partir des courbes de niveau d'une carte : on repère l'équidistance qui les sépare (l'écart d'altitude constant entre deux courbes consécutives), on choisit une échelle des longueurs et une échelle des hauteurs, puis on reporte chaque point d'altitude sur un papier millimétré avant de les relier pour obtenir la silhouette du relief traversé.$$,
        'highlights', array[$$équidistance$$, $$profil topographique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape d'élaboration d'une carte$$, $$Ce qu'elle apporte$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Collecte de l'information$$, $$Rassembler les données nécessaires$$),
            jsonb_build_array($$Choix de l'échelle$$, $$Fixer le rapport entre distance sur la carte et distance réelle$$),
            jsonb_build_array($$Traitement des données$$, $$Transformer les informations en données exploitables$$),
            jsonb_build_array($$Conception de la légende$$, $$Choisir les symboles qui traduisent les phénomènes$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on l'« équidistance » sur une carte topographique ?$$, 'solution', $$L'écart d'altitude constant qui sépare deux courbes de niveau consécutives.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un journaliste écrit que « les cartes géographiques sont forcément un peu mensongères », car les représenter oblige toujours à faire des choix. Un élève de seconde doit expliquer si cette affirmation est fondée, en s'appuyant sur ce qu'il sait des projections et des types de cartes.$$,
      'questions', array[
        $$Cite un avantage et un inconvénient du globe terrestre, puis un avantage et un inconvénient de la carte.$$,
        $$Distingue un planisphère d'une mappemonde.$$,
        $$Explique pourquoi la projection de Mercator déforme fortement les régions polaires.$$,
        $$Décris les grandes étapes de la construction d'un profil topographique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on la représentation plane de la Terre sur deux surfaces circulaires représentant chacune un hémisphère ?$$,
      'hint', $$Elle se distingue du planisphère, qui utilise une seule surface.$$,
      'expected', $$La mappemonde.$$
    ),
    jsonb_build_object(
      'question', $$Quelle projection cartographique représente le mieux les zones tempérées ?$$,
      'hint', $$C'est une projection conique, portant le nom d'un mathématicien.$$,
      'expected', $$La projection conique de Lambert.$$
    ),
    jsonb_build_object(
      'question', $$Quel procédé consiste à recueillir des informations sur la Terre à distance, grâce à des satellites ?$$,
      'hint', $$Le mot commence par « télé- ».$$,
      'expected', $$La télédétection.$$
    ),
    jsonb_build_object(
      'question', $$À partir de quel type de ligne construit-on un profil topographique ?$$,
      'hint', $$Ce sont des lignes qui relient les points de même altitude.$$,
      'expected', $$Les courbes de niveau.$$
    )
  ),
  now()
);
