-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 916: "Unit 1_Travel and World Tourism_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=916), resource id 4641.
-- Contenu réécrit à partir du PDF source (vocabulaire, fonction langagière
-- "describing/defining concepts", activités). Vocabulaire et exercices
-- factuels repris/adaptés tels quels ; explications reformulées.
-- Consistent with the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit1-travel-tourism-speaking',
  '1ere',
  'C',
  'anglais',
  $$Unit 1: Travel and World Tourism (Speaking)$$,
  2,
  '1ere-c-ang-unit1-travel-tourism-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In order to prepare for a conference that is going to take place on the occasion of the World Environment Day, you are having a talk with your classmates on the preservation of nature.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$To travel is the fact of moving from one place to another. Tourism is the fact of travelling to visit different places for leisure and/or discovery. Ecotourism is tourism done with the objective of preserving nature. Ecology is the way plants, animals and people are related to each other and to their environment, or the scientific study of this. Wildlife means the world of plants and animals in nature. Sustainable means durable. A location is a place, a site or an area. A tour is a journey planned to visit different sites. Fun means enjoyment. Indigenous people are the local or native population of an area.$$,
        'highlights', array[$$travel, tourism, ecotourism, ecology$$, $$wildlife, sustainable, location, tour, indigenous people$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the difference between "tourism" and "ecotourism"?$$, 'solution', $$Tourism is simply travelling to visit places for leisure or discovery, while ecotourism is tourism done specifically with the objective of preserving nature.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: describing / defining concepts$$,
        'body', $$To describe or define concepts or notions, we generally use the present simple tense, often with the verbs "is", "means" or "supports". Example: "Ecotourism is tourism which preserves nature." Another example: "Wildlife means the world of plants and animals in nature."$$,
        'highlights', array[$$present simple + is / means / supports$$],
        'example', jsonb_build_object('statement', $$Define "indigenous people" using the pattern "X means Y".$$, 'solution', $$Indigenous people means the local or native population of an area.$$),
        'fixation', jsonb_build_object('question', $$Which verb tense do we typically use to define a concept in English?$$, 'solution', $$The present simple tense.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking: presenting nature preservation$$,
        'body', $$On the occasion of the World Environment Day, the English club of a school organizes a conference on nature preservation. As chairman of the club, a student presents: first defining ecotourism ("Ecotourism is tourism which respects wildlife and supports indigenous people"), then listing its advantages (it protects natural locations, it creates income for local communities, it is more sustainable than mass tourism), and finally encouraging classmates to preserve nature by choosing responsible tours.$$,
        'highlights', array[$$define → advantages → call to action$$],
        'fixation', jsonb_build_object('question', $$What are the three parts of a good presentation on ecotourism, according to this lesson?$$, 'solution', $$Say what ecotourism is, give its advantages, and encourage people to preserve nature.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Discuss ecotourism in your country, or in the area where you live. Identify an example of ecotourism and discuss it. Report back to the rest of the class.$$,
      'questions', array[
        $$Identify the origins of the tourists in your example.$$,
        $$Cite the people who benefit from this tourism and explain how they benefit.$$,
        $$Say if this tourism is sustainable or not, and justify your answer.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Match: "Sustainable" means...$$,
      'hint', $$It is close to the word "durable".$$,
      'expected', $$That can last long (without damaging the environment).$$
    ),
    jsonb_build_object(
      'question', $$Define "tourism" using the pattern "X is Y".$$,
      'hint', $$Use the present simple with "is".$$,
      'expected', $$Tourism is the fact of travelling to visit different places for leisure and/or discovery.$$
    ),
    jsonb_build_object(
      'question', $$What does "wildlife" mean?$$,
      'hint', $$It's about animals and plants.$$,
      'expected', $$The world of plants and animals in nature.$$
    ),
    jsonb_build_object(
      'question', $$Who are "indigenous people"?$$,
      'hint', $$Think of "local" or "native".$$,
      'expected', $$The local or native population of an area.$$
    )
  ),
  now()
);
