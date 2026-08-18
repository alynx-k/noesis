-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 1995: "1ère_GEOGRAPHIE_T4_L1: LES FACTEURS DE LA
-- MONDIALISATION" (https://lyc.ecole-ci.org/course/view.php?id=1995),
-- resource id 17402. Contenu réécrit à partir du PDF source (historique,
-- caractères, facteurs de la mondialisation : colonisation, innovations
-- technologiques, libéralisation des échanges). Faits et dates réels
-- (GATT 1947, cycles de négociation, création de l'OMC en 1994) repris
-- tels quels ; explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-facteurs-mondialisation',
  '1ere',
  'A',
  'histoire-geographie',
  $$Les facteurs de la mondialisation$$,
  7,
  '1ere-a-hg-geo-amenagement-territoire-ivoirien',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En regardant le journal télévisé de 20H, des élèves de 1ère A entendent le directeur général de l'OMC affirmer : « Avec la mondialisation de l'économie, la terre est devenue un village planétaire où les échanges sont de plus en plus aisés. » Intrigués, ils décident de mener des recherches pour connaître le contenu de ce concept et comprendre ses principaux facteurs.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la mondialisation ?$$,
        'body', $$La mondialisation (ou globalisation) est le processus par lequel s'établit une interdépendance économique croissante entre les différentes régions du monde, à travers les courants d'échanges et les flux financiers. Au-delà de l'économie, elle comporte aussi des dimensions culturelles, politiques et environnementales. Sa caractéristique essentielle est la répercussion immédiate, partout dans le monde, des décisions ou événements survenant dans une région donnée : un paysan africain subit ainsi, depuis sa campagne, les effets des fluctuations du cours du café sur les marchés boursiers européens.$$,
        'highlights', array[$$interdépendance économique mondiale$$, $$répercussion immédiate des événements locaux$$]::text[],
        'fixation', jsonb_build_object('question', $$Donne un exemple illustrant la répercussion immédiate des événements dans une économie mondialisée.$$, 'solution', $$Un paysan africain subit, depuis sa campagne, les effets des fluctuations du cours du café sur les marchés boursiers européens.$$)
      ),
      jsonb_build_object(
        'heading', $$Un processus historique de longue durée$$,
        'body', $$L'internationalisation des économies est constitutive de la société capitaliste depuis le XVIe siècle. Dès le XVIIIe siècle, l'industrialisation permet déjà une production et une exportation massives. Le processus s'accentue en 1947 avec les accords du GATT, puis explose véritablement dans les années 1980 grâce au développement des moyens de communication. Depuis le début des années 1990, la concurrence internationale s'étend aux services financiers, aux transports, à l'audiovisuel et aux télécommunications, portée par l'affirmation des pays émergents et l'internationalisation croissante des entreprises.$$,
        'highlights', array[$$origine : capitalisme, XVIe siècle$$, $$1947 : accords du GATT$$, $$années 1980 : explosion des échanges$$]::text[],
        'fixation', jsonb_build_object('question', $$À partir de quelle décennie la mondialisation s'est-elle « particulièrement manifestée », selon le cours ?$$, 'solution', $$Les années 1980, avec une véritable explosion des échanges due au développement des moyens de communication.$$)
      ),
      jsonb_build_object(
        'heading', $$La colonisation, un facteur historique de la mondialisation$$,
        'body', $$Malgré ses conséquences négatives sur les États colonisés, la colonisation a eu des effets qui ont favorisé la mondialisation : mise en place de structures administratives et de moyens de communication (routes, ports, aéroports, chemins de fer) dans les territoires d'Afrique, d'Asie et d'Amérique, et création de filiales d'entreprises européennes (comme UNILEVER ou la SCOA, Société Commerciale Ouest Africaine). En mettant en contact toutes les parties du monde, la colonisation a créé les premiers éléments des échanges commerciaux entre continents.$$,
        'highlights', array[$$structures administratives + moyens de communication$$, $$filiales d'entreprises européennes (UNILEVER, SCOA)$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un aspect positif de la colonisation qui a favorisé la mondialisation.$$, 'solution', $$La mise en place de moyens de communication (routes, ports, chemins de fer) ou la création de filiales d'entreprises européennes dans les territoires colonisés.$$)
      ),
      jsonb_build_object(
        'heading', $$Les innovations technologiques$$,
        'body', $$Après la Seconde Guerre mondiale, de multiples découvertes favorisent une révolution des transports (vitesse, confort, sécurité, oléoducs, gazoducs, augmentation de la capacité des véhicules), avec l'avion et le TGV comme outils majeurs des échanges. Parallèlement, la révolution informatique (ordinateurs, fax, satellites) relie en permanence décideurs, ingénieurs et entrepreneurs du monde entier. Ensemble, ces progrès techniques et technologiques provoquent une remarquable réduction de l'espace terrestre.$$,
        'highlights', array[$$révolution des transports : avion, TGV$$, $$révolution informatique : ordinateurs, satellites$$, $$réduction de l'espace terrestre$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel effet global les progrès techniques et technologiques ont-ils eu sur l'espace terrestre ?$$, 'solution', $$Une remarquable réduction de l'espace terrestre (le monde semble « rétrécir » grâce à la rapidité des transports et des communications).$$)
      ),
      jsonb_build_object(
        'heading', $$La libéralisation des échanges$$,
        'body', $$Face à la spécialisation croissante des productions nationales, les États se concertent pour organiser le libre-échange : création du GATT (General Agreement on Tariffs and Trade) en 1947, visant la réduction progressive des barrières douanières. De grandes négociations se succèdent : le Kennedy Round (1964-1967), le Tokyo Round (1973-1979) et l'Uruguay Round (1986-1994), chacune réduisant les droits de douane d'environ 30%. En 1994, le GATT laisse place à l'Organisation Mondiale du Commerce (OMC), avec les mêmes objectifs.$$,
        'highlights', array[$$GATT (1947) → OMC (1994)$$, $$Kennedy Round, Tokyo Round, Uruguay Round$$, $$≈30% de réduction douanière par cycle$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Libre-échange : absence de barrières à l'entrée des produits sur les marchés étrangers. Multinationale (ou firme internationale) : entreprise possédant des filiales dans plusieurs pays.$$),
        'fixation', jsonb_build_object('question', $$Quelle organisation a remplacé le GATT en 1994 ?$$, 'solution', $$L'Organisation Mondiale du Commerce (OMC).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un leader de la société civile déclare : « La mondialisation, que certains définissent comme un phénomène d'intensification des échanges internationaux, ne date pas d'aujourd'hui, mais elle est entrée dans une nouvelle étape. Depuis plusieurs décennies, la mondialisation est en partie façonnée par les décisions prises de manière collective par les États. Ces décisions sont souvent prises au sein d'organisations internationales. »$$,
      'questions', array[
        $$Dégage le problème posé dans cette situation.$$,
        $$Explique la phrase : « La mondialisation ne date pas d'aujourd'hui mais elle est entrée dans une nouvelle étape. »$$,
        $$Commente le passage : « Ces décisions sont souvent prises au sein d'organisations internationales. »$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$En quelle année les accords du GATT ont-ils été signés ?$$,
      'hint', $$C'est juste après la Seconde Guerre mondiale.$$,
      'expected', $$En 1947.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux exemples d'entreprises européennes ayant créé des filiales dans les colonies, selon le cours.$$,
      'hint', $$L'une est un géant agroalimentaire, l'autre une société commerciale ouest-africaine.$$,
      'expected', $$UNILEVER et la SCOA (Société Commerciale Ouest Africaine).$$
    ),
    jsonb_build_object(
      'question', $$Quel moyen de transport est cité comme un outil important de la mondialisation grâce à l'amélioration de son rayon d'action et de sa vitesse ?$$,
      'hint', $$Il vole.$$,
      'expected', $$L'avion.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie l'expression « libre-échange » ?$$,
      'hint', $$C'est lié à l'absence de contraintes commerciales entre pays.$$,
      'expected', $$L'absence de barrières à l'entrée des produits sur les marchés étrangers.$$
    )
  ),
  now()
);
