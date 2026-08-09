-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806320000_anglais_aeroport_content.sql, the 3ème equivalent, for the
-- CourseContentV2 shape). 3ème covered double comparatives and "so + adj";
-- this 4ème lesson steps up to the present perfect for airport/travel
-- experience ("have you ever flown") and the passive voice for airport
-- procedures, a more procedural, adult register than the 3ème excitement
-- vocabulary.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is producing a short guide for first-time flyers travelling through Félix-Houphouët-Boigny Airport. The guide must explain both what passengers may have already experienced and exactly what procedures are carried out at each stage.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: airport procedures$$,
        'body', $$Passing through an airport smoothly means recognising the official steps every traveller goes through, from check-in to boarding.$$,
        'highlights', array[$$to check in$$, $$security screening$$, $$boarding pass$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to check in$$, $$to register for a flight and hand over luggage$$),
            jsonb_build_array($$security screening$$, $$the process of checking passengers and bags for safety$$),
            jsonb_build_array($$a boarding pass$$, $$the document allowing a passenger to board the plane$$),
            jsonb_build_array($$customs$$, $$the official check of goods entering or leaving a country$$),
            jsonb_build_array($$a delay$$, $$a period of time when something happens later than planned$$),
            jsonb_build_array($$to board$$, $$to get onto a plane$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The present perfect (have/has + past participle) asks about travel experience without saying exactly when: Have you ever flown before? I have never gone through customs.$$),
        'example', jsonb_build_object('statement', $$Ask a first-time flyer about their travel experience.$$, 'solution', $$Have you ever checked in for a flight before? No, I haven't. This is my first time.$$),
        'fixation', jsonb_build_object('question', $$Complete: "She ___ (never/go) through security screening before this trip."$$, 'solution', $$She has never gone through security screening before this trip.$$)
      ),
      jsonb_build_object(
        'heading', $$The passive voice: what happens at each stage$$,
        'body', $$Airport procedures are usually described by what is done, not by who does it -- exactly the situation the passive voice was made for.$$,
        'highlights', array[$$is checked$$, $$is scanned$$, $$is announced$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The passive voice (subject + is/are + past participle) focuses on the action, not the person doing it: Luggage is scanned before boarding. Passports are checked at the gate.$$),
        'example', jsonb_build_object('statement', $$Describe, using the passive, what happens to luggage at check-in.$$, 'solution', $$Luggage is weighed and labelled at check-in.$$),
        'fixation', jsonb_build_object('question', $$Rewrite in the passive: "Officers check passports at the gate."$$, 'solution', $$Passports are checked at the gate.$$)
      ),
      jsonb_build_object(
        'heading', $$Combining experience and procedure$$,
        'body', $$A good travel guide moves naturally between what a passenger may have already experienced and what officially happens at the airport, regardless of who is travelling.$$,
        'highlights', array[$$experience$$, $$procedure$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the present perfect to ask about or describe a passenger's past experience (Have you ever been delayed?), and the passive voice to explain the fixed procedure that applies to everyone (Delayed flights are announced over the speaker system).$$),
        'example', jsonb_build_object('statement', $$Combine both: ask about delay experience, then explain the announcement procedure.$$, 'solution', $$Have you ever experienced a flight delay? Delays are always announced over the speaker system.$$),
        'fixation', jsonb_build_object('question', $$Choose the right structure: "Boarding passes ___ (check/be checked) before passengers board."$$, 'solution', $$Boarding passes are checked before passengers board, because this describes a fixed procedure.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your first-time flyers' guide must explain airport procedures and prepare readers for what to expect.$$,
      'questions', array[
        $$Ask a question about flying experience using the present perfect.$$,
        $$Describe, using the passive, what happens during security screening.$$,
        $$Describe, using the passive, what happens at boarding.$$,
        $$Give one piece of advice for a stress-free airport experience.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ask a question with the present perfect: (you / ever / travel / by plane)$$,
      'hint', $$Have you ever...?$$,
      'expected', $$Have you ever travelled by plane?$$
    ),
    jsonb_build_object(
      'question', $$Rewrite in the passive: "Staff scan every bag before boarding."$$,
      'hint', $$Subject + is/are + past participle.$$,
      'expected', $$Every bag is scanned before boarding.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "This is the first time Kouadio ___ (fly), so he is quite nervous."$$,
      'hint', $$Present perfect for an experience up to now.$$,
      'expected', $$This is the first time Kouadio has flown, so he is quite nervous.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite in the passive: "The airline announces delays over the speaker system."$$,
      'hint', $$Focus on the delays, not on who announces them.$$,
      'expected', $$Delays are announced over the speaker system.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-aeroport';
