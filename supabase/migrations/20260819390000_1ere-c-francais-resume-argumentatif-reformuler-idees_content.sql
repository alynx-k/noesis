-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2337: "EE 15: Résumé_Texte_Argu_Reformuler_IE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2337), resource id 21450.
-- The pedagogical method (reformuler avec ses propres mots, condenser,
-- éviter la paraphrase servile) is reproduced from the source, which is
-- methodological and not subject to copyright concern. As in the prior
-- migrations, the source's texte-support ("Foot africain : danger !",
-- Alphonse Boolamou de Ligouri, 2006) and its evaluation text (Michel
-- Tournier, "Le vol du vampire", 1981) were NOT reproduced — both are full
-- copyrighted argumentative essays. The original "Jeunes footballeurs
-- africains" text composed for the three previous migrations is reused
-- here for continuity.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-resume-argumentatif-reformuler-idees',
  '1ere',
  'C',
  'francais',
  $$Le résumé du texte argumentatif : reformuler les idées essentielles$$,
  15,
  '1ere-c-francais-resume-argumentatif-selection-enchainement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Voici de nouveau le texte « Jeunes footballeurs africains : la ruée dangereuse » : « Chaque année, des milliers de jeunes garçons africains rêvent de devenir footballeurs professionnels en Europe. Ce rêve, alimenté par les success-stories de quelques rares champions partis de rien, attire une multitude de familles convaincues que leur fils est le prochain grand talent qui changera leur destin. Des hommes se présentant comme des agents ou des recruteurs profitent de cet espoir : ils promettent un essai dans un grand club européen contre une somme d'argent, souvent l'équivalent de plusieurs années d'économies familiales.

Le prix à payer est lourd. De nombreuses familles vendent leur terrain, leur bétail ou empruntent auprès de proches pour financer le voyage de leur enfant. L'adolescent, parfois âgé de quinze ou seize ans, embarque seul, sans protection ni suivi véritable, vers un continent qu'il ne connaît pas. Une fois sur place, l'essai promis n'a souvent jamais lieu : le prétendu agent disparaît avec l'argent, laissant le jeune livré à lui-même, sans papiers, sans famille, et sans le moindre club prêt à l'accueillir.

Qui profite réellement de ce système ? Certainement pas les enfants ni leurs familles, qui perdent à la fois leurs économies et, bien souvent, tout contact avec leur fils exilé. Les véritables bénéficiaires sont ces réseaux informels d'intermédiaires sans scrupules, qui exploitent l'espoir légitime de familles entières pour s'enrichir rapidement, sans jamais avoir l'intention de tenir leurs promesses.

Le paradoxe est cruel : l'Afrique regorge d'un talent footballistique immense, reconnu dans le monde entier. Mais ce talent, au lieu d'être cultivé sur place, dans des centres de formation sérieux et encadrés, devient la matière première d'un trafic qui profite à des individus sans scrupules plutôt qu'au développement du football local. Le manque d'infrastructures et de structures de formation solides sur le continent alimente directement cet exode précoce et dangereux.

Les conséquences dépassent le seul drame individuel de chaque enfant exploité. Le football local, déjà fragilisé par le manque de moyens, perd chaque année une partie de sa relève la plus prometteuse, partie tenter sa chance dans des conditions périlleuses plutôt que de grandir au sein de championnats nationaux qui pourraient, avec plus d'investissement, devenir eux-mêmes compétitifs.

