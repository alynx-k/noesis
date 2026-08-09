-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 5 LESSON 1: In the city" PDF (S1 listening gap-fill
-- on city vocabulary and "would prefer" sentences; S2 "would rather"
-- sentence rewriting and a passage on the advantages/disadvantages of
-- city life), rewritten in original wording (never copied verbatim) to
-- mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: International ___ create many job opportunities for people who move to the city. (firms/railways)$$,
    'hint', $$This word means "companies".$$,
    'expected', $$International firms create many job opportunities for people who move to the city.$$
  ),
  jsonb_build_object(
    'question', $$Use the information to write a sentence expressing preference: city dwellers / to live in a flat / to live in a house$$,
    'hint', $$Subject + would prefer + to-infinitive + rather than + to-infinitive.$$,
    'expected', $$City dwellers would prefer to live in a flat rather than to live in a house.$$
  ),
  jsonb_build_object(
    'question', $$Rewrite this sentence using "would rather": "Adjoua prefers to spend her weekends at the mall."$$,
    'hint', $$Subject + would rather + base verb.$$,
    'expected', $$Adjoua would rather spend her weekends at the mall.$$
  ),
  jsonb_build_object(
    'question', $$Name one disadvantage of city life and write it as a full sentence, based on problems like traffic and pollution.$$,
    'hint', $$Think about what heavy traffic does to the air.$$,
    'expected', $$One disadvantage of city life is that the traffic is heavy and the air is polluted.$$
  )
)
where id = 'anglais-a-la-ville';
