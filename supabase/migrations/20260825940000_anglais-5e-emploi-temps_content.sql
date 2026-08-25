-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais.
-- Cours : "Unit 1: At School — Lesson 3: What do you want to learn at
-- school?" (Speaking). Contenu réécrit à partir du PDF source ;
-- vocabulaire, situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour faciliter leurs correspondances sur Internet, des élèves de 5ème décrivent leur emploi du temps à leurs amis anglophones et citent leurs matières préférées.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: school subjects and timetable words$$,
        'body', $$Subjects: French, English, biology, history, maths, geography, physics, art, civics, music. Other words: break (=recreation), fun (=interesting), easy ≠ difficult, to resume (=to begin again), to start (=to begin), boring (=not interesting), useful (=important), favourite.$$,
        'highlights', array[$$subjects: French, English, biology, history, maths, geography, physics, art, civics, music$$, $$break=recreation ; easy≠difficult ; boring≠useful/interesting$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the opposite of "easy"?$$, 'solution', $$Difficult.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing habitual actions (the timetable)$$,
        'body', $$To talk about a regular schedule, use the simple present with time prepositions: "We have French before English." "I have break at 10 o'clock." Questions use "What/When do you have...?": "What do you have on Mondays from 7:00 to 8:00?"$$,
        'highlights', array[$$simple present + prepositions of time: before/after/at$$, $$What do you have on [day]? / When do you have [subject]?$$]::text[],
        'example', jsonb_build_object('statement', $$Ask when Zokou has English, knowing the answer is "on Mondays, Wednesdays and Fridays".$$, 'solution', $$When does Zokou have English? — Zokou has English on Mondays, Wednesdays and Fridays.$$),
        'fixation', jsonb_build_object('question', $$Complete: "I have break ___ 10 o'clock."$$, 'solution', $$at.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking and giving opinions about subjects$$,
        'body', $$To ask an opinion: "How do you find English?" To answer: "I think it is easy/difficult." or "I find it easy/difficult." This can be used to talk about any subject: English/easy, Biology/interesting, History/important, Geography/useful.$$,
        'highlights', array[$$How do you find [subject]? / I think it is... / I find it...$$]::text[],
        'fixation', jsonb_build_object('question', $$Answer negatively: "Is English boring?" (it's actually interesting)$$, 'solution', $$No, it isn't. It is interesting.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your Gambian friend Salif calls you and you talk about school subjects and your timetable.$$,
      'questions', array[
        $$Ask him if he has school on Saturdays in Gambia.$$,
        $$Ask him what subjects he has.$$,
        $$Ask him if he finds English difficult, and what subject he finds difficult.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite en anglais trois matières que tu as en classe de 5ème.$$,
      'hint', $$Utilise le vocabulaire des matières scolaires.$$,
      'expected', $$Par exemple : French, English, maths (ou biology, history, geography...).$$
    ),
    jsonb_build_object(
      'question', $$Complete: "A lot of people find Maths ___, not me." (using "difficult")$$,
      'hint', $$C'est l'adjectif donné dans l'exercice source.$$,
      'expected', $$difficult.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Je trouve la biologie intéressante."$$,
      'hint', $$Utilise "I find it...".$$,
      'expected', $$I find biology interesting.$$
    ),
    jsonb_build_object(
      'question', $$What's the opposite of "boring"?$$,
      'hint', $$Pense à ce qui capte l'attention.$$,
      'expected', $$Interesting (fun).$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-emploi-temps';
