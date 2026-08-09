-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 6 LESSON 3: Tolerance" PDF (S1 gap-fill on tolerance
-- vocabulary and turning direct speech into reported speech; S2 gap-fill
-- on a second tolerance-related passage and turning questions into
-- reported speech), rewritten in original wording (never copied verbatim)
-- to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Judging people without knowing them is a form of ___ that endangers social cohesion. (prejudice/mercy)$$,
    'hint', $$This word means "an opinion about someone formed without proof".$$,
    'expected', $$Judging people without knowing them is a form of prejudice that endangers social cohesion.$$
  ),
  jsonb_build_object(
    'question', $$Turn this direct speech into reported speech: "Ivorians are tolerant," the minister said.$$,
    'hint', $$Present -> past simple; add "that".$$,
    'expected', $$The minister said that Ivorians were tolerant.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Everybody should enjoy freedom of ___ so that people of different faiths can live together in peace. (worship/hatred)$$,
    'hint', $$This word refers to the freedom to practise one's religion.$$,
    'expected', $$Everybody should enjoy freedom of worship so that people of different faiths can live together in peace.$$
  ),
  jsonb_build_object(
    'question', $$Turn this direct question into reported speech: "Did you meet the campaign leader?" she wanted to know.$$,
    'hint', $$Use "if" and shift the tense back one step.$$,
    'expected', $$She wanted to know if I had met the campaign leader.$$
  )
)
where id = 'anglais-tolerance';
