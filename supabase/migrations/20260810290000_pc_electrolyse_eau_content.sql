-- Physique-Chimie 3ème — Électrolyse et synthèse de l'eau.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème chemistry competency (voltamètre
-- de Hofmann, tests caractéristiques H2/O2, 2H2O→2H2+O2, synthèse
-- 2H2+O2→2H2O). Original wording throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un professeur remplit un voltamètre d'eau légèrement acidifiée et branche deux électrodes à un générateur. Après quelques minutes, des bulles de gaz s'accumulent dans deux tubes gradués, mais pas dans les mêmes quantités. Quels sont ces gaz, et comment l'eau a-t-elle pu se décomposer sous l'effet du courant électrique ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Dispositif d'électrolyse de l'eau$$,
        'body', $$L'eau pure conduit très mal le courant électrique. Pour réaliser son électrolyse, on utilise de l'eau légèrement acidifiée, dans laquelle on plonge deux électrodes reliées à un générateur de courant continu. Lorsque le courant passe, des bulles de gaz se forment aux deux électrodes et s'accumulent dans deux tubes gradués.$$,
        'highlights', array[$$électrolyse$$, $$eau acidifiée$$, $$électrodes$$]::text[],
        'property', jsonb_build_object('label', $$Observation$$, 'text', $$Lors de l'électrolyse de l'eau acidifiée, on observe un dégagement gazeux aux deux électrodes. Le volume de gaz recueilli à l'électrode reliée à la borne négative (cathode) est le double du volume recueilli à l'électrode reliée à la borne positive (anode).$$),
        'example', jsonb_build_object('statement', $$Après quelques minutes d'électrolyse, on recueille 12 mL de gaz à la cathode. Quel volume de gaz doit-on observer à l'anode ?$$, 'solution', $$Le rapport des volumes est de 2 pour 1 (cathode/anode), donc à l'anode : 12÷2=6 mL.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi utilise-t-on de l'eau acidifiée plutôt que de l'eau pure pour réaliser l'électrolyse de l'eau ?$$, 'solution', $$Parce que l'eau pure conduit très mal le courant électrique ; l'ajout d'acide la rend suffisamment conductrice pour que l'électrolyse soit possible.$$)
      ),
      jsonb_build_object(
        'heading', $$Identification des gaz obtenus$$,
        'body', $$Les deux gaz recueillis lors de l'électrolyse de l'eau sont identifiés par des tests caractéristiques. Le gaz obtenu en plus grand volume, à la cathode, est le dihydrogène : approché d'une flamme, il produit une détonation caractéristique. Le gaz obtenu en plus petit volume, à l'anode, est le dioxygène : il ravive la combustion d'une bûchette qui présente encore des braises incandescentes.$$,
        'highlights', array[$$dihydrogène$$, $$dioxygène$$, $$tests caractéristiques$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Test du dihydrogène : approché d'une flamme, il produit une détonation (petite explosion sonore). Test du dioxygène : il ravive une bûchette qui se consumait, présentant encore des braises incandescentes.$$),
        'example', jsonb_build_object('statement', $$On approche une flamme d'un tube contenant l'un des gaz recueillis : on entend une détonation. Quel gaz ce tube contenait-il ?$$, 'solution', $$La détonation au contact d'une flamme est le test caractéristique du dihydrogène.$$),
        'fixation', jsonb_build_object('question', $$On approche une bûchette aux braises incandescentes de l'autre tube : elle se rallume. Quel gaz ce tube contenait-il ?$$, 'solution', $$Une bûchette qui se rallume au contact du gaz est le test caractéristique du dioxygène.$$)
      ),
      jsonb_build_object(
        'heading', $$Équation de la réaction d'électrolyse$$,
        'body', $$L'électrolyse décompose la molécule d'eau en dihydrogène et dioxygène. Le nombre d'atomes d'hydrogène et d'oxygène doit être le même avant et après la réaction : l'équation doit donc être équilibrée.$$,
        'highlights', array[$$équation$$, $$décomposition$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'équation de l'électrolyse de l'eau s'écrit : 2 H2O → 2 H2 + O2. Elle traduit la décomposition de deux molécules d'eau en deux molécules de dihydrogène et une molécule de dioxygène, ce qui explique le rapport de volumes 2 pour 1.$$),
        'example', jsonb_build_object('statement', $$Vérifie que l'équation 2 H2O → 2 H2 + O2 est équilibrée en comptant les atomes d'hydrogène et d'oxygène de chaque côté.$$, 'solution', $$À gauche : 2 H2O contient 4 atomes H et 2 atomes O. À droite : 2 H2 contient 4 atomes H, et O2 contient 2 atomes O. Les deux côtés sont équilibrés.$$),
        'fixation', jsonb_build_object('question', $$D'après l'équation 2 H2O → 2 H2 + O2, si l'on décompose 4 molécules d'eau, combien de molécules de dihydrogène et de dioxygène obtient-on ?$$, 'solution', $$4 molécules d'eau correspondent à deux fois la quantité de l'équation, donc on obtient 4 molécules de dihydrogène et 2 molécules de dioxygène.$$)
      ),
      jsonb_build_object(
        'heading', $$Synthèse de l'eau$$,
        'body', $$La synthèse de l'eau est la réaction inverse de l'électrolyse : on fait réagir le dihydrogène et le dioxygène ensemble, généralement par combustion, pour reformer de l'eau. Cette réaction, très exothermique, peut être explosive si le mélange n'est pas contrôlé.$$,
        'highlights', array[$$synthèse de l'eau$$, $$combustion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'équation de la synthèse de l'eau s'écrit : 2 H2 + O2 → 2 H2O. L'eau ainsi formée peut être mise en évidence par le papier au sulfate de cuivre anhydre, blanc, qui devient bleu au contact de l'eau.$$),
        'example', jsonb_build_object('statement', $$On enflamme un mélange de dihydrogène et de dioxygène dans un tube ; des gouttelettes se déposent sur les parois froides du tube, et du papier au sulfate de cuivre anhydre placé à proximité devient bleu. Qu'est-ce que cela prouve ?$$, 'solution', $$Le sulfate de cuivre anhydre blanc devenant bleu prouve la présence d'eau : la combustion du dihydrogène dans le dioxygène a bien produit de l'eau.$$),
        'fixation', jsonb_build_object('question', $$Écris l'équation de la réaction de synthèse de l'eau à partir du dihydrogène et du dioxygène.$$, 'solution', $$2 H2 + O2 → 2 H2O.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur réalise l'électrolyse de l'eau acidifiée dans un voltamètre de Hofmann pendant 5 minutes, puis teste chacun des deux gaz recueillis avec une flamme et une bûchette incandescente.$$,
      'questions', array[
        $$Décris ce que le professeur doit observer pour identifier le dihydrogène.$$,
        $$Décris ce que le professeur doit observer pour identifier le dioxygène.$$,
        $$Le professeur recueille 30 mL de gaz à la cathode : quel volume doit-il recueillir à l'anode, d'après l'équation de la réaction ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Pourquoi l'eau utilisée pour l'électrolyse doit-elle être légèrement acidifiée ?$$,
      'hint', $$Pense à la conductivité électrique de l'eau pure.$$,
      'expected', $$Parce que l'eau pure conduit très mal le courant électrique ; l'acide la rend suffisamment conductrice pour permettre l'électrolyse.$$
    ),
    jsonb_build_object(
      'question', $$Écris et équilibre l'équation de l'électrolyse de l'eau.$$,
      'hint', $$Compte les atomes H et O de chaque côté de l'équation.$$,
      'expected', $$2 H2O → 2 H2 + O2.$$
    ),
    jsonb_build_object(
      'question', $$Lors d'une électrolyse, on recueille 40 mL de gaz à la cathode. Quel volume de gaz doit-on recueillir à l'anode ?$$,
      'hint', $$Le rapport des volumes cathode/anode est de 2 pour 1.$$,
      'expected', $$40÷2=20 mL.$$
    ),
    jsonb_build_object(
      'question', $$Quel test permet de reconnaître le dioxygène, et quel test permet de reconnaître le dihydrogène ?$$,
      'hint', $$Pense à la bûchette incandescente et à la flamme.$$,
      'expected', $$Le dioxygène ravive une bûchette aux braises incandescentes ; le dihydrogène produit une détonation au contact d'une flamme.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-electrolyse-eau';
