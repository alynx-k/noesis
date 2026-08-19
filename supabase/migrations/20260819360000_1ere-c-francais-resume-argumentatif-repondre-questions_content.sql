-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2334: "EE 12: Résumé_Texte_Argu_Répondre_questions"
-- (https://lyc.ecole-ci.org/course/view.php?id=2334), resource id 21414.
-- The pedagogical method (dégager le thème, expliquer une expression en
-- contexte, dégager la structure et la visée argumentative) is reproduced
-- from the source, which is methodological and not subject to copyright
-- concern. The source's texte-support ("Foot africain : danger !",
-- Alphonse Boolamou de Ligouri, Stades d'Afrique n°31, 2006 — and, in the
-- evaluation, an excerpt from Michel Tournier's "Le vol du vampire", 1981)
-- were NOT reproduced: both are full copyrighted argumentative essays, not
-- brief quotations. An original argumentative text on a comparable but
-- distinct theme (the exploitation of young African football talents) was
-- composed to preserve the same teaching point and allow the same
-- comprehension exercises (thème, structure, visée argumentative).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-resume-argumentatif-repondre-questions',
  '1ere',
  'C',
  'francais',
  $$Le résumé du texte argumentatif : répondre aux questions$$,
  12,
  '1ere-c-francais-production-ecrite-intro-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de leurs lectures, des élèves de 1ère découvrent un texte argumentatif intitulé « Jeunes footballeurs africains : la ruée dangereuse ». Impressionnés par la cohérence des idées, ils décident d'en retenir l'essentiel. Voici ce texte :

« Chaque année, des milliers de jeunes garçons africains rêvent de devenir footballeurs professionnels en Europe. Ce rêve, alimenté par les success-stories de quelques rares champions partis de rien, attire une multitude de familles convaincues que leur fils est le prochain grand talent qui changera leur destin. Des hommes se présentant comme des agents ou des recruteurs profitent de cet espoir : ils promettent un essai dans un grand club européen contre une somme d'argent, souvent l'équivalent de plusieurs années d'économies familiales.

Le prix à payer est lourd. De nombreuses familles vendent leur terrain, leur bétail ou empruntent auprès de proches pour financer le voyage de leur enfant. L'adolescent, parfois âgé de quinze ou seize ans, embarque seul, sans protection ni suivi véritable, vers un continent qu'il ne connaît pas. Une fois sur place, l'essai promis n'a souvent jamais lieu : le prétendu agent disparaît avec l'argent, laissant le jeune livré à lui-même, sans papiers, sans famille, et sans le moindre club prêt à l'accueillir.

Qui profite réellement de ce système ? Certainement pas les enfants ni leurs familles, qui perdent à la fois leurs économies et, bien souvent, tout contact avec leur fils exilé. Les véritables bénéficiaires sont ces réseaux informels d'intermédiaires sans scrupules, qui exploitent l'espoir légitime de familles entières pour s'enrichir rapidement, sans jamais avoir l'intention de tenir leurs promesses.

Le paradoxe est cruel : l'Afrique regorge d'un talent footballistique immense, reconnu dans le monde entier. Mais ce talent, au lieu d'être cultivé sur place, dans des centres de formation sérieux et encadrés, devient la matière première d'un trafic qui profite à des individus sans scrupules plutôt qu'au développement du football local. Le manque d'infrastructures et de structures de formation solides sur le continent alimente directement cet exode précoce et dangereux.

Les conséquences dépassent le seul drame individuel de chaque enfant exploité. Le football local, déjà fragilisé par le manque de moyens, perd chaque année une partie de sa relève la plus prometteuse, partie tenter sa chance dans des conditions périlleuses plutôt que de grandir au sein de championnats nationaux qui pourraient, avec plus d'investissement, devenir eux-mêmes compétitifs.

Il est urgent que les fédérations sportives, les gouvernements et les familles elles-mêmes prennent conscience de ce fléau. Réguler les intermédiaires, investir dans des centres de formation locaux crédibles, et informer les familles sur les risques de ces filières informelles : voilà les conditions pour que le talent africain grandisse chez lui, dans la dignité, avant de s'exporter, s'il le souhaite, dans de bonnes conditions. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Dégager le thème d'un texte argumentatif$$,
        'body', $$Le thème est le sujet général abordé par le texte : la question ou le problème que l'auteur développe et sur lequel il prend position. Pour le dégager, on s'appuie sur les termes récurrents ou le champ lexical dominant du texte.$$,
        'highlights', array[$$le thème = le sujet général, dégagé à partir des termes récurrents ou du champ lexical$$]::text[],
        'example', jsonb_build_object('statement', $$Dégage le thème du texte « Jeunes footballeurs africains : la ruée dangereuse ».$$, 'solution', $$Le thème est l'exploitation des jeunes talents footballistiques africains par des réseaux d'intermédiaires sans scrupules.$$),
        'fixation', jsonb_build_object('question', $$Sur quels éléments du texte s'appuie-t-on pour dégager son thème ?$$, 'solution', $$Sur les termes récurrents ou le champ lexical dominant du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Expliquer une expression en contexte$$,
        'body', $$Expliquer une expression « en contexte » consiste à en donner le sens précis tel qu'il est employé dans le texte, et non son sens le plus courant ou littéral hors contexte. Il faut s'appuyer sur les phrases qui entourent l'expression pour en dégager le sens exact voulu par l'auteur.$$,
        'highlights', array[$$expliquer « en contexte » = donner le sens voulu par l'auteur à cet endroit précis du texte, pas le sens général du dictionnaire$$]::text[],
        'example', jsonb_build_object('statement', $$Explique en contexte l'expression : « ce talent... devient la matière première d'un trafic qui profite à des individus sans scrupules ».$$, 'solution', $$Cela signifie que le véritable potentiel sportif des jeunes africains, au lieu d'être valorisé et développé localement, est exploité comme une simple ressource par des réseaux d'intermédiaires malhonnêtes qui en tirent un profit financier, sans se soucier du sort réel des enfants concernés.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi ne suffit-il pas de donner le sens littéral d'une expression pour l'« expliquer en contexte » ?$$, 'solution', $$Parce que le sens en contexte est celui que l'expression prend précisément dans ce passage du texte, éclairé par les phrases voisines, et qui peut être plus précis ou différent du sens général du mot pris isolément.$$)
      ),
      jsonb_build_object(
        'heading', $$Dégager la structure du texte$$,
        'body', $$Un texte argumentatif peut se structurer en plusieurs séquences, chacune correspondant à une étape du raisonnement : présentation du phénomène ou du problème, description de ses mécanismes ou de ses conséquences, puis proposition de solution ou appel à l'action. Dégager la structure consiste à identifier ces grandes séquences et les paragraphes qui les composent.$$,
        'highlights', array[$$structure = grandes séquences du raisonnement (présentation, développement, conclusion/proposition)$$]::text[],
        'example', jsonb_build_object('statement', $$Dégage la structure du texte « Jeunes footballeurs africains : la ruée dangereuse » (6 paragraphes).$$, 'solution', $$Séquence 1 (paragraphes 1-3) : présentation du phénomène et de son mécanisme d'exploitation. Séquence 2 (paragraphes 4-5) : analyse du paradoxe (talent réel mais mal exploité) et de ses conséquences sur le football local. Séquence 3 (paragraphe 6) : appel à l'action et propositions de solutions.$$),
        'fixation', jsonb_build_object('question', $$Que permet d'identifier la structure d'un texte argumentatif ?$$, 'solution', $$Les grandes étapes du raisonnement de l'auteur, regroupées en séquences correspondant à un ou plusieurs paragraphes.$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier la visée argumentative$$,
        'body', $$La visée argumentative est le but que poursuit l'auteur : convaincre le lecteur d'une thèse, le persuader d'agir, dénoncer une situation, ou proposer une solution. Elle se formule en une phrase synthétique qui résume l'intention globale du texte.$$,
        'highlights', array[$$visée argumentative = intention globale de l'auteur (convaincre, dénoncer, proposer...)$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la visée argumentative du texte sur les jeunes footballeurs africains ?$$, 'solution', $$Dénoncer l'exploitation des jeunes talents footballistiques africains par des réseaux sans scrupules, et appeler les autorités et les familles à agir pour permettre au talent local de se développer dans de meilleures conditions.$$),
        'fixation', jsonb_build_object('question', $$En quoi la visée argumentative diffère-t-elle du simple thème du texte ?$$, 'solution', $$Le thème indique de quoi parle le texte, tandis que la visée argumentative indique ce que l'auteur cherche à obtenir chez le lecteur (le convaincre, le persuader d'agir, dénoncer une situation, etc.).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte « Jeunes footballeurs africains : la ruée dangereuse » étudié dans cette leçon.$$,
      'questions', array[
        $$Dégage le thème de ce texte en une phrase concise.$$,
        $$Explique en contexte l'expression : « le manque d'infrastructures et de structures de formation solides sur le continent alimente directement cet exode précoce et dangereux. »$$,
        $$Dégage la visée argumentative de ce texte, en distinguant clairement ce que l'auteur dénonce et ce qu'il propose.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que doit-on faire pour dégager le thème d'un texte argumentatif ?$$,
      'hint', $$C'est une étape de repérage, avant toute interprétation fine.$$,
      'expected', $$Repérer les termes récurrents ou le champ lexical dominant, afin d'identifier le sujet général traité par le texte.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que « expliquer une expression en contexte » ?$$,
      'hint', $$Cela distingue le sens du dictionnaire du sens réellement voulu ici.$$,
      'expected', $$C'est donner le sens précis que prend l'expression à cet endroit précis du texte, à partir des phrases qui l'entourent — et non son sens général hors contexte.$$
    ),
    jsonb_build_object(
      'question', $$Comment peut-on généralement structurer un texte argumentatif en grandes séquences ?$$,
      'hint', $$Il y a typiquement trois grandes étapes.$$,
      'expected', $$Présentation du problème ou du phénomène, développement de ses mécanismes ou conséquences, puis proposition de solution ou appel à l'action.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la visée argumentative d'un texte ?$$,
      'hint', $$Elle concerne l'effet recherché sur le lecteur, pas seulement le sujet traité.$$,
      'expected', $$C'est le but que poursuit l'auteur (convaincre, persuader d'agir, dénoncer, proposer une solution), formulé en une phrase synthétique.$$
    )
  ),
  now()
);
