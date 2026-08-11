-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1434: "Unit 2_Health and Lifestyle_writing"
-- (https://lyc.ecole-ci.org/course/view.php?id=1434)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10706,
-- redirecting to pluginfile "Unit 2_Health and Lifestyle_writing.pdf" (FAR
-- AHEAD 2nde, page 28). Read directly in the browser PDF viewer
-- (page-by-page screenshots); no file was persisted to disk.
-- Rewritten/paraphrased from the source worksheet: the warning vocabulary
-- (watch out, take care of yourself, worried about, crazy about, give
-- up), the "You'd better..., or else..." warning structure, the
-- five-paragraph informal-email structure illustrated by the worksheet's
-- model letter (a student warning a friend about her brother's new
-- smoking habit), and the closing writing/essay tasks about warning a
-- friend and about friendship at school. The model email reused here is
-- an original composition with different names and details, built only to
-- teach the same structure. 100% original wording; no sentence copied
-- from the source. Course content and exercises are entirely in English
-- by design: this is an English-immersion lesson, not a lesson about
-- English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-health-lifestyle-writing',
  '2nde',
  'A',
  'anglais',
  $$Unit 2 - Health and Lifestyle: Writing a Warning Email$$,
  4,
  '2nde-a-eng-health-lifestyle-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Students of a Seconde class are asked how they usually pass on important information to a friend, and what they call the short digital letters they send them. Their teacher then sets a writing task: compose an informal email to a friend to warn them about something worrying, using the right greeting, structure, and tone for that kind of message.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary for warning someone$$,
        'body', $$To warn someone about a risk, English offers several ready-made expressions. "Be careful" and "Watch out!" both tell someone to pay attention to danger. "Take care of yourself" means to pay attention to your own well-being. "To be worried about" something means to be troubled or perturbed by it. "To be crazy about" something means to love it very much, and "to give up" something means to abandon or stop doing it.$$,
        'highlights', array[$$Watch out!$$, $$worried about$$, $$give up$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Be careful / Watch out!$$, $$Pay attention to a danger$$),
            jsonb_build_array($$Take care of yourself$$, $$Pay attention to your own well-being$$),
            jsonb_build_array($$Be worried about$$, $$Be troubled or perturbed by something$$),
            jsonb_build_array($$Be crazy about$$, $$Love something very much$$),
            jsonb_build_array($$Give up$$, $$Abandon or stop doing something$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What is the difference between "to be crazy about" something and "to give up" something?$$, 'solution', $$"To be crazy about" means to love it very much, while "to give up" means to stop doing it or abandon it.$$)
      ),
      jsonb_build_object(
        'heading', $$The warning language function$$,
        'body', $$Warning someone in English often uses the structure "You'd (had) better + base verb, or else + consequence." This tells the person what they should do and what will happen if they do not. For example: "You'd better learn your lessons, or else you will fail," or "You'd better wear a face mask, or else you will be contaminated."$$,
        'highlights', array[$$You'd better...$$, $$or else...$$]::text[],
        'example', jsonb_build_object('statement', $$Turn this into a warning using "You'd better": "Stop smoking. If you don't, you will get sick."$$, 'solution', $$"You'd better stop smoking, or else you will get sick."$$),
        'fixation', jsonb_build_object('question', $$Complete: "__________ finish your homework, or else you will be punished."$$, 'solution', $$"You'd better finish your homework, or else you will be punished."$$)
      ),
      jsonb_build_object(
        'heading', $$Model text: a warning email between friends$$,
        'body', $$Dear Aya, I'm writing to you about a problem. I'm really worried about my cousin Yao because I think he's started skipping classes. I haven't seen him leave school myself, but two of his friends told me so, and last week I saw him near the market during school hours. Yao used to be crazy about football and trained every evening, but he has given that up completely. He used to spend all his free time practising, but now his grades are getting worse, and he argues with our parents all the time. I can't tell our parents directly because they would be extremely angry. Do you think I should talk to his form teacher, or his coach, or someone else? What do you advise me to do? Write soon. Love, Fatou.$$,
        'highlights', array[$$informal email$$, $$structure$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Part of the email$$, $$Purpose$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Greeting ("Dear Aya,")$$, $$Address the friend informally$$),
            jsonb_build_array($$Paragraph 1$$, $$State the problem$$),
            jsonb_build_array($$Paragraph 2$$, $$Describe the consequences of the behaviour$$),
            jsonb_build_array($$Paragraph 3$$, $$Ask for advice$$),
            jsonb_build_array($$Closing ("Write soon. Love, Fatou.")$$, $$End the email informally$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$In the model email, which paragraph describes the consequences of Yao's behaviour?$$, 'solution', $$The second paragraph, about giving up football, getting worse grades, and arguing with the parents.$$)
      ),
      jsonb_build_object(
        'heading', $$Writing your own warning email$$,
        'body', $$To write a similar email, you should start with an informal greeting such as "Hi Sam," "Hello Stephy," or "Dear Cathy," then clearly state the object of your email, for example "I'm writing to warn you about...". Next, mention a few bad habits of the person you are worried about and their consequences, and finish by warning your friend about the risk they are exposed to. Throughout the email, use an informal style with contractions ("can't," "I'm") rather than full forms ("cannot," "I am").$$,
        'highlights', array[$$informal style$$, $$contractions$$]::text[],
        'example', jsonb_build_object('statement', $$Rewrite formally into informal style: "I am writing to inform you that I cannot attend the meeting."$$, 'solution', $$"I'm writing to tell you that I can't attend the meeting."$$),
        'fixation', jsonb_build_object('question', $$Give one example of an informal greeting you could use to start a warning email to a friend.$$, 'solution', $$For example: "Hi Sam," or "Hello Stephy," or "Dear Cathy,".$$)
      ),
      jsonb_build_object(
        'heading', $$From warning to opinion: is it good to have friends at school?$$,
        'body', $$After writing about a friend who has fallen under a bad influence, it is natural to reflect more broadly on friendship itself. A follow-up task usually asks you to write a short opinion essay on a question such as "Is it a good idea to have friends at school?", in which you define what a friend is, consider whether just anybody can be considered a friend, and give your own justified opinion.$$,
        'highlights', array[$$opinion essay$$, $$friendship$$]::text[],
        'fixation', jsonb_build_object('question', $$What three things should an opinion essay on "Is it a good idea to have friends at school?" include?$$, 'solution', $$A definition of what a friend is, a reflection on whether anybody can be a friend, and your own justified opinion.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$A friend who changed school after passing an exam has started hanging out with a new group of friends who behave badly and go to bars during school hours. Write an informal email warning your friend about the situation.$$,
      'questions', array[
        $$Write an appropriate informal greeting to start your email.$$,
        $$State clearly, in one sentence, the object of your email using an expression like "I'm writing to warn you about...".$$,
        $$Describe two or three bad habits of the new friends and their possible consequences.$$,
        $$Warn your friend about the risk they are exposed to, using the "You'd better..., or else..." structure.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What English expression means "to abandon or stop doing something"?$$,
      'hint', $$It is the opposite of continuing a habit.$$,
      'expected', $$Give up.$$
    ),
    jsonb_build_object(
      'question', $$Complete the warning structure: "You'd better study, __________ you will fail the test."$$,
      'hint', $$Two words that introduce a negative consequence.$$,
      'expected', $$"Or else".$$
    ),
    jsonb_build_object(
      'question', $$In an informal warning email, which paragraph usually comes right after stating the problem?$$,
      'hint', $$Think about the model email's structure.$$,
      'expected', $$The paragraph describing the consequences of the worrying behaviour.$$
    ),
    jsonb_build_object(
      'question', $$Give one feature of informal writing style that should be used in a warning email to a friend.$$,
      'hint', $$Think about "can't" versus "cannot".$$,
      'expected', $$Using contractions (for example "can't" or "I'm") instead of full forms.$$
    )
  ),
  now()
);
