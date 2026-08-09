-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 1
-- LESSON 2: Memories of School" PDF (used to / would for past habits), but
-- every sentence, name, and exercise is an original rewrite. Content is in
-- English (immersion), UI chrome stays French.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$The English Club at your school is preparing a special assembly about "Primary School Memories". Before the big day, your teacher asks the class to practice describing routines and habits from their primary school years, using the correct past tense forms.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: school-day routines$$,
        'body', $$Talking about your primary school years means describing routines you no longer follow today: what you had to do every morning, and how classmates sometimes behaved.$$,
        'highlights', array[$$memories$$, $$to queue up$$, $$to bully$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$memories$$, $$things from the past that you remember$$),
            jsonb_build_array($$to queue up$$, $$to line up in a row, one behind another$$),
            jsonb_build_array($$flag-raising$$, $$the ceremony of lifting the national flag$$),
            jsonb_build_array($$national anthem$$, $$the official song of a country$$),
            jsonb_build_array($$to bully$$, $$to hurt or frighten someone weaker$$),
            jsonb_build_array($$to weep$$, $$to cry$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$We use "used to + base verb" to talk about habits or repeated actions that happened in the past but don't happen anymore. Questions and negatives use "did": Did you use to...? / I didn't use to....$$),
        'example', jsonb_build_object('statement', $$Did you use to queue up before class at primary school?$$, 'solution', $$Yes, I did. We used to queue up every morning before entering the classroom.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: At primary school, we ___ (queue up) every morning before the flag-raising ceremony.$$, 'solution', $$At primary school, we used to queue up every morning before the flag-raising ceremony.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: discipline at school$$,
        'body', $$Primary school routines were sometimes strict. This vocabulary describes the discipline pupils faced and the value they place on their happiest memories.$$,
        'highlights', array[$$compulsory$$, $$to whip$$, $$to cherish$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$compulsory$$, $$obligatory; something you must do$$),
            jsonb_build_array($$to stand to attention$$, $$to stand completely still, without moving$$),
            jsonb_build_array($$to snatch away$$, $$to take something suddenly and by force$$),
            jsonb_build_array($$challenging$$, $$difficult$$),
            jsonb_build_array($$to whip$$, $$to beat someone severely$$),
            jsonb_build_array($$to cherish$$, $$to love and value something deeply$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$We also use "would + base verb" to describe repeated past actions (not states). It works like "used to" for habits, but only for actions, not for describing how someone was or what they had.$$),
        'example', jsonb_build_object('statement', $$What would the teacher do every Friday afternoon?$$, 'solution', $$Every Friday afternoon, the teacher would tell us an old story before we went home.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: Every morning before class, the headmaster ___ (stand) at the gate to check our uniforms.$$, 'solution', $$Every morning before class, the headmaster would stand at the gate to check our uniforms.$$)
      ),
      jsonb_build_object(
        'heading', $$"Used to" or "would": what's the difference?$$,
        'body', $$"Used to" and "would" both describe repeated past habits, but only "used to" can describe a past state -- how someone or something was, or what they had -- while "would" works only for repeated actions.$$,
        'highlights', array[$$a past state$$, $$a repeated action$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "used to" for both states (I used to be shy / We used to have a small school) and repeated actions (We used to sing every morning). Use "would" only for repeated actions (We would sing every morning) -- never for states: you cannot say "I would be shy."$$),
        'example', jsonb_build_object('statement', $$Which sentence is correct: "Our school would be very small." or "Our school used to be very small."?$$, 'solution', $$"Our school used to be very small" is correct, because "be small" describes a state, and "would" cannot be used for states.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct verb form: "When I was young, I ___ (used to/would) have long hair."$$, 'solution', $$When I was young, I used to have long hair -- because "have long hair" describes a state, not a repeated action.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your school is holding an "Old Pupils Day" where former students come back to share memories with the youngest classes. A young pupil named Aïcha asks you to describe what your own primary school days were like.$$,
      'questions', array[
        $$Give the name and location of your primary school.$$,
        $$Describe two things you used to do every morning before class.$$,
        $$Describe one thing your teachers or classmates would do regularly.$$,
        $$Explain whether you cherish these memories, and why.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: Every Monday, all the pupils ___ (sing) the national anthem in the schoolyard.$$,
      'hint', $$Use "used to" or "would" with the base verb for a repeated past action.$$,
      'expected', $$Every Monday, all the pupils used to sing (or would sing) the national anthem in the schoolyard.$$
    ),
    jsonb_build_object(
      'question', $$Turn this sentence into a question: "You used to queue up before class."$$,
      'hint', $$Move "did" to the front and remove "used" back to the base form.$$,
      'expected', $$Did you use to queue up before class?$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct form: "Our headmaster ___ (used to/would) be very strict."$$,
      'hint', $$Remember: "would" cannot describe a past state.$$,
      'expected', $$Our headmaster used to be very strict, because "be strict" describes a state.$$
    ),
    jsonb_build_object(
      'question', $$Complete the negative sentence: "When I was at primary school, I ___ (not/bully) anyone."$$,
      'hint', $$Use "didn't use to" for a negative past habit.$$,
      'expected', $$When I was at primary school, I didn't use to bully anyone.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-souvenirs-ecole';
