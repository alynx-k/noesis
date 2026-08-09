-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 4 LESSON 1: Modern and traditional clothes" PDF (S1
-- gap-fill with clothing vocabulary and joining ideas with "because"; S2
-- gap-fill with a second set of clothing vocabulary and joining ideas
-- with "in order to"/"so that"), rewritten in original wording (never
-- copied verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: These trousers are far too ___ for me; they hang loose all around my legs. (baggy/tiny)$$,
    'hint', $$This word describes trousers that are very loose and wide.$$,
    'expected', $$These trousers are far too baggy for me; they hang loose all around my legs.$$
  ),
  jsonb_build_object(
    'question', $$Join these two ideas with "because": "Yao prefers wearing kita. / He finds it more original than modern clothes."$$,
    'hint', $$Main idea + because + reason.$$,
    'expected', $$Yao prefers wearing kita because he finds it more original than modern clothes.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Most traditional outfits sold at the market are ___ by local craftsmen, not made by machine.$$,
    'hint', $$This word means "made by hand".$$,
    'expected', $$Most traditional outfits sold at the market are handmade by local craftsmen, not made by machine.$$
  ),
  jsonb_build_object(
    'question', $$Join these two ideas with "in order to": "The tailor sewed a new kita. / He wanted his daughter to wear it at the ceremony."$$,
    'hint', $$Main clause + in order to + base verb.$$,
    'expected', $$The tailor sewed a new kita in order to let his daughter wear it at the ceremony.$$
  )
)
where id = 'anglais-vetements';
