-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3722: "Leçon 3_La conclusion du commentaire de texte
-- philosophique" (https://lyc.ecole-ci.org/course/view.php?id=3722),
-- resource id 37863. Contenu réécrit à partir du PDF source (programme
-- officiel MENET-FP). Les citations d'Épictète et Pascal sont des textes
-- philosophiques du domaine public utilisées à des fins d'analyse
-- pédagogique ; explications méthodologiques reformulées, non copiées
-- verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-conclusion-commentaire',
  '1ere',
  'A',
  'philosophie',
  $$La conclusion du commentaire de texte philosophique$$,
  3,
  '1ere-a-philo-introduction-commentaire',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à rédiger l'introduction du commentaire de texte philosophique, des élèves de 1ère A sont informés qu'ils devront aussi rédiger une conclusion. Ils décident de s'informer sur les éléments constitutifs de la conclusion et sur la manière de la construire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de la conclusion du commentaire de texte$$,
        'body', $$La conclusion est la dernière partie du devoir. Elle consiste en une prise de position par rapport à l'intérêt du texte. Cette prise de position doit être précédée du bilan du débat engagé au niveau de la critique externe (la confrontation de la position de l'auteur à d'autres auteurs et au vécu, vue dans la méthode de lecture de texte).$$,
        'highlights', array[$$conclusion = bilan de la discussion + prise de position personnelle$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit précéder la prise de position personnelle dans la conclusion ?$$, 'solution', $$Le bilan de la discussion engagée au niveau de la critique externe.$$)
      ),
      jsonb_build_object(
        'heading', $$Les éléments constitutifs et la construction de la conclusion$$,
        'body', $$Les éléments essentiels de la conclusion sont : le bilan de la discussion et la prise de position personnelle. Construire la conclusion consiste à agencer ces deux éléments de manière cohérente. Il est conseillé de la commencer par une expression signalant la fin du devoir, comme « en définitive », « au terme de notre travail » ou « en somme ».$$,
        'highlights', array[$$2 éléments : bilan de la discussion + prise de position personnelle$$, $$formules d'ouverture : « en définitive », « au terme de notre travail », « en somme »$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige la conclusion du texte d'Épictète sur le philosophe malpropre et son disciple.$$, 'solution', $$En définitive, si pour Épictète et certains moralistes de l'Antiquité le philosophe et son disciple doivent observer la propreté et la décence en vue d'améliorer leur statut social, pour d'autres penseurs tels que les cyniques, la beauté corporelle est inessentielle pour le philosophe. Au demeurant, la propreté du corps va de pair avec celle de l'esprit.$$),
        'fixation', jsonb_build_object('question', $$Le thème et le problème du texte doivent-ils être rappelés dans la conclusion ?$$, 'solution', $$Non, seuls le bilan de la discussion et la prise de position personnelle constituent la conclusion — le thème et le problème appartiennent à l'introduction, pas à la conclusion.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le cadre d'un devoir de classe, ce texte de Pascal est proposé : « La grandeur de l'homme est grande en ce qu'il se connaît misérable (...) L'homme n'est qu'un roseau, le plus faible de la nature ; mais c'est un roseau pensant (...) Travaillons donc à bien penser : voilà le principe de la morale. » (PASCAL, Pensées, Gallimard, 1954)$$,
      'questions', array[
        $$Dégage les éléments de la problématique destinés à la rédaction de la conclusion (bilan possible de la réflexion sur la pensée comme trait distinctif de l'homme).$$,
        $$Formule une position personnelle sur ce bilan.$$,
        $$Rédige la conclusion complète de ce texte de Pascal, en commençant par une formule appropriée.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la dernière partie du devoir de commentaire de texte philosophique ?$$,
      'hint', $$C'est l'objet de cette leçon.$$,
      'expected', $$La conclusion.$$
    ),
    jsonb_build_object(
      'question', $$Cite les deux éléments constitutifs essentiels de la conclusion.$$,
      'hint', $$L'un est collectif, l'autre est individuel.$$,
      'expected', $$Le bilan de la discussion et la prise de position personnelle.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple d'expression permettant de commencer la conclusion.$$,
      'hint', $$Elle signale la fin du devoir.$$,
      'expected', $$Par exemple « en définitive », « au terme de notre travail » ou « en somme ».$$
    ),
    jsonb_build_object(
      'question', $$Quelle étape de la méthode de lecture de texte nourrit le bilan de la conclusion ?$$,
      'hint', $$C'est une des deux critiques vues en leçon 1.$$,
      'expected', $$La critique externe (la confrontation de la position de l'auteur à d'autres auteurs et au vécu).$$
    )
  ),
  now()
);
