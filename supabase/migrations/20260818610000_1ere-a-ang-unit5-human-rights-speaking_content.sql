-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1552: "Unit 5_Human Rights_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=1552), resource id 12122.
-- Contenu réécrit à partir du PDF source (vocabulaire, 1st/2nd conditional
-- "if clauses"). Vocabulaire et exercices factuels repris/adaptés tels
-- quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit5-human-rights-speaking',
  '1ere',
  'A',
  'anglais',
  $$Unit 5: We All Have Rights and Deserve Respect (Speaking)$$,
  10,
  '1ere-a-ang-unit5-human-rights-writing',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$After a conference on human rights, students of 1ère A decide to talk about the matter so as to help everyone enjoy their rights.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$A right is a moral or legal claim to have or get something, or to behave in a particular way. A law is the whole system of rules that everyone in a country or society must obey. Peace is a situation with no war or violence in a country. Freedom is the right to do or say what you want without anyone stopping you (the opposite of slavery). Hope is the opposite of despair. Disregard means treating somebody as unimportant.$$,
        'highlights', array[$$right, law, peace$$, $$freedom (≠ slavery), hope (≠ despair), disregard$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the opposite of "freedom"?$$, 'solution', $$Slavery.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: the first conditional (probable condition)$$,
        'body', $$Structure: If + subject + present simple, subject + future. Example: "If you want the disease to end, you will accept to stay indoors." Another example: "We will be confronted with a lack of money if the pandemic doesn't find a solution."$$,
        'highlights', array[$$If + present simple, + future$$],
        'fixation', jsonb_build_object('question', $$Complete: "If they ___ (get) scholarships, the girls will be able to study."$$, 'solution', $$If they get scholarships, the girls will be able to study.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: the second conditional (improbable condition)$$,
        'body', $$Structure: If + subject + preterit (simple past), subject + conditional (would + base verb). Example: "If girls all got scholarships, they would all be able to study." Another example: "There would be peace everywhere in the world if women played the first role in politics."$$,
        'highlights', array[$$If + simple past, + would + base verb$$],
        'example', jsonb_build_object('statement', $$Give the second conditional form: "If he ___ (offer) a car, I would be happy."$$, 'solution', $$If he offered a car, I would be happy.$$),
        'fixation', jsonb_build_object('question', $$What is the key difference between the first and second conditional?$$, 'solution', $$The first conditional expresses a probable/realistic condition (present simple + future), while the second conditional expresses an improbable or hypothetical one (simple past + would).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$During your last English club session, you are asked to make a speech on the importance of human rights for human beings.$$,
      'questions', array[
        $$Tell your audience what human rights are.$$,
        $$Explain how they are guaranteed by the constitution.$$,
        $$Describe the problems which can result from their disrespect.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "We should all have the ___ of expression." (right / freedom / law)$$,
      'hint', $$It's about being able to speak your mind.$$,
      'expected', $$Freedom (freedom of expression).$$
    ),
    jsonb_build_object(
      'question', $$What word describes the worst form of exploitation in world history, where people are owned as property?$$,
      'hint', $$It's the opposite of freedom.$$,
      'expected', $$Slavery.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the first conditional: "She will not be able to finish school if she ___ (marry) at the age of 14."$$,
      'hint', $$Use the present simple after "if".$$,
      'expected', $$She will not be able to finish school if she marries at the age of 14.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the second conditional: "If he ___ (work) hard, he would pass his exam."$$,
      'hint', $$Use the simple past after "if".$$,
      'expected', $$If he worked hard, he would pass his exam.$$
    )
  ),
  now()
);
