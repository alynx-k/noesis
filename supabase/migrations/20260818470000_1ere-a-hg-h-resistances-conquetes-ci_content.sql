-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 881: "1ère_HISTOIRE_T2_L2: LES RESISTANCES AUX CONQUETES
-- TERRITORIALES EN AFRIQUE: exemple de la CÔTE D'IVOIRE"
-- (https://lyc.ecole-ci.org/course/view.php?id=881), resource id 4221.
-- Contenu réécrit à partir du PDF source (causes/formes des résistances,
-- étapes de la conquête pacifique puis de la manière forte). Faits, dates
-- et noms réels (Samory Touré, Binger, Clozel, Angoulvant, batailles et
-- dates) repris tels quels ; explications reformulées, non copiées
-- verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-resistances-conquetes-ci',
  '1ere',
  'A',
  'histoire-geographie',
  $$Les résistances aux conquêtes territoriales en Afrique : l'exemple de la Côte d'Ivoire$$,
  12,
  '1ere-a-hg-h-imperialisme-congres-berlin',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite guidée à Kong pour découvrir les mosquées de Samory Touré, des élèves de 1ère A s'interrogent sur la personnalité de Samory et les raisons de ses résistances à la conquête française. Ils décident de mener des recherches pour distinguer les causes et les formes des résistances territoriales, et pour comprendre les étapes de la conquête coloniale en Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes des résistances à la conquête coloniale$$,
        'body', $$Les résistances des peuples ivoiriens s'expliquent par trois types de causes. Politiques d'abord : la conquête bouleverse l'ordre ancien et porte atteinte à la souveraineté des États indigènes (postes de douane, convocations cavalières des leaders). Économiques ensuite : les peuples côtiers comme les Alladian et les Abouré, qui tiraient profit de leur rôle d'intermédiaires commerciaux entre Européens et peuples de l'intérieur, refusent de perdre ces avantages face au contact direct établi par les Français. Religieuses enfin : les peuples islamisés considèrent les Français comme des infidèles venant perturber leurs sociétés.$$,
        'highlights', array[$$politique : atteinte à la souveraineté$$, $$économique : perte du rôle d'intermédiaire (Alladian, Abouré)$$, $$religieuse : peuples islamisés$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les peuples côtiers comme les Alladian et les Abouré s'opposaient-ils à la pénétration française vers l'intérieur du pays ?$$, 'solution', $$Parce qu'ils tiraient d'importants avantages économiques de leur rôle d'intermédiaires commerciaux entre les Européens et les peuples de l'intérieur, un rôle menacé par le contact direct que les Français cherchaient à établir avec l'arrière-pays.$$)
      ),
      jsonb_build_object(
        'heading', $$Les formes de résistance$$,
        'body', $$Les résistances passives se manifestent pacifiquement : en 1885, les Abourés de Yaou ferment le Comoé aux Français ; en 1886, les Ebrié ferment la lagune au commerce européen ; certaines populations choisissent aussi la migration ou la fuite. Les résistances violentes, elles, éclatent dès la période d'exploration : attaques des postes de douane de Lahou et Jacqueville (1890), attaque du fort de Dabou par les Adjoukrou et Bouboury (1891). De 1893 à 1898, Samory Touré mène une guerre permanente contre les Français, utilisant la technique de la terre brûlée, avant d'être capturé à Guélémou et déporté au Gabon. Chez les Akan, les Baoulés attaquent convois et colonnes militaires (1894-1899), tandis que le royaume N'Denyé se soulève en 1898 (son roi Kassi Dihyé est arrêté et déporté). En zone forestière, des chefs comme Zokou Gbéli (Daloa) mènent des résistances par guérilla jusqu'en 1910.$$,
        'highlights', array[$$passive : fermeture de cours d'eau, migration$$, $$violente : Samory Touré (terre brûlée, 1893-1898)$$, $$Baoulé, N'Denyé, guérilla forestière$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle technique Samory Touré a-t-il employée dans sa guerre contre les Français ?$$, 'solution', $$La technique de la terre brûlée, qui consiste à détruire tout sur son passage afin d'affamer l'ennemi.$$)
      ),
      jsonb_build_object(
        'heading', $$La conquête pacifique (1893-1908)$$,
        'body', $$Préconisée par le gouverneur Louis Gustave Binger et appliquée par le gouverneur Clozel, cette politique privilégie la collaboration avec les populations et l'administration civile plutôt que la force. Elle s'appuie sur trois formes : économique (création de comptoirs à Assinie, Grand-Bassam et Dabou, 1843-1875), politique (missions d'exploration signant des traités d'amitié, comme les missions Treich-Laplène, Binger — qui met Kong sous protectorat français — et Bidaud) et diplomatique (la convention du 26 juin 1891 fixe les frontières avec les possessions britanniques ; la colonie de Côte d'Ivoire est créée le 10 mars 1893). Cette politique échoue cependant : l'occupation française reste limitée au Nord (ancien domaine de Samory), au littoral sud-est et à la frontière orientale, laissant le Centre et l'Ouest hors de contrôle.$$,
        'highlights', array[$$Binger (préconise) → Clozel (applique)$$, $$comptoirs, missions, convention (26/06/1891)$$, $$colonie créée le 10 mars 1893$$]::text[],
        'property', jsonb_build_object('label', $$Repère$$, 'text', $$Les premiers contacts entre la France et la Côte d'Ivoire remontent à Assinie en 1687, mais l'implantation véritable ne débute qu'en 1843.$$),
        'fixation', jsonb_build_object('question', $$Quelle date marque la création officielle de la colonie de Côte d'Ivoire ?$$, 'solution', $$Le 10 mars 1893.$$)
      ),
      jsonb_build_object(
        'heading', $$La conquête par la manière forte (1908-1920)$$,
        'body', $$Face à l'échec de la pénétration pacifique, le gouverneur Louis Gabriel Angoulvant applique une méthode forte : augmentation massive des effectifs (2001 militaires, 1300 miliciens et 1247 gardes de police en 1910, contre 840 militaires sous Clozel), aggravation des sanctions (internement, déportation de chefs), et installation de cercles militaires dans les régions insoumises (Bouna, Guiglo-Toulepleu, Dimbokro, Man). Cette politique permet la conquête totale de la Côte d'Ivoire en 1920.$$,
        'highlights', array[$$Angoulvant : effectifs multipliés par 2,5$$, $$cercles militaires dans les régions insoumises$$, $$conquête totale achevée en 1920$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment la « manière forte » d'Angoulvant se distingue-t-elle de la « pénétration pacifique » de Clozel ?$$, 'solution', $$Elle recourt massivement à la force : augmentation considérable des effectifs militaires, sanctions aggravées contre les populations, et installation de cercles militaires dans les régions qui résistent encore, plutôt que de miser sur la collaboration.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'un débat télévisé, un historien affirme : « Les résistances à la conquête territoriale ont, en général, été émaillées de violences. De vaillants hommes se sont farouchement opposés à la pénétration française. [...] Malgré toutes les tentatives de résistance orchestrées par ces derniers sur l'ensemble du territoire, c'est par la brutalité que le gouverneur Gabriel Angoulvant, contrairement à son prédécesseur, réussit à soumettre les populations et pacifier la colonie ivoirienne. »$$,
      'questions', array[
        $$Dis de quoi il s'agit dans cette situation.$$,
        $$Explique le passage : « c'est par la brutalité que le gouverneur Gabriel Angoulvant, contrairement à son prédécesseur, réussit à soumettre les populations et pacifier la colonie ivoirienne. »$$,
        $$Es-tu d'avis avec cet historien lorsqu'il affirme que « les résistances à la conquête territoriale ont, en général, été émaillées de violences » ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Où et par qui Samory Touré a-t-il été capturé, avant sa déportation ?$$,
      'hint', $$C'est près de Biankouman.$$,
      'expected', $$Il a été capturé à Guélémou par les Français, après un dur combat à Doué, au nord de Biankouman.$$
    ),
    jsonb_build_object(
      'question', $$Quel gouverneur a préconisé la politique de « pénétration pacifique » ?$$,
      'hint', $$Il a aussi signé le traité mettant Kong sous protectorat français.$$,
      'expected', $$Louis Gustave Binger.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année la Côte d'Ivoire est-elle totalement conquise par les Français ?$$,
      'hint', $$C'est la fin de la politique de la manière forte.$$,
      'expected', $$En 1920.$$
    ),
    jsonb_build_object(
      'question', $$Quel gouverneur a appliqué la politique de la « manière forte » à partir de 1908 ?$$,
      'hint', $$Il a considérablement augmenté les effectifs militaires.$$,
      'expected', $$Louis Gabriel Angoulvant.$$
    )
  ),
  now()
);
