-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1440: "Unit 4_Looking forward_ Writing"
-- (https://lyc.ecole-ci.org/course/view.php?id=1440)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10778,
-- redirecting to pluginfile "Unit 4_Looking forward_ Writing.pdf" (Far
-- Ahead, 2nde). Read directly in the browser PDF viewer (page-by-page
-- screenshots, zoomed in where needed); no file was persisted to disk.
-- The worksheet's own model article ("In the Year 2020", by Enanga, in
-- Africa Today) is not reproduced or closely paraphrased: the model
-- article below is original writing about a different future date,
-- structured the same way (four paragraphs: hopeful opening, near-term
-- problems, longer-term improvement, concluding opinion) purely to teach
-- the same article layout. Rewritten/paraphrased from the source
-- worksheet: the vocabulary (unfortunately, improve, run out, century,
-- overpopulation), the "will" future-prediction language function, the
-- article-layout rules (title, introduction, body, conclusion), and the
-- closing writing tasks (a climate-change article and a homework article
-- about education in the future). 100% original wording; no sentence
-- copied from the source. Course content and exercises are entirely in
-- English by design: this is an English-immersion lesson, not a lesson
-- about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-looking-forward-writing',
  '2nde',
  'A',
  'anglais',
  $$Unit 4 - Looking Forward: Writing an Article About the Future$$,
  8,
  '2nde-a-eng-looking-forward-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A newspaper front page is shown to the class, with a large headline, a photograph, and several smaller articles placed around it. Students are asked what kind of document this is, what appears on its right-hand side, and how it is laid out. To get ready to write for their own English Club magazine, they then read a short article about the future.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary for talking about the future$$,
        'body', $$Unfortunately means regrettably, or unhappily, and is used to introduce bad news. To improve means to ameliorate, to get better. To run out (of something) means to use it all up, so that none is left. A century is a period of one hundred years. Overpopulation means having too many people for a place's resources to support comfortably.$$,
        'highlights', array[$$unfortunately$$, $$run out$$, $$overpopulation$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Unfortunately$$, $$Regrettably, unhappily$$),
            jsonb_build_array($$Improve$$, $$To get better, ameliorate$$),
            jsonb_build_array($$Run out (of)$$, $$Use all of something up$$),
            jsonb_build_array($$Century$$, $$A period of one hundred years$$),
            jsonb_build_array($$Overpopulation$$, $$Too many people for a place's resources$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What does it mean for a country to "run out" of a resource?$$, 'solution', $$It means the resource is completely used up and none is left.$$)
      ),
      jsonb_build_object(
        'heading', $$Predicting the future with "will"$$,
        'body', $$To make predictions about the future, English typically uses "will" followed by the base form of the verb: subject + will + verb. For example: "People will travel to Mars one day." This structure works for confident predictions about things that have not happened yet, whether hopeful or worrying.$$,
        'highlights', array[$$will + verb$$, $$prediction$$]::text[],
        'example', jsonb_build_object('statement', $$Predict, using "will": "scientists / find / a cure for the disease"$$, 'solution', $$"Scientists will find a cure for the disease."$$),
        'fixation', jsonb_build_object('question', $$Complete: "By 2100, solar power __________ (become) the main source of energy."$$, 'solution', $$"By 2100, solar power will become the main source of energy."$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: predictions with the new vocabulary$$,
        'body', $$Once you know both the vocabulary and the "will" structure, you can build predictions that combine them, such as "By the year 2100, overpopulation will make life difficult" or "Technology will improve our daily life." A useful exercise is completing sentences by choosing the right vocabulary word for each gap, then adding "will" plus a verb to complete the prediction.$$,
        'highlights', array[$$prediction practice$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "The overuse of our natural resources is making them __________ ."$$, 'solution', $$"...is making them run out." (or "scarce")$$),
        'fixation', jsonb_build_object('question', $$Complete using "century": "The next __________ will begin in the year 2101."$$, 'solution', $$"The next century will begin in the year 2101."$$)
      ),
      jsonb_build_object(
        'heading', $$How an article is laid out$$,
        'body', $$A well-organised article has four parts. It opens with a catchy title that attracts the reader's attention and hints at the theme. Then comes an introduction that clearly states the topic to be covered. The body, usually two or three paragraphs long, develops the topic in detail; each paragraph should open with a topic sentence followed by supporting details. Finally, a conclusion sums up the topic and gives a final opinion. Choosing your own title is part of the task.$$,
        'highlights', array[$$title$$, $$introduction$$, $$body$$, $$conclusion$$]::text[],
        'fixation', jsonb_build_object('question', $$What should the first sentence of each body paragraph be, and what follows it?$$, 'solution', $$A topic sentence, followed by supporting details that develop that idea.$$)
      ),
      jsonb_build_object(
        'heading', $$Model article: Looking Ahead to 2050$$,
        'body', $$Paragraph 1: I believe the world will look very different by 2050, if humanity manages to survive its current challenges. New technology will solve many problems and will improve people's daily lives. Unfortunately, this progress will not arrive as quickly as we would like. Paragraph 2: The next few decades will probably be difficult. Fossil fuels will run out sooner than expected, disrupting transport and industry. By 2050, the world's population will exceed nine billion, and this overpopulation will create serious pressure on food and water supplies. Paragraph 3: From around 2080 onward, conditions will begin to improve. Solar and wind power will become the main sources of energy, reducing pollution significantly, and space exploration will open new possibilities for humanity. Paragraph 4: Overall, I remain optimistic about the future. I believe that by 2100 there will be fewer people on Earth, and that they will be better educated and enjoy better living conditions than we do today.$$,
        'highlights', array[$$model article$$, $$topic sentence$$]::text[],
        'example', jsonb_build_object('statement', $$What is the topic sentence of the second paragraph, and what does it tell the reader?$$, 'solution', $$"The next few decades will probably be difficult." It tells the reader that the paragraph will be about near-term problems, before the supporting details about fossil fuels and overpopulation follow.$$)
      ),
      jsonb_build_object(
        'heading', $$Analysing the model article$$,
        'body', $$Good readers of an article like "Looking Ahead to 2050" ask themselves: when do I think this was written, and does the title refer to the present or to the future? Which sentence in the introduction states the article's topic? What is the topic sentence of each body paragraph, and what supporting details follow it? Finally, which paragraph gives the writer's personal opinion and summarises their view?$$,
        'highlights', array[$$reading an article$$, $$writer's opinion$$]::text[],
        'fixation', jsonb_build_object('question', $$In "Looking Ahead to 2050", which paragraph expresses the writer's personal opinion?$$, 'solution', $$The last paragraph ("Overall, I remain optimistic..."), which summarises the writer's view.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Climate change and its consequences represent a serious threat for humanity's future. Your school's English Club is organising an article-writing competition to raise students' awareness of this issue.$$,
      'questions', array[
        $$State clearly, in one sentence, the topic of your article.$$,
        $$Mention two or three main causes of climate change.$$,
        $$Suggest two solutions to this phenomenon, using "will" to predict their effect.$$,
        $$Write a short conclusion giving your personal opinion about the future of the climate.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What word means "regrettably" or "unhappily", used to introduce bad news?$$,
      'hint', $$It appears at the start of many negative predictions.$$,
      'expected', $$Unfortunately.$$
    ),
    jsonb_build_object(
      'question', $$Complete using "will": "By 2100, people __________ (live) on other planets."$$,
      'hint', $$Use "will" plus the base form of the verb.$$,
      'expected', $$"By 2100, people will live on other planets."$$
    ),
    jsonb_build_object(
      'question', $$Name the four parts of a well-organised article, in order.$$,
      'hint', $$Think title, then three more parts.$$,
      'expected', $$Title, introduction, body, and conclusion.$$
    ),
    jsonb_build_object(
      'question', $$What should follow the topic sentence in a body paragraph?$$,
      'hint', $$Think about what develops the idea.$$,
      'expected', $$Supporting details that develop the idea introduced by the topic sentence.$$
    )
  ),
  now()
);
