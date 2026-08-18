-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 1999: "1ère_GEOGRAPHIE_T2_L_1: L'URBANISATION DANS LES
-- PAYS EN DEVELOPPEMENT: exemple de la Côte d'Ivoire"
-- (https://lyc.ecole-ci.org/course/view.php?id=1999), resource id 17450.
-- Contenu réécrit à partir du PDF source (phases historiques de
-- l'urbanisation ivoirienne, caractères, place d'Abidjan, problèmes et
-- gestion urbaine durable). Chiffres et faits réels (INS, RGPH ; taux
-- d'urbanisation) repris tels quels ; explications reformulées, non
-- copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-urbanisation-pays-developpement-ci',
  '1ere',
  'A',
  'histoire-geographie',
  $$L'urbanisation dans les pays en développement : l'exemple de la Côte d'Ivoire$$,
  3,
  '1ere-a-hg-geo-croissance-demographique-mondiale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au journal télévisé, le ministre ivoirien de la ville déclare : « La crise que connaît notre cité aujourd'hui résulte d'une urbanisation accélérée et incontrôlée. Nous devons unir nos efforts pour une urbanisation durable dans notre pays. » Des élèves de 1ère A décident de mener des recherches pour décrire le processus d'urbanisation en Côte d'Ivoire, montrer la place d'Abidjan, et proposer des solutions aux problèmes urbains.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le processus d'urbanisation en Côte d'Ivoire$$,
        'body', $$L'urbanisation ivoirienne s'est déroulée en trois phases. Pendant la période précoloniale (XVIe-XVIIIe siècle), des cités marchandes (Kong, Odienné, Bondoukou, Séguéla, Bouna) se sont développées le long des routes commerciales reliant le Soudan occidental au sud forestier. Pendant la période coloniale, les colons créent des villes côtières pour le commerce (Assinie, Grand-Bassam, Bingerville) et des postes militaires à l'intérieur (Tiassalé, Dimbokro). C'est la période postcoloniale (après 1960) qui voit la véritable explosion urbaine. Une ville, en Côte d'Ivoire, se définit par une population ≥4000 habitants, une prédominance des activités du secteur secondaire, et un statut de sous-préfecture ou de commune.$$,
        'highlights', array[$$précoloniale : cités marchandes$$, $$coloniale : villes côtières + postes militaires$$, $$postcoloniale : explosion urbaine (après 1960)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois critères qui définissent une ville en Côte d'Ivoire ?$$, 'solution', $$Une population d'au moins 4000 habitants, une prédominance des activités du secteur secondaire, et un statut de sous-préfecture ou de commune.$$)
      ),
      jsonb_build_object(
        'heading', $$Les caractères de l'urbanisation ivoirienne$$,
        'body', $$L'urbanisation ivoirienne est récente : les véritables villes se sont formées après l'indépendance de 1960. Elle est aussi accélérée : le taux d'urbanisation est passé de 4% en 1961 à 55% en 2000, la population urbaine représentant aujourd'hui 54,2% de la population totale — cette accélération tient à la croissance démographique (exode rural, immigration), aux facteurs économiques (voies de communication, usines) et politiques (communalisation). Enfin, elle reste inégalement répartie : la zone forestière est bien plus urbanisée (83,7%) que la zone de savane (31,5%), les grandes villes se concentrant au sud (Abidjan, San Pedro, Daloa, Yamoussoukro) tandis que le nord n'a que quelques villes isolées (Korhogo, Odienné, Bondoukou).$$,
        'highlights', array[$$récente : depuis 1960$$, $$taux d'urbanisation : 4% (1961) → 55% (2000)$$, $$déséquilibre : forêt 83,7% vs savane 31,5%$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux facteurs qui expliquent l'accélération de l'urbanisation en Côte d'Ivoire après 1960.$$, 'solution', $$La croissance démographique (exode rural, immigration) et les facteurs économiques (création de voies de communication, installation d'usines) — également valable : les facteurs politiques comme la communalisation.$$)
      ),
      jsonb_build_object(
        'heading', $$Abidjan, une ville géante et multifonctionnelle$$,
        'body', $$Abidjan, avec environ 6 millions d'habitants, est la ville la plus peuplée de la sous-région après Lagos, et une mégalopole cinq fois plus grande que Paris (district de 2119 km², 10 communes urbaines). C'est une ville de commandement (macrocéphalie urbaine) : elle concentre les institutions politiques (présidence, ministères), économiques (BCEAO, port autonome) et culturelles (universités, grandes écoles), exerçant une influence sur toutes les villes de l'intérieur. Grâce à son aéroport international, son chemin de fer et son réseau routier, elle sert aussi de ville relais pour les pays enclavés de la sous-région.$$,
        'highlights', array[$$~6 millions d'habitants$$, $$macrocéphalie urbaine$$, $$ville relais pour la sous-région$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie l'expression « macrocéphalie urbaine » appliquée à Abidjan ?$$, 'solution', $$Le fait qu'Abidjan concentre l'essentiel des fonctions politiques, économiques et culturelles du pays, exerçant une influence dominante sur toutes les autres villes qui dépendent d'elle.$$)
      ),
      jsonb_build_object(
        'heading', $$Les problèmes urbains et la gestion durable$$,
        'body', $$La croissance urbaine non maîtrisée entraîne des problèmes multiples : échec de la planification, crise des services de base (transport, eau, électricité, santé, éducation), paupérisation (quartiers précaires, spéculation foncière, chômage) et pathologies sociales (délinquance, insécurité). Pour y remédier, une gestion urbaine durable s'appuie sur la gouvernance participative (autorités publiques, secteur privé, société civile), la transparence, et un financement renforcé via le transfert de compétences aux collectivités territoriales et le civisme fiscal.$$,
        'highlights', array[$$crise des services urbains de base$$, $$gouvernance participative$$, $$financement : transfert de compétences + civisme fiscal$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois types d'acteurs impliqués dans la gouvernance urbaine participative ?$$, 'solution', $$Les autorités publiques, le secteur privé et la société civile.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le ministre ivoirien de la ville déclare au journal télévisé : « La crise que connaissent les villes ivoiriennes aujourd'hui résulte d'une urbanisation accélérée et incontrôlée. Nous devons unir nos efforts pour une urbanisation durable dans notre pays. »$$,
      'questions', array[
        $$Explique le passage : « La crise que connaissent les villes ivoiriennes aujourd'hui résulte d'une urbanisation accélérée et incontrôlée. »$$,
        $$Cite deux problèmes urbains en Côte d'Ivoire, et deux mesures pour une gestion urbaine durable.$$,
        $$Commente la proposition du ministre : « Nous devons unir nos efforts pour une urbanisation durable dans notre pays. »$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois phases de l'urbanisation ivoirienne ?$$,
      'hint', $$Elles correspondent à des périodes historiques distinctes.$$,
      'expected', $$La phase précoloniale, la phase coloniale, et la phase postcoloniale (après l'indépendance).$$
    ),
    jsonb_build_object(
      'question', $$De combien de communes urbaines et de sous-préfectures est composé le district d'Abidjan ?$$,
      'hint', $$Le cours cite un chiffre précis pour chacun.$$,
      'expected', $$10 communes urbaines et 3 nouvelles sous-préfectures (Bingerville, Anyama, Songon).$$
    ),
    jsonb_build_object(
      'question', $$La zone forestière ou la zone de savane est-elle la plus urbanisée en Côte d'Ivoire ?$$,
      'hint', $$Compare les deux taux cités dans le cours.$$,
      'expected', $$La zone forestière (83,7% contre 31,5% pour la savane).$$
    ),
    jsonb_build_object(
      'question', $$Cite un exemple de problème lié à la « crise généralisée des services urbains de base ».$$,
      'hint', $$Pense à l'eau, l'électricité, la santé...$$,
      'expected', $$Par exemple le faible accès à l'eau potable ou à l'électricité (également valables : insuffisance des transports, des écoles, des services de santé).$$
    )
  ),
  now()
);
