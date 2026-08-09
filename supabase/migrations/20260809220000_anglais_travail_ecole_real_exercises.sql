-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 1 LESSON 3: School work" PDF (S1 vocabulary-definition
-- matching and first-conditional verb practice; S2 matching sentence
-- halves across the three conditional forms), rewritten in original
-- wording (never copied verbatim) to mirror the real exercises'
-- topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Name the school-work word matching this definition: "the document your parents receive from the school at the end of the term, showing all your marks."$$,
    'hint', $$It is not a single test grade -- it lists every subject's results together.$$,
    'expected', $$That word is a report card.$$
  ),
  jsonb_build_object(
    'question', $$Put the verbs in brackets into the correct tense to complete this first conditional sentence: If Kader ___ (revise) his lessons every evening, he ___ (get) better marks.$$,
    'hint', $$if + present simple, ... will + base verb.$$,
    'expected', $$If Kader revises his lessons every evening, he will get better marks.$$
  ),
  jsonb_build_object(
    'question', $$Complete this second-conditional sentence with the correct form: If I ___ (be) the top of the class, my parents ___ (be) very proud.$$,
    'hint', $$Second conditional: if + past simple, ... would + base verb.$$,
    'expected', $$If I were the top of the class, my parents would be very proud.$$
  ),
  jsonb_build_object(
    'question', $$Match the halves to form a correct third-conditional sentence, then write it out in full: "If she hadn't missed so many classes" / "she would have passed her exam."$$,
    'hint', $$Third conditional: if + past perfect, ... would have + past participle.$$,
    'expected', $$If she hadn't missed so many classes, she would have passed her exam.$$
  )
)
where id = 'anglais-travail-ecole';
