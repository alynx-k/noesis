-- Physique-Chimie 4ème — Les dangers du courant du secteur.
-- REAL CONTENT sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2011 "Lecon8_Dangers du Courant du secteur",
-- resource id 16428 ("Je lis le résumé de la leçon"), PDF "PC 4ème_L8_Dangers
-- du Courant du secteur ASSEU.pdf" (6 pages, thème "Courants et tensions
-- alternatifs"). Rewritten in original wording — paraphrased, not copied
-- from the source PDF — keeping the same technical content: caractéristiques
-- du courant du secteur (Ueff=220V, Um=1,41xUeff=310V, T=20ms, N=50Hz), les
-- trois bornes P/N/T d'une prise identifiées au tournevis testeur,
-- électrisation/électrocution/court-circuit, seuil de danger 25V,
-- dispositifs de protection (fusible, disjoncteur général, stabilisateur,
-- onduleur, prise de terre, disjoncteur différentiel à 30mA) et règles de
-- sécurité.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un grave incendie survenu une nuit dans un quartier d'Abidjan a détruit une partie d'une maison. Les voisins pensaient d'abord à un acte criminel, avant d'apprendre que l'incendie était dû à un court-circuit électrique. Un élève de 4ème, habitant du quartier, prend alors conscience du danger que représente le courant du secteur et décide, avec ses camarades, de comprendre ce danger et les moyens de s'en protéger.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractéristiques du courant du secteur$$,
        'body', $$Le courant du secteur est le courant fourni par le réseau de distribution d'électricité ; en Côte d'Ivoire, cette distribution est assurée par la CIE. La tension efficace qu'il délivre vaut 220 V. Étant une tension alternative sinusoïdale, sa valeur instantanée atteint en réalité une tension maximale Um, liée à la tension efficace Ueff par la relation Um = 1,41 × Ueff, soit environ 310 V pour le secteur ivoirien. Sa période T, durée d'un motif complet visible à l'oscilloscope, vaut 20 ms (0,02 s), ce qui correspond à une fréquence N = 1/T = 50 Hz.$$,
        'highlights', array[$$courant du secteur$$, $$tension efficace$$, $$tension maximale$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Um = 1,41 × Ueff. En Côte d'Ivoire : Ueff = 220 V, Um ≈ 310 V, T = 20 ms = 0,02 s, et la fréquence N = 1/T = 50 Hz.$$),
        'example', jsonb_build_object('statement', $$Une prise du secteur affiche une tension efficace de 225 V. Calcule la tension maximale correspondante.$$, 'solution', $$Um = 1,41 × 225 ≈ 317 V.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule relie la tension maximale et la tension efficace d'un courant alternatif sinusoïdal, et quelle est la fréquence du courant du secteur en Côte d'Ivoire ?$$, 'solution', $$Um = 1,41 × Ueff ; la fréquence du secteur ivoirien est N = 50 Hz.$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois bornes d'une prise du secteur$$,
        'body', $$Une prise de courant du secteur comporte trois bornes distinctes. En approchant un tournevis testeur (un petit tournevis muni d'une lampe témoin) de chacune des bornes, tout en le touchant du doigt, la lampe ne s'allume que pour une seule borne : c'est la phase, notée P. Pour les deux autres bornes, la lampe reste éteinte : ce sont le neutre, noté N, et la prise de terre, notée T.$$,
        'highlights', array[$$phase$$, $$neutre$$, $$terre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une prise du secteur possède trois bornes : la phase P (seule borne à allumer la lampe du tournevis testeur), le neutre N et la terre T (lampe éteinte pour ces deux bornes).$$),
        'example', jsonb_build_object('statement', $$Un électricien approche un tournevis testeur des trois bornes d'une prise. La lampe témoin ne s'allume que pour une seule borne. Quel est le nom de cette borne ?$$, 'solution', $$C'est la phase (P), seule borne capable d'allumer la lampe du tournevis testeur.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on la borne de phase d'une prise de courant ?$$, 'solution', $$C'est la seule borne pour laquelle un tournevis testeur allume sa lampe témoin.$$)
      ),
      jsonb_build_object(
        'heading', $$Électrisation, électrocution et court-circuit$$,
        'body', $$Le contact du corps humain avec le courant du secteur peut provoquer une électrisation : un choc physiologique violent (brûlure, tremblement, tétanisation, arrêt cardiaque ou asphyxie) causé par le passage du courant à travers l'organisme. Lorsque ce passage de courant entraîne la mort, on parle d'électrocution. On considère qu'à partir d'environ 25 V, le courant traversant le corps humain devient dangereux, en particulier lorsque celui-ci établit un contact entre la phase et le neutre, ou entre la phase et la terre. Un court-circuit est, quant à lui, la connexion directe des bornes d'un élément du circuit par un simple fil : il peut échauffer les fils, détruire les isolants et déclencher un incendie. La surcharge, qui consiste à brancher trop d'appareils sur une même prise, est une autre cause fréquente de danger pour les installations, en provoquant une surintensité pouvant elle aussi provoquer un incendie.$$,
        'highlights', array[$$électrisation$$, $$électrocution$$, $$court-circuit$$]::text[],
        'property', jsonb_build_object('label', $$Définitions$$, 'text', $$Électrisation : choc physiologique dû au passage du courant dans le corps, sans décès. Électrocution : électrisation mortelle. Court-circuit : connexion directe des bornes d'un élément du circuit par un fil. Seuil de danger pour le corps humain : environ 25 V.$$),
        'example', jsonb_build_object('statement', $$Une personne touche accidentellement à la fois le fil de phase et le fil de neutre d'une installation, et en meurt. Comment appelle-t-on cet accident ?$$, 'solution', $$C'est une électrocution : une électrisation qui a entraîné la mort de la personne.$$),
        'fixation', jsonb_build_object('question', $$Que se passe-t-il pour les fils et les isolants lorsqu'un court-circuit se produit entre la phase et le neutre ?$$, 'solution', $$Les fils s'échauffent, les isolants sont détruits, et un incendie peut se déclencher.$$),
        'table', jsonb_build_object(
          'headers', array[$$Terme$$, $$Définition$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Électrisation$$, $$Choc physiologique dû au passage du courant, sans décès$$),
            jsonb_build_array($$Électrocution$$, $$Électrisation mortelle$$),
            jsonb_build_array($$Court-circuit$$, $$Connexion directe des bornes d'un élément par un fil$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Dispositifs de protection et règles de sécurité$$,
        'body', $$Pour protéger les appareils, on utilise un fusible (un petit fil qui fond et ouvre le circuit dès que l'intensité devient trop élevée), un disjoncteur général (qui coupe l'électricité du bâtiment si l'intensité totale dépasse la valeur souscrite), un stabilisateur (qui délivre une tension stable malgré les variations du secteur) ou un onduleur (qui stabilise la tension tout en accumulant de l'énergie pour alimenter brièvement les appareils lors d'une coupure brutale, le temps de les éteindre correctement). Pour protéger les personnes, la prise de terre dévie le courant de fuite vers le sol plutôt qu'à travers le corps en cas de contact accidentel, et le disjoncteur différentiel coupe automatiquement le circuit dès que la différence entre les intensités des fils de phase et de neutre atteint 30 mA. Parmi les règles de sécurité à respecter : ne jamais toucher un fil dénudé, débrancher un appareil avant toute réparation, éviter de brancher trop d'appareils sur une même prise, ne jamais manipuler un appareil avec les mains ou les pieds humides, couper le courant avant toute intervention sur l'installation, et ne jamais introduire d'objets métalliques dans une prise.$$,
        'highlights', array[$$disjoncteur différentiel$$, $$prise de terre$$, $$règles de sécurité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le disjoncteur différentiel coupe le circuit dès que la différence entre les intensités de phase et de neutre atteint 30 mA, protégeant les personnes en s'appuyant sur la prise de terre qui dévie le courant de fuite vers le sol.$$),
        'example', jsonb_build_object('statement', $$Le disjoncteur différentiel d'une maison se déclenche brusquement alors qu'un appareil défectueux laisse fuir du courant vers sa carcasse, reliée à la terre. Pourquoi ce déclenchement protège-t-il les occupants ?$$, 'solution', $$Le disjoncteur différentiel détecte que les intensités de phase et de neutre ne sont plus égales à cause de la fuite vers la terre ; il coupe alors l'alimentation avant qu'une personne touchant l'appareil ne soit électrisée.$$),
        'fixation', jsonb_build_object('question', $$Cite deux règles de sécurité à respecter pour éviter les dangers du courant du secteur.$$, 'solution', $$Par exemple : ne jamais toucher un fil dénudé, et couper le courant avant toute intervention sur une installation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un atelier, un technicien remarque que le disjoncteur général se déclenche chaque fois que plusieurs machines fonctionnent en même temps sur la même ligne. Un autre jour, un fer à souder défectueux, dont la carcasse est reliée à la terre, déclenche cette fois le disjoncteur différentiel.$$,
      'questions', array[
        $$Pourquoi le disjoncteur général se déclenche-t-il lorsque trop de machines fonctionnent simultanément sur la même ligne ?$$,
        $$Quel phénomène a permis au disjoncteur différentiel de détecter le défaut du fer à souder ?$$,
        $$Cite deux règles de sécurité que le technicien doit malgré tout respecter pour éviter tout risque d'électrisation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la tension efficace et la fréquence du courant du secteur en Côte d'Ivoire ?$$,
      'hint', $$Ce sont deux valeurs caractéristiques fournies par la CIE.$$,
      'expected', $$Ueff = 220 V et N = 50 Hz.$$
    ),
    jsonb_build_object(
      'question', $$Comment identifie-t-on la borne de phase d'une prise à l'aide d'un tournevis testeur ?$$,
      'hint', $$Pense à la lampe témoin du tournevis.$$,
      'expected', $$C'est la seule borne qui allume la lampe du tournevis testeur.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre électrisation et électrocution ?$$,
      'hint', $$L'une des deux est mortelle, l'autre non.$$,
      'expected', $$L'électrisation est un choc physiologique dû au courant, sans décès ; l'électrocution est une électrisation qui entraîne la mort.$$
    ),
    jsonb_build_object(
      'question', $$Quel dispositif protège une personne en coupant le circuit dès qu'une fuite de courant de 30 mA est détectée entre la phase et le neutre ?$$,
      'hint', $$Il est associé au fil de terre.$$,
      'expected', $$Le disjoncteur différentiel.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-dangers-courant-secteur';
