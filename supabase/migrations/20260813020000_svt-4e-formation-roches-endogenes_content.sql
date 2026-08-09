-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 2 : la formation des roches endogènes —
-- magma, roches plutoniques et volcaniques, granite et basalte). 100%
-- original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une sortie géologique, les élèves observent deux roches très différentes : un granite gris à gros grains visibles à l'œil nu, prélevé dans une carrière, et un basalte noir à grains si fins qu'on ne les distingue pas. Le professeur leur demande pourquoi ces deux roches, formées toutes deux à partir de magma, ont un aspect si différent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le magma, origine des roches endogènes$$,
        'body', $$Le magma est une roche en fusion, portée à très haute température, qui se trouve en profondeur dans la croûte terrestre. Les roches endogènes se forment directement par le refroidissement et la cristallisation de ce magma, à l'intérieur ou à la surface de la croûte terrestre.$$,
        'highlights', array[$$magma$$, $$roches endogènes$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les roches endogènes se forment par le refroidissement et la cristallisation du magma, à l'intérieur ou à la surface de la croûte terrestre.$$),
        'example', jsonb_build_object('statement', $$Qu'est-ce que le magma ?$$, 'solution', $$C'est une roche en fusion, à très haute température, présente en profondeur dans la croûte terrestre, qui donne naissance aux roches endogènes en se refroidissant.$$),
        'fixation', jsonb_build_object('question', $$D'où proviennent les roches endogènes ?$$, 'solution', $$Elles proviennent du refroidissement et de la cristallisation du magma.$$)
      ),
      jsonb_build_object(
        'heading', $$Les roches plutoniques : un refroidissement lent en profondeur$$,
        'body', $$Lorsque le magma reste en profondeur et se refroidit très lentement, sur des milliers d'années, les minéraux ont le temps de cristalliser et de former de gros cristaux visibles à l'œil nu. C'est le cas du granite, une roche plutonique à texture grenue, composée principalement de quartz, de feldspath et de mica.$$,
        'highlights', array[$$roche plutonique$$, $$granite$$, $$texture grenue$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Minéral du granite$$, $$Aspect$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Quartz$$, $$grains vitreux, gris ou incolores$$),
            jsonb_build_array($$Feldspath$$, $$cristaux clairs, blancs ou rosés$$),
            jsonb_build_array($$Mica$$, $$paillettes noires ou argentées, brillantes$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une roche plutonique, comme le granite, se forme par refroidissement lent du magma en profondeur, ce qui donne de gros cristaux bien visibles (texture grenue).$$),
        'example', jsonb_build_object('statement', $$Pourquoi les cristaux du granite sont-ils gros et visibles à l'œil nu ?$$, 'solution', $$Parce que le magma s'est refroidi très lentement en profondeur, ce qui a laissé le temps aux minéraux de cristalliser et de grossir.$$),
        'fixation', jsonb_build_object('question', $$Cite les trois minéraux principaux du granite.$$, 'solution', $$Le quartz, le feldspath et le mica.$$)
      ),
      jsonb_build_object(
        'heading', $$Les roches volcaniques : un refroidissement rapide en surface$$,
        'body', $$Lorsque le magma remonte jusqu'à la surface lors d'une éruption volcanique, il se refroidit très rapidement au contact de l'air ou de l'eau. Les minéraux n'ont pas le temps de bien cristalliser : on obtient de très petits cristaux, parfois invisibles à l'œil nu, voire une roche vitreuse. C'est le cas du basalte, une roche volcanique sombre à texture microlitique.$$,
        'highlights', array[$$roche volcanique$$, $$basalte$$, $$texture microlitique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une roche volcanique, comme le basalte, se forme par refroidissement rapide du magma en surface, ce qui donne de très petits cristaux (texture microlitique).$$),
        'example', jsonb_build_object('statement', $$Pourquoi les cristaux du basalte sont-ils très petits, contrairement à ceux du granite ?$$, 'solution', $$Parce que le magma qui donne le basalte se refroidit très rapidement à la surface de la Terre, ce qui ne laisse pas le temps aux minéraux de former de gros cristaux.$$),
        'fixation', jsonb_build_object('question', $$Où se refroidit le magma qui donne naissance au basalte ?$$, 'solution', $$À la surface de la Terre, lors d'une éruption volcanique.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparer roches plutoniques et volcaniques$$,
        'body', $$La vitesse de refroidissement du magma détermine directement la taille des cristaux d'une roche endogène : plus le refroidissement est lent, plus les cristaux sont gros ; plus il est rapide, plus les cristaux sont petits.$$,
        'highlights', array[$$vitesse de refroidissement$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type de roche$$, $$Lieu de refroidissement$$, $$Vitesse$$, $$Texture$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Plutonique$$, $$en profondeur$$, $$lente$$, $$grenue (gros cristaux)$$, $$granite$$),
            jsonb_build_array($$Volcanique$$, $$en surface$$, $$rapide$$, $$microlitique (petits cristaux)$$, $$basalte$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Plus le refroidissement du magma est lent, plus les cristaux sont gros ; plus il est rapide, plus les cristaux sont petits.$$),
        'example', jsonb_build_object('statement', $$Un géologue trouve une roche à très gros cristaux. S'est-elle probablement formée en profondeur ou en surface ?$$, 'solution', $$En profondeur, car de gros cristaux résultent d'un refroidissement lent, caractéristique des roches plutoniques.$$),
        'fixation', jsonb_build_object('question', $$Quel facteur détermine la taille des cristaux d'une roche endogène ?$$, 'solution', $$La vitesse de refroidissement du magma.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les élèves comparent en classe un échantillon de granite à gros grains et un échantillon de basalte à grains invisibles, tous deux issus du refroidissement de magma.$$,
      'questions', array[
        $$Qu'est-ce que le magma et quel est son lien avec les roches endogènes ?$$,
        $$Explique pourquoi le granite a de gros cristaux visibles.$$,
        $$Explique pourquoi le basalte a des cristaux très petits.$$,
        $$Complète : plus le refroidissement du magma est ..., plus les cristaux sont gros.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une roche endogène ?$$,
      'hint', $$Pense à son origine, le magma.$$,
      'expected', $$C'est une roche qui se forme par le refroidissement et la cristallisation du magma.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une roche plutonique ? Donne un exemple.$$,
      'hint', $$Pense au refroidissement lent en profondeur.$$,
      'expected', $$C'est une roche endogène formée par refroidissement lent du magma en profondeur, à gros cristaux ; le granite en est un exemple.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une roche volcanique ? Donne un exemple.$$,
      'hint', $$Pense au refroidissement rapide en surface.$$,
      'expected', $$C'est une roche endogène formée par refroidissement rapide du magma en surface, à petits cristaux ; le basalte en est un exemple.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la vitesse de refroidissement du magma influence-t-elle la taille des cristaux ?$$,
      'hint', $$Pense au temps disponible pour la cristallisation.$$,
      'expected', $$Parce qu'un refroidissement lent laisse le temps aux minéraux de bien cristalliser et de former de gros cristaux, alors qu'un refroidissement rapide ne le permet pas, donnant de petits cristaux.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-formation-roches-endogenes';
