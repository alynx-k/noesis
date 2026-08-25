-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 3 : Court-circuit et protection des installations
-- électriques" (id 2093). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tard dans la nuit dans un bidonville, un incendie s'est déclaré suite à un court-circuit, détruisant quelques habitations. Des élèves de 6ème du quartier, affectés par les dégâts, sollicitent leur professeur pour connaître le court-circuit, ses causes, ses dangers, et le fonctionnement des dispositifs de protection.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le court-circuit : définition, causes et dangers$$,
        'body', $$Il y a court-circuit lorsque les deux bornes d'un composant électrique sont reliées directement par un conducteur électrique. Dans une installation domestique, il peut être provoqué par un contact entre deux fils conducteurs dénudés, ou entre deux fils dont la gaine isolante est détériorée. Quand on court-circuite une pile, la lampe s'éteint, la pile chauffe, et un matériau conducteur proche (comme de la paille de fer) peut prendre feu. Le court-circuit peut donc provoquer un incendie (le courant très fort chauffe les conducteurs, fait fondre et brûler la gaine isolante) et détériorer le générateur.$$,
        'highlights', array[$$court-circuit = les 2 bornes d'un composant reliées directement par un conducteur$$, $$causes : fils dénudés en contact, gaine isolante détériorée$$, $$dangers : incendie (surchauffe des conducteurs) + générateur détérioré$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui définit un court-circuit ?$$, 'solution', $$Le fait de relier directement les deux bornes d'un composant électrique par un conducteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Les dispositifs de protection : disjoncteur et fusible$$,
        'body', $$Le disjoncteur, situé à l'entrée de l'installation électrique d'une maison, protège les personnes et le circuit : il coupe le courant manuellement pour travailler sur l'installation, et automatiquement quand le courant devient trop élevé. Le fusible contient un fil conducteur fin qui fond et ouvre le circuit (coupe-circuit) quand le courant devient trop élevé. Règle de sécurité essentielle : il ne faut jamais remplacer un fusible fondu par un fil électrique ordinaire, car celui-ci ne fondra pas en cas de nouveau court-circuit et n'assurera plus la protection.$$,
        'highlights', array[$$disjoncteur : coupe manuellement OU automatiquement si courant trop élevé$$, $$fusible : fil fin qui fond = coupe-circuit automatique$$, $$ne jamais remplacer un fusible fondu par un fil ordinaire$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi est-il dangereux de remplacer le fil fondu d'un fusible par un fil de cuivre quelconque ?$$, 'solution', $$Parce que ce fil ne pourra pas fondre automatiquement en cas de nouveau court-circuit, et ne protégera donc plus l'installation.$$),
        'fixation', jsonb_build_object('question', $$Où se trouve le disjoncteur d'une installation électrique domestique ?$$, 'solution', $$À l'entrée de l'installation électrique de la maison.$$)
      ),
      jsonb_build_object(
        'heading', $$Règles de sécurité et recherche de panne$$,
        'body', $$Règles de sécurité : ne jamais reprendre les expériences de classe sur une prise à la maison, ne jamais jouer avec une prise, ne jamais toucher un conducteur ou un appareil branché les mains mouillées ou les pieds dans l'eau, toujours couper le courant avant de remplacer une lampe ou d'ouvrir un appareil. Si un circuit fermé ne fait pas briller la lampe, il y a une panne. Pour la trouver, on utilise un testeur de continuité, ou un circuit témoin (composé d'éléments en bon état) : on remplace chaque élément suspect par son équivalent du circuit témoin pour identifier lequel est défectueux, puis on le remplace.$$,
        'highlights', array[$$sécurité : ne jamais toucher un appareil branché mains mouillées ; toujours couper avant d'intervenir$$, $$panne = circuit fermé mais lampe éteinte ; recherche via testeur de continuité ou circuit témoin$$]::text[],
        'example', jsonb_build_object('statement', $$Une lampe ne s'allume pas avec la pile A, mais s'allume avec une pile B. Quel est l'élément défectueux ?$$, 'solution', $$La pile A est défectueuse (la lampe fonctionne correctement avec une autre pile).$$),
        'fixation', jsonb_build_object('question', $$Que faut-il toujours faire avant de remplacer une lampe électrique ?$$, 'solution', $$Couper le courant électrique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une séance de travaux pratiques, un groupe réalise un circuit (pile, interrupteur, lampe, fils). Le circuit fermé, la lampe ne brille pas. Un élève relie directement la lampe aux bornes de la pile : elle ne s'allume toujours pas. Mais la même lampe branchée sur une autre pile s'allume.$$,
      'questions', array[
        $$Nomme la démarche entreprise par l'élève.$$,
        $$Identifie l'élément défectueux du circuit, en justifiant.$$,
        $$Propose une solution pour faire briller la lampe.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux causes d'un court-circuit dans une installation électrique domestique.$$,
      'hint', $$Pense aux fils conducteurs.$$,
      'expected', $$Le contact entre deux fils dénudés, ou le contact entre deux fils dont la gaine isolante est détériorée.$$
    ),
    jsonb_build_object(
      'question', $$Quel dispositif contient un fil fin qui fond en cas de surintensité ?$$,
      'hint', $$Ce n'est pas le disjoncteur.$$,
      'expected', $$Le fusible.$$
    ),
    jsonb_build_object(
      'question', $$Un court-circuit ne se produit-il que si l'on relie directement les bornes d'une pile ?$$,
      'hint', $$Il peut aussi se produire dans une installation domestique.$$,
      'expected', $$Non, il peut aussi survenir entre deux fils dénudés dans une installation électrique.$$
    ),
    jsonb_build_object(
      'question', $$Que doit-on faire avant toute intervention sur une installation électrique ?$$,
      'hint', $$Utilise le dispositif de coupure principal.$$,
      'expected', $$Couper le courant en actionnant le disjoncteur.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-court-circuit-protection';
