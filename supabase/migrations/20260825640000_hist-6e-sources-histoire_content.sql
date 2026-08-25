-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 2 : Les sources de l'histoire" (Thème 1 : Les bases de
-- l'étude de l'histoire). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club d'Histoire-Géographie d'un collège organise une visite au musée des civilisations et des arts de Grand-Bassam. Les élèves sont étonnés par l'abondance des vestiges et documents historiques exposés, datant du néolithique à la période avant l'indépendance. Organisés en groupes par leur professeur, ils cherchent à identifier les différentes sources de l'histoire, leur utilité, et les difficultés qui leur sont propres.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les quatre types de sources historiques$$,
        'body', $$Les sources de l'histoire sont un ensemble d'éléments qui permettent de reconstituer les faits passés. On en distingue quatre types. Les sources écrites (manuscrits, archives, livres d'histoire, textes religieux) transmettent les faits passés avec précision et ne changent pas avec le temps. Les sources orales (vieillards, sages, griots, contes, légendes) permettent aux peuples sans écriture de retracer leur passé par la parole. Les sources archéologiques ou muettes (objets, outils, ossements, monuments) sont datées au carbone 14 et analysées par des sciences comme la numismatique ou l'anthropologie. Les sources audio-visuelles (radio, télévision, internet, films) rendent le passé plus accessible et vivant.$$,
        'highlights', array[$$4 types : sources écrites, sources orales, sources archéologiques (muettes), sources audio-visuelles$$, $$datation des sources muettes : carbone 14$$]::text[],
        'fixation', jsonb_build_object('question', $$À quel type appartient un récit transmis par un griot ?$$, 'solution', $$Une source orale.$$)
      ),
      jsonb_build_object(
        'heading', $$Les difficultés liées aux sources$$,
        'body', $$Chaque type de source rencontre des difficultés propres. Les sources écrites sont peu nombreuses, coûteuses, et posent des problèmes de langue, de conservation et d'authenticité. Les sources orales souffrent de déformation, d'imprécision dans la datation et de subjectivité. Les sources muettes posent des problèmes de conservation (facteurs climatiques), d'interprétation, d'imprécision de datation, et le coût des fouilles est élevé. Les sources audio-visuelles ont des problèmes de conservation des supports (CD-Rom, cassettes) et peuvent déformer les faits.$$,
        'highlights', array[$$écrites : rares, coûteuses, langue, conservation, authenticité$$, $$orales : déformation, imprécision, subjectivité$$, $$muettes : climat, interprétation, coût des fouilles$$, $$audio-visuelles : conservation des supports, déformation$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la datation exacte d'un conte transmis oralement est-elle difficile ?$$, 'solution', $$Parce que les sources orales présentent une imprécision dans la datation des événements, en plus du risque de déformation au fil des générations.$$),
        'fixation', jsonb_build_object('question', $$Cite une difficulté propre aux sources archéologiques.$$, 'solution', $$Par exemple : le coût élevé des fouilles, ou la difficulté de conservation due aux facteurs climatiques.$$)
      ),
      jsonb_build_object(
        'heading', $$La nécessité de confronter les sources$$,
        'body', $$Les sources de l'histoire permettent de mieux reconstituer le passé de l'homme à partir des événements. Cependant, les informations qu'elles fournissent ne sont pas toujours fiables : il faut donc les confronter les unes aux autres pour aboutir à la vérité. Aucune source, prise isolément, n'est totalement suffisante pour reconstituer l'histoire d'un peuple.$$,
        'highlights', array[$$aucune source seule n'est suffisante → il faut confronter plusieurs sources$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi l'historien ne se contente-t-il pas d'une seule source ?$$, 'solution', $$Parce que chaque source a ses limites et ses difficultés ; les confronter permet d'aboutir à une vérité plus fiable.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux amis discutent des sources de l'histoire. Myriam affirme que les sources orales et audio-visuelles sont à éviter car elles sont souvent partiales et modifiables (comme les contes et légendes, qui ont plusieurs versions). Kacou lui répond que sans elles, on ne peut pas reconstituer l'histoire des peuples sans écriture. Myriam propose alors de se fier aux sources matérielles, mais Kacou objecte qu'elles sont peu nombreuses à cause de l'humidité des sols et du coût des fouilles.$$,
      'questions', array[
        $$Dis sur quoi porte la discussion entre Myriam et Kacou.$$,
        $$Relève dans la situation les difficultés liées aux sources de l'histoire évoquées.$$,
        $$Es-tu d'accord avec Myriam quand elle affirme que les sources orales et audio-visuelles sont partiales ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un vieux manuscrit conservé dans une bibliothèque est-il une source écrite, orale, muette ou audio-visuelle ?$$,
      'hint', $$C'est un document rédigé.$$,
      'expected', $$Une source écrite.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi les sources écrites sont-elles considérées comme fiables ?$$,
      'hint', $$Pense à ce qui ne change pas avec le temps.$$,
      'expected', $$Parce que les informations qu'elles contiennent ne changent pas avec le temps, contrairement à un récit oral qui peut se déformer.$$
    ),
    jsonb_build_object(
      'question', $$Quelle technique scientifique permet de dater les objets anciens retrouvés lors de fouilles ?$$,
      'hint', $$C'est une méthode utilisant un élément radioactif.$$,
      'expected', $$La datation au carbone 14.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi l'historien doit-il confronter plusieurs sources avant de conclure ?$$,
      'hint', $$Aucune source n'est parfaite.$$,
      'expected', $$Parce que chaque source présente des difficultés (subjectivité, imprécision, coût...) et qu'aucune n'est fiable à elle seule.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-sources-histoire';
