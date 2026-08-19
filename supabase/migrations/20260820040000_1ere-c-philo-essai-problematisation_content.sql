-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3733: "Leçon 4_L'essai de problématisation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3733), resource id 37995.
-- Contenu réécrit à partir du PDF source (compréhension du sujet,
-- problématisation, structuration des axes d'analyse). Les citations
-- philosophiques mentionnées (Platon, Descartes, Rabelais, Rousseau,
-- Bergson, Marx, Voltaire, Mounier) sont des auteurs classiques cités
-- brièvement à titre de référence illustrative, comme dans le PDF source ;
-- toutes sont des figures ou œuvres reconnues du corpus philosophique
-- standard enseigné en Côte d'Ivoire.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-essai-problematisation',
  '1ere',
  'C',
  'philosophie',
  $$L'essai de problématisation$$,
  4,
  '1ere-c-philo-conclusion-commentaire-texte',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$De retour des congés de Noël, en parcourant leur cahier d'activités de philosophie, une discussion s'engage entre deux élèves de 1ère au sujet de l'essai de problématisation. L'un soutient qu'il est synonyme de dissertation, l'autre affirme au contraire qu'il y a une nuance entre les deux. Pour être situés, les élèves de la classe décident de faire des recherches sur l'essai de problématisation et de l'appliquer à un sujet.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et compréhension du sujet$$,
        'body', $$L'essai de problématisation est un ensemble de techniques permettant de dégager le sens d'un sujet ; c'est la phase préparatoire de la dissertation philosophique, comportant trois étapes : la compréhension du sujet, la problématisation, et la structuration des axes d'analyse. La compréhension du sujet consiste, après une lecture attentive, à en faire l'étude parcellaire (recenser et définir, selon le contexte, les mots et expressions essentiels — indispensables à la compréhension), puis à le reformuler (dire autrement le sujet pour le clarifier, sans en altérer le sens initial).$$,
        'highlights', array[$$essai de problématisation = phase préparatoire de la dissertation, 3 étapes$$, $$étude parcellaire : mots/expressions essentiels, définis selon le contexte$$, $$reformulation : dire autrement le sujet, sans en changer le sens$$]::text[],
        'example', jsonb_build_object('statement', $$Comment reformuler le sujet « Doit-on condamner le progrès technique ? » ?$$, 'solution', $$« Faut-il blâmer les avancées de la technique ? » (le sens est préservé, mais les termes sont clarifiés à partir de leur définition contextuelle).$$),
        'fixation', jsonb_build_object('question', $$Que ne faut-il surtout pas faire lors de la reformulation d'un sujet ?$$, 'solution', $$Altérer son sens initial : la reformulation doit clarifier, non transformer, le sens du sujet.$$)
      ),
      jsonb_build_object(
        'heading', $$La problématisation du sujet$$,
        'body', $$La problématisation est le processus par lequel on parvient à dégager le problème et ses aspects. Le problème est la difficulté intellectuelle liée au sujet ; on y accède par une bonne reformulation du sujet. Les aspects du problème sont des questions qui annoncent les axes d'analyse à venir.$$,
        'highlights', array[$$problème = difficulté intellectuelle liée au sujet, dégagée via la reformulation$$, $$aspects du problème = questions annonçant les axes d'analyse$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le sujet « Doit-on condamner le progrès technique ? », quel problème et quels aspects peut-on dégager ?$$, 'solution', $$Problème : « La technique est-elle nuisible ? ». Aspect 1 : « En quoi le progrès technique est-il facteur de développement ? ». Aspect 2 : « Le progrès technique ne suscite-t-il pas des inquiétudes ? ».$$),
        'fixation', jsonb_build_object('question', $$Comment accède-t-on au problème d'un sujet ?$$, 'solution', $$Par une bonne reformulation du sujet.$$)
      ),
      jsonb_build_object(
        'heading', $$La structuration des axes d'analyse$$,
        'body', $$Structurer les axes d'analyse du sujet revient à mettre en ordre les arguments, en les regroupant sous des axes correspondant chacun à un aspect du problème dégagé. Chaque axe comporte généralement plusieurs arguments, eux-mêmes appuyés par des exemples, des références à des auteurs, ou des citations qui les illustrent.$$,
        'highlights', array[$$axe d'analyse = regroupement ordonné d'arguments répondant à un aspect du problème$$, $$chaque argument peut être appuyé par un exemple, une référence ou une citation$$]::text[],
        'example', jsonb_build_object('statement', $$Pour l'axe « Le progrès technique suscite des inquiétudes », quel argument peut-on avancer, avec une référence à l'appui ?$$, 'solution', $$Argument : « Le progrès technique a perverti les mœurs », illustré par la citation de François Rabelais dans Pantagruel : « Science sans conscience n'est que ruine de l'âme ».$$),
        'fixation', jsonb_build_object('question', $$À quoi correspond, en général, chaque axe d'analyse d'un sujet ?$$, 'solution', $$À un aspect du problème dégagé lors de la problématisation.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple complet : « Doit-on condamner le progrès technique ? »$$,
        'body', $$Ce sujet, une fois problématisé, se structure en deux axes. Axe 1 (le progrès technique est facteur de développement) : argument 1 — il a conféré à l'homme un pouvoir sur la nature (référence au mythe de Prométhée dans le Protagoras de Platon, et à Descartes, Discours de la méthode, VIe partie) ; argument 2 — il améliore les conditions de vie (médecine, transport, communication). Axe 2 (le progrès technique suscite des inquiétudes) : argument 1 — il a perverti les mœurs (Rabelais, Rousseau, Discours sur les sciences et les arts) ; argument 2 — il a entraîné des risques liés aux manipulations génétiques (clonage, OGM) ; argument 3 — il a nié la dimension spirituelle de l'homme (Bergson, Les deux sources de la morale et de la religion : « le corps a besoin d'un supplément d'âme »).$$,
        'highlights', array[$$axe 1 : progrès technique = développement (pouvoir sur la nature, amélioration des conditions de vie)$$, $$axe 2 : progrès technique = inquiétudes (mœurs, manipulations génétiques, dimension spirituelle)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel philosophe est cité pour illustrer l'idée que le progrès technique nie la dimension spirituelle de l'homme ?$$, 'solution', $$Henri Bergson, avec la citation « Le corps a besoin d'un supplément d'âme » (Les deux sources de la morale et de la religion).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le cadre de la préparation du devoir commun de 1ère portant sur l'essai de problématisation, les membres d'un groupe d'étude te sollicitent pour les aider avec ce sujet : « Le travail humanise-t-il ? »$$,
      'questions', array[
        $$Définis les termes essentiels du sujet (travail, humanise).$$,
        $$Reformule le sujet, puis dégage le problème qu'il soulève.$$,
        $$Structure au moins deux axes d'analyse avec leurs arguments (tu peux t'appuyer sur des auteurs comme Karl Marx, Voltaire ou Platon pour les illustrer).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien d'étapes comporte l'essai de problématisation, et quelles sont-elles ?$$,
      'hint', $$Elles vont de la lecture du sujet jusqu'à l'organisation des arguments.$$,
      'expected', $$Trois étapes : la compréhension du sujet, la problématisation du sujet, et la structuration des axes d'analyse du sujet.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'étude parcellaire d'un sujet ?$$,
      'hint', $$Elle porte sur le vocabulaire du sujet, pas sur son sens global.$$,
      'expected', $$Le fait de recenser et de définir, selon le contexte, les mots et expressions essentiels du sujet.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on le « problème » dans l'essai de problématisation ?$$,
      'hint', $$C'est une notion abstraite liée à la difficulté du sujet.$$,
      'expected', $$La difficulté intellectuelle liée au sujet, à laquelle on accède par une bonne reformulation.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie « structurer les axes d'analyse » d'un sujet ?$$,
      'hint', $$C'est une opération d'organisation.$$,
      'expected', $$Mettre en ordre les arguments, généralement regroupés selon les différents aspects du problème dégagés lors de la problématisation.$$
    )
  ),
  now()
);
