-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle course id 1389 [category 43 catalog "6è_UNIT 2_AT HOME_Lesson
-- 2_Speaking (A Sunday with my family)"]. Note: the real lesson at this
-- position in the official sequence covers daily home activities and verb
-- tenses (not room names specifically), so this migration keeps the
-- catalog's "Les pièces d'une maison" slot but sources the actual next
-- real lesson content available on the platform (daily routines at home).
-- Contenu réécrit à partir du PDF source (Learn it, do it 6è, programme
-- officiel MENA) ; vocabulaire, dialogues et exercices reformulés, non
-- copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Zon, a 5ème student, talks on the phone with his English-speaking pen pal. They talk about what they do at home on days when they don't go to school, to learn more about each other's daily habits.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: daily activities at home$$,
        'body', $$To brush one's teeth, to put on makeup, to shave, a bed sheet, a blanket, to switch on/off the light, to sweep, to make one's bed.$$,
        'highlights', array[$$to brush one's teeth, to shave, to put on makeup$$, $$to switch on/off the light, to sweep, to make one's bed$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call the piece of cloth that covers a bed, under the blanket?$$, 'solution', $$A bed sheet.$$)
      ),
      jsonb_build_object(
        'heading', $$Describing ongoing vs. habitual actions$$,
        'body', $$The present continuous describes an action happening right now: "Awa is making her bed" (she is doing it at this moment). The simple present describes a habit or routine: "She makes her bed every morning" (she does this regularly).$$,
        'highlights', array[$$present continuous (is/are + -ing) = happening now$$, $$simple present = habit, routine (every day/morning...)$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "Every day I ______ (to take) a shower before going to school."$$, 'solution', $$"Every day I take a shower before going to school." (simple present, habitual action)$$),
        'fixation', jsonb_build_object('question', $$Which tense do you use for "My parents are in the living room, they ___ (to look) at the TV set" (happening right now)?$$, 'solution', $$Present continuous: "they are looking at the TV set."$$)
      ),
      jsonb_build_object(
        'heading', $$Describing past actions: simple past$$,
        'body', $$More vocabulary: to learn, to revise, to go to church, to go to the mosque, to pray, to go fishing, to wash the dishes, to read a newspaper. To ask what someone did in the past: "What did you do last weekend?" — answer: "I visited my grandparents" (simple past).$$,
        'highlights', array[$$What did you do last weekend? → I + past tense verb$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "What did you do last Saturday?" (you played football)$$, 'solution', $$"Last Saturday I played football."$$),
        'fixation', jsonb_build_object('question', $$Complete: "Adama ______ (to shave) his head last week."$$, 'solution', $$"Adama shaved his head last week."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your Ghanaian friend calls you on WhatsApp. He asks what you do every weekend, and what you did last week. Your English teacher then asks you to tell your classmates what you said.$$,
      'questions', array[
        $$Say what you do on Saturdays and Sundays: in the morning, in the afternoon, and in the evening.$$,
        $$Say what you did last Sunday, Tuesday, Wednesday, Thursday and Friday.$$,
        $$Use both the simple present (for habits) and the simple past (for what already happened) correctly.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "My sister and I always ______ (to make) our bed ourselves."$$,
      'hint', $$"Always" signals a habitual action — use the simple present.$$,
      'expected', $$"My sister and I always make our bed ourselves."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Before she went out, my aunt ______ (to take) her umbrella."$$,
      'hint', $$This describes a completed past action.$$,
      'expected', $$"Before she went out, my aunt took her umbrella."$$
    ),
    jsonb_build_object(
      'question', $$What is the question form to ask what someone did last weekend?$$,
      'hint', $$Use "did" as the auxiliary.$$,
      'expected', $$"What did you do last weekend?"$$
    ),
    jsonb_build_object(
      'question', $$Is "she makes her bed every morning" describing a habit or an action happening right now?$$,
      'hint', $$Look at "every morning".$$,
      'expected', $$A habit (simple present, habitual action).$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-pieces-maison';
