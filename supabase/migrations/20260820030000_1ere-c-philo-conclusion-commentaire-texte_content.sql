-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3732: "Leçon 3_La conclusion du commentaire de texte
-- philosophique" (https://lyc.ecole-ci.org/course/view.php?id=3732),
-- resource id 37983. Contenu réécrit à partir du PDF source (définition,
-- éléments constitutifs et construction de la conclusion du commentaire
-- de texte philosophique). Les textes philosophiques cités (Épictète,
-- Maximes et Pensées ; Blaise Pascal, Pensées) sont des auteurs du domaine
-- public (Épictète Ier-IIe siècle ; Pascal mort en 1662) et sont donc
-- reproduits directement, comme dans le PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-conclusion-commentaire-texte',
  '1ere',
  'C',
  'philosophie',
  $$La conclusion du commentaire de texte philosophique$$,
  3,
  '1ere-c-philo-introduction-commentaire-texte',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 1ère, après la rédaction de l'introduction du commentaire de texte philosophique, sont informés qu'ils auront à rédiger une conclusion. Ils prennent l'initiative d'effectuer des recherches sur les éléments constitutifs de la conclusion, la manière de les agencer et de la construire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de la conclusion du commentaire de texte$$,
        'body', $$La conclusion est la dernière partie du devoir. Elle consiste en une prise de position par rapport à l'intérêt du texte. Cette prise de position doit être précédée du bilan du débat engagé au niveau de la critique externe (menée plus tôt dans le devoir, en confrontant la position de l'auteur à d'autres points de vue).$$,
        'highlights', array[$$conclusion = dernière partie du devoir$$, $$prise de position sur l'intérêt du texte, précédée d'un bilan du débat de la critique externe$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit-on faire avant de formuler sa prise de position personnelle dans la conclusion ?$$, 'solution', $$Faire le bilan du débat engagé au niveau de la critique externe.$$)
      ),
      jsonb_build_object(
        'heading', $$Les éléments constitutifs de la conclusion$$,
        'body', $$Les éléments essentiels de la conclusion sont au nombre de deux : le bilan de la discussion (récapitulatif synthétique du débat mené dans la critique externe, opposant la position de l'auteur à d'autres points de vue) et la prise de position personnelle (l'avis argumenté du rédacteur sur la question posée par le texte).$$,
        'highlights', array[$$2 éléments essentiels : bilan de la discussion + prise de position personnelle$$, $$ni le rappel du thème/problème, ni une simple reformulation de la thèse, ne suffisent$$]::text[],
        'fixation', jsonb_build_object('question', $$Un simple rappel du thème et de la thèse de l'auteur, sans bilan ni avis personnel, constitue-t-il une conclusion correcte ?$$, 'solution', $$Non : la conclusion exige impérativement le bilan de la discussion et une prise de position personnelle, pas seulement un rappel des éléments déjà présentés dans l'introduction.$$)
      ),
      jsonb_build_object(
        'heading', $$La construction de la conclusion$$,
        'body', $$Construire la conclusion consiste à agencer de manière cohérente le bilan de la discussion et la prise de position personnelle. Il est conseillé de la commencer par des expressions comme « en définitive », « au terme de notre travail », « en somme », pour signaler au lecteur qu'on est parvenu à la fin du devoir.$$,
        'highlights', array[$$agencement : bilan de la discussion → prise de position personnelle$$, $$formules d'ouverture conseillées : « en définitive », « au terme de notre travail », « en somme »$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le texte d'Épictète sur le philosophe et son disciple, comment s'articule une conclusion correcte ?$$, 'solution', $$« En définitive, si pour Épictète et certains moralistes de l'Antiquité le philosophe et son disciple doivent observer la propreté et la décence en vue d'améliorer leur statut social, pour d'autres penseurs tels que les cyniques, la beauté corporelle est inessentielle pour le philosophe. Au demeurant, à notre sens, la propreté du corps va de pair avec celle de l'esprit. » — on y retrouve le bilan du débat (Épictète contre les cyniques) suivi d'une prise de position personnelle.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi conseille-t-on de commencer la conclusion par une expression comme « en définitive » ?$$, 'solution', $$Pour signaler clairement au lecteur qu'on est arrivé à la dernière étape du devoir.$$)
      ),
      jsonb_build_object(
        'heading', $$Une conclusion réussie n'est pas une ouverture$$,
        'body', $$Contrairement à d'autres exercices, la conclusion du commentaire de texte philosophique ne doit pas se contenter d'ouvrir le débat sans y répondre : elle doit trancher, à travers une prise de position personnelle claire, tout en restant fidèle au bilan objectif du débat qui la précède. Elle ne doit pas non plus introduire de nouveaux éléments qui n'ont pas été discutés auparavant dans le devoir.$$,
        'highlights', array[$$la conclusion tranche : elle ne se contente pas d'ouvrir le débat sans trancher$$, $$aucun élément nouveau, non discuté avant, ne doit apparaître dans la conclusion$$]::text[],
        'fixation', jsonb_build_object('question', $$Est-il correct de simplement ouvrir le débat, sans prendre position, à la fin d'un commentaire de texte philosophique ?$$, 'solution', $$Non : la conclusion doit comporter une véritable prise de position personnelle, et non se limiter à une ouverture du débat sans réponse.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le cadre d'un devoir de classe, ce texte est proposé : « La grandeur de l'homme est grande en ce qu'il se connaît misérable. Un arbre ne se connaît pas misérable. C'est donc être misérable que de se connaître misérable. La pensée fait la grandeur de l'homme. Je puis concevoir un homme sans mains, pieds, tête (car ce n'est que l'expérience qui nous apprend que la tête est plus nécessaire que les pieds) ; mais je ne puis concevoir l'homme sans pensée : ce serait une pierre ou une brute (…). L'homme n'est qu'un roseau, le plus faible de la nature ; mais c'est un roseau pensant. Il ne faut pas que l'univers s'arme pour l'écraser : une vapeur, une goutte d'eau, suffit pour le tuer. Mais quand l'univers l'écraserait, l'homme serait encore plus noble que ce qui le tue, parce qu'il sait penser. C'est de là qu'il nous faut relever et non de l'espace et de la durée, que nous ne saurions remplir. Travaillons donc à bien penser : voilà le principe de la morale. » (Blaise PASCAL, Pensées, 1670)$$,
      'questions', array[
        $$Dégage les éléments de la problématique destinés à la rédaction de la conclusion du commentaire de texte philosophique (bilan possible de la réflexion).$$,
        $$Formule une position personnelle argumentée par rapport à la thèse de Pascal (la pensée comme grandeur de l'homme).$$,
        $$Rédige la conclusion complète en agençant le bilan et la position personnelle.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la dernière partie d'un devoir de commentaire de texte philosophique ?$$,
      'hint', $$C'est là que l'on conclut.$$,
      'expected', $$La conclusion.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les deux éléments constitutifs essentiels de la conclusion ?$$,
      'hint', $$L'un récapitule, l'autre tranche.$$,
      'expected', $$Le bilan de la discussion et la prise de position personnelle.$$
    ),
    jsonb_build_object(
      'question', $$Cite une expression conseillée pour commencer la conclusion d'un commentaire de texte philosophique.$$,
      'hint', $$Elle indique qu'on est à la fin du travail.$$,
      'expected', $$« En définitive » (ou « au terme de notre travail », ou « en somme »).$$
    ),
    jsonb_build_object(
      'question', $$Une conclusion doit-elle se limiter à ouvrir le débat sans y répondre ?$$,
      'hint', $$Ce serait rester en suspens.$$,
      'expected', $$Non, elle doit comporter une véritable prise de position personnelle qui tranche le débat, précédée d'un bilan.$$
    )
  ),
  now()
);
