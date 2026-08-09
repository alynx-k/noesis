-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806380000_anglais_au_village_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered the superlative and "prefer +
-- noun + to + noun"; this 4ème lesson steps up to the present perfect
-- continuous contrasted with "used to", to describe how village life has
-- (or hasn't) changed over time.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A former villager, now living in the city, returns for a family visit after many years. Your English Club is writing his reflections for the school magazine -- comparing how the village used to be with what has been changing there since he left.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: continuity and change$$,
        'body', $$Describing a place that both stays the same and slowly changes needs vocabulary for tradition as well as gradual development.$$,
        'highlights', array[$$unchanged$$, $$to modernise$$, $$a legacy$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$unchanged$$, $$exactly the same as before$$),
            jsonb_build_array($$to modernise$$, $$to make something more up to date$$),
            jsonb_build_array($$a legacy$$, $$something handed down from the past$$),
            jsonb_build_array($$self-reliant$$, $$able to manage without depending on others$$),
            jsonb_build_array($$a landmark$$, $$a recognisable feature or building in a place$$),
            jsonb_build_array($$gradually$$, $$slowly, over a period of time$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Used to + base verb" describes a past state that is no longer true, contrasted with today: The village used to have only one well.$$),
        'example', jsonb_build_object('statement', $$Describe how the village used to be, years ago.$$, 'solution', $$The village used to have no electricity at all.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The road to the village ___ (used to) be a dirt path."$$, 'solution', $$The road to the village used to be a dirt path.$$)
      ),
      jsonb_build_object(
        'heading', $$The present perfect continuous: what has been changing$$,
        'body', $$Some changes in the village are still ongoing right now -- not finished events, but a process that started in the past and continues.$$,
        'highlights', array[$$has been changing$$, $$has been building$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The present perfect continuous (has/have been + verb-ing) describes an ongoing change that started in the past and is still happening: The village has been changing rapidly since the new road opened.$$),
        'example', jsonb_build_object('statement', $$Describe an ongoing change since the visitor last came.$$, 'solution', $$The community has been building a new school since last year.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The village ___ (grow) steadily since the new market opened."$$, 'solution', $$The village has been growing steadily since the new market opened.$$)
      ),
      jsonb_build_object(
        'heading', $$"Used to" vs the present perfect continuous$$,
        'body', $$One describes a finished past that no longer applies, the other describes a change that is still under way -- keeping the two apart is what makes a "then and now" account clear.$$,
        'highlights', array[$$a finished past$$, $$an ongoing change$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "used to" for something true in the past but not now (The village used to have one well). Use the present perfect continuous for a change that began in the past and is still going on (The village has been getting more wells since 2015).$$),
        'example', jsonb_build_object('statement', $$Which fits: "The village used to build new roads" or "The village has been building new roads"?$$, 'solution', $$"The village has been building new roads" fits better if the building is still going on now; "used to" would suggest it has stopped.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct form: "Years ago, the village ___ (used to/has been) relying only on farming."$$, 'solution', $$Years ago, the village used to rely only on farming, because this describes a finished past state.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The returning villager's reflection for the school magazine must compare how the village used to be with what has been changing since he left.$$,
      'questions', array[
        $$Describe one thing the village used to be like, years ago.$$,
        $$Describe one ongoing change using the present perfect continuous.$$,
        $$Explain one tradition that has remained unchanged.$$,
        $$Give your opinion on whether the village's changes are positive or negative.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "The village ___ (used to) have only one primary school."$$,
      'hint', $$A finished past state needs "used to".$$,
      'expected', $$The village used to have only one primary school.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Since the road was built, more families ___ (move) back to the village."$$,
      'hint', $$An ongoing change since a past point needs the present perfect continuous.$$,
      'expected', $$Since the road was built, more families have been moving back to the village.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct form: "The elders ___ (used to/have been) teach the young ones traditional songs, and they still do today."$$,
      'hint', $$Something that started in the past and continues needs the present perfect continuous.$$,
      'expected', $$The elders have been teaching the young ones traditional songs, and they still do today.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Before the well was dug, women ___ (used to) walk two kilometres for water."$$,
      'hint', $$A past habit no longer true today needs "used to".$$,
      'expected', $$Before the well was dug, women used to walk two kilometres for water.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-village';
