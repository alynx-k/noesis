-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 7_HEALTH AND ENVIRONMENT_Lesson 1_Reading (Body
-- hygiene)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$At Collège Municipal Koro, during English class, 6ème students identify the different parts of the human body in order to keep them healthy.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: parts of the head, and expressing obligation$$,
        'body', $$Head, ear, nose, eye, mouth, tooth/teeth, forehead, hair. To express obligation, we use "must" (for what people should do) and "mustn't" (for what people should not do): "People must take a bath." "People mustn't drink dirty water."$$,
        'highlights', array[$$head, ear, nose, eye, mouth, tooth/teeth, forehead$$, $$must (obligation) / mustn't (prohibition)$$]::text[],
        'fixation', jsonb_build_object('question', $$Complete: "I ______ drink clean water." (obligation)$$, 'solution', $$"I must drink clean water."$$)
      ),
      jsonb_build_object(
        'heading', $$More body parts, and yes/no questions with must$$,
        'body', $$Fingers, nail, arm, hand, leg, foot/feet, neck, knee. To ask about obligation: "Must I study alone?" — answer: "Yes, you must." / "No, you mustn't." Example: "A student is eating in the classroom, must he do that?" → "No, he mustn't."$$,
        'highlights', array[$$fingers, nail, arm, hand, leg, foot/feet, neck, knee$$, $$Must...? → Yes, ...must. / No, ...mustn't.$$]::text[],
        'example', jsonb_build_object('statement', $$Turn into a question and answer: "We must wash our hands before eating."$$, 'solution', $$"Must we wash our hands before eating?" — "Yes, we must."$$),
        'fixation', jsonb_build_object('question', $$Turn into a question and answer: "People mustn't drink dirty water."$$, 'solution', $$"Must people drink dirty water?" — "No, they mustn't."$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: hygiene rules$$,
        'body', $$"Hygiene is very important. To be healthy, there are many things we must do. For example, we must take at least one shower every day. We must brush our teeth and drink safe water from a tap. There are many things we must not do. For example, we must not wear dirty clothes, drink water from the river, and eat with dirty hands. We must keep our body clean. Our body is a fantastic machine. We must always protect it."$$,
        'highlights', array[$$things we must do: shower daily, brush teeth, drink safe water$$, $$things we mustn't do: wear dirty clothes, drink river water, eat with dirty hands$$]::text[],
        'example', jsonb_build_object('statement', $$According to the text, what does our body represent?$$, 'solution', $$"Our body is a fantastic machine that we must always protect."$$),
        'fixation', jsonb_build_object('question', $$Name two things the text says we must not do.$$, 'solution', $$Wear dirty clothes and drink water from the river (or eat with dirty hands).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$At a reading contest organized by the US Embassy at Collège Municipal de Koro, 6ème students read a text about hygiene and answer comprehension questions.$$,
      'questions', array[
        $$What is the text about?$$,
        $$What must we do to be healthy? Name at least three things.$$,
        $$What does our body represent according to the text?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Unscramble the letters to find a body part: "h f r h a o e"$$,
      'hint', $$It's the part of the head above the eyebrows.$$,
      'expected', $$Forehead.$$
    ),
    jsonb_build_object(
      'question', $$Complete with must or mustn't: "My doctor says that everyday I ______ wash my hair and face."$$,
      'hint', $$It's an obligation.$$,
      'expected', $$"...I must wash my hair and face."$$
    ),
    jsonb_build_object(
      'question', $$Complete with must or mustn't: "I ______ use bleach (JAVEL) to wash my eyes and nose."$$,
      'hint', $$It's dangerous — this is a prohibition.$$,
      'expected', $$"I mustn't use bleach to wash my eyes and nose."$$
    ),
    jsonb_build_object(
      'question', $$Turn into a question and answer: "You must filter water before drinking."$$,
      'hint', $$Use "Must you...?"$$,
      'expected', $$"Must you filter water before drinking?" — "Yes, I must."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-hygiene-corporelle';
