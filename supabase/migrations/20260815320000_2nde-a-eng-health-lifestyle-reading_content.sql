-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1433: "Unit 2_Health and Lifestyle_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1433)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10694,
-- redirecting to pluginfile "Unit 2_Health and Lifestyle_Reading.pdf"
-- (Programme Educatif 2nde). Read directly in the browser PDF viewer
-- (page-by-page screenshots); no file was persisted to disk. The
-- worksheet's own reading passage ("Portable Music Players Linked to
-- Hearing Loss", credited to Cynthia Kirk) is a copyrighted press article,
-- so it is NOT reproduced or closely paraphrased here: the reading text
-- below is original writing conveying the same general, non-copyrightable
-- facts (portable music devices and hearing-loss risk, earbuds vs.
-- over-ear headphones, safe listening advice) in different wording and a
-- different narrative frame. The vocabulary set (electronic devices,
-- hearing loss, blackout, earbuds/earphones), the giving-advice /
-- making-suggestions structures, and the activity types (main idea,
-- vocabulary matching, comprehension questions, presentation and essay
-- tasks about mobile-phone use) are paraphrased from the worksheet's
-- instructions. Course content and exercises are entirely in English by
-- design: this is an English-immersion lesson, not a lesson about English
-- taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-health-lifestyle-reading',
  '2nde',
  'A',
  'anglais',
  $$Unit 2 - Health and Lifestyle: Reading About Hearing Loss$$,
  3,
  '2nde-a-eng-people-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$For the next English Club meeting, Seconde A2 students must read a short text about the effect mobile phones and music players have on young people's lives. Before reading, the class discusses two questions: Which electronic devices do teenagers use most today? What consequences might using these devices have on their health and daily life?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Key vocabulary: electronic devices and hearing$$,
        'body', $$Electronic devices is a general term covering gadgets such as phones, C.D. players and portable computers. Two smaller items are often confused: earbuds are the very small headphones that sit inside the ear canal, while earphones (or headphones) are larger and cover the whole ear. To block out a sound means to stop or reduce it from reaching your ears. Hearing loss refers to a partial or total inability to hear, which is exactly the health risk this unit's reading text is about.$$,
        'highlights', array[$$electronic devices$$, $$earbuds$$, $$hearing loss$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Electronic devices$$, $$Gadgets such as phones, C.D. players, laptops$$),
            jsonb_build_array($$Earbuds$$, $$Very small headphones worn inside the ear$$),
            jsonb_build_array($$Earphones$$, $$Larger headphones that cover the whole ear$$),
            jsonb_build_array($$Block out$$, $$Stop or reduce a sound$$),
            jsonb_build_array($$Hearing loss$$, $$Partial or total inability to hear$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the main physical difference between earbuds and earphones?$$, 'solution', $$Earbuds are very small and worn inside the ear, while earphones are larger and cover the whole ear.$$)
      ),
      jsonb_build_object(
        'heading', $$Giving advice and making suggestions$$,
        'body', $$When you want to recommend that someone change a habit, English offers several polite structures. You can use "You should/shouldn't..." to give direct advice, "Why don't you...?" followed by the base form of the verb to suggest an action gently, or "How about...?" followed by a verb in the -ing form to propose an idea informally.$$,
        'highlights', array[$$You should$$, $$Why don't you...?$$, $$How about + verb-ing?$$]::text[],
        'example', jsonb_build_object('statement', $$Suggest, in two different ways, that a friend turns down the volume of their phone.$$, 'solution', $$"Why don't you reduce the volume of your phone?" and "How about reducing the volume of your phone?"$$),
        'fixation', jsonb_build_object('question', $$Rewrite as advice using "should": "It is a good idea to limit your listening time."$$, 'solution', $$"You should limit your listening time."$$)
      ),
      jsonb_build_object(
        'heading', $$Reading text: Turn It Down$$,
        'body', $$Doctors who study hearing have noticed a new health concern linked to how young people listen to music today. A survey of several hundred teenagers and adults found that many of them showed early signs of hearing damage, especially among heavy users of portable music players. Specialists explain that the type of listening equipment matters: earbuds, because they sit loosely inside the ear, block out very little outside noise, so their users tend to raise the volume even higher to cover street or classroom noise. Earphones that fully cover the ear are considered safer, because they naturally block out background sound without needing extreme volume. Hearing specialists warn that any sound louder than ordinary conversation, if it lasts for a long time, can gradually damage the ear, while most portable devices are able to produce sound far louder than that. Doctors therefore advise three simple habits: turn the volume down, take regular breaks from listening, and choose equipment that blocks out outside noise instead of competing with it.$$,
        'highlights', array[$$hearing damage$$, $$earbuds$$, $$safe listening habits$$]::text[]
      ),
      jsonb_build_object(
        'heading', $$Reading for the main idea$$,
        'body', $$As with any text, the first step is to identify what it is mainly about. For "Turn It Down", a reader could be offered three possible summaries: (a) the general use of portable music players, (b) the methodology of a hearing survey, or (c) the negative impact portable music players can have on hearing. Only the choice that covers the whole text, not just one supporting detail, is correct.$$,
        'highlights', array[$$main idea$$]::text[],
        'example', jsonb_build_object('statement', $$Which of the three choices above best matches "Turn It Down"?$$, 'solution', $$Choice (c): the negative impact portable music players can have on hearing.$$),
        'fixation', jsonb_build_object('question', $$Why is choice (b) ("the methodology of a hearing survey") not the best summary of the text?$$, 'solution', $$Because the survey is only mentioned as supporting evidence; the text as a whole is about the risk of hearing damage, not about how the survey was carried out.$$)
      ),
      jsonb_build_object(
        'heading', $$Matching words to their meaning in context$$,
        'body', $$A common vocabulary activity after reading is to match words taken from the text to their correct definition, written in different words. For example, from "Turn It Down" you might have to match "earbuds" to its definition, "block out" to its definition, and so on, exactly as you matched "devices," "hearing loss," and other words earlier in this unit.$$,
        'highlights', array[$$vocabulary matching$$]::text[],
        'example', jsonb_build_object('statement', $$Match "earbuds" with its correct definition: (a) stop or reduce a sound, (b) very small headphones worn inside the ear.$$, 'solution', $$(b) very small headphones worn inside the ear.$$),
        'fixation', jsonb_build_object('question', $$Which definition matches the word "block out": "an inability to hear" or "to stop or reduce a sound"?$$, 'solution', $$"To stop or reduce a sound."$$)
      ),
      jsonb_build_object(
        'heading', $$Comprehension questions and a class presentation$$,
        'body', $$After reading, comprehension questions check that you understood the evidence in the text: what showed that devices can damage hearing, how exactly they can cause that damage, which devices were mentioned, and what experts recommend to protect hearing. This unit's speaking task then widens the topic: as an English Club officer, you must prepare and deliver a short presentation on the overuse of mobile phones among students, giving two or three reasons why students overuse their phones, two or three negative effects of that overuse, and some suggestions to avoid the problem.$$,
        'highlights', array[$$comprehension questions$$, $$class presentation$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one negative effect of overusing mobile phones that you could mention in the class presentation.$$, 'solution', $$For example: hearing damage from loud, prolonged listening, or reduced concentration on schoolwork.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Even though mobile phones can be harmful when overused, many people argue they should still be allowed in class because they are so useful. You must write a short essay giving your opinion on whether mobile phones should be used in class.$$,
      'questions', array[
        $$Explain why mobile phones are considered important tools by many students today.$$,
        $$List two or three things mobile phones could reasonably be used for in class.$$,
        $$Suggest two ways a teacher could prevent students from misusing their phones in class.$$,
        $$Give your own opinion, using a structure such as "To my mind": should mobile phones be allowed in class? Justify your answer.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What is the difference between "earbuds" and "earphones"?$$,
      'hint', $$Think about size and how much of the ear they cover.$$,
      'expected', $$Earbuds are very small and worn inside the ear; earphones are larger and cover the whole ear.$$
    ),
    jsonb_build_object(
      'question', $$Give one English structure you can use to suggest an action, followed by a verb in the -ing form.$$,
      'hint', $$It starts with "How about...".$$,
      'expected', $$"How about + verb-ing?" (for example, "How about reducing the volume?").$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, why do earbud users tend to raise the volume very high?$$,
      'hint', $$Think about how well earbuds block outside noise.$$,
      'expected', $$Because earbuds block out very little outside noise, so users raise the volume to cover background noise.$$
    ),
    jsonb_build_object(
      'question', $$Name one of the three habits doctors recommend in the text to protect your hearing.$$,
      'hint', $$One is about volume, one about time, one about equipment.$$,
      'expected', $$Turn the volume down, take regular breaks from listening, or choose earphones that block out outside noise.$$
    )
  ),
  now()
);
