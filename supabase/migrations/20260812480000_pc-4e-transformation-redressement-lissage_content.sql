-- Physique-Chimie 4ème — Transformation, redressement et lissage d'une
-- tension alternative sinusoïdale.
-- FALLBACK content (see header of
-- 20260812400000_pc-4e-sources-recepteurs-lumiere_content.sql for the
-- sourcing attempts this pass). Written from solid general knowledge of
-- the standard 4ème electricity competency (transformateur U2/U1=N2/N1,
-- redressement par diode(s) — simple et double alternance —, lissage par
-- condensateur). Original wording throughout, not copied from any
-- source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le chargeur d'un téléphone portable, branché sur une prise du secteur délivrant 220 V alternatifs, fournit en sortie une tension continue de quelques volts seulement, indispensable au bon fonctionnement de la batterie. Comment un petit boîtier peut-il à la fois abaisser une tension alternative et la transformer en tension quasiment continue ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le transformateur$$,
        'body', $$Un transformateur est un dispositif constitué de deux bobines, appelées enroulement primaire et enroulement secondaire, enroulées autour d'un même noyau de fer. Il permet de modifier la valeur d'une tension alternative sinusoïdale, en l'abaissant ou en l'élevant, selon le nombre de spires de chaque enroulement.$$,
        'highlights', array[$$transformateur$$, $$primaire$$, $$secondaire$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$U2/U1 = N2/N1, où U1 et N1 sont la tension et le nombre de spires de l'enroulement primaire, U2 et N2 ceux de l'enroulement secondaire. Un transformateur ne fonctionne qu'en tension alternative.$$),
        'example', jsonb_build_object('statement', $$Un transformateur a un enroulement primaire de 1000 spires alimenté sous U1 = 220 V, et un enroulement secondaire de 50 spires. Calcule la tension U2 obtenue au secondaire.$$, 'solution', $$U2 = U1 × (N2/N1) = 220 × (50/1000) = 11 V.$$),
        'fixation', jsonb_build_object('question', $$Un transformateur abaisseur possède 800 spires au primaire pour 40 spires au secondaire, alimenté sous 220 V. Calcule la tension au secondaire.$$, 'solution', $$U2 = 220 × (40/800) = 11 V.$$)
      ),
      jsonb_build_object(
        'heading', $$Le redressement par diode$$,
        'body', $$Une diode est un composant qui ne laisse passer le courant que dans un seul sens. Placée dans un circuit alimenté par une tension alternative, elle ne laisse passer que les alternances (les portions de la courbe) correspondant au sens qu'elle autorise : c'est le redressement simple alternance. En utilisant un montage de quatre diodes (pont de diodes), on peut aussi récupérer les deux alternances, redressées dans le même sens : c'est le redressement double alternance.$$,
        'highlights', array[$$diode$$, $$redressement$$, $$pont de diodes$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une diode ne laisse passer le courant que dans un seul sens. Le redressement transforme une tension alternative, qui change de sens, en une tension qui garde toujours le même sens (unidirectionnelle), mais qui reste ondulée.$$),
        'example', jsonb_build_object('statement', $$Une tension alternative sinusoïdale traverse une seule diode placée dans le bon sens. Que devient la partie de la courbe correspondant au sens bloqué par la diode ?$$, 'solution', $$Cette partie de la courbe est supprimée : la tension obtenue en sortie est nulle pendant cette alternance, puis reprend la forme de la courbe initiale pendant l'alternance autorisée.$$),
        'fixation', jsonb_build_object('question', $$Combien de diodes utilise-t-on dans un pont de diodes pour réaliser un redressement double alternance ?$$, 'solution', $$Quatre diodes.$$)
      ),
      jsonb_build_object(
        'heading', $$Le lissage par condensateur$$,
        'body', $$La tension obtenue après redressement, bien qu'unidirectionnelle, reste ondulée : elle varie encore entre zéro et une valeur maximale. Pour la rapprocher d'une tension continue, on place un condensateur en parallèle à la sortie du montage redresseur. Le condensateur se charge lorsque la tension redressée augmente, puis se décharge lentement dans le reste du circuit lorsqu'elle diminue, ce qui réduit fortement l'ondulation : c'est le lissage.$$,
        'highlights', array[$$condensateur$$, $$lissage$$, $$ondulation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un condensateur placé en parallèle après un redressement lisse la tension : il atténue l'ondulation en se chargeant puis en se déchargeant progressivement, rapprochant la tension obtenue d'une tension continue.$$),
        'example', jsonb_build_object('statement', $$On ajoute un condensateur en parallèle à la sortie d'un pont de diodes. L'ondulation de la tension observée à l'oscilloscope diminue nettement. Quel rôle a joué le condensateur ?$$, 'solution', $$Il a lissé la tension redressée en se chargeant et en se déchargeant progressivement, réduisant l'écart entre les valeurs maximale et minimale de la tension.$$),
        'fixation', jsonb_build_object('question', $$Quel composant permet de lisser une tension redressée, c'est-à-dire de réduire son ondulation ?$$, 'solution', $$Le condensateur, placé en parallèle à la sortie du montage redresseur.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 100),
          'points', jsonb_build_array(
            jsonb_build_object('x', 10, 'y', 85),
            jsonb_build_object('x', 35, 'y', 15),
            jsonb_build_object('x', 60, 'y', 85),
            jsonb_build_object('x', 85, 'y', 15),
            jsonb_build_object('x', 110, 'y', 85),
            jsonb_build_object('x', 135, 'y', 15),
            jsonb_build_object('x', 160, 'y', 85),
            jsonb_build_object('x', 185, 'y', 15)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,3), jsonb_build_array(3,4), jsonb_build_array(4,5), jsonb_build_array(5,6), jsonb_build_array(6,7))
        )
      ),
      jsonb_build_object(
        'heading', $$Chaîne complète d'une alimentation : du secteur au continu$$,
        'body', $$Une alimentation, comme celle d'un chargeur de téléphone, enchaîne ces trois transformations : le transformateur abaisse d'abord la tension alternative du secteur (220 V) à une valeur plus faible ; un pont de diodes redresse ensuite cette tension abaissée ; enfin, un condensateur lisse la tension redressée pour obtenir une tension proche du continu, utilisable par l'appareil.$$,
        'highlights', array[$$alimentation$$, $$chaîne de transformation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'ordre des étapes est toujours : abaissement par transformateur, puis redressement par diode(s), puis lissage par condensateur, afin d'obtenir une tension quasi continue à partir du secteur alternatif.$$),
        'example', jsonb_build_object('statement', $$Dans un chargeur de téléphone, quelle est la fonction du premier élément traversé par la tension du secteur ?$$, 'solution', $$C'est le transformateur, qui abaisse la tension alternative de 220 V à une valeur plus faible, adaptée à la suite du montage.$$),
        'fixation', jsonb_build_object('question', $$Range dans l'ordre les trois étapes qui transforment la tension du secteur en une tension quasi continue.$$, 'solution', $$Abaissement par le transformateur, puis redressement par les diodes, puis lissage par le condensateur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un chargeur de téléphone contient un transformateur abaisseur (1100 spires au primaire pour 50 spires au secondaire, alimenté sous 220 V), suivi d'un pont de diodes, puis d'un condensateur de lissage.$$,
      'questions', array[
        $$Calcule la tension obtenue à la sortie du transformateur.$$,
        $$Quel est le rôle du pont de diodes placé après le transformateur ?$$,
        $$Pourquoi le condensateur est-il indispensable pour alimenter correctement la batterie du téléphone ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un transformateur a 600 spires au primaire et 30 spires au secondaire, alimenté sous U1 = 220 V. Calcule U2.$$,
      'hint', $$Utilise U2/U1 = N2/N1.$$,
      'expected', $$U2 = 220 × (30/600) = 11 V.$$
    ),
    jsonb_build_object(
      'question', $$Quel composant électronique ne laisse passer le courant que dans un seul sens, et sert donc au redressement ?$$,
      'hint', $$C'est un composant à deux bornes.$$,
      'expected', $$La diode.$$
    ),
    jsonb_build_object(
      'question', $$Quel composant permet de lisser une tension redressée en réduisant son ondulation ?$$,
      'hint', $$Pense au composant qui se charge et se décharge.$$,
      'expected', $$Le condensateur.$$
    ),
    jsonb_build_object(
      'question', $$Range dans le bon ordre les trois transformations subies par la tension du secteur dans un chargeur : lissage, abaissement, redressement.$$,
      'hint', $$Le transformateur agit toujours en premier sur la tension alternative.$$,
      'expected', $$Abaissement (transformateur), puis redressement (diodes), puis lissage (condensateur).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-transformation-redressement-lissage';
