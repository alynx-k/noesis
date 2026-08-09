-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No matching ecole-ci.org
-- source page was found for this reading-comprehension lesson, so this
-- content is original, from the lesson's title/topic and the standard
-- 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur t'apporte plusieurs coupures de journaux pour préparer une revue de presse en classe. Avant de les analyser, il faut apprendre à reconnaître comment un article de journal est construit.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La structure d'un article$$,
        'body', $$Un article de journal suit une organisation bien précise, pensée pour que le lecteur trouve rapidement l'information essentielle.$$,
        'highlights', array[$$le titre$$, $$le chapeau$$, $$le corps de l'article$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un article comprend un titre qui résume l'information en quelques mots, un chapeau (court paragraphe introductif) qui présente l'essentiel, et un corps de l'article qui développe les détails, souvent du plus important au moins important.$$),
        'example', jsonb_build_object('statement', $$Que doit contenir le chapeau d'un article sur un accident de la route ?$$, 'solution', $$Le chapeau doit résumer l'essentiel : quoi, où, quand, et éventuellement combien de personnes concernées.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le titre d'un article doit-il être court et précis ?$$, 'solution', $$Parce qu'il doit attirer l'attention du lecteur et lui donner immédiatement une idée du sujet de l'article.$$)
      ),
      jsonb_build_object(
        'heading', $$Les questions de référence (le QQOQCP)$$,
        'body', $$Pour vérifier qu'un article informe complètement son lecteur, on peut se poser une série de questions classiques utilisées par les journalistes.$$,
        'highlights', array[$$QQOQCP$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Question$$, $$Ce qu'elle vérifie$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Qui ?$$, $$les personnes concernées par l'événement$$),
            jsonb_build_array($$Quoi ?$$, $$l'événement lui-même$$),
            jsonb_build_array($$Où ?$$, $$le lieu de l'événement$$),
            jsonb_build_array($$Quand ?$$, $$le moment de l'événement$$),
            jsonb_build_array($$Comment ?$$, $$la manière dont l'événement s'est déroulé$$),
            jsonb_build_array($$Pourquoi ?$$, $$les causes de l'événement$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le QQOQCP (Qui, Quoi, Où, Quand, Comment, Pourquoi) est une méthode utilisée pour vérifier qu'un article traite complètement son sujet, généralement dès les premières lignes.$$),
        'example', jsonb_build_object('statement', $$Dans la phrase « Mardi matin, un incendie s'est déclaré dans une école d'Abidjan, provoqué par un court-circuit », identifie deux réponses du QQOQCP.$$, 'solution', $$Quand ? : mardi matin. Pourquoi ? : un court-circuit.$$),
        'fixation', jsonb_build_object('question', $$Dans cette même phrase, quelle information répond à la question « Où ? »$$, 'solution', $$« Dans une école d'Abidjan » répond à la question « Où ? ».$$)
      ),
      jsonb_build_object(
        'heading', $$Distinguer les faits et les commentaires$$,
        'body', $$Un bon lecteur d'article sait faire la différence entre ce que le journaliste rapporte comme un fait vérifié, et ce qui relève de son opinion ou de celle d'une personne interrogée.$$,
        'highlights', array[$$un fait$$, $$une opinion$$, $$une citation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un fait est une information vérifiable et objective. Une opinion exprime un jugement personnel, souvent introduite par une citation entre guillemets attribuée à une personne interrogée par le journaliste.$$),
        'example', jsonb_build_object('statement', $$Dans « Le maire a déclaré : « Cette décision est une erreur » », qui exprime une opinion ?$$, 'solution', $$C'est le maire qui exprime une opinion, rapportée par le journaliste sous forme de citation.$$),
        'fixation', jsonb_build_object('question', $$Cette phrase est-elle un fait ou une opinion : « La réunion a eu lieu à 15 heures. »$$, 'solution', $$C'est un fait, car c'est une information vérifiable et objective.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ta classe prépare une revue de presse et doit analyser un article sur un événement local.$$,
      'questions', array[
        $$Identifie le titre, le chapeau et repère une information du corps de l'article.$$,
        $$Réponds au QQOQCP à partir des informations de l'article.$$,
        $$Relève une phrase qui rapporte un fait, et une autre qui rapporte une opinion.$$,
        $$Résume l'article en trois phrases maximum.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Que veut dire l'abréviation QQOQCP ?$$,
      'hint', $$Chaque lettre correspond à une question.$$,
      'expected', $$Qui, Quoi, Où, Quand, Comment, Pourquoi.$$
    ),
    jsonb_build_object(
      'question', $$Dans la phrase « Le conseil municipal a voté, hier soir, la construction d'un nouveau stade », quelle information répond à « Quand ? »$$,
      'hint', $$Cherche l'indication de temps dans la phrase.$$,
      'expected', $$« Hier soir » répond à la question « Quand ? ».$$
    ),
    jsonb_build_object(
      'question', $$Cette phrase est-elle un fait ou une opinion : « Je pense que ce projet est une excellente idée », a déclaré l'architecte.$$,
      'hint', $$Repère qui exprime un jugement personnel.$$,
      'expected', $$C'est une opinion, exprimée par l'architecte et rapportée par le journaliste.$$
    ),
    jsonb_build_object(
      'question', $$À quoi sert le chapeau d'un article de journal ?$$,
      'hint', $$Pense à sa position et à son rôle.$$,
      'expected', $$Le chapeau résume l'essentiel de l'article en quelques lignes, pour donner envie de lire la suite.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-lecture-article-journal';
