-- Physique-Chimie 4ème — Transformation d'un métal en ion et
-- inversement.
-- REAL CONTENT sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2008 "Lecon11_Transformation d'un métal en
-- ion et inversement", resource id 16392 ("Je lis le résumé de la leçon"),
-- PDF "PC 4ème_L11_Transformation du Métal cuivre.pdf" (6 pages, thème
-- "Les ions"). Rewritten in original wording — paraphrased, not copied
-- from the source PDF — keeping the same technical content: transformation
-- chimique du cuivre en ion cuivre II par l'acide nitrique (dégagement de
-- dioxyde d'azote NO2), transformation chimique de l'ion cuivre II en
-- cuivre métal au contact du fer (réaction simultanée Fe + Cu2+ -> Cu +
-- Fe2+), transformation électrochimique par électrolyse (anode/cathode),
-- et nature du courant électrique dans les métaux (électrons libres) et
-- les solutions aqueuses (double migration des ions).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'une séance de travaux pratiques de chimie, un élève de 4ème laisse tomber par mégarde un objet métallique dans un produit chimique. Le lendemain matin, il constate que l'objet a disparu dans le liquide. Intrigué, il en parle à ses camarades de classe : ensemble, avec leur professeur de Physique-Chimie, ils décident de comprendre comment un métal peut se transformer en ion, et réciproquement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Transformation chimique du cuivre en ion cuivre II$$,
        'body', $$Lorsqu'on verse de l'acide nitrique sur des copeaux de cuivre, on observe un dégagement de gaz roux (le dioxyde d'azote, NO2, un gaz très toxique), la disparition progressive des copeaux de cuivre, et l'apparition d'une solution bleue. En ajoutant de la soude à cette solution, on obtient un précipité bleu, caractéristique de l'ion cuivre II. Cette réaction chimique correspond donc à la transformation du métal cuivre en ion cuivre II, avec libération de deux électrons.$$,
        'highlights', array[$$acide nitrique$$, $$ion cuivre II$$, $$gaz roux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'action de l'acide nitrique sur le cuivre transforme le métal cuivre (Cu) en ion cuivre II (Cu2+), selon l'équation Cu → Cu2+ + 2e-.$$),
        'example', jsonb_build_object('statement', $$On verse de l'acide nitrique sur un copeau de cuivre. Après quelques instants, on ajoute de la soude à la solution obtenue et un précipité bleu apparaît. Quel ion cette observation met-elle en évidence ?$$, 'solution', $$L'ion cuivre II (Cu2+), dont l'hydroxyde forme un précipité bleu caractéristique avec la soude.$$),
        'fixation', jsonb_build_object('question', $$Quel gaz toxique se dégage lorsque l'acide nitrique réagit avec le cuivre métallique ?$$, 'solution', $$Le dioxyde d'azote (NO2), reconnaissable à sa couleur rousse.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation chimique de l'ion cuivre II en cuivre métal$$,
        'body', $$Lorsqu'on plonge un clou de fer dans une solution bleue de sulfate de cuivre (contenant des ions cuivre II), on observe un dépôt rouge de cuivre métallique sur le clou, tandis que la solution, initialement bleue, devient progressivement verte. En ajoutant de la soude à cette solution devenue verte, on obtient un précipité vert, caractéristique de l'ion fer II. Les ions cuivre II se transforment donc en cuivre métal en captant des électrons, tandis que le fer métallique se transforme simultanément en ions fer II en cédant ces mêmes électrons.$$,
        'highlights', array[$$sulfate de cuivre$$, $$dépôt de cuivre$$, $$ion fer II$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Cu2+ + 2e- → Cu (réduction de l'ion cuivre II) ; Fe → Fe2+ + 2e- (oxydation du fer). Ces deux transformations se produisent simultanément, ce qui se traduit par l'équation-bilan globale : Fe + Cu2+ → Cu + Fe2+.$$),
        'example', jsonb_build_object('statement', $$Après avoir plongé un clou de fer dans une solution de sulfate de cuivre, on observe un dépôt rouge sur le clou et la solution devient verte. Explique ces deux observations à l'aide de l'équation-bilan de la réaction.$$, 'solution', $$Le dépôt rouge est du cuivre métal, formé par la réduction des ions cuivre II (Cu2+ + 2e- → Cu) ; la couleur verte provient des ions fer II formés par l'oxydation du fer (Fe → Fe2+ + 2e-), conformément à l'équation globale Fe + Cu2+ → Cu + Fe2+.$$),
        'fixation', jsonb_build_object('question', $$Écris l'équation-bilan globale de la réaction entre le fer métallique et les ions cuivre II.$$, 'solution', $$Fe + Cu2+ → Cu + Fe2+.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation électrochimique par électrolyse$$,
        'body', $$Lorsqu'un courant électrique traverse une solution de sulfate de cuivre entre une anode de cuivre et une cathode de graphite, on observe un dépôt rouge de cuivre sur la cathode, une diminution de l'épaisseur de l'anode de cuivre, et une solution qui ne change pas de couleur. À l'anode, le métal cuivre se transforme en ions cuivre II ; à la cathode, les ions cuivre II se transforment en métal cuivre. Ces réactions, provoquées par le passage du courant électrique, sont appelées réactions électrochimiques.$$,
        'highlights', array[$$électrolyse$$, $$anode$$, $$cathode$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$À l'anode : Cu → Cu2+ + 2e- (le métal s'use). À la cathode : Cu2+ + 2e- → Cu (un dépôt métallique se forme). Ces transformations, dites électrochimiques, nécessitent le passage d'un courant électrique imposé par un générateur.$$),
        'example', jsonb_build_object('statement', $$Lors d'une électrolyse d'une solution de sulfate de cuivre avec une anode de cuivre et une cathode de graphite, pourquoi l'anode de cuivre s'amincit-elle progressivement ?$$, 'solution', $$Parce qu'à l'anode, les atomes de cuivre métallique se transforment en ions cuivre II qui passent en solution (Cu → Cu2+ + 2e-), ce qui réduit progressivement l'épaisseur de l'anode.$$),
        'fixation', jsonb_build_object('question', $$Qu'observe-t-on à la cathode de graphite lors de l'électrolyse d'une solution de sulfate de cuivre ?$$, 'solution', $$Un dépôt rouge de cuivre métallique, formé par la réduction des ions cuivre II présents en solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Nature du courant électrique$$,
        'body', $$Dans les métaux, le courant électrique correspond à la circulation d'électrons libres. Dans les solutions aqueuses en revanche, le courant est dû à une double migration des ions : les cations se déplacent dans un sens, les anions dans l'autre.$$,
        'highlights', array[$$électrons libres$$, $$migration des ions$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un métal, le courant électrique est assuré par la circulation d'électrons libres. Dans une solution aqueuse, il résulte de la double migration des ions (cations et anions se déplaçant en sens opposés).$$),
        'example', jsonb_build_object('statement', $$Quelle est la différence entre la nature du courant électrique dans un fil de cuivre et dans une solution de sulfate de cuivre ?$$, 'solution', $$Dans le fil de cuivre, le courant est dû à la circulation d'électrons libres ; dans la solution, il est dû à la double migration des ions cuivre et sulfate en sens opposés.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui assure le passage du courant électrique dans une solution aqueuse ionique ?$$, 'solution', $$La double migration des ions : les cations et les anions se déplacent chacun dans un sens.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur plonge une lame de zinc dans une solution bleue de sulfate de cuivre. Après quelques instants, un dépôt rougeâtre apparaît sur la lame, et la couleur bleue de la solution s'atténue.$$,
      'questions', array[
        $$Quel métal se dépose sur la lame de zinc ?$$,
        $$Écris l'équation-bilan de cette réaction, sachant que le zinc se transforme en ions zinc Zn2+ en cédant deux électrons.$$,
        $$Cette transformation est-elle une réaction chimique spontanée ou une réaction électrochimique nécessitant un générateur ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel gaz toxique se dégage lorsqu'on verse de l'acide nitrique sur des copeaux de cuivre ?$$,
      'hint', $$Il est reconnaissable à sa couleur rousse.$$,
      'expected', $$Le dioxyde d'azote (NO2).$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation-bilan de la réaction entre le métal fer et les ions cuivre II.$$,
      'hint', $$Le fer s'oxyde pendant que l'ion cuivre se réduit.$$,
      'expected', $$Fe + Cu2+ → Cu + Fe2+.$$
    ),
    jsonb_build_object(
      'question', $$Lors de l'électrolyse d'une solution de sulfate de cuivre, que se passe-t-il à l'anode de cuivre ?$$,
      'hint', $$Pense au sens de la transformation : métal vers ion.$$,
      'expected', $$Le cuivre métallique de l'anode se transforme en ions cuivre II qui passent en solution (Cu → Cu2+ + 2e-), ce qui amincit l'anode.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la nature du courant électrique dans une solution aqueuse ionique ?$$,
      'hint', $$Ce n'est pas une circulation d'électrons libres comme dans un métal.$$,
      'expected', $$Le courant résulte de la double migration des ions : les cations et les anions se déplacent en sens opposés.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-transformation-metal-ion';
