-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1453: "Unit 7_Sports_Lesson 2_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1453)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10934,
-- redirecting to pluginfile "Unit 7_Sports_Lesson 2_Reading.pdf". Read
-- directly in the browser PDF viewer (page-by-page screenshots, zoomed in
-- where needed); no file was persisted to disk. The worksheet's own
-- reading passage is a copyrighted online health article by Kevin Rail
-- (livestrong.com, "What Are the Benefits of Sport & Physical Activity?"),
-- so it is NOT reproduced or closely paraphrased here: the reading text
-- below is original writing conveying the same general, non-copyrightable
-- health facts (regular activity reducing chronic-disease risk, aerobic
-- exercise examples, weight management, and yoga for flexibility) in
-- different wording. The vocabulary (stick with, conditions, biking,
-- overweight, key, joints, enable, involves), the vocabulary-in-context
-- multiple-choice activity, the comprehension questions, and the closing
-- letter-writing task about a friend recovering from a heart attack are
-- paraphrased from the worksheet's instructions. Course content and
-- exercises are entirely in English by design: this is an
-- English-immersion lesson, not a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-sports-reading',
  '2nde',
  'A',
  'anglais',
  $$Unit 7 - Sport: Reading About the Benefits of Exercise$$,
  13,
  '2nde-a-eng-citizenship-writing',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Before reading, students are asked whether they practise any sport and what benefits they think sport can bring. To learn more about the advantages of physical activity, they then read a short health article.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: talking about exercise and health$$,
        'body', $$To "stick with" something means to keep doing it rather than giving up. Conditions here means diseases or medical problems. Biking means going on a bicycle. Overweight means excessively heavy for one's height. Key, used as an adjective, means most important. Joints are the articulations of the body, such as the knee or elbow. To enable means to permit or make possible. To involve means to imply or include as a necessary part.$$,
        'highlights', array[$$stick with$$, $$overweight$$, $$joints$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word/expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Stick with$$, $$Keep doing something, not give up on it$$),
            jsonb_build_array($$Conditions$$, $$Diseases, medical problems$$),
            jsonb_build_array($$Biking$$, $$Going on a bicycle$$),
            jsonb_build_array($$Overweight$$, $$Excessively heavy$$),
            jsonb_build_array($$Key (adj.)$$, $$Most important$$),
            jsonb_build_array($$Joints$$, $$Articulations of the body$$),
            jsonb_build_array($$Enable$$, $$Permit, make possible$$),
            jsonb_build_array($$Involves$$, $$Implies, includes$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What does it mean to "stick with" an exercise routine?$$, 'solution', $$It means to keep doing it regularly instead of giving up.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading text: Why Moving Your Body Matters$$,
        'body', $$Sport and physical activity both belong to the broader category of exercise: any repeated movement of the body, kept up for a period of time, counts as physical activity. To really benefit from it, experts recommend choosing an activity you actually enjoy, since enjoyment is key to staying motivated over the long term. People who stay inactive face a higher risk of chronic conditions such as high blood pressure, high cholesterol and diabetes. Aerobic activities, also called cardiovascular activities, help reduce these risks; common examples include running, biking, swimming, rowing and walking. Carrying excess weight also raises the risk of chronic disease and can affect self-esteem, but regular activity burns calories efficiently and helps with weight control, provided it is done at a reasonably brisk pace for long enough; health authorities generally recommend at least two and a half hours of moderate activity per week for weight loss. Losing excess weight, in turn, reduces stress on the joints and makes movement easier. Beyond weight and disease prevention, certain activities such as yoga, which involves holding the body in fixed positions over time, are especially good for improving flexibility, which also makes everyday movement easier.$$,
        'highlights', array[$$aerobic activity$$, $$weight management$$, $$flexibility$$]::text[]
      ),
      jsonb_build_object(
        'heading', $$Vocabulary in context: choosing the right meaning$$,
        'body', $$A common reading activity gives you a word from the text and three possible meanings, asking you to choose the one that fits the context. For example, in this text, "conditions" refers to diseases, not simply "situations" or "obstacles", and "enable" means "permit", not "prevent" or "inform".$$,
        'highlights', array[$$vocabulary in context$$]::text[],
        'example', jsonb_build_object('statement', $$In this text, what does "overweight" mean: (a) excessively heavy, (b) excessively slow, (c) excessively light?$$, 'solution', $$(a) excessively heavy.$$),
        'fixation', jsonb_build_object('question', $$In this text, what does "involves" mean: (a) implies, (b) excludes, (c) ignores?$$, 'solution', $$(a) implies.$$)
      ),
      jsonb_build_object(
        'heading', $$Comprehension questions about the text$$,
        'body', $$After reading, typical comprehension questions ask: what is the link between sport and physical activity? What condition helps you gain the most benefit from exercise? What chronic conditions can result from inactivity? What are the advantages of aerobic activity, with examples from the text? What are the risks linked to being overweight? What do health authorities recommend for weight loss? Is the impact of exercise limited to the body? Which activity is best for people seeking more flexibility? And finally, what title would best summarise the text?$$,
        'highlights', array[$$comprehension questions$$]::text[],
        'fixation', jsonb_build_object('question', $$According to the text, is the impact of sport and physical activity limited to the body? Justify your answer.$$, 'solution', $$No: the text also mentions the effect on self-esteem, showing that exercise affects mental well-being as well as physical health.$$)
      ),
      jsonb_build_object(
        'heading', $$Writing task: advising a friend after a health scare$$,
        'body', $$Imagine receiving a letter from a friend who has just left hospital after a heart attack. In your reply, you should mention the possible causes of such a health problem, give advice to avoid similar issues in the future, and suggest some practical activities they could do to stay in good health.$$,
        'highlights', array[$$health advice$$, $$letter writing$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one practical activity you could suggest to a friend recovering from a heart attack, and why.$$, 'solution', $$For example, gentle walking, because it is a low-impact aerobic activity that improves cardiovascular health without excessive strain.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$A friend has just left hospital after a heart attack and writes to you. You must reply, addressing the causes of the problem and giving health advice.$$,
      'questions', array[
        $$Mention two possible causes of your friend's health problem.$$,
        $$Give two pieces of advice to avoid similar health problems in the future.$$,
        $$Suggest two practical physical activities your friend could safely do to stay healthy.$$,
        $$Explain, using vocabulary from this lesson, why aerobic activity is good for heart health.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What does the expression "stick with" an activity mean?$$,
      'hint', $$It's about staying motivated over time.$$,
      'expected', $$To keep doing it, rather than giving up.$$
    ),
    jsonb_build_object(
      'question', $$Give two examples of aerobic (cardiovascular) activities mentioned in the text.$$,
      'hint', $$Think of running, biking, swimming...$$,
      'expected', $$Any two of: running, biking, swimming, rowing, walking.$$
    ),
    jsonb_build_object(
      'question', $$According to the text, what type of activity is especially good for improving flexibility?$$,
      'hint', $$It involves holding positions for a period of time.$$,
      'expected', $$Yoga.$$
    ),
    jsonb_build_object(
      'question', $$What word from this lesson means "excessively heavy"?$$,
      'hint', $$It's a common health-related adjective.$$,
      'expected', $$Overweight.$$
    )
  ),
  now()
);
