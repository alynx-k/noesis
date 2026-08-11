-- Réapplication forcée : ces 8 leçons Physique-Chimie 4ème avaient déjà été poussées avec du
-- contenu fallback ; leurs fichiers ont ensuite été réécrits en place avec du vrai contenu
-- source ecole-ci.org, mais 'supabase db push' suit les migrations par nom de fichier, pas par
-- contenu, donc il fallait une nouvelle migration pour forcer la réapplication en base.

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

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève habite une maison sans plafond, dont le toit est percé par endroits. Les jours de grand soleil, il remarque de petites taches lumineuses qui se déplacent sur le sol de sa chambre au fil des heures. Intrigué, il en parle à ses camarades : ensemble, sous la conduite de leur professeur, ils décident de comprendre comment la lumière se déplace pour produire ces taches, et d'apprendre à représenter son trajet.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Milieux transparents, translucides, opaques et homogènes$$,
        'body', $$Un milieu que la lumière traverse entièrement est dit transparent (l'air, l'eau limpide, le vide). Un milieu qui ne laisse passer aucune lumière est opaque (un mur, un morceau de bois, un métal). Entre les deux, un milieu qui laisse passer une partie seulement de la lumière est translucide (le papier calque, une vitre dépolie). Un milieu est dit homogène quand ses propriétés sont identiques en tout point, comme l'air ou l'eau pure.$$,
        'highlights', array[$$transparent$$, $$translucide$$, $$opaque$$, $$milieu homogène$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Transparent : laisse entièrement passer la lumière. Translucide : la laisse passer partiellement. Opaque : ne la laisse pas passer. Homogène : mêmes propriétés en tout point du milieu.$$),
        'example', jsonb_build_object('statement', $$Une feuille de papier calque placée devant une lampe laisse deviner sa lumière sans qu'on distingue nettement la lampe elle-même. Comment qualifier ce papier ?$$, 'solution', $$Il est translucide : il laisse passer une partie de la lumière, mais pas suffisamment pour voir nettement à travers.$$),
        'fixation', jsonb_build_object('question', $$Un carreau de vitre propre est-il transparent, translucide ou opaque ? Et un morceau de carton ?$$, 'solution', $$La vitre propre est transparente (on voit nettement à travers). Le carton est opaque (aucune lumière ne le traverse).$$)
      ),
      jsonb_build_object(
        'heading', $$Propagation rectiligne, rayon et faisceau lumineux$$,
        'body', $$En plaçant plusieurs écrans percés d'un trou entre une flamme et un écran final, on observe un point lumineux uniquement lorsque tous les trous sont alignés : dès qu'un seul trou est décalé, la lumière n'atteint plus l'écran. Cette expérience montre que, dans un milieu transparent et homogène, la lumière se propage en ligne droite : c'est la propagation rectiligne. Un rayon lumineux est le segment fléché qui modélise ce trajet, la flèche indiquant le sens de propagation ; un faisceau lumineux est un ensemble de rayons issus d'une même source, rendu visible par exemple grâce à des poussières en suspension dans l'air.$$,
        'highlights', array[$$propagation rectiligne$$, $$rayon lumineux$$, $$faisceau lumineux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un milieu transparent et homogène, la lumière se propage en ligne droite. Le rayon lumineux représente ce trajet ; un faisceau lumineux regroupe plusieurs rayons issus de la même source.$$),
        'example', jsonb_build_object('statement', $$Le faisceau d'une lampe torche allumée dans une pièce poussiéreuse dessine une bande droite bien visible entre la lampe et le mur. Qu'est-ce qui rend ce faisceau visible ?$$, 'solution', $$Les poussières en suspension dans l'air diffusent une partie de la lumière du faisceau vers l'œil de l'observateur, rendant visible le trajet rectiligne des rayons.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi, dans l'expérience des écrans percés, le point lumineux disparaît-il dès qu'un seul trou est désaligné ?$$, 'solution', $$Parce que la lumière se propage en ligne droite : si les trous ne sont plus alignés, aucun trajet rectiligne ne relie la source à l'écran final, donc la lumière ne peut plus passer.$$)
      ),
      jsonb_build_object(
        'heading', $$La chambre noire : une image renversée$$,
        'body', $$Une chambre noire est une boîte opaque percée d'un petit trou, le sténopé, sur une face, et munie d'un écran sur la face opposée. La lumière issue de chaque point d'un objet lumineux, comme la flamme d'une bougie, traverse le sténopé en ligne droite et forme sur l'écran une image renversée et inversée par rapport à l'objet : le haut devient le bas, et la gauche devient la droite.$$,
        'highlights', array[$$chambre noire$$, $$sténopé$$, $$image renversée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans une chambre noire, chaque rayon issu d'un point de l'objet passe par le sténopé en ligne droite et vient former, sur l'écran, l'image de ce point à une position renversée et inversée : l'image obtenue est donc renversée et inversée par rapport à l'objet.$$),
        'example', jsonb_build_object('statement', $$La lettre "p" est placée devant le sténopé d'une chambre noire. Quelle lettre apparaît sur l'écran ?$$, 'solution', $$La lettre "d" : l'image est renversée (le haut devient le bas) et inversée (la gauche devient la droite), ce qui transforme le "p" en "d".$$),
        'fixation', jsonb_build_object('question', $$Une bougie est placée devant le sténopé d'une chambre noire, la flamme vers le haut. Comment apparaît son image sur l'écran ?$$, 'solution', $$L'image apparaît renversée : la flamme de la bougie pointe vers le bas sur l'écran, du fait de la propagation rectiligne des rayons à travers le sténopé.$$)
      ),
      jsonb_build_object(
        'heading', $$Vitesse de la lumière et année-lumière$$,
        'body', $$Dans le vide, la lumière se propage à une vitesse d'environ 300 000 km/s (soit 300 000 000 m/s). Cette vitesse considérable permet de définir une unité de distance adaptée aux échelles astronomiques : l'année-lumière, qui correspond à la distance parcourue par la lumière en une année, soit environ 9,46 × 10¹² km.$$,
        'highlights', array[$$vitesse de la lumière$$, $$300 000 km/s$$, $$année-lumière$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Vitesse de la lumière dans le vide : c ≈ 300 000 km/s. Année-lumière : distance parcourue par la lumière en une année, soit environ 9,46 × 10¹² km. La durée de propagation se calcule par t = d / v.$$),
        'example', jsonb_build_object('statement', $$La distance Terre-Soleil est d'environ 150 000 000 km. Quelle est la durée mise par la lumière du Soleil pour nous parvenir ?$$, 'solution', $$t = d / v = 150 000 000 / 300 000 = 500 s, soit 8 min 20 s.$$),
        'fixation', jsonb_build_object('question', $$L'étoile Proxima du Centaure est distante de 4,2 années-lumière de la Terre. Que représente ce nombre ?$$, 'solution', $$Il représente la distance parcourue par la lumière en 4,2 années : c'est le temps que met la lumière de cette étoile pour nous parvenir.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un camarade absent lors du cours sur la propagation de la lumière apprend que l'image de la lettre "p", placée devant le sténopé d'une chambre noire, apparaît comme la lettre "d" sur l'écran. Il ne comprend pas pourquoi, et te demande de le lui expliquer.$$,
      'questions', array[
        $$Nomme les deux éléments essentiels d'une chambre noire, celui percé d'un petit trou et celui qui reçoit l'image.$$,
        $$Décris la marche des rayons lumineux depuis un point de la lettre "p" jusqu'à sa position sur l'écran.$$,
        $$Explique, à l'aide de la propagation rectiligne de la lumière, pourquoi l'image du "p" devient un "d".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un morceau de bois, une vitre dépolie et de l'eau limpide sont présentés à un élève. Classe chacun d'eux comme transparent, translucide ou opaque.$$,
      'hint', $$Demande-toi si la lumière les traverse totalement, partiellement, ou pas du tout.$$,
      'expected', $$Le bois est opaque, la vitre dépolie est translucide, l'eau limpide est transparente.$$
    ),
    jsonb_build_object(
      'question', $$Explique la différence entre un rayon lumineux et un faisceau lumineux.$$,
      'hint', $$Pense au nombre de trajets représentés dans chaque cas.$$,
      'expected', $$Un rayon lumineux est un trajet unique, représenté par une droite fléchée. Un faisceau lumineux regroupe plusieurs rayons issus de la même source.$$
    ),
    jsonb_build_object(
      'question', $$La distance Terre-Lune est d'environ 384 000 km. Calcule la durée mise par la lumière pour parcourir cette distance, sachant que c ≈ 300 000 km/s.$$,
      'hint', $$Utilise t = d / v.$$,
      'expected', $$t = 384 000 / 300 000 ≈ 1,3 s.$$
    ),
    jsonb_build_object(
      'question', $$Une bougie allumée, flamme vers le haut, est placée devant le sténopé d'une chambre noire. Décris l'image obtenue sur l'écran et explique pourquoi.$$,
      'hint', $$Pense à la propagation rectiligne des rayons à travers le petit trou.$$,
      'expected', $$L'image est renversée : la flamme apparaît orientée vers le bas sur l'écran, car les rayons issus de chaque point de la bougie traversent le sténopé en ligne droite et se croisent avant de former l'image.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-propagation-lumiere';

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

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève achète une chemise dans une boutique éclairée par une lumière bleue : sous cet éclairage, la chemise lui paraît noire. Une fois rentré chez lui, à la lumière du jour, il découvre avec surprise que sa chemise est en réalité rouge. Pour comprendre ce changement d'apparence, il doit d'abord découvrir de quelles couleurs se compose réellement la lumière blanche, et comment la couleur d'un objet dépend de la lumière qui l'éclaire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Décomposition de la lumière blanche$$,
        'body', $$En faisant traverser un faisceau de lumière blanche à travers un verre d'eau ou un prisme, on observe sur un écran une bande continue de couleurs, appelée spectre : violet, indigo, bleu, vert, jaune, orange, rouge. Cette expérience, appelée analyse ou décomposition de la lumière blanche, prouve que la lumière blanche n'est pas une couleur simple, mais résulte de la superposition de ces sept couleurs.$$,
        'highlights', array[$$décomposition$$, $$analyse$$, $$spectre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La lumière blanche se décompose, à travers un prisme ou un verre d'eau, en un spectre continu de sept couleurs : violet, indigo, bleu, vert, jaune, orange, rouge. Cette décomposition peut aussi être obtenue avec un réseau ou la face gravée d'un disque compact.$$),
        'example', jsonb_build_object('statement', $$Après une averse, un arc-en-ciel apparaît dans le ciel alors que le Soleil brille encore, l'observateur lui tournant le dos. Quelle expérience de la leçon ce phénomène rappelle-t-il ?$$, 'solution', $$Il rappelle la décomposition de la lumière blanche par un prisme ou un verre d'eau : ici, ce sont les gouttelettes d'eau en suspension dans l'air qui décomposent la lumière blanche du Soleil en ses sept couleurs.$$),
        'fixation', jsonb_build_object('question', $$Cite, dans l'ordre, les sept couleurs visibles obtenues en décomposant la lumière blanche.$$, 'solution', $$Violet, indigo, bleu, vert, jaune, orange, rouge.$$)
      ),
      jsonb_build_object(
        'heading', $$Synthèse de la lumière blanche$$,
        'body', $$À l'inverse de la décomposition, on peut recomposer de la lumière blanche : c'est la synthèse. Un disque de Newton, portant les sept couleurs du spectre, paraît blanc dès qu'il tourne assez vite. On peut aussi superposer trois lumières colorées, dites couleurs primaires : le rouge, le vert et le bleu. Leur superposition totale donne du blanc ; superposées deux à deux, elles donnent d'autres couleurs.$$,
        'highlights', array[$$synthèse$$, $$couleurs primaires$$, $$disque de Newton$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Rouge + vert + bleu = blanc. Deux à deux : rouge + vert = jaune, bleu + vert = cyan, rouge + bleu = magenta. Le rouge, le vert et le bleu sont les couleurs primaires de la lumière.$$),
        'example', jsonb_build_object('statement', $$Sur un écran, on superpose un faisceau de lumière bleue et un faisceau de lumière rouge, de même intensité. Quelle couleur apparaît dans la zone de superposition ?$$, 'solution', $$D'après la synthèse additive, bleu + rouge donne du magenta.$$),
        'fixation', jsonb_build_object('question', $$Quelle couleur obtient-on en superposant les trois couleurs primaires rouge, vert et bleu avec la même intensité ?$$, 'solution', $$On obtient du blanc.$$)
      ),
      jsonb_build_object(
        'heading', $$Rôle d'un filtre coloré$$,
        'body', $$Un filtre coloré, placé devant une source de lumière blanche, absorbe une partie des couleurs qui le traversent et ne laisse passer que les autres, qui lui donnent sa couleur. Il permet ainsi d'obtenir une lumière colorée à partir d'une lumière blanche.$$,
        'highlights', array[$$filtre coloré$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un filtre coloré absorbe certaines couleurs de la lumière incidente et transmet les autres. La lumière qui sort du filtre a la couleur des composantes transmises.$$),
        'example', jsonb_build_object('statement', $$Un filtre vert est placé devant une lampe émettant de la lumière blanche. Quelle couleur observe-t-on après le filtre ?$$, 'solution', $$Le filtre vert absorbe les autres couleurs et ne transmet que le vert : la lumière observée après le filtre est verte.$$),
        'fixation', jsonb_build_object('question', $$Un filtre rouge est traversé par de la lumière blanche. Que devient la lumière transmise ?$$, 'solution', $$Elle devient rouge, car le filtre absorbe les autres couleurs et ne laisse passer que le rouge.$$)
      ),
      jsonb_build_object(
        'heading', $$Couleur des objets éclairés$$,
        'body', $$Éclairé en lumière blanche, un objet diffuse certaines couleurs et absorbe les autres ; la couleur diffusée est sa couleur propre. Un objet blanc diffuse toutes les couleurs reçues, un objet noir les absorbe toutes. Éclairé par une lumière colorée, en revanche, l'objet ne peut diffuser que les couleurs présentes dans cette lumière et qu'il n'absorbe pas : s'il ne reçoit aucune des couleurs qu'il diffuse habituellement, il paraît noir ; s'il reçoit une couleur qu'il diffuse d'ordinaire, il conserve son apparence.$$,
        'highlights', array[$$couleur propre$$, $$absorption$$, $$diffusion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La couleur propre d'un objet est celle qu'il diffuse quand il est éclairé en lumière blanche. Sous une lumière colorée, l'objet paraît noir si cette lumière ne contient pas la couleur qu'il diffuse habituellement, et garde sa couleur propre si elle la contient.$$),
        'example', jsonb_build_object('statement', $$Une chemise rouge, dont la couleur propre est le rouge, est éclairée par une lumière bleue ne contenant aucune composante rouge. De quelle couleur paraît-elle ?$$, 'solution', $$Elle paraît noire : la chemise ne peut diffuser que le rouge, absent de la lumière bleue reçue, donc elle n'a rien à renvoyer vers l'œil.$$),
        'fixation', jsonb_build_object('question', $$Un objet dont la couleur propre est le vert est éclairé par une lumière verte. De quelle couleur paraît-il ? Justifie.$$, 'solution', $$Il paraît vert : la lumière reçue contient justement la couleur qu'il diffuse habituellement, qu'il peut donc renvoyer vers l'œil.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La voiture bleue d'une famille paraît noire, un soir, garée sous un lampadaire de couleur jaune ; sous la lumière du jour, elle est bien bleue. Un enfant de la famille demande une explication de ce changement d'apparence.$$,
      'questions', array[
        $$Cite les trois couleurs primaires de la lumière, dont la superposition donne du blanc.$$,
        $$Quelle est la couleur propre de la voiture, c'est-à-dire la couleur qu'elle diffuse en lumière blanche ?$$,
        $$Sachant que la lumière jaune du lampadaire résulte de la superposition du rouge et du vert (sans bleu), explique pourquoi la voiture paraît noire sous cet éclairage.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels instruments permettent de décomposer la lumière blanche en un spectre continu de couleurs ?$$,
      'hint', $$Pense à deux exemples cités dans la leçon, l'un en verre, l'un liquide.$$,
      'expected', $$Un prisme, ou un simple verre d'eau (un réseau ou la face gravée d'un CD conviennent aussi).$$
    ),
    jsonb_build_object(
      'question', $$Quelle couleur obtient-on en synthèse additive en superposant du jaune (rouge + vert) et du bleu ?$$,
      'hint', $$Le jaune contient déjà le rouge et le vert ; ajoute le bleu aux trois couleurs primaires.$$,
      'expected', $$On obtient du blanc, car jaune + bleu réunit les trois couleurs primaires rouge, vert et bleu.$$
    ),
    jsonb_build_object(
      'question', $$Un citron, de couleur propre jaune, est éclairé en lumière blanche. Explique pourquoi il paraît jaune.$$,
      'hint', $$Pense à ce que le citron absorbe et à ce qu'il diffuse.$$,
      'expected', $$Le citron absorbe toutes les couleurs de la lumière blanche sauf le jaune, qu'il diffuse vers l'œil : c'est pourquoi il paraît jaune.$$
    ),
    jsonb_build_object(
      'question', $$Une jupe bleue, éclairée par une veilleuse de couleur rouge, paraît noire. Explique pourquoi.$$,
      'hint', $$La jupe ne peut diffuser que le bleu ; est-ce que la lumière rouge en contient ?$$,
      'expected', $$La jupe ne peut diffuser que le bleu, sa couleur propre, or la lumière rouge de la veilleuse ne contient pas de bleu : la jupe n'a donc rien à diffuser et paraît noire.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-analyse-synthese-lumiere-blanche';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence donnée dans un lycée, un agent de la compagnie d'électricité affirme que l'éclairage public est commandé par un dispositif appelé électroaimant. De retour en classe, les élèves veulent comprendre ce que sont un aimant et une bobine, connaître leurs propriétés, puis découvrir comment on fabrique et on utilise un électroaimant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Propriétés et pôles d'un aimant$$,
        'body', $$Un aimant est un corps capable d'attirer le fer, le nickel, le cobalt et les objets fabriqués à partir de ces métaux. Cette attraction se manifeste surtout à ses deux extrémités, appelées pôles : un pôle Nord et un pôle Sud. Pour identifier ces pôles sur un aimant inconnu, on approche une aiguille aimantée (comme celle d'une boussole) : l'extrémité qui attire le pôle Nord de l'aiguille est le pôle Sud de l'aimant, et celle qui attire son pôle Sud est le pôle Nord de l'aimant.$$,
        'highlights', array[$$aimant$$, $$pôle Nord$$, $$pôle Sud$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un aimant attire le fer, le nickel, le cobalt et leurs alliages, principalement par ses deux pôles, Nord et Sud. Le pôle Nord d'une aiguille aimantée est toujours attiré par le pôle Sud de l'aimant qu'on lui présente.$$),
        'example', jsonb_build_object('statement', $$On approche une aiguille aimantée d'une extrémité d'un aimant inconnu : le pôle Nord de l'aiguille est repoussé, tandis que son pôle Sud est attiré. Quel est le nom de cette extrémité de l'aimant ?$$, 'solution', $$Puisque le pôle Sud de l'aiguille est attiré, cette extrémité de l'aimant est son pôle Nord (un pôle Nord attire toujours un pôle Sud).$$),
        'fixation', jsonb_build_object('question', $$Quels métaux un aimant est-il capable d'attirer ?$$, 'solution', $$Le fer, le nickel, le cobalt et les objets fabriqués à partir de ces métaux.$$)
      ),
      jsonb_build_object(
        'heading', $$Interaction entre deux aimants$$,
        'body', $$Lorsqu'on approche deux aimants l'un de l'autre, le résultat dépend des pôles mis face à face : deux pôles de même nom se repoussent, deux pôles de noms différents s'attirent.$$,
        'highlights', array[$$attraction$$, $$répulsion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Deux pôles Nord (ou deux pôles Sud) présentés l'un à l'autre se repoussent. Un pôle Nord et un pôle Sud présentés l'un à l'autre s'attirent.$$),
        'example', jsonb_build_object('statement', $$Trois aimants droits AB, CD et EF sont disposés côte à côte : le pôle A attire le pôle C, et F est un pôle Sud. Que peut-on dire du pôle C ?$$, 'solution', $$Si A attire C, ils sont de noms différents. Il faut connaître la nature de A pour conclure sur C, mais dans tous les cas C est le pôle opposé à celui de A.$$),
        'fixation', jsonb_build_object('question', $$Deux aimants sont présentés pôle Sud contre pôle Sud. Vont-ils s'attirer ou se repousser ?$$, 'solution', $$Ils vont se repousser, car ce sont deux pôles de même nom.$$)
      ),
      jsonb_build_object(
        'heading', $$La bobine, un aimant temporaire$$,
        'body', $$Une bobine est un long fil conducteur en cuivre, isolé par une gaine, enroulé sur un support généralement cylindrique. Parcourue par un courant électrique, elle se comporte comme un aimant : elle attire les aiguilles aimantées par ses deux extrémités, appelées faces, l'une Nord et l'autre Sud. La nature de chaque face dépend du sens du courant qui traverse la bobine : inverser les bornes de la pile inverse les faces Nord et Sud.$$,
        'highlights', array[$$bobine$$, $$face Nord$$, $$face Sud$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une bobine parcourue par un courant électrique se comporte comme un aimant, avec une face Nord et une face Sud dont la position dépend du sens du courant. Deux faces de même nom se repoussent, deux faces de noms différents s'attirent, comme pour un aimant.$$),
        'example', jsonb_build_object('statement', $$Une bobine reliée à une pile attire le pôle Nord d'une aiguille aimantée par l'une de ses faces. On inverse ensuite les bornes de la pile. Que devient cette face de la bobine ?$$, 'solution', $$Elle change de nature : si elle attirait le pôle Nord de l'aiguille (c'était donc une face Sud), elle devient une face Nord et repousse désormais ce même pôle Nord.$$),
        'fixation', jsonb_build_object('question', $$Que devient l'effet magnétique d'une bobine si l'on ouvre le circuit qui l'alimente ?$$, 'solution', $$Il disparaît immédiatement : sans courant, la bobine ne se comporte plus comme un aimant.$$)
      ),
      jsonb_build_object(
        'heading', $$L'électroaimant et ses applications$$,
        'body', $$Un électroaimant est une bobine parcourue par un courant électrique, à l'intérieur de laquelle est placée une tige de fer appelée noyau. Ce noyau de fer doux renforce considérablement l'attraction produite par la bobine. Parmi les applications de l'électroaimant figurent le relais et le télérupteur, deux interrupteurs actionnés à distance par un électroaimant, utilisés par exemple pour commander l'éclairage public.$$,
        'highlights', array[$$électroaimant$$, $$noyau de fer$$, $$relais$$, $$télérupteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un électroaimant associe une bobine parcourue par un courant et un noyau de fer doux, qui amplifie l'effet magnétique. Le relais et le télérupteur sont des interrupteurs commandés par un électroaimant.$$),
        'example', jsonb_build_object('statement', $$Un agent d'électricité explique que l'éclairage public est déclenché par un interrupteur actionné à distance par un électroaimant. Comment appelle-t-on un tel interrupteur ?$$, 'solution', $$C'est un relais (ou un télérupteur), un dispositif qui utilise un électroaimant pour ouvrir ou fermer un circuit à distance.$$),
        'fixation', jsonb_build_object('question', $$Que place-t-on à l'intérieur d'une bobine pour fabriquer un électroaimant, et quel est l'effet de cet ajout ?$$, 'solution', $$On y place une tige de fer doux, appelée noyau, qui renforce l'attraction magnétique de la bobine.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves reçoit trois aimants droits AB, CD et EF : le pôle A attire le pôle C, le pôle D repousse le pôle E, et le pôle F est un pôle Sud. Ils doivent déterminer la nature de chacun des pôles A, B, C, D et E.$$,
      'questions', array[
        $$Sachant que E est un pôle Nord (car il repousse D), quelle doit être la nature du pôle D ?$$,
        $$Sachant que A attire C, si A est un pôle Nord, quelle est la nature de C ?$$,
        $$Y a-t-il attraction ou répulsion entre A et F, sachant que F est un pôle Sud et que A est un pôle Nord ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux métaux, autres que le fer, qu'un aimant est capable d'attirer.$$,
      'hint', $$Pense aux matériaux ferromagnétiques cités dans la leçon.$$,
      'expected', $$Le nickel et le cobalt.$$
    ),
    jsonb_build_object(
      'question', $$Deux aimants sont présentés pôle Sud contre pôle Nord. Vont-ils s'attirer ou se repousser ?$$,
      'hint', $$Compare les noms des deux pôles en présence.$$,
      'expected', $$Ils vont s'attirer, car ce sont deux pôles de noms différents.$$
    ),
    jsonb_build_object(
      'question', $$Une bobine reliée à une pile attire une aiguille aimantée par sa face A. On inverse le sens du courant. Que devient la face A ?$$,
      'hint', $$Le sens du courant détermine la nature des faces d'une bobine.$$,
      'expected', $$La nature de la face A s'inverse : elle devient une face de nom opposé à celui qu'elle avait avant l'inversion du courant.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un électroaimant, et quel élément supplémentaire distingue une bobine simple d'un électroaimant ?$$,
      'hint', $$Pense à ce qu'on ajoute à l'intérieur de la bobine.$$,
      'expected', $$Un électroaimant est une bobine parcourue par un courant, à l'intérieur de laquelle on a placé une tige de fer doux appelée noyau, qui renforce son attraction.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-aimant-bobine';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite guidée d'une centrale thermique, des élèves de 4ème apprennent qu'un ingénieur y explique la production de la tension électrique. De retour en classe, ils veulent produire eux-mêmes une tension à partir d'un aimant et d'une bobine, visualiser cette tension, la comparer à celle d'une pile, et comprendre comment ce principe est exploité, de la dynamo de vélo jusqu'aux grandes centrales électriques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Tension produite par un aimant en mouvement près d'une bobine$$,
        'body', $$Une bobine est reliée à un galvanomètre. Lorsqu'un aimant reste immobile devant elle, l'aiguille du galvanomètre ne bouge pas. Dès que l'on déplace l'aimant à proximité d'une des faces de la bobine, l'aiguille dévie, d'abord dans un sens, puis dans l'autre si le mouvement se poursuit. Ce déplacement de l'aimant fait donc apparaître une tension dans le circuit de la bobine.$$,
        'highlights', array[$$tension induite$$, $$déplacement de l'aimant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le déplacement d'un aimant au voisinage d'une des faces d'une bobine fait apparaître une tension dans le circuit de cette bobine. Sans mouvement relatif, aucune tension n'apparaît.$$),
        'example', jsonb_build_object('statement', $$Un aimant immobile est placé devant une bobine reliée à un galvanomètre : l'aiguille ne bouge pas. On approche alors rapidement l'aimant de la bobine. Que se passe-t-il ?$$, 'solution', $$L'aiguille du galvanomètre dévie, car le déplacement de l'aimant fait apparaître une tension dans le circuit de la bobine.$$),
        'fixation', jsonb_build_object('question', $$Une bobine et un aimant restent tous deux parfaitement immobiles l'un devant l'autre. Une tension apparaît-elle dans le circuit de la bobine ?$$, 'solution', $$Non, car il n'y a pas de déplacement de l'aimant par rapport à la bobine.$$)
      ),
      jsonb_build_object(
        'heading', $$Nature de la tension produite : une tension alternative$$,
        'body', $$En reliant la bobine à deux diodes électroluminescentes (DEL) montées tête-bêche, on observe qu'elles s'allument l'une après l'autre à mesure que l'aimant se déplace : la tension change donc de sens au fil du temps. Observée à l'oscilloscope, la tension produite par la pile trace une droite horizontale constante (tension continue), tandis que celle produite par l'aimant et la bobine trace une courbe qui oscille tantôt au-dessus, tantôt en dessous de l'axe des temps : c'est une tension alternative.$$,
        'highlights', array[$$tension alternative$$, $$tension continue$$, $$oscilloscope$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une tension continue, comme celle d'une pile, garde toujours le même sens : à l'oscilloscope, elle donne une droite horizontale. Une tension alternative change périodiquement de sens au cours du temps : à l'oscilloscope, elle donne une courbe qui oscille de part et d'autre de l'axe des temps.$$),
        'example', jsonb_build_object('statement', $$Deux DEL montées tête-bêche sont reliées à une bobine devant laquelle on déplace un aimant de va-et-vient. Elles s'allument chacune leur tour. Que révèle cette observation sur la tension produite ?$$, 'solution', $$Elle révèle que la tension change de sens au cours du temps : chaque DEL ne s'allume que lorsque le courant circule dans le sens qui lui convient, donc la tension est alternative.$$),
        'fixation', jsonb_build_object('question', $$Quelle forme prend, sur l'écran d'un oscilloscope, la tension continue produite par une pile ?$$, 'solution', $$Une droite horizontale constante, au-dessus ou en dessous de l'axe des temps.$$)
      ),
      jsonb_build_object(
        'heading', $$L'alternateur : rotor et stator$$,
        'body', $$Un alternateur est un générateur qui produit une tension alternative grâce à deux parties : le rotor, la partie tournante qui porte l'aimant, et le stator, la partie fixe qui porte la bobine. La rotation continue du rotor devant le stator fait apparaître une tension alternative aux bornes de la bobine.$$,
        'highlights', array[$$alternateur$$, $$rotor$$, $$stator$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Dans un alternateur, le rotor (aimant tournant) entraîne l'apparition d'une tension alternative dans le stator (bobine fixe). Plus la rotation du rotor est rapide, plus la tension produite est grande.$$),
        'example', jsonb_build_object('statement', $$Dans un alternateur, quelle est la partie qui tourne et quelle est celle qui reste fixe ?$$, 'solution', $$Le rotor, qui porte l'aimant, tourne ; le stator, qui porte la bobine, reste fixe.$$),
        'fixation', jsonb_build_object('question', $$Quel est le rôle du rotor dans un alternateur ?$$, 'solution', $$Le rotor porte l'aimant et tourne, ce qui fait apparaître une tension alternative dans la bobine du stator.$$)
      ),
      jsonb_build_object(
        'heading', $$Applications de l'alternateur$$,
        'body', $$Sur un vélo, une génératrice de bicyclette utilise le mouvement de la roue : un galet en contact avec le pneu entraîne la rotation de l'aimant (rotor) devant la bobine (stator), produisant la tension alternative qui allume le phare. À plus grande échelle, une centrale hydroélectrique utilise le mouvement de l'eau pour faire tourner une turbine reliée à un alternateur, tandis qu'une centrale thermique brûle du charbon, du pétrole ou du gaz pour produire de la vapeur d'eau qui entraîne cette même turbine.$$,
        'highlights', array[$$génératrice de bicyclette$$, $$centrale hydroélectrique$$, $$centrale thermique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Toute centrale électrique (hydroélectrique, thermique) repose sur une turbine qui entraîne un alternateur : c'est la rotation de cette turbine, provoquée par l'eau ou la vapeur, qui produit la tension alternative distribuée par le réseau.$$),
        'example', jsonb_build_object('statement', $$Un cycliste s'arrête : le phare de son vélo, alimenté par une génératrice, s'éteint aussitôt. Pourquoi ?$$, 'solution', $$Sans rotation de la roue, le galet n'entraîne plus l'aimant : il n'y a plus de mouvement relatif entre l'aimant et la bobine, donc plus de tension produite, et le phare s'éteint.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui fait tourner la turbine reliée à l'alternateur dans une centrale hydroélectrique ?$$, 'solution', $$Le mouvement de l'eau.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Chaque soir, un cycliste se déplace à vélo, phare allumé grâce à une génératrice de bicyclette posée contre la roue. Son fils affirme que cette génératrice contient une bobine et un aimant, sans savoir laquelle des deux parties est mobile.$$,
      'questions', array[
        $$Quelle partie de la génératrice de bicyclette est entraînée en rotation par le galet en contact avec la roue ?$$,
        $$Quel type de tension (continue ou alternative) est produit aux bornes de la bobine pendant le pédalage ?$$,
        $$Que se passe-t-il pour cette tension, et donc pour le phare, si le cycliste s'arrête complètement ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une bobine reliée à un galvanomètre fait face à un aimant immobile : l'aiguille ne bouge pas. Que faut-il faire pour qu'une tension apparaisse ?$$,
      'hint', $$Pense à la condition nécessaire pour qu'une tension soit induite.$$,
      'expected', $$Il faut déplacer l'aimant par rapport à la bobine : sans mouvement relatif, aucune tension n'apparaît.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre la courbe observée à l'oscilloscope pour la tension d'une pile et celle produite par un aimant en mouvement devant une bobine ?$$,
      'hint', $$L'une est une droite, l'autre change de sens.$$,
      'expected', $$La tension d'une pile donne une droite horizontale constante (tension continue), alors que celle de l'aimant en mouvement donne une courbe qui oscille de part et d'autre de l'axe des temps (tension alternative).$$
    ),
    jsonb_build_object(
      'question', $$Dans un alternateur, quel est le nom de la partie tournante et celui de la partie fixe ?$$,
      'hint', $$L'une porte l'aimant, l'autre porte la bobine.$$,
      'expected', $$Le rotor est la partie tournante (elle porte l'aimant) ; le stator est la partie fixe (elle porte la bobine).$$
    ),
    jsonb_build_object(
      'question', $$Explique le principe commun à une centrale hydroélectrique et à une centrale thermique pour produire de l'électricité.$$,
      'hint', $$Les deux types de centrales font tourner le même type de dispositif.$$,
      'expected', $$Dans les deux cas, une turbine est entraînée en rotation (par l'eau dans une centrale hydroélectrique, par de la vapeur d'eau dans une centrale thermique) et cette turbine fait tourner un alternateur, qui produit la tension alternative distribuée.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-production-tension-alternative';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un lycée reçoit en don un générateur de tension alternative dont la fiche technique a été perdue. Pour la reconstituer, des élèves de 4ème décident de brancher ce générateur à un oscilloscope, d'observer la courbe obtenue, puis de déterminer toutes les grandeurs qui caractérisent une tension alternative sinusoïdale : sa période, sa fréquence, sa tension maximale et sa tension efficace.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Visualisation à l'oscilloscope$$,
        'body', $$En reliant un générateur à un oscilloscope, on observe parfois une courbe régulière et ondulée qui s'annule et change de sens de façon répétée : sa valeur est tantôt positive, tantôt négative. Une tension qui donne cette forme caractéristique de vagues régulières est appelée tension alternative sinusoïdale.$$,
        'highlights', array[$$oscilloscope$$, $$tension alternative sinusoïdale$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une tension alternative sinusoïdale est une tension tantôt positive, tantôt négative, dont la courbe à l'oscilloscope a la forme régulière d'une sinusoïde.$$),
        'example', jsonb_build_object('statement', $$Sur l'écran d'un oscilloscope relié à un générateur, la courbe observée est une droite horizontale qui ne varie jamais. S'agit-il d'une tension alternative sinusoïdale ?$$, 'solution', $$Non : une droite horizontale constante indique une tension continue, pas une tension alternative sinusoïdale, qui doit onduler et changer de signe.$$),
        'fixation', jsonb_build_object('question', $$Quelle forme caractéristique prend, à l'oscilloscope, une tension alternative sinusoïdale ?$$, 'solution', $$La forme régulière et ondulée d'une sinusoïde, oscillant entre des valeurs positives et négatives.$$)
      ),
      jsonb_build_object(
        'heading', $$Période et fréquence$$,
        'body', $$La période, notée T et exprimée en secondes, est la durée minimale nécessaire pour qu'une alternance positive suivie d'une alternance négative se reproduise à l'identique. La fréquence, notée N et exprimée en hertz (Hz), indique le nombre de fois que ce motif se répète en une seconde : elle est l'inverse de la période.$$,
        'highlights', array[$$période$$, $$fréquence$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$N = 1/T, où T est la période en secondes (s) et N la fréquence en hertz (Hz).$$),
        'example', jsonb_build_object('statement', $$Sur un graphique, chaque carreau horizontal représente 5 ms, et la période s'étend sur 4 carreaux. Calcule la période, puis la fréquence.$$, 'solution', $$T = 5 ms × 4 = 20 ms = 0,02 s. N = 1/T = 1/0,02 = 50 Hz.$$),
        'fixation', jsonb_build_object('question', $$Une tension alternative a une fréquence N = 100 Hz. Calcule sa période.$$, 'solution', $$T = 1/N = 1/100 = 0,01 s.$$)
      ),
      jsonb_build_object(
        'heading', $$Lecture de la tension maximale sur un graphique$$,
        'body', $$La tension maximale, notée Umax et exprimée en volts, est la plus grande valeur atteinte par la courbe. Sur l'écran d'un oscilloscope ou un graphique quadrillé, on la détermine en comptant le nombre de carreaux verticaux entre l'axe des temps et le sommet de la courbe, puis en multipliant ce nombre par la valeur d'un carreau (l'échelle verticale).$$,
        'highlights', array[$$tension maximale$$, $$échelle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Umax se lit en comptant le nombre de divisions verticales entre l'axe des temps et le sommet de la courbe, multiplié par la valeur d'une division (en V par carreau).$$),
        'example', jsonb_build_object('statement', $$Sur un graphique où chaque carreau vertical vaut 5 V, le sommet de la sinusoïde se situe à 3 carreaux au-dessus de l'axe des temps. Quelle est la tension maximale ?$$, 'solution', $$Umax = 5 V × 3 = 15 V.$$),
        'fixation', jsonb_build_object('question', $$Sur un graphique où chaque carreau vertical vaut 78 V, le sommet de la courbe se situe à 2 carreaux au-dessus de l'axe des temps. Quelle est la tension maximale ?$$, 'solution', $$Umax = 78 V × 2 = 156 V.$$)
      ),
      jsonb_build_object(
        'heading', $$Tension efficace et tension du secteur$$,
        'body', $$La tension efficace, notée Ueff et exprimée en volts, est la valeur mesurée directement par un voltmètre branché aux bornes du générateur. Elle est liée à la tension maximale par une relation constante : Umax vaut environ 1,41 fois Ueff. C'est cette valeur efficace qui figure sur les appareils électroménagers ; en Côte d'Ivoire, le secteur distribué par la CIE a pour valeur efficace 220 V et pour fréquence 50 Hz.$$,
        'highlights', array[$$tension efficace$$, $$secteur ivoirien$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Umax = 1,41 × Ueff (ou Ueff = Umax / 1,41). Secteur ivoirien : Ueff = 220 V, N = 50 Hz, T = 0,02 s.$$),
        'example', jsonb_build_object('statement', $$Calcule la tension maximale du secteur ivoirien, sachant que sa valeur efficace est 220 V.$$, 'solution', $$Umax = 220 × 1,41 = 310,2 V, soit environ 310 V.$$),
        'fixation', jsonb_build_object('question', $$Une tension alternative sinusoïdale a une tension maximale Umax = 20 V. Calcule sa tension efficace.$$, 'solution', $$Ueff = Umax / 1,41 = 20 / 1,41 ≈ 14,2 V.$$),
        'table', jsonb_build_object(
          'headers', array[$$Grandeur$$, $$Symbole$$, $$Unité$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Période$$, $$T$$, $$seconde (s)$$),
            jsonb_build_array($$Fréquence$$, $$N$$, $$hertz (Hz)$$),
            jsonb_build_array($$Tension maximale$$, $$Umax$$, $$volt (V)$$),
            jsonb_build_array($$Tension efficace$$, $$Ueff$$, $$volt (V)$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une séance de travaux pratiques, un élève relève l'inscription N = 100 Hz sur un appareil, puis mesure au voltmètre une tension efficace de 200 V.$$,
      'questions', array[
        $$Quelle est la nature de cette tension, sachant qu'elle est produite par un générateur d'alternateur ?$$,
        $$Calcule la période T correspondant à cette fréquence.$$,
        $$Calcule la tension maximale de cet appareil.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite les quatre grandeurs qui caractérisent une tension alternative sinusoïdale.$$,
      'hint', $$Pense au temps (deux grandeurs) et à la tension (deux grandeurs).$$,
      'expected', $$La période, la fréquence, la tension maximale et la tension efficace.$$
    ),
    jsonb_build_object(
      'question', $$Une tension alternative sinusoïdale a une période T = 0,04 s. Calcule sa fréquence.$$,
      'hint', $$Utilise N = 1/T.$$,
      'expected', $$N = 1/0,04 = 25 Hz.$$
    ),
    jsonb_build_object(
      'question', $$Sur un graphique où chaque carreau horizontal vaut 5 ms, la période occupe 4 carreaux. Calcule cette période, puis la fréquence correspondante.$$,
      'hint', $$Multiplie le nombre de carreaux par la valeur d'un carreau, puis utilise N = 1/T.$$,
      'expected', $$T = 5 ms × 4 = 20 ms = 0,02 s. N = 1/0,02 = 50 Hz.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont la valeur efficace et la fréquence usuelles de la tension du secteur en Côte d'Ivoire, et quelle est sa tension maximale approximative ?$$,
      'hint', $$Utilise la relation Umax = 1,41 × Ueff.$$,
      'expected', $$Ueff = 220 V, N = 50 Hz, et Umax = 220 × 1,41 ≈ 310 V.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-tension-alternative-sinusoidale';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une famille, on refuse de boire l'eau du robinet, jugée « pas potable », et l'on n'achète que de l'eau minérale en bouteille. Pourtant, une eau du robinet correctement traitée peut être tout aussi sûre qu'une eau minérale. Quels critères permettent réellement de juger la qualité d'une eau, et comment reconnaît-on une eau potable à partir de sa composition ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Paramètres organoleptiques et physico-chimiques$$,
        'body', $$La qualité d'une eau s'apprécie d'abord à travers des paramètres organoleptiques : sa couleur, sa transparence, sa saveur et son odeur. Ces critères, perceptibles directement par les sens, n'ont cependant pas de valeur sanitaire directe : une eau peut paraître légèrement trouble, colorée ou avoir un goût particulier tout en restant consommable. La qualité réelle d'une eau dépend surtout de ses paramètres physico-chimiques (son pH, son pouvoir de dilution, son taux d'oxygène dissous, sa dureté) et de l'absence de substances toxiques comme certains métaux lourds (plomb, chrome), de véritables poisons même à faible dose.$$,
        'highlights', array[$$paramètres organoleptiques$$, $$paramètres physico-chimiques$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les paramètres organoleptiques (couleur, transparence, saveur, odeur) n'ont pas de valeur sanitaire directe. La qualité réelle d'une eau dépend de ses paramètres physico-chimiques (pH, dureté, taux d'oxygène...) et de l'absence de substances toxiques comme les métaux lourds.$$),
        'example', jsonb_build_object('statement', $$Une eau de puits paraît légèrement trouble et a un goût inhabituel, mais aucune analyse n'a encore été faite. Peut-on en conclure qu'elle est dangereuse pour la santé ?$$, 'solution', $$Non : la couleur, la turbidité ou le goût sont des paramètres organoleptiques sans valeur sanitaire directe. Il faut analyser ses paramètres physico-chimiques et rechercher d'éventuelles substances toxiques avant de conclure.$$),
        'fixation', jsonb_build_object('question', $$Cite les quatre paramètres organoleptiques permettant de juger une eau par les sens.$$, 'solution', $$La couleur, la transparence, la saveur et l'odeur.$$)
      ),
      jsonb_build_object(
        'heading', $$L'eau potable et les normes de l'OMS$$,
        'body', $$Une eau est dite potable lorsqu'elle peut être bue sans danger pour la santé, ce qui suppose le respect de normes précises. L'Organisation Mondiale de la Santé (OMS) fixe ainsi des valeurs limites pour de nombreux paramètres : le pH doit rester compris entre 6,5 et 8,5, la conductivité ne doit pas dépasser 500 µS/cm, et les teneurs en fer, en chlorures, en sulfates ou en nitrates sont elles aussi plafonnées. Le respect de l'ensemble de ces normes garantit qu'une eau, qu'elle provienne du robinet ou d'une bouteille, est sans danger pour la consommation.$$,
        'highlights', array[$$eau potable$$, $$normes de l'OMS$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une eau potable respecte l'ensemble des normes fixées par l'OMS, notamment un pH compris entre 6,5 et 8,5 et une conductivité ne dépassant pas 500 µS/cm.$$),
        'example', jsonb_build_object('statement', $$Une eau présente un pH de 9,2. Respecte-t-elle la norme de l'OMS relative au pH de l'eau potable ?$$, 'solution', $$Non, car la norme impose un pH compris entre 6,5 et 8,5 ; un pH de 9,2 dépasse cette limite.$$),
        'fixation', jsonb_build_object('question', $$Que signifie le fait qu'une eau soit « potable » ?$$, 'solution', $$Qu'elle peut être bue sans danger pour la santé, car elle respecte les normes de qualité fixées, notamment celles de l'OMS.$$),
        'table', jsonb_build_object(
          'headers', array[$$Paramètre$$, $$Norme OMS$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$pH$$, $$Entre 6,5 et 8,5$$),
            jsonb_build_array($$Conductivité$$, $$500 µS/cm maximum$$),
            jsonb_build_array($$Fer (Fe2+)$$, $$0,3 mg/L maximum$$),
            jsonb_build_array($$Chlorures$$, $$200 mg/L maximum$$),
            jsonb_build_array($$Sulfates$$, $$500 mg/L maximum$$),
            jsonb_build_array($$Nitrates$$, $$50 mg/L maximum$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$La dureté de l'eau : eau douce et eau dure$$,
        'body', $$La dureté d'une eau traduit sa teneur en minéraux dissous, en particulier en ions calcium Ca2+. Plus cette teneur est élevée, plus l'eau est dite dure ; à l'inverse, une eau pauvre en ions calcium est dite douce. Le degré de dureté augmente ainsi progressivement avec la teneur en calcium, une eau pouvant être qualifiée de très douce, douce, plutôt dure ou très dure selon cette teneur.$$,
        'highlights', array[$$eau dure$$, $$eau douce$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dureté d'une eau dépend essentiellement de sa teneur en ions calcium Ca2+ : plus cette teneur est élevée, plus l'eau est dure.$$),
        'example', jsonb_build_object('statement', $$Une eau contient 90 mg/L d'ions calcium. À quelle catégorie de dureté appartient-elle ?$$, 'solution', $$Avec une teneur comprise entre 60 et 120 mg/L, cette eau est classée « plutôt dure ».$$),
        'fixation', jsonb_build_object('question', $$Quel est le nom et la formule de l'ion principalement responsable de la dureté de l'eau ?$$, 'solution', $$L'ion calcium, de formule Ca2+.$$),
        'table', jsonb_build_object(
          'headers', array[$$Ions calcium (mg/L)$$, $$Degré de dureté$$, $$Type d'eau$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$0 à 28$$, $$0 à 7$$, $$Très douce$$),
            jsonb_build_array($$28 à 60$$, $$7 à 15$$, $$Douce$$),
            jsonb_build_array($$60 à 120$$, $$15 à 30$$, $$Plutôt dure$$),
            jsonb_build_array($$Plus de 160$$, $$Plus de 40$$, $$Très dure$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Identifier les ions dissous et leur rôle dans l'alimentation$$,
        'body', $$Certains ions dissous dans l'eau peuvent être identifiés par des tests chimiques simples, fondés sur la formation d'un précipité caractéristique. Ces ions ne sont pas de simples curiosités chimiques : ils jouent un rôle essentiel dans l'organisme. Les ions calcium et magnésium participent à la solidification des os, les ions potassium et sodium interviennent dans la transmission des messages nerveux, les ions sodium et chlorure dans la contraction musculaire et la rétention d'eau, et l'ion fer II dans le transport du dioxygène par l'hémoglobine — sa carence provoquant l'anémie.$$,
        'highlights', array[$$identification des ions$$, $$rôle des ions$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Chaque ion dissous peut être identifié par un test spécifique donnant un précipité caractéristique ; ces mêmes ions (calcium, magnésium, potassium, sodium, fer...) jouent des rôles précis et essentiels dans l'organisme.$$),
        'example', jsonb_build_object('statement', $$On verse du nitrate d'argent dans un tube contenant une eau minérale : un précipité blanc apparaît puis noircit à la lumière. Quel ion cette observation met-elle en évidence ?$$, 'solution', $$L'ion chlorure Cl-, car le nitrate d'argent est son réactif caractéristique, donnant un précipité blanc qui noircit à la lumière.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi l'ion fer II (Fe2+) est-il indispensable dans l'alimentation ?$$, 'solution', $$Parce qu'il entre dans la constitution de l'hémoglobine du sang, qui assure le transport du dioxygène ; sa carence provoque l'anémie.$$),
        'table', jsonb_build_object(
          'headers', array[$$Ion testé$$, $$Réactif utilisé$$, $$Observation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ion calcium (Ca2+)$$, $$Oxalate d'ammonium$$, $$Précipité blanc$$),
            jsonb_build_array($$Ion sulfate (SO42-)$$, $$Chlorure de baryum$$, $$Précipité blanc$$),
            jsonb_build_array($$Ion chlorure (Cl-)$$, $$Nitrate d'argent$$, $$Précipité blanc qui noircit à la lumière$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un médecin conseille à une élève de 4ème ayant des problèmes osseux de boire une eau minérale riche en calcium et en magnésium. Au supermarché, elle hésite entre deux bouteilles : la première indique 68 mg/L de calcium, 11 mg/L de magnésium et 21 mg/L de sodium ; la seconde indique 9 mg/L de calcium, 5 mg/L de magnésium et 54 mg/L de sodium.$$,
      'questions', array[
        $$Parmi les substances citées sur les étiquettes, lesquelles sont des cations ? Lesquelles interviennent surtout dans la solidification des os ?$$,
        $$Quelle bouteille l'élève doit-elle choisir pour répondre au conseil du médecin ? Justifie ta réponse à l'aide des teneurs données.$$,
        $$Si l'on versait de l'oxalate d'ammonium dans un échantillon de la bouteille choisie, quelle observation confirmerait la présence d'ions calcium ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans quelle plage de valeurs le pH d'une eau potable doit-il se situer, selon les normes de l'OMS ?$$,
      'hint', $$Cherche la norme associée au paramètre pH.$$,
      'expected', $$Entre 6,5 et 8,5.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le nom et la formule de l'ion principalement responsable de la dureté d'une eau ?$$,
      'hint', $$C'est l'ion mis en évidence par le test à l'oxalate d'ammonium.$$,
      'expected', $$L'ion calcium, de formule Ca2+.$$
    ),
    jsonb_build_object(
      'question', $$Quel réactif permet de mettre en évidence l'ion chlorure, et quelle observation caractéristique obtient-on ?$$,
      'hint', $$Pense au précipité qui réagit à la lumière.$$,
      'expected', $$Le nitrate d'argent ; il forme avec l'ion chlorure un précipité blanc qui noircit à la lumière.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi les ions sodium (Na+) et chlorure (Cl-) sont-ils importants dans l'alimentation ?$$,
      'hint', $$Pense aux muscles et à l'eau contenue dans le corps.$$,
      'expected', $$Ils interviennent dans la contraction des muscles et dans la rétention d'eau dans l'organisme.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-qualite-eau';

