-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3730: "Leçon 1_La méthode de lecture de texte"
-- (https://lyc.ecole-ci.org/course/view.php?id=3730), resource id 37959.
-- Contenu réécrit à partir du PDF source (les quatre étapes de la méthode
-- de lecture de texte : explication littérale, problématique, explication
-- méthodique, critique). Les textes philosophiques cités (Épictète,
-- Maximes et Pensées ; René Descartes, Préface aux Principes de la
-- philosophie, 1644) sont des auteurs du domaine public (Épictète Ier-IIe
-- siècle ; Descartes mort en 1650) et sont donc reproduits directement,
-- comme dans le PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-methode-lecture-texte',
  '1ere',
  'C',
  'philosophie',
  $$La méthode de lecture de texte$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En début d'année scolaire, des élèves de 1ère du Lycée Moderne de Grand-Bassam découvrent dans leur programme la méthode de lecture de texte. En vue de la maîtriser, ils cherchent à la connaître et à l'appliquer à un texte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'explication littérale du texte$$,
        'body', $$La méthode de lecture de texte est un ensemble de techniques permettant de dégager le sens d'un texte, en quatre étapes : l'explication littérale, la problématique, l'explication méthodique, et la critique. L'explication littérale consiste, après avoir numéroté les lignes et lu le texte à plusieurs reprises, à recenser et définir les mots et expressions difficiles (qui exigent un effort de compréhension) et/ou essentiels (indispensables à la compréhension), toujours selon leur contexte ; puis à recenser les connecteurs logiques et déterminer leur fonction (cause, opposition, comparaison, addition, restriction, etc.).$$,
        'highlights', array[$$4 étapes : explication littérale, problématique, explication méthodique, critique$$, $$mot/expression difficile = exige un effort ; essentiel = indispensable à la compréhension$$, $$connecteurs logiques : assurent la cohérence et remplissent une fonction précise (cause, opposition...)$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le texte d'Épictète « Ayons donc de la propreté et de la décence », quelle est la fonction logique du connecteur « donc » ?$$, 'solution', $$Il exprime la conséquence : il tire une conclusion pratique de ce qui précède.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un mot « difficile » et un mot « essentiel » dans un texte ?$$, 'solution', $$Un mot difficile exige un effort de compréhension de la part du lecteur ; un mot essentiel est indispensable à la compréhension du texte (les deux catégories peuvent se recouper, mais ne sont pas identiques).$$)
      ),
      jsonb_build_object(
        'heading', $$La problématique du texte$$,
        'body', $$La problématique est l'ensemble des items dégagés par la grille de lecture : le thème (de quoi parle le texte, repéré par la fréquence des mots et les phrases-clés), le problème (la question à laquelle répond l'auteur), la thèse (la réponse de l'auteur), l'antithèse (le point de vue opposé), l'intention (l'objectif immédiat de l'auteur), l'enjeu (l'objectif lointain, l'intérêt du texte), et la structure logique (les différents mouvements du texte et leurs idées principales, repérés grâce aux connecteurs et à l'enchaînement des arguments).$$,
        'highlights', array[$$grille de lecture : thème, problème, thèse, antithèse, intention, enjeu, structure logique$$, $$thème = « de quoi parle le texte » ; thèse = « la réponse de l'auteur »$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le texte d'Épictète sur le philosophe malpropre, quelle est la thèse de l'auteur, repérée à partir de la phrase « Ayons donc de la propreté et de la décence » ?$$, 'solution', $$Le philosophe et son disciple doivent prendre soin de leur corps et de leur âme (allier propreté extérieure et beauté intérieure).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre l'intention et l'enjeu d'un texte ?$$, 'solution', $$L'intention est l'objectif immédiat et manifeste de l'auteur ; l'enjeu est son objectif plus lointain, la valeur ou l'intérêt plus général suscité par le texte.$$)
      ),
      jsonb_build_object(
        'heading', $$L'explication méthodique du texte$$,
        'body', $$L'explication méthodique consiste en la clarification ordonnée et cohérente des éléments suivants : les idées principales (les idées essentielles de chaque mouvement du texte), les idées secondaires (les arguments qui soutiennent l'idée principale), les illustrations (exemples, références ou données par lesquels l'auteur met en évidence son idée), les concepts (termes renvoyant à une ou plusieurs idées de l'auteur), et les allusions (sous-entendus ou présupposés non explicitement formulés).$$,
        'highlights', array[$$idée principale = idée essentielle d'un mouvement ; idée secondaire = argument qui la soutient$$, $$illustration = exemple/référence ; concept = terme porteur d'idée ; allusion = sous-entendu$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le texte d'Épictète, quelle idée secondaire soutient l'idée principale du premier mouvement (« la nécessité de la décence chez le philosophe et son disciple ») ?$$, 'solution', $$L'idée que le philosophe malpropre, identifié à un criminel, inspire répugnance chez celui qui l'écoute.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'une « allusion » dans un texte ?$$, 'solution', $$Un sous-entendu ou un présupposé, relatif à une personne ou une chose, qui n'est pas explicitement formulé dans le texte.$$)
      ),
      jsonb_build_object(
        'heading', $$La critique du texte$$,
        'body', $$La critique du texte est l'évaluation de son intérêt ; elle comporte deux parties. La critique interne consiste à apprécier le texte en lui-même, en examinant sa cohérence interne et la congruence entre le mode d'argumentation employé et l'intention de l'auteur. La critique externe consiste à examiner la position de l'auteur en la confrontant à celle d'autres auteurs, ainsi qu'au vécu ou à l'actualité.$$,
        'highlights', array[$$critique interne : cohérence du texte lui-même, argumentation vs intention$$, $$critique externe : confrontation avec d'autres auteurs et avec le vécu$$]::text[],
        'fixation', jsonb_build_object('question', $$Que fait-on lors de la critique externe d'un texte, par opposition à la critique interne ?$$, 'solution', $$On confronte la position de l'auteur à celle d'autres auteurs et au vécu, alors que la critique interne se limite à l'examen du texte en lui-même (sa cohérence propre).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À la fin de la leçon sur la méthode de lecture de texte, des élèves expriment des difficultés de compréhension face à ce texte de René Descartes : « J'aurais ensuite fait considérer l'utilité de cette philosophie, et montré que, puisqu'elle s'étend à tout ce que l'esprit humain peut savoir, on doit croire que c'est elle seule qui nous distingue des plus sauvages et barbares, et que chaque nation est d'autant plus civilisée et polie que les hommes y philosophent mieux ; et ainsi que c'est le plus grand bien qui puisse être dans un État que d'avoir de vrais philosophes. Et outre cela que, pour chaque homme en particulier, il n'est pas seulement utile de vivre avec ceux qui s'appliquent à cette étude, mais qu'il est incomparablement meilleur de s'y appliquer soi-même ; comme sans doute il vaut beaucoup mieux se servir de ses propres yeux pour se conduire, et jouir par même moyen de la beauté des couleurs et de la lumière, que non pas de les avoir fermés et suivre la conduite d'un autre ; mais ce dernier est encore meilleur que les tenir fermés et n'avoir que soi pour se conduire. Or, c'est proprement avoir les yeux fermés sans tâcher jamais de les ouvrir, que de vivre sans philosopher. » (René DESCARTES, Préface aux Principes de la philosophie, 1644)$$,
      'questions', array[
        $$Indique les fonctions de trois connecteurs logiques de ce texte.$$,
        $$Dégage la problématique de ce texte (thème, problème, thèse au minimum).$$,
        $$Évalue l'intérêt du texte (critique interne et/ou externe).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien d'étapes comprend la méthode de lecture de texte, et quelles sont-elles ?$$,
      'hint', $$Elles vont de l'explication des mots jusqu'à l'évaluation du texte.$$,
      'expected', $$Quatre étapes : l'explication littérale, la problématique du texte, l'explication méthodique du texte, et la critique du texte.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les sept items de la grille de lecture qui composent la problématique d'un texte ?$$,
      'hint', $$Ils vont du sujet général jusqu'à l'articulation logique du texte.$$,
      'expected', $$Le thème, le problème, la thèse, l'antithèse, l'intention, l'enjeu, et la structure logique.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un « concept », au sens de l'explication méthodique d'un texte ?$$,
      'hint', $$Ce n'est pas un simple mot, mais quelque chose de plus dense.$$,
      'expected', $$Un terme qui renvoie à une ou plusieurs idées de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux composantes de la critique d'un texte ?$$,
      'hint', $$L'une regarde le texte lui-même, l'autre le compare à l'extérieur.$$,
      'expected', $$La critique interne (cohérence du texte en lui-même) et la critique externe (confrontation à d'autres auteurs et au vécu).$$
    )
  ),
  now()
);
