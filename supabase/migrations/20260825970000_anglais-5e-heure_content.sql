-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais.
-- Cours : "Unit 3: Time and Date — Lesson 2: Time is money".
-- Contenu réécrit à partir du PDF source ; vocabulaire, situations et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur WhatsApp, des élèves de 5ème écrivent des messages à leurs amis du Ghana pour parler de leur emploi du temps de la semaine et des heures de leurs activités quotidiennes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: telling the time of day$$,
        'body', $$Key words: schedule (=timetable), noon (=midday, 12 o'clock), midnight (00:00), a.m. (before noon), p.m. (after noon), lunch, dinner, to be busy, in a hurry, to waste time, to be late ≠ to be on time, to take a shower.$$,
        'highlights', array[$$noon = midi (12h) ; midnight = minuit (00h)$$, $$a.m. = avant midi ; p.m. = après-midi$$, $$to be late ≠ to be on time$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "noon" mean?$$, 'solution', $$Midday, 12 o'clock.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing daily schedule$$,
        'body', $$To describe a routine, use the simple present with time expressions: "What do you usually do in the morning? — In the morning, I go to school." Time prepositions: "in" the morning/afternoon/evening, but "at" noon/night/midday/midnight.$$,
        'highlights', array[$$in the morning/afternoon/evening ; at noon/night/midnight$$, $$simple present pour les habitudes$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "What does Mrs Kouadio usually do every morning?" (to go to the market)$$, 'solution', $$She goes to the market.$$),
        'fixation', jsonb_build_object('question', $$Complete: "___ the evening, I watch TV." (in/at)$$, 'solution', $$In.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking the time of daily activities$$,
        'body', $$To ask precisely when something happens: "At what time do you go to school every Monday? — I go to school at 06:30 a.m." This structure works for any routine activity.$$,
        'highlights', array[$$At what time do you...? / I ... at [heure]$$]::text[],
        'fixation', jsonb_build_object('question', $$Ask what time Mr Ndraman goes to bed, knowing the answer is "12 p.m."$$, 'solution', $$What time does Mr Ndraman go to bed? — He goes to bed at 12 p.m.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You chat on the internet with your British pen friend Cole. He tells you about what he does every day.$$,
      'questions', array[
        $$List your daily activities at home and at school.$$,
        $$Specify the time (period) of each activity.$$,
        $$Ask Cole a question about the time he does one of his activities.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What is the opposite of "to be late"?$$,
      'hint', $$It means arriving at the right moment.$$,
      'expected', $$To be on time.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "À quelle heure vas-tu à l'école le lundi ?"$$,
      'hint', $$Use "At what time...".$$,
      'expected', $$At what time do you go to school on Mondays?$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The family has lunch ___ noon." (in/at)$$,
      'hint', $$"Noon" always takes "at".$$,
      'expected', $$at.$$
    ),
    jsonb_build_object(
      'question', $$What does "to waste time" mean?$$,
      'hint', $$It's the opposite of being productive.$$,
      'expected', $$To spend time doing unimportant things.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-heure';
