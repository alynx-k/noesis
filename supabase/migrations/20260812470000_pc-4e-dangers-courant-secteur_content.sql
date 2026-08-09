-- Physique-Chimie 4ème — Les dangers du courant du secteur.
-- FALLBACK content (see header of
-- 20260812400000_pc-4e-sources-recepteurs-lumiere_content.sql for the
-- sourcing attempts this pass). Written from solid general knowledge of
-- the standard 4ème electrical-safety competency (électrisation,
-- électrocution, contact direct/indirect, seuils de tension de sécurité,
-- rôle de la terre et du disjoncteur différentiel). Numeric safety
-- thresholds (25 V / 50 V) reflect the commonly taught conventional
-- limit values found in standard French/Ivorian collège textbooks;
-- kept qualitative where precision was uncertain. Original wording
-- throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un technicien intervient sur une installation électrique et prend soin de couper le disjoncteur avant de toucher le moindre fil, même isolé. Il rappelle aussi qu'il ne faut jamais manipuler un appareil électrique avec les mains mouillées. Pourquoi la tension du secteur, si utile au quotidien, représente-t-elle un danger réel pour le corps humain ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le corps humain, un conducteur électrique$$,
        'body', $$Le corps humain, en particulier lorsqu'il est humide (peau mouillée, transpiration), conduit le courant électrique. Si une personne touche un élément sous tension tout en étant en contact avec la terre (le sol, un objet relié au sol), un courant électrique peut la traverser.$$,
        'highlights', array[$$corps humain$$, $$conducteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le corps humain conduit le courant électrique, d'autant mieux qu'il est humide. Le passage d'un courant à travers le corps est appelé électrisation ; lorsqu'il est suffisamment intense pour être mortel, on parle d'électrocution.$$),
        'example', jsonb_build_object('statement', $$Pourquoi est-il particulièrement dangereux de toucher un appareil électrique avec les mains mouillées ?$$, 'solution', $$L'eau rend la peau bien plus conductrice, ce qui facilite le passage d'un courant électrique à travers le corps en cas de contact avec un élément sous tension.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on le passage d'un courant électrique à travers le corps humain ?$$, 'solution', $$L'électrisation (électrocution si elle est mortelle).$$)
      ),
      jsonb_build_object(
        'heading', $$Contact direct et contact indirect$$,
        'body', $$On distingue deux types de contacts dangereux avec l'électricité. Le contact direct se produit lorsqu'une personne touche directement un conducteur normalement sous tension (un fil dénudé, une borne). Le contact indirect se produit lorsqu'une personne touche la carcasse métallique d'un appareil devenue accidentellement sous tension à la suite d'un défaut d'isolation.$$,
        'highlights', array[$$contact direct$$, $$contact indirect$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Contact direct : contact avec un conducteur normalement sous tension. Contact indirect : contact avec une masse métallique accidentellement mise sous tension par un défaut d'isolation.$$),
        'example', jsonb_build_object('statement', $$Une personne touche la carcasse métallique d'un lave-linge défectueux, dont l'isolation interne est endommagée, et ressent une décharge. De quel type de contact s'agit-il ?$$, 'solution', $$C'est un contact indirect : la carcasse, normalement non alimentée, est devenue accidentellement sous tension à cause d'un défaut d'isolation.$$),
        'fixation', jsonb_build_object('question', $$Un enfant touche un fil électrique dénudé, normalement sous tension. De quel type de contact s'agit-il ?$$, 'solution', $$D'un contact direct.$$),
        'table', jsonb_build_object(
          'headers', array[$$Type de contact$$, $$Élément touché$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Contact direct$$, $$Conducteur normalement sous tension (fil dénudé, borne)$$),
            jsonb_build_array($$Contact indirect$$, $$Masse métallique accidentellement sous tension (défaut d'isolation)$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Seuil de tension dangereuse$$,
        'body', $$Une tension n'est pas dangereuse en elle-même à toute valeur : le risque dépend de la tension appliquée au corps et de l'état de la peau (sèche ou humide). Les tensions usuellement enseignées comme limites de sécurité sont plus basses en milieu humide qu'en milieu sec, car l'humidité diminue fortement la résistance du corps.$$,
        'highlights', array[$$tension de sécurité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$On considère généralement qu'une tension est sans danger si elle reste inférieure à environ 25 V en milieu humide et à environ 50 V en milieu sec ; la tension du secteur, 220 V, dépasse largement ces deux seuils et présente donc un danger réel.$$),
        'example', jsonb_build_object('statement', $$Pourquoi une salle de bains est-elle un lieu où les installations électriques doivent respecter des règles de sécurité renforcées ?$$, 'solution', $$Parce que l'humidité y abaisse le seuil de tension dangereuse pour le corps humain, rendant même des tensions modérées potentiellement risquées.$$),
        'fixation', jsonb_build_object('question', $$La tension du secteur, 220 V, est-elle inférieure ou supérieure aux seuils de tension considérés comme sans danger ?$$, 'solution', $$Elle leur est largement supérieure : elle représente donc un danger réel pour le corps humain.$$)
      ),
      jsonb_build_object(
        'heading', $$Dispositifs de protection : la terre et le disjoncteur différentiel$$,
        'body', $$Pour limiter les risques de contact indirect, les carcasses métalliques des appareils sont reliées à la terre par le fil de terre des prises. En cas de défaut d'isolation, le courant de fuite s'écoule alors préférentiellement vers la terre plutôt qu'à travers une personne qui toucherait l'appareil. Un disjoncteur différentiel surveille en permanence l'égalité des courants entrant et sortant d'une installation ; dès qu'il détecte une fuite de courant vers la terre, il coupe automatiquement l'alimentation.$$,
        'highlights', array[$$fil de terre$$, $$disjoncteur différentiel$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le fil de terre évacue vers le sol un courant de fuite en cas de défaut d'isolation. Le disjoncteur différentiel détecte ce déséquilibre de courant et coupe automatiquement l'alimentation électrique, protégeant les personnes contre les contacts indirects.$$),
        'example', jsonb_build_object('statement', $$Un appareil défectueux, dont la carcasse est reliée à la terre, laisse fuir un courant vers le sol. Quel dispositif va couper automatiquement l'alimentation pour protéger l'utilisateur ?$$, 'solution', $$Le disjoncteur différentiel, qui détecte la fuite de courant vers la terre et coupe l'alimentation.$$),
        'fixation', jsonb_build_object('question', $$Quel rôle joue le fil de terre d'une prise électrique en cas de défaut d'isolation d'un appareil ?$$, 'solution', $$Il évacue le courant de fuite vers le sol, limitant le risque qu'il traverse une personne touchant l'appareil.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans une maison, un fer à repasser présente un défaut d'isolation interne : sa carcasse métallique, normalement reliée à la terre, devient accidentellement sous tension. Le disjoncteur différentiel de l'installation se déclenche aussitôt et coupe l'alimentation.$$,
      'questions', array[
        $$Si une personne avait touché la carcasse du fer à repasser avant le déclenchement, de quel type de contact aurait-il été victime ?$$,
        $$Quel rôle a joué la liaison à la terre de la carcasse dans cet incident ?$$,
        $$Pourquoi le disjoncteur différentiel s'est-il déclenché automatiquement ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la différence entre un contact direct et un contact indirect avec l'électricité ?$$,
      'hint', $$Pense à l'élément touché : conducteur sous tension ou carcasse accidentellement sous tension.$$,
      'expected', $$Le contact direct est le contact avec un conducteur normalement sous tension ; le contact indirect est le contact avec une masse métallique accidentellement sous tension à la suite d'un défaut d'isolation.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le corps humain est-il plus dangereusement traversé par le courant lorsqu'il est humide ?$$,
      'hint', $$Pense à la conductivité de l'eau.$$,
      'expected', $$L'humidité augmente fortement la conductivité de la peau, ce qui facilite le passage du courant à travers le corps.$$
    ),
    jsonb_build_object(
      'question', $$Quel dispositif coupe automatiquement l'alimentation électrique en cas de fuite de courant vers la terre ?$$,
      'hint', $$C'est un appareil de sécurité installé dans le tableau électrique.$$,
      'expected', $$Le disjoncteur différentiel.$$
    ),
    jsonb_build_object(
      'question', $$La tension du secteur, 220 V, est-elle sans danger pour le corps humain ? Justifie.$$,
      'hint', $$Compare-la aux seuils de tension de sécurité.$$,
      'expected', $$Non, elle dépasse largement les seuils de tension considérés comme sans danger (environ 25 V en milieu humide, 50 V en milieu sec) : elle présente un danger réel.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-dangers-courant-secteur';
