-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 3
-- LESSON 2: Travelling by plane" PDF (double comparatives, emphasizing
-- feelings with "so"), but every sentence, name, and exercise is an
-- original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A student from Daloa is going to visit her pen friend in Dakar for the first time, and she is taking a plane for the very first time. Before the trip, the class practices the vocabulary and grammar she will need to describe the experience.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary and grammar: getting ready to fly$$,
        'body', $$Before a plane can take off, every passenger goes through several steps at the airport. These words describe that process -- and set the scene for a grammar point that shows a trend increasing over time.$$,
        'highlights', array[$$to check in$$, $$a boarding card$$, $$the departure lounge$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to check passport and ticket$$, $$to have your documents verified by airport staff$$),
            jsonb_build_array($$to check the luggage in$$, $$to hand your bags to the airline before the flight$$),
            jsonb_build_array($$to fill in a boarding card$$, $$to write your information on the card needed to board$$),
            jsonb_build_array($$the departure lounge$$, $$the waiting area near the gate before boarding$$),
            jsonb_build_array($$a visa$$, $$an official document that allows you to enter a country$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$A double comparative shows a trend that keeps increasing or decreasing over time. Short adjectives: "adjective-er and adjective-er" (faster and faster). Long adjectives: "more and more + adjective" (more and more comfortable). For a decreasing trend, both short and long adjectives use "less and less + adjective".$$),
        'example', jsonb_build_object('statement', $$Describe a trend about airport security using a double comparative.$$, 'solution', $$Airport security checks are becoming stricter and stricter every year.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: Plane tickets are ___ (expensive) every year. (increasing trend, long adjective)$$, 'solution', $$Plane tickets are more and more expensive every year.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: boarding, take-off, and landing$$,
        'body', $$Once your documents are checked, the real journey begins: this vocabulary follows a passenger from boarding the plane to meeting someone at their destination.$$,
        'highlights', array[$$to board$$, $$to take off$$, $$to land$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to board a plane$$, $$to get on a plane$$),
            jsonb_build_array($$to take off$$, $$for a plane to leave the ground and rise into the air$$),
            jsonb_build_array($$to land$$, $$for a plane to come down and touch the ground$$),
            jsonb_build_array($$to meet someone$$, $$to see and greet someone, often for the first time or after a while$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"So" can be placed before an adjective to emphasize it, meaning "very" or "really": This plane is so beautiful. I was so excited to travel for the first time.$$),
        'example', jsonb_build_object('statement', $$Emphasize this sentence with "so": "The airport is busy today."$$, 'solution', $$The airport is so busy today!$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "so": "Halima was happy to meet her cousin at the airport."$$, 'solution', $$Halima was so happy to meet her cousin at the airport.$$)
      ),
      jsonb_build_object(
        'heading', $$Single or double comparative: what's the difference?$$,
        'body', $$A single comparative compares two specific things once. A double comparative describes a trend that keeps changing over time, not just a one-time comparison.$$,
        'highlights', array[$$a trend$$, $$a one-time comparison$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Single comparative: The new plane is faster than the old one (compares two specific things). Double comparative: Planes are getting faster and faster (describes a trend continuing over time, not a specific comparison).$$),
        'example', jsonb_build_object('statement', $$Turn this single comparison into a double comparative describing a trend: "Airports are bigger than they were."$$, 'solution', $$Airports are getting bigger and bigger.$$),
        'fixation', jsonb_build_object('question', $$Is this a single or a double comparative: "Air travel is becoming more and more popular in Africa"?$$, 'solution', $$This is a double comparative, because it describes a continuing trend, not a one-time comparison between two things.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your pen friend from Dakar is waiting for your letter about your very first plane trip to visit her.$$,
      'questions', array[
        $$Describe what happened at the airport before your plane took off (use the vocabulary of checking in and boarding).$$,
        $$Describe a trend you noticed about air travel, using a double comparative.$$,
        $$Say how you felt about your first flight, using "so" to emphasize your feelings.$$,
        $$Describe your arrival: landing, and meeting someone at the airport.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: Before boarding, passengers must ___ (fill in) a boarding card.$$,
      'hint', $$Use the base verb form after "must".$$,
      'expected', $$Before boarding, passengers must fill in a boarding card.$$
    ),
    jsonb_build_object(
      'question', $$Make a double comparative of superiority: "Planes / fast"$$,
      'hint', $$Short adjective: adjective-er and adjective-er.$$,
      'expected', $$Planes are getting faster and faster.$$
    ),
    jsonb_build_object(
      'question', $$Make a double comparative of inferiority: "The price of tickets / affordable"$$,
      'hint', $$Both short and long adjectives use "less and less + adjective" for a decreasing trend.$$,
      'expected', $$The price of tickets is becoming less and less affordable.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "so" to emphasize feelings: "Kouassi was nervous before his first flight."$$,
      'hint', $$Place "so" directly before the adjective.$$,
      'expected', $$Kouassi was so nervous before his first flight.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-aeroport';
