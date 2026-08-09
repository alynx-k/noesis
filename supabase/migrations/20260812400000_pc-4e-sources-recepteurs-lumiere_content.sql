-- Physique-Chimie 4ème — Sources et récepteurs de lumière.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2021 "Lecon1_Source et recepteur de lumiere
-- final", resource id 16548 ("Je lis le résumé de la leçon"), PDF
-- "PC 4ème_L1_Source et recepteur de lumiere final.pdf" (9 pages, thème
-- Optique). Rewritten in original wording — paraphrased, not copied from
-- the source PDF — keeping the same technical content: primary/secondary
-- light sources (natural/artificial), light receptors (natural/artificial),
-- and the two studied receptors (silver chloride as a photochemical
-- receptor, the LDR/photoresistor as a photoelectric receptor).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève du Lycée Moderne de Facobly a lu dans un magazine scientifique que la lumière de la Lune vient en réalité du Soleil. Intriguée, elle veut vérifier cette affirmation avec ses camarades : pour cela, il leur faut d'abord savoir reconnaître ce qu'est une source de lumière, ce qu'est un récepteur de lumière, et distinguer leurs différentes catégories.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Sources primaires de lumière$$,
        'body', $$Un corps qui émet de la lumière est appelé une source de lumière. Parmi elles, une source primaire est un corps qui émet la lumière qu'il produit lui-même. On distingue les sources primaires naturelles, qui existent sans intervention humaine, des sources primaires artificielles, fabriquées par l'homme.$$,
        'highlights', array[$$source primaire$$, $$naturelle$$, $$artificielle$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une source primaire de lumière produit elle-même la lumière qu'elle émet. Elle est naturelle si l'homme n'intervient pas dans sa formation (Soleil, étoiles, lucioles), artificielle si elle est fabriquée par l'homme (lampe à incandescence, tube néon, écran allumé).$$),
        'example', jsonb_build_object('statement', $$Une luciole brille dans la nuit sans aucune autre lumière autour d'elle. De quel type de source s'agit-il ?$$, 'solution', $$C'est une source primaire naturelle : elle produit elle-même sa lumière et n'est pas fabriquée par l'homme.$$),
        'fixation', jsonb_build_object('question', $$Une lampe torche allumée est-elle une source primaire naturelle ou artificielle ? Justifie.$$, 'solution', $$C'est une source primaire artificielle : elle produit sa propre lumière, mais elle a été fabriquée par l'homme.$$)
      ),
      jsonb_build_object(
        'heading', $$Sources secondaires de lumière$$,
        'body', $$Un corps qui ne produit pas de lumière, mais qui la renvoie après l'avoir reçue d'une source primaire, est une source secondaire, aussi appelée objet éclairé. La Lune, un mur éclairé ou un caillou en plein soleil sont des sources secondaires : ils redeviennent invisibles dès qu'on les prive de tout éclairage.$$,
        'highlights', array[$$source secondaire$$, $$objet éclairé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une source secondaire n'émet pas sa propre lumière : elle diffuse une partie de la lumière reçue d'une source primaire. Sans éclairage, elle disparaît de la vue.$$),
        'example', jsonb_build_object('statement', $$L'élève du Lycée de Facobly voit la Lune briller la nuit, alors que la Lune ne possède aucune flamme ni aucun mécanisme produisant de la chaleur comme le Soleil. Comment expliquer sa lumière ?$$, 'solution', $$La Lune ne fabrique pas sa propre lumière : elle renvoie vers la Terre une partie de la lumière du Soleil qu'elle reçoit. C'est donc une source secondaire.$$),
        'fixation', jsonb_build_object('question', $$Un tableau de classe éclairé par le soleil à travers la fenêtre est-il une source primaire ou secondaire ?$$, 'solution', $$C'est une source secondaire : il ne produit pas de lumière, il se contente de renvoyer celle qu'il reçoit du Soleil.$$)
      ),
      jsonb_build_object(
        'heading', $$Récepteurs de lumière : définition et catégories$$,
        'body', $$Un récepteur de lumière est un corps sensible à la lumière, c'est-à-dire capable de réagir lorsqu'il en reçoit. Comme pour les sources, on distingue les récepteurs naturels (l'œil, la peau, la chlorophylle des plantes) et les récepteurs artificiels (la pellicule photographique, la photorésistance, le chlorure d'argent, les cellules solaires).$$,
        'highlights', array[$$récepteur de lumière$$, $$récepteur naturel$$, $$récepteur artificiel$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un récepteur de lumière réagit à la lumière qu'il reçoit. Naturel, il appartient au vivant (œil, peau, chlorophylle) ; artificiel, il est fabriqué par l'homme (pellicule photo, LDR, chlorure d'argent).$$),
        'example', jsonb_build_object('statement', $$La chlorophylle d'une feuille lui permet d'utiliser la lumière du soleil pour fabriquer sa matière organique. Est-ce un récepteur naturel ou artificiel ?$$, 'solution', $$C'est un récepteur naturel : elle appartient à un être vivant, la plante, sans intervention humaine dans sa fabrication.$$),
        'fixation', jsonb_build_object('question', $$Cite un récepteur de lumière naturel et un récepteur de lumière artificiel, autres que ceux déjà utilisés en exemple.$$, 'solution', $$Naturel : l'œil (ou la peau). Artificiel : la pellicule photographique (ou une cellule solaire).$$)
      ),
      jsonb_build_object(
        'heading', $$Deux récepteurs étudiés : chlorure d'argent et photorésistance$$,
        'body', $$Le chlorure d'argent est un précipité blanc qui reste blanc à l'obscurité, mais qui noircit dès qu'il est exposé à la lumière : c'est un récepteur photochimique, car la lumière déclenche chez lui une transformation chimique. La photorésistance, ou LDR, est un composant électronique qui se comporte comme un isolant dans l'obscurité et comme un conducteur à la lumière : c'est un récepteur photoélectrique. Ces récepteurs sont exploités dans les appareils photo, l'éclairage public, les panneaux solaires ou les calculatrices solaires.$$,
        'highlights', array[$$récepteur photochimique$$, $$récepteur photoélectrique$$, $$LDR$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le chlorure d'argent noircit à la lumière (récepteur photochimique). La LDR devient conductrice à la lumière et isolante à l'obscurité (récepteur photoélectrique).$$),
        'example', jsonb_build_object('statement', $$Dans un montage, une LED reliée à une LDR et une pile ne s'allume pas tant que la LDR reste dans l'obscurité, puis s'allume dès qu'on l'éclaire avec une lampe. Pourquoi ?$$, 'solution', $$À l'obscurité, la LDR se comporte comme un isolant et bloque le courant : la LED reste éteinte. À la lumière, elle devient conductrice et laisse passer le courant : la LED s'allume.$$),
        'fixation', jsonb_build_object('question', $$Un précipité blanc de chlorure d'argent est laissé plusieurs minutes en plein soleil. Que va-t-il se passer et pourquoi ?$$, 'solution', $$Il va noircir : la lumière provoque une transformation chimique du chlorure d'argent, qui est un récepteur photochimique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux élèves discutent à la récréation. L'un affirme que les feuilles du manguier de la cour sont à la fois des sources et des récepteurs de lumière ; l'autre pense qu'elles ne sont que des sources de lumière. Ils te demandent de les départager.$$,
      'questions', array[
        $$Pourquoi peut-on dire qu'une feuille visible en plein jour est une source de lumière, au sens où elle est vue par tout le monde ?$$,
        $$Pourquoi la feuille est-elle en plus un récepteur de lumière, à cause de la chlorophylle qu'elle contient ?$$,
        $$Lequel des deux élèves a raison ? Justifie ta réponse en utilisant les deux notions.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une lampe à incandescence allumée dans une pièce sombre reste visible sans aucun autre éclairage. Est-ce une source primaire ou secondaire ? Est-elle naturelle ou artificielle ?$$,
      'hint', $$Demande-toi si elle produit elle-même sa lumière, puis si elle est fabriquée par l'homme.$$,
      'expected', $$C'est une source primaire, car elle produit elle-même sa lumière, et elle est artificielle, car elle est fabriquée par l'homme.$$
    ),
    jsonb_build_object(
      'question', $$Un miroir plongé dans le noir total devient-il invisible ? Utilise le vocabulaire des sources de lumière pour répondre.$$,
      'hint', $$Un miroir fabrique-t-il de la lumière, ou se contente-t-il d'en renvoyer ?$$,
      'expected', $$Oui, il devient invisible : c'est une source secondaire, qui ne fait que renvoyer la lumière reçue et disparaît donc sans éclairage.$$
    ),
    jsonb_build_object(
      'question', $$Explique la différence entre un récepteur photochimique et un récepteur photoélectrique, en citant un exemple de chaque.$$,
      'hint', $$Repense au chlorure d'argent et à la photorésistance.$$,
      'expected', $$Un récepteur photochimique subit une transformation chimique sous l'effet de la lumière, comme le chlorure d'argent qui noircit. Un récepteur photoélectrique voit une grandeur électrique varier avec la lumière, comme la LDR qui devient conductrice à la lumière.$$
    ),
    jsonb_build_object(
      'question', $$On veut fabriquer une alarme qui sonne dès qu'une lumière apparaît dans une pièce plongée dans le noir, en utilisant une LDR, une pile, une sonnerie et des fils. Explique le principe.$$,
      'hint', $$Pense au comportement de la LDR selon qu'elle est éclairée ou non.$$,
      'expected', $$Dans le noir, la LDR se comporte comme un isolant et empêche le courant de circuler : la sonnerie reste silencieuse. Dès qu'une lumière apparaît, la LDR devient conductrice, le courant circule et la sonnerie se déclenche.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-sources-recepteurs-lumiere';
