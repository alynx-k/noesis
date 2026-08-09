-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (la transfusion sanguine : compatibilité ABO, donneur/receveur universel,
-- facteur Rhésus, précautions), 100% original wording. Blood-type
-- compatibility facts checked carefully against standard ABO/Rh rules.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après un accident de la route, un blessé a perdu beaucoup de sang. À l'hôpital, le médecin décide de lui faire une transfusion sanguine, mais avant cela il vérifie soigneusement la compatibilité entre son sang et celui du donneur.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une transfusion sanguine$$,
        'body', $$La transfusion sanguine consiste à transférer le sang, ou l'un de ses composants, d'un donneur à un receveur dont l'organisme en a besoin. Elle peut être nécessaire en cas d'hémorragie importante, d'anémie sévère, ou lors d'une intervention chirurgicale à risque.$$,
        'highlights', array[$$transfusion sanguine$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La transfusion sanguine consiste à transférer le sang, ou l'un de ses composants, d'un donneur à un receveur dont l'organisme en a besoin.$$),
        'example', jsonb_build_object('statement', $$Dans quelles situations une transfusion sanguine peut-elle être nécessaire ?$$, 'solution', $$En cas d'hémorragie importante, d'anémie sévère, ou avant/pendant une intervention chirurgicale à risque.$$),
        'fixation', jsonb_build_object('question', $$Qui reçoit le sang lors d'une transfusion : le donneur ou le receveur ?$$, 'solution', $$Le receveur.$$)
      ),
      jsonb_build_object(
        'heading', $$La compatibilité des groupes sanguins$$,
        'body', $$Une transfusion n'est possible que si le sang du donneur ne contient pas d'antigène reconnu par les anticorps du receveur, sous peine d'agglutination des globules rouges, dangereuse pour le receveur. Le groupe O est appelé donneur universel, et le groupe AB receveur universel.$$,
        'highlights', array[$$compatibilité sanguine$$, $$donneur universel$$, $$receveur universel$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Groupe du receveur$$, $$Groupes compatibles pour le don$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$A$$, $$A ou O$$),
            jsonb_build_array($$B$$, $$B ou O$$),
            jsonb_build_array($$AB$$, $$A, B, AB ou O$$),
            jsonb_build_array($$O$$, $$O uniquement$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une transfusion n'est possible que si le sang du donneur ne contient pas d'antigène reconnu par les anticorps du receveur.$$),
        'example', jsonb_build_object('statement', $$Pourquoi le groupe O est-il appelé donneur universel ?$$, 'solution', $$Parce que ses globules rouges ne portent aucun antigène A ni B, donc ils ne provoquent pas de réaction d'agglutination quel que soit le groupe du receveur.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le groupe AB est-il appelé receveur universel ?$$, 'solution', $$Parce que son plasma ne contient aucun anticorps anti-A ni anti-B, il peut donc recevoir du sang de n'importe quel groupe ABO.$$)
      ),
      jsonb_build_object(
        'heading', $$Le facteur Rhésus et les précautions avant transfusion$$,
        'body', $$Avant toute transfusion, il faut vérifier la compatibilité des groupes ABO et du facteur Rhésus (positif ou négatif), et s'assurer par des analyses que le sang du donneur ne transmet aucune maladie infectieuse.$$,
        'highlights', array[$$facteur Rhésus$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Avant toute transfusion, il faut vérifier la compatibilité des groupes ABO et du facteur Rhésus, et s'assurer que le sang du donneur ne transmet aucune maladie infectieuse.$$),
        'example', jsonb_build_object('statement', $$Une personne de Rhésus négatif peut-elle recevoir sans risque du sang Rhésus positif ?$$, 'solution', $$Non, cela peut provoquer la formation d'anticorps anti-Rhésus et des réactions dangereuses, surtout lors d'une transfusion ultérieure.$$),
        'fixation', jsonb_build_object('question', $$Cite deux précautions prises avant une transfusion sanguine, en dehors de la compatibilité ABO.$$, 'solution', $$La vérification du facteur Rhésus et le dépistage de maladies transmissibles par le sang, comme le VIH ou les hépatites.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le blessé de l'accident est du groupe A, Rhésus négatif. L'hôpital dispose de poches de sang des groupes O-, A+, B- et AB+.$$,
      'questions', array[
        $$Quelles poches de sang, parmi celles disponibles, sont compatibles avec le groupe du blessé ?$$,
        $$Explique pourquoi les autres poches ne peuvent pas être utilisées.$$,
        $$Quelles vérifications le médecin doit-il faire avant la transfusion, en dehors du groupe ABO ?$$,
        $$Pourquoi une erreur de compatibilité peut-elle être dangereuse pour le blessé ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qui rend deux groupes sanguins incompatibles pour une transfusion ?$$,
      'hint', $$Pense à la réaction entre antigènes et anticorps.$$,
      'expected', $$Deux groupes sont incompatibles quand les antigènes des globules rouges du donneur sont reconnus par les anticorps présents dans le plasma du receveur, ce qui provoque une agglutination dangereuse.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on que le groupe O est le donneur universel ?$$,
      'hint', $$Pense à l'absence d'antigènes.$$,
      'expected', $$Parce que ses globules rouges ne portent ni antigène A ni antigène B, il peut donc être donné, en principe, à un receveur de n'importe quel groupe ABO.$$
    ),
    jsonb_build_object(
      'question', $$Cite une conséquence possible d'une transfusion réalisée avec des groupes incompatibles.$$,
      'hint', $$Pense aux globules rouges.$$,
      'expected', $$Une agglutination des globules rouges pouvant provoquer une obstruction des vaisseaux sanguins et mettre la vie du receveur en danger.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi vérifie-t-on le facteur Rhésus en plus du groupe ABO avant une transfusion ?$$,
      'hint', $$Pense aux anticorps anti-Rhésus.$$,
      'expected', $$Parce qu'un receveur Rhésus négatif recevant du sang Rhésus positif peut développer des anticorps anti-Rhésus dangereux lors d'une transfusion ou d'une grossesse ultérieure.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-transfusion';
