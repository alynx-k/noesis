-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 8 : LES ACTIVITÉS DU SECTEUR PRIMAIRE ET LA LUTTE
-- CONTRE LE CHÔMAGE" (id 1715). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'une causerie, une élève de 6ème confie à ses camarades qu'elle est indignée de voir son frère aîné, titulaire d'un diplôme universitaire, s'adonner à l'élevage de poulets. Surpris par cette affirmation, ses camarades décident de s'informer sur les activités agro-pastorales et leur importance dans la lutte contre le chômage.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les activités du secteur primaire$$,
        'body', $$Les activités du secteur primaire sont des activités liées à la production des ressources animales et végétales. Elles comprennent notamment : l'agriculture, la pêche, l'élevage, et l'apiculture. La pisciculture, l'aviculture et la culture de l'anacarde en font partie ; en revanche, la production de chocolat (transformation) ou le transport n'appartiennent pas au secteur primaire.$$,
        'highlights', array[$$secteur primaire = production de ressources animales et végétales$$, $$exemples : agriculture, pêche, élevage, apiculture, pisciculture, aviculture$$]::text[],
        'fixation', jsonb_build_object('question', $$La production de chocolat appartient-elle au secteur primaire ?$$, 'solution', $$Non, c'est une activité de transformation, pas de production directe de ressources animales/végétales.$$)
      ),
      jsonb_build_object(
        'heading', $$Les étapes de création d'une activité du secteur primaire$$,
        'body', $$Créer une activité du secteur primaire suit cinq étapes dans l'ordre : (1) l'identification du projet — bien cerner l'activité choisie ; (2) la connaissance ou maîtrise de l'activité — avoir la qualification nécessaire ; (3) la prospection du marché — s'assurer qu'il existe des débouchés (une clientèle) ; (4) le choix du site — bien choisir le lieu d'installation ; (5) l'estimation du capital — prévoir les moyens financiers nécessaires (salaires, fonds de roulement et de démarrage).$$,
        'highlights', array[$$1. identification du projet → 2. maîtrise de l'activité → 3. prospection du marché → 4. choix du site → 5. estimation du capital$$]::text[],
        'example', jsonb_build_object('statement', $$Avant de choisir le site d'une ferme avicole, quelle étape faut-il avoir réalisée ?$$, 'solution', $$La prospection du marché (s'assurer qu'il existe des débouchés), qui précède le choix du site.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la dernière étape de la création d'une activité du secteur primaire ?$$, 'solution', $$L'estimation du capital.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance des activités du secteur primaire$$,
        'body', $$Au niveau individuel, elles permettent d'être autonome, de bénéficier de considération sociale, et de faire face aux charges de sa famille. Au niveau de la communauté, elles réduisent le chômage, améliorent la qualité de vie, et préservent la sécurité et la cohésion. Au niveau de l'État, elles réduisent la pauvreté et les charges liées aux importations alimentaires, accroissent les recettes fiscales, favorisent le développement et préservent la paix.$$,
        'highlights', array[$$individuel : autonomie, considération sociale, charges familiales$$, $$communauté : réduit chômage ; État : réduit pauvreté/importations, accroît recettes fiscales$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi les activités du secteur primaire aident-elles l'État ?$$, 'solution', $$Elles réduisent la pauvreté et les importations alimentaires, augmentent les recettes fiscales, favorisent le développement et préservent la paix.$$),
        'fixation', jsonb_build_object('question', $$Cite un avantage des activités du secteur primaire au niveau individuel.$$, 'solution', $$Par exemple : être autonome, ou faire face aux charges de sa famille (un parmi les trois cités).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une conférence de sensibilisation sur les activités du secteur primaire, le responsable régional de l'extra-scolaire exhorte les élèves à s'y intéresser davantage. Mais certains de tes camarades estiment qu'ils ne font pas des études pour devenir agriculteurs ou éleveurs.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Relève deux avantages des activités du secteur primaire.$$,
        $$Justifie ton intérêt pour ces activités.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Parmi pisciculture, aviculture, culture de l'anacarde et transport, laquelle n'appartient pas au secteur primaire ?$$,
      'hint', $$Une seule n'est pas liée à la production de ressources.$$,
      'expected', $$Le transport.$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Les activités du ______ sont des activités liées à la ______ des ressources animales et ______."$$,
      'hint', $$Utilise secteur primaire, production, végétales.$$,
      'expected', $$"Les activités du secteur primaire sont des activités liées à la production des ressources animales et végétales."$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape de la création d'une activité du secteur primaire ?$$,
      'hint', $$Avant de connaître le marché, il faut d'abord savoir quoi faire.$$,
      'expected', $$L'identification du projet.$$
    ),
    jsonb_build_object(
      'question', $$Comment les activités du secteur primaire réduisent-elles les charges de l'État ?$$,
      'hint', $$Pense aux denrées alimentaires.$$,
      'expected', $$En réduisant les importations de certaines denrées alimentaires.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-activites-agro-pastorales';
