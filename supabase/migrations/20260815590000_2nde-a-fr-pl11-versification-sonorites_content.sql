-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3225: "PL11: La versification les sonorités"
-- (https://lyc.ecole-ci.org/course/view.php?id=3225)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "11 PL la versification les sonorités.pdf" (5 pages, Leçon 6 : la
-- versification, séance 2 : étude de l'architecture sonore, les sonorités).
-- Rewritten/paraphrased from the source PDF: the definition of rhyme and
-- its three ways of being characterised (genre, qualité, disposition), and
-- the musicality devices assonance, allitération and hiatus, plus the
-- notion of rythme (accent tonique, accent de coupe). 100% original
-- wording; no sentence, and no line of the poems quoted in the source
-- (Musset, Queneau, José Albano, Henri de Régnier), copied here.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl11-versification-sonorites',
  '2nde',
  'A',
  'francais',
  $$La versification : le rythme et les sonorités$$,
  10,
  '2nde-a-fr-pl10-versification-vers-strophes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Toujours dans le cadre de leur préparation à la compétition de poésie du lycée, les élèves remarquent que la beauté d'un poème ne tient pas seulement au nombre de syllabes de ses vers, mais aussi à sa musicalité : les sons qui reviennent, les sons qui s'opposent, le rythme qui s'en dégage. Ils s'organisent pour étudier cette architecture sonore du poème.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La rime : définition et genre$$,
        'body', $$La rime est le retour d'un ou de plusieurs sons identiques à la fin de deux ou plusieurs vers. Les rimes se caractérisent d'abord par leur genre : la rime est dite féminine lorsqu'elle se termine par une syllabe comportant un e muet ; elle est dite masculine lorsqu'elle se termine par une syllabe ne comportant pas de e muet.$$,
        'highlights', array[$$rime$$, $$rime féminine$$, $$rime masculine$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'une rime ?$$, 'solution', $$Le retour d'un ou de plusieurs sons identiques à la fin de deux ou plusieurs vers.$$)
      ),
      jsonb_build_object(
        'heading', $$La qualité et la disposition des rimes$$,
        'body', $$Les rimes se caractérisent aussi par leur qualité : la rime pauvre associe deux mots n'ayant en commun qu'un seul son ; la rime suffisante associe deux mots ayant en commun leurs deux derniers sons ; la rime riche associe deux mots ayant en commun leurs trois derniers sons. Enfin, les rimes se caractérisent par leur disposition dans la strophe : les rimes plates (ou suivies) suivent le schéma aabb, les rimes croisées suivent le schéma abab, et les rimes embrassées suivent le schéma abba.$$,
        'highlights', array[$$rime pauvre$$, $$rime riche$$, $$rimes croisées$$, $$rimes embrassées$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Disposition$$, $$Schéma$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Rimes plates (suivies)$$, $$aabb$$),
            jsonb_build_array($$Rimes croisées$$, $$abab$$),
            jsonb_build_array($$Rimes embrassées$$, $$abba$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans un quatrain où le premier vers rime avec le quatrième, et le deuxième avec le troisième, quel type de disposition est utilisé ?$$, 'solution', $$Des rimes embrassées (schéma abba).$$),
        'fixation', jsonb_build_object('question', $$Quelle différence y a-t-il entre une rime pauvre et une rime riche ?$$, 'solution', $$La rime pauvre n'a qu'un seul son commun, tandis que la rime riche en a trois.$$)
      ),
      jsonb_build_object(
        'heading', $$La musicalité du poème : assonance, allitération et hiatus$$,
        'body', $$L'assonance est la répétition de sons-voyelles identiques dans un même vers, ou d'un vers à l'autre. L'allitération est la répétition de sons-consonnes identiques dans un même vers, ou d'un vers à l'autre. L'hiatus, lui, se produit lorsque deux voyelles se rencontrent sans que la première ne s'élide, ce qui crée une rupture dans la fluidité de la lecture.$$,
        'highlights', array[$$assonance$$, $$allitération$$, $$hiatus$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un vers où les sons « on » et « an » reviennent à plusieurs reprises sur des voyelles, quelle figure sonore reconnaît-on ?$$, 'solution', $$Une assonance : la répétition de sons-voyelles identiques.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre l'assonance et l'allitération ?$$, 'solution', $$L'assonance répète des sons-voyelles, tandis que l'allitération répète des sons-consonnes.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rythme : l'accent tonique et l'accent de coupe$$,
        'body', $$Dans le vers français, le rythme est déterminé par l'accent tonique. Il porte généralement sur la dernière syllabe non muette d'un mot long ou d'un groupe de mots courts. Par ailleurs, dans un groupe nominal ou verbal, le mot le plus important porte un accent de coupe, qui marque une pause à l'intérieur du vers et contribue, avec les rimes et les sonorités, à l'architecture musicale du poème.$$,
        'highlights', array[$$accent tonique$$, $$accent de coupe$$, $$rythme$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quelle syllabe porte généralement l'accent tonique dans un vers français ?$$, 'solution', $$Sur la dernière syllabe non muette d'un mot long ou d'un groupe de mots courts.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour la compétition de poésie du lycée, une élève compose un quatrain où le premier vers rime avec le deuxième, et le troisième avec le quatrième ; les mots en fin de vers partagent chacun leurs trois derniers sons ; et plusieurs vers répètent le son consonne [s].$$,
      'questions', array[
        $$Quel type de disposition des rimes ce quatrain utilise-t-il ?$$,
        $$Quelle est la qualité de ces rimes (pauvre, suffisante ou riche) ? Justifie.$$,
        $$Comment appelle-t-on la répétition du son consonne [s] dans plusieurs vers ?$$,
        $$Explique ce que serait un hiatus dans ce contexte, et comment on pourrait l'éviter.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une rime féminine ?$$,
      'hint', $$Elle se termine par un e muet.$$,
      'expected', $$Une rime qui se termine par une syllabe comportant un e muet.$$
    ),
    jsonb_build_object(
      'question', $$Quel schéma correspond aux rimes croisées ?$$,
      'hint', $$Les rimes alternent.$$,
      'expected', $$Le schéma abab.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une allitération ?$$,
      'hint', $$Elle répète des sons-consonnes.$$,
      'expected', $$La répétition de sons-consonnes identiques dans un même vers ou d'un vers à l'autre.$$
    ),
    jsonb_build_object(
      'question', $$Quand parle-t-on d'hiatus ?$$,
      'hint', $$Deux voyelles se rencontrent.$$,
      'expected', $$Lorsque deux voyelles se rencontrent sans que la première ne s'élide.$$
    )
  ),
  now()
);
