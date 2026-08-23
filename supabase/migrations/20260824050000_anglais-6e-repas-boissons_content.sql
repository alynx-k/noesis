-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 6_FOOD AND DRINKS_Lesson 1_Listening (I like rice and
-- coke)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$6ème students from Collège Moderne Alassane Ouattara de Ouaninou are invited to a reception at the US Embassy. They listen to the chef list the different dishes and drinks available so they can make their choice.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: food$$,
        'body', $$Yam, pounded yam, plantain, pounded plantain, cassava, bread, fish, rice, maize, meat.$$,
        'highlights', array[$$yam, pounded yam, plantain, pounded plantain, cassava$$, $$bread, fish, rice, maize, meat$$]::text[],
        'fixation', jsonb_build_object('question', $$Name two foods that can be "pounded" (eaten as a pounded staple).$$, 'solution', $$Pounded yam and pounded plantain.$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing likes and dislikes$$,
        'body', $$To say what you appreciate: "I like [food]." Example: "I like kabato." To say what you don't appreciate: "I don't like [food]." Example: "I don't like cassava." To ask: "What food do you like?" / "What food don't you like?"$$,
        'highlights', array[$$I like... / I don't like...$$, $$What food do/don't you like?$$]::text[],
        'example', jsonb_build_object('statement', $$Séry likes fish, meat and rice but dislikes pounded yam and pounded plantain. Write two sentences about him.$$, 'solution', $$"Séry likes fish, meat and rice." "He doesn't like pounded yam and pounded plantain."$$),
        'fixation', jsonb_build_object('question', $$How do you ask someone what food they dislike?$$, 'solution', $$"What food don't you like?"$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about meals and drinks$$,
        'body', $$Vocabulary: to drink, soft drinks, coffee, tea, milk, ginger juice, sorrel juice, mineral water, butter, sugar. Breakfast is the food eaten in the morning, lunch at midday, dinner in the evening. To describe a meal: "I have coffee, bread and butter for breakfast." To ask: "What do you have for breakfast?"$$,
        'highlights', array[$$breakfast (morning), lunch (midday), dinner (evening)$$, $$What do you have for [meal]? → I have...$$]::text[],
        'example', jsonb_build_object('statement', $$Séka has bread and butter for breakfast. Write the question this answers.$$, 'solution', $$"What does Séka have for breakfast?"$$),
        'fixation', jsonb_build_object('question', $$Carole has cakes and porridge for breakfast, rice and chicken for lunch. What does she have for dinner? (bread and eggs)$$, 'solution', $$"For dinner, she has bread and eggs."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$At a reception at the US Embassy, the chef lists the available dishes (fried yam and meat; rice and chicken; pounded plantains and peanut sauce) and drinks (sorrel juice, milk, tea, water) for students to choose from.$$,
      'questions', array[
        $$Name the dishes proposed by the chef.$$,
        $$Name the drinks proposed by the chef.$$,
        $$Choose your favourite dish and drink and explain your choice using "I like...".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Unscramble the letters to find a food item: "TANPINLA"$$,
      'hint', $$It's a starchy fruit similar to a banana.$$,
      'expected', $$Plantain.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "I ______ (like) rice but I ______ (not like) cassava."$$,
      'hint', $$Use "like" and "don't like".$$,
      'expected', $$"I like rice but I don't like cassava."$$
    ),
    jsonb_build_object(
      'question', $$What is the name of the food eaten at midday?$$,
      'hint', $$It's between breakfast and dinner.$$,
      'expected', $$Lunch.$$
    ),
    jsonb_build_object(
      'question', $$Ali has rice and meat for dinner. Write the question this answers.$$,
      'hint', $$Use "What does...have for...?"$$,
      'expected', $$"What does Ali have for dinner?"$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-repas-boissons';
