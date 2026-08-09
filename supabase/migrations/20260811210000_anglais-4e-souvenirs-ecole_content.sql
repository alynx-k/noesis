-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806260000_anglais_souvenirs_ecole_content.sql, the 3ème equivalent,
-- for the CourseContentV2 shape). 3ème covered "used to / would" for past
-- habits; this 4ème lesson steps up to the past perfect combined with the
-- past simple, to look back even further within school memories, plus "It
-- was the first time (that) + past perfect".
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school is publishing an "Old Pupils" booklet where former students look back on their primary-school years. Your English teacher wants your entry to go further than habits: she wants you to explain what had already happened before certain memorable school moments.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: turning points at school$$,
        'body', $$Looking back on school memories often means recalling a single event that changed how you felt -- your first day, a prize, an exam result.$$,
        'highlights', array[$$a turning point$$, $$to sit an exam$$, $$to be awarded$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a turning point$$, $$a moment when something important changes$$),
            jsonb_build_array($$to sit an exam$$, $$to take a formal test$$),
            jsonb_build_array($$to be awarded$$, $$to be given a prize or honour officially$$),
            jsonb_build_array($$to struggle (with something)$$, $$to find something difficult$$),
            jsonb_build_array($$to catch up$$, $$to reach the same level as others after falling behind$$),
            jsonb_build_array($$proud$$, $$feeling pleased and satisfied about an achievement$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The past perfect (had + past participle) places one school memory clearly before another: By the time I sat the exam, I had already caught up with the rest of the class.$$),
        'example', jsonb_build_object('statement', $$What had happened before you finally passed the exam?$$, 'solution', $$Before I finally passed the exam, I had failed it twice.$$),
        'fixation', jsonb_build_object('question', $$Put the verb into the past perfect: "When the results came out, Fatou realised she ___ (study) hard enough."$$, 'solution', $$When the results came out, Fatou realised she had studied hard enough.$$)
      ),
      jsonb_build_object(
        'heading', $$"It was the first time..."$$,
        'body', $$One special way to describe a memorable first experience combines "the first time" with the past perfect, to show nothing like it had happened before.$$,
        'highlights', array[$$the first time$$, $$never before$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"It was the first time (that) + subject + had + past participle" shows an experience had never happened before that moment: It was the first time I had ever stood in front of the whole school.$$),
        'example', jsonb_build_object('statement', $$Describe your first prize-giving ceremony using this structure.$$, 'solution', $$It was the first time I had ever received a prize in front of my classmates.$$),
        'fixation', jsonb_build_object('question', $$Complete: "It was the first time she ___ (win) a school competition."$$, 'solution', $$It was the first time she had won a school competition.$$)
      ),
      jsonb_build_object(
        'heading', $$Past simple or past perfect: which comes first?$$,
        'body', $$In a memory that involves two past events, choosing the right tense shows your listener which event happened earlier.$$,
        'highlights', array[$$the earlier event$$, $$the later event$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the past perfect for the event that happened first, and the past simple for the event that followed it: I had studied hard, so I passed the exam easily. If only one event is mentioned, the past simple alone is usually enough.$$),
        'example', jsonb_build_object('statement', $$Which comes first: "she had practised" or "she performed"?$$, 'solution', $$"She had practised" comes first, in the past perfect; "she performed" is the later event, in the past simple.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct tenses: "By the time the teacher ___ (arrive), the pupils ___ (already/finish) the exercise."$$, 'solution', $$By the time the teacher arrived, the pupils had already finished the exercise.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your entry for the "Old Pupils" school booklet must describe one turning-point memory from your primary school years, showing clearly what had happened before it.$$,
      'questions', array[
        $$Describe the turning-point moment itself, using the past simple.$$,
        $$Explain, using the past perfect, what had happened before that moment.$$,
        $$Say whether it was the first time something like this had happened to you.$$,
        $$Explain how that memory still affects you today.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Put the verb into the past perfect: "When the headmaster called her name, Aïcha ___ (never/win) a prize before."$$,
      'hint', $$"Never" + had + past participle shows this had not happened before that moment.$$,
      'expected', $$When the headmaster called her name, Aïcha had never won a prize before.$$
    ),
    jsonb_build_object(
      'question', $$Complete using "It was the first time": (I / speak / in front of the whole school)$$,
      'hint', $$It was the first time + subject + had + past participle.$$,
      'expected', $$It was the first time I had spoken in front of the whole school.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct tenses: "By the time the exam ___ (start), Yao ___ (already/finish) revising."$$,
      'hint', $$The earlier action needs the past perfect.$$,
      'expected', $$By the time the exam started, Yao had already finished revising.$$
    ),
    jsonb_build_object(
      'question', $$Combine into one sentence: "She failed the test twice." / "She finally passed it."$$,
      'hint', $$Use the past perfect for the earlier failures, past simple for passing.$$,
      'expected', $$She had failed the test twice before she finally passed it.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-souvenirs-ecole';
