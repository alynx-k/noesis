-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 6_FOOD AND DRINKS_Lesson 3_Listening (I am cooking some
-- rice)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$At a reception at the British Embassy in Côte d'Ivoire, a group of 6ème students from Collège Moderne Alassane Ouattara de Ouaninou listen to the English-speaking chef describe recipes so they can reproduce them at home.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: cooking actions and ingredients$$,
        'body', $$To clean, salt, to chop up, to peel, egg, to beat the eggs, oil, seasoning cube, vinegar, chilli, garlic, peanut.$$,
        'highlights', array[$$to clean, to chop up, to peel, to beat the eggs$$, $$salt, oil, seasoning cube, vinegar, chilli, garlic$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call mixing egg white and yolk together with a fork?$$, 'solution', $$To beat the eggs.$$)
      ),
      jsonb_build_object(
        'heading', $$Describing a process$$,
        'body', $$To describe steps in order, we use: first, second, then, and finally. Example (meat stew): "First, I peel the yams. Second, I chop up the meat. Then, I clean the yams and the meat with water. Finally, I pour them into the pot."$$,
        'highlights', array[$$first → second → then → finally (sequence words)$$]::text[],
        'example', jsonb_build_object('statement', $$Reorder to make an omelette recipe: "Finally, you obtain a delicious omelette" / "First, you break the eggs" / "Secondly, you beat it to get a paste" / "Then, you add salt and pour into hot oil."$$, 'solution', $$"First, you break the eggs. Secondly, you beat it to get a paste. Then, you add salt and pour into hot oil. Finally, you obtain a delicious omelette."$$),
        'fixation', jsonb_build_object('question', $$Which word do we use to introduce the very last step of a recipe?$$, 'solution', $$"Finally."$$)
      ),
      jsonb_build_object(
        'heading', $$Giving instructions: the imperative$$,
        'body', $$More vocabulary: to boil, to taste, to pound, to season, to add, to grind the maize. To give instructions or commands, we use the imperative (the base verb, without a subject): "Boil the meat." "Cut up onions." "Put oil." "Add salt."$$,
        'highlights', array[$$imperative = base verb, no subject (Boil the meat, Add salt)$$]::text[],
        'example', jsonb_build_object('statement', $$Give the instruction for boiling water.$$, 'solution', $$"Boil the water."$$),
        'fixation', jsonb_build_object('question', $$Give the instruction to add seasoning cube to the soup.$$, 'solution', $$"Add the seasoning cube to the soup."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$While on holiday in Ghana, your aunt calls you on the phone to give instructions for preparing "jollof rice" (riz gras) because she cannot come home in time.$$,
      'questions', array[
        $$Listen to (or read) the instructions and note the ingredients mentioned.$$,
        $$Write the steps of the recipe in order using first, second, then, and finally.$$,
        $$Give at least three instructions using the imperative (e.g. "Boil the rice," "Add salt").$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Reorder to make a good sentence: "salt / in / soup / the / add"$$,
      'hint', $$Start with the imperative verb.$$,
      'expected', $$"Add salt in the soup."$$
    ),
    jsonb_build_object(
      'question', $$Reorder to make a good sentence: "In the mortar / pound / the plantain"$$,
      'hint', $$Start with the imperative verb.$$,
      'expected', $$"Pound the plantain in the mortar."$$
    ),
    jsonb_build_object(
      'question', $$Put in order: boil the spaghetti / put oil and ingredients in the pan / add the spaghetti / mix up / your spaghetti is ready$$,
      'hint', $$Use first, next, then, and, finally.$$,
      'expected', $$"First, boil the spaghetti. Next, put oil and the ingredients in the frying pan. Then, add the spaghetti in the frying pan. And, mix up the spaghetti with the small soup. Finally, your spaghetti is ready!"$$
    ),
    jsonb_build_object(
      'question', $$Give the imperative instruction to grill both the fish and the meat.$$,
      'hint', $$Start with "Grill".$$,
      'expected', $$"Grill the fish and the meat."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-recettes-cuisine';
