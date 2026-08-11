-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3242: "EE 11: Résumé_Texte_Argu_Ident_sitaut_argumentation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3242)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Résumé_Texte_Argu_S2_Ident_sitaut_argumentation.pdf" (5 pages,
-- séance 2 : identifier la situation d'argumentation). Textes support :
-- Stella et Joël de Rosnay, "Savoir s'alimenter" ; Venance Konan,
-- "La Côte d'Ivoire un beau pays !" ; Francis Bebey, avant-propos de la
-- revue Recherche Pédagogie et Culture, n°29-30, 1977 (citations publiques
-- déjà présentes dans les intitulés, non développées ici).
-- Rewritten/paraphrased from the source PDF: the three components of the
-- "situation d'argumentation" (thème, thèse, structure en séquences de
-- paragraphes), plus the notion of tonalité (oratoire/ironique) used to
-- describe the author's argumentative strategy, illustrated with the
-- source's own worked breakdown. 100% original wording; no sentence copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee11-resume-argumentatif-situation-argumentation',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le résumé du texte argumentatif — identifier la situation d'argumentation$$,
  27,
  '2nde-a-fr-ee10-resume-argumentatif-repondre-questions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir répondu aux questions préalables sur le texte, les élèves de seconde A doivent maintenant identifier précisément sa situation d'argumentation : de quoi il parle, ce qu'il défend, et comment il organise ses paragraphes pour le démontrer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois éléments de la situation d'argumentation$$,
        'body', $$Identifier la situation d'argumentation d'un texte consiste à préciser trois éléments : son thème, la thèse de l'auteur, et la structure du texte, c'est-à-dire la façon dont les paragraphes s'organisent pour développer cette thèse.$$,
        'highlights', array[$$thème$$, $$thèse$$, $$structure du texte$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Élément$$, $$Définition$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Thème$$, $$Le sujet général traité par le texte$$),
            jsonb_build_array($$Thèse$$, $$L'opinion que l'auteur défend sur ce thème$$),
            jsonb_build_array($$Structure du texte$$, $$L'organisation des paragraphes en séquences porteuses d'idées$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quels sont les trois éléments qui composent la situation d'argumentation d'un texte ?$$, 'solution', $$Le thème, la thèse de l'auteur, et la structure du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$La structure du texte en séquences$$,
        'body', $$Un texte argumentatif se décompose en séquences, chacune regroupant un ou plusieurs paragraphes qui développent une même idée. On donne à chaque séquence un titre qui résume l'idée qu'elle porte, ce qui permet de visualiser la progression de l'argumentation.$$,
        'highlights', array[$$séquence$$, $$titre de séquence$$]::text[],
        'example', jsonb_build_object('statement', $$Comment appelle-t-on chaque bloc de paragraphes qui développe une même idée dans un texte argumentatif ?$$, 'solution', $$Une séquence, à laquelle on attribue un titre résumant l'idée développée.$$),
        'fixation', jsonb_build_object('question', $$À quoi sert le titre donné à chaque séquence d'un texte ?$$, 'solution', $$Il résume l'idée développée dans les paragraphes de cette séquence.$$)
      ),
      jsonb_build_object(
        'heading', $$Confirmer la visée argumentative par la structure$$,
        'body', $$Une fois les séquences identifiées, on relit leurs titres à la suite les uns des autres : ils doivent former une progression cohérente qui aboutit logiquement à la thèse défendue par l'auteur, ce qui confirme la visée argumentative du texte.$$,
        'highlights', array[$$progression$$, $$cohérence$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment vérifie-t-on que la structure d'un texte confirme bien sa visée argumentative ?$$, 'solution', $$En vérifiant que les titres des séquences, mis bout à bout, forment une progression cohérente vers la thèse de l'auteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérer la tonalité et la stratégie argumentative$$,
        'body', $$Au-delà de la structure, on peut préciser la stratégie argumentative en identifiant la tonalité employée par l'auteur : une tonalité oratoire s'appuie sur l'implication directe du lecteur (par exemple l'emploi du pronom « vous »), tandis qu'une tonalité ironique dénonce une situation en disant le contraire de ce qui est réellement pensé.$$,
        'highlights', array[$$tonalité oratoire$$, $$tonalité ironique$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi un titre comme « Un beau pays ! » peut-il être ironique dans un texte qui dénonce le désordre d'un pays ?$$, 'solution', $$Parce que l'auteur affirme le contraire de ce qu'il pense réellement, pour mieux dénoncer, par contraste, le désordre qu'il décrit.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on une tonalité oratoire dans un texte argumentatif ?$$, 'solution', $$Par l'emploi récurrent de pronoms qui impliquent directement le lecteur, comme « vous ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte affirme, avec un ton faussement enthousiaste, que le gaspillage alimentaire dans les grandes villes est « une chance pour l'économie locale », alors qu'il dénonce en réalité ce gaspillage.$$,
      'questions', array[
        $$Identifie le thème de ce texte.$$,
        $$Formule la thèse réellement défendue par l'auteur, malgré le ton employé.$$,
        $$Quelle tonalité l'auteur emploie-t-il, et pourquoi ?$$,
        $$Propose un titre de séquence pour le passage qui décrit ironiquement les avantages supposés du gaspillage.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois éléments de la situation d'argumentation d'un texte ?$$,
      'hint', $$Le sujet, l'opinion, l'organisation.$$,
      'expected', $$Le thème, la thèse de l'auteur, et la structure du texte.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une séquence, dans la structure d'un texte argumentatif ?$$,
      'hint', $$Un regroupement de paragraphes.$$,
      'expected', $$Un regroupement de paragraphes qui développent une même idée, auquel on donne un titre.$$
    ),
    jsonb_build_object(
      'question', $$Comment vérifie-t-on que la structure d'un texte confirme sa visée argumentative ?$$,
      'hint', $$On relit les titres des séquences.$$,
      'expected', $$En vérifiant que les titres des séquences forment une progression cohérente vers la thèse de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qui caractérise une tonalité ironique ?$$,
      'hint', $$Dire le contraire de ce que l'on pense.$$,
      'expected', $$L'auteur affirme le contraire de ce qu'il pense réellement, pour mieux dénoncer une situation.$$
    )
  ),
  now()
);
