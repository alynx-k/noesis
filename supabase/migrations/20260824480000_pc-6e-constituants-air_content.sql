-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 7 : Les constituants de l'air" (id 2089). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 6ème constate que les ordures ménagères et les eaux usées déversées dans la nature polluent l'air. Avec sa classe, il veut mener une campagne de sensibilisation. Ils cherchent à connaître les constituants essentiels de l'air, quelques sources de pollution, et des actions pour la réduire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les constituants essentiels de l'air$$,
        'body', $$En plaçant une bougie allumée sous une éprouvette retournée sur l'eau, on observe que la bougie s'éteint et que l'eau monte pour occuper environ 1/5 (20%) du volume total. Cela montre que l'air est un mélange constitué essentiellement de deux gaz : le gaz oxygène (environ 1/5 ou 20% en volume) et le gaz azote (environ 4/5 ou 80% en volume). Le gaz oxygène est le constituant qui entretient la combustion — c'est pourquoi la bougie s'éteint une fois l'oxygène du récipient consommé.$$,
        'highlights', array[$$air = mélange de 2 gaz principaux : oxygène (~1/5, 20%) + azote (~4/5, 80%)$$, $$le gaz oxygène entretient la combustion$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle proportion (en volume) de gaz azote contient l'air ?$$, 'solution', $$Environ 4/5, soit 80%.$$)
      ),
      jsonb_build_object(
        'heading', $$Sources de pollution de l'air$$,
        'body', $$Quelques sources de pollution de l'air : les ordures ménagères, les déchets déversés par les usines, les gaz d'échappement des véhicules et des usines, les feux de brousse, les herbicides, les eaux usées. Ces sources dégradent la qualité de l'air que nous respirons et nuisent à l'environnement.$$,
        'highlights', array[$$sources : ordures ménagères, déchets d'usines, gaz d'échappement, feux de brousse, herbicides, eaux usées$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les gaz d'échappement des véhicules polluent-ils l'air ?$$, 'solution', $$Parce qu'ils rejettent des substances chimiques dans l'atmosphère qui dégradent sa qualité.$$),
        'fixation', jsonb_build_object('question', $$Cite deux sources de pollution de l'air.$$, 'solution', $$Par exemple : les ordures ménagères et les gaz d'échappement des véhicules (deux parmi les sources citées).$$)
      ),
      jsonb_build_object(
        'heading', $$Actions pour réduire la pollution de l'air$$,
        'body', $$Pour chaque source de pollution correspond une action : déposer les ordures ménagères dans des endroits aménagés ; installer les usines loin des lieux d'habitation ; effectuer régulièrement les vidanges des véhicules ; éviter les feux de brousse ; éviter l'utilisation abusive des herbicides ; déverser les eaux usées dans les canaux d'évacuation. Planter des arbres aide aussi : par la photosynthèse, les feuilles absorbent le gaz carbonique et rejettent le gaz oxygène, ce qui réduit la pollution.$$,
        'highlights', array[$$1 action par source : ordures→endroits aménagés ; véhicules→vidanges régulières ; usines→loin des habitations$$, $$planter des arbres = photosynthèse = absorbe CO2, rejette O2$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle action correspond à la pollution par les eaux usées déversées dans la nature ?$$, 'solution', $$Déverser les eaux usées dans les canaux d'évacuation prévus à cet effet.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi planter des arbres réduit-il la pollution de l'air ?$$, 'solution', $$Par la photosynthèse, les arbres absorbent le gaz carbonique et rejettent le gaz oxygène dans l'atmosphère.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club environnement d'un établissement organise une journée de sensibilisation auprès de la population sur la pollution de l'air causée par les ordures ménagères et les eaux usées déversées dans les rues.$$,
      'questions', array[
        $$Nomme les constituants essentiels de l'air.$$,
        $$Indique deux sources qui polluent l'air.$$,
        $$Propose une action à mener pour chaque source de pollution, afin d'améliorer la qualité de l'air.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$L'air est-il constitué essentiellement du gaz oxygène et du gaz carbonique ?$$,
      'hint', $$Le deuxième constituant principal n'est pas le gaz carbonique.$$,
      'expected', $$Non, l'air est constitué essentiellement du gaz oxygène et du gaz azote.$$
    ),
    jsonb_build_object(
      'question', $$Un litre d'air contient-il 0,8L de gaz oxygène et 0,2L de gaz azote, ou l'inverse ?$$,
      'hint', $$Le gaz azote est le plus abondant.$$,
      'expected', $$L'inverse : 0,8L de gaz azote et 0,2L de gaz oxygène.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le gaz le plus abondant dans l'air ?$$,
      'hint', $$Il représente environ 80% du volume.$$,
      'expected', $$Le gaz azote.$$
    ),
    jsonb_build_object(
      'question', $$Quelle action peut réduire la pollution due aux ordures ménagères ?$$,
      'hint', $$Pense à où les déposer.$$,
      'expected', $$Déposer les ordures ménagères dans des endroits aménagés.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-constituants-air';
