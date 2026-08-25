-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 11 : Dangers des combustions" (id 2085). Contenu réécrit
-- à partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un court-circuit dans une maison a provoqué un incendie qui a brûlé plusieurs habitations alentour, avec une fumée noire suivie d'une explosion. Des élèves de 6ème, impressionnés par les dégâts, décident d'expliquer les dangers des combustions et d'apprendre des règles de sécurité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les quatre dangers de la combustion$$,
        'body', $$Un incendie est un feu qui se propage en causant souvent des dégâts importants. Une asphyxie est l'état d'un organisme qui manque de gaz oxygène, d'une personne qui ne peut plus respirer. Une explosion est une combustion très rapide et violente déclenchée par une flamme ou une étincelle. Une intoxication est l'ensemble des troubles dus à l'introduction d'une substance toxique dans l'organisme.$$,
        'highlights', array[$$incendie = feu qui se propage$$, $$asphyxie = manque d'oxygène ; explosion = combustion rapide/violente ; intoxication = troubles dus à un poison$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle différence fait-on entre un incendie et une explosion ?$$, 'solution', $$L'incendie est un feu qui se propage progressivement, l'explosion est une combustion très rapide et violente.$$)
      ),
      jsonb_build_object(
        'heading', $$Le triangle du feu$$,
        'body', $$Pour qu'une combustion se produise, il faut réunir trois éléments : un combustible, un comburant (l'air), et une source de chaleur. C'est le "triangle du feu" (combustible-comburant-chaleur). Une bougie recouverte d'un bocal s'éteint par manque de comburant (oxygène). Pour éteindre un feu, il suffit de supprimer l'un des trois éléments du triangle : couvrir le feu supprime le comburant, verser de l'eau refroidit (supprime la source de chaleur ou empêche le combustible de brûler).$$,
        'highlights', array[$$triangle du feu = combustible + comburant + source de chaleur$$, $$éteindre un feu = supprimer un des 3 éléments$$]::text[],
        'example', jsonb_build_object('statement', $$Deux élèves veulent éteindre un feu de charbon : l'un le couvre, l'autre verse de l'eau. Quel élément du triangle chacun supprime-t-il ?$$, 'solution', $$Couvrir le feu supprime le comburant (l'air) ; verser de l'eau supprime la source de chaleur (refroidissement).$$),
        'fixation', jsonb_build_object('question', $$Cite les trois éléments du triangle du feu.$$, 'solution', $$Le combustible, le comburant, et la source de chaleur.$$)
      ),
      jsonb_build_object(
        'heading', $$Lutte contre les incendies et pictogrammes$$,
        'body', $$Pour éviter les incendies : éloigner les substances inflammables des flammes, prévoir une aération et une évacuation des fumées, entretenir les conduits de gaz. En cas d'incendie : refroidir le combustible (eau), empêcher le contact avec l'air (sable, cendres, neige carbonique des extincteurs), et appeler les pompiers. Les pictogrammes de sécurité signalent les dangers : substance comburante (flamme sur cercle), substance inflammable (flamme), substance explosive (explosion étoilée) — chacun impose des précautions spécifiques de manipulation et de stockage.$$,
        'highlights', array[$$prévention : éloigner l'inflammable, aérer, entretenir les conduits de gaz$$, $$en cas d'incendie : refroidir, priver d'air, appeler les pompiers$$]::text[],
        'example', jsonb_build_object('statement', $$Que faut-il faire en entrant dans une cuisine où l'on sent une odeur de gaz ?$$, 'solution', $$Aérer le local — et surtout ne pas allumer de flamme ni actionner d'interrupteur électrique, qui pourrait produire une étincelle.$$),
        'fixation', jsonb_build_object('question', $$Que signifie un pictogramme "substance explosive" sur un produit ?$$, 'solution', $$Que le produit doit être manipulé avec précaution, en évitant chocs, frictions, flammes et étincelles, car il peut exploser de façon imprévisible.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux camarades allument un feu de bois pour se réchauffer avant les cours, puis s'enfuient sans l'éteindre à la vue du professeur. Plus tard, ils constatent que le feu s'est éteint alors qu'il reste encore du bois.$$,
      'questions', array[
        $$Cite les trois éléments du triangle du feu.$$,
        $$Identifie ce que représentent, pour cette combustion, le bois sec, le dioxygène de l'air, et la flamme initiale.$$,
        $$Précise quel élément a manqué, entraînant l'extinction du feu.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une personne qui ne peut plus respirer par manque d'oxygène subit quel danger ?$$,
      'hint', $$Ce n'est pas une intoxication.$$,
      'expected', $$Une asphyxie.$$
    ),
    jsonb_build_object(
      'question', $$Pour éteindre un feu en le couvrant, quel élément du triangle du feu supprime-t-on ?$$,
      'hint', $$On empêche l'air d'arriver.$$,
      'expected', $$Le comburant.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire des substances inflammables pour prévenir un incendie ?$$,
      'hint', $$Pense à leur emplacement.$$,
      'expected', $$Les éloigner des flammes et des sources de chaleur.$$
    ),
    jsonb_build_object(
      'question', $$Qui faut-il appeler en priorité en cas d'incendie important ?$$,
      'hint', $$Ce sont des professionnels formés pour ça.$$,
      'expected', $$Les pompiers.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-dangers-combustions';
