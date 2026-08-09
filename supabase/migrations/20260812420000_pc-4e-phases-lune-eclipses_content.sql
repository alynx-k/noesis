-- Physique-Chimie 4ème — Les phases de la Lune et les éclipses.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2016 "Lecon3_Phases de la Lune et les
-- Eclipses", resource id 16488 ("Je lis le résumé de la leçon"), PDF
-- "PC 4ème_L3_Phases de la Lune et les Eclipses.pdf" (15 pages, thème
-- Optique). Rewritten in original wording — paraphrased, not copied from
-- the source PDF — keeping the same technical content: ombre propre /
-- ombre portée / cône d'ombre, the eight named lunar phases and the
-- ~29,5-day lunation, solar eclipse (new moon, Soleil-Lune-Terre
-- alignment) and lunar eclipse (full moon, Soleil-Terre-Lune alignment).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À Tanguelan, un jour de grand soleil, le ciel s'assombrit brusquement : le Soleil prend la forme d'un anneau lumineux, puis redevient normal quelques instants plus tard. Le lendemain, en classe, les élèves veulent comprendre ce phénomène et distinguer les ombres qu'un objet peut projeter, les phases que traverse la Lune, ainsi que la différence entre une éclipse de Soleil et une éclipse de Lune.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Ombre propre, ombre portée et cône d'ombre$$,
        'body', $$Un objet opaque éclairé par une source de lumière étendue présente trois zones sombres distinctes. L'ombre propre est la partie de l'objet lui-même qui ne reçoit pas de lumière. L'ombre portée est la tache sombre que cet objet projette sur un écran ou une surface derrière lui. Entre les deux, le cône d'ombre est la zone non éclairée qui relie l'ombre propre à l'ombre portée.$$,
        'highlights', array[$$ombre propre$$, $$ombre portée$$, $$cône d'ombre$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Ombre propre : partie non éclairée de l'objet opaque lui-même. Ombre portée : tache sombre projetée par l'objet sur un écran. Cône d'ombre : volume non éclairé situé entre l'objet et l'écran.$$),
        'example', jsonb_build_object('statement', $$Une boule opaque est éclairée par une lampe. Sa face tournée vers le mur reste sombre, et une tache sombre apparaît sur le mur derrière elle. Nomme chacune de ces deux zones sombres.$$, 'solution', $$La face sombre de la boule est son ombre propre. La tache sombre sur le mur est son ombre portée.$$),
        'fixation', jsonb_build_object('question', $$Quelle zone sombre relie l'ombre propre d'un objet à son ombre portée sur un écran ?$$, 'solution', $$Le cône d'ombre : c'est la zone non éclairée comprise entre l'objet et l'écran.$$)
      ),
      jsonb_build_object(
        'heading', $$Les phases de la Lune$$,
        'body', $$La Lune est en permanence éclairée pour moitié par le Soleil, mais un observateur sur Terre n'en voit qu'une portion variable selon la position de la Lune sur son orbite : ce sont les phases de la Lune. Dans l'ordre, on observe la nouvelle lune (Lune invisible, alignée entre le Soleil et la Terre), le premier croissant, le premier quartier, la lune gibbeuse, la pleine lune (Lune entièrement éclairée, la Terre étant alignée entre le Soleil et la Lune), puis à nouveau une lune gibbeuse, le dernier quartier et le dernier croissant, avant de revenir à la nouvelle lune.$$,
        'highlights', array[$$phases de la Lune$$, $$nouvelle lune$$, $$pleine lune$$, $$lunaison$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un cycle complet des phases de la Lune, appelé lunaison, dure en moyenne 29 jours et 13 heures. À la nouvelle lune, l'alignement est Soleil-Lune-Terre ; à la pleine lune, il est Soleil-Terre-Lune.$$),
        'example', jsonb_build_object('statement', $$Un observateur voit un disque lunaire entièrement éclairé dans le ciel nocturne. À quelle phase correspond cette observation, et quel est l'alignement des trois astres ?$$, 'solution', $$C'est la pleine lune : l'alignement est Soleil-Terre-Lune, la face éclairée de la Lune faisant alors entièrement face à la Terre.$$),
        'fixation', jsonb_build_object('question', $$Combien de temps dure en moyenne une lunaison, d'une nouvelle lune à la suivante ?$$, 'solution', $$Environ 29 jours et 13 heures.$$)
      ),
      jsonb_build_object(
        'heading', $$Éclipse de Soleil$$,
        'body', $$À la nouvelle lune, il arrive que la Lune projette son ombre sur une partie de la Terre. Les personnes situées dans la zone d'ombre pure voient le Soleil totalement masqué : c'est une éclipse totale de Soleil, où il fait nuit en plein jour. Celles situées dans la zone de pénombre ne voient qu'une partie du Soleil cachée : c'est une éclipse partielle. Lors d'une éclipse de Soleil, l'ordre d'alignement est Soleil, Lune, Terre.$$,
        'highlights', array[$$éclipse de Soleil$$, $$éclipse totale$$, $$éclipse partielle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une éclipse de Soleil ne peut se produire qu'à la nouvelle lune, quand la Terre entre dans le cône d'ombre (ou de pénombre) de la Lune. L'alignement est Soleil-Lune-Terre.$$),
        'example', jsonb_build_object('statement', $$Une éclipse de Soleil peut-elle se produire un soir de pleine lune ?$$, 'solution', $$Non : une éclipse de Soleil suppose l'alignement Soleil-Lune-Terre, qui correspond à la nouvelle lune, et non à la pleine lune.$$),
        'fixation', jsonb_build_object('question', $$Quelle différence sépare une éclipse totale de Soleil d'une éclipse partielle ?$$, 'solution', $$Dans l'éclipse totale, l'observateur est dans la zone d'ombre pure et le Soleil est entièrement caché. Dans l'éclipse partielle, il est dans la zone de pénombre et ne voit qu'une partie du Soleil masquée.$$)
      ),
      jsonb_build_object(
        'heading', $$Éclipse de Lune$$,
        'body', $$À la pleine lune, il arrive que la Lune pénètre dans le cône d'ombre de la Terre et devienne invisible ou assombrie pour un observateur terrestre : c'est une éclipse de Lune. Si la Lune entre entièrement dans le cône d'ombre, l'éclipse est totale ; si seule une partie de la Lune y pénètre, l'éclipse est partielle. Lors d'une éclipse de Lune, l'ordre d'alignement est Soleil, Terre, Lune. Contrairement à l'éclipse de Soleil, visible seulement depuis une zone étroite du globe, l'éclipse de Lune est visible depuis toute la face nocturne de la Terre.$$,
        'highlights', array[$$éclipse de Lune$$, $$éclipse totale de Lune$$, $$éclipse partielle de Lune$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une éclipse de Lune ne peut se produire qu'à la pleine lune, quand la Lune entre dans le cône d'ombre de la Terre. L'alignement est Soleil-Terre-Lune. Dans les deux types d'éclipse, les centres des astres sont alignés et le Soleil reste la seule source de lumière ; ce qui diffère, c'est l'astre qui s'interpose et se retrouve dans le cône d'ombre de l'autre.$$),
        'example', jsonb_build_object('statement', $$Lors d'une éclipse de Lune, quel astre s'interpose entre le Soleil et l'astre éclipsé ?$$, 'solution', $$C'est la Terre qui s'interpose entre le Soleil et la Lune, projetant son ombre sur cette dernière.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi une éclipse de Lune peut-elle être observée depuis toute la face nocturne de la Terre, contrairement à une éclipse de Soleil ?$$, 'solution', $$Parce que le cône d'ombre de la Terre, bien plus large que la Lune, la recouvre presque entièrement, alors que le cône d'ombre de la Lune ne couvre qu'une zone étroite de la Terre.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un magazine scientifique publie une photo montrant l'évolution de l'aspect de la Lune sur quatre semaines, allant d'un disque invisible à un disque complet, puis à nouveau invisible. Un camarade te demande de l'aider à identifier les phases représentées et à comprendre à quel moment une éclipse peut survenir.$$,
      'questions', array[
        $$Nomme dans l'ordre les principales phases traversées par la Lune entre deux nouvelles lunes successives.$$,
        $$À quelle phase de la Lune une éclipse de Soleil peut-elle se produire, et quel est l'ordre d'alignement des trois astres ?$$,
        $$À quelle phase de la Lune une éclipse de Lune peut-elle se produire, et quel est l'ordre d'alignement des trois astres ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Donne la différence entre l'ombre propre et l'ombre portée d'un objet opaque.$$,
      'hint', $$L'une est sur l'objet, l'autre est projetée ailleurs.$$,
      'expected', $$L'ombre propre est la partie non éclairée de l'objet lui-même. L'ombre portée est la tache sombre que cet objet projette sur un écran ou une surface.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la durée moyenne d'une lunaison, c'est-à-dire d'un cycle complet des phases de la Lune ?$$,
      'hint', $$C'est un peu plus long qu'un mois de 28 jours.$$,
      'expected', $$Environ 29 jours et 13 heures.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'ordre d'alignement des astres lors d'une éclipse de Soleil ?$$,
      'hint', $$L'astre qui s'interpose se trouve entre les deux autres.$$,
      'expected', $$Soleil, Lune, Terre : la Lune s'interpose entre le Soleil et la Terre.$$
    ),
    jsonb_build_object(
      'question', $$Explique pourquoi une éclipse de Lune ne peut se produire qu'à la pleine lune, et pas à une autre phase.$$,
      'hint', $$Repense à la position relative des trois astres nécessaire pour que la Terre projette son ombre sur la Lune.$$,
      'expected', $$Une éclipse de Lune exige l'alignement Soleil-Terre-Lune, avec la Terre entre le Soleil et la Lune : cette configuration correspond exactement à la pleine lune, où la Lune fait face au Soleil de l'autre côté de la Terre.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-phases-lune-eclipses';
