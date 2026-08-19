-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 2229: "UNIT 7: POLITICAL CHANGE_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=2229), resource id 20178.
-- Contenu réécrit à partir du PDF source (vocabulaire des élections, ordre
-- des adjectifs). Vocabulaire, règle grammaticale et exercices factuels
-- repris/adaptés tels quels ; explications reformulées. Consistent with
-- the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit7-political-change-speaking',
  '1ere',
  'C',
  'anglais',
  $$Unit 7: Political Change (Speaking)$$,
  14,
  '1ere-c-ang-unit7-political-change-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$The English Club of your school has invited a guest speaker to give a talk about the importance of having peaceful elections in Africa. After the conference, the club members discuss the issue so as to sensitize their schoolmates.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$An election is a way of choosing a person or a representative by a vote. A candidate is a person who applies for a position. A campaign is a series of organized activities to reach a goal. A political party is an organized group of people who share the same ideology. A billboard is a large outdoor board for displaying ideas or advertisements. A voter is a person who has the right to vote or express an opinion through a vote.$$,
        'highlights', array[$$election, candidate, campaign$$, $$political party, billboard, voter$$]::text[],
        'fixation', jsonb_build_object('question', $$What is a "candidate"?$$, 'solution', $$A person who applies for a position, for example in an election.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: placing adjectives in the right order$$,
        'body', $$When several adjectives describe the same noun, they follow a specific order: Quantity + General quality + Specific quality + Size/shape + Age + Colour + Nationality. Example: "She is a travel agent (Senegalese – young – beautiful)" becomes "She is a beautiful young Senegalese travel agent."$$,
        'highlights', array[$$quantity → general quality → specific quality → size/shape → age → colour → nationality$$]::text[],
        'example', jsonb_build_object('statement', $$Order these adjectives correctly: "book" (green, heavy, big).$$, 'solution', $$My big, heavy, green book. (size/shape → then colour, following the order rule)$$),
        'fixation', jsonb_build_object('question', $$In the adjective order rule, which comes first: age or nationality?$$, 'solution', $$Age comes before nationality (Quantity, General quality, Specific quality, Size/shape, Age, Colour, Nationality).$$)
      ),
      jsonb_build_object(
        'heading', $$Democracy: rights and responsibilities$$,
        'body', $$A democracy is a system of government in which the people of a country choose their own leaders through free and personal votes. Citizens have rights (freedom of expression, the right to vote once they reach the legal voting age) and responsibilities (paying taxes if they earn money), while the government has a responsibility to spend tax revenues wisely and to announce election results transparently, not to dictate which party citizens must support.$$,
        'highlights', array[$$democracy = people choose their own leaders$$, $$rights : vote, free expression$$, $$responsibilities : taxes, transparent results$$]::text[],
        'fixation', jsonb_build_object('question', $$Is it true that in a democracy, citizens must vote for a political party chosen by the government?$$, 'solution', $$False — in a democracy, citizens freely choose which political party or candidate to vote for.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You attended a conference on the issue of elections in the world. Back at your school, you have to make a presentation on it in front of the members of your English club.$$,
      'questions', array[
        $$Explain the importance of elections in a democratic country.$$,
        $$List the different sorts of elections organized in your country.$$,
        $$Give some examples of organization problems that can occur during elections.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Which word means "a series of organized activities to reach a goal", used in an electoral context?$$,
      'hint', $$It's what candidates run before an election.$$,
      'expected', $$Campaign.$$
    ),
    jsonb_build_object(
      'question', $$Order correctly: "Langston Hughes came from a ___ family." (American, poor)$$,
      'hint', $$General quality comes before nationality.$$,
      'expected', $$Langston Hughes came from a poor American family.$$
    ),
    jsonb_build_object(
      'question', $$What is a "billboard"?$$,
      'hint', $$It's used for advertising outdoors.$$,
      'expected', $$A large outdoor board for displaying ideas or advertisements.$$
    ),
    jsonb_build_object(
      'question', $$In most democracies, what is the minimum age to vote, according to the lesson?$$,
      'hint', $$It's the standard age of adulthood cited in the lesson.$$,
      'expected', $$18 years old.$$
    )
  ),
  now()
);
