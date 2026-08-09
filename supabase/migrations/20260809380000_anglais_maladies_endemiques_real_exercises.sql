-- Exercises re-sourced from the real practice activities in the official
-- ecole-ci.org "UNIT 7 LESSON 1: Is it an epidemic or a pandemic?" PDF (S1
-- vocabulary-definition matching and rewriting sentences with the
-- impersonal passive; S2 gap-fill on symptom vocabulary and asking/
-- answering about the symptoms of a disease), rewritten in original
-- wording (never copied verbatim) to mirror the real exercises'
-- topics/structure/difficulty.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Name the word matching this definition: "a disease that spreads to many countries around the world."$$,
    'hint', $$It is not limited to one region, unlike an epidemic.$$,
    'expected', $$That word is a pandemic.$$
  ),
  jsonb_build_object(
    'question', $$Rewrite this sentence using the impersonal passive: "People believe that malaria is the deadliest endemic disease in Africa."$$,
    'hint', $$Subject + is believed + to be + ...$$,
    'expected', $$Malaria is believed to be the deadliest endemic disease in Africa.$$
  ),
  jsonb_build_object(
    'question', $$Fill in the gap with the correct word: After examining me, the doctor wrote a ___ so that I could buy my medicine at the pharmacy. (prescription/appetite)$$,
    'hint', $$This is the paper on which a doctor writes the details of the medicine you need.$$,
    'expected', $$After examining me, the doctor wrote a prescription so that I could buy my medicine at the pharmacy.$$
  ),
  jsonb_build_object(
    'question', $$Ask and answer about symptoms, using this information: Cholera -- dehydration, vomiting, diarrhea.$$,
    'hint', $$A: What are the symptoms of...? B: When you have..., you have...$$,
    'expected', $$A: What are the symptoms of cholera? B: When you have cholera, you have dehydration, vomiting and diarrhea.$$
  )
)
where id = 'anglais-maladies-endemiques';
