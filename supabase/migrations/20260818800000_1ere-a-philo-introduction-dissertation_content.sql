-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3724: "Leçon 5_L'introduction de la dissertation
-- philosophique" (https://lyc.ecole-ci.org/course/view.php?id=3724),
-- resource id 37887. Contenu réécrit à partir du PDF source (programme
-- officiel MENET-FP) ; explications méthodologiques et exemple
-- d'introduction reformulés, non copiés verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-introduction-dissertation',
  '1ere',
  'A',
  'philosophie',
  $$L'introduction de la dissertation philosophique$$,
  5,
  '1ere-a-philo-essai-problematisation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À la suite du cours sur l'essai de problématisation, des élèves de 1ère A doivent maintenant rédiger l'introduction de la dissertation philosophique. Ils décident de s'informer sur les éléments constitutifs de cette introduction et sur la manière de les agencer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et composition de l'introduction$$,
        'body', $$L'introduction est l'étape initiale de la rédaction de la dissertation philosophique. Elle consiste à poser clairement le problème du sujet, c'est-à-dire la difficulté intellectuelle à surmonter. Elle se compose de trois éléments : une amorce, l'énoncé du problème, et les aspects du problème.$$,
        'highlights', array[$$3 éléments : amorce → problème → aspects du problème$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit clairement poser l'introduction de la dissertation philosophique ?$$, 'solution', $$Le problème du sujet, c'est-à-dire la difficulté intellectuelle à surmonter.$$)
      ),
      jsonb_build_object(
        'heading', $$L'amorce, le problème et ses aspects$$,
        'body', $$L'amorce (ou généralité) peut être une idée, un constat, une définition, ou des idées opposées qui situent le sujet ; elle sert à introduire et annoncer le problème. Le problème est la difficulté intellectuelle liée au sujet, dont la résolution va susciter une argumentation. Les aspects du problème sont les différentes questions qu'il suscite ; ils annoncent les axes d'analyse qui seront développés dans le corps de la dissertation.$$,
        'highlights', array[$$amorce (constat, définition, idées opposées) → annonce le problème$$, $$aspects du problème → annoncent les axes d'analyse$$]::text[],
        'example', jsonb_build_object('statement', $$Voici une introduction au sujet « Doit-on condamner le progrès technique ? » : « L'expérience quotidienne révèle le progrès vertigineux des sciences et techniques dans presque toutes les sphères de la vie. Et cela semble confirmer l'idée selon laquelle l'avenir appartient à la science et à la technique. Malheureusement, cette évolution s'accompagne souvent d'une réelle menace pour l'humanité. Dès lors, doit-on souscrire à l'idée selon laquelle la technique est nuisible ? Dans quelle mesure la puissance technique constitue-t-elle une menace ? N'est-elle pas au contraire un facteur de développement ? » Identifie l'amorce, le problème et les aspects du problème dans ce texte.$$, 'solution', $$Amorce : les deux premières phrases (constat du progrès des sciences et techniques, opposé à la menace qu'il représente). Problème : « doit-on souscrire à l'idée selon laquelle la technique est nuisible ? ». Aspects du problème : les deux questions suivantes, sur la menace de la technique d'une part, son rôle de facteur de développement d'autre part.$$),
        'fixation', jsonb_build_object('question', $$Dans quel ordre s'agencent les trois éléments de l'introduction ?$$, 'solution', $$L'amorce, puis l'énoncé du problème, puis les aspects du problème.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le cadre de la préparation d'un devoir de niveau, ce sujet est proposé à ton groupe de travail : « Le travail contribue-t-il au bonheur ? »$$,
      'questions', array[
        $$Propose une amorce pour ce sujet.$$,
        $$Énonce le problème que pose ce sujet.$$,
        $$Rédige l'introduction complète en agençant l'amorce, le problème et deux aspects du problème.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est l'étape initiale de la rédaction de la dissertation philosophique ?$$,
      'hint', $$C'est l'objet de cette leçon.$$,
      'expected', $$L'introduction.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois éléments constitutifs de l'introduction.$$,
      'hint', $$Du plus général au plus précis.$$,
      'expected', $$L'amorce, l'énoncé du problème et les aspects du problème.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de ce que peut être une amorce.$$,
      'hint', $$Plusieurs formes sont possibles.$$,
      'expected', $$Par exemple une idée, un constat, une définition, ou des idées opposées qui situent le sujet.$$
    ),
    jsonb_build_object(
      'question', $$Que suscite la résolution du problème posé dans l'introduction ?$$,
      'hint', $$C'est ce qui constitue le corps de la dissertation.$$,
      'expected', $$Une argumentation (développée ensuite selon les axes d'analyse annoncés par les aspects du problème).$$
    )
  ),
  now()
);
