-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806280000_anglais_femme_rurale_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered present simple for routines,
-- have to/must, and simple comparatives; this 4ème lesson steps up to the
-- present perfect continuous (an ongoing routine started in the past) and
-- "not only... but also" for describing a rural woman's many roles.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A regional radio programme is preparing a feature on rural women's contribution to the local economy. Your English Club has been asked to write the interview questions and a short profile, showing not just what a rural woman does, but how long she has been doing it and everything she juggles at once.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: a rural woman's many roles$$,
        'body', $$A rural woman's daily life involves several kinds of work at once: farming, trading, and caring for a household, often for years without a break.$$,
        'highlights', array[$$to juggle$$, $$a livelihood$$, $$tireless$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to juggle (roles)$$, $$to manage several responsibilities at the same time$$),
            jsonb_build_array($$a livelihood$$, $$a way of earning enough to live$$),
            jsonb_build_array($$tireless$$, $$never seeming to get tired or give up$$),
            jsonb_build_array($$to generate income$$, $$to produce money through work$$),
            jsonb_build_array($$self-sufficient$$, $$able to provide for oneself without outside help$$),
            jsonb_build_array($$to sustain (a family)$$, $$to keep a family supported over time$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The present perfect continuous (has/have been + verb-ing) describes an action that started in the past and is still continuing, emphasising its duration: She has been farming this land for over twenty years.$$),
        'example', jsonb_build_object('statement', $$How long has this woman been trading at the market?$$, 'solution', $$She has been trading at the market since she was eighteen years old.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Amenan ___ (grow) cassava on this plot for fifteen years."$$, 'solution', $$Amenan has been growing cassava on this plot for fifteen years.$$)
      ),
      jsonb_build_object(
        'heading', $$"Not only... but also"$$,
        'body', $$Describing everything a rural woman juggles at once calls for a structure that links two roles together with emphasis on both.$$,
        'highlights', array[$$not only$$, $$but also$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Not only + auxiliary + subject... but also + verb" links two facts, giving weight to both. When "not only" begins the sentence, the auxiliary and subject invert, as in a question: Not only does she farm the land, but she also sells at the market.$$),
        'example', jsonb_build_object('statement', $$Combine "She farms the land" and "she raises five children" using not only... but also.$$, 'solution', $$Not only does she farm the land, but she also raises five children.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Not only ___ (she/manage) the household, but she also ___ (sell) her produce at the market."$$, 'solution', $$Not only does she manage the household, but she also sells her produce at the market.$$)
      ),
      jsonb_build_object(
        'heading', $$Present perfect continuous vs present simple$$,
        'body', $$A routine that is simply true (present simple) and a routine that highlights how long it has lasted (present perfect continuous) sound similar but answer different questions.$$,
        'highlights', array[$$a fact$$, $$a duration$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the present simple to state a routine as a fact (She farms cassava). Use the present perfect continuous, usually with "for" or "since", to highlight how long that routine has been going on (She has been farming cassava for twenty years).$$),
        'example', jsonb_build_object('statement', $$Which fits better with "since 2005": "She trades at the market" or "She has been trading at the market"?$$, 'solution', $$"She has been trading at the market since 2005" fits better, because "since" needs the present perfect continuous.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct form: "Every day, she ___ (fetch) water from the well." (routine as fact)$$, 'solution', $$Every day, she fetches water from the well.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the regional radio feature, you must present a short profile of a rural woman's daily life and her many years of hard work.$$,
      'questions', array[
        $$Describe, using the present perfect continuous, how long this woman has been doing her main work.$$,
        $$Use "not only... but also" to describe two of her roles.$$,
        $$Describe one daily routine using the present simple.$$,
        $$Explain why her contribution to the community matters.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "Mrs Koné ___ (sell) yams at this market since she was twenty."$$,
      'hint', $$has/have been + verb-ing, with "since" for a starting point.$$,
      'expected', $$Mrs Koné has been selling yams at this market since she was twenty.$$
    ),
    jsonb_build_object(
      'question', $$Combine using "not only... but also": "She cooks for the family." / "She works in the fields every morning."$$,
      'hint', $$Not only + auxiliary + subject... but also + verb.$$,
      'expected', $$Not only does she cook for the family, but she also works in the fields every morning.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct form: "For the past ten years, she ___ (raise) chickens to support her family."$$,
      'hint', $$Duration marker "for the past ten years" needs the present perfect continuous.$$,
      'expected', $$For the past ten years, she has been raising chickens to support her family.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite emphasising both facts: "She weaves baskets. She also teaches young girls the craft."$$,
      'hint', $$Start with "Not only" and invert the auxiliary.$$,
      'expected', $$Not only does she weave baskets, but she also teaches young girls the craft.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-femme-rurale';
