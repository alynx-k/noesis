-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 4 LESSON 3: Be proud of your skin colour" PDF (S1
-- vocabulary-definition matching and giving advice by choosing the right
-- option; S2 gap-fill about the risks of bleaching creams and sorting
-- situations into prohibition/permission), rewritten in original wording
-- (never copied verbatim) to mirror the real exercises'
-- topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Name the cosmetic product matching this definition: "a cream used to make the skin less dry."$$,
    'hint', $$This is not a perfume -- it is used mainly to hydrate the skin.$$,
    'expected', $$That product is a moisturizer.$$
  ),
  jsonb_build_object(
    'question', $$Give advice by choosing the right option: What should Willy do? (wear extravagant clothes at school / wear authorized clothes at school)$$,
    'hint', $$You should + base verb.$$,
    'expected', $$You should wear authorized clothes at school.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Doctors warn that the excessive use of skin-bleaching products can be ___ because it exposes users to serious diseases. (harmful/beautiful)$$,
    'hint', $$This word means "dangerous".$$,
    'expected', $$Doctors warn that the excessive use of skin-bleaching products can be harmful because it exposes users to serious diseases.$$
  ),
  jsonb_build_object(
    'question', $$Say whether this situation belongs to prohibition or permission, and write the matching sentence with "should"/"shouldn't": bleaching your skin$$,
    'hint', $$Is this something the text encourages or warns against?$$,
    'expected', $$It is a prohibition: you shouldn't bleach your skin.$$
  )
)
where id = 'anglais-produits-cosmetiques';
