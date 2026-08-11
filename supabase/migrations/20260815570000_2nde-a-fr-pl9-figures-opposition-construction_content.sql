-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3222: "PL9: FIGURES d'opposition et de construction (2)"
-- (https://lyc.ecole-ci.org/course/view.php?id=3222)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "9 PL 2nde FIGURES d'opposition et de construction (2).pdf" (2 pages,
-- Leçon 5 : les figures de style, séance 3 : les figures d'opposition et
-- de construction).
-- Rewritten/paraphrased from the source PDF: the definitions of oxymore,
-- antithèse and ironie (figures d'opposition, illustrated with an original
-- example inspired by the source's "Cocody est petit" antithesis), and of
-- ellipse and inversion (figures de construction, syntax reorganisation),
-- with the source's own "J'ouvre la porte, personne" ellipsis example.
-- 100% original wording; no sentence, and no literary quotation
-- (Corneille), copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl9-figures-opposition-construction',
  '2nde',
  'A',
  'francais',
  $$Les figures de style : opposition et construction$$,
  8,
  '2nde-a-fr-pl8-figures-amplification-attenuation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En poursuivant leur enquête sur les images utilisées par le parolier-poète invité au lycée, les élèves de seconde A remarquent que certaines phrases rapprochent des idées contraires, ou disent le contraire de ce qu'elles veulent faire comprendre, tandis que d'autres bousculent l'ordre habituel des mots dans la phrase. Ils s'organisent pour identifier ces figures d'opposition et de construction, les analyser et les utiliser en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les figures d'opposition : oxymore et antithèse$$,
        'body', $$Les figures d'opposition établissent un rapprochement entre deux ou plusieurs éléments distincts, souvent contraires. L'oxymore rapproche, dans une même expression, deux termes contradictoires. L'antithèse, elle, rapproche deux termes ou expressions opposés dans une même phrase ou un même passage, pour souligner un contraste fort.$$,
        'highlights', array[$$oxymore$$, $$antithèse$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « Ce quartier est tout petit, c'est là sa vraie grandeur », quelle figure d'opposition reconnaît-on ?$$, 'solution', $$Une antithèse : les deux idées opposées, « petit » et « grandeur », sont rapprochées pour souligner un contraste.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'un oxymore ?$$, 'solution', $$Le rapprochement, dans une même expression, de deux termes contradictoires.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ironie$$,
        'body', $$L'ironie consiste à dire le contraire de ce que l'on pense réellement, généralement pour se moquer, critiquer ou dénoncer une situation. Elle se reconnaît souvent grâce au contexte, qui révèle le décalage entre ce qui est dit et ce que le locuteur pense vraiment.$$,
        'highlights', array[$$ironie$$]::text[],
        'example', jsonb_build_object('statement', $$Un professeur dit à un élève qui a eu zéro à un contrôle : « Toutes mes félicitations ! ». Quelle figure de style emploie-t-il ?$$, 'solution', $$L'ironie : le professeur dit le contraire de ce qu'il pense pour souligner, en se moquant, la mauvaise note de l'élève.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on généralement l'ironie dans un texte ?$$, 'solution', $$Grâce au contexte, qui révèle un décalage entre ce qui est dit et ce que le locuteur pense réellement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les figures de construction : l'ellipse$$,
        'body', $$Les figures de construction portent sur la réorganisation de la syntaxe. L'ellipse est un procédé qui consiste à supprimer volontairement des mots utiles à la construction grammaticale de la phrase, mais non nécessaires à sa compréhension. Elle montre la rapidité avec laquelle une action se déroule et crée parfois un effet de suspense.$$,
        'highlights', array[$$ellipse$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « J'ouvre la porte, personne. », quels mots sont omis, et quel est l'effet produit ?$$, 'solution', $$Les mots « il n'y a » sont omis (« personne » pour « il n'y a personne »). Cette ellipse accélère le récit et crée un effet de suspense.$$),
        'fixation', jsonb_build_object('question', $$Que permet de créer une ellipse dans un récit ?$$, 'solution', $$Elle montre la rapidité de l'action et peut créer un effet de suspense.$$)
      ),
      jsonb_build_object(
        'heading', $$Les figures de construction : l'inversion$$,
        'body', $$L'inversion est une figure qui change l'ordre habituel des mots dans la phrase. Elle a pour effet de créer un bouleversement, une forme de rupture par rapport à l'usage courant, ou de mettre en relief un élément particulier de la phrase.$$,
        'highlights', array[$$inversion$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « Sage et travailleuse est Eunice », au lieu de « Eunice est sage et travailleuse », quel est l'effet de cette inversion ?$$, 'solution', $$Elle met en relief les qualités « sage et travailleuse » en les plaçant en tête de phrase, avant même le sujet.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'effet principal d'une inversion dans une phrase ?$$, 'solution', $$Mettre en relief un élément de la phrase ou créer une rupture par rapport à l'ordre habituel des mots.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après un match perdu à plate couture par son équipe favorite, un supporter s'exclame : « Quelle belle victoire ! ». Puis il ajoute, pensif : « Grande fut notre défaite, petite fut notre préparation. » Enfin il murmure : « Un but, un seul. »$$,
      'questions', array[
        $$Identifie la figure de style employée dans « Quelle belle victoire ! » et explique son effet.$$,
        $$Identifie la figure d'opposition présente dans la deuxième phrase.$$,
        $$Quels mots faudrait-il ajouter à « Un but, un seul. » pour rétablir la phrase complète ? Quelle figure de construction est ainsi utilisée ?$$,
        $$Réécris la phrase « Grande fut notre défaite » dans l'ordre habituel des mots, puis compare l'effet produit.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une antithèse ?$$,
      'hint', $$Elle rapproche deux idées contraires.$$,
      'expected', $$Le rapprochement de deux termes ou expressions opposés dans une même phrase ou un même passage.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'ironie ?$$,
      'hint', $$On dit le contraire de ce que l'on pense.$$,
      'expected', $$Dire le contraire de ce que l'on pense réellement, pour se moquer ou critiquer.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une ellipse ?$$,
      'hint', $$Des mots utiles à la grammaire sont supprimés.$$,
      'expected', $$La suppression volontaire de mots utiles à la construction grammaticale, sans nuire à la compréhension.$$
    ),
    jsonb_build_object(
      'question', $$Que fait une inversion dans une phrase ?$$,
      'hint', $$Elle change l'ordre habituel des mots.$$,
      'expected', $$Elle change l'ordre habituel des mots pour créer un effet ou mettre en relief un élément.$$
    )
  ),
  now()
);
