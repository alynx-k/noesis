-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1456: "Unit 8_Science_Listening"
-- (https://lyc.ecole-ci.org/course/view.php?id=1456)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10970,
-- redirecting to pluginfile "Unit 8_Science_Listening.pdf" (FAR AHEAD
-- 2nde, pp 105, text "The human story"). Read directly in the browser PDF
-- viewer (page-by-page screenshots, zoomed in where needed); no file was
-- persisted to disk. The worksheet references an external audio
-- recording describing Gabon's climate, which was not accessed; the
-- listening scenario below is an original composition built only from the
-- worksheet's own comprehension-question stems and answer options
-- (Gabon's location in central Africa near the equator, its wet/tropical
-- climate, and its coolest months and temperature range). Rewritten/
-- paraphrased from the source worksheet: the lead-in questions about
-- Gabon, the gist and detail listening activities, and the closing
-- speaking/homework tasks (describing your own country's climate and
-- writing about climate change for Earth Day). 100% original wording; no
-- sentence copied from the source. Course content and exercises are
-- entirely in English by design: this is an English-immersion lesson, not
-- a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-science-listening',
  '2nde',
  'A',
  'anglais',
  $$Unit 8 - Science: Listening About Climate$$,
  15,
  '2nde-a-eng-sports-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A map of Gabon, in central Africa, is shown to the class along with a vegetation legend. Students are asked where Gabon is and what its climate is like. To gather ideas for describing the climate of their own country or region, they then listen to a recording describing Gabon's climate.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: describing climate and location$$,
        'body', $$The equator is the imaginary line around the middle of the Earth; countries near it typically have a tropical climate, meaning hot and often wet throughout much of the year. A climate can be described as wet (a lot of rainfall), dry (little rainfall), or windy. The coolest months of a country's year are its least hot months, even if temperatures may still be quite warm compared to other regions of the world.$$,
        'highlights', array[$$equator$$, $$tropical climate$$, $$coolest months$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Term$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Equator$$, $$Imaginary line around the middle of the Earth$$),
            jsonb_build_array($$Tropical climate$$, $$Hot and often wet climate typical near the equator$$),
            jsonb_build_array($$Wet climate$$, $$Climate with a lot of rainfall$$),
            jsonb_build_array($$Coolest months$$, $$The year's least hot months$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Why do countries located near the equator typically have a tropical climate?$$, 'solution', $$Because their closeness to the equator means they receive strong, fairly constant sunlight all year, producing high temperatures and often high rainfall.$$)
      ),
      jsonb_build_object(
        'heading', $$Listening for the gist: what is the recording about?$$,
        'body', $$Before listening for details, a good listener identifies the general topic. A recording about Gabon's climate might, at first glance, seem to be about several different things: the country's climate policy, a simple description of its climate, or the effects of climate change there. Only one of these matches what a straightforward descriptive recording is actually about.$$,
        'highlights', array[$$gist listening$$]::text[],
        'example', jsonb_build_object('statement', $$If a recording simply explains what Gabon's climate is like, throughout the year, which of these best describes it: (a) Gabon's climate policy, (b) a description of Gabon's climate, (c) climate change in Gabon?$$, 'solution', $$(b) A description of Gabon's climate.$$),
        'fixation', jsonb_build_object('question', $$Why would option (a), "Gabon's climate policy," not fit a purely descriptive recording about climate?$$, 'solution', $$Because a "climate policy" refers to government decisions and actions, not a simple description of what the climate is actually like.$$)
      ),
      jsonb_build_object(
        'heading', $$Listening scenario: the climate of Gabon$$,
        'body', $$Imagine a short recording describing Gabon like this: "Gabon is a country located in central Africa, very close to the equator. Because of this location, it has a tropical climate: hot and wet for most of the year. Its coolest months run from October to December, when temperatures stay around 28 to 29 degrees Celsius, still warm by many standards. During the rest of the year, temperatures tend to rise even higher, and rainfall remains frequent, supporting the country's dense, green vegetation."$$,
        'highlights', array[$$central Africa$$, $$tropical climate$$, $$28 to 29 degrees$$]::text[],
        'fixation', jsonb_build_object('question', $$According to this scenario, in which months is Gabon's climate coolest?$$, 'solution', $$From October to December.$$)
      ),
      jsonb_build_object(
        'heading', $$Listening for detail$$,
        'body', $$Once you understand the general topic, detail questions check specific facts: where exactly is the country located? Why does it have this type of climate? What does the climate look like day to day (dry, windy, or wet)? Which months are coolest, and what is the approximate temperature during part of the year?$$,
        'highlights', array[$$detail listening$$]::text[],
        'example', jsonb_build_object('statement', $$Based on the scenario above, why does Gabon have a tropical climate: (a) because it's far from the equator, (b) because it's near the equator?$$, 'solution', $$(b) Because it's near the equator.$$),
        'fixation', jsonb_build_object('question', $$Based on the scenario above, what is Gabon's climate like day to day: dry, windy, or wet?$$, 'solution', $$Wet.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: describing your own country's climate$$,
        'body', $$After listening to a description of Gabon's climate, you are asked to write a short descriptive paragraph about the climate of your own country. In it, you should say where your country is located, identify its different seasons, and show how the climate affects daily life there, for example through agriculture or people's daily routines.$$,
        'highlights', array[$$descriptive paragraph$$, $$seasons$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one way climate can affect agriculture in a country.$$, 'solution', $$For example, rainy seasons determine when crops can be planted and harvested.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$It is Earth Day, and your English Club has asked you to write a paragraph about how real climate change is, its causes, and how members could help address it.$$,
      'questions', array[
        $$Define climate change in your own words.$$,
        $$Cite two or three causes of climate change.$$,
        $$Explain two ways your English Club members could help address climate change.$$,
        $$Describe, in one or two sentences, the climate of your own country or region.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$In which part of Africa is Gabon located?$$,
      'hint', $$Think about the region near the equator.$$,
      'expected', $$Central Africa.$$
    ),
    jsonb_build_object(
      'question', $$Why does a country near the equator typically have a tropical climate?$$,
      'hint', $$Think about sunlight throughout the year.$$,
      'expected', $$Because its closeness to the equator gives it strong, fairly constant sunlight, producing high temperatures and often high rainfall.$$
    ),
    jsonb_build_object(
      'question', $$According to the listening scenario, what are Gabon's coolest months?$$,
      'hint', $$They fall at the end of the year.$$,
      'expected', $$October to December.$$
    ),
    jsonb_build_object(
      'question', $$What kind of climate does Gabon have: dry or wet?$$,
      'hint', $$Think about rainfall near the equator.$$,
      'expected', $$Wet (a tropical, rainy climate).$$
    )
  ),
  now()
);
