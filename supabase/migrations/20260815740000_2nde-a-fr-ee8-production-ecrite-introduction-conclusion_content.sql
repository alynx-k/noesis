-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3239: "EE 8: Production-écrite_Rédiger_iintro_conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=3239)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Prdtion-écrite_S10_Rédiger_iintro_conclusion.pdf" (4 pages,
-- séance 10 : rédiger l'introduction et la conclusion de la production
-- écrite). Sujets support : Stella et Joël de Rosnay, "La Mal Bouffe"
-- (Éditions Olivier Orban) ; Francis Bebey, avant-propos de la revue
-- Recherche Pédagogie et Culture, n°29-30, mai-août 1977 (citations
-- publiques du sujet, non développées ici).
-- Rewritten/paraphrased from the source PDF: the two components of the
-- introduction (phrase d'accrochage présentant l'auteur/le texte/la
-- source, puis prise de position) and the two components of the
-- conclusion (bilan de l'argumentation, puis ouverture), illustrated with
-- the source's own worked examples. 100% original wording; no sentence
-- copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee8-production-ecrite-introduction-conclusion',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : la production écrite — rédiger l'introduction et la conclusion$$,
  25,
  '2nde-a-fr-ee7-production-ecrite-paragraphe-argumentatif',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à rédiger les paragraphes argumentatifs du développement, les élèves de seconde A doivent encadrer leur texte argumentatif par une introduction qui présente le sujet et prend position, et une conclusion qui fait le bilan de l'argumentation et l'ouvre vers une autre perspective. Ils s'organisent pour apprendre cette dernière étape de la production écrite.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La phrase d'accrochage$$,
        'body', $$L'introduction d'une production écrite s'ouvre par une phrase d'accrochage qui présente le texte-support : le nom de l'auteur, le passage à partir duquel le sujet est formulé, le titre du texte, et la source de l'extrait (revue, ouvrage, date de publication).$$,
        'highlights', array[$$phrase d'accrochage$$, $$texte-support$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit préciser la phrase d'accrochage d'une introduction ?$$, 'solution', $$Le nom de l'auteur, le titre du texte, le passage cité et la source de l'extrait.$$)
      ),
      jsonb_build_object(
        'heading', $$Prendre position$$,
        'body', $$Après la phrase d'accrochage, l'introduction doit annoncer la position qui sera adoptée dans le développement : le candidat précise s'il va étayer ou réfuter l'affirmation citée, et sur quels plans ou axes il compte le faire (par exemple sur le plan alimentaire, scientifique et social).$$,
        'highlights', array[$$prise de position$$, $$plans annoncés$$]::text[],
        'example', jsonb_build_object('statement', $$Comment un candidat annonce-t-il sa position dans l'introduction, s'il doit réfuter une affirmation sur la tradition orale ?$$, 'solution', $$Il précise qu'il va réfuter l'opinion de l'auteur, en annonçant les plans qu'il développera, par exemple le plan médicinal, social et intellectuel.$$),
        'fixation', jsonb_build_object('question', $$Que doit annoncer la prise de position, en plus du choix d'étayer ou de réfuter ?$$, 'solution', $$Les plans ou axes qui seront développés dans le corps du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Le bilan de l'argumentation$$,
        'body', $$La conclusion commence par un bilan de l'argumentation : une phrase qui rappelle, en résumé, ce que le développement a permis d'établir, généralement introduite par une expression comme « en conclusion, nous retenons que... ».$$,
        'highlights', array[$$bilan$$, $$conclusion$$]::text[],
        'fixation', jsonb_build_object('question', $$Par quelle expression commence généralement le bilan d'une conclusion ?$$, 'solution', $$Une expression comme « en conclusion, nous retenons que... ».$$)
      ),
      jsonb_build_object(
        'heading', $$L'ouverture$$,
        'body', $$Après le bilan, la conclusion se termine par une ouverture : une question ou une remarque qui élargit la réflexion vers un aspect voisin du sujet, sans y répondre complètement, afin d'inviter le lecteur à poursuivre la réflexion.$$,
        'highlights', array[$$ouverture$$]::text[],
        'example', jsonb_build_object('statement', $$Quel type d'ouverture pourrait suivre un bilan qui affirme que la tradition orale freine le développement d'une société ?$$, 'solution', $$Une question qui nuance ce bilan, par exemple en se demandant si certains éléments de la tradition orale ne peuvent pas, au contraire, être un facteur de développement économique, social et culturel.$$),
        'fixation', jsonb_build_object('question', $$À quoi sert l'ouverture à la fin d'une conclusion ?$$, 'solution', $$Elle élargit la réflexion vers un aspect voisin du sujet, sans le traiter entièrement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit rédiger l'introduction et la conclusion d'un texte argumentatif qui réfute l'affirmation suivante, tirée d'un article de magazine : « Le sport n'a aucune influence sur la réussite scolaire des jeunes. »$$,
      'questions', array[
        $$Rédige la phrase d'accrochage de l'introduction (tu peux inventer un nom d'auteur et une source).$$,
        $$Rédige la phrase de prise de position, en annonçant deux plans que tu développeras.$$,
        $$Rédige le bilan de la conclusion, en résumé de l'argumentation développée.$$,
        $$Rédige une phrase d'ouverture qui élargit la réflexion vers un sujet voisin.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que présente la phrase d'accrochage d'une introduction ?$$,
      'hint', $$Elle situe le texte-support.$$,
      'expected', $$Le nom de l'auteur, le titre du texte et la source de l'extrait.$$
    ),
    jsonb_build_object(
      'question', $$Que doit annoncer la prise de position dans l'introduction ?$$,
      'hint', $$Étayer ou réfuter, et sur quoi.$$,
      'expected', $$Si l'on va étayer ou réfuter l'affirmation, et les plans qui seront développés.$$
    ),
    jsonb_build_object(
      'question', $$Par quoi commence la conclusion ?$$,
      'hint', $$Un résumé de l'argumentation.$$,
      'expected', $$Par le bilan de l'argumentation.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'ouverture, à la fin d'une conclusion ?$$,
      'hint', $$Elle regarde au-delà du sujet traité.$$,
      'expected', $$Une question ou une remarque qui élargit la réflexion vers un aspect voisin du sujet.$$
    )
  ),
  now()
);
