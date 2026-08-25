-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 6: Food and Drinks — Lesson 1: Do you know the
-- menu?". Contenu réécrit à partir du PDF source ; vocabulaire, situations
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En visite au Ghana, un élève de 5ème se rend au restaurant avec son correspondant ghanéen. Il l'écoute commander leur repas afin de découvrir les plats de son pays.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: at the restaurant$$,
        'body', $$Key words: dishes, restaurant, menu, to order, a piece of bread, a slice of cake, a glass of water, a cup of tea, a drink, a starter, main dish, dessert, a waiter. Drinks: orange juice, sorrel juice, lemon juice, ginger juice.$$,
        'highlights', array[$$dishes, restaurant, menu, to order$$, $$starter, main dish, dessert, a waiter$$, $$orange juice, sorrel juice, lemon juice, ginger juice$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call the first course of a meal, before the main dish?$$, 'solution', $$A starter.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Ordering a meal$$,
        'body', $$When you go to a restaurant, you are given a menu to choose what you want to eat. To order your meal, you can say: "Can I have fried rice and chicken?" or "I want to have fried rice and chicken."$$,
        'highlights', array[$$Can I have...? / I want to have...$$]::text[],
        'example', jsonb_build_object('statement', $$Order a bottle of coke and a slice of cake at a restaurant.$$, 'solution', $$Can I have a bottle of coke and a slice of cake, please?$$),
        'fixation', jsonb_build_object('question', $$Translate: "Je voudrais un verre d'eau, s'il vous plaît."$$, 'solution', $$Can I have a glass of water, please?$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Offering to help (sense verbs)$$,
        'body', $$A waiter offers help by saying "Can I help you?" or "How can I help you?" To describe food with the senses: "It smells good." "It tastes sweet." "It looks delicious." "It sounds good."$$,
        'highlights', array[$$Can I help you? / How can I help you?$$, $$sense verbs: to smell, to taste, to look, to sound$$]::text[],
        'fixation', jsonb_build_object('question', $$Complete: "Mum is cooking in the kitchen; it ___ good." (sense verb)$$, 'solution', $$smells.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$During the holidays, you visit Accra where your pen-friend Kwési works as a waiter in a restaurant. A client comes and you must offer help and take the order.$$,
      'questions', array[
        $$List the different types of food a restaurant can offer (starter, main dish, drink).$$,
        $$Write a short dialogue in which the waiter offers help and the client orders a meal.$$,
        $$Describe the taste of one dish using a sense verb.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What's the word for "une tasse de thé"?$$,
      'hint', $$Use "a cup of...".$$,
      'expected', $$A cup of tea.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Puis-je avoir du riz frit avec du poulet ?"$$,
      'hint', $$Use "Can I have...?"$$,
      'expected', $$Can I have fried rice with chicken?$$
    ),
    jsonb_build_object(
      'question', $$What do you call the list of dishes available in a restaurant?$$,
      'hint', $$You read it before ordering.$$,
      'expected', $$The menu.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Apple juice ___ sweet." (sense verb)$$,
      'hint', $$Think about flavour.$$,
      'expected', $$tastes.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-repas-boissons';
