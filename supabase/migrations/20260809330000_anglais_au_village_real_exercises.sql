-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 5 LESSON 2: Village life" PDF (S1 listening gap-fill
-- on village-hierarchy vocabulary and superlative-adjective completion;
-- S2 gap-fill on hospitality vocabulary and "prefer X to Y" sentences),
-- rewritten in original wording (never copied verbatim) to mirror the
-- real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Whenever there is a conflict in the village, the chieftain summons everybody under the ___ to solve it. (palaver tree/report card)$$,
    'hint', $$This is the traditional meeting place where village disputes are discussed.$$,
    'expected', $$Whenever there is a conflict in the village, the chieftain summons everybody under the palaver tree to solve it.$$
  ),
  jsonb_build_object(
    'question', $$Complete this sentence with the superlative form: Of all the villages in the region, Assouba is ___ (famous).$$,
    'hint', $$Long adjective: the most + adjective.$$,
    'expected', $$Of all the villages in the region, Assouba is the most famous.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Village populations are usually welcoming and ___, always ready to help strangers. (hospitable/dusty)$$,
    'hint', $$This word describes people who are generous towards visitors.$$,
    'expected', $$Village populations are usually welcoming and hospitable, always ready to help strangers.$$
  ),
  jsonb_build_object(
    'question', $$Use "prefer X to Y" to write a sentence: villagers / to work on their fields / to spend the day watching television$$,
    'hint', $$Subject + prefer + noun/verb-ing + to + noun/verb-ing.$$,
    'expected', $$Villagers prefer working on their fields to spending the day watching television.$$
  )
)
where id = 'anglais-au-village';
