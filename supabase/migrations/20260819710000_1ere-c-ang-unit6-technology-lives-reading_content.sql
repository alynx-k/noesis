-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 2222: "Unit 6_ Technology and lives_ Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=2222), resource id 20094.
-- Lesson structure (vocabulary, conditional expressions as long
-- as/in case of/in case/unless, exercise design) reused from the source
-- PDF (textbook "Far Ahead 1ère"). The reading passage "How Technology and
-- Social Networks Affect our World" (adapted by the PDF's authors from an
-- unattributed internet opinion article, a copyrighted contemporary
-- source) is replaced by an ENTIRELY ORIGINAL passage covering the same
-- ideas (positive/negative effects of social media) and the same target
-- vocabulary/grammar, consistent with the 1ère A migration of this unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit6-technology-lives-reading',
  '1ere',
  'C',
  'anglais',
  $$Unit 6: Technology and Our Lives (Reading)$$,
  11,
  '1ere-c-ang-unit5-human-rights-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In order to write a paragraph about the good use of the internet, students of 1ère C are reading an article to get informed.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$To expand means to grow or become larger. Powerful means having great strength or influence. A hacker is someone who uses the internet for bad things. Fancy means extraordinary, high-quality. Worn out means very tired, or can't be used again. Due to means because of. To argue means to express an opinion, often disagreeing with another. To strengthen means to give more force to something.$$,
        'highlights', array[$$expand, powerful, hacker, fancy$$, $$worn out, due to, argue, strengthen$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "due to" mean?$$, 'solution', $$Because of.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: conditional expressions$$,
        'body', $$"Unless" means "if not". Both "unless" and "as long as" can be placed at the beginning or the end of a sentence. We use "in case" or "in case of" to talk about precautions we take before a problem happens.$$,
        'highlights', array[$$unless = if not$$, $$in case / in case of = precaution before a problem$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "I have a power bank ___ a power failure."$$, 'solution', $$I have a power bank in case of a power failure.$$),
        'fixation', jsonb_build_object('question', $$What does "unless" mean?$$, 'solution', $$"If not" — it introduces the condition under which something will NOT happen.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: How social media changed the way we connect$$,
        'body', $$Today, social media has become an extremely powerful part of daily life. Teenagers and young adults are among the most fanatic users of platforms like Facebook or Twitter, and technology has changed their generation rapidly — whether it turns someone into a master of video games or, in rarer cases, into a hacker. Years ago, before fancy smartphones existed, young people would simply play outside with a bike or a ball until it was worn out, and friendships were built mostly face to face. As long as people keep embracing these new technologies without questioning their effects, traditional personal interactions will remain at risk. Due to the constant use of screens, many people are becoming more isolated, preferring to communicate through a keyboard rather than in person. Some argue that social networks were created for the sole purpose of helping people stay in touch, and in many ways this is true: they help young people stay connected with friends who moved to different cities or even different continents, and this strengthens relationships that might otherwise fade away. Social platforms also allow young people to build groups around shared interests, opening doors to new opportunities and careers. Unless users learn to balance online life with real interaction, however, the negative effects — isolation, distraction, and even a loss of empathy — may outweigh the benefits.$$,
        'highlights', array[$$positive : stay connected across distances, new opportunities$$, $$negative : isolation, less face-to-face interaction$$, $$balance is key$$]::text[],
        'fixation', jsonb_build_object('question', $$According to the passage, what is one positive effect of social media on relationships?$$, 'solution', $$It helps young people stay connected with friends who moved to different cities or continents, which strengthens relationships that might otherwise fade away.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The use of internet and social media is alarming today. Many teenagers are becoming addicted, and some of them even abandon their studies. Write a short paragraph in which you give your opinion about technology.$$,
      'questions', array[
        $$List two tools of technology and two social networks.$$,
        $$Give some negative consequences of the overuse of technology.$$,
        $$Suggest some solutions to this situation.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "Don't stop your laptop ___ you have saved all your files." (as long as / unless / in case)$$,
      'hint', $$It means "if not".$$,
      'expected', $$Unless.$$
    ),
    jsonb_build_object(
      'question', $$What does "hacker" mean, according to the vocabulary list?$$,
      'hint', $$It's related to bad internet use.$$,
      'expected', $$Someone who uses the internet for bad things.$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, why are many people becoming more isolated?$$,
      'hint', $$It's related to constant screen use.$$,
      'expected', $$Because of the constant use of screens, many people prefer to communicate through a keyboard rather than in person.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "I am taking an anti-virus ___ I have problems with my computer." (in case / unless / due to)$$,
      'hint', $$It's a precaution taken before a problem happens.$$,
      'expected', $$In case.$$
    )
  ),
  now()
);
