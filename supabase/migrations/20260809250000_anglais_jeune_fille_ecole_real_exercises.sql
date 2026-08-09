-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 2 LESSON 3: Girls at school?" PDF (S1 matching
-- opposite school-related expressions and giving opinions with "I think
-- that"; S2 vocabulary-definition matching and a gap-fill paragraph about
-- a school prize-giving), rewritten in original wording (never copied
-- verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Give the opposite of this expression: "to be good at (a subject)"$$,
    'hint', $$Think of the expression used for someone who struggles with a subject.$$,
    'expected', $$The opposite of "to be good at" is "to be bad at".$$
  ),
  jsonb_build_object(
    'question', $$Use "I think that" or "I believe that" to give your opinion about this topic: girls and school attendance.$$,
    'hint', $$I think that / I believe that + subject + should + base verb.$$,
    'expected', $$I think that girls should go to school so that they can become independent.$$
  ),
  jsonb_build_object(
    'question', $$Name the word matching this definition: "the money paid to support a student's education so that their family doesn't have to pay the fees."$$,
    'hint', $$It is not the school fees themselves, but help to pay them.$$,
    'expected', $$That word is a scholarship.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Because her father could not pay her ___, Mariam nearly lost her place at the boarding school.$$,
    'hint', $$This is the money families pay for their children to attend school.$$,
    'expected', $$Because her father could not pay her school fees, Mariam nearly lost her place at the boarding school.$$
  )
)
where id = 'anglais-jeune-fille-ecole';
