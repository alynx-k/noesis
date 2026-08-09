-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 2
-- LESSON 2: What are women's rights and duties?" PDF ("have the right to" /
-- "it's my duty/responsibility to"), but every sentence, name, and exercise
-- is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school is organizing a panel discussion for Women's Rights Day. Before the event, your English teacher wants the class to be able to talk clearly about what rights and duties belong to women in society.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: women's rights$$,
        'body', $$A right is something every person is allowed to have or do, protected by law or by society. These words describe rights that are important for women around the world.$$,
        'highlights', array[$$the right to vote$$, $$the right to education$$, $$to demonstrate$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$the right to vote$$, $$the right to freely choose a candidate during an election$$),
            jsonb_build_array($$the right to education$$, $$the right to go to school and learn to read and write$$),
            jsonb_build_array($$the right to health$$, $$the right to receive medical treatment$$),
            jsonb_build_array($$to run a business$$, $$to manage or own a company, buying and selling goods$$),
            jsonb_build_array($$to claim$$, $$to demand something, saying it belongs to you$$),
            jsonb_build_array($$to demonstrate$$, $$to protest publicly to show you are unhappy about something$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To say that someone is allowed to have or do something, we use "have/has the right to" + base verb: I have the right to..., She has the right to....$$),
        'example', jsonb_build_object('statement', $$What right is Aminata fighting for when she says: "Let me choose my own husband"?$$, 'solution', $$Aminata is fighting for the right to choose her own partner in marriage.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: Every citizen ___ the right to vote in a free election.$$, 'solution', $$Every citizen has the right to vote in a free election.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: family duties$$,
        'body', $$A duty is something a person is expected to do because of their role in the family or in society. These words describe the daily responsibilities many mothers carry.$$,
        'highlights', array[$$to provide$$, $$a responsibility$$, $$to take care of$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to feed$$, $$to provide food to someone$$),
            jsonb_build_array($$to take care of$$, $$to look after and protect someone$$),
            jsonb_build_array($$to provide housing$$, $$to give a family a safe place to live$$),
            jsonb_build_array($$to provide education$$, $$to help children go to school and learn$$),
            jsonb_build_array($$to provide health care$$, $$to help family members get medical treatment when sick$$),
            jsonb_build_array($$a responsibility$$, $$a duty that someone is expected to carry out$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To say that something is expected of someone, we use "It's + possessive + duty/responsibility + to" + base verb: It's my duty to..., It's a mother's responsibility to....$$),
        'example', jsonb_build_object('statement', $$What is a parent's duty regarding their children's schooling?$$, 'solution', $$It's a parent's duty to provide education to their children.$$),
        'fixation', jsonb_build_object('question', $$Fill the gap: It's ___ duty to take care of her little brother while their mother is at work.$$, 'solution', $$It's her duty to take care of her little brother while their mother is at work.$$)
      ),
      jsonb_build_object(
        'heading', $$Telling a right from a duty$$,
        'body', $$Rights and duties look similar in a list, but they answer two different questions: a right is something you are allowed to receive, while a duty is something you are expected to give.$$,
        'highlights', array[$$a right$$, $$a duty$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Ask yourself: does this sentence describe something a person is allowed to have (a right), or something a person is expected to do for others (a duty)? "I have the right to education" = a right. "It's my duty to educate my children" = a duty.$$),
        'example', jsonb_build_object('statement', $$Is "the right to health" a right or a duty? Is "to provide health care to your family" a right or a duty?$$, 'solution', $$"The right to health" is a right, because it is something you are allowed to receive. "To provide health care to your family" is a duty, because it is something you are expected to do for others.$$),
        'fixation', jsonb_build_object('question', $$Classify: "It's my duty to feed my children." -- is this a right or a duty?$$, 'solution', $$This is a duty, because it describes something the person is expected to do for someone else.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your school's English Club invites a guest speaker from a women's rights NGO to talk to younger students. As the Club's secretary, you must introduce the topic before she speaks.$$,
      'questions', array[
        $$Give a simple definition of a human right.$$,
        $$Mention two rights that are important for women today.$$,
        $$Mention two duties that many mothers carry in their families.$$,
        $$Explain why rights and duties usually go together.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: Women ___ (have) the right to run their own business.$$,
      'hint', $$Use "have the right to" + base verb.$$,
      'expected', $$Women have the right to run their own business.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "it's ... duty to": "A mother must take care of her children."$$,
      'hint', $$Start with "It's a mother's duty to...".$$,
      'expected', $$It's a mother's duty to take care of her children.$$
    ),
    jsonb_build_object(
      'question', $$Classify as a right or a duty: "The right to demonstrate peacefully."$$,
      'hint', $$Ask: is this something a person is allowed to do, or expected to do for others?$$,
      'expected', $$This is a right, because it is something every citizen is allowed to do.$$
    ),
    jsonb_build_object(
      'question', $$Complete the sentence with the correct word: "It's my ___ to provide education to my younger sister." (duty/right)$$,
      'hint', $$Choose the word that expresses an obligation, not a permission.$$,
      'expected', $$It's my duty to provide education to my younger sister.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-droits-devoirs-femme';
