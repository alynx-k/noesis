-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3216: "PL6: ENONCIATION les indices lexicaux (2)"
-- (https://lyc.ecole-ci.org/course/view.php?id=3216)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "6 PL 2nde ENONCIATION les indices lexicaux (2).pdf" (3 pages, Leçon 1 :
-- l'énonciation, séance 2 : les marques de l'énonciation / les indices
-- lexicaux).
-- Rewritten/paraphrased from the source PDF: the definitions of
-- "vocabulaire affectif" and "vocabulaire évaluatif", the lexical indices
-- of person/space/time in a statement, and modalisateurs as markers of the
-- speaker's subjectivity. 100% original wording; no sentence copied from
-- the source, and the source's exercise texts were not reproduced.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl6-enonciation-indices-lexicaux',
  '2nde',
  'A',
  'francais',
  $$L'énonciation : les indices lexicaux$$,
  5,
  '2nde-a-fr-pl4-semantique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour renforcer leurs compétences en lecture et en production de textes, les élèves de seconde A relèvent, au fil de leurs lectures, de courts extraits qui les intéressent. Ils remarquent que certains mots trahissent les sentiments ou les jugements de celui qui parle, tandis que d'autres indiquent simplement qui parle, où, et quand. Ils s'organisent pour identifier, analyser et utiliser judicieusement ces indices de l'énonciation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulaire affectif et vocabulaire évaluatif$$,
        'body', $$Le vocabulaire affectif est l'ensemble des mots qu'un locuteur utilise dans un énoncé de façon à manifester sa sensibilité ou une émotion : pitié, sympathie, colère, indignation. En employant ce vocabulaire, le locuteur vise à susciter l'émotion du lecteur ou du destinataire. Le vocabulaire est dit évaluatif lorsqu'il sert à porter un jugement de valeur, positif ou négatif (bon ou mauvais), sur ce dont on parle.$$,
        'highlights', array[$$vocabulaire affectif$$, $$vocabulaire évaluatif$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le but du vocabulaire affectif dans un énoncé ?$$, 'solution', $$Il vise à susciter l'émotion du lecteur ou du destinataire, en manifestant la sensibilité du locuteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Le vocabulaire affectif en détail$$,
        'body', $$Le vocabulaire affectif se compose essentiellement de groupes nominaux constitués de noms et d'adjectifs qualificatifs, d'adverbes et de verbes qui attirent l'attention sur un état ou une situation de fragilité, d'impuissance ou d'innocence, afin de susciter la pitié, la compassion ou l'identification du lecteur avec la personne évoquée.$$,
        'highlights', array[$$fragilité$$, $$compassion$$, $$identification$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un texte qui décrit « un enfant innocent, seul et démuni », quel effet recherche l'auteur en employant ce vocabulaire ?$$, 'solution', $$Il cherche à susciter la pitié et la compassion du lecteur envers l'enfant, en insistant sur sa fragilité et son innocence.$$),
        'fixation', jsonb_build_object('question', $$Quels types de mots composent le plus souvent le vocabulaire affectif ?$$, 'solution', $$Des noms et adjectifs qualificatifs, des adverbes et des verbes qui évoquent un état de fragilité, d'impuissance ou d'innocence.$$)
      ),
      jsonb_build_object(
        'heading', $$Les indices de personne, d'espace et de temps$$,
        'body', $$Tout énoncé porte des indices qui permettent de reconstituer la situation d'énonciation. Les indices de personne signalent la présence de l'énonciateur (celui qui parle, à travers les pronoms personnels comme « je » et les adjectifs possessifs comme « ma ») et celle du destinataire (« vous », « votre »). Les indices spatiaux renseignent sur le lieu dont il est question (« cette région »). Les indices temporels renseignent sur le moment de l'énoncé (« il y a une semaine »).$$,
        'highlights', array[$$indices de personne$$, $$indices spatiaux$$, $$indices temporels$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type d'indice$$, $$Ce qu'il révèle$$, $$Exemples de marques$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Indices de personne$$, $$Présence de l'énonciateur et du destinataire$$, $$« je », « ma », « vous », « votre »$$),
            jsonb_build_array($$Indices spatiaux$$, $$Le lieu dont on parle$$, $$« cette région », « ici »$$),
            jsonb_build_array($$Indices temporels$$, $$Le moment de l'énoncé$$, $$« il y a une semaine », « maintenant »$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel type d'indice révèle la présence de l'énonciateur dans un texte ?$$, 'solution', $$Les indices de personne, comme les pronoms personnels et les adjectifs possessifs.$$)
      ),
      jsonb_build_object(
        'heading', $$Les modalisateurs, indices de subjectivité$$,
        'body', $$Les modalisateurs sont des mots ou expressions qui révèlent le degré de certitude, le jugement ou l'engagement personnel du locuteur par rapport à ce qu'il énonce (adverbes comme « franchement », verbes comme « je crois » ou « je doute », adjectifs comme « bon »). Leur présence dans un texte est un indice fort de subjectivité : elle montre que l'énonciateur ne se contente pas de rapporter des faits, mais qu'il exprime aussi son propre point de vue.$$,
        'highlights', array[$$modalisateurs$$, $$subjectivité$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « Franchement, je crois que cette décision est une bonne chose », quels mots montrent la subjectivité du locuteur ?$$, 'solution', $$« Franchement » et « je crois », qui indiquent que l'énonciateur engage son propre jugement.$$),
        'fixation', jsonb_build_object('question', $$Que révèle la présence de modalisateurs dans un texte ?$$, 'solution', $$Elle révèle la subjectivité du locuteur, c'est-à-dire son jugement ou son degré de certitude par rapport à ce qu'il dit.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un message de sensibilisation, un animateur de santé communautaire déclare : « Franchement, je pense que nous devons tous changer notre comportement pour que, ensemble, nous nous débarrassions de cette maladie pour le bonheur de tous. Ici, dans notre village, depuis le mois dernier, trop de familles innocentes souffrent en silence. »$$,
      'questions', array[
        $$Relève dans ce texte un exemple de vocabulaire affectif et explique l'effet recherché.$$,
        $$Relève les indices de personne, d'espace et de temps présents dans ce texte.$$,
        $$Relève un modalisateur et explique ce qu'il révèle sur l'énonciateur.$$,
        $$Le vocabulaire employé est-il plutôt affectif ou évaluatif ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que le vocabulaire affectif ?$$,
      'hint', $$Il exprime la sensibilité ou l'émotion du locuteur.$$,
      'expected', $$L'ensemble des mots qu'un locuteur utilise pour manifester sa sensibilité ou une émotion (pitié, sympathie, colère, indignation).$$
    ),
    jsonb_build_object(
      'question', $$Quels mots permettent de repérer les indices de personne dans un énoncé ?$$,
      'hint', $$Pense aux pronoms et aux adjectifs possessifs.$$,
      'expected', $$Les pronoms personnels (« je », « vous ») et les adjectifs possessifs (« ma », « votre »).$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un modalisateur ?$$,
      'hint', $$Il montre le jugement ou le degré de certitude du locuteur.$$,
      'expected', $$Un mot ou une expression qui révèle le jugement, le degré de certitude ou l'engagement personnel du locuteur.$$
    ),
    jsonb_build_object(
      'question', $$Quand dit-on qu'un vocabulaire est évaluatif ?$$,
      'hint', $$Il porte un jugement de valeur.$$,
      'expected', $$Lorsqu'il sert à porter un jugement de valeur, positif ou négatif, sur ce dont on parle.$$
    )
  ),
  now()
);
