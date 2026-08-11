-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3230: "EE 2: Com_Composé_Organiser_CI"
-- (https://lyc.ecole-ci.org/course/view.php?id=3230)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Com_Composé_S2_Organiser_CI.pdf" (5 pages, Leçon 2 : le
-- commentaire composé, séance 2 : organiser un centre d'intérêt). Support
-- texts: an unnamed poem on the poet's bitterness, and Léopold Sédar
-- Senghor, "Chants d'ombre" (1945) (not reproduced here).
-- Rewritten/paraphrased from the source PDF: the technique of breaking a
-- centre d'intérêt into several "sous-centres", each supported by textual
-- indices, a stylistic procédé, and an interpretation, illustrated with an
-- original example inspired by the source's own worked correction
-- (portrait physique / portrait moral). 100% original wording; no
-- sentence, and no line of the poems quoted in the source, copied here.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee2-commentaire-organiser-centre-interet',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le commentaire composé — organiser un centre d'intérêt$$,
  19,
  '2nde-a-fr-ee1-commentaire-analyser-libelle',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à analyser le libellé d'un sujet de commentaire composé et à identifier les centres d'intérêt d'un texte, les élèves de seconde A veulent aller plus loin : comment transformer un centre d'intérêt, souvent assez large, en un paragraphe de commentaire bien organisé et argumenté ? Ils s'organisent pour apprendre la démarche qui permet d'organiser un centre d'intérêt avant de le rédiger.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pourquoi organiser un centre d'intérêt ?$$,
        'body', $$Un centre d'intérêt est souvent une idée assez large pour être développée directement en un seul bloc. Avant de le rédiger, il faut donc l'organiser, c'est-à-dire le décomposer en plusieurs sous-centres, chacun correspondant à un aspect plus précis de l'idée générale. Cette organisation permet de structurer clairement le développement et d'éviter un commentaire trop confus ou trop général.$$,
        'highlights', array[$$centre d'intérêt$$, $$sous-centres$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi est-il utile de décomposer un centre d'intérêt en sous-centres ?$$, 'solution', $$Pour structurer clairement le développement et éviter un commentaire trop général ou confus.$$)
      ),
      jsonb_build_object(
        'heading', $$La démarche : indices, procédé, interprétation$$,
        'body', $$Pour chaque sous-centre dégagé, on procède de la même façon : on relève les indices textuels qui s'y rapportent (mots, expressions caractéristiques) ; on identifie le procédé d'écriture qu'ils mettent en œuvre (une figure de style, un choix lexical, une construction syntaxique particulière) ; puis on propose une interprétation, c'est-à-dire ce que ce procédé révèle sur le sens du texte ou sur l'intention de l'auteur.$$,
        'highlights', array[$$indices$$, $$procédé$$, $$interprétation$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Sous-centre$$, $$Indices textuels$$, $$Procédé$$, $$Interprétation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Le portrait physique$$, $$Mots décrivant le corps, comparaisons$$, $$Métaphores, comparaison hyperbolique$$, $$Une beauté présentée comme unique et sans égale$$),
            jsonb_build_array($$Le portrait moral$$, $$Mots évoquant la protection, l'espérance$$, $$Personnification, métaphore protectrice$$, $$Une figure qui rassure et protège le poète$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans un centre d'intérêt consacré à la beauté d'un personnage, quels pourraient être deux sous-centres pertinents ?$$, 'solution', $$Par exemple le portrait physique du personnage, et le portrait moral (ses qualités de caractère).$$),
        'fixation', jsonb_build_object('question', $$Que faut-il faire, pour chaque sous-centre, après avoir relevé les indices textuels ?$$, 'solution', $$Identifier le procédé d'écriture qu'ils mettent en œuvre, puis en proposer une interprétation.$$)
      ),
      jsonb_build_object(
        'heading', $$De l'organisation à la rédaction$$,
        'body', $$Une fois les sous-centres clairement organisés, chacun peut devenir un paragraphe argumenté à l'intérieur du développement consacré au centre d'intérêt : on y présente l'idée du sous-centre, on l'appuie par les indices textuels relevés, on nomme le procédé identifié, et on conclut par l'interprétation qui en découle. L'ensemble des sous-centres, mis bout à bout, restitue alors la richesse complète du centre d'intérêt.$$,
        'highlights', array[$$paragraphe argumenté$$, $$développement$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi correspond, dans la rédaction finale, chaque sous-centre organisé ?$$, 'solution', $$À un paragraphe argumenté à l'intérieur du développement consacré au centre d'intérêt.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit organiser le centre d'intérêt suivant, tiré d'un poème : « L'attachement du poète à sa terre natale ». Il a déjà relevé deux types d'indices : des mots évoquant les paysages (fleuves, savanes, montagnes) et des mots évoquant les souvenirs d'enfance.$$,
      'questions', array[
        $$Propose deux sous-centres pertinents pour organiser ce centre d'intérêt.$$,
        $$Pour le premier sous-centre, indique un procédé d'écriture que le poète pourrait avoir utilisé.$$,
        $$Propose une interprétation pour ce premier sous-centre.$$,
        $$Explique comment ces deux sous-centres pourraient devenir deux paragraphes du développement.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un sous-centre ?$$,
      'hint', $$Il précise un aspect d'un centre d'intérêt.$$,
      'expected', $$Une décomposition plus précise d'un centre d'intérêt, correspondant à un aspect particulier de l'idée générale.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois étapes de l'analyse d'un sous-centre ?$$,
      'hint', $$Relever, identifier, interpréter.$$,
      'expected', $$Relever les indices textuels, identifier le procédé d'écriture, puis proposer une interprétation.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi organiser un centre d'intérêt avant de le rédiger ?$$,
      'hint', $$Cela évite un développement trop vague.$$,
      'expected', $$Pour structurer clairement le développement et éviter un commentaire trop général ou confus.$$
    ),
    jsonb_build_object(
      'question', $$À quoi correspond un sous-centre organisé, une fois la rédaction commencée ?$$,
      'hint', $$Une unité du développement.$$,
      'expected', $$À un paragraphe argumenté du développement.$$
    )
  ),
  now()
);
