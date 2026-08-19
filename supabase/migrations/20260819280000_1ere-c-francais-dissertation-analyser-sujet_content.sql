-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2296: "EE 4: Dissert_littér_Analyser_sujet"
-- (https://lyc.ecole-ci.org/course/view.php?id=2296), resource id 20958.
-- Content is methodological (démarche d'analyse d'un sujet de dissertation
-- littéraire) plus two brief attributed citations (Roger Caillois, Romain
-- Rolland) used here for critical/educational commentary — short quotation
-- for pedagogical analysis, not reproduction of a creative narrative work.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-dissertation-analyser-sujet',
  '1ere',
  'C',
  'francais',
  $$La dissertation littéraire : analyser le sujet$$,
  4,
  '1ere-c-francais-introduction-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 1ère découvrent, dans le cadre de la préparation d'un concours, des sujets de dissertation littéraire. Voulant être parmi les meilleurs, ils s'organisent pour analyser ces sujets, rechercher des idées, élaborer un plan, puis rédiger un développement, une introduction et une conclusion.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les types et les parties d'un sujet$$,
        'body', $$Les sujets de dissertation se présentent selon deux modèles : soit ils comportent un jugement ou une opinion sous forme de citation, avec le nom de l'auteur ; soit ils sont formulés comme une consigne directe, sans citation. Un sujet comporte toujours deux parties : l'information (le jugement ou l'opinion d'un auteur sur un thème, souvent une citation) et la consigne (formulée à l'impératif, elle oriente la démarche du développement).$$,
        'highlights', array[$$sujet = information (jugement/citation) + consigne (à l'impératif)$$, $$deux modèles : sujet avec citation attribuée, ou consigne directe sans citation$$]::text[],
        'example', jsonb_build_object('statement', $$Soit le sujet : « Toute littérature participe d'une civilisation, aucun livre ne sort des battements d'un cœur. Une littérature existe dans une société et en reçoit l'empreinte. » Expliquez et discutez ce point de vue de Roger Caillois en vous appuyant sur les œuvres que vous avez lues ou étudiées. Identifie l'information et la consigne.$$, 'solution', $$Information : « Toute littérature participe d'une civilisation... et en reçoit l'empreinte. » Consigne : « Expliquez et discutez ce point de vue de Roger Caillois en vous appuyant sur les œuvres que vous avez lues ou étudiées. »$$),
        'fixation', jsonb_build_object('question', $$Sous quelle forme grammaticale la consigne d'un sujet de dissertation est-elle généralement formulée ?$$, 'solution', $$Sous forme injonctive, à l'impératif (par exemple « Expliquez et discutez »).$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier et expliquer les mots-clés$$,
        'body', $$Il s'agit d'identifier les mots-clés et difficiles de l'information et de la consigne, puis d'en dégager le sens en contexte, avant de reformuler l'idée générale du sujet avec ses propres mots.$$,
        'highlights', array[$$identifier les mots-clés → en dégager le sens en contexte → reformuler l'idée générale$$]::text[],
        'example', jsonb_build_object('statement', $$Explique les mots-clés du sujet : « Toute littérature participe d'une civilisation, aucun livre ne sort des battements d'un cœur. Une littérature existe dans une société et en reçoit l'empreinte. »$$, 'solution', $$Toute littérature : tout livre, toute production littéraire (roman, théâtre, poésie). Civilisation : culture. Participe : prend part, contribue. Battements d'un cœur : métonymie désignant le sentiment, l'émotion, l'imagination. Existe dans une société : liée à son milieu, ancrée dans la société. L'empreinte : la marque. Reformulation : les productions littéraires ne proviennent pas seulement de l'imagination, mais de la société qui les a vues naître et en porte la marque.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi est-il important d'expliquer les mots-clés avant d'analyser un sujet de dissertation ?$$, 'solution', $$Parce que cela permet d'en dégager le sens précis en contexte, condition nécessaire pour reformuler correctement l'idée générale et éviter les contresens.$$)
      ),
      jsonb_build_object(
        'heading', $$Le thème et la thèse de l'auteur$$,
        'body', $$Le thème est la notion sur laquelle porte la réflexion : on le dégage en se posant la question « De quoi s'agit-il ? », à partir des termes récurrents ou du champ lexical. La thèse de l'auteur est le point de vue qu'il soutient sur ce thème, opposable à d'autres thèses possibles : on la dégage en se posant la question « Quel est le point de vue de l'auteur sur le thème ? »$$,
        'highlights', array[$$thème : « De quoi s'agit-il ? » (notion générale)$$, $$thèse : « Quel est le point de vue de l'auteur ? » (position soutenue, opposable à d'autres)$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le sujet sur Roger Caillois (« Toute littérature participe d'une civilisation... »), dégage le thème et la thèse de l'auteur.$$, 'solution', $$Thème : le rapport entre la littérature et la société. Thèse : la production littéraire est influencée, impactée par la société qui l'a vue naître.$$),
        'fixation', jsonb_build_object('question', $$Quelle question permet de dégager le thème d'un sujet de dissertation ?$$, 'solution', $$« De quoi s'agit-il ? »$$)
      ),
      jsonb_build_object(
        'heading', $$La problématique$$,
        'body', $$La problématique est l'ensemble des questions ou des problèmes liés au sujet. Une bonne problématique se formule en tenant compte à la fois de la thèse de l'auteur et de l'orientation du verbe de la consigne (par exemple, « discuter » suppose d'envisager des limites ou des contre-arguments à la thèse).$$,
        'highlights', array[$$problématique = question(s) formulée(s) à partir de la thèse + orientation du verbe de la consigne$$]::text[],
        'example', jsonb_build_object('statement', $$Formule la problématique du sujet sur Roger Caillois.$$, 'solution', $$Quel rapport y a-t-il entre la production littéraire et la société ? La société est-elle la seule source d'inspiration du livre ?$$),
        'fixation', jsonb_build_object('question', $$Sur quels deux éléments doit-on s'appuyer pour formuler une bonne problématique ?$$, 'solution', $$La thèse de l'auteur et l'orientation du verbe de la consigne (par exemple si la consigne demande de « discuter », la problématique doit ouvrir sur d'éventuelles limites de la thèse).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici le sujet 2 : « En vous appuyant sur votre expérience personnelle de lecteur d'œuvres littéraires, expliquez et discutez le propos de Romain Rolland selon lequel on ne lit jamais un livre ; on se lit à travers les livres, soit pour se découvrir, soit pour se contrôler. »$$,
      'questions', array[
        $$Identifie l'information et la consigne de ce sujet.$$,
        $$Explique les mots-clés suivants dans leur contexte : « on ne lit jamais un livre », « on se lit à travers les livres », « se découvrir », « se contrôler ».$$,
        $$Dégage le thème, la thèse de l'auteur, puis formule une problématique pour ce sujet.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux parties constitutives d'un sujet de dissertation littéraire ?$$,
      'hint', $$L'une donne une opinion, l'autre donne un ordre.$$,
      'expected', $$L'information (le jugement ou l'opinion d'un auteur, souvent une citation) et la consigne (formulée à l'impératif).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre le thème et la thèse d'un sujet de dissertation ?$$,
      'hint', $$L'un est une notion générale, l'autre un point de vue précis.$$,
      'expected', $$Le thème est la notion générale sur laquelle porte la réflexion (« de quoi s'agit-il ? ») ; la thèse est le point de vue précis soutenu par l'auteur sur ce thème.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une problématique dans une dissertation littéraire ?$$,
      'hint', $$Elle formalise ce que le devoir devra résoudre.$$,
      'expected', $$C'est l'ensemble des questions ou problèmes liés au sujet, formulés à partir de la thèse de l'auteur et de l'orientation de la consigne, qui détermine ce que le devoir doit résoudre.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les deux modèles possibles de sujets de dissertation littéraire ?$$,
      'hint', $$L'un cite un auteur, l'autre s'adresse directement au candidat.$$,
      'expected', $$Un sujet avec une citation attribuée à un auteur, ou un sujet formulé comme une consigne directe sans citation.$$
    )
  ),
  now()
);
