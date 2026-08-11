-- Physique-Chimie 4ème — Atomes et ions.
-- REAL CONTENT sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2009 "Lecon10_Atomes et Ions", resource id
-- 16404 ("Je lis le résumé de la leçon"), PDF "PC 4ème_L10_Atomes et
-- Ions.pdf" (10 pages, thème "Les ions"). Rewritten in original wording —
-- paraphrased, not copied from the source PDF — keeping the same technical
-- content: constitution de l'atome (noyau/électrons, neutralité
-- électrique), définition de l'ion (cation/anion), tableau des cations et
-- anions courants, solution aqueuse (solvant/soluté), et identification des
-- ions métalliques par leur couleur en solution et par des tests
-- (précipités caractéristiques avec la soude, le nitrate d'argent, le
-- chlorure de baryum).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En lisant l'étiquette d'une bouteille d'eau minérale, une élève de 4ème remarque que celle-ci indique les formules de plusieurs espèces chimiques portant des charges positives ou négatives. Intriguée, elle en parle à ses camarades de classe : ensemble, avec leur professeur, ils décident de comprendre ce que sont ces espèces chimiques et comment on peut les identifier.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Constitution et neutralité électrique de l'atome$$,
        'body', $$L'atome est la plus petite particule indivisible de la matière. Il est constitué de deux parties : le noyau, situé au centre et porteur de charges électriques positives, et les électrons, qui gravitent autour du noyau et portent des charges électriques négatives. Dans un atome, il y a toujours autant de charges positives portées par le noyau que de charges négatives portées par les électrons : la charge globale de l'atome est donc nulle, et l'on dit qu'il est électriquement neutre.$$,
        'highlights', array[$$atome$$, $$noyau$$, $$électrons$$, $$neutralité électrique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un atome est constitué d'un noyau chargé positivement, autour duquel gravitent des électrons chargés négativement. Le nombre de charges positives du noyau est toujours égal au nombre d'électrons : l'atome est électriquement neutre.$$),
        'example', jsonb_build_object('statement', $$Un atome porte-t-il toujours une charge électrique positive, à cause de son noyau ?$$, 'solution', $$Non : même si le noyau est chargé positivement, les électrons qui l'entourent portent exactement autant de charges négatives, si bien que l'atome, dans son ensemble, est électriquement neutre.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux parties qui constituent un atome, et quel est le signe de la charge électrique de chacune ?$$, 'solution', $$Le noyau, chargé positivement, et les électrons, chargés négativement, qui gravitent autour de lui.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ion : cations et anions$$,
        'body', $$Un ion est un atome, ou un assemblage d'atomes, ayant gagné ou perdu un ou plusieurs électrons. Lorsqu'un atome (ou un assemblage d'atomes) gagne un ou plusieurs électrons, il devient chargé négativement : on l'appelle un anion. Lorsqu'il perd un ou plusieurs électrons, il devient chargé positivement : on l'appelle un cation.$$,
        'highlights', array[$$ion$$, $$cation$$, $$anion$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un cation se forme par perte d'électrons (charge positive) ; un anion se forme par gain d'électrons (charge négative).$$),
        'example', jsonb_build_object('statement', $$Un atome de cuivre perd deux électrons. Quel type d'ion obtient-on, et comment le note-t-on ?$$, 'solution', $$On obtient un cation, l'ion cuivre II, de formule Cu2+.$$),
        'fixation', jsonb_build_object('question', $$Un atome de chlore gagne un électron. L'ion obtenu est-il un cation ou un anion ?$$, 'solution', $$C'est un anion, chargé négativement, puisque l'atome a gagné un électron.$$),
        'table', jsonb_build_object(
          'headers', array[$$Cations$$, $$Formule$$, $$Anions$$, $$Formule$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ion cuivre II$$, $$Cu2+$$, $$Ion hydroxyde$$, $$OH-$$),
            jsonb_build_array($$Ion fer II$$, $$Fe2+$$, $$Ion carbonate$$, $$CO32-$$),
            jsonb_build_array($$Ion fer III$$, $$Fe3+$$, $$Ion sulfate$$, $$SO42-$$),
            jsonb_build_array($$Ion zinc$$, $$Zn2+$$, $$Ion nitrate$$, $$NO3-$$),
            jsonb_build_array($$Ion sodium$$, $$Na+$$, $$Ion chlorure$$, $$Cl-$$),
            jsonb_build_array($$Ion aluminium$$, $$Al3+$$, $$Ion permanganate$$, $$MnO4-$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$La solution aqueuse$$,
        'body', $$Une solution aqueuse est une solution obtenue en dissolvant un corps dans l'eau : l'eau joue le rôle de solvant, et le corps dissous celui de soluté. Une solution aqueuse ionique contient à la fois des cations et des anions, et elle reste globalement électriquement neutre, car les charges positives des cations compensent exactement les charges négatives des anions.$$,
        'highlights', array[$$solution aqueuse$$, $$solvant$$, $$soluté$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une solution aqueuse ionique contient des cations et des anions en quantités telles que leurs charges se compensent : la solution est électriquement neutre.$$),
        'example', jsonb_build_object('statement', $$Une solution de sulfate de cuivre contient des ions cuivre Cu2+ et des ions sulfate SO42-. Pourquoi cette solution est-elle globalement neutre ?$$, 'solution', $$Parce que les charges positives portées par les ions cuivre sont exactement compensées par les charges négatives portées par les ions sulfate.$$),
        'fixation', jsonb_build_object('question', $$Dans une solution aqueuse, quel corps joue le rôle de solvant ?$$, 'solution', $$L'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$Identification des ions métalliques en solution$$,
        'body', $$Certains ions métalliques présentent une couleur caractéristique en solution : l'ion cuivre II (Cu2+) donne une solution bleue, l'ion fer II (Fe2+) une solution vert pâle, l'ion fer III (Fe3+) une solution rouille orangée, tandis que les ions zinc, sodium et aluminium donnent des solutions incolores. On peut aussi identifier certains ions par un test faisant apparaître un précipité caractéristique : la soude forme un précipité bleu avec l'ion cuivre II, vert pâle avec l'ion fer II, rouille avec l'ion fer III et blanc avec l'ion zinc ; le nitrate d'argent forme avec l'ion chlorure un précipité blanc qui noircit à la lumière ; le chlorure de baryum forme avec l'ion sulfate un précipité blanc.$$,
        'highlights', array[$$test d'identification$$, $$précipité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Chaque ion métallique peut être identifié par sa couleur en solution ou par le précipité caractéristique qu'il forme avec un réactif adapté (soude, nitrate d'argent ou chlorure de baryum).$$),
        'example', jsonb_build_object('statement', $$On ajoute quelques gouttes de soude à une solution inconnue et l'on observe l'apparition d'un précipité rouille. Quel ion cette observation révèle-t-elle ?$$, 'solution', $$L'ion fer III (Fe3+), dont le précipité d'hydroxyde formé avec la soude a une couleur rouille caractéristique.$$),
        'fixation', jsonb_build_object('question', $$Quel réactif utilise-t-on pour identifier l'ion sulfate, et quelle observation obtient-on ?$$, 'solution', $$Le chlorure de baryum, qui forme avec l'ion sulfate un précipité blanc.$$),
        'table', jsonb_build_object(
          'headers', array[$$Ion à identifier$$, $$Réactif$$, $$Observation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ion cuivre II (Cu2+)$$, $$Soude$$, $$Précipité bleu$$),
            jsonb_build_array($$Ion fer II (Fe2+)$$, $$Soude$$, $$Précipité vert pâle$$),
            jsonb_build_array($$Ion fer III (Fe3+)$$, $$Soude$$, $$Précipité rouille$$),
            jsonb_build_array($$Ion chlorure (Cl-)$$, $$Nitrate d'argent$$, $$Précipité blanc noircissant à la lumière$$),
            jsonb_build_array($$Ion sulfate (SO42-)$$, $$Chlorure de baryum$$, $$Précipité blanc$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur l'étiquette de flacons du laboratoire de Physique-Chimie de son collège, une élève découvre les inscriptions suivantes : sulfate de fer, chlorure de fer. Elle sait que chacun de ces produits contient des ions, mais souhaite les identifier précisément.$$,
      'questions', array[
        $$Donne le nom et la formule des ions contenus dans le sulfate de fer, sachant qu'il contient de l'ion fer II.$$,
        $$Donne le nom et la formule des ions contenus dans le chlorure de fer, sachant qu'il contient de l'ion fer III.$$,
        $$Indique le réactif permettant d'identifier l'ion sulfate, ainsi que celui permettant d'identifier l'ion chlorure.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un atome neutre possède 12 protons dans son noyau. Combien possède-t-il d'électrons ?$$,
      'hint', $$Pense à la neutralité électrique de l'atome.$$,
      'expected', $$12 électrons, car un atome neutre a autant d'électrons que de protons.$$
    ),
    jsonb_build_object(
      'question', $$Un atome de zinc perd deux électrons. Quel ion obtient-on, et quelle est sa formule ?$$,
      'hint', $$Une perte d'électrons forme un cation.$$,
      'expected', $$On obtient l'ion zinc, cation de formule Zn2+.$$
    ),
    jsonb_build_object(
      'question', $$Quelle couleur observe-t-on lorsqu'une solution contient des ions cuivre II (Cu2+) ?$$,
      'hint', $$C'est la couleur bien connue du sulfate de cuivre.$$,
      'expected', $$La solution est bleue.$$
    ),
    jsonb_build_object(
      'question', $$Quel réactif permet d'identifier l'ion chlorure, et quelle observation caractéristique obtient-on ?$$,
      'hint', $$Le précipité obtenu réagit à la lumière.$$,
      'expected', $$Le nitrate d'argent, qui forme avec l'ion chlorure un précipité blanc noircissant à la lumière.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-atomes-ions';
