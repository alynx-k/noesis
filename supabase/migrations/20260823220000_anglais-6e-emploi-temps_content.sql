-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_UNIT 3_TIME AND DATE_Lesson 3_Writing (I have English at 8
-- o'clock)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$To get to know each other better, 6ème students at Lycée Moderne 2 de Daloa write to their Liberian pen pals to describe their timetable for an ordinary week.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$School subjects and vocabulary$$,
        'body', $$English, French, Maths, History-Geography, Physics, Biology, Physical Training, Civics, Arts, German, Spanish. A timetable shows classes for each day. A "break" is a short pause between classes.$$,
        'highlights', array[$$English, French, Maths, History-Geography, Physics, Biology$$, $$Physical Training, Civics, Arts, German, Spanish$$]::text[],
        'fixation', jsonb_build_object('question', $$What do we call a short pause between two classes?$$, 'solution', $$A break.$$)
      ),
      jsonb_build_object(
        'heading', $$Using prepositions of time$$,
        'body', $$Use "in" for the year, the morning, the afternoon, the month: "My sister goes to school in the morning." Use "at" for a precise time, night, midday, noon: "I have Physical Training at 16 o'clock." Use "on" for days: "We have English on Mondays."$$,
        'highlights', array[$$in + morning/afternoon/month/year$$, $$at + precise time/night/midday/noon$$, $$on + day(s)$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "We have Maths ______ Tuesdays."$$, 'solution', $$"We have Maths on Tuesdays."$$),
        'fixation', jsonb_build_object('question', $$Which preposition goes with a precise clock time, like "8 o'clock"?$$, 'solution', $$"At" — "I study English at 8 o'clock."$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing frequency$$,
        'body', $$Adverbs of frequency: always (all the time), often (frequently), sometimes (on some occasions), never (not at any time). "On Saturdays" means "every Saturday." Example: "Aliman always takes a bath. She often goes to school. She sometimes goes shopping. She washes clothes on Saturdays. She never plays tennis."$$,
        'highlights', array[$$always > often > sometimes > never (frequency scale)$$, $$on + day (plural) = every [day]$$]::text[],
        'example', jsonb_build_object('statement', $$Someone does an activity every single day without exception. Which adverb of frequency fits?$$, 'solution', $$"Always."$$),
        'fixation', jsonb_build_object('question', $$Which adverb means "not at any time"?$$, 'solution', $$"Never."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$As part of the collaboration between the English Club of Collège Moderne 2 de Daloa and Rawlings Grammar School in Tema (Ghana), the visiting students' president asks 6ème students to describe their class timetable in a short paragraph.$$,
      'questions', array[
        $$Name the subjects you study at school.$$,
        $$Fill in a blank timetable with your own subjects for each day and time slot.$$,
        $$Describe your timetable in five lines, saying how often you have English, Civics, and French, using adverbs of frequency.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "My sister goes to school ______ the morning."$$,
      'hint', $$Use the preposition for parts of the day.$$,
      'expected', $$"My sister goes to school in the morning."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "We have French class ______ Wednesdays."$$,
      'hint', $$Use the preposition for days.$$,
      'expected', $$"We have French class on Wednesdays."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "I ______ (always/never) speak English in class." (choose the word meaning "all the time")$$,
      'hint', $$Pick the adverb meaning "every time, without exception".$$,
      'expected', $$"I always speak English in class."$$
    ),
    jsonb_build_object(
      'question', $$Write the time 10:50 in words.$$,
      'hint', $$It is ten minutes before the next hour.$$,
      'expected', $$"Ten to eleven."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-emploi-temps';
