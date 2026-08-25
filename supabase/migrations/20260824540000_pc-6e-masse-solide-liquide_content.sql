-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 13 : Masse d'un solide et d'un liquide" (id 2083).
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la fête du nouvel an, deux élèves de 6ème veulent préparer un gâteau selon une recette de leur tante : 200g de farine, 50g de beurre, 2g de levure, une boîte de lait. Pour réussir leur préparation, elles doivent déterminer les quantités exactes de chaque produit à l'aide d'instruments de mesure appropriés.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La masse d'un corps et la balance Roberval$$,
        'body', $$La masse d'un corps est la grandeur qui se mesure avec une balance (notée m ou M). Son unité légale est le kilogramme (kg), avec des multiples (t, q) et sous-multiples (hg, dag, g, dg, cg, mg). La balance Roberval (plateau, fléau, aiguille, socle) sert à mesurer la masse. Pour une simple pesée d'un solide : on repère l'équilibre à vide, on place l'objet sur un plateau, on ajoute des masses marquées sur l'autre plateau (de la plus grande à la plus petite) jusqu'à l'équilibre, puis on additionne les masses marquées.$$,
        'highlights', array[$$masse = grandeur mesurée avec une balance, unité légale : kg$$, $$simple pesée d'un solide : équilibrer avec des masses marquées, puis les additionner$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est l'unité légale de masse ?$$, 'solution', $$Le kilogramme (kg).$$)
      ),
      jsonb_build_object(
        'heading', $$Mesurer la masse d'un liquide par simple pesée$$,
        'body', $$Pour mesurer la masse d'un liquide par simple pesée : on pèse le récipient vide (masse m1), puis le récipient contenant le liquide (masse m2), et on calcule la masse du liquide par différence : m = m2 - m1. Exemple : récipient vide m1 = 60g, récipient avec liquide m2 = 222g, donc masse du liquide = 222 - 60 = 162g.$$,
        'highlights', array[$$masse d'un liquide = m2 (récipient + liquide) - m1 (récipient vide)$$]::text[],
        'example', jsonb_build_object('statement', $$Un gobelet vide pèse 150g ; avec du jus de citron, il pèse 710g. Quelle est la masse du jus ?$$, 'solution', $$m = 710 - 150 = 560g.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi pèse-t-on le récipient vide avant de peser le récipient plein ?$$, 'solution', $$Pour pouvoir soustraire la masse du récipient et obtenir uniquement la masse du liquide.$$)
      ),
      jsonb_build_object(
        'heading', $$La double pesée$$,
        'body', $$La double pesée permet une pesée exacte avec une balance non juste (non équilibrée à vide). On place l'objet sur un plateau, une tare (plus pesante que l'objet) sur l'autre, puis des masses marquées avec l'objet pour équilibrer (masse m1) ; on retire ensuite l'objet et on rétablit l'équilibre avec des masses marquées seules (masse m2) ; la masse de l'objet est m = m2 - m1.$$,
        'highlights', array[$$double pesée = utile avec une balance non juste (déséquilibrée à vide)$$, $$m = m2 (masses seules, sans objet) - m1 (masses avec objet)$$]::text[],
        'example', jsonb_build_object('statement', $$Avec l'objet : m1 = 50g + 5g = 55g. Sans l'objet (masses seules) : m2 = 200g + 50g + 20g = 270g. Quelle est la masse de l'objet ?$$, 'solution', $$m = 270 - 55 = 215g.$$),
        'fixation', jsonb_build_object('question', $$Dans quel cas utilise-t-on la double pesée plutôt que la simple pesée ?$$, 'solution', $$Quand la balance n'est pas juste (pas équilibrée à vide).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$De retour du marché, une discussion éclate entre Ella, élève de 6ème, et son grand frère au sujet de la masse de viande qu'elle vient d'acheter (annoncée à 875g). Ils vont chez un commerçant vérifier avec une balance et une boîte de masses marquées (1g, 2g, 2g, 5g, 10g, 10g, 20g, 50g, 100g, 100g, 200g, 500g).$$,
      'questions', array[
        $$Définis la masse d'un corps et nomme l'instrument de mesure utilisé.$$,
        $$Identifie les masses marquées à utiliser si la masse annoncée (875g) est exacte.$$,
        $$Explique la méthode de la simple pesée pour vérifier cette masse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel instrument permet de mesurer la masse d'un corps ?$$,
      'hint', $$C'est le même instrument qu'utilise un commerçant.$$,
      'expected', $$Une balance (par exemple, la balance Roberval).$$
    ),
    jsonb_build_object(
      'question', $$Un récipient vide pèse 100g. Rempli d'huile, il pèse 350g. Quelle est la masse de l'huile ?$$,
      'hint', $$Fais la différence.$$,
      'expected', $$350 - 100 = 250g.$$
    ),
    jsonb_build_object(
      'question', $$Pour peser un ananas, on équilibre avec 500g + 100g + 20g de masses marquées. Quelle est sa masse ?$$,
      'hint', $$Additionne les masses marquées.$$,
      'expected', $$500 + 100 + 20 = 620g.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux méthodes de pesée étudiées ?$$,
      'hint', $$L'une pour une balance juste, l'autre pour une balance non juste.$$,
      'expected', $$La simple pesée et la double pesée.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-masse-solide-liquide';
