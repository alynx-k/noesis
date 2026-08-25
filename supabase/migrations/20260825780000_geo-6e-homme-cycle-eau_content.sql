-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 2 : L'homme et le cycle de l'eau" (Thème 2 : L'homme
-- et son milieu local en Côte d'Ivoire). Contenu réécrit à partir du
-- PDF source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En faisant des recherches sur la terre, des élèves de 6ème découvrent qu'elle est surnommée « planète bleue » en raison de l'abondance de l'eau, alors que l'eau est rare dans certaines régions du monde. Intrigués par cette contradiction, ils décident d'approfondir leurs recherches pour identifier les différentes formes d'eau, comprendre son cycle, et contribuer à son utilisation rationnelle.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les formes et types d'eau$$,
        'body', $$L'eau, liquide incolore et inodore, occupe 70% de la surface de la terre. Elle existe sous trois états : solide (glaciers, banquises, icebergs — 2% des eaux terrestres), liquide (océans, mers, fleuves, lacs, nappes souterraines — 98%), et gazeux (vapeur d'eau dans l'atmosphère — seulement 0,001%). On distingue aussi les eaux continentales (eaux courantes : fleuves, rivières ; eaux stagnantes : lacs, marais ; eaux souterraines : puits, forages) et les eaux océaniques ou marines (océans et mers).$$,
        'highlights', array[$$3 états : solide (2%), liquide (98%), gazeux (0,001%)$$, $$2 types : eaux continentales (courantes, stagnantes, souterraines) et eaux océaniques/marines$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel état de l'eau représente la plus grande part des eaux terrestres ?$$, 'solution', $$L'état liquide (98%).$$)
      ),
      jsonb_build_object(
        'heading', $$Le cycle de l'eau$$,
        'body', $$Le cycle de l'eau est le parcours que suit l'eau entre la terre et l'atmosphère. Les eaux continentales et océaniques s'évaporent sous l'effet du soleil ; la vapeur d'eau se refroidit et se condense en nuages ; ceux-ci provoquent des précipitations (pluie, grêle...) ; une partie de l'eau tombée s'infiltre dans le sol (formant la nappe phréatique), et une autre ruisselle pour alimenter les eaux de surface ; le cycle recommence alors.$$,
        'highlights', array[$$cycle : évaporation → condensation (nuages) → précipitations → infiltration/ruissellement → retour à la mer/aux nappes$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les fleuves ne s'assèchent-ils jamais complètement malgré l'évaporation constante de l'eau ?$$, 'solution', $$Parce que le cycle de l'eau ramène continuellement de l'eau sous forme de précipitations, qui alimentent à nouveau les cours d'eau (ruissellement) et les nappes souterraines.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la transformation de la vapeur d'eau en fines gouttelettes formant les nuages ?$$, 'solution', $$La condensation.$$)
      ),
      jsonb_build_object(
        'heading', $$L'utilité de l'eau et sa préservation$$,
        'body', $$L'eau est essentielle : elle permet la production d'électricité, l'irrigation, la pêche, la fabrication de produits, et les usages domestiques (boisson, lessive, cuisine). Pourtant, elle fait face à des problèmes : rareté et cherté de l'eau potable, pollution et gaspillage. Pour la préserver, il faut éviter de la souiller, la rationaliser, faciliter l'accès à l'eau potable pour les ménages défavorisés, et sanctionner les pollueurs.$$,
        'highlights', array[$$utilités : électricité, irrigation, pêche, usages domestiques$$, $$problèmes : rareté, cherté, pollution, gaspillage$$, $$solutions : sensibilisation, accès facilité, sanctions contre la pollution$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux problèmes qui menacent l'eau aujourd'hui.$$, 'solution', $$Par exemple : la pollution et le gaspillage (deux parmi : rareté, cherté).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pendant les vacances, un oncle emmène son neveu pêcher à la rivière et utilise un produit toxique qu'il déverse dans l'eau pour ramasser ensuite les poissons morts ou agonisants sans effort. Il constate cependant que les poissons deviennent de plus en plus rares dans la rivière.$$,
      'questions', array[
        $$Détermine le problème que soulève cette situation.$$,
        $$Explique pourquoi les poissons deviennent de plus en plus rares dans cette rivière.$$,
        $$Propose des mesures de préservation de l'eau et de ses ressources.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel pourcentage de la surface de la terre est occupé par l'eau ?$$,
      'hint', $$C'est un peu plus des deux tiers.$$,
      'expected', $$70%.$$
    ),
    jsonb_build_object(
      'question', $$L'infiltration de l'eau dans le sol forme quelle réserve d'eau souterraine ?$$,
      'hint', $$On y accède par des puits ou des forages.$$,
      'expected', $$La nappe phréatique.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape du cycle de l'eau, sous l'effet du rayonnement solaire ?$$,
      'hint', $$L'eau se transforme en vapeur.$$,
      'expected', $$L'évaporation.$$
    ),
    jsonb_build_object(
      'question', $$Cite une action permettant de préserver l'eau au quotidien.$$,
      'hint', $$Pense à limiter la consommation ou la pollution.$$,
      'expected', $$Par exemple : éviter de gaspiller l'eau, ou éviter de la souiller (polluer).$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-homme-cycle-eau';
