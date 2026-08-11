-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3344: "2nde_GEOGRAPHIE_T3_L1: LES GRANDS MILIEUX
-- BIOGEOGRAPHIQUES DANS LE MONDE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3344)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33355, redirecting
-- to pluginfile "2nde G7-Les grands milieux biogeographiques.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 1): the location
-- of the world's three great biogeographical zones (hot/intertropical,
-- temperate, polar), their climates (equatorial, tropical, desert; oceanic,
-- continental, Mediterranean; polar), their soils/vegetation/relief, and how
-- human activity differs across them (extensive vs. intensive agriculture,
-- industrial development). 100% original wording; no sentence copied from
-- the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-geo-grands-milieux-biogeographiques-monde',
  '2nde',
  'A',
  'geographie',
  $$Les grands milieux biogéographiques du monde$$,
  7,
  '2nde-a-hg-geo-espace-ivoirien-environnement-menace',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un documentaire montre des Inuits vivant dans des igloos au pôle Nord, alors qu'au même moment, ailleurs sur le globe, le soleil brille intensément à longueur d'année. Des élèves de seconde s'interrogent : pourquoi une telle diversité de climats selon les régions du monde, et comment les hommes vivent-ils et travaillent-ils différemment dans chacun de ces milieux ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Trois grandes zones biogéographiques à la surface du globe$$,
        'body', $$Un milieu biogéographique est un espace dans lequel la géographie étudie la répartition des êtres vivants à la surface de la Terre. On distingue trois grandes zones à l'échelle mondiale. La zone chaude, ou intertropicale, s'étend entre le tropique du Cancer et le tropique du Capricorne. La zone tempérée occupe l'espace entre les tropiques et les cercles polaires, couvrant l'essentiel des grandes masses continentales de l'hémisphère Nord. La zone polaire, enfin, se situe entre les cercles polaires et les pôles, où l'alternance jour/nuit dure environ six mois chacune.$$,
        'highlights', array[$$zone intertropicale$$, $$zone tempérée$$, $$zone polaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zone$$, $$Localisation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Chaude (intertropicale)$$, $$Entre le tropique du Cancer et le tropique du Capricorne$$),
            jsonb_build_array($$Tempérée$$, $$Entre les tropiques et les cercles polaires$$),
            jsonb_build_array($$Polaire$$, $$Entre les cercles polaires et les pôles$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Entre quelles limites se situe la zone tempérée ?$$, 'solution', $$Entre les tropiques et les cercles polaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Les climats contrastés de la zone chaude$$,
        'body', $$La zone chaude regroupe trois types de climats. Le climat équatorial est chaud et humide toute l'année, avec quatre saisons alternées (deux saisons des pluies et deux saisons sèches) et des précipitations pouvant atteindre 2 000 mm par an. Le climat tropical, un peu moins arrosé (environ 1 000 mm par an), comporte quatre saisons en version humide ou seulement deux (une saison des pluies, une saison sèche) en version sèche. Le climat désertique, enfin, se caractérise par des précipitations très faibles, inférieures à 250 mm par an, pouvant même être nulles pendant plusieurs années consécutives dans des déserts comme le Sahara.$$,
        'highlights', array[$$climat équatorial$$, $$climat tropical$$, $$climat désertique$$]::text[],
        'example', jsonb_build_object('statement', $$Une station météo enregistre environ 1 500 mm de précipitations par an avec des températures élevées toute l'année et des sols ferralitiques : à quel type de climat appartient-elle probablement ?$$, 'solution', $$Au climat chaud (équatorial ou tropical humide), caractéristique de la zone intertropicale forestière.$$),
        'fixation', jsonb_build_object('question', $$Quel type de climat de la zone chaude peut connaître plusieurs années consécutives sans aucune précipitation ?$$, 'solution', $$Le climat désertique.$$)
      ),
      jsonb_build_object(
        'heading', $$Les climats de la zone tempérée et le climat polaire$$,
        'body', $$Dans la zone tempérée, on distingue le climat océanique (façade ouest des continents), aux hivers pluvieux et doux et aux étés frais ; le climat continental (intérieur et façade est des continents), avec des étés chauds et pluvieux mais des hivers rigoureux marqués par le gel ; et le climat méditerranéen, caractérisé par un été très sec de plusieurs mois et un hiver doux entrecoupé de pluies violentes au printemps et à l'automne. La zone polaire, quant à elle, ne connaît qu'un seul climat, le climat polaire, où il fait froid toute l'année.$$,
        'highlights', array[$$climat océanique$$, $$climat méditerranéen$$, $$climat polaire$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la particularité de l'été dans le climat méditerranéen ?$$, 'solution', $$L'été y est très sec, sans pluie, et dure environ trois mois.$$)
      ),
      jsonb_build_object(
        'heading', $$Des sols, une végétation et un relief propres à chaque zone$$,
        'body', $$Chaque zone biogéographique présente des sols et une végétation caractéristiques. Dans la zone chaude, les sols (ferralitiques, ferrugineux) sont riches en fer mais fragiles, sous une végétation de forêt dense (Amazonie, cuvette du Congo) ou de savane. Dans la zone tempérée, les sols podzols portent des forêts de conifères, tandis que les tchernozioms, très fertiles, portent des prairies propices à la culture céréalière. Dans la zone polaire, la végétation est quasiment absente et les sols, comme les sanders sableux ou les sols polygonaux, restent marqués par le gel permanent.$$,
        'highlights', array[$$sols ferralitiques$$, $$tchernoziom$$, $$sols polygonaux$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zone$$, $$Sol dominant$$, $$Végétation associée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Chaude$$, $$Ferralitique, ferrugineux$$, $$Forêt dense ou savane$$),
            jsonb_build_array($$Tempérée$$, $$Podzol, tchernoziom$$, $$Forêt de conifères ou prairie$$),
            jsonb_build_array($$Polaire$$, $$Sanders, sols polygonaux$$, $$Quasiment inexistante$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Sur quel type de sol la culture du blé est-elle particulièrement favorisée dans la zone tempérée ?$$, 'solution', $$Sur le tchernoziom, une terre noire très fertile.$$)
      ),
      jsonb_build_object(
        'heading', $$Des activités humaines adaptées à chaque milieu$$,
        'body', $$L'homme adapte ses activités à chaque grand milieu. En zone chaude, l'agriculture reste souvent extensive et peu mécanisée, associant cultures vivrières (riz, maïs) et cultures d'exportation (café, cacao, hévéa), aux côtés de ressources minières et énergétiques importantes (or, pétrole, gaz). En zone tempérée, l'agriculture est au contraire intensive et fortement mécanisée, avec de grandes exploitations proches de l'industrie (blé, vigne, élevage sélectionné) et un secteur secondaire très développé. En zone polaire, les conditions climatiques extrêmes limitent fortement les activités humaines, qui n'y sont jamais permanentes.$$,
        'highlights', array[$$agriculture extensive$$, $$agriculture intensive$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle différence essentielle distingue l'agriculture pratiquée en zone chaude de celle pratiquée en zone tempérée ?$$, 'solution', $$En zone chaude, l'agriculture est généralement extensive et peu mécanisée, alors qu'en zone tempérée elle est intensive et fortement mécanisée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence, un intervenant affirme que les milieux tempérés regroupent d'importants atouts naturels qui expliquent leur développement, contrairement à la zone chaude qu'il présente comme dépourvue de réelles potentialités. Un camarade conteste cette vision. Un élève de seconde doit se positionner en s'appuyant sur ce qu'il sait des trois grandes zones biogéographiques.$$,
      'questions', array[
        $$Situe les trois grandes zones biogéographiques du monde par rapport aux tropiques et aux cercles polaires.$$,
        $$Distingue le climat équatorial du climat désertique.$$,
        $$Cite un type de sol et une végétation caractéristiques de la zone tempérée.$$,
        $$Explique pourquoi l'agriculture est généralement plus mécanisée en zone tempérée qu'en zone chaude.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Entre quelles limites géographiques se situe la zone chaude ou intertropicale ?$$,
      'hint', $$Ce sont deux lignes de latitude symétriques par rapport à l'équateur.$$,
      'expected', $$Entre le tropique du Cancer et le tropique du Capricorne.$$
    ),
    jsonb_build_object(
      'question', $$Quel climat de la zone tempérée se caractérise par un été très sec et un hiver doux et pluvieux ?$$,
      'hint', $$Il porte le nom d'une mer bordée par l'Europe, l'Afrique et l'Asie.$$,
      'expected', $$Le climat méditerranéen.$$
    ),
    jsonb_build_object(
      'question', $$Quel type de sol fertile, appelé « terre noire », favorise la culture du blé dans la zone tempérée ?$$,
      'hint', $$C'est un mot d'origine russe.$$,
      'expected', $$Le tchernoziom.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi les activités humaines sont-elles peu permanentes dans la zone polaire ?$$,
      'hint', $$Pense aux conditions climatiques de cette zone.$$,
      'expected', $$Parce que les conditions climatiques y sont particulièrement inhospitalières (froid extrême, absence de végétation).$$
    )
  ),
  now()
);
