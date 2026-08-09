-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 1
-- LESSON 3: School work" PDF (the three conditional forms), but every
-- sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A group of students at your school just got back their maths test results. Some did very well, others didn't, and now they're discussing what they could have done differently -- and what they will do differently next time.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: school-work words$$,
        'body', $$Before discussing test results in English, you need the words for the documents and events tied to your schoolwork.$$,
        'highlights', array[$$a mock exam$$, $$a report card$$, $$a homework$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a test$$, $$a short exam that checks what you have learned$$),
            jsonb_build_array($$a grade / a mark$$, $$the number or letter that shows how well you did$$),
            jsonb_build_array($$a mock exam$$, $$a practice exam that prepares you for the real one$$),
            jsonb_build_array($$a report card$$, $$the document showing all your grades for the term$$),
            jsonb_build_array($$a class presentation$$, $$a talk you prepare and give in front of the class$$),
            jsonb_build_array($$a homework$$, $$work the teacher gives you to do at home$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The first conditional describes a real possibility in the future: If + present simple, ... will + base verb. It says what will happen if a likely condition is met.$$),
        'example', jsonb_build_object('statement', $$If Kader revises every evening, what will happen to his grades?$$, 'solution', $$If Kader revises every evening, his grades will improve.$$),
        'fixation', jsonb_build_object('question', $$Fill the gaps: If she ___ (study) hard, she ___ (pass) the mock exam.$$, 'solution', $$If she studies hard, she will pass the mock exam.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: reacting to results$$,
        'body', $$Once the grades are out, everyone reacts differently -- some complain, some improve, and the teacher has words for both.$$,
        'highlights', array[$$to grumble$$, $$to improve$$, $$to congratulate$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to grumble$$, $$to complain; to say you are not happy about something$$),
            jsonb_build_array($$to improve$$, $$to become better than before$$),
            jsonb_build_array($$to congratulate$$, $$to tell someone you are happy about their success$$),
            jsonb_build_array($$to make a mistake$$, $$to do something incorrectly$$),
            jsonb_build_array($$to miss class$$, $$to be absent from a lesson$$),
            jsonb_build_array($$to cheat$$, $$to break the rules to get a better result unfairly$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The second conditional talks about something unreal or unlikely in the present: If + past simple, ... would + base verb. The third conditional talks about something impossible now because the past is already over: If + past perfect, ... would have + past participle.$$),
        'example', jsonb_build_object('statement', $$If you were the teacher, what would you do with a student who cheats? If Awa had studied harder last term, what would have happened?$$, 'solution', $$If I were the teacher, I would talk to the student privately. If Awa had studied harder last term, she would have passed the exam.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct form: "If he ___ (not/miss) so many classes last year, he ___ (not/fail) the exam." (talking about last year, which is finished)$$, 'solution', $$If he hadn't missed so many classes last year, he wouldn't have failed the exam -- third conditional, because the situation is in the finished past.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparing the three conditional forms$$,
        'body', $$English has three main ways to talk about "if" situations, and choosing the right one depends only on how real or how finished the situation is.$$,
        'highlights', array[$$real possibility$$, $$unreal present$$, $$impossible past$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Form$$, $$If-clause$$, $$Result clause$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$First (real possibility)$$, $$if + present simple$$, $$will + base verb$$),
            jsonb_build_array($$Second (unreal present)$$, $$if + past simple$$, $$would + base verb$$),
            jsonb_build_array($$Third (impossible past)$$, $$if + past perfect$$, $$would have + past participle$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Turn this sentence into the second conditional: "If I have time, I will help you." (imagine you don't actually have time)$$, 'solution', $$If I had time, I would help you.$$),
        'fixation', jsonb_build_object('question', $$Which conditional form fits: "If you ___ (work) harder next term, you ___ (get) better results." (a real possibility about the future)$$, 'solution', $$If you work harder next term, you will get better results -- first conditional.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your classmate Nadège has been struggling with her grades all term and feels discouraged before the final exams. As her friend, you want to motivate her using conditional sentences.$$,
      'questions', array[
        $$Tell her what would have happened if she had studied more last term (third conditional).$$,
        $$Tell her what will happen if she works hard for the rest of the term (first conditional).$$,
        $$Tell her what you would do in her situation (second conditional).$$,
        $$Give her two pieces of advice to improve her results before the exams.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gaps (first conditional): If we ___ (finish) our homework early, we ___ (have) time to play.$$,
      'hint', $$First conditional: if + present simple, ... will + base verb.$$,
      'expected', $$If we finish our homework early, we will have time to play.$$
    ),
    jsonb_build_object(
      'question', $$Fill the gaps (second conditional): If I ___ (be) you, I ___ (ask) the teacher for help.$$,
      'hint', $$Second conditional: if + past simple, ... would + base verb.$$,
      'expected', $$If I were you, I would ask the teacher for help.$$
    ),
    jsonb_build_object(
      'question', $$Fill the gaps (third conditional): If Yao ___ (not/cheat) on the test, he ___ (not/get) punished.$$,
      'hint', $$Third conditional: if + past perfect, ... would have + past participle.$$,
      'expected', $$If Yao hadn't cheated on the test, he wouldn't have gotten punished.$$
    ),
    jsonb_build_object(
      'question', $$Complete with a first-conditional result: "If you miss too many classes, ..."$$,
      'hint', $$Use will + base verb for a real future consequence.$$,
      'expected', $$If you miss too many classes, you will fall behind in your lessons.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-travail-ecole';
