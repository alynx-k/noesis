-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 944: "1ère G7- Les facteurs de la mondialisation"
-- (https://lyc.ecole-ci.org/course/view.php?id=944), resource id 4965.
-- Contenu réécrit à partir du PDF source (historique, facteurs de la
-- mondialisation : colonisation, innovations technologiques,
-- libéralisation des échanges). Dates et sigles réels (GATT 1947, cycles
-- de négociation, création de l'OMC en 1994) repris tels quels (données
-- factuelles) ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-facteurs-mondialisation',
  '1ere',
  'C',
  'histoire-geographie',
  $$Les facteurs de la mondialisation$$,
  7,
  '1ere-c-hg-geo-amenagement-territoire-ivoirien',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En attendant l'heure de la diffusion de votre feuilleton préféré, tes camarades de classe et toi suivez le journal télévisé de 20h. Vous entendez le directeur général de l'OMC affirmer : « Avec la mondialisation de l'économie, la terre est devenue un village planétaire où les échanges sont de plus en plus aisés… » Pour satisfaire votre curiosité intellectuelle, vous décidez de mener des recherches pour connaître le contenu de ce concept en vogue et comprendre ses principaux facteurs et mécanismes de fonctionnement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et historique de la mondialisation$$,
        'body', $$La mondialisation, ou globalisation, est un processus par lequel s'établit une interdépendance économique entre les différentes régions du monde, au moyen des courants d'échanges et des flux financiers ; elle comporte aussi des dimensions culturelles, politiques et environnementales. L'internationalisation des économies est constitutive de la société capitaliste depuis le XVIe siècle, et s'accentue au XVIIIe siècle avec l'industrialisation. Ce processus s'accélère à partir de 1947 avec les accords du GATT, puis explose dans les années 1980 grâce au développement des moyens de communication, avant de s'étendre dans les années 1990 aux services financiers, aux transports, à l'audiovisuel et aux télécommunications.$$,
        'highlights', array[$$mondialisation = interdépendance économique croissante des régions du monde$$, $$capitalisme (16e s.) → industrialisation (18e s.) → GATT (1947) → explosion (années 1980)$$]::text[],
        'fixation', jsonb_build_object('question', $$Depuis quel siècle l'internationalisation des économies est-elle constitutive de la société capitaliste ?$$, 'solution', $$Depuis le XVIe siècle.$$)
      ),
      jsonb_build_object(
        'heading', $$La colonisation, premier facteur de la mondialisation$$,
        'body', $$Malgré ses conséquences négatives sur les États colonisés, la colonisation a eu des effets qui ont favorisé la mondialisation : mise en place de structures administratives et de moyens de communication (routes, ports, aéroports, chemins de fer) dans les territoires colonisés d'Afrique, d'Asie et d'Amérique, et création de filiales ou comptoirs d'entreprises européennes (par exemple Unilever, la Société Commerciale Ouest Africaine - SCOA). Depuis la découverte du reste du monde par l'Europe, la colonisation a mis en contact toutes les parties du monde, créant les premiers éléments d'échanges commerciaux entre continents.$$,
        'highlights', array[$$colonisation : structures administratives + infrastructures de transport + filiales d'entreprises$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi la construction de ports et de chemins de fer pendant la colonisation a-t-elle favorisé la mondialisation ?$$, 'solution', $$Ces infrastructures ont facilité le transport des marchandises entre les colonies et les métropoles, posant les bases matérielles des échanges commerciaux internationaux qui se sont ensuite intensifiés.$$),
        'fixation', jsonb_build_object('question', $$Cite un exemple d'entreprise européenne ayant créé des filiales ou comptoirs dans les colonies.$$, 'solution', $$Unilever ou la SCOA (Société Commerciale Ouest Africaine).$$)
      ),
      jsonb_build_object(
        'heading', $$Les innovations technologiques$$,
        'body', $$Après la Seconde Guerre mondiale, de multiples découvertes technologiques favorisent la révolution des transports : vitesse, confort, sécurité, spécialisation (oléoducs, gazoducs), augmentation de la capacité des véhicules. L'avion devient un outil majeur des échanges de personnes et de marchandises ; sur terre, les trains à grande vitesse (TGV) illustrent cette recherche de rapidité. Parallèlement, la révolution informatique (ordinateurs, fax, satellites) relie entre eux, partout dans le monde, décideurs, ingénieurs et entrepreneurs. L'ensemble de ces progrès a pour conséquence une remarquable réduction de l'espace terrestre.$$,
        'highlights', array[$$révolution des transports (avion, TGV) + révolution informatique (satellites, télécommunications) → réduction de l'espace terrestre$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est l'effet global des innovations technologiques (transports + informatique) sur les échanges mondiaux ?$$, 'solution', $$Elles réduisent considérablement l'espace terrestre, en accélérant et en facilitant les échanges de personnes, de marchandises et d'informations à l'échelle mondiale.$$)
      ),
      jsonb_build_object(
        'heading', $$La libéralisation des échanges$$,
        'body', $$Chaque pays se spécialisant de plus en plus dans certaines productions, les États se sont concertés pour instaurer le libre-échange : le GATT (General Agreement on Tariffs and Trade), signé en 1947, vise la réduction progressive des barrières douanières et l'élimination des restrictions aux échanges. De grandes négociations multinationales se succèdent : le Kennedy Round (1964-1967), le Tokyo Round (1973-1979) et l'Uruguay Round (1986-1994), chacune permettant des réductions douanières de l'ordre de 30%. En 1994, le GATT laisse place à l'Organisation Mondiale du Commerce (OMC), avec les mêmes objectifs.$$,
        'highlights', array[$$GATT (1947) → OMC (1994) : réduction des barrières douanières$$, $$Kennedy Round, Tokyo Round, Uruguay Round : ~30% de réduction douanière à chaque cycle$$]::text[],
        'example', jsonb_build_object('statement', $$Que signifie le sigle GATT et par quelle organisation a-t-il été remplacé en 1994 ?$$, 'solution', $$GATT signifie « General Agreement on Tariffs and Trade » (accord général sur les tarifs douaniers et le commerce) ; il a été remplacé en 1994 par l'Organisation Mondiale du Commerce (OMC), qui poursuit les mêmes objectifs.$$),
        'fixation', jsonb_build_object('question', $$Quel était l'objectif principal du GATT ?$$, 'solution', $$La réduction progressive des barrières douanières et l'élimination des restrictions aux échanges internationaux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un leader de la société civile déclare, à propos de la mondialisation : « La mondialisation, que certains définissent comme un phénomène d'intensification des échanges internationaux, ne date pas d'aujourd'hui, mais elle est entrée dans une nouvelle étape. Depuis plusieurs décennies, la mondialisation est en partie façonnée par les décisions prises de manière collective par les États. Ces décisions sont souvent prises au sein d'organisations internationales. »$$,
      'questions', array[
        $$Dégage le problème posé par ce texte.$$,
        $$Explique la phrase : « La mondialisation ne date pas d'aujourd'hui mais elle est entrée dans une nouvelle étape. »$$,
        $$Commente le passage : « Ces décisions sont souvent prises au sein d'organisations internationales », en t'appuyant sur les facteurs de la mondialisation étudiés (GATT, OMC).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition de la mondialisation vue en cours ?$$,
      'hint', $$Elle concerne les relations économiques entre régions du monde.$$,
      'expected', $$Un processus par lequel s'établit une interdépendance économique entre les différentes régions du monde, au moyen surtout des courants d'échanges et des flux financiers.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année les accords du GATT ont-ils été signés ?$$,
      'hint', $$C'est juste après la Seconde Guerre mondiale.$$,
      'expected', $$En 1947.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux innovations technologiques ayant favorisé la mondialisation après la Seconde Guerre mondiale.$$,
      'hint', $$Elles concernent les transports ou l'information.$$,
      'expected', $$Deux parmi : l'avion, le TGV, les oléoducs/gazoducs, les ordinateurs, les satellites, le fax.$$
    ),
    jsonb_build_object(
      'question', $$Par quelle organisation le GATT a-t-il été remplacé en 1994 ?$$,
      'hint', $$Son sigle est bien connu aujourd'hui.$$,
      'expected', $$Par l'Organisation Mondiale du Commerce (OMC).$$
    )
  ),
  now()
);
