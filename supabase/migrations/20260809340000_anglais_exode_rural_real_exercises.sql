-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 5 LESSON 3: Rural exodus" PDF (S1 gap-fill on rural-
-- exodus vocabulary and reordering words into cause/consequence
-- sentences; S2 gap-fill on policy vocabulary and making suggestions to
-- fight the phenomenon), rewritten in original wording (never copied
-- verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Many young people leave their village because of the ___ of job opportunities there. (lack/increase)$$,
    'hint', $$This word means "an absence or insufficiency of something".$$,
    'expected', $$Many young people leave their village because of the lack of job opportunities there.$$
  ),
  jsonb_build_object(
    'question', $$Reorder these words to make a sentence expressing cause: villagers / poverty / their fields / leave / (because of)$$,
    'hint', $$Main clause + because of + noun phrase.$$,
    'expected', $$Villagers leave their fields because of poverty.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: The government wants to ___ the problem of rural exodus by creating new jobs in the countryside. (tackle/whip)$$,
    'hint', $$This word means "to deal with a difficult problem".$$,
    'expected', $$The government wants to tackle the problem of rural exodus by creating new jobs in the countryside.$$
  ),
  jsonb_build_object(
    'question', $$Make a suggestion for this situation using "could": village women need support to start small businesses.$$,
    'hint', $$Subject + could + base verb.$$,
    'expected', $$The government could empower village women to start small businesses.$$
  )
)
where id = 'anglais-exode-rural';
