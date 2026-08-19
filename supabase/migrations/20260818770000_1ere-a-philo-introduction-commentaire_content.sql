-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3721: "Leçon 2_L'Introduction du commentaire de texte
-- philosophique" (https://lyc.ecole-ci.org/course/view.php?id=3721),
-- resource id 37851. Contenu réécrit à partir du PDF source (programme
-- officiel MENET-FP). La citation d'Épictète est un texte du domaine
-- public utilisée à des fins d'analyse pédagogique ; explications
-- méthodologiques reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-introduction-commentaire',
  '1ere',
  'A',
  'philosophie',
  $$L'introduction du commentaire de texte philosophique$$,
  2,
  '1ere-a-philo-methode-lecture-texte',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À la suite du cours sur la méthode de lecture de texte, des élèves de 1ère A doivent maintenant rédiger l'introduction du commentaire de texte philosophique. Ils décident de s'informer sur les éléments constitutifs de cette introduction et sur la manière de les agencer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de l'introduction du commentaire de texte$$,
        'body', $$L'introduction du commentaire de texte philosophique est la partie du devoir où l'on présente le texte. Elle s'élabore à partir de certains éléments de la problématique dégagés lors de la lecture méthodique : elle annonce le thème, pose le problème et expose la thèse de l'auteur.$$,
        'highlights', array[$$introduction = présentation du texte, tirée de la problématique$$]::text[],
        'fixation', jsonb_build_object('question', $$Que fait l'introduction du commentaire de texte philosophique ?$$, 'solution', $$Elle présente le texte : elle annonce le thème, pose le problème et expose la thèse de l'auteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Les éléments constitutifs de l'introduction$$,
        'body', $$Les éléments constitutifs de l'introduction sont : le thème, le problème, la thèse et, éventuellement, la structure logique du texte. Parmi les sept items de la grille de lecture (thème, problème, thèse, antithèse, intention, enjeu, structure logique), seuls ces éléments sont retenus pour l'introduction — l'antithèse, l'intention et l'enjeu relèvent d'autres parties du commentaire.$$,
        'highlights', array[$$retenus : thème, problème, thèse, (structure logique)$$, $$non retenus dans l'introduction : antithèse, intention, enjeu$$]::text[],
        'fixation', jsonb_build_object('question', $$Parmi le thème, l'enjeu, l'intention, la thèse, l'antithèse, la structure du texte et le problème, lesquels sont nécessaires à l'introduction ?$$, 'solution', $$Le thème, le problème, la thèse et, éventuellement, la structure logique du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$La construction de l'introduction$$,
        'body', $$Construire l'introduction consiste à agencer de manière cohérente le thème, le problème, la thèse et éventuellement la structure logique du texte. Cet ordre n'est pas rigide, mais il est possible de faire précéder ces éléments d'une généralité (une remarque introductive amenant le sujet).$$,
        'highlights', array[$$généralité (optionnelle) → thème → problème → thèse → (structure logique)$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige l'introduction du texte d'Épictète sur le philosophe malpropre et son disciple.$$, 'solution', $$Ce texte d'Épictète, extrait de Maximes et Pensées, traite de la tenue du philosophe et de son disciple. À la question de savoir si le philosophe et son disciple doivent négliger leur tenue, l'auteur répond que ceux-ci doivent au contraire prendre soin de leur corps et de leur âme. Le texte s'articule autour de deux mouvements : la nécessité de la décence chez le philosophe et son disciple (L1-L7), puis la primauté de la beauté intérieure sur la beauté du corps (L7-L12).$$),
        'fixation', jsonb_build_object('question', $$L'ordre thème-problème-thèse doit-il toujours être respecté strictement dans l'introduction ?$$, 'solution', $$Non, cet ordre n'est pas rigide ; on peut l'aménager, et le faire précéder d'une généralité amenant le sujet.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un camarade te sollicite pour apprendre à rédiger l'introduction du commentaire de texte philosophique, à partir de ce texte d'Alain : « Il est bon de redire que l'homme ne se forme jamais par l'expérience solitaire (...) C'est donc à travers l'ordre humain qu'il connaît toute chose ; et c'est certainement de l'ordre humain qu'il prend l'idée de lui-même, car on le nomme, et on le désigne à lui-même, comme on lui désigne les autres. » (ALAIN, Éléments de philosophie)$$,
      'questions', array[
        $$Dégage le thème et le problème de ce texte.$$,
        $$Dégage la thèse défendue par l'auteur.$$,
        $$Rédige l'introduction du commentaire de ce texte en agençant ces éléments.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que présente l'introduction du commentaire de texte philosophique ?$$,
      'hint', $$C'est la première partie du devoir.$$,
      'expected', $$Le texte lui-même : elle annonce le thème, pose le problème et expose la thèse de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois éléments toujours nécessaires à l'introduction du commentaire de texte.$$,
      'hint', $$Un quatrième élément est parfois ajouté (la structure logique).$$,
      'expected', $$Le thème, le problème et la thèse.$$
    ),
    jsonb_build_object(
      'question', $$L'antithèse fait-elle partie des éléments constitutifs de l'introduction ?$$,
      'hint', $$Elle est utile ailleurs dans le commentaire.$$,
      'expected', $$Non, l'antithèse n'est pas un élément constitutif de l'introduction.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une généralité, dans la construction de l'introduction ?$$,
      'hint', $$C'est une remarque optionnelle placée au début.$$,
      'expected', $$Une remarque introductive, facultative, qui peut précéder l'annonce du thème, du problème et de la thèse.$$
    )
  ),
  now()
);
