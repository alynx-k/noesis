-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 915: "Unit 2_Natural resources_Listening"
-- (https://lyc.ecole-ci.org/course/view.php?id=915), resource id 4629.
-- Lesson structure (vocabulary, prefixes/antonyms grammar point, exercise
-- design) reused from the source PDF. The listening passage (itself
-- adapted by the PDF's authors from a Britannica Kids article, a
-- copyrighted contemporary source) is replaced by an ENTIRELY ORIGINAL
-- passage covering the same factual content (natural resources,
-- renewable/non-renewable) and the same target vocabulary/grammar,
-- consistent with the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit2-natural-resources-listening',
  '1ere',
  'C',
  'anglais',
  $$Unit 2: Natural Resources (Listening)$$,
  3,
  '1ere-c-ang-unit1-travel-tourism-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During the English class, the students of 1ère C are listening to a recording about the different natural resources in order to get informed about them. They will then discuss some issues related to the protection of our environment.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Natural resources are things that come from earth, plants, animals, water and minerals. Raw materials are materials which are not transformed yet. Something renewable can be naturally replaced; something non-renewable cannot, or takes far too long to be replaced. Extinct means disappeared forever. Species means types of living things.$$,
        'highlights', array[$$natural resources, raw material$$, $$renewable ≠ non-renewable$$, $$extinct, species$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "extinct" mean?$$, 'solution', $$Disappeared forever.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: forming antonyms with prefixes$$,
        'body', $$We can form antonyms (opposite words) by adding a prefix to a word. Common prefixes include im-, un-, in-, dis-, ir- and non-. Examples: legal → illegal, able → unable, different → indifferent, like → dislike, responsible → irresponsible, renewable → non-renewable.$$,
        'highlights', array[$$prefixes: im-, un-, in-, dis-, ir-, non-$$],
        'example', jsonb_build_object('statement', $$Give the antonym of "important" and "necessary".$$, 'solution', $$Unimportant, and unnecessary.$$),
        'fixation', jsonb_build_object('question', $$Which prefix turns "renewable" into its opposite?$$, 'solution', $$Non- (non-renewable).$$)
      ),
      jsonb_build_object(
        'heading', $$Listening passage: Natural resources around us$$,
        'body', $$A natural resource is anything found in nature that people can use. Some resources, such as sunlight, wind and water, are renewable: nature keeps producing them, so they cannot really be used up. Forests and wildlife are also renewable, because plants and animals reproduce — but if people cut down trees faster than they grow back, or hunt animals faster than they can reproduce, whole species can become extinct. Other resources, such as minerals, gold and oil, are non-renewable: they take thousands or millions of years to form underground, so once a country uses them up, they are gone for a very long time. Countries with a large variety of natural resources are often wealthier, because they can sell raw materials such as timber, minerals or oil to other countries. But if these resources are used carelessly, future generations may be left with very little.$$,
        'highlights', array[$$renewable : sunlight, wind, water, forests, wildlife$$, $$non-renewable : minerals, gold, oil$$, $$overuse → extinction / depletion$$]::text[],
        'fixation', jsonb_build_object('question', $$According to the passage, why can hunting cause a species to become extinct?$$, 'solution', $$Because if animals are hunted faster than they can reproduce, their whole population can disappear forever.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On Environment Day, the English Club of your school decides to sensitize its members about how important the preservation of natural resources is. As chairman, you give them a talk on that vital issue.$$,
      'questions', array[
        $$List some of the natural resources your country has.$$,
        $$Mention the consequences of the extinction of a natural resource.$$,
        $$Suggest what should be done to preserve the remaining natural resources.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Give the antonym of "legal" using a prefix from the box (im-, un-, in-, dis-, ir-, non-).$$,
      'hint', $$Think about "illegal activities".$$,
      'expected', $$Illegal.$$
    ),
    jsonb_build_object(
      'question', $$Name two renewable resources mentioned in the listening passage.$$,
      'hint', $$Think of things that nature keeps producing.$$,
      'expected', $$For example sunlight and water (also valid: wind, forests, wildlife).$$
    ),
    jsonb_build_object(
      'question', $$Name two non-renewable resources mentioned in the listening passage.$$,
      'hint', $$They take a very long time to form underground.$$,
      'expected', $$For example minerals and oil (also valid: gold).$$
    ),
    jsonb_build_object(
      'question', $$According to the passage, why are some countries wealthier than others?$$,
      'hint', $$It's related to the variety of resources they have.$$,
      'expected', $$Because they have a large variety of natural resources that they can sell to other countries as raw materials.$$
    )
  ),
  now()
);
