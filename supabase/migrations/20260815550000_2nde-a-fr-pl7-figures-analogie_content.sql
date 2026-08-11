-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3218: "PL7: FIGURES D'ANALOGIE (1)"
-- (https://lyc.ecole-ci.org/course/view.php?id=3218)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "7 PL 2nde FIGURES D'ANALOGIE (1).pdf" (4 pages, Leçon 5 : les figures de
-- style ou de la rhétorique, séance 1 : étudier les figures d'analogie et
-- de substitution).
-- Rewritten/paraphrased from the source PDF: the definitions of
-- comparaison, métaphore, personnification, métonymie, synecdoque,
-- périphrase and allégorie, each with an original illustrative example
-- inspired by the source's corpus (lamp/star, smoke/serpent, container/
-- content, walls/prison, national team/country). 100% original wording; no
-- sentence, and no literary quotation, copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl7-figures-analogie',
  '2nde',
  'A',
  'francais',
  $$Les figures de style : les figures d'analogie et de substitution$$,
  6,
  '2nde-a-fr-pl6-enonciation-indices-lexicaux',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club littéraire du lycée a invité un parolier-poète pour une prestation. Séduits par son art oratoire, les élèves de la classe de seconde A cherchent à comprendre les nombreuses images qu'il utilise dans ses textes. À partir d'une série de courtes phrases, ils s'organisent pour identifier les figures de style fondées sur la ressemblance ou sur le remplacement d'un mot par un autre, les analyser et les utiliser en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les figures de style : comparaison et métaphore$$,
        'body', $$Une figure de style est un procédé qui donne du relief à l'expression en jouant sur le sens ou la construction des mots. La comparaison rapproche deux éléments, un comparé et un comparant, à l'aide d'un outil de comparaison (« comme », « tel que », « ressembler à ») qui indique le point commun, ou similitude, entre les deux. La métaphore, elle, est une comparaison sans outil de comparaison : les termes y sont pris au sens figuré, sans mot de liaison visible.$$,
        'highlights', array[$$comparaison$$, $$métaphore$$, $$comparé$$, $$comparant$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Figure$$, $$Comparé$$, $$Comparant$$, $$Point commun$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Comparaison (« La lampe brille comme une étoile »)$$, $$La lampe$$, $$L'étoile$$, $$La brillance, marquée par « comme »$$),
            jsonb_build_array($$Métaphore (« Un gros serpent de fumée noire »)$$, $$La fumée noire$$, $$Le serpent$$, $$La démarche ondulée, non marquée par un outil$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle est la différence essentielle entre la comparaison et la métaphore ?$$, 'solution', $$La comparaison utilise un outil de comparaison (« comme »...), alors que la métaphore rapproche les deux termes sans outil, au sens figuré.$$)
      ),
      jsonb_build_object(
        'heading', $$La personnification$$,
        'body', $$La personnification présente une chose ou une idée sous les traits d'une personne, en lui prêtant des comportements ou des sentiments humains.$$,
        'highlights', array[$$personnification$$]::text[],
        'example', jsonb_build_object('statement', $$Dans une phrase où l'on dit que « la nature revit sans cesse » ou que « la forêt gémit sous le vent », quelle figure de style reconnaît-on ?$$, 'solution', $$La personnification : la nature et la forêt sont présentées comme capables de revivre ou de gémir, des comportements propres à une personne.$$),
        'fixation', jsonb_build_object('question', $$Que fait la personnification ?$$, 'solution', $$Elle présente une chose ou une idée sous les traits d'une personne.$$)
      ),
      jsonb_build_object(
        'heading', $$La métonymie et la synecdoque$$,
        'body', $$La métonymie est une figure de style qui remplace un mot par un autre mot qui lui est logiquement associé (le contenant pour le contenu, la cause pour l'effet...). La synecdoque est une variété particulière de métonymie : elle donne à un mot un sens plus large ou plus restreint qu'à l'habitude, en désignant la partie pour le tout, la matière pour l'objet, ou le particulier pour le général.$$,
        'highlights', array[$$métonymie$$, $$synecdoque$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Exemple$$, $$Figure$$, $$Lien de proximité$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$« Boire un verre »$$, $$Métonymie$$, $$Le contenant (le verre) remplace le contenu (le liquide)$$),
            jsonb_build_array($$« Je quitterai bientôt ses murs »$$, $$Synecdoque$$, $$La partie (les murs) remplace le tout (la prison, la maison)$$),
            jsonb_build_array($$« La Côte d'Ivoire a gagné 2 à 0 »$$, $$Synecdoque$$, $$Le pays (le particulier) remplace son équipe nationale (le général)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Quelle figure de style reconnaît-on dans l'expression « boire un verre » ?$$, 'solution', $$Une métonymie : le contenant (le verre) désigne en réalité son contenu (la boisson).$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce que la synecdoque ?$$, 'solution', $$Une variété de métonymie qui donne à un mot un sens plus large ou plus restreint, en désignant la partie pour le tout, la matière pour l'objet ou le particulier pour le général.$$)
      ),
      jsonb_build_object(
        'heading', $$La périphrase et l'allégorie$$,
        'body', $$La périphrase remplace un mot par une expression qui le définit : un simple mot est ainsi remplacé par des éléments de phrase plus complexes, jouant sur l'implicite (par exemple désigner un chef d'État par le nom du palais où il exerce). L'allégorie, elle, représente une idée abstraite (la justice, la mort, la liberté...) sous la forme d'un personnage ou d'une image concrète, comme une femme aux yeux bandés tenant une balance pour symboliser la justice.$$,
        'highlights', array[$$périphrase$$, $$allégorie$$]::text[],
        'fixation', jsonb_build_object('question', $$Que représente une allégorie de la justice sous la forme d'une femme aux yeux bandés tenant une balance ?$$, 'solution', $$Elle représente, sous une image concrète, l'idée abstraite de justice (impartialité et équilibre).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un poète ivoirien écrit : « Le vieux baobab du village a vu grandir des générations d'enfants. Il berce leurs souvenirs comme une mère berce son nourrisson. Aujourd'hui encore, tout le village se rassemble sous son ombre, et l'on dit que ses racines parlent aux ancêtres. »$$,
      'questions', array[
        $$Relève une comparaison dans ce texte et précise le comparé, le comparant et l'outil de comparaison.$$,
        $$Relève un exemple de personnification et explique l'effet produit.$$,
        $$« Tout le village se rassemble » : quelle figure de style permet de désigner ainsi les habitants ? Justifie.$$,
        $$Propose une métaphore originale pour décrire le même baobab.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qui distingue la métaphore de la comparaison ?$$,
      'hint', $$L'une utilise un outil de comparaison, l'autre non.$$,
      'expected', $$La métaphore ne comporte pas d'outil de comparaison, contrairement à la comparaison.$$
    ),
    jsonb_build_object(
      'question', $$Quelle figure de style consiste à donner des traits humains à une chose ou une idée ?$$,
      'hint', $$Elle « personnifie » l'objet.$$,
      'expected', $$La personnification.$$
    ),
    jsonb_build_object(
      'question', $$Dans « boire un verre », quelle figure de style est utilisée ?$$,
      'hint', $$On désigne le contenu par le contenant.$$,
      'expected', $$Une métonymie.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une allégorie ?$$,
      'hint', $$Pense à la représentation de la justice.$$,
      'expected', $$Une figure qui représente une idée abstraite sous la forme d'un personnage ou d'une image concrète.$$
    )
  ),
  now()
);
