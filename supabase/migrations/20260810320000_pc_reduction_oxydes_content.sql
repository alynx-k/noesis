-- Physique-Chimie 3ème — Réduction des oxydes.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème chemistry competency (réduction
-- de CuO par le carbone et par le dihydrogène, application aux
-- hauts-fourneaux). Original wording throughout, not copied from any
-- source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un laboratoire scolaire, des élèves chauffent fortement un mélange de poudre d'oxyde de cuivre, noire, et de poudre de carbone. Peu à peu, le solide noir se transforme en un métal rose-rouge, tandis qu'un gaz s'échappe et trouble un tube d'eau de chaux relié au montage. Comment un oxyde métallique peut-il redevenir un métal ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Notion de réduction d'un oxyde$$,
        'body', $$La réduction d'un oxyde métallique est la réaction chimique au cours de laquelle cet oxyde perd son oxygène pour redonner le métal correspondant. Cette réaction nécessite un réducteur, une substance capable de capter cet oxygène en se combinant elle-même avec lui.$$,
        'highlights', array[$$réduction$$, $$réducteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Réduire un oxyde métallique, c'est lui retirer son oxygène pour obtenir le métal. Le réducteur (souvent le carbone ou le dihydrogène) se combine avec l'oxygène libéré, en formant lui-même un nouvel oxyde.$$),
        'example', jsonb_build_object('statement', $$On chauffe de l'oxyde de cuivre noir (CuO) en présence de carbone. On obtient du cuivre métallique rose et un gaz qui trouble l'eau de chaux. Quelle réaction s'est produite ?$$, 'solution', $$L'oxyde de cuivre a été réduit par le carbone : il a perdu son oxygène pour redonner du cuivre métallique, tandis que le carbone s'est oxydé en dioxyde de carbone.$$),
        'fixation', jsonb_build_object('question', $$Dans une réaction de réduction d'un oxyde métallique, que devient l'oxygène perdu par l'oxyde ?$$, 'solution', $$Il se combine avec le réducteur, qui s'oxyde à son tour en formant un nouvel oxyde (par exemple du dioxyde de carbone si le réducteur est le carbone).$$)
      ),
      jsonb_build_object(
        'heading', $$Réduction de l'oxyde de cuivre par le carbone$$,
        'body', $$Un mélange de poudre d'oxyde de cuivre noir (CuO) et de poudre de carbone, chauffé fortement, réagit : on observe la formation de cuivre métallique rose-rouge et un dégagement de gaz qui trouble l'eau de chaux.$$,
        'highlights', array[$$oxyde de cuivre$$, $$carbone réducteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$2 CuO + C → 2 Cu + CO2. L'oxyde de cuivre (noir) est réduit en cuivre métallique (rose-rouge) par le carbone, qui s'oxyde en dioxyde de carbone, mis en évidence par le trouble de l'eau de chaux.$$),
        'example', jsonb_build_object('statement', $$Vérifie que l'équation 2 CuO + C → 2 Cu + CO2 est équilibrée.$$, 'solution', $$À gauche : 2 CuO contient 2 Cu et 2 O, C contient 1 C, soit au total 2 Cu, 2 O, 1 C. À droite : 2 Cu contient 2 Cu, CO2 contient 1 C et 2 O, soit au total 2 Cu, 1 C, 2 O. Les deux côtés sont équilibrés.$$),
        'fixation', jsonb_build_object('question', $$Quelle observation permet d'affirmer que du dioxyde de carbone s'est formé lors de cette réaction ?$$, 'solution', $$Le gaz produit trouble l'eau de chaux, ce qui est le test caractéristique du dioxyde de carbone.$$)
      ),
      jsonb_build_object(
        'heading', $$Réduction d'un oxyde par le dihydrogène$$,
        'body', $$Le dihydrogène peut aussi jouer le rôle de réducteur pour certains oxydes métalliques. En réagissant avec l'oxygène de l'oxyde, il se transforme lui-même en eau.$$,
        'highlights', array[$$dihydrogène réducteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$CuO + H2 → Cu + H2O. L'oxyde de cuivre est réduit en cuivre métallique par le dihydrogène, qui s'oxyde en eau.$$),
        'example', jsonb_build_object('statement', $$Écris et équilibre l'équation de la réduction de l'oxyde de cuivre par le dihydrogène.$$, 'solution', $$CuO + H2 → Cu + H2O. Vérification : à gauche, 1 Cu, 1 O, 2 H ; à droite, 1 Cu dans Cu, et H2O contient 2 H et 1 O, soit au total 1 Cu, 2 H, 1 O. L'équation est équilibrée.$$),
        'fixation', jsonb_build_object('question', $$Dans la réaction CuO + H2 → Cu + H2O, quel est le réducteur, et en quoi se transforme-t-il ?$$, 'solution', $$Le réducteur est le dihydrogène (H2), qui se transforme en eau (H2O) en captant l'oxygène de l'oxyde de cuivre.$$)
      ),
      jsonb_build_object(
        'heading', $$Application industrielle : la production du fer$$,
        'body', $$Dans les hauts-fourneaux, le minerai de fer, riche en oxyde de fer, est réduit par le carbone (sous forme de coke) pour produire du fer métallique à grande échelle. Cette réaction industrielle repose sur le même principe que la réduction de l'oxyde de cuivre en laboratoire.$$,
        'highlights', array[$$hauts-fourneaux$$, $$minerai de fer$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un haut-fourneau, l'oxyde de fer du minerai est réduit par le carbone selon une réaction du type : 2 Fe2O3 + 3 C → 4 Fe + 3 CO2. Le fer métallique produit est ensuite utilisé pour fabriquer de l'acier.$$),
        'example', jsonb_build_object('statement', $$Pourquoi utilise-t-on du carbone (coke) dans les hauts-fourneaux pour produire du fer à partir de son minerai ?$$, 'solution', $$Parce que le carbone est un réducteur capable de retirer l'oxygène de l'oxyde de fer du minerai, libérant ainsi le fer métallique.$$),
        'fixation', jsonb_build_object('question', $$Quel gaz se dégage lors de la réduction de l'oxyde de fer par le carbone dans un haut-fourneau ?$$, 'solution', $$Du dioxyde de carbone (CO2).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un laboratoire scolaire, des élèves chauffent un mélange de poudre d'oxyde de cuivre noir et de poudre de carbone dans un tube à essai relié à un tube contenant de l'eau de chaux.$$,
      'questions', array[
        $$Décris ce que les élèves doivent observer sur la couleur du solide au fond du tube, avant et après le chauffage.$$,
        $$Décris ce que les élèves doivent observer dans le tube contenant l'eau de chaux, et ce que cela prouve.$$,
        $$Écris et équilibre l'équation de la réaction qui s'est produite.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris et équilibre l'équation de la réduction de l'oxyde de cuivre par le carbone.$$,
      'hint', $$Compte les atomes de cuivre, d'oxygène et de carbone de chaque côté.$$,
      'expected', $$2 CuO + C → 2 Cu + CO2.$$
    ),
    jsonb_build_object(
      'question', $$Écris et équilibre l'équation de la réduction de l'oxyde de cuivre par le dihydrogène.$$,
      'hint', $$Compte les atomes de cuivre, d'oxygène et d'hydrogène de chaque côté.$$,
      'expected', $$CuO + H2 → Cu + H2O.$$
    ),
    jsonb_build_object(
      'question', $$Dans la réaction 2 CuO + C → 2 Cu + CO2, quel est l'oxyde réduit, et quel est le réducteur ?$$,
      'hint', $$Identifie qui perd de l'oxygène et qui en gagne.$$,
      'expected', $$L'oxyde réduit est l'oxyde de cuivre (CuO), qui perd son oxygène ; le réducteur est le carbone (C), qui gagne cet oxygène en formant du CO2.$$
    ),
    jsonb_build_object(
      'question', $$Dans un haut-fourneau, quel réducteur est utilisé pour extraire le fer métallique de son minerai, et quel gaz se dégage lors de cette réaction ?$$,
      'hint', $$Pense à l'application industrielle vue dans le cours.$$,
      'expected', $$Le réducteur est le carbone (sous forme de coke) ; la réaction dégage du dioxyde de carbone (CO2).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-reduction-oxydes';
