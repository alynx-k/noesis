-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (la circulation sanguine : le cœur, les vaisseaux sanguins, la double
-- circulation), 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En posant la main sur sa poitrine, Aya sent son cœur battre régulièrement. Elle se demande comment cet organe fait circuler le sang dans tout son corps, jusqu'au bout de ses doigts et de ses orteils.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le cœur, une pompe musculaire$$,
        'body', $$Le cœur est un muscle creux formé de quatre cavités : deux oreillettes et deux ventricules. Il se contracte de façon rythmique pour propulser le sang dans tout l'organisme. Des valves empêchent le sang de refluer en arrière.$$,
        'highlights', array[$$le cœur$$, $$oreillettes$$, $$ventricules$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le cœur est un muscle creux formé de quatre cavités (deux oreillettes et deux ventricules) qui se contractent de façon rythmique pour propulser le sang dans tout l'organisme.$$),
        'example', jsonb_build_object('statement', $$Combien de cavités possède le cœur humain et comment se nomment-elles ?$$, 'solution', $$Quatre cavités : deux oreillettes (droite et gauche) et deux ventricules (droit et gauche).$$),
        'fixation', jsonb_build_object('question', $$Quel est le rôle des valves cardiaques ?$$, 'solution', $$Elles empêchent le sang de refluer en arrière, en imposant une circulation à sens unique.$$)
      ),
      jsonb_build_object(
        'heading', $$Les vaisseaux sanguins$$,
        'body', $$Les artères conduisent le sang du cœur vers les organes ; leurs parois épaisses et élastiques résistent à la pression du sang. Les veines ramènent le sang vers le cœur. Les capillaires, très fins, relient artères et veines et assurent les échanges avec les cellules.$$,
        'highlights', array[$$artères$$, $$veines$$, $$capillaires$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Vaisseau$$, $$Sens de circulation$$, $$Caractéristique$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Artères$$, $$s'éloignent du cœur$$, $$parois épaisses et élastiques$$),
            jsonb_build_array($$Veines$$, $$ramènent le sang vers le cœur$$, $$parois plus fines, munies de valvules$$),
            jsonb_build_array($$Capillaires$$, $$relient artères et veines$$, $$parois très fines permettant les échanges$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les artères conduisent le sang du cœur vers les organes, les veines le ramènent vers le cœur, et les capillaires assurent les échanges entre le sang et les cellules.$$),
        'example', jsonb_build_object('statement', $$Quel type de vaisseau permet les échanges de nutriments et de dioxygène avec les cellules du corps ?$$, 'solution', $$Les capillaires sanguins.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les artères ont-elles des parois plus épaisses que les veines ?$$, 'solution', $$Parce qu'elles doivent résister à la forte pression du sang propulsé par les contractions du cœur.$$)
      ),
      jsonb_build_object(
        'heading', $$La double circulation$$,
        'body', $$La circulation sanguine est double : la petite circulation relie le cœur aux poumons pour oxygéner le sang, tandis que la grande circulation relie le cœur aux organes pour leur apporter le dioxygène et les nutriments.$$,
        'highlights', array[$$petite circulation$$, $$grande circulation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La circulation sanguine est double et complète : la petite circulation oxygène le sang au niveau des poumons, la grande circulation approvisionne les organes en dioxygène et en nutriments.$$),
        'example', jsonb_build_object('statement', $$Dans quelle circulation le sang se charge-t-il en dioxygène ?$$, 'solution', $$Dans la petite circulation, au niveau des poumons.$$),
        'fixation', jsonb_build_object('question', $$Quel trajet suit le sang lors de la grande circulation ?$$, 'solution', $$Il part du ventricule gauche, parcourt les organes du corps où il cède le dioxygène et les nutriments, puis revient à l'oreillette droite du cœur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Aya fait un effort physique en cours de sport ; elle sent son cœur battre plus vite pour approvisionner ses muscles en dioxygène et en nutriments.$$,
      'questions', array[
        $$Explique le rôle du cœur dans la circulation du sang.$$,
        $$Décris le trajet du sang dans la petite circulation.$$,
        $$Décris le trajet du sang dans la grande circulation.$$,
        $$Pourquoi le rythme cardiaque augmente-t-il pendant un effort physique ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de cavités possède le cœur et comment se répartissent-elles ?$$,
      'hint', $$Pense aux oreillettes et aux ventricules.$$,
      'expected', $$Le cœur possède quatre cavités : une oreillette et un ventricule du côté droit, une oreillette et un ventricule du côté gauche.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence principale entre une artère et une veine ?$$,
      'hint', $$Pense au sens de circulation du sang.$$,
      'expected', $$L'artère transporte le sang du cœur vers les organes, alors que la veine ramène le sang des organes vers le cœur.$$
    ),
    jsonb_build_object(
      'question', $$Où se déroulent les échanges entre le sang et les cellules de l'organisme ?$$,
      'hint', $$Pense au type de vaisseau le plus fin.$$,
      'expected', $$Les échanges se déroulent au niveau des capillaires sanguins, dont les parois très fines permettent le passage des substances.$$
    ),
    jsonb_build_object(
      'question', $$Explique pourquoi on dit que la circulation sanguine humaine est double.$$,
      'hint', $$Pense aux deux trajets du sang.$$,
      'expected', $$Parce que le sang suit deux circuits distincts partant du cœur : la petite circulation vers les poumons et la grande circulation vers les autres organes du corps.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-circulation-sanguine';
