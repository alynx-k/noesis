-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
--
-- NOTE ON EE9: the Moodle listing shows a course entitled "EE 9:
-- Production-écrite_Rédiger_iintro_conclusion" (Moodle course id 3240,
-- https://lyc.ecole-ci.org/course/view.php?id=3240) whose *title* duplicates
-- EE8's. Investigation showed this title is stale/mislabeled metadata: the
-- course's actual "Je lis le résumé de la leçon" resource (id=32119) serves
-- the PDF "2nde_EE_Résumé_Texte_Argu_S1_Répondre_questions.pdf" — i.e. the
-- exact same file (same filename, same 6 pages, same "Séance 1: Répondre
-- aux consignes – questions" content) as EE10 below (course id 3241,
-- resource id=32131, pluginfile 74385 vs EE9's 74372 — two resource
-- records pointing at duplicate uploads of the same file). So EE9 is a
-- genuine content duplicate of EE10, not of EE8; it is skipped here and no
-- separate migration file was created for it. EE10 is treated as the
-- authoritative single copy of this content, chained directly after EE8.
--
-- Moodle course id 3241: "EE 10: Résumé_Texte_Argu_Répondre_questions"
-- (https://lyc.ecole-ci.org/course/view.php?id=3241)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Résumé_Texte_Argu_S1_Répondre_questions.pdf" (6 pages, séance 1
-- de la leçon "Résumé du texte argumentatif" : répondre aux
-- consignes-questions). Textes support : Stella et Joël de Rosnay, "Savoir
-- s'alimenter" (La Mal Bouffe, éd. Olivier Orban) ; Venance Konan,
-- "La Côte d'Ivoire un beau pays !" (Nègreries, éd. Frat. Mat, 1996) ;
-- Francis Bebey, avant-propos de la revue Recherche Pédagogie et Culture,
-- n°29-30, mai-août 1977 (citations publiques déjà présentes dans les
-- intitulés, non développées ici).
-- Rewritten/paraphrased from the source PDF: the three preliminary
-- questions that precede a résumé (le thème, l'explication en contexte
-- d'une expression, la visée argumentative), illustrated with the source's
-- own worked answers. 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee10-resume-argumentatif-repondre-questions',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le résumé du texte argumentatif — répondre aux questions sur le texte$$,
  26,
  '2nde-a-fr-ee8-production-ecrite-introduction-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à rédiger une production écrite complète, les élèves de seconde A abordent une nouvelle compétence : résumer un texte argumentatif. La première étape de cet apprentissage consiste à répondre à des questions de vocabulaire et de compréhension portant sur le texte à résumer, avant même d'entamer le résumé proprement dit.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois questions préalables au résumé$$,
        'body', $$Avant de résumer un texte argumentatif, on répond généralement à trois types de questions portant sur le système énonciatif, le lexique et l'organisation argumentative du texte : identifier le thème, expliquer une expression en contexte, et déterminer la visée argumentative de l'auteur.$$,
        'highlights', array[$$thème$$, $$explication en contexte$$, $$visée argumentative$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Question$$, $$Ce qu'elle demande$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Le thème$$, $$Nommer, en une courte expression, le sujet traité par le texte$$),
            jsonb_build_array($$L'explication en contexte$$, $$Reformuler le sens d'une expression du texte, compte tenu de son contexte$$),
            jsonb_build_array($$La visée argumentative$$, $$Formuler la thèse que l'auteur défend dans le texte$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois questions qui précèdent généralement le résumé d'un texte argumentatif ?$$, 'solution', $$Le thème, l'explication en contexte d'une expression, et la visée argumentative.$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier le thème$$,
        'body', $$Le thème est le sujet général dont parle le texte, formulé en une courte expression (par exemple « l'alimentation » ou « la liberté »). Il ne faut pas le confondre avec la thèse : le thème est neutre, alors que la thèse exprime une opinion sur ce thème.$$,
        'highlights', array[$$thème$$, $$neutre$$]::text[],
        'example', jsonb_build_object('statement', $$Quel est le thème d'un texte qui décrit les liens entre l'alimentation et les maladies modernes ?$$, 'solution', $$Le thème abordé est l'alimentation.$$),
        'fixation', jsonb_build_object('question', $$Que ne faut-il pas confondre avec le thème d'un texte ?$$, 'solution', $$La thèse de l'auteur, c'est-à-dire son opinion sur ce thème.$$)
      ),
      jsonb_build_object(
        'heading', $$Expliquer une expression en contexte$$,
        'body', $$Expliquer une expression « en contexte » consiste à reformuler avec ses propres mots ce qu'elle signifie dans le passage où elle apparaît, et non à donner une définition générale et hors-sujet des mots qui la composent.$$,
        'highlights', array[$$en contexte$$, $$reformuler$$]::text[],
        'example', jsonb_build_object('statement', $$Que signifie, en contexte, l'expression « on creuse sa propre tombe avec ses dents » dans un texte sur l'alimentation ?$$, 'solution', $$Cela signifie que de mauvaises habitudes alimentaires conduisent progressivement les gens vers la maladie et la mort.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi ne suffit-il pas de donner une définition générale des mots d'une expression ?$$, 'solution', $$Parce que le sens d'une expression dépend du contexte précis dans lequel l'auteur l'emploie.$$)
      ),
      jsonb_build_object(
        'heading', $$Déterminer la visée argumentative$$,
        'body', $$La visée argumentative est la thèse que l'auteur cherche à faire admettre au lecteur ; elle se formule sous la forme d'une affirmation claire, résumant la position défendue dans l'ensemble du texte.$$,
        'highlights', array[$$visée argumentative$$, $$thèse$$]::text[],
        'fixation', jsonb_build_object('question', $$Sous quelle forme formule-t-on la visée argumentative d'un texte ?$$, 'solution', $$Sous la forme d'une affirmation claire qui résume la position défendue par l'auteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte argumentatif affirme que les réseaux sociaux nuisent gravement à la concentration des élèves, en s'appuyant sur l'expression « notre attention devient une monnaie que l'on nous vole sans cesse ».$$,
      'questions', array[
        $$Identifie le thème de ce texte.$$,
        $$Explique en contexte l'expression « notre attention devient une monnaie que l'on nous vole sans cesse ».$$,
        $$Détermine la visée argumentative de l'auteur.$$,
        $$Formule, à partir de ces réponses, une phrase qui résume la position du texte.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois questions préalables au résumé d'un texte argumentatif ?$$,
      'hint', $$Le sujet, une expression, l'opinion défendue.$$,
      'expected', $$Le thème, l'explication en contexte d'une expression, et la visée argumentative.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que le thème d'un texte, et en quoi diffère-t-il de la thèse ?$$,
      'hint', $$L'un est neutre, l'autre exprime une opinion.$$,
      'expected', $$Le thème est le sujet général du texte, formulé neutrement, alors que la thèse est l'opinion de l'auteur sur ce thème.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie expliquer une expression « en contexte » ?$$,
      'hint', $$On ne définit pas les mots isolément.$$,
      'expected', $$Reformuler avec ses propres mots ce que l'expression signifie dans le passage précis où elle apparaît.$$
    ),
    jsonb_build_object(
      'question', $$Sous quelle forme la visée argumentative d'un texte se formule-t-elle ?$$,
      'hint', $$Une phrase affirmative.$$,
      'expected', $$Sous la forme d'une affirmation claire qui résume la position défendue par l'auteur.$$
    )
  ),
  now()
);
