-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3238: "EE 7: Production-écrite_rédiger_paragr_argumentatif"
-- (https://lyc.ecole-ci.org/course/view.php?id=3238)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Prdtion-écrite_S9_rédiger_paragr_argumentatif.pdf" (4 pages,
-- séance 9 : rédiger un paragraphe argumentatif). Second sujet used:
-- réfuter une affirmation de Francis Bebey sur la tradition orale (not
-- reproduced verbatim here beyond the short citation already public in the
-- subject line).
-- Rewritten/paraphrased from the source PDF: the three components of an
-- argumentative paragraph (exposition de l'argument, explication, exemple
-- d'illustration), the rule about the introductory and concluding
-- sentences, and the two récapitulatifs "étayer" vs "réfuter" a thesis.
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee7-production-ecrite-paragraphe-argumentatif',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : la production écrite — rédiger un paragraphe argumentatif$$,
  24,
  '2nde-a-fr-ee6-production-ecrite-organiser-idees',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir organisé leurs idées en plans cohérents, les élèves de seconde A doivent maintenant apprendre à transformer chaque plan en un véritable paragraphe argumentatif, structuré et convaincant, que la consigne du sujet demande d'étayer ou de réfuter.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les composantes d'un paragraphe argumentatif$$,
        'body', $$Un paragraphe argumentatif se compose de trois éléments essentiels : l'exposition de l'argument (l'idée défendue), son explication (pourquoi cette idée est vraie ou pertinente), et un exemple d'illustration qui la rend concrète. Le premier paragraphe argumentatif du développement est précédé d'une phrase d'introduction, et comme tous les autres paragraphes, il se termine par une conclusion partielle qui comprend le bilan de ce qui vient d'être dit et l'annonce du paragraphe suivant.$$,
        'highlights', array[$$argument$$, $$explication$$, $$exemple$$, $$conclusion partielle$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Composante$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Exposition de l'argument$$, $$Présente l'idée défendue$$),
            jsonb_build_array($$Explication$$, $$Justifie pourquoi cette idée est pertinente$$),
            jsonb_build_array($$Exemple d'illustration$$, $$Rend l'idée concrète$$),
            jsonb_build_array($$Conclusion partielle$$, $$Fait le bilan et annonce le paragraphe suivant$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois composantes essentielles d'un paragraphe argumentatif ?$$, 'solution', $$L'exposition de l'argument, son explication, et un exemple d'illustration.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger un paragraphe pour étayer une thèse$$,
        'body', $$Lorsque la consigne demande d'étayer (c'est-à-dire de soutenir) la thèse d'un auteur, chaque paragraphe doit : rappeler la thèse de l'auteur (uniquement dans le premier paragraphe), exposer l'argument, l'expliquer, donner une illustration, puis conclure par une phrase.$$,
        'highlights', array[$$étayer$$, $$soutenir une thèse$$]::text[],
        'fixation', jsonb_build_object('question', $$À quel moment rappelle-t-on la thèse de l'auteur, lorsqu'on étaye son propos ?$$, 'solution', $$Uniquement dans le premier paragraphe du développement.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger un paragraphe pour réfuter une thèse$$,
        'body', $$Lorsque la consigne demande de réfuter (c'est-à-dire de contredire) la thèse d'un auteur, chaque paragraphe doit : rappeler la thèse de l'auteur (uniquement dans le premier paragraphe), énoncer la thèse contraire, exposer l'argument, l'expliquer, donner une illustration, puis conclure par une phrase. Un connecteur logique d'opposition (comme « cependant ») introduit généralement le passage de la thèse rappelée à la thèse contraire.$$,
        'highlights', array[$$réfuter$$, $$thèse contraire$$]::text[],
        'example', jsonb_build_object('statement', $$Que doit faire un élève juste après avoir rappelé la thèse d'un auteur qu'il doit réfuter ?$$, 'solution', $$Il doit énoncer la thèse contraire, généralement à l'aide d'un connecteur logique d'opposition comme « cependant ».$$),
        'fixation', jsonb_build_object('question', $$Quelle étape supplémentaire distingue la réfutation de l'étayage d'une thèse ?$$, 'solution', $$L'énonciation de la thèse contraire, après le rappel de la thèse de l'auteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit rédiger le premier paragraphe d'un développement qui réfute l'affirmation suivante : « Les réseaux sociaux ne présentent aucun danger pour les jeunes. »$$,
      'questions', array[
        $$Rédige la phrase qui rappelle la thèse à réfuter.$$,
        $$Rédige la phrase qui énonce la thèse contraire, à l'aide d'un connecteur logique d'opposition.$$,
        $$Expose un argument qui soutient la thèse contraire, puis explique-le.$$,
        $$Donne un exemple d'illustration pour cet argument, puis conclus le paragraphe par une phrase de transition.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois composantes d'un paragraphe argumentatif ?$$,
      'hint', $$L'idée, sa justification, et un exemple.$$,
      'expected', $$L'exposition de l'argument, son explication et un exemple d'illustration.$$
    ),
    jsonb_build_object(
      'question', $$Que comprend la conclusion partielle d'un paragraphe argumentatif ?$$,
      'hint', $$Elle regarde en arrière et en avant.$$,
      'expected', $$Le bilan de ce qui vient d'être dit et l'annonce du paragraphe suivant.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire en plus, pour réfuter une thèse, par rapport au fait de l'étayer ?$$,
      'hint', $$On énonce le contraire.$$,
      'expected', $$Énoncer la thèse contraire, après avoir rappelé la thèse de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Dans combien de paragraphes rappelle-t-on la thèse de l'auteur ?$$,
      'hint', $$Une seule fois.$$,
      'expected', $$Uniquement dans le premier paragraphe du développement.$$
    )
  ),
  now()
);
