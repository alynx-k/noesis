-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2327: "EE 9: Prdtion-écrite_Analyser_sujet-Rech_idées"
-- (https://lyc.ecole-ci.org/course/view.php?id=2327), resource id 21318.
-- Content is methodological, illustrated with real short attributed
-- opinions (Alphonse Boolamou de Ligouri, Michel Tournier) and factual
-- examples (football, published works/magazines), used for pedagogical
-- analysis — not reproduction of a creative narrative work.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-production-ecrite-analyser-rechercher',
  '1ere',
  'C',
  'francais',
  $$La production écrite : analyser le sujet et rechercher les idées$$,
  9,
  '1ere-c-francais-dissertation-intro-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 1ère découvrent le sujet suivant : « S'il y a un domaine dans lequel l'Afrique a vite réduit l'écart de son retard par rapport aux autres continents, notamment l'Europe, c'est bien dans celui du football. » Consigne : « Étayez cette assertion d'Alphonse Boolamou de Ligouri. » Ils s'organisent pour analyser ce sujet de production écrite et rechercher les idées permettant d'y répondre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Composition et compréhension du sujet$$,
        'body', $$Le sujet de la production écrite comporte deux parties : l'opinion de l'auteur, donnée dans une phrase affirmative, et la consigne, qui indique la tâche à accomplir (par exemple « étayez », « réfutez », « discutez »). La compréhension du sujet suit deux étapes : l'identification et l'analyse des mots-clés (repérer les mots-clés et déterminer leurs différents sens, pour délimiter le champ de réflexion) ; puis la reformulation de l'opinion de l'auteur, avec ses propres mots.$$,
        'highlights', array[$$sujet = opinion de l'auteur (affirmation) + consigne (tâche à accomplir)$$, $$compréhension : identifier les mots-clés → reformuler l'opinion$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le sujet sur le football africain, explique le sens du mot-clé « réduire l'écart de son retard » et reformule l'opinion de l'auteur.$$, 'solution', $$« Réduire l'écart de son retard » signifie : rattraper, égaler, atteindre, se développer. Reformulation : il s'agit de justifier que l'Afrique a rattrapé l'Occident et connu un développement sur le plan footballistique.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux parties composant un sujet de production écrite ?$$, 'solution', $$L'opinion de l'auteur (une phrase affirmative) et la consigne (la tâche demandée au candidat).$$)
      ),
      jsonb_build_object(
        'heading', $$Rechercher et organiser les idées : varier les domaines$$,
        'body', $$La recherche des idées se fait en variant les domaines pertinents pour le sujet. Pour le sujet sur le football africain, on peut explorer : l'impact des vedettes du football sur le rayonnement de leur pays (exemple : le talent de Didier Drogba a fait connaître la Côte d'Ivoire à travers le monde) ; la valeur marchande et le talent des joueurs (exemple : Samuel Eto'o a été meilleur buteur de championnats européens, au même titre que des stars sud-américaines ou européennes) ; les infrastructures (exemple : l'Afrique a organisé une édition de la Coupe du monde) ; la compétitivité des équipes nationales africaines face aux grandes nations du football.$$,
        'highlights', array[$$varier les domaines de recherche selon le thème : ici, impact des vedettes, valeur marchande, infrastructures, compétitivité$$]::text[],
        'example', jsonb_build_object('statement', $$Formule un argument (avec exemple) sur l'impact des vedettes du football africain, pour le sujet donné.$$, 'solution', $$Les vedettes du football africain sont des catalyseurs du rayonnement de leur pays : elles font connaître leur pays sur l'échiquier mondial et en deviennent de véritables ambassadeurs. Exemple : le talent de Didier Drogba a fait connaître la Côte d'Ivoire à travers le monde.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi est-il utile de varier les domaines de recherche des idées pour un sujet de production écrite ?$$, 'solution', $$Cela permet de couvrir plusieurs angles pertinents du sujet (ici, sportif, économique, infrastructurel) et d'enrichir l'argumentation avec des idées diversifiées et complémentaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Application : réfuter une opinion sur le lecteur$$,
        'body', $$Pour le sujet « Réfutez la pensée de Michel Tournier selon laquelle pour certains écrivains le lecteur n'apparaît nullement comme le destinataire obligé de leur écrit », la démarche est la même. Mots-clés : « livre » (tout document écrit, ouvrage) ; « destinataire obligé » (public cible, catégorie de lecteur visée). Reformulation : il s'agit de montrer que tout livre publié vise en réalité une certaine catégorie de lecteur, un public cible précis.$$,
        'highlights', array[$$« réfuter » = démontrer le contraire de l'opinion citée$$, $$même démarche de compréhension quel que soit le verbe de consigne (étayer, réfuter, discuter)$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie la consigne « réfutez » dans un sujet de production écrite ?$$, 'solution', $$Il s'agit de démontrer, arguments à l'appui, le contraire de l'opinion citée dans le sujet.$$)
      ),
      jsonb_build_object(
        'heading', $$Recherche des idées pour réfuter Michel Tournier$$,
        'body', $$Argument 1 : certains écrits sont destinés essentiellement aux érudits, aux savants (exemple : les thèses universitaires, les revues scientifiques). Argument 2 : il existe des écrits populaires destinés à l'information des masses (exemple : les magazines de mode, les journaux politiques, la presse sportive). Argument 3 : d'autres auteurs destinent leurs productions essentiellement à la jeunesse, avec un style adapté à leur niveau (exemple : Alice au pays des merveilles de Lewis Carroll). Ces trois arguments montrent que chaque type d'écrit vise un public cible précis, ce qui réfute l'idée que le lecteur ne serait jamais un destinataire obligé.$$,
        'highlights', array[$$3 arguments : écrits pour érudits, écrits populaires pour les masses, écrits pour la jeunesse$$, $$chaque exemple illustre un public cible précis visé par l'auteur$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un exemple d'écrit destiné à un public de jeunes lecteurs.$$, 'solution', $$Alice au pays des merveilles de Lewis Carroll.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un nouveau sujet de production écrite est proposé aux élèves : « L'accès généralisé à internet a considérablement transformé les habitudes de lecture des jeunes africains. » Consigne : « Discutez cette assertion en vous appuyant sur des exemples précis. »$$,
      'questions', array[
        $$Identifie l'opinion de l'auteur et la consigne dans ce sujet, puis explique le sens des mots-clés « accès généralisé » et « habitudes de lecture ».$$,
        $$Reformule avec tes propres mots l'opinion de l'auteur.$$,
        $$Propose deux arguments, chacun illustré par un exemple précis, permettant de discuter cette assertion (l'un confirmant l'idée, l'autre la nuançant).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux étapes de la compréhension d'un sujet de production écrite ?$$,
      'hint', $$L'une porte sur le vocabulaire, l'autre sur le sens global.$$,
      'expected', $$L'identification et l'analyse des mots-clés, puis la reformulation de l'opinion de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Cite un exemple utilisé pour illustrer l'argument sur la valeur marchande des joueurs africains.$$,
      'hint', $$Il s'agit d'un footballeur camerounais évoqué dans le cours.$$,
      'expected', $$Samuel Eto'o, qui a été meilleur buteur de championnats européens, au même titre que d'autres grandes stars internationales.$$
    ),
    jsonb_build_object(
      'question', $$Quel type d'écrit illustre l'argument selon lequel certaines productions visent essentiellement les érudits et les savants ?$$,
      'hint', $$C'est un type de document académique.$$,
      'expected', $$Les thèses universitaires et les revues scientifiques.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie « varier les domaines de recherche » lors de la recherche d'idées pour un sujet de production écrite ?$$,
      'hint', $$Cela concerne la diversité des angles d'approche.$$,
      'expected', $$Explorer plusieurs aspects pertinents du sujet (par exemple, pour le football : l'impact des vedettes, la valeur marchande, les infrastructures, la compétitivité) afin d'enrichir et de diversifier l'argumentation.$$
    )
  ),
  now()
);
