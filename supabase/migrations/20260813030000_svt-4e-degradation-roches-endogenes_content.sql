-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 2 : la dégradation des roches
-- endogènes — désagrégation mécanique, altération chimique, action
-- biologique). 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur un affleurement de granite en pleine savane, les élèves observent une roche fissurée en écailles qui se détachent facilement, alors qu'un peu plus loin, un bloc de granite bien massif est presque intact. Le professeur explique que le climat, l'eau et les êtres vivants transforment peu à peu les roches endogènes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La dégradation mécanique (physique)$$,
        'body', $$Les fortes variations de température entre le jour et la nuit provoquent la dilatation puis la contraction répétée des minéraux d'une roche. À force de se répéter, ce phénomène, appelé thermoclastie, fissure la roche et finit par la fragmenter en blocs puis en petits débris, sans en changer la composition chimique.$$,
        'highlights', array[$$thermoclastie$$, $$fragmentation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dégradation mécanique fragmente la roche en blocs et débris sous l'effet des variations de température (thermoclastie), sans modifier sa composition chimique.$$),
        'example', jsonb_build_object('statement', $$Pourquoi les fortes variations de température entre le jour et la nuit fissurent-elles les roches ?$$, 'solution', $$Parce que les minéraux de la roche se dilatent sous l'effet de la chaleur du jour puis se contractent la nuit lorsque la température baisse ; ces mouvements répétés créent des fissures qui finissent par fragmenter la roche.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la fragmentation d'une roche due aux variations de température ?$$, 'solution', $$La thermoclastie.$$)
      ),
      jsonb_build_object(
        'heading', $$La dégradation chimique$$,
        'body', $$L'eau, notamment chargée en gaz dissous, réagit chimiquement avec certains minéraux de la roche, comme le feldspath du granite. Cette réaction, appelée hydrolyse, transforme progressivement les minéraux en argile et libère des ions dissous dans l'eau : c'est l'altération chimique de la roche.$$,
        'highlights', array[$$hydrolyse$$, $$altération chimique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dégradation chimique transforme les minéraux d'une roche (par hydrolyse, notamment) en argile et en ions dissous, sous l'action de l'eau.$$),
        'example', jsonb_build_object('statement', $$Que devient le feldspath du granite sous l'effet de l'hydrolyse ?$$, 'solution', $$Il se transforme progressivement en minéraux argileux, tandis que des ions se dissolvent dans l'eau qui a réagi avec lui.$$),
        'fixation', jsonb_build_object('question', $$Quel agent est indispensable à la dégradation chimique des roches ?$$, 'solution', $$L'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$La dégradation biologique$$,
        'body', $$Les êtres vivants participent aussi à la dégradation des roches endogènes : les racines des plantes s'insèrent dans les fissures et les élargissent en grossissant, tandis que les lichens et certaines bactéries fixés sur la roche produisent des substances acides qui attaquent chimiquement sa surface.$$,
        'highlights', array[$$dégradation biologique$$, $$lichens$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dégradation biologique résulte de l'action des racines, qui élargissent les fissures, et des lichens ou bactéries, qui attaquent chimiquement la surface de la roche.$$),
        'example', jsonb_build_object('statement', $$Comment une racine d'arbre peut-elle contribuer à fragmenter une roche ?$$, 'solution', $$En s'insérant dans une fissure existante, puis en grossissant avec la croissance de l'arbre, elle exerce une pression qui élargit progressivement la fissure jusqu'à fragmenter la roche.$$),
        'fixation', jsonb_build_object('question', $$Cite deux organismes vivants impliqués dans la dégradation biologique des roches.$$, 'solution', $$Les plantes (par leurs racines) et les lichens.$$)
      ),
      jsonb_build_object(
        'heading', $$Les produits de la dégradation$$,
        'body', $$L'action combinée de la dégradation mécanique, chimique et biologique transforme peu à peu la roche massive en un ensemble de débris et de minéraux altérés, appelé arène. Cette roche mère altérée, meuble et poreuse, constitue le matériau de départ à partir duquel se formera un sol.$$,
        'highlights', array[$$arène$$, $$roche mère altérée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dégradation combinée d'une roche endogène produit une roche mère altérée, meuble et poreuse (arène), qui constitue le point de départ de la formation d'un sol.$$),
        'example', jsonb_build_object('statement', $$Pourquoi dit-on que l'arène est le point de départ de la formation d'un sol ?$$, 'solution', $$Parce qu'elle constitue un matériau meuble et poreux, issu de la dégradation de la roche, sur lequel pourra ensuite s'accumuler de la matière organique pour former un sol.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la roche mère fragmentée et altérée issue de la dégradation d'une roche endogène ?$$, 'solution', $$L'arène.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur l'affleurement de granite visité par la classe, une partie de la roche est fissurée et friable, colonisée par des lichens et traversée par des racines, alors qu'une autre partie reste massive et compacte.$$,
      'questions', array[
        $$Explique comment les variations de température fragmentent une roche.$$,
        $$Explique comment l'eau modifie chimiquement les minéraux d'une roche.$$,
        $$Cite deux façons dont les êtres vivants participent à la dégradation d'une roche.$$,
        $$Quel matériau résulte de la dégradation combinée d'une roche endogène, et à quoi sert-il ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la thermoclastie ?$$,
      'hint', $$Pense aux variations de température jour/nuit.$$,
      'expected', $$C'est la fragmentation d'une roche sous l'effet de la dilatation et de la contraction répétées de ses minéraux, provoquées par les variations de température entre le jour et la nuit.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'hydrolyse d'un minéral comme le feldspath ?$$,
      'hint', $$Pense à la réaction chimique avec l'eau.$$,
      'expected', $$C'est la réaction chimique entre l'eau et un minéral, qui le transforme progressivement en argile et libère des ions dissous.$$
    ),
    jsonb_build_object(
      'question', $$Comment les lichens contribuent-ils à la dégradation d'une roche ?$$,
      'hint', $$Pense aux substances qu'ils produisent.$$,
      'expected', $$Ils produisent des substances acides qui attaquent chimiquement la surface de la roche sur laquelle ils sont fixés.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'arène et quel est son rôle ?$$,
      'hint', $$Pense au résultat final de la dégradation.$$,
      'expected', $$C'est la roche mère fragmentée et altérée, meuble et poreuse, issue de la dégradation d'une roche endogène ; elle constitue le point de départ de la formation d'un sol.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-degradation-roches-endogenes';
