-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). The ecole-ci.org page found
-- for this title (id 2344, "Expression Écrite" category) has 0 activities
-- ("Activités : 0" on the page), so this content is original, from the
-- lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour préparer l'épreuve du BEPC, ton professeur te demande de t'entraîner à résumer un texte argumentatif sans en trahir le sens ni y ajouter ton avis personnel.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les règles du résumé$$,
        'body', $$Résumer un texte argumentatif, c'est en restituer l'essentiel de façon plus courte, sans rien ajouter ni interpréter.$$,
        'highlights', array[$$objectivité$$, $$fidélité$$, $$concision$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un bon résumé respecte trois règles : la fidélité (ne pas trahir la pensée de l'auteur), l'objectivité (ne pas ajouter son propre avis), et la concision (réduire le texte à une fraction de sa longueur, souvent au quart).$$),
        'example', jsonb_build_object('statement', $$Pourquoi ne doit-on jamais ajouter son opinion personnelle dans un résumé ?$$, 'solution', $$Parce que le résumé doit rapporter fidèlement la pensée de l'auteur du texte, et non celle de la personne qui résume.$$),
        'fixation', jsonb_build_object('question', $$Un résumé de 400 mots doit faire environ combien de mots s'il faut le réduire au quart ?$$, 'solution', $$Il doit faire environ 100 mots.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérer l'essentiel avant de résumer$$,
        'body', $$Avant de rédiger un résumé, il faut d'abord identifier la thèse et les arguments principaux du texte, en éliminant les exemples et les répétitions secondaires.$$,
        'highlights', array[$$la thèse$$, $$les arguments clés$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Action$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1. Lire le texte en entier$$, $$comprendre le sens global avant de résumer un seul mot$$),
            jsonb_build_array($$2. Repérer la thèse$$, $$identifier l'idée principale défendue$$),
            jsonb_build_array($$3. Souligner les arguments clés$$, $$retenir un mot ou une expression par argument$$),
            jsonb_build_array($$4. Éliminer le superflu$$, $$retirer les exemples, répétitions et détails secondaires$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un résumé conserve la thèse et les arguments principaux, mais élimine en général les exemples, les citations longues et les répétitions, qui servent seulement à illustrer ou à insister.$$),
        'example', jsonb_build_object('statement', $$Dans un texte qui donne trois exemples pour un même argument, combien doit-on en garder dans le résumé ?$$, 'solution', $$En général, aucun exemple n'est nécessaire dans un résumé : seule l'idée générale de l'argument doit être conservée.$$),
        'fixation', jsonb_build_object('question', $$Un paragraphe du texte source répète la même idée trois fois avec des mots différents. Que doit-on faire dans le résumé ?$$, 'solution', $$On ne garde qu'une seule formulation de cette idée, la plus claire et la plus courte possible.$$)
      ),
      jsonb_build_object(
        'heading', $$Reformuler avec ses propres mots$$,
        'body', $$Un résumé n'est pas un copier-coller de phrases du texte original : il doit être reformulé, tout en gardant le sens exact des idées.$$,
        'highlights', array[$$reformuler$$, $$un synonyme$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Reformuler consiste à exprimer une idée avec d'autres mots, souvent plus courts, en utilisant des synonymes et en réorganisant la phrase, sans jamais changer le sens original.$$),
        'example', jsonb_build_object('statement', $$Reformule cette phrase plus brièvement : « Il est absolument indispensable et urgent que chacun d'entre nous fasse des efforts considérables pour protéger notre environnement. »$$, 'solution', $$Chacun doit agir rapidement pour protéger l'environnement.$$),
        'fixation', jsonb_build_object('question', $$Reformule plus brièvement : « De nombreuses études scientifiques ont démontré, à de multiples reprises, que la lecture régulière améliore significativement le vocabulaire des jeunes lecteurs. »$$, 'solution', $$Des études montrent que lire régulièrement enrichit le vocabulaire des jeunes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour t'entraîner avant le BEPC, tu dois résumer un texte argumentatif de 300 mots sur le thème de la protection des animaux.$$,
      'questions', array[
        $$Identifie la thèse et les deux arguments principaux du texte.$$,
        $$Élimine les exemples et répétitions inutiles.$$,
        $$Reformule les idées principales avec tes propres mots.$$,
        $$Rédige un résumé d'environ 75 mots (le quart du texte original).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$À combien de mots doit-on réduire un texte de 200 mots si l'on demande un résumé au quart ?$$,
      'hint', $$Divise le nombre de mots par quatre.$$,
      'expected', $$Environ 50 mots.$$
    ),
    jsonb_build_object(
      'question', $$Doit-on garder les exemples dans un résumé de texte argumentatif ? Pourquoi ?$$,
      'hint', $$Pense au rôle de l'exemple par rapport à l'argument.$$,
      'expected', $$Non, en général, car les exemples ne servent qu'à illustrer un argument déjà énoncé, et ne sont pas indispensables à la compréhension de l'idée principale.$$
    ),
    jsonb_build_object(
      'question', $$Reformule plus brièvement : « Il convient de souligner le fait que les transports en commun permettent, dans une large mesure, de réduire la pollution atmosphérique. »$$,
      'hint', $$Retire les tournures inutiles et va à l'essentiel.$$,
      'expected', $$Les transports en commun réduisent la pollution.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi ne doit-on jamais recopier des phrases entières du texte source dans un résumé ?$$,
      'hint', $$Pense à la différence entre résumer et copier.$$,
      'expected', $$Parce qu'un résumé doit être une reformulation personnelle et condensée du texte, pas une copie de ses phrases.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-resume-texte-argumentatif';
