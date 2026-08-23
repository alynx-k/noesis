-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle course id 1370: "6è_Unit 2_ AT HOME_Lesson 3_Speaking (The
-- Kitchen)" (https://coll.ecole-ci.org/course/view.php?id=1370). Contenu
-- réécrit à partir du PDF source (Learn it, do it 6è, programme officiel
-- MENA) ; vocabulaire, dialogues et exercices reformulés, non copiés
-- verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A student from Lycée Gouverneur Abdoulaye Fadiga and her Liberian friend are doing the dishes. They talk about kitchen utensils and their uses so they can put everything away properly.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Kitchen vocabulary$$,
        'body', $$A sauce pan, a knife, a mortar, a pestle, a cup, a plate, a glass, a jug, a stool, a broom, a frying pan, a spoon, a fork. Actions: to cut up, to cook, to pound, to fry, to sweep, to wash the dishes, to clean.$$,
        'highlights', array[$$sauce pan, knife, mortar, pestle, cup, plate, glass$$, $$to cut up, to cook, to pound, to fry, to sweep$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you use with a mortar to pound yam?$$, 'solution', $$A pestle.$$)
      ),
      jsonb_build_object(
        'heading', $$Asking about ongoing actions: present continuous$$,
        'body', $$To ask what someone is doing right now, we say "What is [name] doing?" — the answer uses the present continuous (is/are + verb-ing): "She is cutting up the tomatoes" or "He is cooking."$$,
        'highlights', array[$$What is X doing? → X is [verb]-ing$$]::text[],
        'example', jsonb_build_object('statement', $$Someone is eating a banana right now. Answer: "What is she doing?"$$, 'solution', $$"She is eating a banana."$$),
        'fixation', jsonb_build_object('question', $$Which tense do we use to describe an action that is happening right now?$$, 'solution', $$The present continuous (present progressive): verb + -ing.$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about repeated actions: simple present$$,
        'body', $$More vocabulary: jug, tap, stool, broom, to clean, to wash the dishes, to sweep. To talk about repeated / habitual actions, we use the simple present: "My sister washes the dishes every day." / "I drink coffee every morning."$$,
        'highlights', array[$$repeated/habitual actions → simple present (+ -s for he/she/it)$$]::text[],
        'example', jsonb_build_object('statement', $$Mrs Kitan cooks for the family every day; Patrick sweeps the floor every morning. Write a sentence about Patrick.$$, 'solution', $$"Patrick sweeps the floor every morning."$$),
        'fixation', jsonb_build_object('question', $$Complete: "What do you do in the afternoon?" (you wash the dishes)$$, 'solution', $$"I wash the dishes."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Today is Dadie's birthday. He is having a party with his friends at home: his sister Brigitte is making orange juice in the kitchen, his brother Michel is playing music, some girls are dancing on the veranda, and his mother is frying yams, chicken and fish in the yard.$$,
      'questions', array[
        $$What is Dadie's sister doing? (use the present continuous)$$,
        $$What is Dadie's mother doing?$$,
        $$Describe, in your own words, what "everybody" is doing at the party overall.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Someone is frying plantain right now. Answer: "What is he doing?"$$,
      'hint', $$Use the present continuous.$$,
      'expected', $$"He is frying plantain."$$
    ),
    jsonb_build_object(
      'question', $$Complete with the simple present: "My mother ______ (to cook) rice every day."$$,
      'hint', $$Third person singular takes -s.$$,
      'expected', $$"My mother cooks rice every day."$$
    ),
    jsonb_build_object(
      'question', $$Name three kitchen utensils used for eating or serving food.$$,
      'hint', $$Think of cup, plate, glass, spoon, fork...$$,
      'expected', $$Any three of: cup, plate, glass, spoon, fork.$$
    ),
    jsonb_build_object(
      'question', $$What tool do you use with a mortar to pound food like yam or fufu?$$,
      'hint', $$It's a long, heavy tool.$$,
      'expected', $$A pestle.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-cuisine';
