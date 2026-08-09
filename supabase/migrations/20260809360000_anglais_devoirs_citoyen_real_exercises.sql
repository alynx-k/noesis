-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 6 LESSON 2: My duties" PDF (S1 gap-fill on civic-duty
-- vocabulary and rewriting "must" sentences with "have to"; S2 gap-fill on
-- a second duty-related passage and writing sentences expressing absence
-- of necessity), rewritten in original wording (never copied verbatim) to
-- mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: A responsible citizen must ___ with the laws of the country in order to live in a well-organized society. (comply/blame)$$,
    'hint', $$"To comply with" means "to obey" or "to conform to".$$,
    'expected', $$A responsible citizen must comply with the laws of the country in order to live in a well-organized society.$$
  ),
  jsonb_build_object(
    'question', $$Rewrite this sentence using "have to": "Citizens must pay their taxes."$$,
    'hint', $$Subject + have to/has to + base verb.$$,
    'expected', $$Citizens have to pay their taxes.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Sending children to school and paying an ___ are things which are mandatory for every citizen. (impost/scholarship)$$,
    'hint', $$This word means "a tax".$$,
    'expected', $$Sending children to school and paying an impost are things which are mandatory for every citizen.$$
  ),
  jsonb_build_object(
    'question', $$Write a sentence expressing absence of necessity, using "don't need to": students / cheat in tests to have good marks$$,
    'hint', $$Subject + don't/doesn't need to + base verb.$$,
    'expected', $$Students don't need to cheat in tests to have good marks.$$
  )
)
where id = 'anglais-devoirs-citoyen';
