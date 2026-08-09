-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Unlike other Anglais lessons, this course (part of an
-- implied ICT unit) has no page at all on ecole-ci.org -- the platform's
-- Anglais 3ème catalog stops at Unit 7 (Hygiene and Health) -- so this
-- content is written from the lesson's own title/topic and the standard
-- 3ème English-programme scope, same fallback used for
-- anglais-femme-rurale/anglais-hygiene-ecole. Grammar (present perfect,
-- relative clauses) is new ground, not yet used in earlier lessons.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school just received a donation of computers for the library. Your English Club is preparing a short guide in English to help students who have never used one before.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: computer parts$$,
        'body', $$Before you can talk about using a computer, you need the words for its main parts and basic actions.$$,
        'highlights', array[$$a keyboard$$, $$a screen$$, $$to save$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a keyboard$$, $$the part used to type letters and numbers$$),
            jsonb_build_array($$a screen$$, $$the part that displays what the computer is doing$$),
            jsonb_build_array($$a mouse$$, $$a small device used to point and click on the screen$$),
            jsonb_build_array($$software$$, $$the programs that run on a computer$$),
            jsonb_build_array($$to save (a file)$$, $$to keep a document stored on the computer$$),
            jsonb_build_array($$to switch on/off$$, $$to turn a device on or off$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The present perfect (have/has + past participle) describes an experience without saying exactly when it happened: Have you ever used a computer? I have already typed a document.$$),
        'example', jsonb_build_object('statement', $$Ask and answer about computer experience using the present perfect.$$, 'solution', $$Have you ever used a computer? Yes, I have. I have already typed a letter on one.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using the present perfect: "It is the first time she uses a mouse."$$, 'solution', $$She has never used a mouse before.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: what a computer can do$$,
        'body', $$Computers can do far more than just display text -- these words describe some of their everyday uses.$$,
        'highlights', array[$$to store data$$, $$to install$$, $$a file$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to store data$$, $$to keep information inside a computer$$),
            jsonb_build_array($$to install (a program)$$, $$to put a new program onto a computer so it can be used$$),
            jsonb_build_array($$a file$$, $$a document or piece of information saved on a computer$$),
            jsonb_build_array($$to print$$, $$to produce a paper copy of a document$$),
            jsonb_build_array($$a virus$$, $$a harmful program that can damage a computer$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The present perfect is also used with "never" and "already" to talk about life experience up to now: I have never installed a program myself. She has already printed the document.$$),
        'example', jsonb_build_object('statement', $$Say what you have already done, and what you have never done, on a computer.$$, 'solution', $$I have already typed a document. I have never installed a program myself.$$),
        'fixation', jsonb_build_object('question', $$Complete with the present perfect: "They ___ (never/use) a computer with a virus before."$$, 'solution', $$They have never used a computer with a virus before.$$)
      ),
      jsonb_build_object(
        'heading', $$Relative clauses describing a computer$$,
        'body', $$To define exactly what a computer or one of its parts does, English often uses a relative clause starting with "which" or "that".$$,
        'highlights', array[$$which$$, $$that$$, $$a relative clause$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "which" or "that" to add a defining detail about a thing: A computer is a machine which/that stores and processes information. A mouse is a device which/that helps you point at things on the screen.$$),
        'example', jsonb_build_object('statement', $$Define "a keyboard" using a relative clause.$$, 'solution', $$A keyboard is a device which/that is used to type letters and numbers into a computer.$$),
        'fixation', jsonb_build_object('question', $$Complete with a relative clause: "A file is a document ___ (be) saved on a computer."$$, 'solution', $$A file is a document that is saved on a computer.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club has written a beginner's guide to help students who have never used a computer before.$$,
      'questions', array[
        $$List three parts of a computer and their function.$$,
        $$Ask a classmate about their computer experience, using the present perfect.$$,
        $$Define one computer part using a relative clause.$$,
        $$Give one piece of advice for taking care of a computer.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete with the present perfect: "I ___ (never/type) a letter on a computer before this class."$$,
      'hint', $$have/has + never + past participle.$$,
      'expected', $$I have never typed a letter on a computer before this class.$$
    ),
    jsonb_build_object(
      'question', $$Ask a question with the present perfect: (you / ever / use / a mouse)$$,
      'hint', $$Have you ever...?$$,
      'expected', $$Have you ever used a mouse?$$
    ),
    jsonb_build_object(
      'question', $$Define "software" using a relative clause.$$,
      'hint', $$Software is a set of programs that/which...$$,
      'expected', $$Software is a set of programs that make a computer work.$$
    ),
    jsonb_build_object(
      'question', $$Complete with a relative clause: "A virus is a program ___ (can) damage a computer."$$,
      'hint', $$that/which + can + base verb.$$,
      'expected', $$A virus is a program that can damage a computer.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-ordinateur';