Il est urgent que les fédérations sportives, les gouvernements et les familles elles-mêmes prennent conscience de ce fléau. Réguler les intermédiaires, investir dans des centres de formation locaux crédibles, et informer les familles sur les risques de ces filières informelles : voilà les conditions pour que le talent africain grandisse chez lui, dans la dignité, avant de s'exporter, s'il le souhaite, dans de bonnes conditions. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le principe de la reformulation$$,
        'body', $$Reformuler une idée essentielle, ce n'est pas la recopier telle quelle : c'est l'exprimer avec ses propres mots, de façon plus condensée que dans le texte original, tout en préservant fidèlement son sens. La reformulation utilise des synonymes, des tournures plus générales, et évite les citations directes du texte.$$,
        'highlights', array[$$reformuler ≠ recopier : il faut employer ses propres mots, condensés, fidèles au sens$$, $$éviter les citations directes du texte source$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre sélectionner une idée essentielle et la reformuler ?$$, 'solution', $$Sélectionner consiste à repérer la phrase du texte qui porte l'idée ; reformuler consiste à réexprimer cette idée avec ses propres mots, de manière plus condensée, sans reprendre les termes exacts du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de reformulation$$,
        'body', $$Pour le premier paragraphe du texte, l'idée essentielle sélectionnée était : « chaque année, des milliers de jeunes Africains rêvent de devenir footballeurs professionnels en Europe ; des faux agents profitent de cet espoir en promettant un essai contre de l'argent ». Une reformulation condensée pourrait être plus synthétique encore.$$,
        'highlights', array[$$la reformulation est généralement plus courte que la sélection initiale$$]::text[],
        'example', jsonb_build_object('statement', $$Reformule en une phrase courte l'idée essentielle du premier paragraphe.$$, 'solution', $$De faux agents exploitent le rêve de gloire européenne de jeunes footballeurs africains.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi une reformulation doit-elle généralement être plus courte que l'idée essentielle initialement sélectionnée ?$$, 'solution', $$Parce que le but du résumé est de condenser le texte ; la reformulation doit donc synthétiser l'idée en un minimum de mots, tout en restant fidèle au sens.$$)
      ),
      jsonb_build_object(
        'heading', $$Reformulation complète du texte$$,
        'body', $$Paragraphe 1 : de faux agents exploitent le rêve de gloire européenne de jeunes footballeurs africains. Paragraphe 2 : les familles se ruinent pour financer un voyage qui se solde souvent par l'abandon de l'enfant. Paragraphe 3 : ce système profite uniquement aux intermédiaires malhonnêtes. Paragraphe 4 : le talent africain existe, mais le manque d'infrastructures locales alimente cet exode. Paragraphe 5 : le football africain local s'appauvrit de sa relève. Paragraphe 6 : il faut réguler ces filières et investir dans la formation locale.$$,
        'highlights', array[$$chaque paragraphe donne lieu à une reformulation d'une seule phrase concise$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle reformulation correspond à l'idée essentielle du paragraphe 3 du texte ?$$, 'solution', $$Ce système profite uniquement aux intermédiaires malhonnêtes (et non aux enfants ni à leurs familles).$$)
      ),
      jsonb_build_object(
        'heading', $$Conseils pratiques pour bien reformuler$$,
        'body', $$Pour reformuler efficacement : remplacer les mots du texte par des synonymes ou des termes plus généraux ; supprimer les adjectifs et adverbes non essentiels au sens ; transformer les questions rhétoriques en affirmations ; condenser plusieurs phrases d'un même paragraphe en une seule, si elles expriment une idée unique.$$,
        'highlights', array[$$utiliser synonymes et termes généraux ; supprimer le superflu ; transformer les questions rhétoriques en affirmations$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment traite-t-on généralement une question rhétorique lors de la reformulation d'une idée essentielle ?$$, 'solution', $$On la transforme en affirmation, en formulant directement l'idée qu'elle sous-entend.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte « Internet et lecture des jeunes : une révolution silencieuse » et les idées essentielles déjà sélectionnées dans la leçon précédente : (1) Internet a transformé l'accès à la lecture pour les jeunes ; (2) cette révolution a démocratisé l'accès à la lecture (contenus gratuits et abondants) ; (3) mais elle a aussi rendu la lecture plus fragmentée, moins concentrée ; (4) il revient aux familles et aux enseignants d'accompagner les jeunes pour que cette révolution soit une chance plutôt qu'une perte.$$,
      'questions', array[
        $$Reformule en une phrase courte et condensée chacune des quatre idées essentielles, en évitant de reprendre les mots exacts du texte original.$$,
        $$Vérifie que tes reformulations restent fidèles au sens original : relis chaque phrase reformulée et assure-toi qu'elle ne trahit ni n'ajoute rien par rapport à l'idée de départ.$$,
        $$Assemble les quatre reformulations en un court paragraphe cohérent, en ajoutant les connecteurs logiques appropriés entre chaque idée.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie « reformuler » une idée essentielle, dans la méthodologie du résumé ?$$,
      'hint', $$Cela s'oppose à la simple copie du texte source.$$,
      'expected', $$L'exprimer avec ses propres mots, de façon plus condensée, en restant fidèle au sens, sans reprendre les termes exacts du texte original.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux techniques permettant de reformuler efficacement une idée.$$,
      'hint', $$L'une concerne le vocabulaire, l'autre la syntaxe.$$,
      'expected', $$Remplacer les mots du texte par des synonymes ou des termes plus généraux, et transformer les questions rhétoriques en affirmations (ou condenser plusieurs phrases en une seule).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi ne faut-il pas simplement recopier des phrases du texte lors de la reformulation ?$$,
      'hint', $$Cela concerne l'objectif même du résumé.$$,
      'expected', $$Parce que le résumé doit démontrer une compréhension et une capacité de synthèse personnelles, et non une simple reproduction du texte source ; de plus, la reformulation permet une plus grande concision.$$
    ),
    jsonb_build_object(
      'question', $$Que doit-on vérifier après avoir reformulé une idée essentielle ?$$,
      'hint', $$C'est une étape de contrôle de qualité.$$,
      'expected', $$Que la reformulation reste fidèle au sens original, sans rien ajouter ni trahir de l'idée de départ.$$
    )
  ),
  now()
);
