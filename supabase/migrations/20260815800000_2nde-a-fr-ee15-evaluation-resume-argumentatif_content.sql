-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3738: "EE 15: Evaluation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3738)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_S12_Evaluation.pdf" (9 pages, séance 12 : évaluation sommative
-- de la leçon "Résumé du texte argumentatif"). Texte support n°4 : Margarida
-- Rome (Université de Laval), texte sur le numérique à l'école, "contact",
-- 28 septembre 2016 (source publique, non développée ici) ; l'évaluation
-- combine les trois exercices I-Questions, II-Résumé, III-Production
-- écrite déjà pratiqués séparément dans les leçons précédentes (EE10 à
-- EE14 ci-avant, ainsi que EE1 à EE8 pour la production écrite).
-- Rewritten/paraphrased from the source PDF: the three-part structure of
-- the summative evaluation, and a recap, on a paraphrased version of the
-- source's own topic (le numérique à l'école) and its model correction
-- (thème, thèse, structure en séquences, tonalité, calcul du volume du
-- résumé, rédaction d'un paragraphe argumentatif de réfutation avec
-- introduction et conclusion), of every method taught in EE1 to EE14. No
-- sentence, résumé, or paragraph from the source is reproduced verbatim;
-- the worked example given here is an original illustration built from the
-- same method.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee15-evaluation-resume-argumentatif',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : évaluation sommative sur le résumé du texte argumentatif$$,
  31,
  '2nde-a-fr-ee14-resume-argumentatif-rediger-resume',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris séparément à répondre aux questions préalables, identifier la situation d'argumentation, sélectionner et enchaîner les idées essentielles, les reformuler et rédiger le résumé, les élèves de seconde A doivent maintenant mobiliser toutes ces compétences ensemble, dans une évaluation sommative en trois parties, portant sur un nouveau texte argumentatif.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois parties de l'évaluation sommative$$,
        'body', $$L'évaluation sommative de la leçon « Résumé du texte argumentatif » comprend toujours trois parties portant sur le même texte : des questions de compréhension et d'analyse, un résumé du texte au quart de son volume, et une production écrite argumentative qui prolonge ou discute la thèse du texte.$$,
        'highlights', array[$$I. Questions$$, $$II. Résumé$$, $$III. Production écrite$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Partie$$, $$Ce qu'elle évalue$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$I. Questions$$, $$Expliquer une expression en contexte, déterminer la visée argumentative$$),
            jsonb_build_array($$II. Résumé$$, $$Sélectionner, enchaîner, reformuler et rédiger le résumé au quart du volume$$),
            jsonb_build_array($$III. Production écrite$$, $$Rédiger un développement argumenté (étayer ou réfuter une thèse) avec introduction et conclusion$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois parties d'une évaluation sommative sur le résumé du texte argumentatif ?$$, 'solution', $$Des questions de compréhension, un résumé du texte, et une production écrite argumentative.$$)
      ),
      jsonb_build_object(
        'heading', $$Réviser l'analyse de la situation d'argumentation$$,
        'body', $$Sur un texte qui, par exemple, rapporte l'avis de parents souhaitant interdire le numérique à l'école avant de le nuancer, on commence par dégager le thème (le numérique à l'école), la thèse réellement défendue par l'auteur (le numérique est un outil qui doit être utilisé avec discernement), puis la structure en séquences (le rejet du numérique par certains parents, les avis favorables au numérique, une approche plus mesurée qui les concilie).$$,
        'highlights', array[$$thème$$, $$thèse nuancée$$, $$structure en séquences$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la visée argumentative d'un texte qui reconnaît des risques au numérique à l'école, tout en défendant finalement son utilité si son usage est bien encadré ?$$, 'solution', $$Amener le lecteur à apprécier l'usage du numérique à l'école de façon objective, plutôt que de l'accepter ou de le rejeter en bloc.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi est-il utile de repérer la structure en séquences avant de résumer un texte nuancé ?$$, 'solution', $$Parce qu'elle fait apparaître les différentes étapes du raisonnement de l'auteur, nécessaires pour comprendre sa thèse complète.$$)
      ),
      jsonb_build_object(
        'heading', $$Réviser la rédaction du résumé$$,
        'body', $$Pour résumer ce type de texte, on calcule d'abord le volume attendu (le quart du nombre de mots, avec une marge de 10 %), puis on rédige, en un seul bloc et dans l'ordre du texte, les idées essentielles déjà sélectionnées, enchaînées par des connecteurs logiques et reformulées avec ses propres mots.$$,
        'highlights', array[$$calcul du volume$$, $$un seul bloc$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles étapes doit-on suivre, dans l'ordre, pour rédiger le résumé lors de l'évaluation ?$$, 'solution', $$Calculer le volume attendu, sélectionner les idées essentielles, les enchaîner logiquement, les reformuler, puis les rédiger en un bloc respectant l'ordre du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Réviser la production écrite argumentative$$,
        'body', $$Pour la production écrite, on analyse d'abord le sujet donné (la thèse à étayer ou à réfuter), on organise ses arguments et exemples en paragraphes, puis on encadre le développement d'une introduction (phrase d'accrochage et prise de position) et d'une conclusion (bilan de l'argumentation et ouverture), exactement comme appris dans les leçons précédentes sur la production écrite.$$,
        'highlights', array[$$analyser le sujet$$, $$introduction et conclusion$$]::text[],
        'example', jsonb_build_object('statement', $$Face au sujet « Réfutez l'idée que le numérique devrait être interdit à l'école », que doit d'abord identifier l'élève avant de rédiger ?$$, 'solution', $$La thèse à réfuter (le numérique devrait être interdit à l'école) et la thèse contraire qu'il va défendre (le numérique est un outil qui doit être utilisé à l'école).$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux composantes de l'introduction d'une production écrite argumentative ?$$, 'solution', $$La phrase d'accrochage et la prise de position.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte de 400 mots affirme que les jeux vidéo nuisent uniquement à la réussite scolaire des élèves, avant de nuancer cette affirmation en évoquant certains usages éducatifs du jeu vidéo.$$,
      'questions', array[
        $$I. Questions : explique en contexte l'expression « nuisent uniquement », et détermine la visée argumentative de ce texte.$$,
        $$II. Résumé : calcule le nombre de mots attendu pour le résumé de ce texte, avec sa marge de tolérance.$$,
        $$III. Production écrite : réfute, dans une introduction et un développement d'un paragraphe, l'idée que les jeux vidéo nuisent uniquement à la réussite scolaire.$$,
        $$Rédige la conclusion de cette production écrite, avec un bilan et une ouverture.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois parties d'une évaluation sommative sur le résumé du texte argumentatif ?$$,
      'hint', $$Comprendre, résumer, produire.$$,
      'expected', $$Des questions de compréhension et d'analyse, un résumé du texte, et une production écrite argumentative.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il calculer avant de rédiger le résumé, lors de l'évaluation ?$$,
      'hint', $$Un nombre de mots.$$,
      'expected', $$Le volume attendu du résumé, c'est-à-dire le quart du nombre de mots du texte, avec une marge de tolérance de 10 %.$$
    ),
    jsonb_build_object(
      'question', $$Que doit identifier l'élève avant de rédiger une production écrite qui réfute une thèse ?$$,
      'hint', $$La thèse et son contraire.$$,
      'expected', $$La thèse de l'auteur à réfuter, et la thèse contraire qu'il va lui-même défendre.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux composantes de la conclusion d'une production écrite argumentative ?$$,
      'hint', $$Un résumé et une ouverture.$$,
      'expected', $$Le bilan de l'argumentation et l'ouverture vers un aspect voisin du sujet.$$
    )
  ),
  now()
);
