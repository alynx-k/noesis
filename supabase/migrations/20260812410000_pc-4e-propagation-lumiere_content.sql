-- Physique-Chimie 4ème — Propagation de la lumière.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2017 "Lecon2_Propagation de la lumiere
-- blanche", resource id 16500 ("Je lis le résumé de la leçon"), PDF
-- "PC 4ème_L2_Propagation de la lumiere blanche.pdf" (9 pages, thème
-- Optique). Rewritten in original wording — paraphrased, not copied from
-- the source PDF — keeping the same technical content: transparent /
-- translucent / opaque / homogeneous media, rectilinear propagation, light
-- rays and beams, the pinhole camera (inverted image), the speed of light
-- (300 000 km/s) and the light-year.
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
