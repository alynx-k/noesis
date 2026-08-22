-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3734: "Leçon 5_L'introduction de la dissertation
-- philosophique" (https://lyc.ecole-ci.org/course/view.php?id=3734),
-- resource id 81797 (Philo_1C_lecon5). Contenu réécrit à partir du PDF source
-- (programme officiel MENET-FP) ; explications méthodologiques et exemple
-- d'introduction reformulés, non copiés verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-introduction-dissertation',
  '1ere',
  'C',
  'philosophie',
  $$L'introduction de la dissertation philosophique$$,
  5,
  '1ere-c-philo-essai-problematisation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À la suite du cours sur l'essai de problématisation, les élèves de la classe de 1ère A1 du lycée municipal 1 de Bonoua sont amenés, conformément à la progression, à rédiger l'introduction de la dissertation philosophique. Soucieux de réussir cet exercice, ils décident de s'informer sur les éléments constitutifs de l'introduction, la manière de les agencer et de construire celle-ci.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et composition de l'introduction$$,
        'body', $$L'introduction est l'étape initiale de la rédaction de la dissertation philosophique. Elle consiste à poser clairement le problème du sujet, qui est la difficulté intellectuelle à surmonter. Elle se compose de trois éléments : une amorce, l'énoncé du problème, et les aspects du problème.$$,
        'highlights', array[$$3 éléments : amorce → problème → aspects du problème$$]::text[],
        'fixation', jsonb_build_object('question', $$Que consiste à poser clairement l'introduction de la dissertation philosophique ?$$, 'solution', $$Le problème du sujet, c'est-à-dire la difficulté intellectuelle à surmonter.$$)
      ),
      jsonb_build_object(
        'heading', $$L'amorce, le problème et ses aspects$$,
        'body', $$L'amorce (ou généralité) peut être une idée, un constat, une définition, ou des idées opposées qui situent le sujet. Le problème est la difficulté intellectuelle liée au sujet dont la résolution va susciter une argumentation ; il est annoncé par l'amorce. Les aspects du problème sont les différentes questions suscitées par le problème ; ils annoncent les axes d'analyse du sujet.$$,
        'highlights', array[$$amorce (idée, constat, définition, idées opposées) → annonce le problème$$, $$aspects du problème → annoncent les axes d'analyse du sujet$$]::text[],
        'example', jsonb_build_object('statement', $$Fais l'étude parcellaire du sujet suivant : « L'autre est-il absolument mon ennemi ? »$$, 'solution', $$L'autre : le semblable, le prochain. Absolument : forcément, toujours. Ennemi : celui qui cherche à me nuire, me détruire.$$),
        'fixation', jsonb_build_object('question', $$Par quoi le problème est-il annoncé ?$$, 'solution', $$Par l'amorce.$$)
      ),
      jsonb_build_object(
        'heading', $$La rédaction de l'introduction$$,
        'body', $$Rédiger une introduction consiste à agencer de façon cohérente les éléments qui la composent : l'amorce, puis l'énoncé du problème, puis les aspects du problème.$$,
        'highlights', array[$$rédiger l'introduction = agencer de façon cohérente amorce, problème, aspects du problème$$]::text[],
        'example', jsonb_build_object('statement', $$Voici une introduction au sujet « Doit-on condamner le progrès technique ? » : « L'expérience quotidienne nous révèle le progrès vertigineux des sciences et techniques dans presque toutes les sphères de la vie. Et cela semble confirmer l'idée selon laquelle l'avenir appartient à la science et à la technique. Malheureusement, cette évolution de la technoscience s'accompagne souvent d'une réelle menace pour l'humanité entière. Dès lors, doit-on souscrire à l'idée selon laquelle la technique est nuisible ? Dans quelle mesure la puissance technique constitue-t-elle une menace ? N'est-elle pas au contraire un facteur de développement ? » Identifie l'amorce, le problème et les aspects du problème.$$, 'solution', $$Amorce : les deux premières phrases (constat du progrès des sciences et techniques, puis la menace qui l'accompagne). Problème : « doit-on souscrire à l'idée selon laquelle la technique est nuisible ? ». Aspects du problème : « dans quelle mesure la puissance technique constitue-t-elle une menace ? » et « n'est-elle pas au contraire un facteur de développement ? ».$$),
        'fixation', jsonb_build_object('question', $$Dans quel ordre s'agencent les éléments de l'introduction ?$$, 'solution', $$L'amorce, puis l'énoncé du problème, puis les aspects du problème.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le cadre de la préparation d'un devoir de niveau, le sujet suivant est proposé à ton groupe de travail : « Le travail contribue-t-il au bonheur ? » Aide tes camarades à rédiger une introduction.$$,
      'questions', array[
        $$Propose une amorce pour ce sujet.$$,
        $$Énonce le problème que pose ce sujet.$$,
        $$Rédige l'introduction complète en agençant l'amorce, le problème et au moins deux aspects du problème.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois éléments constitutifs de l'introduction de la dissertation philosophique ?$$,
      'hint', $$Ils s'agencent du plus général au plus précis.$$,
      'expected', $$L'amorce, l'énoncé du problème, et les aspects du problème.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'amorce ?$$,
      'hint', $$Elle situe le sujet avant d'annoncer le problème.$$,
      'expected', $$Une idée, un constat, une définition ou des idées opposées qui situent le sujet.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on les « aspects du problème » ?$$,
      'hint', $$Ils préfigurent le développement de la dissertation.$$,
      'expected', $$Les différentes questions suscitées par le problème, qui annoncent les axes d'analyse du sujet.$$
    ),
    jsonb_build_object(
      'question', $$En quoi consiste la rédaction de l'introduction ?$$,
      'hint', $$C'est une opération d'organisation, pas de simple juxtaposition.$$,
      'expected', $$À agencer de façon cohérente l'amorce, l'énoncé du problème et les aspects du problème.$$
    )
  ),
  now()
);
