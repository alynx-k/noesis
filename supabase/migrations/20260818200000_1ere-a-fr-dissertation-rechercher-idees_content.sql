-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 860: "EE 5: Dissert_littér_Rechercher_ldées"
-- (https://lyc.ecole-ci.org/course/view.php?id=860), resource id 3969 —
-- "Séance 2 : la recherche des idées" (Leçon 3 : la dissertation
-- littéraire). Explications méthodologiques réécrites à partir du PDF
-- source ; les références d'œuvres et d'auteurs réels citées comme
-- exemples (Kourouma, Senghor, Camara Laye, Mariama Bâ, Achebe, etc.) sont
-- des faits bibliographiques réels, pas du texte protégé recopié — elles
-- sont reprises car c'est la pratique normale de la dissertation littéraire
-- ivoirienne (illustrer chaque argument par de vraies œuvres connues).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-dissertation-rechercher-idees',
  '1ere',
  'A',
  'francais',
  $$La dissertation littéraire : rechercher les idées$$,
  5,
  '1ere-a-fr-dissertation-analyser-sujet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir analysé un sujet de dissertation et dégagé sa problématique, les élèves de 1ère A doivent maintenant trouver des idées et des exemples précis pour construire leur argumentation. Ils se demandent où chercher ces idées et comment les organiser en un plan cohérent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Où chercher les idées, et quelles qualités doivent-elles avoir ?$$,
        'body', $$Pour traiter un sujet de dissertation littéraire, on cherche des idées dans différents domaines de la littérature : l'auteur (son engagement, ses intentions), l'œuvre (ce qu'elle raconte, ce qu'elle dénonce ou célèbre) et le lecteur (ce que la lecture lui apporte). Ces idées doivent être précises, pertinentes et en relation étroite avec le sujet et sa problématique — de vieux sujets de dissertation traités en classe peuvent eux-mêmes fournir des idées. Chaque idée doit être illustrée par un exemple précis (une œuvre et son auteur) pour être convaincante.$$,
        'highlights', array[$$domaines : auteur, œuvre, lecteur$$, $$idées précises et pertinentes$$, $$illustrées par des exemples précis$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi une idée sans exemple précis est-elle moins convaincante dans une dissertation ?$$, 'solution', $$Parce qu'une idée doit être illustrée par une œuvre précise (titre et auteur) pour prouver qu'elle est fondée et non une simple affirmation gratuite.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple : rechercher les idées sur « littérature et société »$$,
        'body', $$Pour un sujet sur le rapport entre littérature et société, une première partie peut montrer que la littérature reflète la société : sur le plan idéologique et politique, elle dénonce les régimes dictatoriaux (Les soleils des indépendances d'Ahmadou Kourouma) ou les rivalités politiques (Tribaliques d'Henri Lopès) ; sur le plan culturel, elle dénonce des coutumes rétrogrades (Rebelle de Fatou Keïta) ou valorise des cultures méconnues (Chants d'ombre de Léopold Sédar Senghor). Une seconde partie peut nuancer en montrant d'autres aspects : la littérature exprime aussi des sentiments personnels (Les contemplations de Victor Hugo), le beau (Calligrammes de Guillaume Apollinaire), ou favorise l'évasion par la fiction (Vingt mille lieues sous les mers de Jules Verne).$$,
        'highlights', array[$$1ère partie : reflet de la société$$, $$2ème partie : nuancer$$]::text[],
        'example', jsonb_build_object('statement', $$Pour l'argument « la littérature dénonce l'acculturation », quelle œuvre pourrait servir d'exemple ?$$, 'solution', $$L'aventure ambiguë de Cheikh Hamidou Kane, qui aborde le déchirement d'un jeune Africain entre sa culture d'origine et l'éducation occidentale.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi une seconde partie qui nuance la thèse initiale rend-elle une dissertation plus solide ?$$, 'solution', $$Parce qu'elle montre que le candidat a examiné les limites de la thèse (conformément à la consigne « discutez ») au lieu de se contenter de l'illustrer sans esprit critique.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple : rechercher les idées sur « l'apport de la lecture »$$,
        'body', $$Pour un sujet sur ce que la lecture apporte au lecteur, une première partie peut montrer qu'elle permet la découverte et la formation de soi : le lecteur s'identifie aux personnages (leurs rêves, leurs sentiments), ou prend conscience de ses propres travers, comme dans L'avare de Molière. Une seconde partie peut élargir en montrant que ce n'est pas le seul bénéfice : le lecteur découvre aussi d'autres cultures (Le monde s'effondre de Chinua Achebe), acquiert des connaissances (L'enfant noir de Camara Laye), ou se divertit simplement en lisant un roman d'aventure ou policier.$$,
        'highlights', array[$$1ère partie : découverte de soi$$, $$2ème partie : élargir le bénéfice$$]::text[],
        'example', jsonb_build_object('statement', $$Pour l'argument « le lecteur découvre les sentiments des autres », quelle œuvre pourrait servir d'exemple ?$$, 'solution', $$Une si longue lettre de Mariama Bâ, qui donne accès aux sentiments intimes d'une femme sénégalaise face à la polygamie.$$),
        'fixation', jsonb_build_object('question', $$Que signifie « s'identifier à un personnage » pour un lecteur ?$$, 'solution', $$Retrouver dans le personnage ses propres rêves, ambitions ou sentiments, comme si le livre lui renvoyait sa propre image.$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser ses idées en un plan équilibré$$,
        'body', $$Une fois les idées trouvées, on les regroupe en deux (parfois trois) grandes parties équilibrées, chacune répondant à un aspect de la problématique. Dans chaque partie, on classe les arguments du plus évident au plus original, et chaque argument doit être suivi d'au moins un exemple précis (œuvre + auteur). Il vaut mieux avoir deux ou trois arguments solidement illustrés que cinq arguments vagues sans exemple.$$,
        'highlights', array[$$parties équilibrées$$, $$du plus évident au plus original$$, $$mieux vaut peu d'arguments bien illustrés$$]::text[],
        'fixation', jsonb_build_object('question', $$Vaut-il mieux avoir beaucoup d'arguments peu illustrés, ou peu d'arguments bien illustrés ?$$, 'solution', $$Peu d'arguments bien illustrés par des exemples précis : la qualité et la pertinence comptent plus que la quantité.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le sujet « En vous appuyant sur les œuvres que vous avez lues ou étudiées, expliquez et discutez l'idée selon laquelle la lecture d'une œuvre littéraire transforme durablement celui qui la lit », un élève doit rechercher des idées organisées en deux parties.$$,
      'questions', array[
        $$Propose un argument pour une première partie « la lecture transforme le lecteur », avec un exemple d'œuvre précis.$$,
        $$Propose un argument qui nuance cette thèse pour une seconde partie (par exemple : la lecture n'est pas toujours transformatrice, ou apporte autre chose).$$,
        $$Pourquoi est-il important, pour chaque argument, de citer une œuvre et son auteur ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans quels domaines cherche-t-on des idées pour une dissertation littéraire ?$$,
      'hint', $$Il y en a trois, liés au triangle de la communication littéraire.$$,
      'expected', $$L'auteur, l'œuvre et le lecteur.$$
    ),
    jsonb_build_object(
      'question', $$Que doit accompagner chaque argument dans une dissertation littéraire ?$$,
      'hint', $$Sans cela, l'argument reste une simple affirmation.$$,
      'expected', $$Un exemple précis, généralement une œuvre et son auteur.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi consulter d'anciens sujets de dissertation traités en classe peut-il aider à trouver des idées ?$$,
      'hint', $$Pense à la réutilisation de connaissances déjà travaillées.$$,
      'expected', $$Parce que les arguments et exemples déjà étudiés pour des sujets proches peuvent être réutilisés ou adaptés.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel ordre classe-t-on généralement les arguments à l'intérieur d'une partie ?$$,
      'hint', $$On progresse dans la réflexion.$$,
      'expected', $$Du plus évident (ou le plus attendu) au plus original.$$
    )
  ),
  now()
);
