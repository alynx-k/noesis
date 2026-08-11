-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1447: "Unit 5_Gender and Education_Listening"
-- (https://lyc.ecole-ci.org/course/view.php?id=1447)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10862,
-- redirecting to pluginfile "Unit 5_Gender and Education_Listening.pdf"
-- (FAR AHEAD 2nde, p. 67). Read directly in the browser PDF viewer
-- (page-by-page screenshots, zoomed in where needed); no file was
-- persisted to disk. The worksheet references an external audio recording
-- (hosted on www.edicef.com) of three teenagers, Mani, Afia and Yeo,
-- talking about their schools; that audio was not accessed, so the
-- listening scenario below is an original composition built only from the
-- worksheet's own comprehension-question stems (what each character
-- dislikes about their school, and why). Rewritten/paraphrased from the
-- source worksheet: the vocabulary (boot camp, boarding school, homesick,
-- abroad), the must/have to/should obligation-and-recommendation language
-- function, the South-Africa school-law gap-fill activity, and the
-- closing speaking/homework tasks about a father refusing to send his
-- daughter to school and a farmer's proverb about girls' education. 100%
-- original wording; no sentence copied from the source. Course content
-- and exercises are entirely in English by design: this is an
-- English-immersion lesson, not a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-gender-education-listening',
  '2nde',
  'A',
  'anglais',
  $$Unit 5 - Gender and Education: Listening About School Choices$$,
  10,
  '2nde-a-eng-gender-education-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A picture shows a young girl working outdoors in a rural setting. Students are asked where she might be, what her living conditions seem to be like, and what could be done to improve them. To discuss the issue of girls' education further, the class then listens to a recording about different schooling situations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary related to school$$,
        'body', $$A boot camp is a special, strict school for teenagers who behave in an anti-social way. A boarding school is a school where students also live in a residential area on site, rather than going home every day. To be homesick means to feel sad because you are away from home and miss your family and friends. Abroad means in a foreign country, outside your own.$$,
        'highlights', array[$$boot camp$$, $$boarding school$$, $$homesick$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Boot camp$$, $$Strict school for teenagers with behaviour problems$$),
            jsonb_build_array($$Boarding school$$, $$School where students also live on site$$),
            jsonb_build_array($$Homesick$$, $$Sad because you are away from home$$),
            jsonb_build_array($$Abroad$$, $$In a foreign country$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the difference between a "boot camp" and a "boarding school"?$$, 'solution', $$A boot camp is a strict school specifically for teenagers with behaviour problems, while a boarding school is simply a school where students also live on the premises, without necessarily being about discipline.$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing obligation and recommendation$$,
        'body', $$"Must" and "have to" both express obligation: "In Australia, you have to vote. It's the law." "Should" expresses recommendation rather than a strict obligation: "You should work harder to succeed at school." The difference matters: something you "must" or "have to" do is required, while something you "should" do is only advised.$$,
        'highlights', array[$$must$$, $$have to$$, $$should$$]::text[],
        'example', jsonb_build_object('statement', $$Is "You should arrive on time" an obligation or a recommendation?$$, 'solution', $$A recommendation: "should" advises rather than strictly requires.$$),
        'fixation', jsonb_build_object('question', $$Rewrite as a strict obligation instead of a recommendation: "Students should wear their uniform."$$, 'solution', $$"Students have to wear their uniform." (or "must wear")$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: school rules in South Africa$$,
        'body', $$Once you know the difference between obligation and recommendation, you can apply it to real school-related rules, choosing the correct modal for each context. For example: children have to start school at a certain age because it is the law, while advice about, say, studying habits would use "should" instead.$$,
        'highlights', array[$$modal verbs$$, $$school rules$$]::text[],
        'example', jsonb_build_object('statement', $$Choose the correct modal: "Under the age of 15, children __________ (have to / mustn't) work." $$, 'solution', $$"...children mustn't work." (it is forbidden, a strict prohibition)$$),
        'fixation', jsonb_build_object('question', $$Which modal expresses that something is required by law: "should" or "have to"?$$, 'solution', $$"Have to" (like "must") expresses a legal or strict obligation; "should" only expresses advice.$$)
      ),
      jsonb_build_object(
        'heading', $$Listening scenario: three different schools$$,
        'body', $$Imagine a recording in which three teenagers, Mani, Afia and Yeo, each describe their own school situation. Mani attends a normal local school but complains about very strict rules. Afia is at a boarding school and dislikes not being able to go home every day, even though she does well there. Yeo was sent to a special, stricter school because he used to behave badly; at first he resented it, but today he admits his parents' decision was probably a good one. A listening activity based on this scenario would ask you to identify which of the three attends a boot camp, and why each of them likes or dislikes their school.$$,
        'highlights', array[$$boot camp$$, $$boarding school$$, $$listening comprehension$$]::text[],
        'fixation', jsonb_build_object('question', $$In this scenario, which character was sent to a stricter school because of bad behaviour, and what does he think about it today?$$, 'solution', $$Yeo; today he believes his parents' decision to send him there was probably a good one.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: convincing a parent to send a daughter to school$$,
        'body', $$Imagine a father refuses to let his daughter go to school. You decide to meet him and discuss the issue. In the conversation, you should ask him why he refuses to let her go to school, list some problems she could face without an education, and explain to him why girls' education matters.$$,
        'highlights', array[$$persuasion$$, $$girls' education$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one problem a girl might face later in life without any education.$$, 'solution', $$For example: fewer job opportunities, less financial independence, or difficulty helping her own children with schoolwork.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$A farmer once said that "sending a girl to school is as pointless as watering a neighbour's plant." You must react to this statement in writing.$$,
      'questions', array[
        $$Explain, in your own words, what the farmer's comparison means.$$,
        $$Say whether you agree or disagree with this statement.$$,
        $$Justify your opinion with at least two reasons.$$,
        $$Using "should" or "have to", give one recommendation or obligation you think applies to this situation.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What English word describes a school where students also live on site?$$,
      'hint', $$Think about students who do not go home every day.$$,
      'expected', $$Boarding school.$$
    ),
    jsonb_build_object(
      'question', $$What does it mean to feel "homesick"?$$,
      'hint', $$Think about missing your family.$$,
      'expected', $$Feeling sad because you are away from home and miss your family and friends.$$
    ),
    jsonb_build_object(
      'question', $$Which modal verb expresses recommendation rather than strict obligation: "must" or "should"?$$,
      'hint', $$One is advice, the other is a rule.$$,
      'expected', $$"Should" expresses recommendation.$$
    ),
    jsonb_build_object(
      'question', $$In the listening scenario, why did Yeo's parents send him to a special school?$$,
      'hint', $$Think about behaviour.$$,
      'expected', $$Because he used to behave badly.$$
    )
  ),
  now()
);
