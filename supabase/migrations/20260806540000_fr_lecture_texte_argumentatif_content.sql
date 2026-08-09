-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No matching ecole-ci.org
-- source page was found for this reading-comprehension lesson, so this
-- content is original, from the lesson's title/topic and the standard
-- 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le journal de ton collège publie régulièrement des textes qui défendent une opinion. Avant d'écrire le tien, ton professeur te propose d'apprendre à repérer comment un texte argumentatif est construit.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Repérer la thèse et les arguments$$,
        'body', $$Un texte argumentatif défend une idée précise, appelée la thèse, à l'aide de plusieurs arguments qui la soutiennent.$$,
        'highlights', array[$$la thèse$$, $$un argument$$, $$un exemple$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La thèse est l'opinion principale défendue par l'auteur, généralement énoncée dès le début ou la fin du texte. Chaque argument est une raison qui soutient cette thèse, et peut être accompagné d'un exemple qui l'illustre concrètement.$$),
        'example', jsonb_build_object('statement', $$Identifie la thèse de ce texte : « Le sport devrait être davantage encouragé à l'école, car il améliore la santé et la concentration des élèves. »$$, 'solution', $$La thèse est que le sport devrait être davantage encouragé à l'école.$$),
        'fixation', jsonb_build_object('question', $$Dans la phrase précédente, quel est l'argument avancé pour soutenir cette thèse ?$$, 'solution', $$L'argument est que le sport améliore la santé et la concentration des élèves.$$)
      ),
      jsonb_build_object(
        'heading', $$Les connecteurs logiques dans l'argumentation$$,
        'body', $$Pour organiser ses arguments et les relier entre eux, l'auteur d'un texte argumentatif utilise des connecteurs qui indiquent la logique de son raisonnement.$$,
        'highlights', array[$$connecteurs logiques$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Connecteur$$, $$Valeur logique$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$car, parce que, en effet$$, $$cause / justification$$),
            jsonb_build_array($$donc, c'est pourquoi, ainsi$$, $$conséquence$$),
            jsonb_build_array($$mais, cependant, toutefois$$, $$opposition / nuance$$),
            jsonb_build_array($$de plus, par ailleurs, en outre$$, $$ajout d'un argument$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Repérer les connecteurs logiques permet de suivre le fil du raisonnement de l'auteur et de distinguer les arguments principaux des nuances ou des exemples.$$),
        'example', jsonb_build_object('statement', $$Quel type de lien logique introduit le mot « cependant » dans un texte argumentatif ?$$, 'solution', $$« Cependant » introduit une opposition ou une nuance par rapport à ce qui vient d'être dit.$$),
        'fixation', jsonb_build_object('question', $$Quel connecteur pourrait relier ces deux idées : « Les écrans sont utiles pour apprendre. » / « Ils peuvent aussi isoler les jeunes. »$$, 'solution', $$On pourrait utiliser « cependant » ou « mais » pour marquer l'opposition entre les deux idées.$$)
      ),
      jsonb_build_object(
        'heading', $$Distinguer les types d'arguments$$,
        'body', $$Tous les arguments ne se valent pas : certains s'appuient sur des faits vérifiables, d'autres sur des valeurs, et d'autres encore sur des conséquences pratiques.$$,
        'highlights', array[$$un fait$$, $$une valeur$$, $$une conséquence$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un argument peut s'appuyer sur un fait (une donnée vérifiable), sur une valeur (une conviction morale ou sociale), ou sur une conséquence pratique (ce qui se passera si l'on agit ou non). Un texte argumentatif solide combine souvent plusieurs types d'arguments.$$),
        'example', jsonb_build_object('statement', $$Quel type d'argument est celui-ci : « Selon une étude récente, 80% des élèves qui font du sport ont de meilleurs résultats scolaires. » ?$$, 'solution', $$C'est un argument fondé sur un fait, car il s'appuie sur une donnée chiffrée et vérifiable.$$),
        'fixation', jsonb_build_object('question', $$Quel type d'argument est celui-ci : « Il est juste que chaque élève ait accès aux mêmes activités sportives, quelle que soit sa situation. » ?$$, 'solution', $$C'est un argument fondé sur une valeur, car il repose sur une idée de justice et d'égalité.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le journal de ton collège publie un texte argumentatif sur le thème : « Faut-il réduire les vacances scolaires ? » Tu dois l'analyser avant d'y répondre.$$,
      'questions', array[
        $$Identifie la thèse défendue dans le texte proposé par ton professeur.$$,
        $$Relève deux arguments et précise s'ils s'appuient sur un fait, une valeur, ou une conséquence.$$,
        $$Repère un connecteur logique et explique son rôle dans le texte.$$,
        $$Donne ton propre avis sur la thèse défendue, en une phrase argumentée.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Identifie la thèse de ce texte : « Il faut interdire les sacs plastiques, car ils polluent gravement les océans. »$$,
      'hint', $$Cherche l'opinion principale défendue.$$,
      'expected', $$La thèse est qu'il faut interdire les sacs plastiques.$$
    ),
    jsonb_build_object(
      'question', $$Ce texte utilise-t-il un fait, une valeur, ou une conséquence : « Si l'on continue ainsi, les océans seront irrémédiablement pollués d'ici 2050. » ?$$,
      'hint', $$Cette phrase annonce ce qui va se passer si rien ne change.$$,
      'expected', $$C'est un argument fondé sur une conséquence, car il annonce ce qui se passera si l'on n'agit pas.$$
    ),
    jsonb_build_object(
      'question', $$Quel connecteur logique manque ici : « Le vélo est écologique. ... , il est aussi bon pour la santé. » ?$$,
      'hint', $$Pense à un connecteur d'ajout.$$,
      'expected', $$De plus (ou par ailleurs), pour ajouter un second argument.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la valeur logique du mot « donc » dans un texte argumentatif ?$$,
      'hint', $$Pense à ce qui découle logiquement d'une idée.$$,
      'expected', $$« Donc » introduit une conséquence : ce qui découle logiquement de ce qui précède.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-lecture-texte-argumentatif';
