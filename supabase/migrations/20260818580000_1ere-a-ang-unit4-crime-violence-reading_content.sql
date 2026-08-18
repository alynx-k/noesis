-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1542: "Unit 4_Crime and Violence_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1542), resource id 12002.
-- Lesson structure (vocabulary, "expressing opinions" grammar point,
-- exercise design) reused from the source PDF (textbook "Far Ahead 1ère").
-- The reading passage "Should gun ownership be regulated?" is a textbook
-- excerpt (copyrighted commercial material) and is replaced by an
-- ENTIRELY ORIGINAL passage covering the same debate (arguments for and
-- against gun regulation) and the same target vocabulary/grammar.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit4-crime-violence-reading',
  '1ere',
  'A',
  'anglais',
  $$Unit 4: Crime and Violence (Reading)$$,
  7,
  '1ere-a-ang-unit3-deadly-viruses-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$On the occasion of the celebration of Martin Luther King Junior's Day, the US embassy is organizing a debate competition for English clubs about the topic: "Do you think it is a good idea to own a gun?" To take part in this debate, you read a text to find some information about the topic.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Average means the result you get when you add values and divide the total by the number of values added. Shocking means something that surprises and upsets very much. Availability means being ready to use, or easy to obtain. Gun-free means without guns. Regulation means control by rules or laws. Unrelated means not linked.$$,
        'highlights', array[$$average, shocking, availability$$, $$gun-free, regulation, unrelated$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "regulation" mean?$$, 'solution', $$Control by rules or laws.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: expressing opinions$$,
        'body', $$To express a personal opinion in a debate, we can use expressions such as "In my opinion...", "As far as I am concerned...", "I think that...", or "Speaking for myself...". Example: "In my opinion, only security forces should have guns." Another example: "As far as I am concerned, the use of guns to solve conflicts leads to more violence."$$,
        'highlights', array[$$in my opinion / as far as I am concerned$$, $$I think that / speaking for myself$$]::text[],
        'fixation', jsonb_build_object('question', $$Give one expression, other than "I think that", used to introduce a personal opinion.$$, 'solution', $$For example "In my opinion", "As far as I am concerned", or "Speaking for myself".$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: Should gun ownership be regulated?$$,
        'body', $$Gun violence remains a major public concern in several countries, and it has caused much debate about whether gun ownership should be more strictly regulated. Those who support regulation argue that every gun in a home or in society is a risk: children might find a gun and fire it accidentally, an argument might turn deadly if a gun is nearby, and guns are often stolen during robberies and later used by criminals against innocent people. They believe that if it is difficult for ordinary citizens to buy guns, it becomes harder for criminals to get them too. Those against regulation argue that citizens have the right to own guns to protect themselves and their property, and that criminals who really want a gun will always find one — legally or on the black market — so regulation mainly affects law-abiding citizens rather than criminals. Studies across the world suggest that violent crime is often the result of deeper social problems, such as poverty and inequality, rather than gun availability alone. So the question remains open: would a gun-free society also be a crime-free society?$$,
        'highlights', array[$$for regulation : fewer accidents, harder for criminals to buy$$, $$against regulation : self-protection, criminals find guns anyway$$, $$violence often linked to social problems$$]::text[],
        'fixation', jsonb_build_object('question', $$According to the text, what argument do people who oppose gun regulation give?$$, 'solution', $$That citizens have the right to own guns to protect themselves and their property, and that criminals will find guns anyway, so regulation mostly affects law-abiding citizens.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You are asked to take part in a debate on the topic: "Do you think it is a good idea to own guns?"$$,
      'questions', array[
        $$Give three reasons why some young people might want to own a gun.$$,
        $$Mention the drawbacks of having a gun for a teenager and for the whole society.$$,
        $$Suggest ideas to reduce gun ownership among young people.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Give one argument in favor of gun regulation, according to the reading text.$$,
      'hint', $$Think about accidents or robberies.$$,
      'expected', $$For example, guns are often stolen during robberies and later used by criminals (also valid: children might fire a gun accidentally).$$
    ),
    jsonb_build_object(
      'question', $$Give one argument against gun regulation, according to the reading text.$$,
      'hint', $$Think about self-defense or the black market.$$,
      'expected', $$For example, citizens have the right to own guns to protect themselves (also valid: criminals will always find a gun, legally or on the black market).$$
    ),
    jsonb_build_object(
      'question', $$What does the text suggest is often the real cause of violent crime, beyond gun availability?$$,
      'hint', $$It's about the structure of society.$$,
      'expected', $$Deeper social problems, such as poverty and inequality.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using an opinion expression: "Guns should be banned completely."$$,
      'hint', $$Start with "In my opinion,".$$,
      'expected', $$In my opinion, guns should be banned completely. (Any correct opinion expression is acceptable.)$$
    )
  ),
  now()
);
