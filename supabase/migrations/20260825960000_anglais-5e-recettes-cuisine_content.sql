-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais.
-- Cours : "Unit 2: At Home — Lesson 3: The tchonron soup" (Speaking),
-- Session 1 (recipe process vocabulary). Contenu réécrit à partir du
-- PDF source ; vocabulaire, situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'occasion d'un concours culinaire organisé par le club d'Anglais de leur collège, des élèves de 5ème apprennent les noms des actions de cuisine en anglais afin de mieux présenter leurs recettes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: cooking actions$$,
        'body', $$Key words describing a recipe process: to roast, to chop, to cut, to taste, to pound, peanuts, to fry, smoked fish, to slice.$$,
        'highlights', array[$$to roast, to chop, to cut, to taste, to pound, to fry, to slice$$]::text[],
        'fixation', jsonb_build_object('question', $$What verb describes crushing peanuts or yam with a pestle?$$, 'solution', $$To pound.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing a process (the imperative)$$,
        'body', $$To describe the steps of a recipe, use the imperative with sequencing words: "First, cut the onion. Then, wash the tomatoes." Steps can be reordered logically: wash your hands → slice the onions, garlic and ginger → fry them → add the vegetables → add water and cook.$$,
        'highlights', array[$$imperative + First/Then/Next = décrire les étapes d'une recette$$]::text[],
        'example', jsonb_build_object('statement', $$Put these steps in order: fry onion garlic and ginger / wash your hands / add water and fry for 15 minutes / slice the onions, garlic and ginger.$$, 'solution', $$Wash your hands → Slice the onions, garlic and ginger → Fry onion, garlic and ginger → Add water and fry for 15 minutes.$$),
        'fixation', jsonb_build_object('question', $$Complete: "___, cut the onion. ___, wash the tomatoes." (sequencing words)$$, 'solution', $$First... Then...$$)
      ),
      jsonb_build_object(
        'heading', $$Describing cooking scenes$$,
        'body', $$These verbs describe people cooking: "The cook always tastes the dish before serving it." "Fatou is pounding some plantains." "He is cutting the potatoes." "Mum is frying some cakes." Note the present continuous (is/are + verb-ing) is used to describe an action happening now.$$,
        'highlights', array[$$present continuous : is/are + verb-ing → décrire une action de cuisine en cours$$]::text[],
        'fixation', jsonb_build_object('question', $$Describe someone cutting potatoes right now.$$, 'solution', $$He/She is cutting the potatoes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You visited your Gambian friend, who taught you how to cook the best meal of his family. Back at school, your English teacher asks you to tell your classmates how to cook this meal.$$,
      'questions', array[
        $$What is the name of the meal?$$,
        $$What are its ingredients?$$,
        $$Describe, step by step using the imperative, how to prepare it.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What's the imperative form of "to cut" used to give an instruction?$$,
      'hint', $$The imperative uses the base form of the verb.$$,
      'expected', $$Cut (e.g. "Cut the onion.")$$
    ),
    jsonb_build_object(
      'question', $$Translate: "D'abord, coupez l'oignon. Ensuite, lavez les tomates."$$,
      'hint', $$Use First/Then + imperative.$$,
      'expected', $$First, cut the onion. Then, wash the tomatoes.$$
    ),
    jsonb_build_object(
      'question', $$What verb means "to cook food in hot oil"?$$,
      'hint', $$Think of frying.$$,
      'expected', $$To fry.$$
    ),
    jsonb_build_object(
      'question', $$"The cook always ___ the dish before serving it." Complete with the correct verb.$$,
      'hint', $$She checks the flavour.$$,
      'expected', $$tastes.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-recettes-cuisine';
