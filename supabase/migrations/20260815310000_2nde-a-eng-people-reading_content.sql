-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1432: "Unit 1_People_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1432)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10682,
-- redirecting to pluginfile "Unit 1_People_Reading.pdf" (Far Ahead 2nde,
-- page 12). Read directly in the browser PDF viewer (page-by-page
-- screenshots); no file was persisted to disk. The worksheet itself does
-- not reproduce the textbook's reading passage (only vocabulary, the
-- "expressing opinions" language function, and activity instructions
-- around a text on peer pressure), so the reading passage below is
-- original writing built to match that vocabulary set and those
-- activities. Rewritten/paraphrased from the source worksheet: the
-- give in/fit in/deal with/believe in/grow up/skive off/stand up for/back
-- up vocabulary, the opinion-expressing structures, the main-idea /
-- gap-fill / comprehension-question activities, and the closing
-- communication task about peer pressure. 100% original wording; no
-- sentence copied from the source. Course content and exercises are
-- entirely in English by design: this is an English-immersion lesson, not
-- a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-people-reading',
  '2nde',
  'A',
  'anglais',
  $$Unit 1 - People: Reading About Peer Pressure$$,
  2,
  '2nde-a-eng-people-listening',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A poster shows a worried-looking teenage boy surrounded by speech bubbles full of judging eyes and comments. Seconde A2 students at a city high school are about to read a short text about peer pressure, because their English Club is preparing a class debate on "Peer Pressure and Its Impact on Students." Before reading, they must think: How does the boy in the picture feel? Why does he feel that way? What effect can friends' attitudes have on someone like him?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary for talking about peer pressure$$,
        'body', $$Texts about peer pressure often rely on a small set of phrasal verbs and expressions. To give in means to stop resisting and accept doing something you did not really want to do. To fit in means to be accepted as similar to everyone else in a group. To deal with something means to face it and manage it. To believe in an idea means to hold a firm conviction about it. To grow up means to become an adult, and is often used to criticise childish behaviour. To skive off (school) means to stay away without permission. To stand up for something means to defend an opinion or a value even under pressure, and to back somebody up means to support and help them.$$,
        'highlights', array[$$give in$$, $$fit in$$, $$stand up for$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Give in$$, $$Stop resisting, accept to do something$$),
            jsonb_build_array($$Fit in$$, $$Be accepted as similar to the group$$),
            jsonb_build_array($$Deal with$$, $$Face or manage a difficulty$$),
            jsonb_build_array($$Believe in$$, $$Have a firm conviction about something$$),
            jsonb_build_array($$Grow up$$, $$Become an adult, stop acting childishly$$),
            jsonb_build_array($$Skive off$$, $$Stay away from school without permission$$),
            jsonb_build_array($$Stand up for$$, $$Defend an opinion or a value$$),
            jsonb_build_array($$Back somebody up$$, $$Support or help someone$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the difference between "fit in" and "stand up for" something?$$, 'solution', $$"Fit in" means accepting to be like the group, while "stand up for" means defending your own opinion even if it goes against the group.$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing your opinion in English$$,
        'body', $$When you give a personal opinion in English, especially in a debate, you rarely just state a fact. You introduce it with a phrase that signals it is your point of view. Common openers include "To my mind," "From my point of view," and "As far as I'm concerned." Placing one of these at the start of a sentence makes clear that what follows is an opinion, which is exactly what a debate about a topic like peer pressure requires.$$,
        'highlights', array[$$To my mind$$, $$From my point of view$$, $$As far as I'm concerned$$]::text[],
        'example', jsonb_build_object('statement', $$Rewrite as an opinion: "Peer pressure is a serious problem at school."$$, 'solution', $$"As far as I'm concerned, peer pressure is a serious problem at school." (or "To my mind, ..." / "From my point of view, ...")$$),
        'fixation', jsonb_build_object('question', $$Give one English phrase you can use to introduce your personal opinion.$$, 'solution', $$Any of: "To my mind," / "From my point of view," / "As far as I'm concerned,".$$)
      ),
      jsonb_build_object(
        'heading', $$Reading text: Caught Between Two Worlds$$,
        'body', $$Amara is sixteen. At school, her closest friends spend their break time mocking classmates who dress differently or who prefer studying to hanging out at the school gate. One afternoon, they ask her to skive off the last class with them to watch a football match at a friend's house. Amara wants to fit in and is afraid that if she does not give in, the group will exclude her. Still, she believes in the importance of her studies and knows her parents trust her. She takes a deep breath and tells them she cannot deal with missing another lesson this term, but she promises to watch the replay with them after school. To her surprise, one of the boys backs her up, saying he also finds it hard to concentrate when he skips class. Slowly, the group agrees to wait until after school. Amara realises that standing up for what she believes in did not cost her their friendship after all.$$,
        'highlights', array[$$peer pressure$$, $$fit in$$, $$stand up for$$]::text[]
      ),
      jsonb_build_object(
        'heading', $$Reading for the main idea$$,
        'body', $$Before answering detailed questions, a good reader first checks what a text is mainly about, by comparing it to a short list of possible summaries and eliminating the ones that do not match. For "Caught Between Two Worlds", a reader could be offered three choices: (a) teenagers misbehaving at school, (b) the causes of juvenile delinquency, or (c) the impact friends' attitudes can have on a teenager's choices. Only one choice truly matches the whole text, not just a small detail of it.$$,
        'highlights', array[$$main idea$$, $$skimming$$]::text[],
        'example', jsonb_build_object('statement', $$Which of the three choices above best matches "Caught Between Two Worlds"?$$, 'solution', $$Choice (c): the text is mainly about the impact friends' attitudes can have on a teenager's decisions.$$),
        'fixation', jsonb_build_object('question', $$Why is it useful to eliminate wrong choices instead of trying to remember every detail first?$$, 'solution', $$Because identifying the main idea quickly helps you understand the overall purpose of the text before you focus on smaller details.$$)
      ),
      jsonb_build_object(
        'heading', $$Using vocabulary in context (gap-fill practice)$$,
        'body', $$Once the meaning of an expression is known, the next step is recognising which one fits naturally into a new sentence. In this kind of exercise, you are given a sentence with a gap and must choose the expression from the vocabulary list whose meaning fits, then put it in the correct grammatical form (for example, adding "-ed" or "-ing" where needed).$$,
        'highlights', array[$$gap-fill$$, $$correct form$$]::text[],
        'example', jsonb_build_object('statement', $$Complete with the correct expression: "Amara did not want to __________ and miss another class, even though her friends insisted."$$, 'solution', $$"...did not want to give in and miss another class..." (give in fits the meaning of stopping resistance).$$),
        'fixation', jsonb_build_object('question', $$Which expression from the vocabulary list means the opposite of resisting pressure?$$, 'solution', $$"Give in" (to stop resisting and accept doing something).$$)
      ),
      jsonb_build_object(
        'heading', $$Discussing peer pressure and writing your opinion$$,
        'body', $$After reading, a text like this is usually followed by comprehension and opinion questions: Is it easy to resist peer pressure? What reasons push people to give in to it? How can peer pressure affect someone, positively or negatively? What tends to happen to someone who successfully resists it? These questions prepare a final writing or speaking task, for example contributing a short written opinion piece to a class debate, in which you define peer pressure, give examples you know of, and state clearly whether you think it is mostly positive or mostly negative.$$,
        'highlights', array[$$comprehension questions$$, $$opinion writing$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one reason a teenager might give in to peer pressure, based on the reading text.$$, 'solution', $$For example, the fear of being excluded from the group if they do not go along with their friends' wishes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$A pen pal abroad has never heard of "peer pressure" and asks you, in a letter, to explain the phenomenon: what it is, why some teenagers cannot resist it, and what happens when someone chooses to resist and defend their own values instead.$$,
      'questions', array[
        $$Define peer pressure in your own words, using at least one expression from the vocabulary list.$$,
        $$Explain, using an opinion structure such as "To my mind," why some teenagers find it hard to resist peer pressure.$$,
        $$Describe what happened to Amara in the reading text when she decided to stand up for what she believed in.$$,
        $$Give your own opinion: is peer pressure always negative, or can it sometimes be positive? Justify your answer.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What phrasal verb means "to stop resisting and accept doing something"?$$,
      'hint', $$It is the opposite of standing your ground.$$,
      'expected', $$Give in.$$
    ),
    jsonb_build_object(
      'question', $$What phrasal verb means "to be accepted as similar to everyone else in a group"?$$,
      'hint', $$It is what Amara wanted to do with her friends.$$,
      'expected', $$Fit in.$$
    ),
    jsonb_build_object(
      'question', $$Give one English expression used to introduce a personal opinion.$$,
      'hint', $$Think of the three structures presented in the "Expressing opinions" section.$$,
      'expected', $$"To my mind," or "From my point of view," or "As far as I'm concerned,".$$
    ),
    jsonb_build_object(
      'question', $$In the reading text, what did Amara refuse to do even though her friends insisted?$$,
      'hint', $$It involved missing a class to watch a football match.$$,
      'expected', $$She refused to skive off her last class to watch the football match with her friends.$$
    )
  ),
  now()
);
