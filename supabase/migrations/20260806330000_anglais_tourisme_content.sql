-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 3
-- LESSON 3: Visiting the USA" PDF (making suggestions, giving
-- instructions/imperative), but every sentence, name, and exercise is an
-- original rewrite (own landmarks/vocabulary, not tied to a specific
-- country).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$After watching a travel documentary about famous cities around the world, your English Club decides to plan a pretend group tour. You need the language to suggest activities and give directions to your groupmates.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: famous places to visit$$,
        'body', $$Every big city has landmarks that tourists love to visit. These words describe some famous places you might see on a world tour.$$,
        'highlights', array[$$a landmark$$, $$a monument$$, $$headquarters$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a landmark$$, $$a famous building or place that people easily recognize$$),
            jsonb_build_array($$a monument$$, $$a structure built to remember an important person or event$$),
            jsonb_build_array($$headquarters$$, $$the main office of a large organization$$),
            jsonb_build_array($$a museum$$, $$a building where important objects or art are displayed$$),
            jsonb_build_array($$a skyscraper$$, $$a very tall modern building$$),
            jsonb_build_array($$a canyon$$, $$a deep valley with steep sides, often cut by a river$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To suggest doing something together, English offers several structures: "Let's + base verb", "Shall we + base verb...?", "How about + verb-ing...?", and "Why don't we + base verb...?".$$),
        'example', jsonb_build_object('statement', $$Suggest visiting a museum using three different structures.$$, 'solution', $$Let's visit the museum. Shall we visit the museum? How about visiting the museum? Why don't we visit the museum?$$),
        'fixation', jsonb_build_object('question', $$Rewrite this suggestion using "How about": "Let's take a taxi to the monument."$$, 'solution', $$How about taking a taxi to the monument?$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: more places on the tour$$,
        'body', $$A world tour often includes striking natural sites and lively city districts, not just famous buildings.$$,
        'highlights', array[$$a casino$$, $$a canyon$$, $$a beach$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a casino$$, $$a place where people play games and bet money$$),
            jsonb_build_array($$a beach$$, $$the sandy or rocky edge of the sea$$),
            jsonb_build_array($$a canyon$$, $$a deep valley cut into rock by a river over a long time$$),
            jsonb_build_array($$a business district$$, $$the part of a city full of offices and companies$$),
            jsonb_build_array($$a film industry hub$$, $$a place where many movies are made$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To give someone directions or instructions, English uses the imperative: the base verb alone, without a subject. The negative imperative adds "Don't" before the verb.$$),
        'example', jsonb_build_object('statement', $$Give directions to the beach using the imperative, affirmative and negative.$$, 'solution', $$Go straight ahead, then turn left at the corner. Don't turn right, or you'll get lost.$$),
        'fixation', jsonb_build_object('question', $$Turn this into an instruction (imperative): "You should close the door quietly."$$, 'solution', $$Close the door quietly.$$)
      ),
      jsonb_build_object(
        'heading', $$Choosing the right suggestion structure$$,
        'body', $$All four suggestion structures mean roughly the same thing, but each has its own exact grammar pattern -- mixing them up is a common mistake.$$,
        'highlights', array[$$Let's$$, $$Shall we$$, $$How about$$, $$Why don't we$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Let's" and "Why don't we" are followed directly by the base verb (Let's go, Why don't we go). "Shall we" is also followed by the base verb, but forms a question (Shall we go?). "How about" is the odd one out: it is always followed by verb + -ing (How about going?).$$),
        'example', jsonb_build_object('statement', $$Which structure is grammatically wrong: "How about go to the canyon?" or "How about going to the canyon?"$$, 'solution', $$"How about go to the canyon?" is wrong. "How about" must be followed by verb + -ing, so the correct form is "How about going to the canyon?"$$),
        'fixation', jsonb_build_object('question', $$Correct the mistake: "Why don't we to visit the museum?"$$, 'solution', $$Why don't we visit the museum? ("Why don't we" is followed directly by the base verb, without "to".)$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club magazine wants an article encouraging foreign visitors to discover your country.$$,
      'questions', array[
        $$Locate your country in the world in one or two sentences.$$,
        $$Suggest two attractive places to visit, using different suggestion structures.$$,
        $$Give simple directions (imperative) from the airport to one of these places.$$,
        $$Mention one thing visitors will remember after their trip.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Make a suggestion using "Let's": (visit / the museum)$$,
      'hint', $$Let's + base verb.$$,
      'expected', $$Let's visit the museum.$$
    ),
    jsonb_build_object(
      'question', $$Make a suggestion using "Shall we": (take / the bus / to the beach)$$,
      'hint', $$Shall we + base verb...?$$,
      'expected', $$Shall we take the bus to the beach?$$
    ),
    jsonb_build_object(
      'question', $$Make a suggestion using "How about": (go / to the canyon)$$,
      'hint', $$How about + verb-ing...?$$,
      'expected', $$How about going to the canyon?$$
    ),
    jsonb_build_object(
      'question', $$Turn this into a negative instruction: "You take photos inside the museum."$$,
      'hint', $$Don't + base verb.$$,
      'expected', $$Don't take photos inside the museum.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-tourisme';
