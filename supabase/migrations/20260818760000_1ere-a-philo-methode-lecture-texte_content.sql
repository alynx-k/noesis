-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3720: "Leçon 1_La méthode de lecture de texte"
-- (https://lyc.ecole-ci.org/course/view.php?id=3720), resource id 37839.
-- Contenu réécrit à partir du PDF source (programme officiel MENET-FP,
-- méthode de lecture de texte philosophique). Les citations d'Épictète,
-- Descartes et Pascal sont des textes philosophiques du domaine public,
-- utilisées ici à des fins d'analyse pédagogique (pratique standard en
-- philosophie) ; explications méthodologiques reformulées, non copiées
-- verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-methode-lecture-texte',
  '1ere',
  'A',
  'philosophie',
  $$La méthode de lecture de texte$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En début d'année scolaire, des élèves de 1ère A découvrent dans leur programme la méthode de lecture de texte philosophique. Pour la maîtriser, ils cherchent à en connaître les étapes et à l'appliquer à un texte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Présentation générale et l'explication littérale$$,
        'body', $$La méthode de lecture de texte est un ensemble de techniques permettant de dégager le sens d'un texte philosophique. Elle comprend quatre étapes : l'explication littérale, la problématique, l'explication méthodique et la critique du texte. L'explication littérale consiste, après avoir numéroté les lignes et lu le texte plusieurs fois, à recenser et définir les mots et expressions difficiles ou essentiels selon leur contexte, puis à recenser les connecteurs logiques et déterminer leur fonction (opposition, cause, conséquence, etc.).$$,
        'highlights', array[$$4 étapes : explication littérale → problématique → explication méthodique → critique$$, $$mot/expression difficile : exige un effort de compréhension$$, $$mot/expression essentiel : indispensable à la compréhension$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le texte d'Épictète « Ayons donc de la propreté et de la décence », quelle est la fonction du connecteur « donc » ?$$, 'solution', $$« Donc » exprime la conséquence : il introduit la conclusion tirée du raisonnement précédent (l'exemple du philosophe malpropre qui n'attire pas).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un mot difficile et un mot essentiel dans un texte ?$$, 'solution', $$Un mot difficile exige un effort de compréhension de la part du lecteur, tandis qu'un mot essentiel est indispensable à la compréhension globale du texte — un même mot peut être les deux à la fois, ou ni l'un ni l'autre.$$)
      ),
      jsonb_build_object(
        'heading', $$La problématique du texte : la grille de lecture$$,
        'body', $$La problématique est l'ensemble constitué des items de la grille de lecture, un questionnaire permettant de dégager : le thème (de quoi parle le texte), le problème (la question à laquelle l'auteur répond), la thèse (la réponse de l'auteur), l'antithèse (le point de vue opposé), l'intention (l'objectif immédiat de l'auteur), l'enjeu (l'intérêt du texte) et la structure logique (les différents mouvements du texte).$$,
        'highlights', array[$$thème → problème → thèse / antithèse → intention → enjeu → structure logique$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Item', 'Question associée', 'Indices de repérage']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Thème$$, $$De quoi parle le texte ?$$, $$Fréquence des mots, phrases-clés, exemples significatifs$$),
            jsonb_build_array($$Problème$$, $$À quelle question répond l'auteur ?$$, $$Thème, thèse, antithèse, arguments$$),
            jsonb_build_array($$Thèse$$, $$Quelle est la réponse de l'auteur ?$$, $$Phrases principales, arguments, locutions d'opinion$$),
            jsonb_build_array($$Antithèse$$, $$Quelle est la position contraire ?$$, $$Connecteurs d'opposition, expressions de négation$$),
            jsonb_build_array($$Intention$$, $$Quel est l'objectif immédiat de l'auteur ?$$, $$Vocabulaire, argumentation, nature du texte$$),
            jsonb_build_array($$Enjeu$$, $$Quel est l'intérêt du texte ?$$, $$Thème, thèse, intention$$),
            jsonb_build_array($$Structure logique$$, $$Quelles sont les articulations du texte ?$$, $$Connecteurs logiques, mode d'enchaînement des arguments$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Dans le texte d'Épictète sur le philosophe malpropre, quelle est la thèse défendue par l'auteur ?$$, 'solution', $$Le philosophe et son disciple doivent prendre soin de leur corps et de leur âme (« Ayons donc de la propreté et de la décence »).$$)
      ),
      jsonb_build_object(
        'heading', $$L'explication méthodique du texte$$,
        'body', $$L'explication méthodique consiste en la clarification ordonnée des idées du texte. Les idées principales sont les idées essentielles de chaque mouvement du texte ; les idées secondaires sont les arguments qui les soutiennent. Les illustrations sont les exemples ou références par lesquels l'auteur met en évidence son idée. Les concepts sont les termes qui renvoient à une ou plusieurs idées de l'auteur. Les allusions sont des sous-entendus non explicitement formulés.$$,
        'highlights', array[$$idée principale (par mouvement) → idées secondaires (arguments) → illustrations$$, $$concepts (termes-idées) vs allusions (sous-entendus)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre une idée principale et une idée secondaire ?$$, 'solution', $$L'idée principale est l'idée essentielle d'un mouvement du texte, tandis que les idées secondaires sont les arguments qui viennent la soutenir et l'étayer.$$)
      ),
      jsonb_build_object(
        'heading', $$La critique du texte$$,
        'body', $$La critique du texte est l'évaluation de son intérêt. Elle comporte deux volets : la critique interne, qui apprécie le texte en lui-même en examinant sa cohérence et la congruence entre le mode d'argumentation et l'intention de l'auteur ; et la critique externe, qui confronte la position de l'auteur à celle d'autres auteurs et au vécu du lecteur.$$,
        'highlights', array[$$critique interne : cohérence du texte lui-même$$, $$critique externe : confrontation à d'autres auteurs et au vécu$$]::text[],
        'fixation', jsonb_build_object('question', $$Que consiste à faire la critique externe d'un texte ?$$, 'solution', $$Examiner la position de l'auteur en la confrontant à celle d'autres auteurs et à l'expérience vécue du lecteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves de 1ère A expriment des difficultés de compréhension à la fin de la leçon. Ils te soumettent ce texte de René Descartes : « J'aurais ensuite fait considérer l'utilité de cette philosophie, et montré que, puisqu'elle s'étend à tout ce que l'esprit humain peut savoir, on doit croire que c'est elle seule qui nous distingue des plus sauvages et barbares (...) Or, c'est proprement avoir les yeux fermés sans tâcher jamais de les ouvrir, que de vivre sans philosopher. » (Préface aux principes de la philosophie, 1644)$$,
      'questions', array[
        $$Indique les fonctions de trois connecteurs logiques de ce texte.$$,
        $$Dégage la problématique de ce texte (thème, problème, thèse).$$,
        $$Évalue l'intérêt de ce texte (critique interne et externe).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien d'étapes comporte la méthode de lecture de texte, et quelles sont-elles ?$$,
      'hint', $$De l'explication littérale à la critique.$$,
      'expected', $$Quatre étapes : l'explication littérale, la problématique du texte, l'explication méthodique du texte, et la critique du texte.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la grille de lecture permet de dégager ?$$,
      'hint', $$C'est un questionnaire en sept items.$$,
      'expected', $$Le thème, le problème, la thèse, l'antithèse, l'intention, l'enjeu et la structure logique du texte.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une idée secondaire, dans l'explication méthodique d'un texte ?$$,
      'hint', $$Elle soutient une autre idée.$$,
      'expected', $$Un argument, c'est-à-dire une idée qui soutient l'idée principale d'un mouvement du texte.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre la critique interne et la critique externe d'un texte ?$$,
      'hint', $$L'une regarde le texte seul, l'autre le compare à autre chose.$$,
      'expected', $$La critique interne examine la cohérence du texte en lui-même ; la critique externe confronte la position de l'auteur à celle d'autres auteurs et au vécu du lecteur.$$
    )
  ),
  now()
);
