-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3723: "Leçon 4_L'essai de problématisation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3723), resource id 37875.
-- Contenu réécrit à partir du PDF source (programme officiel MENET-FP).
-- Les brèves citations de Rabelais, Rousseau, Bergson, Marx, Voltaire,
-- Platon et Mounier sont des références philosophiques classiques du
-- domaine public, utilisées à des fins d'illustration pédagogique standard
-- (pratique courante en dissertation philosophique) ; explications
-- méthodologiques reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-essai-problematisation',
  '1ere',
  'A',
  'philosophie',
  $$L'essai de problématisation$$,
  4,
  '1ere-a-philo-conclusion-commentaire',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deux élèves de 1ère A discutent de l'essai de problématisation : l'un pense qu'il est synonyme de dissertation, l'autre soutient qu'il existe une nuance entre les deux. Pour trancher, la classe décide de faire des recherches sur l'essai de problématisation et de l'appliquer à un sujet.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et étapes de l'essai de problématisation$$,
        'body', $$L'essai de problématisation est un ensemble de techniques permettant de dégager le sens d'un sujet : c'est la phase préparatoire de la dissertation philosophique, distincte de la dissertation elle-même. Il comporte trois étapes : la compréhension du sujet, la problématisation du sujet, et la structuration des axes d'analyse.$$,
        'highlights', array[$$essai de problématisation = phase préparatoire de la dissertation (pas la dissertation elle-même)$$, $$3 étapes : compréhension → problématisation → structuration des axes$$]::text[],
        'fixation', jsonb_build_object('question', $$L'essai de problématisation est-il synonyme de dissertation philosophique ?$$, 'solution', $$Non, c'est la phase préparatoire de la dissertation, une étape distincte qui précède la rédaction du devoir complet.$$)
      ),
      jsonb_build_object(
        'heading', $$La compréhension du sujet$$,
        'body', $$Comprendre le sujet consiste à le lire attentivement pour en faire l'étude parcellaire et le reformuler. L'étude parcellaire recense et définit selon le contexte les mots et expressions essentiels du sujet — un mot ou une expression essentiel(le) étant indispensable à sa compréhension. La reformulation consiste, à partir de cette étude, à dire autrement le sujet pour le clarifier sans en altérer le sens.$$,
        'highlights', array[$$étude parcellaire : définir les termes essentiels selon le contexte$$, $$reformulation : dire autrement sans changer le sens$$]::text[],
        'example', jsonb_build_object('statement', $$Reformule le sujet « Doit-on condamner le progrès technique ? » à partir de l'étude parcellaire des termes essentiels (doit-on = a-t-on le droit, est-il raisonnable ; condamner = blâmer, désapprouver ; le progrès technique = les avancées de la technique).$$, 'solution', $$Faut-il blâmer les avancées de la technique ?$$),
        'fixation', jsonb_build_object('question', $$Quel est le but de la reformulation du sujet ?$$, 'solution', $$Dire autrement le sujet pour le clarifier, sans en altérer le sens initial.$$)
      ),
      jsonb_build_object(
        'heading', $$La problématisation du sujet et la structuration des axes$$,
        'body', $$La problématisation est le processus par lequel on dégage le problème (la difficulté intellectuelle liée au sujet, atteinte par une bonne reformulation) et ses aspects (des questions qui annoncent les axes d'analyse). Structurer les axes d'analyse revient à mettre en ordre les arguments : chaque axe est développé par plusieurs arguments, eux-mêmes appuyés par des références (auteurs, œuvres) ou des exemples concrets.$$,
        'highlights', array[$$problème = difficulté intellectuelle du sujet$$, $$aspects du problème → axes d'analyse → arguments (+ références/exemples)$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le sujet « Doit-on condamner le progrès technique ? », le problème dégagé est : la technique est-elle nuisible ? Quels sont les deux aspects (axes) possibles ?$$, 'solution', $$Aspect 1 : en quoi le progrès technique est-il facteur de développement (par exemple en médecine, transport, communication) ? Aspect 2 : le progrès technique ne suscite-t-il pas des inquiétudes (par exemple sur les manipulations génétiques, ou la dimension spirituelle de l'homme, comme le suggère Bergson : « Le corps a besoin d'un supplément d'âme ») ?$$),
        'fixation', jsonb_build_object('question', $$Que représentent les aspects du problème dans un essai de problématisation ?$$, 'solution', $$Ce sont des questions qui annoncent les axes d'analyse du sujet, chacun étant ensuite développé par des arguments.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'étude te sollicite pour préparer le devoir commun de 1ère sur l'essai de problématisation, à partir du sujet : « Le travail humanise-t-il ? »$$,
      'questions', array[
        $$Définis les termes essentiels du sujet (« travail » et « humanise »).$$,
        $$Reformule le sujet et dégage le problème qu'il pose.$$,
        $$Propose deux axes d'analyse opposés pour traiter ce sujet, chacun appuyé par au moins un argument.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien d'étapes comporte l'essai de problématisation ?$$,
      'hint', $$De la compréhension du sujet à la structuration des axes.$$,
      'expected', $$Trois étapes : la compréhension du sujet, la problématisation du sujet, et la structuration des axes d'analyse.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'étude parcellaire du sujet ?$$,
      'hint', $$Elle porte sur les mots-clés.$$,
      'expected', $$Le recensement et la définition, selon le contexte, des mots et expressions essentiels du sujet.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que le problème, dans l'essai de problématisation ?$$,
      'hint', $$C'est une difficulté.$$,
      'expected', $$La difficulté intellectuelle liée au sujet, à laquelle on accède par une bonne reformulation.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie « structurer les axes d'analyse » d'un sujet ?$$,
      'hint', $$Cela concerne l'organisation des arguments.$$,
      'expected', $$Mettre en ordre les arguments qui répondent aux différents aspects du problème.$$
    )
  ),
  now()
);
