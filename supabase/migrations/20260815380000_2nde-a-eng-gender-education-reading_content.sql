-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1444: "Unit 5, Gender and Education  Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1444)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10826,
-- redirecting to pluginfile "Unit 5, Gender and Education  Reading.pdf"
-- (Far Ahead 2nde, pp. 60-62). Read directly in the browser PDF viewer
-- (page-by-page screenshots, zoomed in where needed); no file was
-- persisted to disk. The worksheet's own reading passage about barriers
-- to girls' education in Africa is a longer informational article, so it
-- is NOT reproduced or closely paraphrased here: the reading text below
-- is original writing conveying the same general, non-copyrightable facts
-- (school fees, distance to school, lack of separate toilets, early
-- marriage, and recent progress) in different wording. The vocabulary
-- (means, fees, enrolment, attendance, assaults, legislating), the
-- some/any quantifying rule, the three education quotations (Malala, an
-- African proverb, Victor Hugo), and the activity types (matching quotes
-- to the text, vocabulary and quantifier gap-fill, comprehension
-- questions, and a letter-writing task about gender equality) are
-- paraphrased from the worksheet's instructions. Course content and
-- exercises are entirely in English by design: this is an
-- English-immersion lesson, not a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-gender-education-reading',
  '2nde',
  'A',
  'anglais',
  $$Unit 5 - Gender and Education: Reading About Girls' Education$$,
  9,
  '2nde-a-eng-looking-forward-writing',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A poster reading "EDUCATION FOR ALL..." shows a crowd of women at a rally. Students are asked what these women are doing, what they are claiming, and whether inequality still exists in their own country. To take part in a school campaign for girls' education, Seconde students then read a short text on the subject.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: talking about access to school$$,
        'body', $$Means (used as a plural noun here) refers to methods or ways of achieving something. Fees are the money paid to attend school. Enrolment is the act of officially joining a school. Attendance means being present, actually going to school regularly. Assaults are physical attacks on someone. Legislating means making laws.$$,
        'highlights', array[$$fees$$, $$enrolment$$, $$attendance$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Means$$, $$Methods, ways of achieving something$$),
            jsonb_build_array($$Fees$$, $$Money paid to attend school$$),
            jsonb_build_array($$Enrolment$$, $$The act of officially joining a school$$),
            jsonb_build_array($$Attendance$$, $$Being present, going to school regularly$$),
            jsonb_build_array($$Assaults$$, $$Physical attacks on someone$$),
            jsonb_build_array($$Legislating$$, $$Making laws$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the difference between "enrolment" and "attendance"?$$, 'solution', $$"Enrolment" is officially joining a school, while "attendance" is actually being present and going regularly once enrolled.$$)
      ),
      jsonb_build_object(
        'heading', $$Quantifying: "some" and "any"$$,
        'body', $$"Some" is generally used in affirmative sentences: "Some cultures prevent girls from studying." "Any" is generally used in negative and interrogative sentences: "There aren't any toilets for girls in my school." / "Is there any teacher in the classroom?"$$,
        'highlights', array[$$some$$, $$any$$]::text[],
        'example', jsonb_build_object('statement', $$Choose "some" or "any": "In ______ countries, more girls now attend university than boys."$$, 'solution', $$"In some countries, more girls now attend university than boys." (affirmative sentence, so "some")$$),
        'fixation', jsonb_build_object('question', $$Choose "some" or "any": "Is there ______ discrimination left in your school?"$$, 'solution', $$"Any" (interrogative sentence).$$)
      ),
      jsonb_build_object(
        'heading', $$Three quotations about education$$,
        'body', $$Before reading, it can help to compare well-known quotations about education and decide which one best captures the topic sentence of each paragraph you are about to read: (A) "One child, one teacher, one pen and one book can change the world. Education is the only solution. Education first." (Malala); (B) "If you educate a boy, you educate a person. But if you educate a girl, you educate a whole nation." (African proverb); (C) "Who opens a school door, closes a prison." (Victor Hugo).$$,
        'highlights', array[$$Malala$$, $$African proverb$$, $$Victor Hugo$$]::text[],
        'fixation', jsonb_build_object('question', $$Which of the three quotations best expresses the specific idea that educating girls benefits an entire nation, not just one person?$$, 'solution', $$Quotation (B), the African proverb: "If you educate a boy, you educate a person. But if you educate a girl, you educate a whole nation."$$)
      ),
      jsonb_build_object(
        'heading', $$Reading text: The Long Road to the Classroom$$,
        'body', $$Across many communities, educating girls is recognised as one of the most powerful ways to improve a family's and a society's future, yet in parts of sub-Saharan Africa almost as many girls as boys still receive no schooling at all. Poverty is a major reason: when a family cannot afford fees, uniforms and books for every child, boys are often sent to school first. Some countries have made real progress by removing school fees altogether, and enrolment for girls has risen sharply as a result. Even when girls are enrolled, the school environment itself can discourage attendance: long, unsafe walks to school worry parents, and schools without separate toilets for girls can expose them to embarrassment or harassment. Traditional attitudes also play a role, as some communities still expect girls to marry young and stay home rather than study. Despite these obstacles, things are improving: more schools now welcome girls, more female teachers are being trained, and several governments are legislating against child marriage and abolishing school fees, gradually closing the education gap between boys and girls.$$,
        'highlights', array[$$education gap$$, $$school fees$$, $$child marriage$$]::text[]
      ),
      jsonb_build_object(
        'heading', $$Comprehension: causes and progress$$,
        'body', $$After reading, typical comprehension questions ask: in which parts of Africa is gender inequality in education still a serious problem? Why is sending a child to school expensive for some families? Why do some poor families choose to educate boys rather than girls? How have some countries managed to increase girls' enrolment? What conditions in schools can expose girls to harassment? And what measures are currently helping to close the education gap?$$,
        'highlights', array[$$comprehension questions$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one measure mentioned in the text that is helping to close the education gap between girls and boys.$$, 'solution', $$For example: abolishing school fees, training more female teachers, or legislating against child marriage.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your British pen friend writes that one of their teachers said many girls in Africa do not go to school, and asks what the situation is in your own country and what you think of gender discrimination in education.$$,
      'questions', array[
        $$Describe, in your own words, the situation of girls' education in your country.$$,
        $$Mention some consequences this situation can have for girls.$$,
        $$Suggest some solutions to gender discrimination in education.$$,
        $$Using "some" or "any" correctly, write one sentence about barriers to girls' education.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What word means "the money paid to attend school"?$$,
      'hint', $$Families sometimes cannot afford it for every child.$$,
      'expected', $$Fees.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "There aren't __________ toilets for girls in this school."$$,
      'hint', $$This is a negative sentence.$$,
      'expected', $$"Any" (there aren't any toilets...).$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, what is one reason poor families might send boys to school rather than girls?$$,
      'hint', $$Think about the cost of fees, uniforms and books for every child.$$,
      'expected', $$Because they cannot afford to pay for every child's education, so boys are often prioritised.$$
    ),
    jsonb_build_object(
      'question', $$Name one way countries mentioned in the text are trying to close the education gap.$$,
      'hint', $$Think about fees, teachers, or laws.$$,
      'expected', $$Abolishing school fees, training more female teachers, or legislating against child marriage.$$
    )
  ),
  now()
);
