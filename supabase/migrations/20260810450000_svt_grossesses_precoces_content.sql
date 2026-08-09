-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (les grossesses précoces et les moyens de prévention). Sensitive topic:
-- kept clinical, factual and non-alarmist, no invented statistics, focused
-- on biology, consequences and prevention rather than moral judgment,
-- matching the catalog's neutral/educational framing. 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans certains villages, plusieurs adolescentes quittent l'école avant la fin du collège à cause d'une grossesse précoce. Les enseignants et l'infirmier scolaire cherchent à informer les élèves sur ce phénomène et sur les moyens de s'en prémunir.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une grossesse précoce$$,
        'body', $$Une grossesse précoce est une grossesse qui survient chez une adolescente, généralement avant 18 ans, à un âge où son corps, sa scolarité et sa situation sociale ne sont pas encore prêts à assumer une maternité dans de bonnes conditions. Dès le début de la puberté, les organes reproducteurs deviennent fonctionnels et une grossesse devient biologiquement possible.$$,
        'highlights', array[$$grossesse précoce$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une grossesse précoce est une grossesse survenant chez une adolescente, à un âge où son corps, sa scolarité et sa situation sociale ne sont pas encore prêts à assumer une maternité dans de bonnes conditions.$$),
        'example', jsonb_build_object('statement', $$Pourquoi une grossesse peut-elle survenir dès le début de la puberté, même si l'adolescente n'est pas prête sur le plan social ?$$, 'solution', $$Parce que la puberté déclenche le fonctionnement des organes reproducteurs, notamment l'ovulation, ce qui rend une grossesse biologiquement possible, indépendamment de la maturité sociale de l'adolescente.$$),
        'fixation', jsonb_build_object('question', $$Cite un facteur social qui peut favoriser une grossesse précoce.$$, 'solution', $$Par exemple le manque d'information sur la sexualité et la reproduction, ou des pressions sociales telles que le mariage précoce.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences des grossesses précoces$$,
        'body', $$Une grossesse précoce comporte des risques accrus pour la santé de la mère et de l'enfant, car le corps de l'adolescente, notamment son bassin, n'est pas toujours complètement développé. Elle entraîne souvent l'interruption de la scolarité et peut fragiliser la situation sociale et économique de la jeune fille.$$,
        'highlights', array[$$conséquences$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une grossesse précoce comporte des risques accrus pour la santé de la mère et de l'enfant, entraîne souvent l'arrêt de la scolarité, et peut fragiliser la situation sociale de la jeune fille.$$),
        'example', jsonb_build_object('statement', $$Pourquoi une grossesse précoce présente-t-elle plus de risques pour la santé qu'une grossesse chez une femme adulte ?$$, 'solution', $$Parce que le corps de l'adolescente, notamment son bassin, n'est pas toujours complètement développé, ce qui augmente le risque de complications pendant la grossesse et l'accouchement.$$),
        'fixation', jsonb_build_object('question', $$Quelle conséquence une grossesse précoce a-t-elle souvent sur le parcours scolaire d'une adolescente ?$$, 'solution', $$Elle entraîne souvent l'interruption, temporaire ou définitive, de la scolarité.$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens de prévention$$,
        'body', $$La prévention des grossesses précoces repose sur l'éducation à la sexualité, le dialogue avec des adultes de confiance, et, pour les adolescents sexuellement actifs, l'usage correct de méthodes contraceptives disponibles dans les centres de santé.$$,
        'highlights', array[$$prévention$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La prévention des grossesses précoces repose sur l'éducation à la sexualité, le dialogue avec des adultes de confiance, et l'usage correct des méthodes contraceptives disponibles dans les centres de santé.$$),
        'example', jsonb_build_object('statement', $$Cite un moyen sûr d'éviter une grossesse précoce pour un adolescent qui n'a pas encore de rapports sexuels.$$, 'solution', $$L'abstinence, c'est-à-dire l'absence de rapports sexuels, est le moyen le plus sûr d'éviter une grossesse à cet âge.$$),
        'fixation', jsonb_build_object('question', $$Vers qui un adolescent peut-il se tourner pour obtenir des informations fiables sur la prévention des grossesses ?$$, 'solution', $$Un adulte de confiance, comme un parent ou un enseignant, un infirmier scolaire, ou un centre de santé.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le centre de santé scolaire organise une séance d'information à destination des élèves de 3ème sur les grossesses précoces.$$,
      'questions', array[
        $$Explique ce qu'est une grossesse précoce et pourquoi elle peut survenir dès la puberté.$$,
        $$Cite deux conséquences possibles d'une grossesse précoce, une sur la santé et une sur la scolarité.$$,
        $$Cite deux moyens de prévention des grossesses précoces.$$,
        $$Pourquoi est-il important de pouvoir en parler à un adulte de confiance ou à un professionnel de santé ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une grossesse précoce ?$$,
      'hint', $$Pense à l'âge et à la maturité de l'adolescente.$$,
      'expected', $$C'est une grossesse survenant chez une adolescente, en général avant 18 ans, à un âge où son corps et sa situation sociale ne sont pas encore prêts pour une maternité.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la puberté rend-elle une grossesse biologiquement possible ?$$,
      'hint', $$Pense au fonctionnement des ovaires.$$,
      'expected', $$Parce que la puberté déclenche le fonctionnement des organes reproducteurs, notamment l'ovulation chez la fille, ce qui rend une fécondation et donc une grossesse possibles.$$
    ),
    jsonb_build_object(
      'question', $$Cite une conséquence sanitaire et une conséquence scolaire d'une grossesse précoce.$$,
      'hint', $$Pense au corps de l'adolescente et à sa scolarité.$$,
      'expected', $$Sur le plan sanitaire, un risque accru de complications à l'accouchement ; sur le plan scolaire, un risque d'interruption de la scolarité.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le moyen de prévention le plus sûr pour un adolescent qui n'a pas de rapports sexuels ?$$,
      'hint', $$Pense à l'absence de rapport sexuel.$$,
      'expected', $$L'abstinence sexuelle.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-grossesses-precoces';
