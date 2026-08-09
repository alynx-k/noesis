-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806370000_anglais_a_la_ville_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered "would prefer" / "would rather";
-- this 4ème lesson steps up to the second conditional for hypothetical city
-- life and the correlative comparative "the busier..., the more..." for
-- describing urban growth.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A university researcher studying urban growth in Côte d'Ivoire has invited students to imagine life in a fast-changing city and to describe how city life changes as it grows. Your English Club is preparing the class's written contribution.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: city growth$$,
        'body', $$Describing a growing city calls for words about density, infrastructure, and the pace of change.$$,
        'highlights', array[$$urbanisation$$, $$infrastructure$$, $$overcrowded$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$urbanisation$$, $$the process of a place becoming more like a city$$),
            jsonb_build_array($$infrastructure$$, $$the basic systems a place needs, like roads and electricity$$),
            jsonb_build_array($$overcrowded$$, $$too full of people for the available space$$),
            jsonb_build_array($$a skyscraper$$, $$a very tall modern building$$),
            jsonb_build_array($$pollution$$, $$harmful substances damaging the air, water, or environment$$),
            jsonb_build_array($$opportunity$$, $$a chance to do something, such as find work or study$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The second conditional imagines a hypothetical situation and its result: If + past simple, ... would + base verb. If I lived in a big city, I would have more job opportunities.$$),
        'example', jsonb_build_object('statement', $$Imagine living downtown in a big city.$$, 'solution', $$If I lived downtown, I would spend less time travelling to school every day.$$),
        'fixation', jsonb_build_object('question', $$Complete: "If the city ___ (not/grow) so fast, there ___ (be) less traffic congestion."$$, 'solution', $$If the city didn't grow so fast, there would be less traffic congestion.$$)
      ),
      jsonb_build_object(
        'heading', $$"The busier..., the more...": describing urban change$$,
        'body', $$As a city grows, several things tend to change together -- population, traffic, and opportunity all rise or fall side by side.$$,
        'highlights', array[$$the busier$$, $$the more crowded$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"The + comparative..., the + comparative..." links two changes happening together as a city grows: The busier the city becomes, the more crowded the streets get.$$),
        'example', jsonb_build_object('statement', $$Link population growth and housing prices.$$, 'solution', $$The more people move to the city, the higher housing prices become.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The ___ (large) the city grows, the ___ (difficult) it becomes to find affordable housing."$$, 'solution', $$The larger the city grows, the more difficult it becomes to find affordable housing.$$)
      ),
      jsonb_build_object(
        'heading', $$Weighing the pros and cons$$,
        'body', $$A balanced argument about city life combines an imagined personal situation with a broader trend affecting everyone.$$,
        'highlights', array[$$a personal situation$$, $$a general trend$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the second conditional to imagine your own hypothetical experience of city life (If I lived there, I would...), and "the more... the more" to describe a general trend affecting the whole city (The more the city grows, the more services it needs).$$),
        'example', jsonb_build_object('statement', $$Combine a personal hypothesis and a general trend about pollution.$$, 'solution', $$If I lived closer to the factories, I would breathe more polluted air. The more factories a city builds, the worse its air quality becomes.$$),
        'fixation', jsonb_build_object('question', $$Choose the structure that fits a general trend: "If the city grew, it would need more roads" or "The more the city grows, the more roads it needs"?$$, 'solution', $$"The more the city grows, the more roads it needs" fits a general trend better, because it describes an ongoing relationship, not a single hypothesis.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the researcher's study, your class must describe both the personal experience of city life and the general effects of urban growth.$$,
      'questions', array[
        $$Imagine, using the second conditional, how your life would change if you lived in a big city.$$,
        $$Use "the more... the more" to describe one effect of urban growth.$$,
        $$Name one advantage and one disadvantage of city life.$$,
        $$Give your opinion on whether cities are growing too fast.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "If I ___ (live) in the city centre, I ___ (walk) to school instead of taking the bus."$$,
      'hint', $$Second conditional: if + past simple, ... would + base verb.$$,
      'expected', $$If I lived in the city centre, I would walk to school instead of taking the bus.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The ___ (big) the city becomes, the ___ (bad) the traffic gets."$$,
      'hint', $$Both halves of this structure need a comparative form.$$,
      'expected', $$The bigger the city becomes, the worse the traffic gets.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If there ___ (be) more public transport, fewer people ___ (drive) their own cars."$$,
      'hint', $$Second conditional describing a hypothetical improvement.$$,
      'expected', $$If there were more public transport, fewer people would drive their own cars.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The ___ (many) skyscrapers a city builds, the ___ (little) green space remains."$$,
      'hint', $$Correlative comparative with "many" (more) and "little" (less).$$,
      'expected', $$The more skyscrapers a city builds, the less green space remains.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-ville';
