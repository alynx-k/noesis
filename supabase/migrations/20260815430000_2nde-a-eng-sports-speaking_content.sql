-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1455: "Unit 7_Sports_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=1455)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10958,
-- redirecting to pluginfile "Unit 7_Sports_Speaking.pdf". Read directly in
-- the browser PDF viewer (page-by-page screenshots, zoomed in where
-- needed); no file was persisted to disk.
-- Rewritten/paraphrased from the source worksheet: the sport-facilities
-- and sport-equipment vocabulary (playground, pitch, court, course,
-- swimming pool, jersey, racquet, club, bat, boots, trainers), the
-- superlative-of-superiority grammar point (short adjective + -est, "the
-- most" + long adjective, irregular good/bad), the sentence-completion
-- practice, and the closing speaking/homework tasks (listing a school's
-- sporting needs and discussing football's popularity). Two small factual
-- corrections were made versus the source worksheet: equipment such as
-- racquets, golf clubs and baseball bats are described here as being used
-- to HIT a ball, not "kick" it, and the irregular superlative of "bad" is
-- given correctly as "the worst" rather than "the worse" (a comparative
-- form). 100% original wording; no sentence copied from the source.
-- Course content and exercises are entirely in English by design: this is
-- an English-immersion lesson, not a lesson about English taught in
-- French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-sports-speaking',
  '2nde',
  'A',
  'anglais',
  $$Unit 7 - Sport: Speaking About Facilities, Equipment and Superlatives$$,
  14,
  '2nde-a-eng-sports-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$With the Olympic Games coming up, students exchange information in English about the different sports on the programme and the equipment used for them. To do so confidently, they first need vocabulary for sport facilities and equipment, plus the grammar for comparing things at their highest degree.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: places to play sport$$,
        'body', $$A playground is a large open space to play, usually for children. A pitch is a field used for sports such as football or rugby. A court is used for sports like tennis, basketball, volleyball or badminton. A course is where golf is played. A swimming pool is where people practise swimming.$$,
        'highlights', array[$$pitch$$, $$court$$, $$course$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Place$$, $$Used for$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Playground$$, $$General open-air play, usually for children$$),
            jsonb_build_array($$Pitch$$, $$Football, rugby$$),
            jsonb_build_array($$Court$$, $$Tennis, basketball, volleyball, badminton$$),
            jsonb_build_array($$Course$$, $$Golf$$),
            jsonb_build_array($$Swimming pool$$, $$Swimming$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Where would you play basketball: on a pitch, a court, or a course?$$, 'solution', $$On a court.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: sport equipment$$,
        'body', $$A jersey is the shirt an athlete wears to play. A racquet is used by tennis players to hit the ball. A club is used by golfers to hit the ball. A bat is used by baseball players to hit the ball. Boots are sturdy shoes, often used in football. Trainers are lightweight sports shoes used for many activities, including running.$$,
        'highlights', array[$$racquet$$, $$club$$, $$bat$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Equipment$$, $$Used for$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Jersey$$, $$Shirt worn to play a sport$$),
            jsonb_build_array($$Racquet$$, $$Hitting the ball in tennis$$),
            jsonb_build_array($$Club$$, $$Hitting the ball in golf$$),
            jsonb_build_array($$Bat$$, $$Hitting the ball in baseball$$),
            jsonb_build_array($$Boots$$, $$Sturdy shoes, often for football$$),
            jsonb_build_array($$Trainers$$, $$Lightweight shoes for sport, including running$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Which piece of equipment does a golfer use to hit the ball?$$, 'solution', $$A club.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammar: superlatives of superiority$$,
        'body', $$To say something is at the highest degree of a quality, English uses superlatives. Short adjectives take "-est": "tall" becomes "the tallest", "strong" becomes "the strongest". Long adjectives use "the most" instead: "expensive" becomes "the most expensive", "difficult" becomes "the most difficult". Two common adjectives are irregular: "good" becomes "the best" (example: "20/20 is the best mark at school"), and "bad" becomes "the worst" (example: "00/20 is the worst mark at school").$$,
        'highlights', array[$$-est$$, $$the most$$, $$the best / the worst$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Adjective$$, $$Superlative$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Tall (short)$$, $$The tallest$$),
            jsonb_build_array($$Strong (short)$$, $$The strongest$$),
            jsonb_build_array($$Expensive (long)$$, $$The most expensive$$),
            jsonb_build_array($$Good (irregular)$$, $$The best$$),
            jsonb_build_array($$Bad (irregular)$$, $$The worst$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the superlative form of "bad"?$$, 'solution', $$The worst.$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: superlative sentences about sport and beyond$$,
        'body', $$Once you know the rule, you can build superlative sentences about real facts, for example about a popular sport, a well-known player, or comparisons beyond sport. Remember to check whether the adjective is short, long, or irregular before choosing the correct form.$$,
        'highlights', array[$$superlative practice$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "Football is (popular) sport in the world."$$, 'solution', $$"Football is the most popular sport in the world." ("popular" is a long-ish adjective, so it takes "the most")$$),
        'fixation', jsonb_build_object('question', $$Complete: "According to many experts, this player is (good) player of his generation."$$, 'solution', $$"...is the best player of his generation."$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: listing your school's sporting needs$$,
        'body', $$Imagine a foreign embassy wants to help promote sport at your school and asks the English Club for a list of needs. In your discussion, you should agree on the main sports you wish to practise, the facilities needed for each sport, and the equipment necessary to practise them properly.$$,
        'highlights', array[$$sporting needs$$, $$discussion$$]::text[],
        'fixation', jsonb_build_object('question', $$If your school wanted to add basketball, what facility and what equipment would you need to request?$$, 'solution', $$A court, and equipment such as a basketball and appropriate trainers.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Football is often said to be the most popular sport in the world. You are asked to discuss whether you agree, and why.$$,
      'questions', array[
        $$Say whether you think it is true that football is the most popular sport in the world.$$,
        $$Explain why people love this sport so much.$$,
        $$Compare it, using a superlative, to another sport you know.$$,
        $$Point out one difference between football and another sport of your choice.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Where would you play tennis: a pitch, a court, or a course?$$,
      'hint', $$Tennis, basketball and badminton share this type of facility.$$,
      'expected', $$A court.$$
    ),
    jsonb_build_object(
      'question', $$What piece of equipment does a baseball player use to hit the ball?$$,
      'hint', $$It's a specific piece of wooden or metal equipment.$$,
      'expected', $$A bat.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "This is __________ (bad) result of the whole team."$$,
      'hint', $$Use the irregular superlative of "bad".$$,
      'expected', $$"This is the worst result of the whole team."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Abidjan is __________ (large) city of Côte d'Ivoire."$$,
      'hint', $$"Large" is a short adjective.$$,
      'expected', $$"Abidjan is the largest city of Côte d'Ivoire."$$
    )
  ),
  now()
);
