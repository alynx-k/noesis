-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). No ecole-ci.org page exists for this course either
-- (see 20260806470000_anglais_ordinateur_content.sql for why) -- content is
-- original, from the lesson's topic and standard 3ème programme scope.
-- Grammar (can/could for ability, the passive voice) is new ground.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is preparing a short presentation comparing old and modern telephones for the school's technology day.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: telephone features$$,
        'body', $$Modern telephones do much more than just make calls. These words describe some of their most common features.$$,
        'highlights', array[$$to dial$$, $$a text message$$, $$a battery$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to dial a number$$, $$to enter a phone number to make a call$$),
            jsonb_build_array($$a text message$$, $$a short written message sent by phone$$),
            jsonb_build_array($$a battery$$, $$the part that stores the energy a phone needs to work$$),
            jsonb_build_array($$a charger$$, $$a device used to give power back to a battery$$),
            jsonb_build_array($$to ring$$, $$to make a sound to signal an incoming call$$),
            jsonb_build_array($$a signal$$, $$the connection that allows a phone to work$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Can" and "could" express ability. "Can" talks about ability now or in general; "could" talks about ability in the past: A smartphone can take photos. Old phones couldn't connect to the internet.$$),
        'example', jsonb_build_object('statement', $$Compare what old and modern phones can/could do.$$, 'solution', $$Modern phones can browse the internet. Old phones could only make calls and send short text messages.$$),
        'fixation', jsonb_build_object('question', $$Complete with can or could: "My grandmother's first phone ___ (not) send photos."$$, 'solution', $$My grandmother's first phone couldn't send photos.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: using a phone safely and politely$$,
        'body', $$Owning a phone also means knowing the right words to talk about using it responsibly.$$,
        'highlights', array[$$to run out of battery$$, $$a network$$, $$to switch off$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to run out of battery$$, $$to have no more power left$$),
            jsonb_build_array($$a network$$, $$the system that connects phones so they can communicate$$),
            jsonb_build_array($$to switch off$$, $$to turn a device off$$),
            jsonb_build_array($$a missed call$$, $$a call that was not answered$$),
            jsonb_build_array($$to top up$$, $$to add credit to a phone$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The passive voice is used when the action matters more than who does it: subject + is/are + past participle. Text messages are sent instantly. Phones are charged every night.$$),
        'example', jsonb_build_object('statement', $$Describe a phone action using the passive voice.$$, 'solution', $$In most homes, phones are charged overnight so that they are ready to use in the morning.$$),
        'fixation', jsonb_build_object('question', $$Rewrite in the passive: "People send millions of text messages every day."$$, 'solution', $$Millions of text messages are sent every day.$$)
      ),
      jsonb_build_object(
        'heading', $$Can, could, or the passive: which fits your sentence?$$,
        'body', $$Choosing between "can/could" and the passive voice depends on whether you want to highlight someone's ability, or simply describe what generally happens.$$,
        'highlights', array[$$ability$$, $$a general action$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "can/could" when you want to highlight a person's or a device's ability to do something. Use the passive when you want to describe a general action without focusing on who performs it.$$),
        'example', jsonb_build_object('statement', $$Compare "My phone can record videos" and "Videos are recorded in high quality on most modern phones."$$, 'solution', $$"My phone can record videos" highlights the phone's ability. "Videos are recorded in high quality on most modern phones" simply describes a general fact.$$),
        'fixation', jsonb_build_object('question', $$Choose can/could or the passive: "Old phones ___ (not/connect) to wifi." (highlighting ability)$$, 'solution', $$Old phones couldn't connect to wifi -- this highlights their (lack of) ability.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is presenting a comparison of old and modern telephones for the school's technology day.$$,
      'questions', array[
        $$Describe two things a modern phone can do that an old phone couldn't.$$,
        $$Explain one everyday action using the passive voice.$$,
        $$Give one piece of advice for using a phone responsibly at school.$$,
        $$Explain what you personally use your phone for the most.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete with can or could: "A smartphone ___ (take) photos and videos."$$,
      'hint', $$can + base verb for a present ability.$$,
      'expected', $$A smartphone can take photos and videos.$$
    ),
    jsonb_build_object(
      'question', $$Complete with can or could: "Twenty years ago, phones ___ (not/access) the internet."$$,
      'hint', $$could + base verb for a past ability.$$,
      'expected', $$Twenty years ago, phones couldn't access the internet.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite in the passive: "Millions of people use smartphones every day."$$,
      'hint', $$subject + is/are + past participle.$$,
      'expected', $$Smartphones are used by millions of people every day.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the passive: "A phone battery ___ (charge) using a charger."$$,
      'hint', $$is/are + past participle.$$,
      'expected', $$A phone battery is charged using a charger.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-telephone';
