-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2322: "EE 7: Dissert_littér_Rédiger_partie_dvpment"
-- (https://lyc.ecole-ci.org/course/view.php?id=2322), resource id 21270.
-- Content is methodological (composantes du paragraphe argumentatif, types
-- de raisonnement) illustrated by real published works and authors, cited
-- only by title/author/theme as factual literary references (standard
-- bibliographic/example use), not reproduced in their content.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-dissertation-rediger-developpement',
  '1ere',
  'C',
  'francais',
  $$La dissertation littéraire : rédiger une partie du développement$$,
  7,
  '1ere-c-francais-dissertation-elaborer-plan',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir élaboré le plan détaillé du sujet « Toute littérature participe d'une civilisation... » (Roger Caillois), les élèves de 1ère doivent maintenant rédiger entièrement une partie du développement de leur dissertation littéraire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les composantes du paragraphe argumentatif$$,
        'body', $$Le développement est une succession de paragraphes argumentatifs. Un paragraphe argumentatif est une sous-partie du développement, constituée d'une idée et signalée par la mise en page. Chaque paragraphe doit comporter : une phrase présentant l'idée directrice (si l'on passe à une autre idée directrice, il faut changer de paragraphe) ; des arguments qui développent l'idée directrice, reliés par des connecteurs logiques (d'abord, aussi, ensuite, en outre, par ailleurs, enfin...) ; des exemples qui illustrent l'argument et lui confèrent une dimension concrète.$$,
        'highlights', array[$$paragraphe argumentatif = idée directrice + arguments (reliés par connecteurs) + exemples$$, $$changement d'idée directrice ⟹ changement de paragraphe$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit-on faire lorsqu'on passe à une nouvelle idée directrice dans le développement ?$$, 'solution', $$Changer de paragraphe : chaque paragraphe argumentatif ne développe qu'une seule idée directrice.$$)
      ),
      jsonb_build_object(
        'heading', $$Les types de raisonnement$$,
        'body', $$Le paragraphe peut être construit selon trois modes de raisonnement : le raisonnement déductif (idée directrice → arguments → exemples) ; le raisonnement inductif (exemples → arguments → idée directrice) ; le raisonnement par analogie ou par confrontation (mise en parallèle par comparaison ou par opposition).$$,
        'highlights', array[$$déductif : idée directrice → arguments → exemples$$, $$inductif : exemples → arguments → idée directrice$$, $$par analogie/confrontation : mise en parallèle (comparaison ou opposition)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un raisonnement déductif et un raisonnement inductif ?$$, 'solution', $$Le raisonnement déductif part de l'idée directrice pour aller vers les exemples ; le raisonnement inductif part des exemples pour remonter vers l'idée directrice.$$)
      ),
      jsonb_build_object(
        'heading', $$Formules d'insertion des exemples$$,
        'body', $$Pour insérer un exemple de manière fluide dans un paragraphe argumentatif, on peut utiliser des formules comme : « Ainsi... », « C'est ainsi que... », « L'exemple de... montre bien cela », « Qu'il suffise de rappeler... », « Ce fait est illustré par... », « Prenons le cas de... », « On peut songer à... ».$$,
        'highlights', array[$$formules d'insertion : « Ainsi... », « Ce fait est illustré par... », « On peut songer à... »$$]::text[],
        'example', jsonb_build_object('statement', $$Insère l'exemple du roman Rebelle de Fatou Keïta dans une phrase illustrant l'argument « la littérature dénonce certaines pratiques culturelles », en utilisant une formule d'insertion appropriée.$$, 'solution', $$« Ce fait est illustré par le roman Rebelle de Fatou Keïta, qui met à nu la pratique de l'excision et le mariage forcé. »$$),
        'fixation', jsonb_build_object('question', $$Pourquoi utilise-t-on des formules comme « On peut songer à... » ou « Ce fait est illustré par... » avant de citer un exemple ?$$, 'solution', $$Pour insérer l'exemple de façon fluide dans l'argumentation, en évitant une simple juxtaposition de titre et d'auteur sans lien syntaxique avec le propos.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de rédaction d'une partie du développement$$,
        'body', $$Une partie bien rédigée enchaîne plusieurs paragraphes argumentatifs (un par argument), chacun relié au précédent par un connecteur logique (d'abord, ensuite, en outre, enfin), et se referme sur une phrase de transition annonçant la partie suivante. Par exemple, pour l'argument « la littérature dénonce les régimes dictatoriaux » : « D'abord, la littérature dénonce les régimes dictatoriaux. En effet, les gouvernants usent souvent de violences et de pratiques antidémocratiques ; les œuvres littéraires ne passent pas ces pratiques sous silence. C'est le cas du roman Les soleils des indépendances d'Ahmadou Kourouma, où l'auteur fustige la dictature du parti unique, ou encore de la pièce Les voix dans le vent de Bernard B. Dadié, qui fait la satire du dictateur Nahoubou. »$$,
        'highlights', array[$$paragraphes reliés par des connecteurs (d'abord, ensuite, en outre, enfin)$$, $$fin de partie : phrase de transition annonçant la partie suivante$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit contenir la dernière phrase d'une partie du développement ?$$, 'solution', $$Une transition qui fait le bilan de la partie qui s'achève et annonce la partie suivante.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le plan du sujet « Toute littérature participe d'une civilisation... » comporte une deuxième partie (l'antithèse) : « La littérature a d'autres aspects », avec trois arguments : elle exprime les sentiments personnels (exemple : Les contemplations de Victor Hugo) ; elle exprime le beau, l'esthétique (exemple : Calligrammes de Guillaume Apollinaire) ; elle évoque la fiction et favorise l'évasion (exemple : La planète des singes de Pierre Boulle).$$,
      'questions', array[
        $$Rédige le premier paragraphe argumentatif de cette deuxième partie, sur l'argument « la littérature est l'expression des sentiments personnels », en utilisant un raisonnement déductif (idée directrice → argument → exemple) et une formule d'insertion d'exemple appropriée.$$,
        $$Rédige le deuxième paragraphe, sur l'argument « la littérature exprime le beau, l'esthétique », en le reliant au paragraphe précédent par un connecteur logique.$$,
        $$Rédige le troisième paragraphe, sur l'argument « la littérature évoque la fiction », puis une phrase de conclusion qui clôt cette deuxième partie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois composantes obligatoires d'un paragraphe argumentatif dans une dissertation littéraire ?$$,
      'hint', $$Elles vont de l'idée générale au concret.$$,
      'expected', $$Une idée directrice, des arguments (reliés par des connecteurs logiques), et des exemples.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les trois types de raisonnement possibles pour construire un paragraphe argumentatif ?$$,
      'hint', $$Deux vont dans des sens opposés, le troisième compare.$$,
      'expected', $$Le raisonnement déductif, le raisonnement inductif, et le raisonnement par analogie ou par confrontation.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux formules permettant d'insérer un exemple dans un paragraphe argumentatif.$$,
      'hint', $$Elles introduisent l'illustration d'un argument.$$,
      'expected', $$Par exemple : « Ainsi... » et « On peut songer à... » (ou « Ce fait est illustré par... », « Prenons le cas de... »).$$
    ),
    jsonb_build_object(
      'question', $$Quels connecteurs logiques permettent de relier les paragraphes argumentatifs successifs d'une même partie ?$$,
      'hint', $$Ils marquent la progression de l'argumentation.$$,
      'expected', $$Par exemple : d'abord, ensuite, en outre, par ailleurs, enfin.$$
    )
  ),
  now()
);
