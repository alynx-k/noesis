-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3731: "Leçon 2_L'introduction du commentaire de texte
-- philosophique" (https://lyc.ecole-ci.org/course/view.php?id=3731),
-- resource id 37971. Contenu réécrit à partir du PDF source (définition,
-- éléments constitutifs et construction de l'introduction du commentaire
-- de texte philosophique). Les textes philosophiques cités (Épictète,
-- Maximes et Pensées ; Alain, Éléments de philosophie) sont des auteurs du
-- domaine public (Épictète Ier-IIe siècle ; Alain mort en 1951) et sont
-- donc reproduits directement, comme dans le PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-introduction-commentaire-texte',
  '1ere',
  'C',
  'philosophie',
  $$L'introduction du commentaire de texte philosophique$$,
  2,
  '1ere-c-philo-methode-lecture-texte',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À la suite du cours sur la méthode de lecture de texte du 1er trimestre, des élèves de 1ère sont amenés, conformément à la progression, à rédiger l'introduction du commentaire de texte philosophique. Soucieux de réussir cet exercice, ils décident de s'informer sur les éléments constitutifs de l'introduction, la manière de les agencer et de la construire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de l'introduction du commentaire de texte$$,
        'body', $$L'introduction du commentaire de texte philosophique est la partie du devoir où l'on présente le texte. Elle s'élabore à partir de certains éléments de la problématique dégagée lors de la méthode de lecture de texte : ce n'est ni un résumé, ni une prise de position personnelle (qui viendra plus tard dans le devoir), mais une présentation cadrant le texte pour le lecteur.$$,
        'highlights', array[$$introduction = première partie du devoir, où l'on présente le texte$$, $$construite à partir d'éléments de la problématique (pas une prise de position)$$]::text[],
        'fixation', jsonb_build_object('question', $$L'introduction du commentaire de texte philosophique correspond-elle à la conclusion de la méthode de lecture, où l'on prend position ?$$, 'solution', $$Non : elle est la première partie du devoir, où l'on présente le texte (thème, problème, thèse), et non l'étape où l'on prend une position personnelle.$$)
      ),
      jsonb_build_object(
        'heading', $$Les éléments constitutifs de l'introduction$$,
        'body', $$Les éléments constitutifs de l'introduction sont : le thème (de quoi parle le texte), le problème (la question à laquelle répond l'auteur), la thèse (la réponse de l'auteur), et éventuellement la structure logique (les mouvements du texte). Ces éléments, déjà dégagés lors de l'étape de la problématique dans la méthode de lecture de texte, sont repris et réorganisés pour construire l'introduction.$$,
        'highlights', array[$$éléments constitutifs : thème, problème, thèse, (éventuellement) structure logique$$, $$ce sont des éléments déjà identifiés lors de la problématique du texte$$]::text[],
        'fixation', jsonb_build_object('question', $$L'antithèse et l'enjeu du texte font-ils partie des éléments constitutifs de l'introduction ?$$, 'solution', $$Non : seuls le thème, le problème, la thèse, et éventuellement la structure logique, sont les éléments constitutifs de l'introduction.$$)
      ),
      jsonb_build_object(
        'heading', $$La construction de l'introduction$$,
        'body', $$Construire l'introduction consiste à agencer de manière cohérente le thème, le problème, la thèse et, éventuellement, la structure logique du texte. Cet ordre n'est pas rigide : il est possible d'adapter l'agencement selon le texte. Il est également possible de faire précéder ces éléments d'une phrase de généralité, qui amène le sujet avant d'entrer dans la présentation du texte lui-même.$$,
        'highlights', array[$$agencement cohérent : thème → problème → thèse → (structure logique)$$, $$ordre non rigide ; une généralité initiale est possible$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le texte d'Épictète sur le philosophe et son disciple, comment s'articule une introduction correcte ?$$, 'solution', $$« Ce texte d'Épictète, extrait de son œuvre Maximes et Pensées, parle de la tenue du philosophe et de son disciple [thème]. À la question : le philosophe et son disciple doivent-ils négliger leur tenue ? [problème], l'auteur répond que ceux-ci doivent prendre soin de leur corps et de leur âme [thèse]. Ce texte s'articule autour de deux mouvements [structure logique] : de la L1 à la L7, il est question de la nécessité de la décence chez le philosophe et son disciple ; de la L7 à la L12, il montre la primauté de la beauté intérieure sur la beauté du corps. »$$),
        'fixation', jsonb_build_object('question', $$Est-il obligatoire de commencer l'introduction directement par le thème du texte ?$$, 'solution', $$Non : il est possible de faire précéder les éléments constitutifs par une phrase de généralité, qui amène le sujet.$$)
      ),
      jsonb_build_object(
        'heading', $$Application méthodique$$,
        'body', $$Pour rédiger une introduction, on procède donc en trois temps : identifier clairement le thème du texte (en s'appuyant sur les indices déjà relevés lors de la problématique) ; formuler le problème sous forme de question claire à laquelle le texte répond ; énoncer la thèse de l'auteur, sa réponse à cette question. On peut ensuite, si le texte s'y prête, ajouter un rappel bref de sa structure logique (ses mouvements principaux), pour annoncer le plan qui sera suivi dans le commentaire.$$,
        'highlights', array[$$méthode : thème → problème (sous forme de question) → thèse → (structure)$$]::text[],
        'fixation', jsonb_build_object('question', $$Sous quelle forme le problème doit-il être formulé dans une introduction ?$$, 'solution', $$Sous forme de question claire, à laquelle l'auteur du texte apporte une réponse (la thèse).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton voisin de classe te sollicite pour lui apprendre à rédiger l'introduction du commentaire de texte philosophique, à partir de ce texte d'Alain : « Il est bon de redire que l'homme ne se forme jamais par l'expérience solitaire. Quand par métier il serait presque toujours seul et aux prises avec la nature humaine, toujours est-il qu'il n'a pu grandir seul, et que ses premières expériences sont de l'homme et de l'ordre humain dont il dépend d'abord directement. L'enfant vit de ce qu'on lui donne, et son travail c'est d'obtenir non de produire. Nous passons tous par cette expérience décisive qui nous apprend en même temps la parole et la pensée. Nos premières idées sont des mots compris et répétés. L'enfant est comme séparé du spectacle de la nature, et ne commence jamais par s'en approcher tout seul ; on le lui montre et on le lui nomme. C'est donc à travers l'ordre humain qu'il connaît toute chose ; et c'est certainement de l'ordre humain qu'il prend l'idée de lui-même, car on le nomme, et on le désigne à lui-même, comme on lui désigne les autres. » (ALAIN, Éléments de philosophie)$$,
      'questions', array[
        $$Identifie le thème de ce texte.$$,
        $$Formule le problème auquel répond l'auteur, sous forme de question.$$,
        $$Énonce la thèse d'Alain, et rédige l'introduction complète en agençant ces trois éléments.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel est le rôle de l'introduction dans un commentaire de texte philosophique ?$$,
      'hint', $$Ce n'est ni un résumé ni une prise de position.$$,
      'expected', $$Présenter le texte au lecteur, en s'appuyant sur des éléments de sa problématique (thème, problème, thèse).$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois éléments constitutifs essentiels de toute introduction de commentaire de texte philosophique.$$,
      'hint', $$Le quatrième élément (la structure logique) n'est qu'éventuel.$$,
      'expected', $$Le thème, le problème et la thèse.$$
    ),
    jsonb_build_object(
      'question', $$L'ordre d'agencement du thème, du problème et de la thèse dans une introduction est-il rigide ?$$,
      'hint', $$Le texte source précise justement ce point.$$,
      'expected', $$Non, cet ordre n'est pas rigide ; il peut être adapté selon le texte.$$
    ),
    jsonb_build_object(
      'question', $$Que peut-on ajouter avant les éléments constitutifs de l'introduction ?$$,
      'hint', $$C'est une manière d'amener le sujet.$$,
      'expected', $$Une phrase de généralité.$$
    )
  ),
  now()
);
