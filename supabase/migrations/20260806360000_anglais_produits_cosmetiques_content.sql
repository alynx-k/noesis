-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 4
-- LESSON 3: Be proud of your skin colour" PDF (asking/giving advice with
-- should, expressing prohibition with shouldn't), but every sentence,
-- name, and exercise is an original rewrite, framed around a positive,
-- health-conscious skincare awareness message.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school's health club is organizing an awareness day about skincare habits among teenagers. As a member of the English Club, you help write the vocabulary and phrases needed for the presentation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: cosmetic products$$,
        'body', $$Cosmetics are products people use to care for or decorate their skin, hair, and nails. Knowing their names helps you talk about healthy beauty habits.$$,
        'highlights', array[$$cosmetics$$, $$a moisturizer$$, $$perfume$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$cosmetics$$, $$products used on the face or body to make it more attractive$$),
            jsonb_build_array($$perfume$$, $$a liquid put on the skin to give a pleasant smell$$),
            jsonb_build_array($$a moisturizer$$, $$a cream used to keep the skin from becoming too dry$$),
            jsonb_build_array($$lipstick$$, $$a coloured product applied to the lips$$),
            jsonb_build_array($$nail polish / nail varnish$$, $$a coloured liquid applied to the nails$$),
            jsonb_build_array($$hair gel$$, $$a product used to style and hold hair in place$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To ask for advice, use "What should I do?". To give advice, use "You should + base verb".$$),
        'example', jsonb_build_object('statement', $$Ask for advice about choosing cosmetics, and give a healthy answer.$$, 'solution', $$What should I do to take care of my skin? You should use a moisturizer regularly and choose gentle products.$$),
        'fixation', jsonb_build_object('question', $$Give advice using "should": A friend asks "What should I do to keep my nails healthy?"$$, 'solution', $$You should keep your nails clean and trimmed, and use nail polish only occasionally.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: skin and complexion$$,
        'body', $$Talking about skin care sometimes means discussing the natural colour of a person's skin, and the products that claim to change it.$$,
        'highlights', array[$$complexion$$, $$to bleach the skin$$, $$harmful$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$complexion$$, $$the natural colour and appearance of a person's skin$$),
            jsonb_build_array($$a dark complexion$$, $$a naturally deep skin tone$$),
            jsonb_build_array($$a light complexion$$, $$a naturally pale skin tone$$),
            jsonb_build_array($$to bleach the skin$$, $$to use chemical products to make the skin lighter$$),
            jsonb_build_array($$harmful$$, $$dangerous; likely to cause damage or injury$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To express prohibition, ask "What shouldn't I do?" and answer with "You shouldn't + base verb".$$),
        'example', jsonb_build_object('statement', $$Ask what a person shouldn't do about their skin, and give a prohibition using "shouldn't".$$, 'solution', $$What shouldn't I do to protect my skin? You shouldn't use harmful bleaching creams without a doctor's advice.$$),
        'fixation', jsonb_build_object('question', $$Give a prohibition using "shouldn't": A friend wants to know what to avoid before going out in the sun.$$, 'solution', $$You shouldn't go out in the sun for a long time without protecting your skin.$$)
      ),
      jsonb_build_object(
        'heading', $$Should vs shouldn't: sorting advice$$,
        'body', $$Good advice usually comes in pairs: something you're encouraged to do, and something you're warned against. Telling the two apart is essential to understand a health message.$$,
        'highlights', array[$$a recommendation$$, $$a warning$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Should + base verb" gives a positive recommendation -- something good to do. "Shouldn't + base verb" gives a warning -- something to avoid.$$),
        'example', jsonb_build_object('statement', $$Sort this advice: "You should drink plenty of water." and "You shouldn't use harsh chemicals on your skin."$$, 'solution', $$"You should drink plenty of water" is a recommendation. "You shouldn't use harsh chemicals on your skin" is a warning.$$),
        'fixation', jsonb_build_object('question', $$Is this a recommendation or a warning: "You shouldn't share cosmetic products with others."?$$, 'solution', $$This is a warning, because "shouldn't" tells you what to avoid.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your school's health club is preparing a short awareness message for the school magazine about healthy skincare habits among students.$$,
      'questions', array[
        $$Give two reasons why some students use cosmetic products.$$,
        $$Give two pieces of advice using "should", about taking care of the skin naturally.$$,
        $$Give two warnings using "shouldn't", about products that could be harmful.$$,
        $$End your message by encouraging students to feel confident about their natural complexion.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: A moisturizer is used to keep the skin from becoming too ___.$$,
      'hint', $$Re-read the vocabulary definition of "a moisturizer".$$,
      'expected', $$A moisturizer is used to keep the skin from becoming too dry.$$
    ),
    jsonb_build_object(
      'question', $$Give advice using "should": "What should I do to look after my nails?"$$,
      'hint', $$You should + base verb.$$,
      'expected', $$You should keep your nails clean and trim them regularly.$$
    ),
    jsonb_build_object(
      'question', $$Give a prohibition using "shouldn't": "What shouldn't I do with strong chemical products?"$$,
      'hint', $$You shouldn't + base verb.$$,
      'expected', $$You shouldn't use strong chemical products without medical advice.$$
    ),
    jsonb_build_object(
      'question', $$Classify: "You should be proud of your natural complexion." -- is this a recommendation or a warning?$$,
      'hint', $$"Should" gives positive advice, not a warning.$$,
      'expected', $$This is a recommendation, because it encourages a positive attitude.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-produits-cosmetiques';
