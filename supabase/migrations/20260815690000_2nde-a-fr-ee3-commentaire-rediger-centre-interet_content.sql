-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3231: "EE 3: Com_Composé_Rédiger_CI"
-- (https://lyc.ecole-ci.org/course/view.php?id=3231)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Com_Composé_S3_Rédiger_CI.pdf" (5 pages, Leçon 2 : le
-- commentaire composé, séance 3 : rédiger un centre d'intérêt). Support
-- texts: Victor Hugo, "Veni, Vidi, Vixi", and Arthur Rimbaud's 1870 poem
-- on nature and a dead soldier (not reproduced here).
-- Rewritten/paraphrased from the source PDF: the method for redacting a
-- paragraph from an organised centre d'intérêt (topic sentence, textual
-- evidence, analysis of procédés, transition), and the final presentation
-- and language-quality recommendations. 100% original wording; no sentence
-- or line of the poems copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee3-commentaire-rediger-centre-interet',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le commentaire composé — rédiger un centre d'intérêt$$,
  20,
  '2nde-a-fr-ee2-commentaire-organiser-centre-interet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à analyser un libellé et à organiser un centre d'intérêt en sous-centres, les élèves de seconde A doivent maintenant franchir la dernière étape : transformer cette organisation en un paragraphe rédigé, clair et bien argumenté. Ils s'organisent pour apprendre la démarche de rédaction d'un centre d'intérêt de commentaire composé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Annoncer l'idée du sous-centre$$,
        'body', $$La rédaction d'un paragraphe consacré à un sous-centre commence par une phrase qui annonce clairement l'idée développée : par exemple, si le sous-centre porte sur la peinture d'une nature vivante, la première phrase du paragraphe présente directement cette idée, avant de la démontrer à l'aide du texte.$$,
        'highlights', array[$$phrase d'annonce$$, $$sous-centre$$]::text[],
        'fixation', jsonb_build_object('question', $$Par quoi doit commencer le paragraphe consacré à un sous-centre ?$$, 'solution', $$Par une phrase qui annonce clairement l'idée développée dans ce sous-centre.$$)
      ),
      jsonb_build_object(
        'heading', $$Justifier l'idée à l'aide du texte$$,
        'body', $$Une fois l'idée annoncée, il faut la justifier en citant les mots ou expressions du texte qui l'illustrent (entre guillemets), puis en nommant le procédé d'écriture qu'ils mettent en œuvre (par exemple un présentatif, une figure de style, un choix lexical) et en expliquant l'effet que ce procédé produit sur le sens du texte.$$,
        'highlights', array[$$citations$$, $$procédé$$, $$effet de sens$$]::text[],
        'example', jsonb_build_object('statement', $$Comment justifier l'idée qu'un poète décrit un décor naturel de façon vivante et précise ?$$, 'solution', $$En citant les mots du texte qui décrivent ce décor, en identifiant le procédé employé (par exemple l'usage de présentatifs ou un vocabulaire riche et varié), puis en expliquant que cela met en relief la précision et la vivacité du décor décrit.$$),
        'fixation', jsonb_build_object('question', $$Que faut-il faire, après avoir cité un passage du texte, pour bien justifier une idée ?$$, 'solution', $$Nommer le procédé d'écriture qu'il met en œuvre, puis expliquer l'effet de sens qu'il produit.$$)
      ),
      jsonb_build_object(
        'heading', $$Enchaîner les sous-centres$$,
        'body', $$Un centre d'intérêt réunissant plusieurs sous-centres, il faut veiller à les enchaîner avec des connecteurs logiques ou des transitions, afin que le paragraphe forme un tout cohérent et non une simple juxtaposition d'observations isolées.$$,
        'highlights', array[$$enchaînement$$, $$cohérence$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi faut-il utiliser des connecteurs logiques entre les sous-centres d'un même centre d'intérêt ?$$, 'solution', $$Pour que le paragraphe forme un ensemble cohérent et non une simple juxtaposition d'observations isolées.$$)
      ),
      jsonb_build_object(
        'heading', $$Soigner la forme de la rédaction$$,
        'body', $$Pour finir, la qualité de la rédaction ne dépend pas que du contenu : il faut aussi soigner la présentation typographique, en faisant bien apparaître les parties et les sous-parties par des sauts de ligne, et utiliser une langue correcte et soutenue, en évitant les imprécisions et les termes vagues.$$,
        'highlights', array[$$présentation typographique$$, $$langue soutenue$$]::text[],
        'fixation', jsonb_build_object('question', $$Que faut-il éviter dans la langue employée pour rédiger un commentaire composé ?$$, 'solution', $$Les imprécisions et les termes vagues ; il faut utiliser une langue correcte et soutenue.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève a organisé le centre d'intérêt « la peur du personnage » en deux sous-centres : les manifestations physiques de la peur, et les pensées confuses du personnage. Il doit maintenant rédiger ce centre d'intérêt.$$,
      'questions', array[
        $$Rédige la phrase d'annonce du premier sous-centre (les manifestations physiques de la peur).$$,
        $$Indique quel type de procédé d'écriture pourrait illustrer des manifestations physiques de la peur dans un texte.$$,
        $$Propose un connecteur logique pour enchaîner le premier sous-centre avec le second.$$,
        $$Rappelle deux recommandations à respecter concernant la forme de la rédaction.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Par quoi doit commencer la rédaction d'un sous-centre ?$$,
      'hint', $$Une phrase qui présente l'idée.$$,
      'expected', $$Par une phrase qui annonce clairement l'idée développée.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire après avoir cité un passage du texte ?$$,
      'hint', $$Nommer et expliquer.$$,
      'expected', $$Nommer le procédé d'écriture employé et expliquer l'effet de sens qu'il produit.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi enchaîner les sous-centres avec des connecteurs logiques ?$$,
      'hint', $$Pour la cohérence du paragraphe.$$,
      'expected', $$Pour que le paragraphe forme un ensemble cohérent et non une juxtaposition d'observations isolées.$$
    ),
    jsonb_build_object(
      'question', $$Quelle recommandation concerne la présentation typographique du commentaire composé ?$$,
      'hint', $$Elle aide à visualiser le plan.$$,
      'expected', $$Faire bien apparaître les parties et sous-parties par des sauts de ligne.$$
    )
  ),
  now()
);
