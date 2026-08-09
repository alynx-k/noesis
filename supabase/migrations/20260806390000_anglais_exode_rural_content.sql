-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 5
-- LESSON 3: Rural Exodus" PDF (expressing cause/consequence, making
-- suggestions), but every sentence, name, and exercise is an original
-- rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is preparing a school assembly to raise awareness about young people leaving their villages for the city. Before the assembly, you need vocabulary and grammar to explain why this happens and what could help.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: rural exodus$$,
        'body', $$Rural exodus is when people leave the countryside to move to a city, usually in search of a better life. These words describe the phenomenon and its context.$$,
        'highlights', array[$$rural exodus$$, $$a drought$$, $$living standards$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$rural exodus$$, $$when people leave rural areas to move to cities, usually for economic reasons$$),
            jsonb_build_array($$a drought$$, $$a long period without rain that damages crops$$),
            jsonb_build_array($$living standards$$, $$the general conditions in which people live$$),
            jsonb_build_array($$manpower$$, $$the people available and able to work$$),
            jsonb_build_array($$a slum$$, $$a very poor, overcrowded area of a city$$),
            jsonb_build_array($$overpopulation$$, $$when there are too many people in one place$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To express a cause, use "because of / due to + noun" or "since + subject + verb": People move to cities because of the lack of job opportunities. Since there is a drought, farmers lose their crops.$$),
        'example', jsonb_build_object('statement', $$Explain a cause of rural exodus using "due to".$$, 'solution', $$Many young people leave their village due to the lack of schools nearby.$$),
        'fixation', jsonb_build_object('question', $$Join with "because of": "Farmers lost their harvest." / "a long drought"$$, 'solution', $$Farmers lost their harvest because of a long drought.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary and grammar: causes and effects$$,
        'body', $$Every cause has a consequence: understanding rural exodus means being able to link a problem to what it leads to.$$,
        'highlights', array[$$a consequence$$, $$to increase$$, $$overcrowded$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to increase$$, $$to become greater in number or amount$$),
            jsonb_build_array($$overcrowded$$, $$containing far too many people for the space available$$),
            jsonb_build_array($$to deal with$$, $$to handle or find a solution to a problem$$),
            jsonb_build_array($$unemployment$$, $$the situation of not having a job$$),
            jsonb_build_array($$a policy$$, $$a plan of action decided by a government or organization$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To express a consequence, use "so / as a result / consequently" between two full sentences: There were no jobs in the village, so young people moved to the city.$$),
        'example', jsonb_build_object('statement', $$Express a consequence of rural exodus using "as a result".$$, 'solution', $$Many people left the countryside, as a result, cities became overcrowded.$$),
        'fixation', jsonb_build_object('question', $$Join with "consequently": "There was no work in the village." / "The young men left for the city."$$, 'solution', $$There was no work in the village; consequently, the young men left for the city.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammar: making suggestions to solve a problem$$,
        'body', $$Once a problem and its causes are clear, it's time to suggest solutions. English offers several structures for this.$$,
        'highlights', array[$$suggest$$, $$let's$$, $$how about$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To make a suggestion, use: "suggest + verb-ing" or "suggest that + subject + verb", "Let's + base verb", "can/could + base verb", or "How about/What about + verb-ing...?".$$),
        'example', jsonb_build_object('statement', $$Suggest a solution to rural exodus using two different structures.$$, 'solution', $$I suggest creating more jobs in rural areas. How about building schools closer to villages?$$),
        'fixation', jsonb_build_object('question', $$Rewrite as a suggestion using "Let's": "We should help young farmers start their own business."$$, 'solution', $$Let's help young farmers start their own business.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is presenting an awareness campaign about rural exodus at the school assembly.$$,
      'questions', array[
        $$Explain two causes of rural exodus, using "because of" or "since".$$,
        $$Explain one consequence of rural exodus for cities, using "as a result" or "consequently".$$,
        $$Suggest two solutions to reduce rural exodus, using different suggestion structures.$$,
        $$End your presentation by encouraging students to value life in their own community.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Join with "due to": "Villages lose their young workers." / "the search for better opportunities"$$,
      'hint', $$due to + noun phrase.$$,
      'expected', $$Villages lose their young workers due to the search for better opportunities.$$
    ),
    jsonb_build_object(
      'question', $$Join with "so": "There were no schools in the village." / "Families moved to the city."$$,
      'hint', $$"so" links a cause and its consequence.$$,
      'expected', $$There were no schools in the village, so families moved to the city.$$
    ),
    jsonb_build_object(
      'question', $$Make a suggestion using "could": "The government / create jobs in rural areas"$$,
      'hint', $$subject + could + base verb.$$,
      'expected', $$The government could create jobs in rural areas.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite as a suggestion using "How about": "We should organize a campaign to support young farmers."$$,
      'hint', $$How about + verb-ing...?$$,
      'expected', $$How about organizing a campaign to support young farmers?$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-exode-rural';
