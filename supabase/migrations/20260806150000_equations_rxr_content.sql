-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 12: Equations et
-- inéquations dans ℝ×ℝ" programme document, but every sentence, example and
-- exercise is an original rewrite. No diagram: graphical resolution is
-- described in words rather than plotted, to keep scope tight.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un artisan fabrique deux types de paniers en osier : des petits qui utilisent 2 mètres de fil et des grands qui utilisent 5 mètres. Un jour il fabrique 12 paniers en tout en utilisant 42 mètres de fil. Il se demande combien il a fabriqué de paniers de chaque taille — pour répondre, il faut poser deux équations à la fois, avec deux inconnues.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équations à deux inconnues$$,
        'body', $$Une équation comme ax+by=c a une infinité de solutions, car pour chaque valeur choisie pour x, on peut calculer une valeur de y qui convient. Une solution est donc un couple de deux nombres, pas un seul nombre.$$,
        'highlights', array[$$couple$$, $$deux inconnues$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une équation ax+by=c (avec (a;b)≠(0;0)) est une équation du premier degré dans ℝ×ℝ. Le couple (x0;y0) est solution si a×x0+b×y0=c.$$),
        'example', jsonb_build_object('statement', $$Vérifie si (3;2) est solution de 2x+3y=12.$$, 'solution', $$2×3+3×2 = 6+6 = 12. Le couple (3;2) est bien solution.$$),
        'fixation', jsonb_build_object('question', $$Vérifie si (1;4) est solution de 5x−y=2.$$, 'solution', $$5×1−4 = 1, et 1≠2, donc (1;4) n'est pas solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Résoudre un système par substitution$$,
        'body', $$La substitution consiste à isoler une inconnue dans une équation, puis à la remplacer dans l'autre équation pour se retrouver avec une seule inconnue.$$,
        'highlights', array[$$substitution$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$On exprime une inconnue en fonction de l'autre dans une équation, on remplace dans la deuxième, on résout l'équation obtenue, puis on revient à la première expression pour trouver la deuxième inconnue.$$),
        'example', jsonb_build_object('statement', $$Résous par substitution {x+y=10 ; 2x−y=5}.$$, 'solution', $$De la première équation, x=10−y. En remplaçant : 2(10−y)−y=5, donc 20−3y=5, donc y=5. Alors x=10−5=5. Solution : (5;5).$$),
        'fixation', jsonb_build_object('question', $$Résous par substitution {x−y=2 ; 3x+y=18}.$$, 'solution', $$x=2+y. En remplaçant : 3(2+y)+y=18, donc 6+4y=18, donc y=3. Alors x=2+3=5. Solution : (5;3).$$)
      ),
      jsonb_build_object(
        'heading', $$Résoudre un système par combinaison$$,
        'body', $$La combinaison consiste à multiplier les équations par des nombres bien choisis pour qu'une inconnue disparaisse quand on les additionne.$$,
        'highlights', array[$$combinaison$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$On multiplie une ou les deux équations pour que les coefficients d'une inconnue deviennent opposés, on additionne membre à membre pour l'éliminer, on résout, puis on recommence pour l'autre inconnue.$$),
        'example', jsonb_build_object('statement', $$Résous par combinaison {x+2y=8 ; 3x−2y=0}.$$, 'solution', $$En additionnant les deux équations : 4x=8, donc x=2. En remplaçant dans la première : 2+2y=8, donc y=3. Solution : (2;3).$$),
        'fixation', jsonb_build_object('question', $$Résous par combinaison {2x+y=7 ; 2x−3y=−1}.$$, 'solution', $$En soustrayant : 4y=8, donc y=2. En remplaçant dans la première : 2x+2=7, donc x=2,5. Solution : (2,5;2).$$)
      ),
      jsonb_build_object(
        'heading', $$Résolution graphique d'un système$$,
        'body', $$Chaque équation ax+by=c est l'équation d'une droite. Résoudre un système graphiquement revient à tracer les deux droites et lire les coordonnées de leur point d'intersection.$$,
        'highlights', array[$$droite$$, $$intersection$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si les deux droites sont sécantes, le système a une seule solution (le point d'intersection). Si elles sont parallèles distinctes, il n'y a aucune solution. Si elles sont confondues, il y a une infinité de solutions.$$),
        'example', jsonb_build_object('statement', $$Les droites d'équations x+y=4 et x−y=2 se coupent en un seul point. Détermine ce point.$$, 'solution', $$En additionnant les deux équations : 2x=6, donc x=3. Alors y=4−3=1. Les droites se coupent en (3;1).$$),
        'fixation', jsonb_build_object('question', $$Que peut-on dire des solutions d'un système dont les deux droites sont parallèles et distinctes ?$$, 'solution', $$Le système n'a aucune solution, car les droites ne se croisent jamais.$$)
      ),
      jsonb_build_object(
        'heading', $$Inéquations à deux inconnues$$,
        'body', $$Une inéquation comme ax+by+c>0 partage le plan en deux zones (demi-plans) de part et d'autre de la droite ax+by+c=0 : une zone où l'inégalité est vraie, une autre où elle est fausse.$$,
        'highlights', array[$$demi-plans$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La droite d'équation ax+by+c=0 sépare le plan en deux demi-plans : l'un contient les couples qui vérifient ax+by+c>0, l'autre ceux qui vérifient ax+by+c<0.$$),
        'example', jsonb_build_object('statement', $$Vérifie si (0;0) est solution de x+y−5<0.$$, 'solution', $$0+0−5 = −5, et −5<0 est vrai, donc (0;0) est solution.$$),
        'fixation', jsonb_build_object('question', $$Vérifie si (4;3) est solution de 2x−y+1<0.$$, 'solution', $$2×4−3+1 = 6, et 6<0 est faux, donc (4;3) n'est pas solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes conduisant à un système$$,
        'body', $$Face à un problème avec deux inconnues, on les nomme, on traduit chaque information de l'énoncé en équation, puis on résout le système obtenu et on interprète le résultat.$$,
        'highlights', array[$$système$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Nommer les deux inconnues, traduire l'énoncé en un système d'équations, résoudre par substitution ou combinaison, vérifier, puis conclure dans le contexte du problème.$$),
        'example', jsonb_build_object('statement', $$Un vendeur écoule 205 tickets à 500 F ou 1000 F, pour une recette de 120 000 F. Combien de tickets de chaque prix a-t-il vendus ?$$, 'solution', $$Notons x le nombre de tickets à 500 F et y ceux à 1000 F. On résout {x+y=205 ; 500x+1000y=120000}, ce qui donne y=35 et x=170. Il a vendu 170 tickets à 500 F et 35 à 1000 F.$$),
        'fixation', jsonb_build_object('question', $$Un artisan fabrique des petits paniers (2 m de fil) et des grands (5 m de fil). Il en fabrique 12 en tout avec 42 m de fil. Combien de paniers de chaque taille a-t-il fabriqués ?$$, 'solution', $$Notons x le nombre de petits paniers et y celui des grands. On résout {x+y=12 ; 2x+5y=42}. De la première, x=12−y. En remplaçant : 2(12−y)+5y=42, donc 24+3y=42, donc y=6. Alors x=6. Il a fabriqué 6 petits paniers et 6 grands.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une coopérative vend deux sortes de sacs de riz : des sacs de 25 kg à 9000 F et des sacs de 50 kg à 17000 F. Un client achète en tout 14 sacs pour une dépense totale de 158 000 F.$$,
      'questions', array[
        $$Note x le nombre de sacs de 25 kg et y le nombre de sacs de 50 kg, et traduis l'énoncé par un système de deux équations.$$,
        $$Résous ce système par la méthode de ton choix.$$,
        $$Déduis-en le nombre de sacs de chaque type achetés par le client.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Vérifie si le couple (2;5) est solution de l'équation 3x+y=11.$$,
      'hint', $$Relis la définition d'un couple solution : remplace x et y puis vérifie l'égalité.$$,
      'expected', $$3×2+5 = 11. Le couple (2;5) est bien solution.$$
    ),
    jsonb_build_object(
      'question', $$Résous par substitution le système {x+y=9 ; x−y=3}.$$,
      'hint', $$Relis la méthode de substitution : isole x dans une équation, remplace dans l'autre.$$,
      'expected', $$De la deuxième équation, x=3+y. En remplaçant dans la première : 3+y+y=9, donc 2y=6, donc y=3. Alors x=6. Solution : (6;3).$$
    ),
    jsonb_build_object(
      'question', $$Résous par combinaison le système {2x+3y=13 ; 2x−y=1}.$$,
      'hint', $$Relis la méthode de combinaison : soustrais les deux équations pour éliminer x.$$,
      'expected', $$En soustrayant : 4y=12, donc y=3. En remplaçant dans la deuxième : 2x−3=1, donc x=2. Solution : (2;3).$$
    ),
    jsonb_build_object(
      'question', $$Un groupe de 20 personnes se répartit en adultes et enfants pour une sortie. Chaque adulte paie 2000 F, chaque enfant 1000 F, pour une recette totale de 32000 F. Combien y a-t-il d'adultes et d'enfants ?$$,
      'hint', $$Relis la méthode pour un problème conduisant à un système : nomme les inconnues, traduis, résous.$$,
      'expected', $$Notons x le nombre d'adultes et y celui des enfants. On résout {x+y=20 ; 2000x+1000y=32000}, soit {x+y=20 ; 2x+y=32}. En soustrayant : x=12. Alors y=8. Il y a 12 adultes et 8 enfants.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-equations-rxr';
