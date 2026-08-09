-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 7 LESSON 3: HIV-free generation" PDF (S1 gap-fill on
-- HIV/AIDS transmission vocabulary and answering question tags; S2
-- gap-fill on symptom/prevention vocabulary and giving advice with must/
-- mustn't), rewritten in original wording (never copied verbatim) to
-- mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: A patient who has lost a lot of blood after an accident may need a ___. (blood transfusion/hair gel)$$,
    'hint', $$This is the process of putting someone else's blood into a patient's body.$$,
    'expected', $$A patient who has lost a lot of blood after an accident may need a blood transfusion.$$
  ),
  jsonb_build_object(
    'question', $$Answer this question tag with a full sentence: "You can catch AIDS from blood transfusion, can't you?"$$,
    'hint', $$Yes, + subject + can, + short explanation.$$,
    'expected', $$Yes, you can. That is why blood must always be tested before a transfusion.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: A person infected with HIV often ___ and becomes thinner and thinner over time. (loses weight/gains weight)$$,
    'hint', $$This expression means "becomes thinner".$$,
    'expected', $$A person infected with HIV often loses weight and becomes thinner and thinner over time.$$
  ),
  jsonb_build_object(
    'question', $$Give advice with "mustn't" for this situation: sharing the same shaver with someone else.$$,
    'hint', $$Subject + mustn't + base verb.$$,
    'expected', $$You mustn't share the same shaver with someone else.$$
  )
)
where id = 'anglais-vih-sida';
