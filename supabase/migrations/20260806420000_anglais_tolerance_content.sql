-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 6
-- LESSON 3: Tolerance" PDF (reported speech: statements, yes/no questions,
-- wh-questions, commands), but every sentence, name, and exercise is an
-- original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club attends a peace and tolerance forum and interviews a guest speaker. Afterwards, you report what was said to classmates who couldn't attend.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: tolerance and its opposite$$,
        'body', $$Talking about tolerance means understanding both the positive values that support it and the negative attitudes that threaten it.$$,
        'highlights', array[$$tolerance$$, $$prejudice$$, $$forgiveness$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a belief$$, $$an opinion or idea a person holds about something$$),
            jsonb_build_array($$tolerance$$, $$accepting and respecting people who are different from you$$),
            jsonb_build_array($$hatred$$, $$a strong feeling of dislike; the opposite of love$$),
            jsonb_build_array($$prejudice$$, $$a judgment about someone formed without real knowledge or proof$$),
            jsonb_build_array($$xenophobia$$, $$a strong dislike of people from other countries or origins$$),
            jsonb_build_array($$forgiveness$$, $$the act of pardoning someone for something wrong they did$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To report a statement, change "said" + quotation into "said that + subject + verb", shifting the tense back one step: present becomes past simple, present perfect becomes past perfect.$$),
        'example', jsonb_build_object('statement', $$Report this statement: The speaker said, "Tolerance is important."$$, 'solution', $$The speaker said that tolerance was important.$$),
        'fixation', jsonb_build_object('question', $$Report this statement into indirect speech: The leader said, "We have organized a peace campaign."$$, 'solution', $$The leader said that they had organized a peace campaign.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: living together in peace$$,
        'body', $$Building peace between different communities relies on specific attitudes and values, expressed through this vocabulary.$$,
        'highlights', array[$$to put up with$$, $$empathy$$, $$freedom of worship$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to put up with$$, $$to accept a difficult situation without complaining too much$$),
            jsonb_build_array($$mercy$$, $$kindness shown to someone instead of punishment$$),
            jsonb_build_array($$freedom of worship$$, $$the right to practice any religion freely$$),
            jsonb_build_array($$empathy$$, $$the ability to understand and share someone else's feelings$$),
            jsonb_build_array($$behavior$$, $$the way a person acts towards others$$),
            jsonb_build_array($$war$$, $$an armed conflict between countries or groups$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To report a yes/no question, use "asked/wondered + if/whether + subject + verb" (no question mark, no auxiliary inversion): "Do you agree?" she asked → She asked if I agreed.$$),
        'example', jsonb_build_object('statement', $$Report this question: The journalist asked, "Can you explain tolerance?"$$, 'solution', $$The journalist asked if I could explain tolerance.$$),
        'fixation', jsonb_build_object('question', $$Report this question into indirect speech: She asked, "Did you attend the peace forum?"$$, 'solution', $$She asked if I had attended the peace forum.$$)
      ),
      jsonb_build_object(
        'heading', $$Reporting wh-questions and commands$$,
        'body', $$Besides statements and yes/no questions, reported speech also has its own rules for questions starting with a question word, and for orders.$$,
        'highlights', array[$$a wh-question$$, $$a command$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To report a wh-question, keep the question word but remove the question mark and auxiliary inversion: "Where do you live?" he asked → He asked where I lived. To report a command, use "told/ordered + object + to + base verb" (or "not to" for a negative command).$$),
        'example', jsonb_build_object('statement', $$Report this command: The teacher said, "Don't interrupt me."$$, 'solution', $$The teacher told us not to interrupt her.$$),
        'fixation', jsonb_build_object('question', $$Report this wh-question into indirect speech: The agent asked, "Why did you start this project?"$$, 'solution', $$The agent asked why I had started that project.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club attended a peace and tolerance forum, and you must report what the guest speaker said to your classmates.$$,
      'questions', array[
        $$Report one statement the speaker made about tolerance, using indirect speech.$$,
        $$Report one question a student asked the speaker, using indirect speech.$$,
        $$Explain, in your own words, why the speaker believes difference should be a strength, not a weakness.$$,
        $$Give your own opinion on why tolerance matters in your community.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Report this statement: The speaker said, "Prejudice endangers social cohesion."$$,
      'hint', $$said that + subject + past simple.$$,
      'expected', $$The speaker said that prejudice endangered social cohesion.$$
    ),
    jsonb_build_object(
      'question', $$Report this statement: The leader announced, "We will start a tolerance campaign."$$,
      'hint', $$"will" becomes "would" in reported speech.$$,
      'expected', $$The leader announced that they would start a tolerance campaign.$$
    ),
    jsonb_build_object(
      'question', $$Report this yes/no question: She asked, "Do you believe in forgiveness?"$$,
      'hint', $$asked + if + subject + verb, no question mark.$$,
      'expected', $$She asked if I believed in forgiveness.$$
    ),
    jsonb_build_object(
      'question', $$Report this command: He said, "Respect other people's beliefs."$$,
      'hint', $$told + object + to + base verb.$$,
      'expected', $$He told us to respect other people's beliefs.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-tolerance';
