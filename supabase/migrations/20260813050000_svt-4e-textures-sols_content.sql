-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 3 : les textures des sols — sable,
-- limon, argile, test de décantation, influence sur la fertilité). 100%
-- original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deux agriculteurs comparent leurs terrains : chez l'un, l'eau s'infiltre presque aussitôt après la pluie et le sol sèche vite ; chez l'autre, l'eau stagne longtemps en surface après une averse et le sol devient collant. Ils se demandent pourquoi leurs sols réagissent si différemment à l'eau.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la texture d'un sol$$,
        'body', $$La texture d'un sol correspond à la proportion relative des différentes tailles de particules minérales qui le composent : le sable, le limon et l'argile. Cette proportion détermine en grande partie le comportement du sol face à l'eau et à l'air.$$,
        'highlights', array[$$texture d'un sol$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La texture d'un sol est définie par la proportion de sable, de limon et d'argile qu'il contient.$$),
        'example', jsonb_build_object('statement', $$Pourquoi deux sols de même composition chimique peuvent-ils se comporter différemment face à l'eau ?$$, 'solution', $$Parce que leur texture, c'est-à-dire la proportion de particules de sable, de limon et d'argile, peut être différente, ce qui modifie leur capacité à retenir ou à laisser passer l'eau.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois grandes catégories de particules qui définissent la texture d'un sol ?$$, 'solution', $$Le sable, le limon et l'argile.$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois grandes familles de particules$$,
        'body', $$Les particules minérales d'un sol sont classées selon leur taille : le sable regroupe les particules les plus grosses, le limon des particules de taille intermédiaire, et l'argile les particules les plus fines. Cette taille influence directement les propriétés physiques du sol.$$,
        'highlights', array[$$sable$$, $$limon$$, $$argile$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Particule$$, $$Taille relative$$, $$Caractéristique au toucher$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Sable$$, $$grains grossiers$$, $$rêche, granuleux$$),
            jsonb_build_array($$Limon$$, $$particules moyennes$$, $$doux, farineux$$),
            jsonb_build_array($$Argile$$, $$particules très fines$$, $$lisse, collant et malléable une fois mouillé$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les particules d'un sol sont classées par taille décroissante : le sable (grossier), le limon (intermédiaire) et l'argile (très fine).$$),
        'example', jsonb_build_object('statement', $$Comment reconnaître au toucher un échantillon riche en argile ?$$, 'solution', $$Une fois humidifié, il devient lisse, collant et malléable, alors qu'un échantillon sableux reste granuleux et rêche.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la plus fine des trois catégories de particules d'un sol ?$$, 'solution', $$L'argile.$$)
      ),
      jsonb_build_object(
        'heading', $$Déterminer la texture d'un sol$$,
        'body', $$La texture d'un sol peut être estimée par un test manuel, en frottant un échantillon humide entre les doigts, ou par un test de décantation : on agite un échantillon de sol dans un bocal rempli d'eau, puis on le laisse reposer. Les particules se déposent alors par ordre de taille décroissante, le sable au fond, le limon au-dessus, et l'argile en surface.$$,
        'highlights', array[$$test de décantation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le test de décantation permet d'estimer la texture d'un sol : après agitation dans l'eau, les particules se déposent par ordre de taille, du sable au fond à l'argile en surface.$$),
        'example', jsonb_build_object('statement', $$Dans un bocal de décantation, quelle couche se dépose en premier, au fond ?$$, 'solution', $$Le sable, car ce sont les particules les plus grosses et les plus lourdes, qui se déposent les premières.$$),
        'fixation', jsonb_build_object('question', $$Dans un test de décantation, quelle particule se retrouve en dernier à la surface ?$$, 'solution', $$L'argile, la plus fine et la plus légère.$$)
      ),
      jsonb_build_object(
        'heading', $$L'influence de la texture sur les propriétés du sol$$,
        'body', $$Un sol sableux est très perméable : l'eau s'y infiltre rapidement, mais il retient mal l'eau et les éléments nutritifs. Un sol argileux retient bien l'eau et les nutriments, mais il est peu perméable, se compacte et draine mal l'eau en excès. Un sol équilibré, contenant du sable, du limon et de l'argile en proportions convenables, offre généralement les meilleures conditions pour les cultures.$$,
        'highlights', array[$$perméabilité$$, $$fertilité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un sol sableux est très perméable mais retient mal l'eau ; un sol argileux retient bien l'eau mais draine mal ; un sol équilibré est généralement le plus favorable aux cultures.$$),
        'example', jsonb_build_object('statement', $$Pourquoi le sol de l'agriculteur dont l'eau s'infiltre presque aussitôt est-il probablement sableux ?$$, 'solution', $$Parce qu'un sol sableux, riche en grosses particules, est très perméable et laisse l'eau s'infiltrer rapidement, contrairement à un sol argileux qui la retient en surface.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi un sol trop argileux peut-il poser problème après une forte pluie ?$$, 'solution', $$Parce qu'il est peu perméable et draine mal l'eau, qui a alors tendance à stagner en surface.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les deux agriculteurs réalisent chacun un test de décantation sur un échantillon de leur terrain, dans un bocal d'eau.$$,
      'questions', array[
        $$Définis la texture d'un sol.$$,
        $$Décris le principe du test de décantation et l'ordre de dépôt des particules.$$,
        $$Explique pourquoi le sol de l'un des agriculteurs draine très vite l'eau de pluie.$$,
        $$Pourquoi un sol équilibré (sable, limon, argile) est-il souvent recherché pour l'agriculture ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la texture d'un sol ?$$,
      'hint', $$Pense aux trois catégories de particules.$$,
      'expected', $$C'est la proportion relative de sable, de limon et d'argile qui compose un sol.$$
    ),
    jsonb_build_object(
      'question', $$Classe le sable, le limon et l'argile de la particule la plus grosse à la plus fine.$$,
      'hint', $$Pense à leur taille.$$,
      'expected', $$Le sable (le plus grossier), puis le limon, puis l'argile (la plus fine).$$
    ),
    jsonb_build_object(
      'question', $$Comment se déroule un test de décantation pour estimer la texture d'un sol ?$$,
      'hint', $$Pense au bocal d'eau et à l'ordre de dépôt.$$,
      'expected', $$On agite un échantillon de sol dans un bocal d'eau puis on laisse reposer : les particules se déposent par ordre de taille, le sable au fond, le limon au-dessus, et l'argile en surface.$$
    ),
    jsonb_build_object(
      'question', $$Compare la perméabilité d'un sol sableux et celle d'un sol argileux.$$,
      'hint', $$Pense à l'infiltration de l'eau.$$,
      'expected', $$Un sol sableux est très perméable, l'eau s'y infiltre rapidement mais il la retient mal ; un sol argileux est peu perméable, l'eau y stagne mais il la retient bien.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-textures-sols';
