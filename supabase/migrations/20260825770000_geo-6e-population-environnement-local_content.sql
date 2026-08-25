-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 1 : Population et environnement local" (Thème 2 :
-- L'homme et son milieu local en Côte d'Ivoire — étude de cas : région
-- de l'Indénié-Djuablin). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés,
-- valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club « Environnement » d'un établissement organise une conférence sur les dangers qui menacent l'environnement de sa région. Les élèves apprennent que les populations pratiquent des activités économiques ayant des effets négatifs sur l'environnement. Ils décident de mener des recherches pour connaître leur milieu local, identifier les méfaits des activités économiques, et proposer des actions de préservation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le cadre physique d'un milieu local (exemple : l'Indénié-Djuablin)$$,
        'body', $$L'environnement est l'ensemble des éléments naturels et artificiels qui nous entourent ; l'environnement local est le milieu où l'homme vit. Prenons l'exemple de la région de l'Indénié-Djuablin, à l'est de la Côte d'Ivoire (frontière avec le Ghana à l'est) : son relief est monotone et plat, dominé par les plateaux ; son climat attiéen comporte quatre saisons (deux sèches, deux pluvieuses) ; sa végétation de forêt pousse sur des sols ferralitiques fertiles ; elle est bien arrosée par la Comoé et ses affluents. Ce milieu naturel favorable attire les populations.$$,
        'highlights', array[$$un milieu local se caractérise par sa localisation, son relief, son climat, sa végétation/sols, son hydrographie$$, $$un milieu plat, arrosé et fertile favorise l'installation humaine$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels éléments rendent un milieu naturel favorable à l'installation humaine ?$$, 'solution', $$Un relief accessible, un climat pluvieux, des sols fertiles et une bonne hydrographie (cours d'eau).$$)
      ),
      jsonb_build_object(
        'heading', $$La répartition de la population et ses activités$$,
        'body', $$La population d'une région est souvent inégalement répartie entre ses départements, selon le milieu naturel (favorable ou non) et les activités économiques pratiquées (agriculture, pêche, élevage, exploitation forestière, industries), qui attirent les populations en leur offrant des moyens de subsistance. Le département le plus peuplé n'est pas toujours celui à la plus forte densité : cela dépend aussi de la superficie du département.$$,
        'highlights', array[$$répartition de la population = milieu naturel favorable + activités économiques attractives$$, $$population totale ≠ densité (un grand département peuplé peut avoir une densité plus faible qu'un petit département moins peuplé)$$]::text[],
        'example', jsonb_build_object('statement', $$Un département a moins d'habitants qu'un autre, mais une densité de population plus élevée. Comment est-ce possible ?$$, 'solution', $$Parce que ce département a une superficie plus petite : la densité dépend du rapport population/surface, pas seulement du nombre d'habitants.$$),
        'fixation', jsonb_build_object('question', $$Cite deux activités économiques qui peuvent attirer une population dans une région.$$, 'solution', $$Par exemple : l'agriculture et l'élevage (deux parmi : pêche, exploitation forestière, industrie).$$)
      ),
      jsonb_build_object(
        'heading', $$Les méfaits des activités économiques et leur préservation$$,
        'body', $$Les activités économiques dégradent souvent l'environnement local : l'agriculture, l'exploitation forestière et la chasse entraînent la déforestation et la disparition de la faune ; l'utilisation de produits toxiques pour pêcher pollue les cours d'eau ; les usines et fermes d'élevage polluent l'air et l'eau par leurs rejets. Pour préserver l'environnement, il faut reboiser, lutter contre les feux de brousse, créer des parcs et réserves naturelles, traiter les eaux usées et les déchets avant rejet, et sensibiliser les populations (notamment contre la pêche illicite).$$,
        'highlights', array[$$méfaits : déforestation, disparition de la faune, pollution de l'eau et de l'air$$, $$préservation : reboisement, parcs/réserves, traitement des déchets, sensibilisation$$]::text[],
        'fixation', jsonb_build_object('question', $$Que peut-on faire pour réparer les dégâts causés par la déforestation ?$$, 'solution', $$Le reboisement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un représentant de la préfecture propose la construction d'une usine dans un village pour lutter contre le chômage des jeunes, mais ce projet entraînerait la destruction d'une forêt classée et menacerait, par ses rejets, la rivière qui alimente le village en eau. Le village s'oppose fermement à ce projet, prêt à saisir la justice.$$,
      'questions', array[
        $$Identifie le problème posé dans cette situation.$$,
        $$Relève les menaces que la construction de cette usine fait peser sur l'environnement du village.$$,
        $$Le village a-t-il raison de s'opposer à ce projet ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que l'environnement local ?$$,
      'hint', $$C'est l'échelle la plus proche de l'individu.$$,
      'expected', $$Le milieu naturel et artificiel dans lequel l'homme vit, à l'échelle de sa région.$$
    ),
    jsonb_build_object(
      'question', $$L'utilisation de produits toxiques pour pêcher a-t-elle un effet positif ou négatif sur l'environnement ?$$,
      'hint', $$Elle contamine l'eau.$$,
      'expected', $$Un effet négatif : elle pollue les cours d'eau.$$
    ),
    jsonb_build_object(
      'question', $$Cite une action pour préserver l'environnement local.$$,
      'hint', $$Pense à réparer ou prévenir les dégâts.$$,
      'expected', $$Par exemple : le reboisement, la création de réserves naturelles, ou le traitement des eaux usées avant rejet.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi les activités économiques attirent-elles les populations dans une région, malgré leurs méfaits sur l'environnement ?$$,
      'hint', $$Elles apportent un avantage direct aux habitants.$$,
      'expected', $$Parce qu'elles offrent du travail et des moyens de subsistance.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-population-environnement-local';
