-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 5
-- LESSON 1: In the city" PDF (expressing preference with would prefer /
-- would rather), but every sentence, name, and exercise is an original
-- rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is preparing a debate about city life versus village life. Before the debate, the class needs vocabulary about cities and the grammar to express personal preferences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: city life$$,
        'body', $$A city offers its own particular landscape and lifestyle. These words describe what makes an urban area what it is.$$,
        'highlights', array[$$a city dweller$$, $$public facilities$$, $$heavy traffic$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$an urban area$$, $$a city or town, as opposed to the countryside$$),
            jsonb_build_array($$a city dweller$$, $$a person who lives in a city$$),
            jsonb_build_array($$public facilities$$, $$infrastructure available to everyone, like hospitals and schools$$),
            jsonb_build_array($$a tarred road$$, $$a road with a smooth, paved surface$$),
            jsonb_build_array($$heavy traffic$$, $$a large number of vehicles moving slowly on the roads$$),
            jsonb_build_array($$a firm$$, $$a company or business$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Would prefer" expresses a preference and can be followed by "to + base verb" or by "verb + -ing": I would prefer to live in the city. / I would prefer living in the city.$$),
        'example', jsonb_build_object('statement', $$Ask and answer about a preference between city and village life using "would prefer".$$, 'solution', $$Do you prefer to live in the city or the village? I would prefer to live in the city because it offers more job opportunities.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "would prefer + verb-ing": "I want to live near good public facilities."$$, 'solution', $$I would prefer living near good public facilities.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: city comforts and problems$$,
        'body', $$City life brings both comforts and challenges: places to relax and shop, but also crowded, noisy conditions.$$,
        'highlights', array[$$entertainment$$, $$a mall$$, $$to be in a hurry$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$entertainment$$, $$activities done for amusement and enjoyment$$),
            jsonb_build_array($$accommodation$$, $$a place to live, such as a house or a flat$$),
            jsonb_build_array($$a flat$$, $$an apartment$$),
            jsonb_build_array($$a mall$$, $$a large building containing many shops$$),
            jsonb_build_array($$noisy$$, $$full of loud, unwanted sound$$),
            jsonb_build_array($$to be in a hurry$$, $$to need to do something or go somewhere quickly$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Would rather" also expresses a preference, but is always followed directly by the base verb, never "to" or "-ing": I would rather live in the city (shortened: I'd rather live in the city).$$),
        'example', jsonb_build_object('statement', $$Express a preference for quiet accommodation using "would rather".$$, 'solution', $$I would rather live in a quiet flat than in a noisy one near the market.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "would rather": "Kader prefers to shop at the local market instead of the mall."$$, 'solution', $$Kader would rather shop at the local market than at the mall.$$)
      ),
      jsonb_build_object(
        'heading', $$Would prefer or would rather: which grammar fits?$$,
        'body', $$Both structures express the same idea -- a preference -- but they follow different grammar rules that shouldn't be mixed up.$$,
        'highlights', array[$$would prefer$$, $$would rather$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Would prefer" can be followed by "to + base verb" or "verb-ing", and can compare two options with "rather than": I would prefer to walk rather than drive. "Would rather" is always followed directly by the base verb, with no "to": I would rather walk.$$),
        'example', jsonb_build_object('statement', $$Which is correct: "I would rather to live in the city" or "I would rather live in the city"?$$, 'solution', $$"I would rather live in the city" is correct, because "would rather" is never followed by "to".$$),
        'fixation', jsonb_build_object('question', $$Correct the mistake: "She would rather to work in an office than in a shop."$$, 'solution', $$She would rather work in an office than in a shop. ("Would rather" is followed directly by the base verb, without "to".)$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is organizing a class debate: "Is it better to live in the city or in the village?"$$,
      'questions', array[
        $$List two advantages of living in a city.$$,
        $$List one disadvantage of living in a city.$$,
        $$Express your own preference using "would prefer" or "would rather".$$,
        $$Give one reason to support your preference.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: City dwellers ___ (would prefer) to live near good public facilities.$$,
      'hint', $$would prefer + to + base verb.$$,
      'expected', $$City dwellers would prefer to live near good public facilities.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "would prefer + verb-ing": "He wants to work for an international firm."$$,
      'hint', $$would prefer + verb-ing.$$,
      'expected', $$He would prefer working for an international firm.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "would rather": "I prefer walking to taking a noisy bus."$$,
      'hint', $$would rather + base verb + than + base verb.$$,
      'expected', $$I would rather walk than take a noisy bus.$$
    ),
    jsonb_build_object(
      'question', $$Correct the mistake: "They would rather to live in a quiet neighbourhood."$$,
      'hint', $$"Would rather" is never followed by "to".$$,
      'expected', $$They would rather live in a quiet neighbourhood.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-a-la-ville';
