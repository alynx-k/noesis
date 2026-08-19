-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 950: "1ère G1-Dynamisme démographique et qualité de la
-- vie en Côte d'Ivoire" (https://lyc.ecole-ci.org/course/view.php?id=950),
-- resource id 5037. Contenu réécrit à partir du PDF source (facteurs de
-- la croissance démographique ivoirienne, structure par âge, répartition
-- spatiale, impact sur la qualité de vie, mesures correctrices). Chiffres
-- et statistiques réels (INS, RGPH 2014 ; PNUD 2013) repris tels quels
-- (données factuelles, non protégées) ; explications reformulées, non
-- copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-dynamisme-demographique-ci',
  '1ere',
  'C',
  'histoire-geographie',
  $$Dynamisme démographique et qualité de vie en Côte d'Ivoire$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une séance de sensibilisation animée par une cellule de l'Association Ivoirienne pour le Bien-être Familial (AIBF), l'animateur explique que les naissances nombreuses favorisent la propagation du VIH/SIDA et les grossesses précoces en milieu scolaire, et propose de planifier les naissances. Un débat s'engage : certains élèves pensent que la croissance démographique n'est pas responsable de la dégradation des conditions de vie (sinon un pays comme le Japon ne serait pas développé), d'autres estiment au contraire que la pauvreté ivoirienne vient directement de cette croissance rapide. Pour trancher, la classe décide d'étudier le dynamisme démographique de la Côte d'Ivoire et son impact sur la qualité de la vie.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une population à croissance rapide$$,
        'body', $$Depuis 1920, la population ivoirienne n'a cessé de croître, passant de 2 millions à plus de 23 millions d'habitants aujourd'hui (INS, RGPH 2014), sur un territoire de 322 462 km². Cette évolution comporte deux phases : une croissance lente de 1920 à 1960, puis une croissance rapide de 1960 à 2014. Cette accélération s'explique par l'accroissement naturel (différence entre le taux de natalité et le taux de mortalité, TAN = TN − TM, estimé à 2,6% soit 26‰ en Côte d'Ivoire) et par les migrations : le pays accueille une forte population étrangère (5 491 972 habitants, soit 24,2% de la population totale en 2014), attirée par sa stabilité politique et économique et sa politique d'ouverture des frontières héritée d'Houphouët-Boigny.$$,
        'highlights', array[$$croissance lente (1920-1960) puis rapide (1960-2014)$$, $$TAN = TN − TM ≈ 2,6% en Côte d'Ivoire$$, $$24,2% de population étrangère (2014)$$]::text[],
        'property', jsonb_build_object('label', $$Formules$$, 'text', $$Taux de natalité TN = (nombre de naissances / population totale) × 100. Taux d'accroissement naturel TAN = TN − TM (taux de mortalité).$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux grands facteurs de la croissance démographique ivoirienne ?$$, 'solution', $$L'accroissement naturel (excédent des naissances sur les décès) et les migrations (une forte immigration liée à la stabilité et à l'ouverture du pays).$$)
      ),
      jsonb_build_object(
        'heading', $$Une population jeune et inégalement répartie$$,
        'body', $$La pyramide des âges de la Côte d'Ivoire a une forme triangulaire (base large, flancs concaves, sommet effilé), signe d'une population très jeune : les 0-25 ans représentent 61,3% de la population, du fait de la forte natalité et des migrations. La faible espérance de vie (51 ans pour les femmes, 48 ans pour les hommes, PNUD 2013) explique le faible nombre de personnes âgées ; la population masculine (11 277 469) dépasse légèrement la population féminine (10 879 638). Par ailleurs, la population est inégalement répartie sur le territoire (densité moyenne 71,32 hab/km²) : des zones de forte densité (Sud, zones forestières, grandes villes, ≥80 hab/km²), des zones de densité moyenne (50-70 hab/km², Ouest, Est, Centre) et des zones de faible densité (Centre et Nord, <50 hab/km²).$$,
        'highlights', array[$$pyramide triangulaire : base large = population jeune (61,3% ont 0-25 ans)$$, $$densité moyenne : 71,32 hab/km²$$, $$répartition inégale : Sud dense, Centre/Nord peu dense$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux facteurs qui expliquent la concentration de la population dans le sud forestier de la Côte d'Ivoire.$$, 'solution', $$Des facteurs naturels (les terres fertiles de la zone forestière attirent les populations agricoles) et des facteurs historiques (les conquêtes de Samory Touré ont poussé les populations du nord à fuir vers les zones forestières et montagneuses, considérées comme des refuges).$$),
        'fixation', jsonb_build_object('question', $$Que signifie la forme « triangulaire » (base large, sommet effilé) de la pyramide des âges ivoirienne ?$$, 'solution', $$Qu'il y a beaucoup de jeunes (base large) et très peu de personnes âgées (sommet effilé), signe d'une population globalement jeune.$$)
      ),
      jsonb_build_object(
        'heading', $$Une population mobile, une qualité de vie à préserver$$,
        'body', $$La population ivoirienne se distingue aussi par sa forte mobilité : migration interne des zones nord et centre vers le sud, exode rural massif, immigration importante depuis la sous-région. La qualité de la vie désigne l'ensemble des conditions élémentaires nécessaires pour mener une vie convenable : équipement en infrastructures socio-économiques (marchés, banques, écoles, centres de santé, loisirs) et volet environnemental (espaces verts, canalisations, gestion des ordures, assainissement).$$,
        'highlights', array[$$forte mobilité : migration interne + exode rural + immigration sous-régionale$$, $$qualité de vie = infrastructures socio-économiques + environnement sain$$]::text[],
        'fixation', jsonb_build_object('question', $$Que recouvre la notion de « qualité de la vie » ?$$, 'solution', $$L'ensemble des conditions élémentaires nécessaires pour mener une vie convenable : infrastructures socio-économiques adéquates (marchés, écoles, santé, loisirs) et un environnement sain (espaces verts, assainissement, gestion des ordures).$$)
      ),
      jsonb_build_object(
        'heading', $$L'explosion démographique, un défi pour la qualité de vie$$,
        'body', $$La croissance rapide de la population dépasse le rythme des investissements de l'État, entraînant chômage, délinquance juvénile, cybercriminalité, insuffisance de la couverture sanitaire (seulement 4 CHU pour tout le pays), logements insuffisants et coûteux, quartiers précaires, pauvreté et cherté de la vie. L'environnement est également menacé : destruction des espaces verts, savanisation, pollution, prolifération de maladies liées à l'eau (typhoïde, choléra, paludisme). Pour y remédier, l'État agit sur deux fronts : freiner la croissance démographique (sensibilisation, planning familial, lutte contre les mariages précoces, scolarisation de la jeune fille) et préserver la qualité de vie (exploitation rationnelle des forêts et des eaux, agriculture intensive, création de parcs et réserves, logements sociaux, amélioration des services de base).$$,
        'highlights', array[$$croissance rapide > rythme des investissements → chômage, insalubrité, pauvreté$$, $$mesures : freiner la croissance (planning familial) + préserver la qualité de vie (infrastructures, environnement)$$]::text[],
        'example', jsonb_build_object('statement', $$Explique en une phrase pourquoi une population jeune représente une « charge » pour l'État.$$, 'solution', $$Parce que l'État doit financer son éducation, sa santé et créer des emplois pour elle, alors que le rythme des investissements publics est souvent inférieur au rythme de croissance de cette population.$$),
        'fixation', jsonb_build_object('question', $$Cite deux mesures pour freiner l'explosion démographique en Côte d'Ivoire.$$, 'solution', $$Deux parmi : la sensibilisation aux méthodes contraceptives, l'encouragement du planning familial, la lutte contre les mariages précoces, la scolarisation de la jeune fille, la lutte contre les grossesses en milieu scolaire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu assistes à une campagne d'information organisée par l'Association Ivoirienne pour le Bien-être Familial (AIBF) dans ton établissement. Le responsable de la délégation tient les propos suivants : « La croissance non maîtrisée de notre population a une incidence négative sur la qualité de vie en Côte d'Ivoire. Je vous invite à un changement de comportements pour de meilleures conditions de vie. »$$,
      'questions', array[
        $$Identifie le problème que soulève cette situation.$$,
        $$Explique le passage suivant : « la croissance non maîtrisée de notre population a une incidence négative sur la qualité de vie en Côte d'Ivoire ».$$,
        $$Donne ton avis, justifié, sur l'appel du responsable de l'AIBF « à un changement de comportements pour de meilleures conditions de vie ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment calcule-t-on le taux d'accroissement naturel (TAN) d'une population ?$$,
      'hint', $$C'est une différence entre deux taux.$$,
      'expected', $$TAN = TN − TM, c'est-à-dire le taux de natalité moins le taux de mortalité.$$
    ),
    jsonb_build_object(
      'question', $$Que signifient la base large et le sommet effilé de la pyramide des âges ivoirienne ?$$,
      'hint', $$Ils traduisent deux réalités opposées de la population.$$,
      'expected', $$La base large exprime la forte proportion de jeunes (0-25 ans, 61,3%), tandis que le sommet effilé exprime la faible proportion de personnes âgées, liée à la faible espérance de vie.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux facteurs de l'inégale répartition de la population sur le territoire ivoirien.$$,
      'hint', $$Ils peuvent être naturels, historiques ou économiques.$$,
      'expected', $$Deux parmi : les facteurs naturels (terres fertiles du sud forestier), les raisons historiques (fuites liées aux conquêtes de Samory Touré), l'inégale répartition des infrastructures, les raisons économiques (quête d'emploi).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conséquences de l'explosion démographique sur la qualité de vie en Côte d'Ivoire.$$,
      'hint', $$Elles peuvent être socio-économiques ou environnementales.$$,
      'expected', $$Deux parmi : chômage, délinquance juvénile, insuffisance des logements et de la couverture sanitaire, pauvreté, destruction des espaces verts, pollution, prolifération de maladies.$$
    )
  ),
  now()
);
