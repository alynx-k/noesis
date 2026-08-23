-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_UNIT 3_TIME AND DATE_Lesson 2_Writing (What time is it?)".
-- Contenu réécrit à partir du PDF source (Learn it, do it 6è, programme
-- officiel MENA) ; situation d'apprentissage, vocabulaire, dialogues et
-- exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$To make their online correspondence easier, 6ème students at Lycée Moderne 2 de Daloa describe their timetable for an ordinary day to their English-speaking pen pals.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: telling the time$$,
        'body', $$A watch, a clock, a time, midday (noon), midnight, half past, a quarter to. Examples: 12:00 is midday, 24:00 is midnight, 08:30 is half past eight, 09:45 is a quarter to ten, 07:00 is seven o'clock.$$,
        'highlights', array[$$midday (noon) = 12:00 ; midnight = 24:00 or 00:00$$, $$half past + hour ; a quarter to + next hour$$]::text[],
        'fixation', jsonb_build_object('question', $$How do you say 12:00 at night?$$, 'solution', $$Midnight.$$)
      ),
      jsonb_build_object(
        'heading', $$Asking and telling the time$$,
        'body', $$To know the time, we ask: "What time is it?" or "What's the time?" — answers: "It's ten o'clock" / "It's half past nine" / "It's a quarter to eleven" / "It's midday (noon)" / "It's midnight."$$,
        'highlights', array[$$What time is it? / What's the time?$$]::text[],
        'example', jsonb_build_object('statement', $$It is 18:45. Answer: "What time is it?"$$, 'solution', $$"It's a quarter to seven."$$),
        'fixation', jsonb_build_object('question', $$How do you say 11:30?$$, 'solution', $$"It's half past eleven."$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing the near future: "to be going to"$$,
        'body', $$Vocabulary: to eat, breakfast (06:30), lunch (12:00), dinner (18:00), to study, to play, to sleep, to dance. To say that something is about to happen (the near future), we use "to be going to + verb": "The man is going to eat salad." Question: "What is the man going to do?"$$,
        'highlights', array[$$to be going to + verb (base form) = near future$$]::text[],
        'example', jsonb_build_object('statement', $$Alicia is holding a banana, about to eat it. Complete: "Alicia ______ (to eat) a banana."$$, 'solution', $$"Alicia is going to eat a banana."$$),
        'fixation', jsonb_build_object('question', $$Complete: "Thomas ______ (to sleep)." (he is pulling back his bed sheet)$$, 'solution', $$"Thomas is going to sleep."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$To make their correspondence easier, 6ème students at Lycée Moderne 2 de Daloa write a paragraph to their Nigerian pen pals describing actions they are about to carry out.$$,
      'questions', array[
        $$Say the activities you are going to do today.$$,
        $$Give the time at which you are going to do each activity.$$,
        $$Write your paragraph using "to be going to" and the correct times.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Write the time 14:45 in words.$$,
      'hint', $$Use "a quarter to" the next hour.$$,
      'expected', $$"A quarter to three."$$
    ),
    jsonb_build_object(
      'question', $$Write the time 09:55 in words.$$,
      'hint', $$It is five minutes before the next hour.$$,
      'expected', $$"Five to ten."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Ange ______ (to study) his lessons tonight."$$,
      'hint', $$Use "to be going to" for the near future.$$,
      'expected', $$"Ange is going to study his lessons tonight."$$
    ),
    jsonb_build_object(
      'question', $$What structure do we use to talk about something about to happen?$$,
      'hint', $$It starts with "to be".$$,
      'expected', $$"To be going to" + the base form of the verb.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-heure';
