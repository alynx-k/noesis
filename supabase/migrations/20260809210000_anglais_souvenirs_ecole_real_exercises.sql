-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 1 LESSON 2: Memories of school" PDF (S1 gap-fill on
-- school-memory vocabulary and "used to" sentences; S2 gap-fill paragraph
-- and reordered "would" sentences), rewritten in original wording (never
-- copied verbatim) to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: Every Monday morning at primary school, we assembled in the yard for the ___ before singing the national anthem.$$,
    'hint', $$This is the ceremony when the national flag is raised.$$,
    'expected', $$Every Monday morning at primary school, we assembled in the yard for the flag-raising before singing the national anthem.$$
  ),
  jsonb_build_object(
    'question', $$Write one sentence with "used to" about something you did at primary school but don't do anymore: (to suck my thumb)$$,
    'hint', $$Subject + used to + base verb.$$,
    'expected', $$I used to suck my thumb when I was at primary school.$$
  ),
  jsonb_build_object(
    'question', $$Complete the sentence with the correct word: The big boys at our school were ___, so the little ones were often afraid of them.$$,
    'hint', $$This word describes someone who brutalises weaker students.$$,
    'expected', $$The big boys at our school used to bully the smaller ones, so the little ones were often afraid of them.$$
  ),
  jsonb_build_object(
    'question', $$Reorder these words to make a meaningful sentence about the past with "would": would / every Sunday / firewood / for the teacher's wife / we / bring$$,
    'hint', $$"Would" here expresses a repeated past habit, like "used to".$$,
    'expected', $$Every Sunday, we would bring firewood for the teacher's wife.$$
  )
)
where id = 'anglais-souvenirs-ecole';
