-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1536: "Unit 2_Natural resources_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1536), resource id 11930.
-- Lesson structure (vocabulary, passive-voice grammar point, exercise
-- design) reused from the source PDF. The reading text "Renewable and
-- non-renewable resources" (adapted by the PDF's authors from
-- eschooltoday.com, a copyrighted contemporary website) is replaced by an
-- ENTIRELY ORIGINAL passage covering the same factual content and the same
-- target vocabulary/grammar (passive voice).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit2-natural-resources-reading',
  '1ere',
  'A',
  'anglais',
  $$Unit 2: Natural Resources (Reading)$$,
  4,
  '1ere-a-ang-unit2-natural-resources-listening',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In order to write an article about the different resources on our planet, the students of 1ère A are reading a text about natural resources.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$To survive means to continue to live, especially after being in a difficult situation. To consume means to use fuel, energy or time in large quantities. To take away means to remove. A flood is an inundation. Raw material means resources in a natural state. Renewable means able to be produced as quickly as it is used. Care means protection. An offspring is the young of an animal.$$,
        'highlights', array[$$survive, consume, take away, flood$$, $$raw material, renewable, care, offspring$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "raw material" mean?$$, 'solution', $$Resources in a natural state, not yet transformed.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: using the passive$$,
        'body', $$We form the passive with subject + is/are + past participle. Example: "Factories use timber to produce wood." becomes "Wood is used to produce timber." Another example: "Households can use solar energy to lighten their homes." becomes "Solar energy can be used to lighten homes."$$,
        'highlights', array[$$subject + is/are + past participle$$],
        'example', jsonb_build_object('statement', $$Put in the passive: "They kill whales to produce lipsticks."$$, 'solution', $$Whales are killed to produce lipsticks.$$),
        'fixation', jsonb_build_object('question', $$What is the passive form of "He hunts elephants for their tusks"?$$, 'solution', $$Elephants are hunted for their tusks.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: From nature to raw material$$,
        'body', $$Since the earliest human communities, people have survived thanks to things that exist freely in nature: water, land, forests, animals and minerals. These are called natural resources, and they are all connected — if one is taken away, the others are affected too. For example, when a forest is cut down, the soil is exposed, the local animals lose their home, and even the water cycle in the area can be disturbed. Natural resources are often transformed into raw materials before they become the objects we use every day. A tree from a forest can be cut and turned into timber; the timber is then used to produce wood for furniture, or pulp for paper. Nearly every item in a home, from a wooden table to a sheet of paper, came originally from a raw material taken from nature. Some resources are renewable: water keeps flowing, and animals reproduce offspring that replace the adults, as long as they are given proper care. Other resources, such as minerals and fossil fuels, are non-renewable — once they are consumed, they cannot easily be replaced, because they take millions of years to form underground.$$,
        'highlights', array[$$natural resources are all connected$$, $$tree → timber → wood/pulp$$, $$renewable (water, offspring) vs non-renewable (minerals, fossil fuels)$$]::text[],
        'fixation', jsonb_build_object('question', $$According to the text, what happens when a forest is cut down?$$, 'solution', $$The soil is exposed, local animals lose their home, and the water cycle in the area can be disturbed.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On the occasion of the World Environment Day, you are asked to submit an article for your English club magazine about natural resources.$$,
      'questions', array[
        $$Say what natural resources are.$$,
        $$List the different types of resources we have on our planet.$$,
        $$Explain why we should preserve our natural resources (15 lines maximum).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Put in the passive: "Developing countries export raw materials."$$,
      'hint', $$Start with "Raw materials...".$$,
      'expected', $$Raw materials are exported by developing countries.$$
    ),
    jsonb_build_object(
      'question', $$What does "to consume" mean, according to the vocabulary list?$$,
      'hint', $$It's about using something in large quantities.$$,
      'expected', $$To use fuel, energy or time in large quantities.$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, what happens to a tree from a forest before it becomes furniture?$$,
      'hint', $$It goes through two transformation steps.$$,
      'expected', $$It is cut and turned into timber, and the timber is then used to produce wood for furniture.$$
    ),
    jsonb_build_object(
      'question', $$Why are minerals and fossil fuels considered non-renewable?$$,
      'hint', $$It's about the time they take to form.$$,
      'expected', $$Because they take millions of years to form underground, so once they are consumed they cannot easily be replaced.$$
    )
  ),
  now()
);
