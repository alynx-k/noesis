-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 6 LESSON 1: My rights" PDF (S1 choosing the correct
-- word for sentences about the constitution and law, and building
-- opinion sentences; S2 choosing the correct word among near-homophones,
-- and writing "have the right to" sentences), rewritten in original
-- wording (never copied verbatim) to mirror the real exercises'
-- topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Choose the correct word to complete the sentence: Arresting someone without any reason goes against the ___ of our country. (constitution/citizenship)$$,
    'hint', $$This word means "the fundamental written law of a country".$$,
    'expected', $$Arresting someone without any reason goes against the constitution of our country.$$
  ),
  jsonb_build_object(
    'question', $$Build a sentence expressing opinion from this idea: the police / to enforce the law$$,
    'hint', $$I think that + subject + should/must + base verb.$$,
    'expected', $$I think that the police should enforce the law.$$
  ),
  jsonb_build_object(
    'question', $$Choose the correct word to complete the sentence: Every citizen who respects the law should be able to ___ education without discrimination. (sit for/fit for/stick for)$$,
    'hint', $$"To sit for" a test or a competition means "to be a candidate for it".$$,
    'expected', $$Every citizen who respects the law should be able to sit for education without discrimination.$$
  ),
  jsonb_build_object(
    'question', $$Write a sentence about rights, using the idea below: passengers / not / to smoke / in a plane$$,
    'hint', $$Subject + don't have the right to + base verb.$$,
    'expected', $$Passengers don't have the right to smoke in a plane.$$
  )
)
where id = 'anglais-droits-citoyen';
