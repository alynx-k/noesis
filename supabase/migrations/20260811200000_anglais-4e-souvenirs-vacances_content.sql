-- Fallback content (original, not sourced from ecole-ci.org): the site's
-- login wall blocked every access attempt this session (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql, the 3ème
-- equivalent, for the CourseContentV2 shape/rationale). This 4ème lesson
-- revisits the same "holiday memories" topic one grammar level up: instead
-- of the plain past simple, it introduces the past continuous (interrupted
-- actions) and the past perfect (an earlier past action), the natural next
-- step after 3ème's past simple + time expressions + sequence words.
-- Content is in English (immersion), UI chrome stays French.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English teacher has asked the class to write a diary entry about last year's summer holidays for the school magazine. This time, a simple list of events isn't enough -- she wants you to show what was already happening in the background when something else suddenly occurred, and what had already taken place before a particular moment.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: a holiday scene$$,
        'body', $$Before you can describe a lively holiday scene, you need words that capture actions in progress, sudden events, and strong impressions.$$,
        'highlights', array[$$to set off$$, $$a downpour$$, $$breathtaking$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to set off$$, $$to begin a journey$$),
            jsonb_build_array($$to unwind$$, $$to relax after a period of stress or work$$),
            jsonb_build_array($$a downpour$$, $$a sudden, heavy fall of rain$$),
            jsonb_build_array($$to get soaked$$, $$to become completely wet$$),
            jsonb_build_array($$breathtaking$$, $$so beautiful or impressive that it takes your breath away$$),
            jsonb_build_array($$to wander around$$, $$to walk without a fixed direction, exploring$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The past continuous (was/were + verb-ing) describes an action already in progress at a particular past moment. It is often interrupted by a shorter, completed action in the past simple: "While + past continuous, ... past simple" or "... when + past simple."$$),
        'example', jsonb_build_object('statement', $$What was happening when the storm suddenly started?$$, 'solution', $$We were wandering around the market when the storm suddenly started.$$),
        'fixation', jsonb_build_object('question', $$Combine the two actions with "while": "We swam in the river." / "The rain began."$$, 'solution', $$While we were swimming in the river, the rain began.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammar: the past perfect$$,
        'body', $$Sometimes one past event needs to be placed clearly before another. The past perfect lets you step even further back in time within a story that is already in the past.$$,
        'highlights', array[$$had + past participle$$, $$before$$, $$by the time$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The past perfect (had + past participle) describes an action that finished before another past action or moment. It is often signalled by "before", "after", "by the time", or "already": By the time we arrived, our cousins had already left.$$),
        'example', jsonb_build_object('statement', $$Describe what had happened before you reached the beach.$$, 'solution', $$By the time we reached the beach, the tide had already gone out.$$),
        'fixation', jsonb_build_object('question', $$Put the verb in brackets into the past perfect: "When Aya opened her suitcase, she realised she ___ (forget) her sunglasses."$$, 'solution', $$When Aya opened her suitcase, she realised she had forgotten her sunglasses.$$)
      ),
      jsonb_build_object(
        'heading', $$Weaving the three past tenses together$$,
        'body', $$A good holiday narrative moves smoothly between what was going on, what suddenly happened, and what had already happened before that -- the past continuous, the past simple, and the past perfect working as one system.$$,
        'highlights', array[$$background$$, $$interruption$$, $$earlier event$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the past continuous for background action, the past simple for the main completed events, and the past perfect for anything that happened even earlier than the rest of the story. Mixing all three, in the right order, makes a narrative sound natural rather than like a flat list.$$),
        'example', jsonb_build_object('statement', $$Combine: (background) it was raining / (main event) we reached the hotel / (earlier event) our parents had already booked a room.$$, 'solution', $$It was raining when we reached the hotel, but our parents had already booked a room, so we checked in quickly.$$),
        'fixation', jsonb_build_object('question', $$Rewrite as one sentence using past continuous + past simple + past perfect: "We were resting. Our uncle arrived. He had driven all night."$$, 'solution', $$We were resting when our uncle arrived; he had driven all night.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the school magazine's "Best Holiday Memory" contest, you must write a short diary-style entry describing an unforgettable moment from last year's holidays.$$,
      'questions', array[
        $$Describe, using the past continuous, what you were doing just before something unexpected happened.$$,
        $$Say, using the past simple, what suddenly happened.$$,
        $$Explain, using the past perfect, something that had already happened earlier that day.$$,
        $$Say how you felt about the whole experience, and why it is memorable.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Put the verbs into the correct past tense: "We ___ (walk) along the beach when it suddenly ___ (start) to rain."$$,
      'hint', $$Background action = past continuous; sudden interruption = past simple.$$,
      'expected', $$We were walking along the beach when it suddenly started to rain.$$
    ),
    jsonb_build_object(
      'question', $$Put the verb in brackets into the past perfect: "By the time we got to the airport, our flight ___ (already/leave)."$$,
      'hint', $$Use "had" + past participle for an action completed before another past moment.$$,
      'expected', $$By the time we got to the airport, our flight had already left.$$
    ),
    jsonb_build_object(
      'question', $$Combine into one sentence: "Kader was fishing by the river." / "His phone suddenly rang."$$,
      'hint', $$Use "while" or "when" to link the background action to the interruption.$$,
      'expected', $$Kader was fishing by the river when his phone suddenly rang.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct tense: "When we arrived at the village, the ceremony ___ (already/begin)."$$,
      'hint', $$Something finished before another past moment needs the past perfect.$$,
      'expected', $$When we arrived at the village, the ceremony had already begun.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-souvenirs-vacances';
