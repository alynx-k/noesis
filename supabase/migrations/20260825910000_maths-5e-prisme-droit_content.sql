-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Géométrie de l'espace).
-- Cours : "Leçon 12 : Prismes droits". Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un professeur coupe un savon cubique le long de la diagonale d'une face, obtenant deux solides identiques. Il demande aux élèves de 5ème d'observer l'un de ces solides et de donner des informations justes à son sujet.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et éléments d'un prisme droit$$,
        'body', $$Un prisme droit est un solide dont deux faces (les bases) sont des polygones superposables, et dont toutes les autres faces (les faces latérales) sont des rectangles. Les arêtes latérales (celles qui relient les deux bases) ont toutes la même longueur : c'est la hauteur du prisme. Le nombre de faces latérales est égal au nombre de côtés d'une base.$$,
        'highlights', array[$$prisme droit : 2 bases (polygones superposables) + faces latérales rectangulaires$$, $$arêtes latérales = même longueur = hauteur du prisme$$, $$nb de faces latérales = nb de côtés d'une base$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans un prisme droit ABCDEF à base triangulaire ABC/DEF, quelles sont les arêtes latérales ?$$, 'solution', $$[AD], [BE] et [CF] (celles qui relient les deux bases).$$)
      ),
      jsonb_build_object(
        'heading', $$Le patron d'un prisme droit$$,
        'body', $$Un patron est une figure plane qui, après découpage et pliage, permet de fabriquer le solide. Pour qu'une figure plane soit le patron d'un prisme droit, il faut : deux polygones superposables (les bases) ; un nombre de rectangles (faces latérales) égal au nombre de côtés d'une base ; des côtés en contact au pliage de même longueur.$$,
        'highlights', array[$$patron valide : 2 bases superposables + autant de rectangles que de côtés + côtés de contact égaux$$]::text[],
        'example', jsonb_build_object('statement', $$Un patron a deux triangles superposables et 3 rectangles. De quel type de prisme s'agit-il ?$$, 'solution', $$D'un prisme droit à base triangulaire (3 côtés → 3 faces latérales rectangulaires).$$),
        'fixation', jsonb_build_object('question', $$Un solide peut-il avoir plusieurs patrons différents ?$$, 'solution', $$Oui, un même prisme droit peut avoir plusieurs patrons possibles.$$)
      ),
      jsonb_build_object(
        'heading', $$Aire et volume d'un prisme droit$$,
        'body', $$L'aire latérale (aire des faces latérales) = périmètre de la base × hauteur : Alatérale = Pbase × h. L'aire totale = 2 × aire d'une base + aire latérale. Le volume = aire de la base × hauteur : V = Abase × h.$$,
        'highlights', array[$$Alatérale = Pbase × h$$, $$Atotale = 2×aire base + Alatérale$$, $$V = Abase × h$$]::text[],
        'example', jsonb_build_object('statement', $$Un prisme droit a une base carrée de côté 3cm et une hauteur de 9cm. Calcule son aire totale.$$, 'solution', $$Atotale = 2×3² + 4×3×9 = 18 + 108 = 126 cm².$$),
        'fixation', jsonb_build_object('question', $$Un prisme droit a pour base un triangle rectangle d'aire 6cm² et une hauteur de 5cm. Calcule son volume.$$, 'solution', $$V = 6×5 = 30 cm³.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une niche de chien a la forme d'un pavé droit (base 1m×1,7m, hauteur 0,9m) surmonté d'un prisme droit (toiture, faces de 0,6m/0,8m/1m de large, hauteur/longueur 1,7m). Le maître veut tapisser l'intérieur (sol, murs, toiture) de papier-peint à 1500 FCFA le m², avec un budget de 15 000 FCFA.$$,
      'questions', array[
        $$Calcule la surface totale de papier-peint nécessaire (aire latérale du pavé + aire latérale du prisme).$$,
        $$Calcule le montant total de la dépense.$$,
        $$Le budget de 15 000 FCFA suffira-t-il ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Les faces latérales d'un prisme droit sont-elles toujours des rectangles ?$$,
      'hint', $$C'est une condition de la définition.$$,
      'expected', $$Oui.$$
    ),
    jsonb_build_object(
      'question', $$Un prisme droit a une base parallélogramme de périmètre 16cm et une hauteur de 10cm. Calcule son aire latérale.$$,
      'hint', $$Aire latérale = périmètre de la base × hauteur.$$,
      'expected', $$16 × 10 = 160 cm².$$
    ),
    jsonb_build_object(
      'question', $$Un prisme droit a une base d'aire 20cm² et une hauteur de 7cm. Calcule son volume.$$,
      'hint', $$Volume = aire de la base × hauteur.$$,
      'expected', $$20 × 7 = 140 cm³.$$
    ),
    jsonb_build_object(
      'question', $$Le nombre de faces latérales d'un prisme droit dépend-il du nombre de côtés de sa base ?$$,
      'hint', $$Chaque côté de la base correspond à une face latérale.$$,
      'expected', $$Oui, il est égal au nombre de côtés d'une base.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-prisme-droit';
