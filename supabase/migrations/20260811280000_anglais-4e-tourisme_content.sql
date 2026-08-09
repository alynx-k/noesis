-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806330000_anglais_tourisme_content.sql, the 3ème equivalent, for the
-- CourseContentV2 shape). 3ème covered "let's/shall we/how about" and the
-- imperative; this 4ème lesson steps up to formal suggestion structures
-- ("I suggest that... / it would be advisable to...") and the second
-- conditional for hypothetical travel advice ("If I were you, I would...").
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A partner school in England is sending a group of exchange students to visit your region. Your English Club has been asked to write formal travel recommendations for them -- not casual suggestions among friends, but the kind of advice a tourist board would give.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: giving tourists formal advice$$,
        'body', $$Formal travel recommendations use vocabulary you would find in a guidebook or an official tourist leaflet, not casual chat.$$,
        'highlights', array[$$to recommend$$, $$a must-see$$, $$advisable$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to recommend$$, $$to suggest something as good or suitable$$),
            jsonb_build_array($$a must-see$$, $$a place so impressive that visitors should not miss it$$),
            jsonb_build_array($$advisable$$, $$sensible; a good idea$$),
            jsonb_build_array($$to bear in mind$$, $$to remember and consider something$$),
            jsonb_build_array($$an itinerary$$, $$a planned route or list of places to visit$$),
            jsonb_build_array($$off the beaten track$$, $$away from the places most tourists visit$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"I suggest that + subject + base verb" (without "to") gives formal advice: I suggest that visitors book their tickets early. "It would be advisable to + base verb" is another formal way to recommend something.$$),
        'example', jsonb_build_object('statement', $$Give formal advice about visiting the national park.$$, 'solution', $$I suggest that visitors arrive early in the morning. It would be advisable to bring comfortable walking shoes.$$),
        'fixation', jsonb_build_object('question', $$Complete: "I suggest that the group ___ (visit) the museum before midday."$$, 'solution', $$I suggest that the group visit the museum before midday.$$)
      ),
      jsonb_build_object(
        'heading', $$Hypothetical advice: "If I were you..."$$,
        'body', $$Sometimes the most natural way to give travel advice is to imagine yourself in the tourist's position and say what you would do.$$,
        'highlights', array[$$if I were you$$, $$I would$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The second conditional gives hypothetical advice: "If I were you, I would + base verb" imagines being in someone else's situation to recommend an action, even though it is not literally possible.$$),
        'example', jsonb_build_object('statement', $$Give hypothetical advice about local food.$$, 'solution', $$If I were you, I would try the attiéké at the local market -- it's a regional speciality.$$),
        'fixation', jsonb_build_object('question', $$Complete: "If I ___ (be) you, I ___ (avoid) travelling during the rainy season."$$, 'solution', $$If I were you, I would avoid travelling during the rainy season.$$)
      ),
      jsonb_build_object(
        'heading', $$Formal suggestion vs hypothetical advice$$,
        'body', $$Both structures give advice, but one sounds like an official recommendation, and the other sounds like a friend imagining themselves in your shoes.$$,
        'highlights', array[$$an official tone$$, $$a personal tone$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "I suggest that..." or "It would be advisable to..." for an official, guidebook-style tone. Use "If I were you, I would..." for warmer, more personal advice, as if speaking directly to a friend.$$),
        'example', jsonb_build_object('statement', $$Rewrite "If I were you, I would book early" in a more official tone.$$, 'solution', $$It would be advisable to book early.$$),
        'fixation', jsonb_build_object('question', $$Choose the tone that fits a tourist leaflet: "If I were you, I'd bring sunscreen" or "It is advisable to bring sunscreen"?$$, 'solution', $$"It is advisable to bring sunscreen" fits a tourist leaflet better, because it has a formal, official tone.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club must prepare formal travel recommendations for exchange students visiting your region for the first time.$$,
      'questions', array[
        $$Give one formal recommendation using "I suggest that..." or "It would be advisable to...".$$,
        $$Give one piece of hypothetical advice using "If I were you, I would...".$$,
        $$Name one must-see place and explain why it is worth visiting.$$,
        $$Give one warning about something visitors should bear in mind.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "I suggest that visitors ___ (carry) water bottles during the tour."$$,
      'hint', $$I suggest that + subject + base verb (no "to", no "-s").$$,
      'expected', $$I suggest that visitors carry water bottles during the tour.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If I ___ (be) a tourist here, I ___ (visit) the old market first."$$,
      'hint', $$Second conditional: if + past simple, ... would + base verb.$$,
      'expected', $$If I were a tourist here, I would visit the old market first.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite formally: "It's a good idea to book your hotel in advance."$$,
      'hint', $$Use "It would be advisable to...".$$,
      'expected', $$It would be advisable to book your hotel in advance.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If I were you, I ___ (not/travel) alone at night."$$,
      'hint', $$Second conditional, negative form.$$,
      'expected', $$If I were you, I wouldn't travel alone at night.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-tourisme';
