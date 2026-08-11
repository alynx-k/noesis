-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1451: "Unit 6_Citizenship_Writing"
-- (https://lyc.ecole-ci.org/course/view.php?id=1451)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10910,
-- redirecting to pluginfile "Unit 6_Citizenship_Writing.pdf" (FAR AHEAD
-- 2nde). Read directly in the browser PDF viewer (page-by-page
-- screenshots, zoomed in where needed); no file was persisted to disk.
-- Rewritten/paraphrased from the source worksheet: the rights-and-duties
-- vocabulary (human dignity, forced labour, political right, fair trial,
-- uphold, taxes, peace, growth), the "each other / one another"
-- reciprocity language function, the vocabulary-matching and
-- sentence-completion activity types, and the closing writing task (a
-- human-rights report written as a Human Rights Watch representative).
-- 100% original wording; no sentence copied from the source. Course
-- content and exercises are entirely in English by design: this is an
-- English-immersion lesson, not a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-citizenship-writing',
  '2nde',
  'A',
  'anglais',
  $$Unit 6 - Citizenship: Writing About Rights and Duties$$,
  12,
  '2nde-a-eng-citizenship-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$On International Day of Refugees, a Seconde class is asked to write an article for their school's English Club magazine to support local refugees in defending their rights. To do this well, they first need vocabulary about rights and duties, and a grammar point for describing actions people do to and for each other.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: rights and duties$$,
        'body', $$Human dignity refers to the physical and psychological integrity and worth of a person. Forced labour is work imposed on someone against their will. A political right is the ability to take part in a country's civil and political life, for example by voting. A fair trial is an impartial judgment, decided without bias. To uphold something means to defend or maintain it. Taxes are amounts of money paid to the state. Peace is the absence of war, and growth refers to development, especially economic development.$$,
        'highlights', array[$$human dignity$$, $$fair trial$$, $$uphold$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word or expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Human dignity$$, $$Physical and psychological integrity of a person$$),
            jsonb_build_array($$Forced labour$$, $$Work imposed on someone$$),
            jsonb_build_array($$Political right$$, $$Ability to take part in a country's civil/political life$$),
            jsonb_build_array($$Fair trial$$, $$Impartial judgment$$),
            jsonb_build_array($$Uphold$$, $$Defend, maintain$$),
            jsonb_build_array($$Taxes$$, $$Money paid to the state$$),
            jsonb_build_array($$Peace$$, $$Absence of war$$),
            jsonb_build_array($$Growth$$, $$Development$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What does it mean to "uphold" someone's rights?$$, 'solution', $$It means to defend and maintain those rights.$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing reciprocity: "each other" and "one another"$$,
        'body', $$When two or more people do something to or for each other, English uses reciprocal pronouns: "each other" (traditionally for two people or groups) and "one another" (traditionally for more than two, though today both are often used interchangeably). Example: "The citizens of a country must respect each other for social stability."$$,
        'highlights', array[$$each other$$, $$one another$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "The two political parties disagree with __________ on how to bring back peace."$$, 'solution', $$"...disagree with each other..." (or "one another")$$),
        'fixation', jsonb_build_object('question', $$Complete: "The members of parliament congratulated __________ for passing the law."$$, 'solution', $$"...congratulated each other/one another for passing the law."$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: matching definitions to vocabulary$$,
        'body', $$A useful activity matches each definition to the correct rights-and-duties expression, for example matching "impartial judgment" to "fair trial", or "amount of money paid to the state" to "taxes".$$,
        'highlights', array[$$vocabulary matching$$]::text[],
        'example', jsonb_build_object('statement', $$Match "absence of war" to the correct word.$$, 'solution', $$"Peace".$$),
        'fixation', jsonb_build_object('question', $$Match "ability to participate in the civil and political life of a country" to the correct expression.$$, 'solution', $$"Political right".$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: reciprocity in context$$,
        'body', $$Once you know when to use "each other" or "one another", you can complete real sentences about citizenship and society, such as: company owners and their workers rarely agree with each other on economic reforms; two NGOs fighting for women's well-being often share information with one another about violations of women's rights in developing countries.$$,
        'highlights', array[$$reciprocity in context$$]::text[],
        'fixation', jsonb_build_object('question', $$Complete: "The two NGOs often help __________ in their campaigns for women's rights."$$, 'solution', $$"...help each other/one another..."$$)
      ),
      jsonb_build_object(
        'heading', $$Writing task: a human rights report$$,
        'body', $$As a representative of a human rights organisation working in West Africa, you are asked to write a report about the situation of citizens' rights in one country of the region. In your report, you should name the country you are writing about, describe the general situation of human rights there, and say what should be done to improve the application of human rights in that country.$$,
        'highlights', array[$$human rights report$$]::text[],
        'fixation', jsonb_build_object('question', $$What three things should your human rights report include?$$, 'solution', $$The name of the country, a description of the general human rights situation there, and suggestions to improve the application of human rights.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$As a representative of a human rights organisation in West Africa, you must write a short report on the situation of citizens' rights in a country of your choice.$$,
      'questions', array[
        $$Name the country you are writing your report about.$$,
        $$Describe the general situation of human rights in that country, using at least two vocabulary words from this lesson.$$,
        $$Suggest what should be done to improve the application of human rights there.$$,
        $$Write one sentence using "each other" or "one another" about how citizens or institutions should treat each other.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What expression means "work imposed on someone" against their will?$$,
      'hint', $$It is considered a human rights violation.$$,
      'expected', $$Forced labour.$$
    ),
    jsonb_build_object(
      'question', $$What word means "an impartial judgment"?$$,
      'hint', $$It relates to a courtroom.$$,
      'expected', $$Fair trial.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Citizens must respect __________ for social stability."$$,
      'hint', $$Use a reciprocal pronoun.$$,
      'expected', $$"...respect each other/one another..."$$
    ),
    jsonb_build_object(
      'question', $$What word means "amount of money paid to the state"?$$,
      'hint', $$It funds public services.$$,
      'expected', $$Taxes.$$
    )
  ),
  now()
);
