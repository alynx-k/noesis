-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 6
-- LESSON 1: My Rights" PDF (expressing opinion, talking about rights), but
-- every sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is hosting an online exchange with students from another country to mark International Human Rights Day. Before the exchange, you prepare vocabulary and phrases for discussing rights and giving opinions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: law and citizenship$$,
        'body', $$Talking about rights starts with understanding a country's basic legal words: its highest law, and the people it protects.$$,
        'highlights', array[$$a constitution$$, $$a citizen$$, $$custody$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a constitution$$, $$the fundamental written law of a country$$),
            jsonb_build_array($$a law$$, $$a rule made official by a government$$),
            jsonb_build_array($$a citizen$$, $$a person who legally belongs to a country$$),
            jsonb_build_array($$citizenship$$, $$the status of being a citizen of a country$$),
            jsonb_build_array($$to enforce$$, $$to make sure a law is obeyed$$),
            jsonb_build_array($$custody$$, $$the state of being held by the police or in prison$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To give an opinion, you can use several introductory phrases: "I think that...", "In my opinion, ...", "To me, ...", "I believe that...", or "From my point of view, ...".$$),
        'example', jsonb_build_object('statement', $$Give your opinion about respecting the constitution, using two different phrases.$$, 'solution', $$I think that everyone should respect the constitution. From my point of view, respecting the law keeps a country peaceful.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "From my point of view": "I believe that every citizen deserves protection."$$, 'solution', $$From my point of view, every citizen deserves protection.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary and grammar: talking about rights$$,
        'body', $$Once you know the basic legal vocabulary, you can express what a person is or isn't allowed to do.$$,
        'highlights', array[$$to enroll$$, $$to be entitled to$$, $$jail$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to enroll for school$$, $$to register and attend school$$),
            jsonb_build_array($$jail$$, $$a place where people are kept as punishment$$),
            jsonb_build_array($$to deserve$$, $$to merit something because of who you are or what you did$$),
            jsonb_build_array($$to sit for a test/contest$$, $$to take part in it as a candidate$$),
            jsonb_build_array($$to be entitled to$$, $$to have an official right to something$$),
            jsonb_build_array($$to allow someone to$$, $$to give someone permission to do something$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To talk about a right, use "have/has the right to + base verb" or "It's my right to + base verb". To deny a right, use "don't/doesn't have the right to + base verb".$$),
        'example', jsonb_build_object('statement', $$Say what children have the right to do, and what bullies don't have the right to do.$$, 'solution', $$Children have the right to go to school. Bullies don't have the right to hurt younger students.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Every citizen ___ (have) the right to a fair trial."$$, 'solution', $$Every citizen has the right to a fair trial.$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing an opinion about a right$$,
        'body', $$The most convincing arguments about rights combine an opinion phrase with a clear statement about a specific right.$$,
        'highlights', array[$$an opinion phrase$$, $$a specific right$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Combine an opinion phrase with a rights statement for a complete argument: "In my opinion" + "every child has the right to education" = "In my opinion, every child has the right to education."$$),
        'example', jsonb_build_object('statement', $$Combine an opinion phrase with the right to free speech.$$, 'solution', $$I believe that every citizen has the right to express their opinion freely.$$),
        'fixation', jsonb_build_object('question', $$Combine "To me" with this right: "Prisoners have the right not to be tortured."$$, 'solution', $$To me, prisoners have the right not to be tortured.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is taking part in an online video-conference for International Human Rights Day.$$,
      'questions', array[
        $$Give your opinion on why human rights matter, using an opinion phrase.$$,
        $$State two rights that you believe are the most important for young people.$$,
        $$Explain one thing that authorities don't have the right to do to citizens.$$,
        $$Conclude by explaining how respecting rights makes a country stronger.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: The government must ___ (enforce) the law so that citizens feel protected.$$,
      'hint', $$Use the base verb meaning "to make sure a law is obeyed".$$,
      'expected', $$The government must enforce the law so that citizens feel protected.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "In my opinion": "I think that every citizen deserves a fair trial."$$,
      'hint', $$In my opinion, + full sentence, no "that".$$,
      'expected', $$In my opinion, every citizen deserves a fair trial.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Students ___ (have) the right to express their opinions in class."$$,
      'hint', $$have the right to + base verb.$$,
      'expected', $$Students have the right to express their opinions in class.$$
    ),
    jsonb_build_object(
      'question', $$Complete the negative: "Nobody ___ (have) the right to torture a prisoner."$$,
      'hint', $$don't/doesn't have the right to + base verb.$$,
      'expected', $$Nobody has the right to torture a prisoner.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-droits-citoyen';
