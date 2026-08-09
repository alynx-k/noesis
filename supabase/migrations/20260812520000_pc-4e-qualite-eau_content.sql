-- Physique-Chimie 4ème — Qualité de l'eau.
-- REAL CONTENT sourced from the official lesson PDF "PC 4ème_L13_Qualité
-- de l'Eau.pdf" (Côte d'Ivoire École Numérique / Collège Numérique,
-- coll.ecole-ci.org, course id 2006, resource id 16368, pluginfile id
-- 52620), downloaded 2026-08-08. Content below is an original paraphrase
-- of the lesson's organoleptic/physico-chemical parameters, OMS
-- potability norms, water-hardness scale, ion-identification tests and
-- their nutritional roles — no sentence copied verbatim from the source
-- PDF.
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
