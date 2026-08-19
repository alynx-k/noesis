-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 2231: "UNIT 8: Our cultural heritage_Listening"
-- (https://lyc.ecole-ci.org/course/view.php?id=2231), resource id 20202.
-- Lesson structure (vocabulary, past-tense grammar point) reused from the
-- source PDF (textbook "Far Ahead 1ère"). The listening story is a
-- traditional Anansi-type West African trickster tale (Akan oral
-- folklore, public domain); it is retold here in an ENTIRELY ORIGINAL
-- composition preserving the same plot beats (corn → chicken → sheep →
-- fake dead body → servants) implied by the source PDF's comprehension
-- questions, since no exact verbatim wording of the audio was available.
-- Consistent with the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit8-african-heritage-listening',
  '1ere',
  'C',
  'anglais',
  $$Unit 8: Our Cultural Heritage (Listening)$$,
  15,
  '1ere-c-ang-unit7-political-change-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In order to discuss the benefits of our cultural heritage, students of 1ère C are listening to an African story so as to learn more about its content.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Clever means very intelligent. A trick is a malicious action or plan. A curse is something that causes or brings great harm. Worried means anxious or troubled. Sacred means very respected or protected by spiritual forces. Smeared means completely covered with something.$$,
        'highlights', array[$$clever, tricks, curse$$, $$worried, sacred, smeared$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "sacred" mean?$$, 'solution', $$Very respected or protected by spiritual forces.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: talking about past events$$,
        'body', $$Regular verbs form the past tense with subject + verb + -ed. Example: "The hare climbed the tree." Irregular verbs use a special past form. Example: "The stepmother beat the orphan."$$,
        'highlights', array[$$regular : verb + -ed$$, $$irregular : special past form$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the past tense form of the regular verb "climb"?$$, 'solution', $$Climbed.$$)
      ),
      jsonb_build_object(
        'heading', $$Listening: Anansi and the trade-up trick$$,
        'body', $$Anansi the spider was famous throughout the village for being clever — perhaps too clever. One dry season, when his family had nothing to eat, Anansi asked God for a single ear of corn, promising to plant it and share the harvest. Instead of planting it, Anansi traded the corn to a farmer for a chicken, telling him the corn was magical and would bring good luck. He then traded the chicken to a shepherd for ten sheep, claiming the bird could predict the weather. That night, Anansi smeared himself with red palm oil, lay perfectly still among his sheep, and pretended to be a dead body — God's own son, he told the frightened villagers who found him the next morning. Worried about bringing a curse upon the village by mistreating what they believed was sacred, the villagers offered Anansi one hundred young servants in exchange for a proper, respectful burial. Anansi, of course, simply stood up once the servants were his, laughing at his own trick. But his cleverness eventually caught up with him: the villagers, furious when they discovered the deception, chased Anansi out of the village forever, and from that day on, people say, spiders learned to live alone in dark corners, trusted by no one.$$,
        'highlights', array[$$corn → chicken → sheep → fake body → servants$$, $$Anansi = trickster figure$$, $$moral : cleverness without honesty has a price$$]::text[],
        'fixation', jsonb_build_object('question', $$What did the villagers offer Anansi in exchange for burying the "dead body" respectfully?$$, 'solution', $$One hundred young servants.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$After listening to a story in class, you are asked by your teacher to make a presentation on the importance of stories in Africa.$$,
      'questions', array[
        $$Tell who African stories are intended for.$$,
        $$List the topics covered by these stories.$$,
        $$Give the importance of storytelling in African culture.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What did Anansi originally ask God for at the start of the story?$$,
      'hint', $$It's a small quantity of a staple crop.$$,
      'expected', $$An ear of corn.$$
    ),
    jsonb_build_object(
      'question', $$What did Anansi trade the corn for?$$,
      'hint', $$It's a farm animal, small.$$,
      'expected', $$A chicken.$$
    ),
    jsonb_build_object(
      'question', $$What did Anansi trade the chicken for?$$,
      'hint', $$Ten of a woolly farm animal.$$,
      'expected', $$Ten sheep.$$
    ),
    jsonb_build_object(
      'question', $$Who did Anansi pretend to be when he lay still, smeared in palm oil?$$,
      'hint', $$He claimed a divine identity.$$,
      'expected', $$God's own son (a dead body he claimed was sacred).$$
    )
  ),
  now()
);
