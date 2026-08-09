-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 3
-- LESSON 1: Different means of transport" PDF (comparatives of
-- superiority/equality/inferiority, plus prefer/would rather), but every
-- sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club magazine is preparing a special issue about getting around your town. Before writing your article, your teacher asks the class to practice comparing and giving opinions about different means of transport.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: means of transport$$,
        'body', $$Before comparing different ways of getting around, you need the names of the vehicles and animals people use to travel.$$,
        'highlights', array[$$to ride$$, $$a lorry$$, $$a canoe$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to walk$$, $$to travel on foot$$),
            jsonb_build_array($$to ride a bicycle / motorbike / scooter$$, $$to travel by sitting on and controlling a two- or three-wheeled vehicle$$),
            jsonb_build_array($$to drive a car / lorry$$, $$to control a four-wheeled vehicle$$),
            jsonb_build_array($$to pilot a ship$$, $$to steer and control a large boat$$),
            jsonb_build_array($$to fly a plane$$, $$to travel by air in an aircraft$$),
            jsonb_build_array($$a canoe$$, $$a small, light boat moved with a paddle$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Comparatives of superiority compare two things when one has more of a quality: short adjectives add "-er + than" (faster than), longer adjectives use "more + adjective + than" (more comfortable than).$$),
        'example', jsonb_build_object('statement', $$Compare a motorbike and a bicycle for speed.$$, 'solution', $$A motorbike is faster than a bicycle.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: A plane is ___ (comfortable) than a donkey.$$, 'solution', $$A plane is more comfortable than a donkey.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammar: comparing equally or comparing down$$,
        'body', $$Not every comparison shows a difference. Sometimes two things are equally good, and sometimes one is simply less of something than the other.$$,
        'highlights', array[$$as ... as$$, $$less ... than$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Comparative of equality: "as + adjective + as" (a bicycle is as fast as a tricycle). Comparative of inferiority: "less + adjective + than" (walking is less comfortable than riding a car).$$),
        'example', jsonb_build_object('statement', $$Compare a canoe and a small boat, if they are equally fast.$$, 'solution', $$A canoe is as fast as a small boat.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: Riding a bicycle is ___ (tiring) than walking the same distance, but still hard work. (use "less")$$, 'solution', $$Riding a bicycle is less tiring than walking the same distance, but still hard work.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: more ways to travel$$,
        'body', $$For longer journeys, people often choose bigger vehicles built to carry many passengers or heavy loads.$$,
        'highlights', array[$$a coach$$, $$a yacht$$, $$a lorry$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a coach$$, $$a large, comfortable bus used for long journeys$$),
            jsonb_build_array($$a yacht$$, $$a private boat used for leisure or racing$$),
            jsonb_build_array($$a tram$$, $$a vehicle that runs on rails through city streets$$),
            jsonb_build_array($$a lorry$$, $$a large vehicle used to carry goods$$),
            jsonb_build_array($$a ship$$, $$a large boat used to cross the sea$$),
            jsonb_build_array($$a train$$, $$a line of connected carriages that runs on rails$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To say what you like best, use "prefer + noun" or "prefer to + base verb", or the more personal "would rather + base verb" (often shortened to "I'd rather").$$),
        'example', jsonb_build_object('statement', $$Ask and answer about a preference between the train and the coach.$$, 'solution', $$A: Which do you prefer, the train or the coach? B: I prefer the train, but I'd rather travel by coach if it's cheaper.$$),
        'fixation', jsonb_build_object('question', $$Complete with "would rather": "I ___ (rather/travel) by canoe than by lorry, because it's more peaceful."$$, 'solution', $$I would rather travel by canoe than by lorry, because it's more peaceful.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club magazine is publishing an article to promote tourism in your country. You are in charge of the section about transport.$$,
      'questions', array[
        $$List three means of transport available in your country.$$,
        $$Compare two of them using a comparative structure (superiority, equality, or inferiority).$$,
        $$Say which means of transport you prefer, using "prefer" or "would rather".$$,
        $$Give one reason for your choice.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Compare a scooter and a bicycle for speed, using a comparative of superiority.$$,
      'hint', $$Short adjective + er + than.$$,
      'expected', $$A scooter is faster than a bicycle.$$
    ),
    jsonb_build_object(
      'question', $$Fill the gap using a comparative of equality: A tricycle is ___ (safe) as a bicycle.$$,
      'hint', $$as + adjective + as.$$,
      'expected', $$A tricycle is as safe as a bicycle.$$
    ),
    jsonb_build_object(
      'question', $$Fill the gap using a comparative of inferiority: Walking is ___ (fast) than driving a car.$$,
      'hint', $$less + adjective + than.$$,
      'expected', $$Walking is less fast than driving a car.$$
    ),
    jsonb_build_object(
      'question', $$Answer using "would rather": "Which do you prefer, the plane or the ship?"$$,
      'hint', $$I would rather + base verb + by + means of transport.$$,
      'expected', $$I would rather travel by plane, because it's much faster.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-moyens-transport';
