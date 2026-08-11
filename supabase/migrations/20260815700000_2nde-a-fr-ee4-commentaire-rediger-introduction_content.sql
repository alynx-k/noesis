-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3233: "EE 4: Com_Composé_Rédiger_Introduction"
-- (https://lyc.ecole-ci.org/course/view.php?id=3233)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Com_Composé_S5_Rédiger_Introduction.pdf" (3 pages, Leçon 2 : le
-- commentaire composé, séance 4 : rédiger l'introduction du commentaire
-- composé). Support text: Victor Hugo, "Veni, Vidi, Vixi" (Les
-- Contemplations, IV, XIII, avril 1848) (not reproduced here).
-- Rewritten/paraphrased from the source PDF: the components of an
-- introduction (présentation de l'œuvre et de sa date, idée générale du
-- texte, annonce du plan/centres d'intérêt), illustrated with an original
-- example inspired by the source's own worked introduction on the theme of
-- death. 100% original wording; no sentence copied from the source, and no
-- line of the poem reproduced.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee4-commentaire-rediger-introduction',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le commentaire composé — rédiger l'introduction$$,
  21,
  '2nde-a-fr-ee3-commentaire-rediger-centre-interet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à analyser le libellé, à organiser puis à rédiger un centre d'intérêt, les élèves de seconde A doivent encore apprendre à ouvrir leur commentaire composé par une introduction efficace, qui présente le texte et annonce le plan qui sera suivi. Ils s'organisent pour apprendre la démarche de rédaction de l'introduction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Présenter l'œuvre et son idée générale$$,
        'body', $$L'introduction du commentaire composé doit d'abord présenter le titre de l'œuvre et sa date de publication, avant de dégager l'idée générale du texte, c'est-à-dire un résumé bref de ce dont il traite ou de la thèse qu'il défend.$$,
        'highlights', array[$$titre de l'œuvre$$, $$idée générale$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit préciser l'introduction concernant l'œuvre étudiée ?$$, 'solution', $$Le titre de l'œuvre et sa date de publication.$$)
      ),
      jsonb_build_object(
        'heading', $$Annoncer le plan du commentaire$$,
        'body', $$La dernière étape de l'introduction consiste à annoncer le plan du commentaire, c'est-à-dire à énumérer brièvement les centres d'intérêt du texte. Ces centres d'intérêt correspondent aux différentes parties du développement qui suivra.$$,
        'highlights', array[$$annonce du plan$$, $$centres d'intérêt$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi correspondent, dans le développement, les centres d'intérêt annoncés dans l'introduction ?$$, 'solution', $$Aux différentes parties du développement qui suit l'introduction.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de démarche d'introduction$$,
        'body', $$Une introduction efficace part généralement d'une idée générale sur le thème du texte (par exemple, une réflexion sur un sentiment universel), avant de resserrer le propos sur l'œuvre étudiée en la nommant et en la situant dans le temps, puis de dégager l'idée que le texte développe sur ce thème, et enfin d'annoncer les centres d'intérêt qui seront étudiés.$$,
        'highlights', array[$$idée générale$$, $$resserrement$$]::text[],
        'example', jsonb_build_object('statement', $$Comment pourrait débuter l'introduction d'un commentaire composé sur un poème traitant de la solitude ?$$, 'solution', $$Par une réflexion générale sur la solitude comme expérience humaine, avant de présenter le poème et son auteur, puis d'annoncer les centres d'intérêt qui seront étudiés (par exemple la souffrance du personnage et sa recherche de réconfort).$$),
        'fixation', jsonb_build_object('question', $$Par quel type de phrase commence généralement une introduction de commentaire composé ?$$, 'solution', $$Par une idée générale sur le thème du texte, avant de resserrer le propos sur l'œuvre étudiée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit rédiger l'introduction d'un commentaire composé sur un poème de 1948 qui évoque l'espoir malgré l'adversité. Il a dégagé deux centres d'intérêt : les épreuves traversées par le poète, et la force de son espoir.$$,
      'questions', array[
        $$Rédige une phrase d'ouverture générale sur le thème de l'espoir face à l'adversité.$$,
        $$Rédige la phrase qui présente le titre et la date du poème (tu peux inventer un titre).$$,
        $$Rédige la phrase qui dégage l'idée générale du texte.$$,
        $$Rédige la phrase qui annonce les deux centres d'intérêt du commentaire.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que doit contenir l'introduction concernant l'œuvre, en plus du titre ?$$,
      'hint', $$Un repère chronologique.$$,
      'expected', $$Sa date de publication.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que « dégager l'idée générale du texte » ?$$,
      'hint', $$Un bref résumé.$$,
      'expected', $$Résumer brièvement ce dont traite le texte ou la thèse qu'il défend.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il annoncer à la fin de l'introduction ?$$,
      'hint', $$Cela prépare le développement.$$,
      'expected', $$Le plan du commentaire, c'est-à-dire les centres d'intérêt du texte.$$
    ),
    jsonb_build_object(
      'question', $$Par quel type d'idée commence généralement une introduction ?$$,
      'hint', $$On part du général vers le particulier.$$,
      'expected', $$Une idée générale sur le thème du texte.$$
    )
  ),
  now()
);
