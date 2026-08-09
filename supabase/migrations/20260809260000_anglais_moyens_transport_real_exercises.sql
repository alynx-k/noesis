-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 3 LESSON 1: Different means of transport" PDF (S1
-- picture-identification vocabulary and comparative-sentence building;
-- S2 choosing the correct word/form with "prefer", and a preference
-- dialogue giving reasons), rewritten in original wording (never copied
-- verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Name the means of transport matching this description: "a large vehicle with a trailer, used to carry heavy goods on the road."$$,
    'hint', $$It is not a bus -- it is built for cargo, not passengers.$$,
    'expected', $$That means of transport is a lorry.$$
  ),
  jsonb_build_object(
    'question', $$Compare a camel and a donkey for size, using a comparative of superiority: (camel / donkey / big)$$,
    'hint', $$Short adjective + er + than.$$,
    'expected', $$A camel is bigger than a donkey.$$
  ),
  jsonb_build_object(
    'question', $$Choose the correct form to complete the sentence: Between the coach and the train, I prefer ___ by train because it is more relaxing. (travel/to travel)$$,
    'hint', $$After "prefer", use the to-infinitive here.$$,
    'expected', $$Between the coach and the train, I prefer to travel by train because it is more relaxing.$$
  ),
  jsonb_build_object(
    'question', $$Answer this question giving a reason, using "would rather": "Which means of transport do you prefer, the canoe or the ship?"$$,
    'hint', $$I would rather + base verb + by + means of transport + because...$$,
    'expected', $$I would rather travel by ship because it is safer and more comfortable.$$
  )
)
where id = 'anglais-moyens-transport';
