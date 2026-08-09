-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 2 LESSON 2: What are women's rights and duties?" PDF
-- (S1 identifying which right a quoted opinion defends, and asking/
-- answering "which right...?"; S2 sorting rights from duties, and joining
-- sentence halves), rewritten in original wording (never copied verbatim)
-- to mirror the real exercises' topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Read this opinion and name the right it defends: Adjoua says, "I should be paid the same salary as a man for the same diploma and the same job."$$,
    'hint', $$Think of the right that concerns equal treatment between men and women at work.$$,
    'expected', $$Adjoua is defending the right to equal pay / gender equality at work.$$
  ),
  jsonb_build_object(
    'question', $$Ask and answer a question about the right below, using "have the right to": Fatou says, "Let me choose which candidate to vote for."$$,
    'hint', $$Which right is Fatou fighting for? -> She has the right to...$$,
    'expected', $$Which right is Fatou fighting for? Fatou has the right to vote.$$
  ),
  jsonb_build_object(
    'question', $$Say whether this statement describes a right or a duty: "Provide clean housing and food for your children."$$,
    'hint', $$Compare it with "I have the right to..." versus "It's my duty to...".$$,
    'expected', $$It is a duty: it's a mother's duty to provide clean housing and food for her children.$$
  ),
  jsonb_build_object(
    'question', $$Complete this sentence expressing a duty: "It's a mother's duty ___ (vaccinate) her children when they are sick."$$,
    'hint', $$It's + someone's + duty + to + base verb.$$,
    'expected', $$It's a mother's duty to vaccinate her children when they are sick.$$
  )
)
where id = 'anglais-droits-devoirs-femme';
