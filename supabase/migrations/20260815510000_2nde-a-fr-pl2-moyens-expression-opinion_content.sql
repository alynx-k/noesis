-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3198: "PL2: Outils de l'argumentation Les moyens
-- d'expression d'une opinion (2)"
-- (https://lyc.ecole-ci.org/course/view.php?id=3198)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2 PL 2nde Outils de l'argumentation Les moyens d'expresion d'une
-- opinion (2).pdf" (4 pages, support text on television, extract credited
-- to Gilberte Niquet, "Structurer sa pensée structurer sa phrase").
-- Rewritten/paraphrased from the source PDF (Leçon 2 : les outils de
-- l'argumentation, séance 2 : les moyens d'expression d'une opinion): the
-- four families of tools used to express an opinion (modalisateurs, verbes
-- d'opinion, figures de style, adjectifs évaluatifs) with their definitions
-- and function. 100% original wording; no sentence copied from the source,
-- and the source's support text/exercises were not reproduced verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl2-moyens-expression-opinion',
  '2nde',
  'A',
  'francais',
  $$Les outils de l'argumentation : les moyens d'expression d'une opinion$$,
  2,
  '2nde-a-fr-pl1-fonctions-langage',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de la classe de seconde veulent renforcer leurs compétences en lecture et en production de textes argumentatifs, à l'oral comme à l'écrit. À partir d'un court texte dans lequel un auteur prend position sur les bienfaits et les limites de la télévision, ils s'exercent à identifier, à analyser puis à utiliser judicieusement les outils qui permettent d'exprimer une opinion.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définir les moyens d'expression d'une opinion$$,
        'body', $$Les moyens d'expression d'une opinion sont des outils d'argumentation dont se servent les locuteurs pour produire un texte argumentatif, dans le but de convaincre ou de persuader leurs interlocuteurs. On en distingue quatre grandes familles : les modalisateurs, les verbes d'opinion, les figures de style au service de la persuasion, et les adjectifs évaluatifs.$$,
        'highlights', array[$$moyens d'expression d'une opinion$$, $$convaincre$$, $$persuader$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Outil$$, $$Rôle dans l'expression de l'opinion$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Modalisateurs$$, $$Indiquent le degré d'adhésion du locuteur à ce qu'il énonce$$),
            jsonb_build_array($$Verbes d'opinion$$, $$Expriment directement la prise de position de l'auteur$$),
            jsonb_build_array($$Figures de style$$, $$Renforcent la force persuasive du discours$$),
            jsonb_build_array($$Adjectifs évaluatifs$$, $$Portent un jugement appréciatif sur l'objet dont on parle$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Dans quel but un locuteur utilise-t-il les moyens d'expression d'une opinion ?$$, 'solution', $$Pour convaincre ou persuader son interlocuteur en défendant un point de vue.$$)
      ),
      jsonb_build_object(
        'heading', $$Les modalisateurs$$,
        'body', $$Les modalisateurs sont des mots ou des expressions qui signalent le degré d'adhésion de celui qui s'exprime aux idées qu'il formule : ils indiquent si, pour lui, une idée est certaine, douteuse ou fausse. Ce sont notamment des adverbes (« certainement », « peut-être », « systématiquement », « volontiers ») qui laissent transparaître la présence de l'auteur derrière son propos.$$,
        'highlights', array[$$modalisateurs$$, $$degré d'adhésion$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « Je refuse volontiers de condamner systématiquement la télévision », quels modalisateurs révèlent la position de l'auteur ?$$, 'solution', $$Les adverbes « volontiers » et « systématiquement », qui montrent que l'auteur assume et nuance son propos.$$),
        'fixation', jsonb_build_object('question', $$À quoi servent les modalisateurs dans un texte argumentatif ?$$, 'solution', $$Ils indiquent le degré de certitude ou d'adhésion du locuteur par rapport à ce qu'il affirme.$$)
      ),
      jsonb_build_object(
        'heading', $$Les verbes d'opinion$$,
        'body', $$Les verbes d'opinion (« penser », « croire », « apprécier », « reconnaître », « refuser de condamner »...) expriment directement la prise de position de l'auteur en faveur ou en défaveur de l'objet dont il parle. Ils permettent au lecteur d'identifier sans ambiguïté le point de vue défendu.$$,
        'highlights', array[$$verbes d'opinion$$, $$prise de position$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux verbes d'opinion qui montrent qu'un auteur défend un point de vue favorable.$$, 'solution', $$Par exemple « apprécier » et « reconnaître » (les mérites de quelque chose).$$)
      ),
      jsonb_build_object(
        'heading', $$Les figures de style au service de la persuasion$$,
        'body', $$Certaines figures de style, comme l'hyperbole (l'exagération), permettent à l'auteur de renforcer le sens de son discours afin d'être plus convaincant. Elles sont utilisées pour amener les lecteurs qui doutent, voire ceux qui sont hostiles à la thèse défendue, à accepter plus facilement le point de vue exposé.$$,
        'highlights', array[$$figures de style$$, $$hyperbole$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi un auteur emploie-t-il une hyperbole dans un texte argumentatif ?$$, 'solution', $$Pour renforcer la force persuasive de son discours et mieux convaincre les lecteurs réticents.$$)
      ),
      jsonb_build_object(
        'heading', $$Les adjectifs évaluatifs$$,
        'body', $$Les adjectifs évaluatifs sont des adjectifs qualificatifs qui portent un jugement appréciatif, positif ou négatif, sur l'objet dont on parle (« positif », « agréable », « bénéfique », « incomparable »...). Ils permettent à l'auteur de démontrer, par un jugement de valeur, les qualités ou les avantages qu'il attribue au sujet traité.$$,
        'highlights', array[$$adjectifs évaluatifs$$, $$jugement appréciatif$$]::text[],
        'example', jsonb_build_object('statement', $$Dans l'expression « une invention bénéfique », quel outil d'expression de l'opinion est utilisé ?$$, 'solution', $$L'adjectif évaluatif « bénéfique », qui porte un jugement positif sur l'invention en question.$$),
        'fixation', jsonb_build_object('question', $$Que révèle l'emploi d'un adjectif évaluatif négatif dans un texte ?$$, 'solution', $$Il révèle un jugement défavorable de l'auteur sur l'objet ou l'idée dont il parle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève rédige un court texte pour donner son opinion sur le port de l'uniforme scolaire. Il écrit : « Je pense sincèrement que l'uniforme est une mesure bénéfique. Il évite systématiquement les comparaisons entre élèves et instaure une discipline agréable au sein de l'établissement. »$$,
      'questions', array[
        $$Relève dans ce texte un verbe d'opinion et explique ce qu'il révèle.$$,
        $$Relève un modalisateur et précise ce qu'il indique sur la position de l'auteur.$$,
        $$Relève deux adjectifs évaluatifs et dis si le jugement porté est positif ou négatif.$$,
        $$Explique, en une phrase, pourquoi ce texte peut être qualifié d'argumentatif.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel est le rôle des modalisateurs dans un texte argumentatif ?$$,
      'hint', $$Pense au degré de certitude exprimé par le locuteur.$$,
      'expected', $$Ils indiquent le degré d'adhésion du locuteur à ce qu'il affirme (certain, douteux, faux).$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de verbe d'opinion.$$,
      'hint', $$Un verbe qui exprime directement ce que pense l'auteur.$$,
      'expected', $$Par exemple « penser », « croire » ou « apprécier ».$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi utilise-t-on des figures de style comme l'hyperbole dans un texte argumentatif ?$$,
      'hint', $$Cela sert à renforcer un effet.$$,
      'expected', $$Pour renforcer la force persuasive du discours et mieux convaincre le lecteur.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un adjectif évaluatif ?$$,
      'hint', $$Il exprime un jugement de valeur.$$,
      'expected', $$Un adjectif qui porte un jugement appréciatif, positif ou négatif, sur ce dont on parle.$$
    )
  ),
  now()
);
