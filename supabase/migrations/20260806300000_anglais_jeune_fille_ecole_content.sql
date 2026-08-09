-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 2
-- LESSON 3: Girls at school?" PDF (expressing opinions: I think that / I
-- believe that / As far as I'm concerned / In my opinion, plus should vs
-- must), but every sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school's English Club is organizing a talk for Girls' Education Day. Before the event, your teacher asks the class to practice giving opinions in English about why education matters for girls.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: succeeding at school$$,
        'body', $$Talking about a girl's success at school requires words for what she achieves, and for the encouragement she receives along the way.$$,
        'highlights', array[$$to be good at$$, $$to pass$$, $$to praise$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to send someone to school$$, $$to enrol a child in school so they can learn$$),
            jsonb_build_array($$to be good at$$, $$to be skilled or excellent at something$$),
            jsonb_build_array($$to be bad at$$, $$to lack skill at something (opposite of "to be good at")$$),
            jsonb_build_array($$to pass$$, $$to succeed in a test or an exam$$),
            jsonb_build_array($$to praise$$, $$to say encouraging words about someone's success$$),
            jsonb_build_array($$to take an exam$$, $$to be a candidate sitting an exam$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To give an opinion, we can start a sentence with "I think that" or "I believe that", followed by a full sentence with a subject and a verb: I think that girls should go to school.$$),
        'example', jsonb_build_object('statement', $$Give your opinion about girls' education using "I believe that".$$, 'solution', $$I believe that girls should go to school, because education gives every child, girl or boy, the same chance to succeed.$$),
        'fixation', jsonb_build_object('question', $$Complete the opinion: I think that ___ (all children/have the right to education).$$, 'solution', $$I think that all children have the right to education.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: the cost and rewards of schooling$$,
        'body', $$Getting an education isn't free, but it comes with real rewards: this vocabulary covers both the costs families pay and what a hardworking student can achieve.$$,
        'highlights', array[$$school fees$$, $$a scholarship$$, $$an average$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$school fees$$, $$money paid so that a person can attend school$$),
            jsonb_build_array($$a boarding school$$, $$a school where students also live while they study$$),
            jsonb_build_array($$a scholarship$$, $$money given to support a student's education$$),
            jsonb_build_array($$good job!$$, $$words said to congratulate a student on their success$$),
            jsonb_build_array($$a discipline$$, $$a subject studied at school, such as English or Maths$$),
            jsonb_build_array($$an average$$, $$the overall result found by adding all your marks and dividing by their number$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$There are other useful ways to introduce an opinion, besides "I think that": "As far as I'm concerned, ..." and "In my opinion, ..." -- both are followed directly by a full sentence, without "that".$$),
        'example', jsonb_build_object('statement', $$Give your opinion about scholarships using "As far as I'm concerned".$$, 'solution', $$As far as I'm concerned, every hardworking student should be able to receive a scholarship.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "In my opinion": "I think that school fees should be free for girls in rural areas."$$, 'solution', $$In my opinion, school fees should be free for girls in rural areas.$$)
      ),
      jsonb_build_object(
        'heading', $$Should or must: giving advice vs. stating an obligation$$,
        'body', $$"Should" and "must" both follow the verb used to give opinions, but they carry different strength: one is a friendly suggestion, the other is closer to a rule.$$,
        'highlights', array[$$should$$, $$must$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Should" gives advice or a recommendation -- it's a good idea, but not an absolute rule: Girls should go to school. "Must" expresses a stronger obligation, closer to a rule that shouldn't be broken: Students must respect their teachers.$$),
        'example', jsonb_build_object('statement', $$Which is stronger: "Parents should send their daughters to school" or "Parents must send their daughters to school"?$$, 'solution', $$"Parents must send their daughters to school" is stronger, because "must" expresses a firm obligation, while "should" is only a recommendation.$$),
        'fixation', jsonb_build_object('question', $$Choose should or must: "In my opinion, a good student ___ always do their homework." (a strong personal rule)$$, 'solution', $$In my opinion, a good student must always do their homework.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is preparing a short radio spot for Girls' Education Day, presenting a well-known educated woman as a role model for younger girls.$$,
      'questions', array[
        $$Give the name and country of the woman you chose.$$,
        $$Describe, using "I think that" or "In my opinion", why her education mattered for her success.$$,
        $$Give two reasons why girls should stay in school, using should or must.$$,
        $$End your spot by encouraging younger girls to work hard at school.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete the opinion: As far as I'm concerned, ___ (education/be/a right for every child).$$,
      'hint', $$Use "As far as I'm concerned" followed directly by a full sentence, no "that".$$,
      'expected', $$As far as I'm concerned, education is a right for every child.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "I believe that": "In my opinion, girls should finish secondary school."$$,
      'hint', $$"I believe that" needs "that" before the sentence.$$,
      'expected', $$I believe that girls should finish secondary school.$$
    ),
    jsonb_build_object(
      'question', $$Choose should or must: "A student who wants to pass the exam ___ revise every lesson." (strong personal rule)$$,
      'hint', $$"Must" is stronger than "should".$$,
      'expected', $$A student who wants to pass the exam must revise every lesson.$$
    ),
    jsonb_build_object(
      'question', $$Is a "scholarship" money paid BY the student, or money given TO the student?$$,
      'hint', $$Re-read the vocabulary definition of "a scholarship".$$,
      'expected', $$A scholarship is money given TO the student, to support their education.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-jeune-fille-ecole';
