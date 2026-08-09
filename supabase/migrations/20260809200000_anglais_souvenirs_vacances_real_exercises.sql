-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 1 LESSON 1: My first holiday in my village" PDF
-- (S1 gap-fill on holiday-activity vocabulary, adverb-of-time selection,
-- and a past-simple dialogue; S2 sequence-word narrative), rewritten in
-- original wording (never copied verbatim) to mirror the real exercises'
-- topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct holiday-activity verb: Last holidays, Kouassi ___ (pay) a visit to his uncle in Bouaflé.$$,
    'hint', $$"To pay a visit" means to go and see someone; put the verb in the past simple.$$,
    'expected', $$Last holidays, Kouassi paid a visit to his uncle in Bouaflé.$$
  ),
  jsonb_build_object(
    'question', $$Choose the correct word to complete the sentence: Aya travelled to her village (on/in/last) 2019.$$,
    'hint', $$"In" is used with a year.$$,
    'expected', $$Aya travelled to her village in 2019.$$
  ),
  jsonb_build_object(
    'question', $$Complete this mini-dialogue by putting the verb in brackets into the past simple: A: Where (be) you last holidays? B: I (go) to my grandmother's village.$$,
    'hint', $$"be" becomes "were" with "you"; "go" is irregular in the past.$$,
    'expected', $$A: Where were you last holidays? B: I went to my grandmother's village.$$
  ),
  jsonb_build_object(
    'question', $$Join these three actions into one sentence using two sequence words (first, then, after that, finally): "We arrived at the village. We greeted our grandmother. We ate a big meal."$$,
    'hint', $$Use one sequence word for the first action and another for the last.$$,
    'expected', $$First, we arrived at the village. Then, we greeted our grandmother. Finally, we ate a big meal.$$
  )
)
where id = 'anglais-souvenirs-vacances';
