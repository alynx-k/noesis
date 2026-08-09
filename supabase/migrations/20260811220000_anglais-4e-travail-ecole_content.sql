-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806270000_anglais_travail_ecole_content.sql, the 3ème equivalent,
-- for the CourseContentV2 shape). 3ème covered 1st/2nd/3rd conditionals
-- separately; this 4ème lesson steps up to mixed conditionals (a past
-- condition with a present result, or a present condition with a past
-- result) plus "unless" and "provided that" as alternatives to "if".
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school's career counsellor is running a workshop on study habits and their long-term effects. She asks each student to reflect on how past choices about schoolwork affect the present, and what conditions must be met to succeed this year.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: study habits and outcomes$$,
        'body', $$Talking about the effects of schoolwork over time requires words for effort, consequences, and long-term results.$$,
        'highlights', array[$$to fall behind$$, $$diligent$$, $$consequently$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to fall behind$$, $$to make less progress than others$$),
            jsonb_build_array($$diligent$$, $$showing steady, careful effort$$),
            jsonb_build_array($$to make up for$$, $$to compensate for something lost or missed$$),
            jsonb_build_array($$consequently$$, $$as a result$$),
            jsonb_build_array($$to fulfil (potential)$$, $$to achieve what one is capable of$$),
            jsonb_build_array($$a setback$$, $$a difficulty that delays progress$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$A mixed conditional links a past condition to a present result: If + past perfect, ... would + base verb. If I had studied harder in 6ème, I would be a top student now.$$),
        'example', jsonb_build_object('statement', $$Use a mixed conditional to link a past habit to a present situation.$$, 'solution', $$If she had revised regularly last year, she wouldn't be struggling now.$$),
        'fixation', jsonb_build_object('question', $$Complete the mixed conditional: "If Kouassi ___ (not/miss) so many classes, he ___ (understand) the lesson now."$$, 'solution', $$If Kouassi hadn't missed so many classes, he would understand the lesson now.$$)
      ),
      jsonb_build_object(
        'heading', $$The other mixed conditional$$,
        'body', $$A mixed conditional can also work the other way: a general or present truth about someone can explain a past result.$$,
        'highlights', array[$$a general truth$$, $$a past result$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$If + past simple, ... would have + past participle links a present/general truth to a past result: If she weren't so hard-working, she wouldn't have passed the exam last year.$$),
        'example', jsonb_build_object('statement', $$Explain a present character trait that explains a past success.$$, 'solution', $$If Adjoua weren't so diligent, she wouldn't have won the scholarship last term.$$),
        'fixation', jsonb_build_object('question', $$Complete: "If he ___ (not/be) so lazy, he ___ (not/fail) the test last week."$$, 'solution', $$If he weren't so lazy, he wouldn't have failed the test last week.$$)
      ),
      jsonb_build_object(
        'heading', $$Alternatives to "if": unless and provided that$$,
        'body', $$English can express a condition without using "if" at all -- "unless" states an exception, and "provided that" sets a strict requirement.$$,
        'highlights', array[$$unless$$, $$provided that$$, $$as long as$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Unless" means "if not": Unless you work harder, you won't pass = If you don't work harder, you won't pass. "Provided that" / "as long as" means "only if": You will succeed, provided that you stay focused.$$),
        'example', jsonb_build_object('statement', $$Rewrite "If you don't practise, you won't improve" using "unless".$$, 'solution', $$Unless you practise, you won't improve.$$),
        'fixation', jsonb_build_object('question', $$Complete with "provided that": "You can join the study group, ___ you attend every session."$$, 'solution', $$You can join the study group, provided that you attend every session.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the career counsellor's workshop, you must present a short reflection on how your past study habits shaped your present results, and what conditions you need to succeed this year.$$,
      'questions', array[
        $$Use a mixed conditional to describe how a past study habit affects your present situation.$$,
        $$Use "unless" to state a condition for your future success.$$,
        $$Use "provided that" or "as long as" to state another condition.$$,
        $$Give one piece of advice to a younger student about study habits.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete the mixed conditional: "If Rokia ___ (revise) properly last term, she ___ (be) in the top class now."$$,
      'hint', $$Past condition (had + past participle) with a present result (would + base verb).$$,
      'expected', $$If Rokia had revised properly last term, she would be in the top class now.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "unless": "If you don't submit your homework, you will get a zero."$$,
      'hint', $$"Unless" replaces "if...not".$$,
      'expected', $$Unless you submit your homework, you will get a zero.$$
    ),
    jsonb_build_object(
      'question', $$Complete with "provided that": "The teacher will accept your excuse, ___ you bring a note from home."$$,
      'hint', $$"Provided that" means "only if".$$,
      'expected', $$The teacher will accept your excuse, provided that you bring a note from home.$$
    ),
    jsonb_build_object(
      'question', $$Complete the mixed conditional: "If he ___ (not/be) so diligent, he ___ (not/win) the prize last year."$$,
      'hint', $$Present truth (past simple) explaining a past result (would have + past participle).$$,
      'expected', $$If he weren't so diligent, he wouldn't have won the prize last year.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-travail-ecole';
