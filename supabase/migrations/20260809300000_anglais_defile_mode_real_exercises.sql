-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 4 LESSON 2: Fashion show" PDF (S1 vocabulary-
-- definition matching and classifying sentences as persuading or
-- dissuading; S2 gap-fill with fashion-show vocabulary and writing
-- like/dislike sentences), rewritten in original wording (never copied
-- verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Name the word matching this definition: "a woman whose job is to sew and make clothes."$$,
    'hint', $$This is not a fashion designer -- she makes the clothes with her own hands.$$,
    'expected', $$That word is a seamstress.$$
  ),
  jsonb_build_object(
    'question', $$Say whether this sentence is persuading or dissuading: "You mustn't wear that wig; it really doesn't suit you."$$,
    'hint', $$Does the speaker encourage or discourage the action?$$,
    'expected', $$It is dissuading, because the speaker discourages the person from wearing the wig.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: The designer's new ready-to-wear collection went down the ___ to loud applause. (catwalk/lipstick)$$,
    'hint', $$This is the stage on which models parade during a fashion show.$$,
    'expected', $$The designer's new ready-to-wear collection went down the catwalk to loud applause.$$
  ),
  jsonb_build_object(
    'question', $$Write a sentence expressing a like, using "crazy about": (my cousin / wearing bright colours)$$,
    'hint', $$Subject + to be + crazy about + verb-ing.$$,
    'expected', $$My cousin is crazy about wearing bright colours.$$
  )
)
where id = 'anglais-defile-mode';
