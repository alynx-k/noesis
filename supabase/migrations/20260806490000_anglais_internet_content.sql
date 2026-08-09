-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). No ecole-ci.org page exists for this course either
-- (see 20260806470000_anglais_ordinateur_content.sql for why) -- content is
-- original, from the lesson's topic and standard 3ème programme scope.
-- Grammar (relative clauses with who/which/that) closes out the ICT
-- mini-arc started by anglais-ordinateur and anglais-telephone.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is creating a short guide about using the internet safely and wisely, to be shared with younger students.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: the internet$$,
        'body', $$Understanding the internet starts with knowing the words for how it connects people and information around the world.$$,
        'highlights', array[$$a network$$, $$a website$$, $$to browse$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a network$$, $$a system of connected computers that share information$$),
            jsonb_build_array($$a website$$, $$a place on the internet where you can find information$$),
            jsonb_build_array($$to browse$$, $$to look through information on the internet$$),
            jsonb_build_array($$to download$$, $$to copy a file from the internet onto your device$$),
            jsonb_build_array($$a password$$, $$a secret word or code used to protect an account$$),
            jsonb_build_array($$Wi-Fi$$, $$a wireless connection to the internet$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$A relative clause with "which" or "that" adds a defining detail about a thing: The internet is a network which/that connects millions of computers around the world.$$),
        'example', jsonb_build_object('statement', $$Define "a website" using a relative clause.$$, 'solution', $$A website is a page which/that you can visit on the internet to find information.$$),
        'fixation', jsonb_build_object('question', $$Complete with a relative clause: "Wi-Fi is a connection ___ (allow) devices to access the internet without cables."$$, 'solution', $$Wi-Fi is a connection that allows devices to access the internet without cables.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: staying safe online$$,
        'body', $$Using the internet safely means knowing the risks as well as the benefits, and having the vocabulary to describe both.$$,
        'highlights', array[$$a password$$, $$personal information$$, $$a scam$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$personal information$$, $$private details about a person, like their address or phone number$$),
            jsonb_build_array($$a scam$$, $$a dishonest trick used to get money or information from someone$$),
            jsonb_build_array($$to protect$$, $$to keep something or someone safe from harm$$),
            jsonb_build_array($$to share$$, $$to give other people access to something$$),
            jsonb_build_array($$a stranger$$, $$a person you don't know$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Relative clauses also work with "who" for people: A stranger is a person who you don't know in real life.$$),
        'example', jsonb_build_object('statement', $$Define "a scam" using a relative clause with "who" or "that".$$, 'solution', $$A scam is a trick that dishonest people use to steal money or information.$$),
        'fixation', jsonb_build_object('question', $$Complete with "who": "You should be careful with people ___ (ask) for your personal information online."$$, 'solution', $$You should be careful with people who ask for your personal information online.$$)
      ),
      jsonb_build_object(
        'heading', $$Choosing who, which, or that$$,
        'body', $$Relative clauses use different words depending on whether they describe a person or a thing.$$,
        'highlights', array[$$a person$$, $$a thing$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "who" for people, and "which" or "that" for things or ideas. "That" can often replace both "who" and "which" in everyday English, but "who" is more natural for people.$$),
        'example', jsonb_build_object('statement', $$Choose the correct word: "The internet is a tool ___ helps students learn." / "A hacker is someone ___ tries to access accounts illegally."$$, 'solution', $$The internet is a tool that/which helps students learn. A hacker is someone who tries to access accounts illegally.$$),
        'fixation', jsonb_build_object('question', $$Choose who or which: "Never share your password with people ___ you don't trust."$$, 'solution', $$Never share your password with people who you don't trust.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is publishing a short online-safety guide for younger students.$$,
      'questions', array[
        $$Define "the internet" using a relative clause.$$,
        $$Give two pieces of advice for staying safe online.$$,
        $$Explain why personal information shouldn't be shared with strangers.$$,
        $$Suggest one positive way students can use the internet for their studies.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Define "a password" using a relative clause.$$,
      'hint', $$A password is a secret code that/which...$$,
      'expected', $$A password is a secret code that protects your account.$$
    ),
    jsonb_build_object(
      'question', $$Complete with who or which: "A hacker is a person ___ tries to access other people's accounts without permission."$$,
      'hint', $$"who" is used for people.$$,
      'expected', $$A hacker is a person who tries to access other people's accounts without permission.$$
    ),
    jsonb_build_object(
      'question', $$Complete with who or that: "The internet is a network ___ connects computers all over the world."$$,
      'hint', $$"that"/"which" is used for things.$$,
      'expected', $$The internet is a network that connects computers all over the world.$$
    ),
    jsonb_build_object(
      'question', $$Give one piece of advice for online safety, using "should" or "shouldn't".$$,
      'hint', $$You shouldn't + base verb.$$,
      'expected', $$You shouldn't share your password with anyone you don't trust.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-internet';
