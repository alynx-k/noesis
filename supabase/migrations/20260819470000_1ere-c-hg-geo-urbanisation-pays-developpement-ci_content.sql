-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 948: "1ère G3-L'urbanisation dans les pays en
-- développement exemple de la Côte d'Ivoire"
-- (https://lyc.ecole-ci.org/course/view.php?id=948), resource id 5013.
-- Contenu réécrit à partir du PDF source (phases historiques de
-- l'urbanisation ivoirienne, caractères, place d'Abidjan, problèmes et
-- gestion urbaine durable). Chiffres réels (INS, taux d'urbanisation) et
-- citations factuelles de personnalités publiques (ministre de la ville,
-- rapport ministériel) repris tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-urbanisation-pays-developpement-ci',
  '1ere',
  'C',
  'histoire-geographie',
  $$L'urbanisation dans les pays en développement : l'exemple de la Côte d'Ivoire$$,
  3,
  '1ere-c-hg-geo-croissance-demographique-mondiale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tes amis de classe et toi suivez l'édition de 13h du journal télévisé sur la RTI1. Interrogé par la présentatrice, le ministre ivoirien de la ville tient les propos suivants : « La crise que connaît notre cité aujourd'hui résulte d'une urbanisation accélérée et incontrôlée. Nous devons unir nos efforts pour une urbanisation durable dans notre pays. » De retour à l'école, vous menez des recherches pour décrire le processus d'urbanisation en Côte d'Ivoire, montrer la place d'Abidjan dans le paysage urbain ivoirien et proposer des solutions aux problèmes urbains.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le processus d'urbanisation en Côte d'Ivoire$$,
        'body', $$L'urbanisation ivoirienne a connu trois grandes phases. À la période précoloniale (XVIe-XVIIIe siècle), quelques cités marchandes (Kong, Odienné, Bondoukou, Séguéla, Bouna) se sont développées le long des routes commerciales reliant le Soudan au sud forestier, échangeant or, sel et étoffes contre la cola. À la période coloniale, les Européens créent des centres urbains sur la côte (Assinie, Grand-Bassam, Bingerville, Dabou) pour le commerce, et des postes militaires à l'intérieur (Tiassalé, Dimbokro). C'est véritablement à la période postcoloniale, après 1960, que le fait urbain se généralise en Côte d'Ivoire : on parle alors d'explosion urbaine, avec la création de villes dotées d'infrastructures (écoles, hôpitaux, routes, réseaux d'eau et d'électricité).$$,
        'highlights', array[$$3 phases : précoloniale (cités marchandes), coloniale (comptoirs et postes militaires), postcoloniale (explosion urbaine après 1960)$$]::text[],
        'property', jsonb_build_object('label', $$Définition officielle ivoirienne d'une ville$$, 'text', $$Toute localité d'au moins 4 000 habitants, marquée par une prédominance des activités du secteur secondaire et érigée en sous-préfecture ou commune.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les cités précoloniales comme Kong ou Bondoukou se sont-elles développées ?$$, 'solution', $$Parce qu'elles étaient situées le long des routes commerciales reliant le Soudan occidental au sud forestier, où s'échangeaient or, sel, étoffes et cola.$$)
      ),
      jsonb_build_object(
        'heading', $$Les caractères de l'urbanisation ivoirienne$$,
        'body', $$L'urbanisation en Côte d'Ivoire présente trois caractères. C'est un phénomène récent, véritablement amorcé après l'indépendance de 1960. C'est une urbanisation accélérée : le taux d'urbanisation est passé de 4% en 1961 à 55% en 2000, porté par la croissance démographique (exode rural, immigration), les facteurs économiques (usines, centres commerciaux) et politiques (communalisation, création de nouvelles sous-préfectures). C'est enfin une urbanisation inégalement répartie : la zone forestière est bien plus urbanisée (83,7%) que la zone de savane (31,5%), avec de grandes villes concentrées au sud (Abidjan, San Pedro, Daloa, Yamoussoukro) contre quelques villes isolées au nord (Korhogo, Odienné, Bondoukou).$$,
        'highlights', array[$$récente (après 1960) + accélérée (4% → 55% entre 1961-2000) + inégalement répartie (sud > nord)$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux facteurs qui expliquent l'accélération de l'urbanisation ivoirienne après 1960.$$, 'solution', $$Deux parmi : l'exode rural et l'immigration (facteurs démographiques), la création de voies de communication et l'installation d'usines (facteurs économiques), la politique de communalisation et la création de nouvelles sous-préfectures (facteurs politiques).$$),
        'fixation', jsonb_build_object('question', $$Comment a évolué le taux d'urbanisation ivoirien entre 1961 et 2000 ?$$, 'solution', $$Il est passé de 4% à 55%.$$)
      ),
      jsonb_build_object(
        'heading', $$Abidjan, une ville géante et multifonctionnelle$$,
        'body', $$Abidjan est une mégalopole d'environ 6 millions d'habitants, la ville la plus peuplée de la sous-région après Lagos, cinq fois plus vaste que Paris, organisée en district de 2 119 km² (10 communes urbaines et 3 nouvelles sous-préfectures). Elle cumule les fonctions de capitale économique (siège de la BCEAO, port autonome), culturelle (universités, grandes écoles) et politique (présidence, ministères, ambassades). Elle exerce une influence absolue sur les autres villes du pays, qui dépendent d'elle à tous les niveaux : c'est le phénomène de macrocéphalie urbaine.$$,
        'highlights', array[$$Abidjan : ~6 millions d'habitants, district de 2 119 km², 10 communes$$, $$macrocéphalie urbaine : influence absolue d'Abidjan sur les villes de l'intérieur$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on la « macrocéphalie urbaine » à propos d'Abidjan ?$$, 'solution', $$Le fait qu'Abidjan exerce une influence absolue sur les autres villes ivoiriennes, qui dépendent d'elle à tous les niveaux (économique, administratif, culturel).$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes urbains et gestion urbaine durable$$,
        'body', $$L'urbanisation rapide et mal maîtrisée entraîne des problèmes multiples : échec de la planification urbaine, crise des services de base (transport, eau, électricité, santé, éducation), paupérisation (chômage, quartiers précaires, spéculation foncière) et pathologies sociales (délinquance, insécurité). Pour y remédier, la gestion urbaine durable repose sur la gouvernance urbaine (participation des citadins, transparence, accès à l'information, impliquant autorités publiques, secteur privé et société civile) et sur le financement du développement urbain (transfert de compétences aux collectivités territoriales, renforcement de leurs ressources financières, civisme fiscal).$$,
        'highlights', array[$$problèmes : planification échouée, crise des services de base, paupérisation, pathologies sociales$$, $$solutions : gouvernance urbaine participative + financement décentralisé$$]::text[],
        'example', jsonb_build_object('statement', $$Quels sont les trois types d'acteurs impliqués dans la gouvernance urbaine ?$$, 'solution', $$Les autorités publiques, le secteur privé et la société civile.$$),
        'fixation', jsonb_build_object('question', $$Cite deux mesures pour renforcer le financement du développement urbain durable.$$, 'solution', $$Deux parmi : le transfert effectif des compétences aux collectivités territoriales, le renforcement des moyens financiers des communes, le civisme fiscal.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un document du ministère du Plan et du Développement affirme : « La Côte d'Ivoire, pays par excellence de destination migratoire, n'échappe pas à la dynamique de l'urbanisation. Débutée de manière timide, on a assisté à une véritable poussée de l'urbanisation entre 1950 et 1975. » Plus loin, il ajoute : « La brutalité de ce phénomène a entraîné une crise aiguë des services urbains. »$$,
      'questions', array[
        $$Dégage l'idée générale de cette situation.$$,
        $$Explique le passage : « débutée de manière timide, on a assisté à une véritable poussée de l'urbanisation entre 1950 et 1975 ».$$,
        $$Partages-tu l'idée selon laquelle « la brutalité de ce phénomène a entraîné une crise aiguë des services urbains » ? Justifie ta réponse à partir des problèmes urbains étudiés dans la leçon.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois grandes phases du processus d'urbanisation en Côte d'Ivoire ?$$,
      'hint', $$Elles correspondent à des périodes historiques successives.$$,
      'expected', $$La période précoloniale, la période coloniale, et la période postcoloniale (après l'indépendance).$$
    ),
    jsonb_build_object(
      'question', $$Quel critère démographique définit officiellement une « ville » en Côte d'Ivoire ?$$,
      'hint', $$C'est un seuil de population.$$,
      'expected', $$Une localité d'au moins 4 000 habitants (avec en plus une prédominance du secteur secondaire et un statut de sous-préfecture ou de commune).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on qu'Abidjan exerce une « macrocéphalie urbaine » sur la Côte d'Ivoire ?$$,
      'hint', $$Cela concerne le rapport entre Abidjan et les autres villes du pays.$$,
      'expected', $$Parce qu'Abidjan exerce une influence absolue sur les autres villes de l'intérieur, qui dépendent d'elle à tous les niveaux (économique, politique, culturel).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux acteurs impliqués dans la gouvernance urbaine participative.$$,
      'hint', $$Ils relèvent du public, du privé et de la société.$$,
      'expected', $$Deux parmi : les autorités publiques, le secteur privé, la société civile.$$
    )
  ),
  now()
);
