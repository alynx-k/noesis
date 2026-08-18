-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 2001: "1ère G1: DYNAMISME DEMOGRAPHIQUE ET QUALITE DE LA
-- VIE EN CÔTE D'IVOIRE" (https://lyc.ecole-ci.org/course/view.php?id=2001),
-- resource id 17474. Contenu réécrit à partir du PDF source (facteurs de
-- la croissance démographique ivoirienne, structure par âge, répartition
-- spatiale, impact sur la qualité de vie, mesures correctrices). Chiffres
-- et statistiques réels (INS, RGPH 2014 ; PNUD 2013) repris tels quels
-- (ce sont des données factuelles, pas du texte protégé) ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-dynamisme-demographique-ci',
  '1ere',
  'A',
  'histoire-geographie',
  $$Dynamisme démographique et qualité de vie en Côte d'Ivoire$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une séance de sensibilisation animée par une association de bien-être familial, l'animateur explique que les naissances nombreuses favorisent la propagation de certaines maladies et les grossesses précoces en milieu scolaire, et propose de planifier les naissances. Un débat s'engage : certains élèves pensent que la croissance démographique n'est pas responsable de la dégradation des conditions de vie (sinon un pays comme le Japon ne serait pas développé), d'autres estiment au contraire que la pauvreté ivoirienne vient directement de cette croissance rapide. Pour trancher, la classe décide d'étudier le dynamisme démographique de la Côte d'Ivoire et son impact sur la qualité de vie.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une population à croissance rapide$$,
        'body', $$Depuis 1920, la population ivoirienne n'a cessé de croître, passant de 2 millions à plus de 23 millions d'habitants aujourd'hui (INS, RGPH 2014), sur un territoire de 322 462 km². Cette évolution comporte deux phases : une croissance lente de 1920 à 1960, puis une croissance rapide de 1960 à 2014. Cette accélération s'explique par l'accroissement naturel (différence entre le taux de natalité et le taux de mortalité, TAN = TN − TM, estimé à 2,6% soit 26‰ en Côte d'Ivoire) et par les migrations : le pays accueille une forte population étrangère (24,2% de la population totale en 2014), attirée par sa stabilité politique et économique et sa politique d'ouverture des frontières.$$,
        'highlights', array[$$croissance lente (1920-1960) puis rapide (1960-2014)$$, $$TAN = TN − TM$$, $$24,2% de population étrangère (2014)$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$Taux de natalité TN = (nombre de naissances / population totale) × 100. Taux d'accroissement naturel TAN = TN − TM (taux de mortalité).$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux grands facteurs de la croissance démographique ivoirienne ?$$, 'solution', $$L'accroissement naturel (excédent des naissances sur les décès) et les migrations (une forte immigration liée à la stabilité et à l'ouverture du pays).$$)
      ),
      jsonb_build_object(
        'heading', $$Une population jeune et inégalement répartie$$,
        'body', $$La pyramide des âges de la Côte d'Ivoire a une forme triangulaire (base large, flancs concaves, sommet effilé), signe d'une population très jeune : les 0-25 ans représentent 61,3% de la population, du fait de la forte natalité. La faible espérance de vie (51 ans pour les femmes, 48 ans pour les hommes, PNUD 2013) explique le faible nombre de personnes âgées. Par ailleurs, la population est inégalement répartie sur le territoire : on distingue des zones de forte densité (Sud, zones forestières, grandes villes, ≥80 hab/km²), des zones de densité moyenne (50-70 hab/km², Ouest, Est, Centre) et des zones de faible densité (Centre et Nord, <50 hab/km²).$$,
        'highlights', array[$$pyramide triangulaire : base large = population jeune$$, $$61,3% ont 0-25 ans$$, $$répartition inégale : Sud dense, Centre/Nord peu dense$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux facteurs qui expliquent la concentration de la population dans le sud forestier de la Côte d'Ivoire.$$, 'solution', $$Des facteurs naturels (les terres fertiles de la zone forestière attirent les populations agricoles) et des facteurs historiques (les conquêtes de Samory Touré ont poussé les populations du nord à fuir vers les zones forestières et montagneuses, considérées comme des refuges).$$),
        'fixation', jsonb_build_object('question', $$Que signifie la forme « triangulaire » (base large, sommet effilé) de la pyramide des âges ivoirienne ?$$, 'solution', $$Qu'il y a beaucoup de jeunes (base large) et très peu de personnes âgées (sommet effilé), signe d'une population globalement jeune.$$)
      ),
      jsonb_build_object(
        'heading', $$L'impact de l'explosion démographique sur la qualité de vie$$,
        'body', $$La qualité de vie désigne l'ensemble des conditions nécessaires à une vie convenable (infrastructures socio-économiques : marchés, écoles, centres de santé ; et volet environnemental : espaces verts, assainissement). Or la croissance démographique rapide dépasse la capacité de l'État à investir : les jeunes déscolarisés sont exposés au chômage, à la délinquance et aux risques sanitaires, tandis que les logements et la couverture sanitaire restent insuffisants. L'environnement est lui aussi menacé : destruction des espaces verts, savanisation, pollution, prolifération de maladies liées au manque d'assainissement (typhoïde, choléra, paludisme).$$,
        'highlights', array[$$qualité de vie = infrastructures + environnement$$, $$croissance > capacité d'investissement de l'État$$, $$problèmes socio-économiques et environnementaux$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi une croissance démographique rapide peut-elle dégrader la qualité de vie, même si le pays se développe ?$$, 'solution', $$Parce que le rythme des investissements et des réalisations de l'État (écoles, santé, emplois) reste inférieur au rythme de croissance de la population, créant un déficit en infrastructures et en services.$$)
      ),
      jsonb_build_object(
        'heading', $$Les actions pour améliorer la qualité de vie$$,
        'body', $$Pour freiner l'explosion démographique, l'État peut agir par la sensibilisation aux méthodes contraceptives, l'encouragement du planning familial, la lutte contre les mariages et grossesses précoces, et la scolarisation des filles. Pour préserver la qualité de vie, il faut faire correspondre le rythme de croissance aux ressources disponibles : exploitation rationnelle des forêts et de l'eau, agriculture intensive plutôt qu'extensive, création de parcs et réserves, amélioration de l'assainissement et des services sociaux de base.$$,
        'highlights', array[$$freiner la croissance : planning familial, scolarisation des filles$$, $$préserver la qualité de vie : ressources ↔ croissance proportionnées$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux mesures pour freiner l'explosion démographique et deux mesures pour préserver la qualité de vie.$$, 'solution', $$Freiner la croissance : sensibilisation aux méthodes contraceptives, scolarisation de la jeune fille (également valables : planning familial, lutte contre les mariages précoces). Préserver la qualité de vie : agriculture intensive, amélioration de l'assainissement (également valables : création de parcs et réserves, logements sociaux).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un responsable d'une association de bien-être familial déclare : « La croissance non maîtrisée de notre population a une incidence négative sur la qualité de vie en Côte d'Ivoire. Je vous invite à un changement de comportements pour de meilleures conditions de vie. »$$,
      'questions', array[
        $$Explique le passage : « la croissance non maîtrisée de notre population a une incidence négative sur la qualité de vie ».$$,
        $$Cite deux facteurs de la croissance démographique ivoirienne et deux conséquences de cette croissance sur la qualité de vie.$$,
        $$Donne ton avis sur l'appel du responsable à un « changement de comportements ». Quelles mesures concrètes proposerais-tu ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Entre 1960 et 2014, la croissance de la population ivoirienne était-elle lente ou rapide ?$$,
      'hint', $$C'est la seconde des deux phases.$$,
      'expected', $$Rapide (contrairement à la période 1920-1960, plus lente).$$
    ),
    jsonb_build_object(
      'question', $$Que représente le taux d'accroissement naturel (TAN) ?$$,
      'hint', $$C'est une différence entre deux taux.$$,
      'expected', $$La différence entre le taux de natalité et le taux de mortalité (TAN = TN − TM).$$
    ),
    jsonb_build_object(
      'question', $$Quelle proportion de la population ivoirienne a entre 0 et 25 ans ?$$,
      'hint', $$C'est un chiffre cité dans le cours.$$,
      'expected', $$61,3%.$$
    ),
    jsonb_build_object(
      'question', $$Cite une mesure permettant de freiner l'explosion démographique en Côte d'Ivoire.$$,
      'hint', $$Pense au planning familial ou à l'éducation.$$,
      'expected', $$Par exemple encourager le planning familial, ou scolariser davantage les jeunes filles.$$
    )
  ),
  now()
);
