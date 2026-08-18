-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 861: "EE 4: Dissert_littér_Analyser_sujet"
-- (https://lyc.ecole-ci.org/course/view.php?id=861), resource id 3981 —
-- "Séance 1 : Analyser le sujet" (Leçon 3 : la dissertation littéraire).
-- Contenu méthodologique (identification information/consigne, mots-clés,
-- thème, thèse, problématique) réécrit à partir du PDF source. Les deux
-- sujets d'exemple du PDF citent nommément deux auteurs réels (Roger
-- Caillois, Romain Rolland) : pour rester strictement sur la politique
-- « 100% contenu original » de l'application, les sujets d'exemple
-- ci-dessous sont des citations ENTIÈREMENT INVENTÉES (non attribuées à
-- une personne réelle), tout en conservant exactement la même méthode
-- d'analyse (information/consigne, mots-clés, thème, thèse, problématique)
-- fidèle au programme.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-dissertation-analyser-sujet',
  '1ere',
  'A',
  'francais',
  $$La dissertation littéraire : analyser le sujet$$,
  4,
  '1ere-a-fr-introduction-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En vue d'un concours, des élèves de 1ère A découvrent deux sujets de dissertation littéraire. N'ayant jamais pratiqué cet exercice, ils s'organisent pour apprendre à analyser un sujet avant de chercher des idées : identifier ses parties, expliquer les mots-clés, dégager le thème et la thèse, puis formuler une problématique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les deux modèles de sujets et leurs deux parties$$,
        'body', $$Un sujet de dissertation littéraire se présente selon deux modèles : soit il comporte un jugement ou une opinion, souvent donné sous forme de citation attribuée à un auteur ; soit il est constitué d'une consigne directe, sans citation, adressée à l'élève. Dans les deux cas, le sujet comporte deux parties : l'information (le jugement ou l'opinion sur un thème) et la consigne (formulée à l'impératif, elle oriente la démarche à suivre dans le développement).$$,
        'highlights', array[$$sujet avec citation$$, $$sujet à consigne directe$$, $$information$$, $$consigne$$]::text[],
        'example', jsonb_build_object('statement', $$Sujet : « Le roman n'est jamais l'écho fidèle du réel ; il est la réécriture d'un monde par une conscience singulière. » Expliquez et discutez ce point de vue en vous appuyant sur les œuvres que vous avez lues. Identifie l'information et la consigne.$$, 'solution', $$Information : « Le roman n'est jamais l'écho fidèle du réel ; il est la réécriture d'un monde par une conscience singulière. » Consigne : « Expliquez et discutez ce point de vue en vous appuyant sur les œuvres que vous avez lues. »$$),
        'fixation', jsonb_build_object('question', $$À quel mode et temps est généralement formulée la consigne d'un sujet de dissertation ?$$, 'solution', $$À l'impératif (mode injonctif).$$)
      ),
      jsonb_build_object(
        'heading', $$Expliquer les mots-clés$$,
        'body', $$Il s'agit d'identifier les mots-clés et les mots difficiles de l'information et de la consigne, puis d'en dégager le sens en contexte (synonymes, reformulation). Cette étape permet ensuite de reformuler l'idée générale du sujet avec des mots plus simples, pour vérifier qu'on l'a bien comprise avant d'aller plus loin.$$,
        'highlights', array[$$identifier les mots-clés$$, $$sens en contexte$$, $$reformulation$$]::text[],
        'example', jsonb_build_object('statement', $$Explique les mots-clés de : « Le roman n'est jamais l'écho fidèle du réel ; il est la réécriture d'un monde par une conscience singulière. »$$, 'solution', $$« Écho fidèle du réel » : copie exacte, reflet fidèle de la réalité. « Réécriture » : recréation, transformation. « Conscience singulière » : la sensibilité propre et unique de l'auteur. Reformulation : le roman ne recopie pas la réalité telle quelle, il la transforme à travers le regard particulier de son auteur.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi reformuler le sujet avec ses propres mots après avoir expliqué les mots-clés ?$$, 'solution', $$Pour vérifier qu'on a bien compris l'idée générale du sujet avant de chercher le thème et la problématique.$$)
      ),
      jsonb_build_object(
        'heading', $$Dégager le thème et la thèse de l'auteur$$,
        'body', $$Le thème est la notion générale sur laquelle porte la réflexion : on le dégage en se demandant « De quoi s'agit-il ? », à partir des termes récurrents ou du champ lexical dominant. La thèse est le point de vue précis défendu par l'auteur de la citation sur ce thème : on la dégage en se demandant « Quel est le point de vue de l'auteur sur le thème ? ». Le thème est donc large, la thèse est une prise de position particulière sur ce thème.$$,
        'highlights', array[$$thème : « De quoi s'agit-il ? »$$, $$thèse : point de vue précis de l'auteur$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le sujet précédent, dégage le thème puis la thèse de l'auteur.$$, 'solution', $$Thème : le rapport entre le roman et la réalité (ou : littérature et réalité). Thèse : le roman transforme la réalité au lieu de la copier fidèlement, à travers la sensibilité propre de l'auteur.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre le thème et la thèse d'un sujet ?$$, 'solution', $$Le thème est la notion générale abordée (par exemple « littérature et société ») ; la thèse est le point de vue précis que l'auteur défend sur ce thème.$$)
      ),
      jsonb_build_object(
        'heading', $$Formuler la problématique$$,
        'body', $$La problématique est l'ensemble des questions ou du problème soulevé par le sujet. Elle se formule à partir de la thèse de l'auteur et de l'orientation de la consigne (par exemple « expliquez et discutez » invite à examiner les limites de la thèse). Une bonne problématique prend souvent la forme d'une ou deux questions qui interrogent la validité ou les limites de la thèse proposée.$$,
        'highlights', array[$$problématique = questions soulevées$$, $$s'appuie sur thèse + consigne$$]::text[],
        'example', jsonb_build_object('statement', $$Formule une problématique pour le sujet précédent.$$, 'solution', $$Le roman est-il toujours une transformation de la réalité par la sensibilité de l'auteur, ou peut-il aussi chercher à refléter fidèlement le monde ?$$),
        'fixation', jsonb_build_object('question', $$Sur quels deux éléments s'appuie-t-on pour formuler la problématique d'un sujet ?$$, 'solution', $$La thèse défendue par l'auteur et l'orientation donnée par le verbe de la consigne (par exemple « discuter » invite à en examiner les limites).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un sujet de dissertation : « En vous appuyant sur les œuvres que vous avez lues ou étudiées, expliquez et discutez l'idée selon laquelle la lecture d'une œuvre littéraire transforme durablement celui qui la lit. »$$,
      'questions', array[
        $$Ce sujet appartient-il au modèle « citation » ou au modèle « consigne directe » ? Identifie l'information et la consigne.$$,
        $$Explique les mots-clés « transforme durablement » et dégage le thème du sujet.$$,
        $$Formule une problématique pour ce sujet.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Un sujet de dissertation comporte toujours deux parties : lesquelles ?$$,
      'hint', $$L'une donne un jugement, l'autre indique la tâche à accomplir.$$,
      'expected', $$L'information (le jugement ou l'opinion sur un thème) et la consigne (la tâche demandée, formulée à l'impératif).$$
    ),
    jsonb_build_object(
      'question', $$Quelle question se pose-t-on pour dégager le thème d'un sujet ?$$,
      'hint', $$C'est une question très générale.$$,
      'expected', $$« De quoi s'agit-il ? »$$
    ),
    jsonb_build_object(
      'question', $$Quelle question se pose-t-on pour dégager la thèse de l'auteur d'un sujet ?$$,
      'hint', $$C'est plus précis que la question du thème.$$,
      'expected', $$« Quel est le point de vue de l'auteur sur le thème ? »$$
    ),
    jsonb_build_object(
      'question', $$Une problématique doit-elle se limiter à reformuler la thèse de l'auteur, ou aller plus loin ?$$,
      'hint', $$Pense au sens du verbe « discuter » dans une consigne.$$,
      'expected', $$Elle doit aller plus loin : elle interroge la validité ou les limites de la thèse, souvent sous forme de question(s).$$
    )
  ),
  now()
);
