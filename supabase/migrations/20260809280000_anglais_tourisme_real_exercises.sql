-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 3 LESSON 3: Visiting the USA" PDF (S1 matching
-- American landmarks to their definitions and making suggestions with
-- Let's/Shall we/How about/Why don't we; S2 identifying places from short
-- descriptions and rewriting statements as instructions), rewritten in
-- original wording (never copied verbatim) to mirror the real exercises'
-- topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Name the American landmark matching this definition: "the official residence of the President of the United States."$$,
    'hint', $$It is a famous building, not a monument.$$,
    'expected', $$That landmark is the White House.$$
  ),
  jsonb_build_object(
    'question', $$Make a suggestion using "How about + verb-ing" to propose visiting the Statue of Liberty.$$,
    'hint', $$How about + verb + ing + ...?$$,
    'expected', $$How about visiting the Statue of Liberty?$$
  ),
  jsonb_build_object(
    'question', $$Name the place matching this description: "a huge valley carved into the Rocky Mountains, famous for its size and colours."$$,
    'hint', $$It is a natural site, not a city building.$$,
    'expected', $$That place is the Grand Canyon.$$
  ),
  jsonb_build_object(
    'question', $$Turn this statement into a negative instruction: "You take photos inside the museum."$$,
    'hint', $$Don't + base verb.$$,
    'expected', $$Don't take photos inside the museum.$$
  )
)
where id = 'anglais-tourisme';
