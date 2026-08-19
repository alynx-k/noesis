-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 947: "1ère G4- L'urbanisation dans les pays développés
-- exemple de la France" (https://lyc.ecole-ci.org/course/view.php?id=947),
-- resource id 5001. Contenu réécrit à partir du PDF source (phases
-- historiques de l'urbanisation française, macrocéphalie parisienne,
-- aires urbaines, problèmes et politiques de la ville). Chiffres et
-- statistiques réels (INSEE, taux d'urbanisation) repris tels quels ;
-- explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-urbanisation-pays-developpes-france',
  '1ere',
  'C',
  'histoire-geographie',
  $$L'urbanisation dans les pays développés : l'exemple de la France$$,
  4,
  '1ere-c-hg-geo-urbanisation-pays-developpement-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des urbanistes de la délégation ivoirienne ayant assisté à une conférence à Paris sur les changements climatiques entretiennent votre classe de 1ère sur l'urbanisation en France. Ils vous parlent de la Tour Eiffel, des larges avenues et boulevards, des rues bitumées dans les villes de Paris et de Rouen qu'ils ont visitées. Émerveillés, vous décidez de mener des investigations pour décrire les caractéristiques de l'urbanisation française, expliquer son processus, analyser ses problèmes urbains et apprécier les stratégies adoptées pour les résoudre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le processus d'urbanisation en France$$,
        'body', $$L'urbanisation française connaît trois grandes phases. De l'Antiquité à l'après-guerre : les premières villes marchandes (Marseille, Lyon, Paris) datent de l'époque gallo-romaine, suivies au Moyen Âge d'une deuxième vague (Troyes, Metz), puis de villes portuaires aux temps modernes (Toulon, Le Havre) ; c'est la révolution industrielle du XIXe siècle qui accélère véritablement le phénomène (50% de la population urbaine dès 1930). De l'après-guerre aux Trente Glorieuses (jusqu'en 1975) : le nombre de citadins explose sous l'effet du baby-boom, de la croissance économique et des migrations. De 1975 à aujourd'hui : la France entre dans une phase de transition urbaine, l'exode rural ralentit, et l'on assiste au développement du périurbain (des communes rurales en périphérie des grandes villes qui accueillent des habitants travaillant en ville).$$,
        'highlights', array[$$3 phases : Antiquité→après-guerre (villes marchandes puis industrielles), Trente Glorieuses (explosion urbaine), 1975-aujourd'hui (transition + périurbain)$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on le « périurbain » dans le contexte de l'urbanisation française récente ?$$, 'solution', $$Les communes rurales situées en périphérie des grandes agglomérations, qui accueillent des habitants ayant quitté le centre-ville ou la banlieue mais continuant à y travailler.$$)
      ),
      jsonb_build_object(
        'heading', $$La macrocéphalie parisienne et la dissymétrie Est/Ouest$$,
        'body', $$La caractéristique majeure du réseau urbain français est la taille exceptionnelle de Paris : une mégalopole de 105,40 km² comptant 2 141 000 habitants intra-muros et une aire urbaine de plus de 12,4 millions d'habitants, soit près du sixième de la population française. Cette suprématie parisienne, qualifiée de macrocéphalie urbaine, écrase les autres grandes villes (Lyon, Marseille, Lille, Bordeaux, Toulouse). Le réseau urbain présente aussi une dissymétrie Est/Ouest : sur 116 villes de plus de 50 000 habitants, 76 se trouvent à l'Est, hérité de l'industrialisation du XIXe siècle qui a beaucoup plus touché cette partie du territoire.$$,
        'highlights', array[$$macrocéphalie parisienne : Paris (aire urbaine >12,4M hab.) = ~1/6 de la population française$$, $$dissymétrie Est/Ouest : héritage de l'industrialisation du 19e siècle$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la partie Est de la France est-elle globalement plus urbanisée que la partie Ouest ?$$, 'solution', $$Parce que c'est la partie Est du territoire qui a été touchée par l'industrialisation du XIXe siècle, à l'origine de la croissance urbaine de cette région, alors que l'Ouest, resté à l'écart de la révolution industrielle, s'est beaucoup moins urbanisé.$$),
        'fixation', jsonb_build_object('question', $$Que signifie l'expression « macrocéphalie urbaine » appliquée à Paris ?$$, 'solution', $$Une suprématie démesurée de la capitale sur l'ensemble du réseau urbain national, aucune autre ville ne pouvant rivaliser avec elle en taille ou en influence.$$)
      ),
      jsonb_build_object(
        'heading', $$Les types d'aires urbaines$$,
        'body', $$Une aire urbaine est un ensemble continu formé d'un pôle urbain (unité offrant plus de 5 000 emplois) et de sa couronne périurbaine (communes dont 40% de la population active travaille dans une autre commune de l'aire urbaine). Parmi les 354 aires urbaines françaises, on distingue les 12 aires métropolitaines (au moins 500 000 habitants et 20 000 cadres de fonctions métropolitaines) et 29 autres aires de plus de 200 000 habitants. Les communes multi-polarisées, elles, envoient leur population active vers plusieurs aires urbaines sans qu'aucune ne dépasse 40%.$$,
        'highlights', array[$$aire urbaine = pôle urbain (≥5 000 emplois) + couronne périurbaine$$, $$12 aires métropolitaines (≥500 000 hab.) parmi 354 aires urbaines$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue une aire métropolitaine des autres aires urbaines ?$$, 'solution', $$Elle compte au moins 500 000 habitants et concentre au moins 20 000 cadres des fonctions métropolitaines.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes urbains et politiques de la ville$$,
        'body', $$L'urbanisation française génère des disparités entre villes (surpopulation parisienne, inégalités sociales), des problèmes socio-économiques (pénurie de logements, chômage, congestion routière, vieillissement, criminalité) et une pollution urbaine croissante (particules fines liées au trafic routier et au chauffage). Face à cela, l'État a mis en place des « politiques de la ville » depuis la fin des années 1970 : classement de quartiers en Zones urbaines sensibles (ZUS), création de « zones franches » avec aides à l'emploi, création de l'Agence nationale pour la rénovation urbaine (ANRU). Les solutions sociales portent sur la priorité à l'emploi et l'accès de tous au logement, à la santé, à l'éducation et à la culture ; les solutions environnementales passent par la réglementation du chauffage et du trafic routier et la lutte contre le réchauffement climatique.$$,
        'highlights', array[$$problèmes : disparités urbaines, chômage, pollution (particules fines)$$, $$politiques de la ville : ZUS, zones franches, ANRU$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux mesures des « politiques de la ville » françaises destinées aux quartiers en difficulté.$$, 'solution', $$Deux parmi : le classement en Zones urbaines sensibles (ZUS), la création de zones franches avec aides à l'emploi, la création de l'ANRU pour la rénovation urbaine.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux axes majeurs des solutions aux problèmes sociaux urbains en France ?$$, 'solution', $$La priorité à l'emploi et l'accès de chacun aux droits au logement, à la santé, à l'éducation et à la culture.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un urbaniste français affirme : « L'exode rural a provoqué une concentration de plus en plus grande de la population dans des grands centres urbains, entraînant la transformation progressive des cités en mégalopoles. Les grandes villes sont devenues de vastes agglomérations dont les limites avec le monde rural sont mal définies. Certes la ville concentre encore en elle culture, divertissement, pouvoir, et représente un pôle d'attraction, mais c'est aussi un environnement où les conditions de vie deviennent de plus en plus difficiles. »$$,
      'questions', array[
        $$Quel problème pose cet urbaniste français ?$$,
        $$Explique le passage : « Certes la ville concentre encore en elle culture, divertissement, pouvoir, et représente un pôle d'attraction, mais c'est aussi un environnement où les conditions de vie deviennent de plus en plus difficiles. »$$,
        $$Que penses-tu de l'affirmation selon laquelle « l'exode rural a provoqué une concentration de plus en plus grande de la population dans des grands centres urbains » ? Justifie ta réponse à partir du processus d'urbanisation étudié dans la leçon.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel événement historique a véritablement accéléré l'urbanisation en France ?$$,
      'hint', $$C'est un phénomène économique du 19e siècle.$$,
      'expected', $$La révolution industrielle, en particulier à partir de sa deuxième vague vers 1850.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la population de l'aire urbaine de Paris et quelle proportion de la population française cela représente-t-il ?$$,
      'hint', $$C'est un chiffre proche de 12,5 millions.$$,
      'expected', $$Plus de 12,4 millions d'habitants, soit environ un sixième de la population française.$$
    ),
    jsonb_build_object(
      'question', $$Que désigne le « pôle urbain » dans la définition d'une aire urbaine française ?$$,
      'hint', $$C'est un critère lié à l'emploi.$$,
      'expected', $$Une unité urbaine offrant plus de 5 000 emplois.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie le sigle ANRU et quel est son rôle ?$$,
      'hint', $$C'est une agence créée pour agir sur les quartiers en difficulté.$$,
      'expected', $$L'Agence nationale pour la rénovation urbaine, chargée d'améliorer les équipements et de construire des logements dans certaines Zones urbaines sensibles.$$
    )
  ),
  now()
);
