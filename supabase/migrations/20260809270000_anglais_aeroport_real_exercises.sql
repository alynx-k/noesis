-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 3 LESSON 2: Travelling by plane" PDF (S1 building
-- double-comparative sentences about airports; S2 filling an airport
-- narrative with the right vocabulary word and rewriting sentences with
-- "so" to emphasize feelings), rewritten in original wording (never
-- copied verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Make a sentence with a double comparative of superiority: (plane tickets / expensive)$$,
    'hint', $$Long adjective: more and more + adjective.$$,
    'expected', $$Plane tickets are more and more expensive.$$
  ),
  jsonb_build_object(
    'question', $$Make a sentence with a double comparative of superiority: (departure lounges / crowded)$$,
    'hint', $$Short adjective: adjective-er and adjective-er.$$,
    'expected', $$Departure lounges are more crowded and more crowded these days.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct airport word: Before boarding, the flight attendant checked my passport and my ___ at the gate.$$,
    'hint', $$This document proves you have paid for your seat.$$,
    'expected', $$Before boarding, the flight attendant checked my passport and my ticket at the gate.$$
  ),
  jsonb_build_object(
    'question', $$Rewrite this sentence using "so" to emphasize the feeling: "Kader was nervous before his first flight."$$,
    'hint', $$"So" + adjective means "very" or "really".$$,
    'expected', $$Kader was so nervous before his first flight.$$
  )
)
where id = 'anglais-aeroport';
