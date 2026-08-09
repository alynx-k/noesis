-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Unlike the other Anglais lessons, this course's
-- ecole-ci.org page (UNIT 2 WOMEN AT WORK, Lesson 1) has no uploaded PDF --
-- only H5P interactive activities with no extractable text -- so this
-- content is written from the lesson's own title/topic and the standard
-- 3ème English-programme scope, same fallback the app's generate-course
-- function already used for un-migrated courses. Grammar chosen (present
-- simple routines, have to/must, comparatives) sets up Lesson 2's "have the
-- right to / it's my duty to" content, which IS sourced from an official
-- PDF (see 20260806290000_anglais_droits_devoirs_femme_content.sql).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English class is preparing a radio programme about women who live and work in the countryside. Before recording your interviews, you need the vocabulary and grammar to describe what rural women do every day and the difficulties they face.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: rural women's daily work$$,
        'body', $$Life in the countryside keeps rural women busy with tasks that provide food and income for their whole family. These words describe their most common activities.$$,
        'highlights', array[$$to farm$$, $$a cash crop$$, $$to fetch water$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to farm$$, $$to grow crops or raise animals on the land$$),
            jsonb_build_array($$a cash crop$$, $$a crop grown mainly to be sold, not eaten by the farmer$$),
            jsonb_build_array($$to fetch water$$, $$to go and bring water back, often from a well or a river$$),
            jsonb_build_array($$to grind grain$$, $$to crush grain into flour using a mill or stones$$),
            jsonb_build_array($$to sell produce$$, $$to sell fruits, vegetables, or other farm goods$$),
            jsonb_build_array($$income$$, $$the money a person earns from their work$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$We use the present simple to describe habits and routines that happen regularly, not just once. Add -s/-es to the verb with he/she/it: She farms cassava. She fetches water every morning.$$),
        'example', jsonb_build_object('statement', $$What does Adjoua do every morning before her children go to school?$$, 'solution', $$Every morning, Adjoua fetches water and prepares breakfast before her children go to school.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: Every day, Mariam ___ (sell) vegetables at the local market.$$, 'solution', $$Every day, Mariam sells vegetables at the local market.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammar: expressing obligation with have to / must$$,
        'body', $$Rural women often face tasks they cannot avoid: chores that must be done for the family and the farm to survive. English expresses this necessity with "have to" and "must".$$,
        'highlights', array[$$have to$$, $$must$$, $$obligation$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Have to" and "must" both express obligation. "Have to" often describes an obligation that comes from outside (a situation, a rule), while "must" can express a strong personal obligation. Negative form: "don't have to" means it isn't necessary -- not the same as "mustn't", which means it is forbidden.$$),
        'example', jsonb_build_object('statement', $$Why does Aya have to wake up before sunrise?$$, 'solution', $$She has to wake up before sunrise because she must walk a long way to fetch water before the heat of the day.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: Farmers in the village ___ (have to) carry their cash crops to the market themselves, because there are no trucks.$$, 'solution', $$Farmers in the village have to carry their cash crops to the market themselves, because there are no trucks.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparing rural and city life$$,
        'body', $$To describe how different a rural woman's day is from a city woman's day, English uses comparative adjectives: forms that show more, less, or the same amount of something.$$,
        'highlights', array[$$harder$$, $$further$$, $$more difficult$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Short adjectives add -er (hard→harder); adjectives ending in -y change to -ier (easy→easier); longer adjectives use "more" + adjective (difficult→more difficult). To compare two things, add "than".$$),
        'example', jsonb_build_object('statement', $$Compare a rural woman's daily work with a city woman's daily work.$$, 'solution', $$A rural woman's daily work is often harder than a city woman's, because she has to walk further to find water and firewood.$$),
        'fixation', jsonb_build_object('question', $$Complete the comparison: Life in the village is ___ (difficult) than life in the city, because there is less access to water and electricity.$$, 'solution', $$Life in the village is more difficult than life in the city, because there is less access to water and electricity.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your class is recording a radio programme about the daily life of rural women in your region. You have been asked to present the story of a rural woman named Affoué.$$,
      'questions', array[
        $$Describe three things Affoué has to do every day (use the present simple).$$,
        $$Explain two tasks she must do out of obligation, and why (use have to/must).$$,
        $$Compare her daily life to the life of a woman living in the city (use comparatives).$$,
        $$Suggest one way her daily work could be made easier.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: Every morning, Fatou ___ (grind) grain before preparing the family's meal.$$,
      'hint', $$Present simple, third person singular: add -s or -es.$$,
      'expected', $$Every morning, Fatou grinds grain before preparing the family's meal.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "have to": "It is necessary for rural women to walk long distances for water."$$,
      'hint', $$Use the subject + have to/has to + base verb.$$,
      'expected', $$Rural women have to walk long distances for water.$$
    ),
    jsonb_build_object(
      'question', $$Complete the comparison: Farming in the dry season is ___ (hard) than farming in the rainy season.$$,
      'hint', $$Short adjective: add -er.$$,
      'expected', $$Farming in the dry season is harder than farming in the rainy season.$$
    ),
    jsonb_build_object(
      'question', $$Choose "have to" or "mustn't": Rural women ___ waste the little water they collect.$$,
      'hint', $$"Mustn't" expresses a prohibition, not just a necessity.$$,
      'expected', $$Rural women mustn't waste the little water they collect.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-femme-rurale';
