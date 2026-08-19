-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 917: "Unit 1_Travel and World Tourism_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=917), resource id 4653.
-- Lesson structure (vocabulary list, relative-word grammar point, exercise
-- types) reused from the source PDF. The reading passage "Ecotourism: What
-- on Earth Is It?" (itself adapted by the PDF's authors from a 2016 online
-- article, not clearly public domain) is replaced by an ENTIRELY ORIGINAL
-- passage covering the exact same vocabulary and grammar point (relative
-- words who/which/when/where), preserving the same pedagogical structure,
-- consistent with the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit1-travel-tourism-reading',
  '1ere',
  'C',
  'anglais',
  $$Unit 1: Travel and World Tourism (Reading)$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$On the occasion of an Exchange Programme for Students in Ghana, your class is going to visit some tourist attractions in Cape Coast. You are given a text to read in order to learn how tourism can help value and preserve nature.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Ecotourism is the business of organizing tours to natural areas, or the activity of visiting such a place on holiday, being careful not to damage the natural environment. Something sustainable is able to last long without causing damage to the environment. A package is a set of ideas or services offered together as a group. A commitment is a promise to do something or to behave in a particular way. Genuine means authentic. To involve means to include. Similar is the opposite of different.$$,
        'highlights', array[$$ecotourism, sustainable, package$$, $$commitment, genuine, involve, similar$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the opposite of "different"?$$, 'solution', $$Similar.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: joining sentences with relative words$$,
        'body', $$We can use relative words (who – which – when – where) to join two sentences into a single, more meaningful one. Example: "Local farmers grow food. Local farmers supply hotels with their products." becomes "Local farmers who grow food supply hotels with their products."$$,
        'highlights', array[$$who = people$$, $$which = things$$, $$when = time ; where = place$$]::text[],
        'example', jsonb_build_object('statement', $$Join: "The river is full of crocodiles. The river is dying out."$$, 'solution', $$The river, which is full of crocodiles, is dying out.$$),
        'fixation', jsonb_build_object('question', $$Which relative word do we use to refer to a place?$$, 'solution', $$Where.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: Discovering ecotourism in a rainforest village$$,
        'body', $$Kakum Rainforest Lodge is a small hotel where visitors can experience genuine ecotourism. The lodge involves the local community in every part of its business: local farmers who grow vegetables and fruits supply the kitchen, and guides who know the forest well lead the walking tours. The owners made a strong commitment to sustainable practices when they built the lodge: they use solar panels, collect rainwater, and never cut down trees which are older than fifty years. Tourists who stay there often say the experience is similar to living inside the forest itself, surrounded by birds and waterfalls. The lodge offers a simple package that includes meals, a guided walk, and a boat trip on the river where hippos sometimes appear at dawn. Local leaders believe this kind of tourism, when it truly respects nature and people, can protect the forest for future generations.$$,
        'highlights', array[$$genuine ecotourism$$, $$commitment to sustainable practices$$, $$package : meals + guided walk + boat trip$$]::text[],
        'fixation', jsonb_build_object('question', $$According to the text, what does the lodge use to be more sustainable?$$, 'solution', $$Solar panels and rainwater collection, and it avoids cutting down trees older than fifty years.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$After your visit to Cape Coast, you decide to write an article for your school English club magazine to inform the members about ecotourism.$$,
      'questions', array[
        $$Say what ecotourism is.$$,
        $$Give two advantages of ecotourism.$$,
        $$Encourage your friends to promote ecotourism (15 lines maximum).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "A ______ is a promise to do something or to behave in a particular way."$$,
      'hint', $$It starts with "com-".$$,
      'expected', $$Commitment.$$
    ),
    jsonb_build_object(
      'question', $$Join with a relative word: "It was that day. Tourists came first to our village."$$,
      'hint', $$Use the relative word for time.$$,
      'expected', $$It was the day when tourists came first to our village.$$
    ),
    jsonb_build_object(
      'question', $$Join with a relative word: "It's the house on the hill. Tourists like spending the night there."$$,
      'hint', $$Use the relative word for place.$$,
      'expected', $$It's the house on the hill where tourists like spending the night.$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, what does the lodge's package include?$$,
      'hint', $$Three things are listed.$$,
      'expected', $$Meals, a guided walk, and a boat trip on the river.$$
    )
  ),
  now()
);
