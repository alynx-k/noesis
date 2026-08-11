-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1042: "Unit 1_People_Listening"
-- (https://lyc.ecole-ci.org/course/view.php?id=1042)
-- Resource "Je lis le résumé de la leçon", mod_resource id 6118, redirecting
-- to pluginfile "Unit 1_People_Listening.pdf" (FAR AHEAD, Seconde, page 15).
-- Read directly in the browser PDF viewer (page-by-page screenshots); no
-- file was persisted to disk. Rewritten/paraphrased from the source
-- worksheet (Unit 1: People, listening-for-comprehension skill lesson):
-- the role-model vocabulary set, the four listening activities (gist
-- multiple choice, matching speakers to statements, true/false detail
-- listening, and the closing communication task about a personal role
-- model). 100% original wording; no sentence copied from the source.
-- Course content and exercises are entirely in English by design: this is
-- an English-immersion lesson, not a lesson about English taught in
-- French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-people-listening',
  '2nde',
  'A',
  'anglais',
  $$Unit 1 - People: Listening for a Role Model$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A magazine shows a photograph of a well-known Ivorian artist performing on stage under colourful lights. In class, students of Seconde A are asked three quick questions before listening to a recording: Who is this person and what does he do for a living? How does he influence young people? Is his influence on teenagers a good one or a bad one? To answer properly, the class must first listen carefully to three teenagers explain, in a radio interview, who inspires them and why.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Key vocabulary: talking about people who inspire you$$,
        'body', $$Before listening to any recording about role models, it helps to know the words speakers are likely to use. A role model is a person looked up to by others as an example worth imitating. A mentor is a guide or an advisor who helps someone grow. To improve means to get better at something over time. Confidence is the assurance a person feels in their own abilities. Knowing this vocabulary in advance lets a listener recognise the topic quickly, instead of getting lost in unfamiliar words.$$,
        'highlights', array[$$role model$$, $$mentor$$, $$confidence$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Role model$$, $$A person looked up to by others as an example to imitate$$),
            jsonb_build_array($$Mentor$$, $$A guide and an advisor$$),
            jsonb_build_array($$Improve$$, $$To get better at something$$),
            jsonb_build_array($$Confidence$$, $$Assurance in one's own abilities$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the difference between a "role model" and a "mentor"?$$, 'solution', $$A role model is simply an example someone chooses to imitate, while a mentor actively guides and advises the person.$$)
      ),
      jsonb_build_object(
        'heading', $$Listening for the general topic (gist listening)$$,
        'body', $$The first thing a good listener does is identify what the recording is generally about, without worrying about every detail yet. This is called listening for gist. One useful technique is to prepare two or three possible topics beforehand and choose the one that best matches what is actually heard. For example, before listening to an interview about role models, a listener might be given three possible summaries and asked to pick the correct one after a single listening.$$,
        'highlights', array[$$gist listening$$, $$general topic$$]::text[],
        'example', jsonb_build_object('statement', $$Imagine you hear teenagers being interviewed about people who influence them. Which of these best describes the topic: (a) school bullying, (b) the impact famous people's lives have on society, or (c) teenagers talking about people who influence them?$$, 'solution', $$Option (c): the recording is about teenagers explaining who influences them and why.$$),
        'fixation', jsonb_build_object('question', $$Why should you read the possible answer choices before you start listening?$$, 'solution', $$Because knowing the choices in advance helps you focus on the specific information you need, instead of trying to understand everything at once.$$)
      ),
      jsonb_build_object(
        'heading', $$Matching speakers to what they say$$,
        'body', $$Once the general topic is clear, a second listening usually asks you to connect each speaker to a specific idea they express. In an interview with several speakers, each one might mention a different effect their role model has had on them: giving confidence, offering help and advice, making studying harder, or changing an attitude towards schoolwork. The listener's task is to match each numbered speaker to the correct lettered statement, for example writing an answer like "1-a" to show that speaker one matches statement (a).$$,
        'highlights', array[$$matching activity$$, $$speaker identification$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Statement$$, $$Possible effect of a role model$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$(a)$$, $$Gives the speaker confidence to do things$$),
            jsonb_build_array($$(b)$$, $$Helps the speaker and gives advice$$),
            jsonb_build_array($$(c)$$, $$Makes it harder for the speaker to study$$),
            jsonb_build_array($$(d)$$, $$Has changed the speaker's attitude towards studying$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$If a speaker says their role model "helped me and gave me advice", which statement should you match them with?$$, 'solution', $$Statement (b): "This person helps me and gives me advice."$$)
      ),
      jsonb_build_object(
        'heading', $$Listening for detail: true or false$$,
        'body', $$A third, more careful listening usually checks precise details. In this type of exercise you hear several short statements and must decide whether each one is true or false according to the recording, then justify your answer with something you actually heard. For instance, you might have to judge statements such as: a speaker won a well-known regional race; a speaker admits bad results are their own fault; a speaker was bullied by an older classmate; or a speaker's results are getting worse. Careful listening for names, numbers and specific facts is essential here, because a statement can sound plausible while still being false.$$,
        'highlights', array[$$true or false$$, $$detail listening$$, $$justification$$]::text[],
        'fixation', jsonb_build_object('question', $$What must you do besides saying "true" or "false" in this kind of exercise?$$, 'solution', $$You must justify your answer by referring to what was actually said in the recording.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking about your own role model$$,
        'body', $$Listening skills are often followed by a speaking or writing task that reuses the same vocabulary and ideas. A typical task imagines a foreign friend visiting during the holidays who notices that you behave differently, and more responsibly, than people around you. Your friend guesses you must be following the example of a role model and asks you to explain. To answer well, you should: define what a role model is, name your own role model, and explain clearly which qualities of that person inspired you, all while keeping the answer reasonably short and focused.$$,
        'highlights', array[$$personal role model$$, $$communication task$$]::text[],
        'example', jsonb_build_object('statement', $$How would you briefly answer a friend who asks "who is your role model and why"?$$, 'solution', $$You could say, for example: "My role model is my elder sister. She is my role model because she works hard, stays confident, and always encourages me to improve at school."$$),
        'fixation', jsonb_build_object('question', $$Besides naming your role model, what else should your explanation include?$$, 'solution', $$A definition of what a role model is, and the specific qualities of that person that inspired you.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$A classmate who missed the lesson asks you to summarise how to prepare for a listening exercise about role models, and to explain what makes someone a role model.$$,
      'questions', array[
        $$Define, in your own words, what a "role model" and a "mentor" are.$$,
        $$Explain what "listening for gist" means and why it is useful before listening in detail.$$,
        $$Describe what you must do in a "true or false" listening exercise, besides giving your answer.$$,
        $$Explain who your own role model would be and what qualities of that person inspire you.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What word describes a person looked up to by others as an example to imitate?$$,
      'hint', $$It is the main theme of this whole unit.$$,
      'expected', $$A role model.$$
    ),
    jsonb_build_object(
      'question', $$What is the term for listening just to catch the general topic of a recording, without focusing on every detail?$$,
      'hint', $$It is the opposite of listening for precise details.$$,
      'expected', $$Listening for gist (general/global listening).$$
    ),
    jsonb_build_object(
      'question', $$In a true-or-false listening exercise, what must you add to a simple "true" or "false" answer?$$,
      'hint', $$Think about proving your answer is correct.$$,
      'expected', $$A justification based on what was actually said in the recording.$$
    ),
    jsonb_build_object(
      'question', $$Give one word from this lesson that means "to get better at something".$$,
      'hint', $$It appears in the vocabulary table alongside "confidence".$$,
      'expected', $$Improve.$$
    )
  ),
  now()
);
