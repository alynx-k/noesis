-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1556: "Unit 6_Technology and our lives_Writing"
-- (https://lyc.ecole-ci.org/course/view.php?id=1556), resource id 12170.
-- Contenu réécrit à partir du PDF source (vocabulaire, comparatifs simples
-- et doubles). Vocabulaire, règles grammaticales et exercices factuels
-- repris/adaptés tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit6-technology-lives-writing',
  '1ere',
  'A',
  'anglais',
  $$Unit 6: Technology and Our Lives (Writing)$$,
  12,
  '1ere-a-ang-unit6-technology-lives-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Students of 1ère A are preparing an article about technology in our lives. In order to have more information, they jot down ideas about the topic.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$An issue is a subject or problem people discuss. Online means connected to the internet. To advertise means to promote a product or service. Outdated means old-fashioned, no longer useful. To apply means to use or put into practice. Networking means building connections with other people, often for business or careers.$$,
        'highlights', array[$$issue, online, advertise$$, $$outdated, apply, networking$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "outdated" mean?$$, 'solution', $$Old-fashioned, no longer useful.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: simple comparatives$$,
        'body', $$We use "fewer" with countable nouns: "There are fewer people without cellphones these days." We use "less" with uncountable nouns: "We need to remember less information because we can access it at the touch of a button." We can use "much" before a comparative adjective/adverb: "It is much easier to send a message than to speak to a person."$$,
        'highlights', array[$$fewer + countable noun$$, $$less + uncountable noun$$, $$much + comparative$$]::text[],
        'fixation', jsonb_build_object('question', $$Should you use "fewer" or "less" with "computers"?$$, 'solution', $$Fewer, because "computers" is a countable noun.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: double comparatives$$,
        'body', $$We use double comparatives to show that something is gradually changing. Examples: "Fewer and fewer people can write neatly in cursive script." / "More and more people have their own computers or tablets." / "Children have less and less time to play."$$,
        'highlights', array[$$fewer and fewer / more and more / less and less$$],
        'example', jsonb_build_object('statement', $$Use a double comparative to describe how many people own smartphones over time.$$, 'solution', $$More and more people own smartphones every year.$$),
        'fixation', jsonb_build_object('question', $$What kind of change do double comparatives express?$$, 'solution', $$A gradual, ongoing change (something increasing or decreasing over time).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For your school English club magazine, you have to write an article on the topic: "How is technology important in our lives?"$$,
      'questions', array[
        $$Explain what technology is.$$,
        $$Give some domains in which the advantages of technology can be seen.$$,
        $$Describe the difference between life before and after technology in these domains (20 lines maximum).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "Twenty years ago there were ___ (few) computers than there are today."$$,
      'hint', $$Use the comparative of "few".$$,
      'expected', $$Fewer.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Old computers had ___ (little) storage capacity than modern ones."$$,
      'hint', $$Use the comparative of "little".$$,
      'expected', $$Less.$$
    ),
    jsonb_build_object(
      'question', $$What does "networking" mean?$$,
      'hint', $$It's related to building professional connections.$$,
      'expected', $$Building connections with other people, often for business or careers.$$
    ),
    jsonb_build_object(
      'question', $$Give a double comparative sentence about the number of people using online learning.$$,
      'hint', $$Use "more and more" or a similar structure.$$,
      'expected', $$Any correct double comparative, e.g. "More and more people are using online learning."$$
    )
  ),
  now()
);
