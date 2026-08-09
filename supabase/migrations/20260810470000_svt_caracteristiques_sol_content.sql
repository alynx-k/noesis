-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (les caractéristiques d'un sol : composition, horizons, propriétés
-- physiques), 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En creusant un trou dans le jardin de l'école, les élèves observent que la terre n'est pas la même en profondeur : en surface elle est sombre et meuble, plus bas elle devient plus claire et compacte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un sol$$,
        'body', $$Le sol est la couche superficielle de la croûte terrestre, formée par l'altération de la roche mère sous l'action du climat et des êtres vivants. Il est composé d'éléments minéraux, de matière organique appelée humus, d'eau, d'air et d'organismes vivants.$$,
        'highlights', array[$$sol$$, $$matière organique$$, $$éléments minéraux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le sol est la couche superficielle de la terre, formée par l'altération de la roche mère et l'action des êtres vivants ; il est composé d'éléments minéraux, de matière organique, d'eau, d'air et d'organismes vivants.$$),
        'example', jsonb_build_object('statement', $$D'où proviennent les éléments minéraux présents dans un sol ?$$, 'solution', $$Ils proviennent de la roche mère, altérée progressivement par le climat et par l'action des êtres vivants.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce que l'humus et d'où provient-il ?$$, 'solution', $$L'humus est la matière organique du sol ; il provient de la décomposition des débris végétaux et animaux par les micro-organismes.$$)
      ),
      jsonb_build_object(
        'heading', $$Les horizons du sol$$,
        'body', $$Un sol est organisé en couches superposées appelées horizons, qui se distinguent par leur couleur, leur composition et leur texture, de la surface vers la roche mère.$$,
        'highlights', array[$$horizons du sol$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Horizon$$, $$Position$$, $$Caractéristiques$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Horizon A$$, $$superficiel$$, $$riche en matière organique, sombre et meuble$$),
            jsonb_build_array($$Horizon B$$, $$intermédiaire$$, $$moins riche en humus, accumulation d'éléments minéraux$$),
            jsonb_build_array($$Horizon C$$, $$profond$$, $$roche mère plus ou moins altérée$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un sol est organisé en couches superposées appelées horizons, qui se distinguent par leur couleur, leur composition et leur texture.$$),
        'example', jsonb_build_object('statement', $$Quel horizon du sol est généralement le plus sombre et le plus riche en matière organique ?$$, 'solution', $$L'horizon A, l'horizon de surface.$$),
        'fixation', jsonb_build_object('question', $$Quel horizon correspond à la roche mère peu altérée ?$$, 'solution', $$L'horizon C.$$)
      ),
      jsonb_build_object(
        'heading', $$Les propriétés physiques d'un sol$$,
        'body', $$Les propriétés physiques d'un sol, comme sa texture, la proportion de sable, de limon et d'argile qu'il contient, et sa perméabilité, sa capacité à laisser passer l'eau et l'air, déterminent en grande partie sa fertilité.$$,
        'highlights', array[$$texture$$, $$perméabilité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les propriétés physiques d'un sol, comme sa texture et sa perméabilité, déterminent en grande partie sa fertilité.$$),
        'example', jsonb_build_object('statement', $$Un sol sableux et un sol argileux ont-ils la même perméabilité ? Explique.$$, 'solution', $$Non ; un sol sableux, aux grains larges, laisse facilement passer l'eau, alors qu'un sol argileux, aux particules fines et serrées, retient davantage l'eau.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi un sol riche en humus est-il généralement plus fertile ?$$, 'solution', $$Parce que l'humus apporte des éléments nutritifs aux plantes et améliore la structure du sol, favorisant la rétention d'eau et d'air.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les élèves creusent un profil de sol dans le jardin scolaire et observent trois couches de couleurs différentes, du sombre en surface au clair en profondeur.$$,
      'questions', array[
        $$Nomme les trois horizons observés et décris leurs caractéristiques.$$,
        $$Explique l'origine des éléments minéraux et de la matière organique du sol.$$,
        $$Quelle propriété physique du sol faudrait-il mesurer pour savoir s'il retient bien l'eau ?$$,
        $$Pourquoi l'horizon de surface est-il le plus important pour la croissance des plantes ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Définis ce qu'est un sol.$$,
      'hint', $$Pense à son origine et à sa position.$$,
      'expected', $$Le sol est la couche superficielle de la croûte terrestre, formée par l'altération de la roche mère sous l'action du climat et des êtres vivants.$$
    ),
    jsonb_build_object(
      'question', $$Cite les cinq constituants d'un sol.$$,
      'hint', $$Minéraux, matière organique, eau, air, organismes vivants.$$,
      'expected', $$Les éléments minéraux, la matière organique (humus), l'eau, l'air et les organismes vivants.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un horizon de sol ?$$,
      'hint', $$Pense aux couches observées en profondeur.$$,
      'expected', $$Un horizon est une couche du sol, superposée aux autres, qui se distingue par sa couleur, sa composition et sa texture, depuis la surface jusqu'à la roche mère.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la texture d'un sol influence-t-elle sa fertilité ?$$,
      'hint', $$Pense à la rétention d'eau et d'air.$$,
      'expected', $$Parce que la texture, la proportion de sable, de limon et d'argile, détermine la capacité du sol à retenir l'eau, l'air et les éléments nutritifs nécessaires aux plantes.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-caracteristiques-sol';
