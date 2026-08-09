-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806360000_anglais_produits_cosmetiques_content.sql, the 3ème
-- equivalent, for the CourseContentV2 shape). 3ème covered should/shouldn't
-- for skincare advice; this 4ème lesson steps up to the second conditional
-- for hypothetical advice ("If I were you, I wouldn't...") and reported
-- advice ("The dermatologist advised her to/not to...").
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A local dermatologist visited your school to warn students about the dangers of skin-bleaching products. Your English Club must report her advice in a leaflet, both quoting what she recommended and imagining what you would personally do in a friend's situation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: skincare and its risks$$,
        'body', $$Discussing cosmetic products responsibly requires vocabulary about ingredients, side effects, and safe alternatives.$$,
        'highlights', array[$$a side effect$$, $$to damage$$, $$harmful$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a side effect$$, $$an unwanted effect caused by a product or treatment$$),
            jsonb_build_array($$to damage$$, $$to harm or spoil something$$),
            jsonb_build_array($$harmful$$, $$causing harm or injury$$),
            jsonb_build_array($$an ingredient$$, $$one of the substances that make up a product$$),
            jsonb_build_array($$to bleach (skin)$$, $$to use chemicals to lighten skin colour$$),
            jsonb_build_array($$a dermatologist$$, $$a doctor who specialises in skin conditions$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The second conditional gives hypothetical advice: "If I were you, I wouldn't + base verb" imagines being in someone else's position to warn them against something.$$),
        'example', jsonb_build_object('statement', $$Give hypothetical advice to a friend considering a bleaching cream.$$, 'solution', $$If I were you, I wouldn't use that cream -- it could damage your skin permanently.$$),
        'fixation', jsonb_build_object('question', $$Complete: "If I ___ (be) you, I ___ (check) the ingredients before buying any cosmetic product."$$, 'solution', $$If I were you, I would check the ingredients before buying any cosmetic product.$$)
      ),
      jsonb_build_object(
        'heading', $$Reporting the dermatologist's advice$$,
        'body', $$To report exactly what a professional recommended, English shifts direct advice into a reported structure using "advised".$$,
        'highlights', array[$$advised to$$, $$advised not to$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Advised + person + to + base verb" reports positive advice: "Use sunscreen," she said → She advised us to use sunscreen. For negative advice, add "not": She advised us not to use bleaching creams.$$),
        'example', jsonb_build_object('statement', $$Report the dermatologist's warning: "Don't use bleaching creams."$$, 'solution', $$The dermatologist advised us not to use bleaching creams.$$),
        'fixation', jsonb_build_object('question', $$Report this advice: "Always test a new product on a small area first," said the dermatologist.$$, 'solution', $$The dermatologist advised us to always test a new product on a small area first.$$)
      ),
      jsonb_build_object(
        'heading', $$Hypothetical opinion vs reported fact$$,
        'body', $$A leaflet is more convincing when it mixes a professional's exact recommendation with your own imagined advice to a friend.$$,
        'highlights', array[$$a professional's advice$$, $$personal advice$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "advised + person + (not) to" to report what an expert actually said. Use "If I were you, I would/wouldn't" to add your own personal, hypothetical recommendation on top of the expert's advice.$$),
        'example', jsonb_build_object('statement', $$Combine reported expert advice with your own hypothetical advice.$$, 'solution', $$The dermatologist advised us not to bleach our skin. If I were you, I would ask her about safer alternatives instead.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct structure: "The doctor ___ (advised/would) us to protect our skin from the sun."$$, 'solution', $$The doctor advised us to protect our skin from the sun, because this reports what she actually said.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your leaflet must report the dermatologist's advice on cosmetic products and add your own recommendation to a friend.$$,
      'questions', array[
        $$Report one piece of positive advice using "advised us to".$$,
        $$Report one warning using "advised us not to".$$,
        $$Give your own hypothetical advice using "If I were you...".$$,
        $$Explain why some students still use risky cosmetic products despite the risks.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "If I ___ (be) you, I ___ (not/use) that skin-lightening cream."$$,
      'hint', $$Second conditional: if + past simple, ... would(n't) + base verb.$$,
      'expected', $$If I were you, I wouldn't use that skin-lightening cream.$$
    ),
    jsonb_build_object(
      'question', $$Report this advice: "Drink plenty of water for healthy skin," said the dermatologist.$$,
      'hint', $$Advised + person + to + base verb.$$,
      'expected', $$The dermatologist advised us to drink plenty of water for healthy skin.$$
    ),
    jsonb_build_object(
      'question', $$Report this warning: "Don't share cosmetic products with others," said the doctor.$$,
      'hint', $$Advised + person + not to + base verb.$$,
      'expected', $$The doctor advised us not to share cosmetic products with others.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If she ___ (know) the risks, she ___ (not/buy) that product."$$,
      'hint', $$Second conditional for a hypothetical present situation.$$,
      'expected', $$If she knew the risks, she wouldn't buy that product.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-produits-cosmetiques';
