-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3202: "PL3: Outils de l'argumentation Les connecteurs
-- logiques (1)" (https://lyc.ecole-ci.org/course/view.php?id=3202)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "3 PL 2nde Outils de l'argumentation Les connecteurs logiques (1).pdf"
-- (7 pages, séance 1 of Leçon 2: étudier les connecteurs logiques, using
-- the same "La télévision" support text as PL2).
-- Rewritten/paraphrased from the source PDF: the definition of logical
-- connectors, their grammatical classification (coordination/subordination),
-- their classification by logical value (cause, conséquence, opposition,
-- addition, condition, but, comparaison), and the distinction between
-- explicit and implicit connectors. 100% original wording; no sentence
-- copied from the source, and the source's evaluation text (about property
-- tax) was not reproduced verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl3-connecteurs-logiques',
  '2nde',
  'A',
  'francais',
  $$Les outils de l'argumentation : les connecteurs logiques$$,
  3,
  '2nde-a-fr-pl2-moyens-expression-opinion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Poursuivant leur travail sur les textes argumentatifs, les élèves de seconde remarquent que les idées d'un texte ne se suivent jamais par hasard : elles sont reliées entre elles par des mots ou par des indices plus discrets. Ils s'organisent pour étudier ces outils de liaison, appelés connecteurs logiques, afin de mieux comprendre l'enchaînement d'une argumentation et de mieux structurer leurs propres textes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définir les connecteurs logiques$$,
        'body', $$Les connecteurs logiques sont des adverbes ou des locutions adverbiales de liaison, des locutions conjonctives, des conjonctions de coordination et d'autres expressions qui permettent de relier ou d'enchaîner les idées entre elles dans une argumentation. Ils appartiennent à plusieurs classes grammaticales et jouent un rôle essentiel dans la cohérence d'un texte.$$,
        'highlights', array[$$connecteurs logiques$$, $$enchaîner les idées$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi servent les connecteurs logiques dans un texte argumentatif ?$$, 'solution', $$Ils permettent de relier et d'enchaîner les idées entre elles pour rendre l'argumentation cohérente.$$)
      ),
      jsonb_build_object(
        'heading', $$Le classement grammatical des connecteurs$$,
        'body', $$Les connecteurs logiques peuvent d'abord être classés selon leur nature grammaticale. Les conjonctions de coordination (mais, ou, et, donc, or, ni, car) relient deux mots, groupes de mots ou propositions de même niveau. Les conjonctions de subordination (bien que, pour que, au cas où, pourvu que, si, alors que, parce que...) sont internes à la phrase et introduisent une proposition subordonnée, généralement placée en tête ou à l'intérieur de la phrase.$$,
        'highlights', array[$$conjonctions de coordination$$, $$conjonctions de subordination$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « Il est absent aujourd'hui car il est malade », quelle est la nature du connecteur « car » ?$$, 'solution', $$C'est une conjonction de coordination : elle relie deux propositions de même niveau.$$),
        'fixation', jsonb_build_object('question', $$Cite deux conjonctions de coordination.$$, 'solution', $$Par exemple « mais » et « donc » (on peut aussi citer « ou », « et », « or », « ni », « car »).$$)
      ),
      jsonb_build_object(
        'heading', $$Le classement des connecteurs selon le rapport logique exprimé$$,
        'body', $$Au-delà de leur nature grammaticale, les connecteurs logiques se classent surtout selon le rapport de sens qu'ils expriment entre les idées : la cause, la conséquence, l'opposition ou la concession, l'addition, la condition ou l'hypothèse, le but, ou encore la comparaison. Reconnaître ce rapport est essentiel pour comprendre la progression d'une argumentation.$$,
        'highlights', array[$$rapport logique$$, $$cause$$, $$conséquence$$, $$opposition$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Rapport logique$$, $$Connecteurs fréquents$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cause$$, $$car, parce que, puisque, en effet$$),
            jsonb_build_array($$Conséquence$$, $$donc, de sorte que, si bien que, par conséquent, aussi, c'est pourquoi$$),
            jsonb_build_array($$Opposition / concession$$, $$pourtant, bien que, tandis que, toutefois, cependant, néanmoins, en revanche, au contraire, malgré tout$$),
            jsonb_build_array($$Addition$$, $$et, de même que, sans compter que, ainsi que, d'ailleurs, encore, de plus, quant à, de surcroît$$),
            jsonb_build_array($$Condition / hypothèse$$, $$si, au cas où, en cas de, à condition de, pourvu que$$),
            jsonb_build_array($$But$$, $$pour que, afin que, dans le but de$$),
            jsonb_build_array($$Comparaison$$, $$plus...que, aussi...que, comme$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans la phrase « Il pleut, par conséquent je ne viens pas », quel rapport logique exprime le connecteur souligné ?$$, 'solution', $$Le rapport de conséquence : la pluie est la cause, l'absence de venue en est le résultat.$$),
        'fixation', jsonb_build_object('question', $$Quel rapport logique exprime un connecteur comme « bien que » ou « tandis que » ?$$, 'solution', $$Un rapport d'opposition ou de concession.$$)
      ),
      jsonb_build_object(
        'heading', $$Connecteurs logiques explicites et implicites$$,
        'body', $$Lorsque le lien logique entre deux idées est marqué par un mot précis, on parle de connecteur logique explicite. Mais il existe aussi des connecteurs logiques implicites : dans ce cas, c'est le contexte qui permet de déduire le lien logique, sans qu'aucun mot ne l'exprime clairement. Trois indices permettent alors de reconstituer ce lien : la ponctuation (un point ou une virgule peuvent séparer deux idées qui restent logiquement liées, une parenthèse ou des deux-points peuvent introduire un exemple, une cause ou une conséquence), la disposition du texte (l'organisation en paragraphes révèle la progression de l'argumentation), et l'énonciation (les pronoms, les temps verbaux ou les termes appréciatifs peuvent souligner une relation logique sous-entendue).$$,
        'highlights', array[$$connecteurs explicites$$, $$connecteurs implicites$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels indices permettent de repérer un connecteur logique implicite ?$$, 'solution', $$La ponctuation, la disposition du texte en paragraphes, et les marques de l'énonciation (pronoms, temps verbaux, termes appréciatifs).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève écrit : « J'estime qu'il est utile de payer l'impôt foncier. D'une part, cela permet de préserver le patrimoine familial. D'autre part, une maison non déclarée reste reconnue par l'État. Ainsi, personne ne peut prétendre en être propriétaire légitime. En effet, celui qui ne paie pas son impôt, ou qui le paie en retard, est considéré comme un mauvais contribuable. Par ailleurs, ses biens peuvent être saisis. C'est pourquoi je pense que tout propriétaire devrait s'acquitter de ses impôts. »$$,
      'questions', array[
        $$Souligne tous les connecteurs logiques contenus dans ce texte.$$,
        $$Pour chaque connecteur relevé, précise le rapport logique qu'il exprime (cause, conséquence, addition, opposition...).$$,
        $$Indique si ces connecteurs sont plutôt des conjonctions de coordination ou des locutions adverbiales.$$,
        $$Réécris la dernière phrase du texte en remplaçant « c'est pourquoi » par un autre connecteur de conséquence, sans changer le sens.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un connecteur logique ?$$,
      'hint', $$Pense au rôle qu'il joue entre deux idées.$$,
      'expected', $$Un mot ou une expression qui relie ou enchaîne des idées dans une argumentation.$$
    ),
    jsonb_build_object(
      'question', $$Quel rapport logique exprime le connecteur « donc » ?$$,
      'hint', $$C'est le résultat d'un fait.$$,
      'expected', $$La conséquence.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de connecteur logique exprimant l'opposition.$$,
      'hint', $$Pense à un mot qui introduit une idée contraire.$$,
      'expected', $$Par exemple « pourtant », « cependant » ou « bien que ».$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un connecteur logique implicite ?$$,
      'hint', $$Il n'est pas exprimé par un mot précis.$$,
      'expected', $$C'est un lien logique que l'on déduit du contexte (ponctuation, disposition du texte, énonciation), sans qu'un mot ne l'exprime explicitement.$$
    )
  ),
  now()
);
