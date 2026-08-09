-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). A matching ecole-ci.org
-- source exists (id 2339, categoryid=77) but could not be fetched in this
-- session (the Claude-in-Chrome browser extension disconnected and did not
-- reconnect); this content is written from general knowledge of the
-- standard 3ème programme topic instead.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tu remarques que tes phrases restent souvent courtes et juxtaposées. Ton professeur te propose d'apprendre à les relier avec des mots de coordination pour varier ton style.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les conjonctions de coordination$$,
        'body', $$La coordination relie deux mots, groupes de mots, ou propositions de même nature, à l'aide d'un mot de liaison appelé conjonction de coordination.$$,
        'highlights', array[$$conjonction de coordination$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Conjonction$$, $$Valeur$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$mais$$, $$opposition$$),
            jsonb_build_array($$ou$$, $$alternative$$),
            jsonb_build_array($$et$$, $$addition$$),
            jsonb_build_array($$donc$$, $$conséquence$$),
            jsonb_build_array($$or$$, $$opposition / transition$$),
            jsonb_build_array($$ni$$, $$négation$$),
            jsonb_build_array($$car$$, $$cause$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$On retient traditionnellement sept conjonctions de coordination grâce à la phrase « mais où est donc Ornicar ? » : mais, ou, et, donc, or, ni, car. Chacune exprime une valeur logique différente.$$),
        'example', jsonb_build_object('statement', $$Quelle conjonction de coordination faut-il pour relier ces deux idées avec une valeur de cause : « Il est resté chez lui. » / « Il était malade. »$$, 'solution', $$Il est resté chez lui, car il était malade (« car » exprime la cause).$$),
        'fixation', jsonb_build_object('question', $$Quelle conjonction de coordination faut-il pour relier avec une valeur d'opposition : « Elle a beaucoup révisé. » / « Elle a raté son examen. »$$, 'solution', $$Elle a beaucoup révisé, mais elle a raté son examen (« mais » exprime l'opposition).$$)
      ),
      jsonb_build_object(
        'heading', $$Les adverbes de liaison (mots coordonnants)$$,
        'body', $$En plus des sept conjonctions de coordination, d'autres mots, appelés adverbes de liaison, permettent aussi de relier des idées de façon logique.$$,
        'highlights', array[$$adverbe de liaison$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Des adverbes comme « puis », « ensuite », « pourtant », « cependant », « ainsi » ou « en effet » jouent un rôle de coordonnants, en reliant deux phrases ou en enchaînant des idées, souvent avec plus de nuance qu'une simple conjonction.$$),
        'example', jsonb_build_object('statement', $$Remplace « mais » par un adverbe de liaison de sens proche dans : « Il pleuvait, mais nous sommes sortis. »$$, 'solution', $$Il pleuvait, pourtant nous sommes sortis.$$),
        'fixation', jsonb_build_object('question', $$Utilise un adverbe de liaison pour enchaîner ces deux actions dans l'ordre : « Il a fini ses devoirs. » / « Il est allé jouer dehors. »$$, 'solution', $$Il a fini ses devoirs, puis il est allé jouer dehors.$$)
      ),
      jsonb_build_object(
        'heading', $$Ponctuation et coordination$$,
        'body', $$La virgule joue aussi un rôle de coordination lorsqu'elle sépare des éléments de même nature dans une énumération.$$,
        'highlights', array[$$la virgule$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans une énumération, la virgule remplace souvent la conjonction « et » entre les éléments, sauf devant le dernier, qui est généralement introduit par « et » ou « ou ».$$),
        'example', jsonb_build_object('statement', $$Ponctue correctement cette énumération : « Il a acheté des pommes des bananes et des oranges. »$$, 'solution', $$Il a acheté des pommes, des bananes et des oranges.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi ne met-on généralement pas de virgule avant le « et » final d'une énumération ?$$, 'solution', $$Parce que le « et » joue déjà le rôle de liaison entre les deux derniers éléments, la virgule serait redondante.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu dois relier plusieurs phrases courtes d'un texte pour en améliorer la fluidité, en utilisant des conjonctions et adverbes de coordination variés.$$,
      'questions', array[
        $$Relie deux phrases avec une conjonction de coordination exprimant la cause.$$,
        $$Relie deux phrases avec un adverbe de liaison exprimant l'opposition.$$,
        $$Construis une énumération de trois éléments correctement ponctuée.$$,
        $$Explique la valeur logique d'une conjonction que tu as utilisée.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Relie avec « donc » : « Il n'a pas révisé. » / « Il a échoué à son contrôle. »$$,
      'hint', $$« Donc » exprime une conséquence.$$,
      'expected', $$Il n'a pas révisé, donc il a échoué à son contrôle.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la valeur logique de « ou » dans : « Tu peux venir en bus ou en voiture. » ?$$,
      'hint', $$Pense à un choix entre deux options.$$,
      'expected', $$« Ou » exprime une alternative, un choix entre deux possibilités.$$
    ),
    jsonb_build_object(
      'question', $$Ponctue cette énumération : « Elle aime lire écrire et dessiner. »$$,
      'hint', $$Sépare les éléments par des virgules, sauf avant « et ».$$,
      'expected', $$Elle aime lire, écrire et dessiner.$$
    ),
    jsonb_build_object(
      'question', $$Remplace « mais » par un adverbe de liaison dans : « Il est jeune, mais il est très sage. »$$,
      'hint', $$Cherche un adverbe qui exprime la même opposition.$$,
      'expected', $$Il est jeune, pourtant il est très sage.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-coordination';
