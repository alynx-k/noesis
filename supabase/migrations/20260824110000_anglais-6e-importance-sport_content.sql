-- FALLBACK CONTENT: this lesson ("L'importance du sport", Unit 8 in the
-- official catalog sequence) does not exist as a distinct real lesson on
-- coll.ecole-ci.org (Collège Numérique) — the 6ème Anglais course tree
-- there stops at Unit 7 (Health and Environment). Written from general
-- knowledge of the standard Ivorian 6ème Anglais programme (MENA),
-- following the same vocabulary/register progression used in the
-- neighbouring real lessons (simple present, adverbs of frequency,
-- should/must already taught earlier in the sequence).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During a Sports Day organized by the English Club at Collège Municipal Koro, 6ème students talk about the sports they play and why sport is important for health.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: sports and physical activity$$,
        'body', $$Football, basketball, running, jumping, swimming, to exercise, to keep fit, strong, healthy, tired.$$,
        'highlights', array[$$football, basketball, running, jumping, swimming$$, $$to exercise, to keep fit, strong, healthy$$]::text[],
        'fixation', jsonb_build_object('question', $$What sport do you play with a round ball using your feet?$$, 'solution', $$Football.$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about sport habits with the simple present$$,
        'body', $$To describe sport habits, we use the simple present with adverbs of frequency: "I always play football on Saturdays." "She often goes running in the morning." "They never exercise." To ask: "What sport do you play?" / "How often do you exercise?"$$,
        'highlights', array[$$always/often/sometimes/never + sport verb$$, $$What sport do you play? / How often do you exercise?$$]::text[],
        'example', jsonb_build_object('statement', $$Ama plays basketball every Wednesday. Write a sentence using "always".$$, 'solution', $$"Ama always plays basketball on Wednesdays."$$),
        'fixation', jsonb_build_object('question', $$How do you ask someone how often they do sport?$$, 'solution', $$"How often do you exercise?" / "How often do you play sport?"$$)
      ),
      jsonb_build_object(
        'heading', $$Explaining why sport is important$$,
        'body', $$Sport keeps our body strong and healthy. It helps us stay fit and avoid diseases. To give a reason, we use "because": "I play football because it keeps me fit." "We should exercise because it is good for our health."$$,
        'highlights', array[$$sport → strong, healthy, fit body$$, $$because + reason$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "I go running every morning ______ it keeps me healthy."$$, 'solution', $$"I go running every morning because it keeps me healthy."$$),
        'fixation', jsonb_build_object('question', $$Give one reason why sport is important.$$, 'solution', $$"It keeps our body strong and healthy." (accept similar reasons)$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the English Club's Sports Day, you are asked to write a short paragraph about your favourite sport and why it is important.$$,
      'questions', array[
        $$Name your favourite sport and say how often you play it.$$,
        $$Explain why sport is good for your health, using "because".$$,
        $$Give one piece of advice to a friend who never exercises.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "My brother ______ (to play) football every Sunday."$$,
      'hint', $$Third person singular takes -s.$$,
      'expected', $$"My brother plays football every Sunday."$$
    ),
    jsonb_build_object(
      'question', $$Write a sentence saying you never play basketball.$$,
      'hint', $$Use the adverb "never".$$,
      'expected', $$"I never play basketball."$$
    ),
    jsonb_build_object(
      'question', $$A friend never exercises. What should he do?$$,
      'hint', $$Use "should" to give advice.$$,
      'expected', $$"He should exercise regularly." / "He should play sport."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Sport keeps our body strong ______ it makes us exercise regularly." (choose the linking word)$$,
      'hint', $$Use the word that introduces a reason.$$,
      'expected', $$"Sport keeps our body strong because it makes us exercise regularly."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-importance-sport';
