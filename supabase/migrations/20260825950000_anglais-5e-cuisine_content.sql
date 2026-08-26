-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais.
-- Cours : "Unit 2: At Home — Lesson 3: The tchonron soup" (Speaking),
-- Session 2 (kitchen vocabulary section). Contenu réécrit à partir du
-- PDF source ; vocabulaire, situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'occasion d'un concours culinaire organisé par le club d'Anglais de leur collège, des élèves de 5ème apprennent le vocabulaire de la cuisine (ustensiles, actions) afin de mieux décrire la préparation de leurs plats.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: kitchen words$$,
        'body', $$Key words: stove, cooker, fire, to mash, prawns, recipe, to stir, salt. These describe the equipment (stove, cooker) and actions (to mash, to stir) used when cooking in the kitchen.$$,
        'highlights', array[$$stove, cooker, fire = équipement de cuisine$$, $$to mash, to stir = actions culinaires$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call the appliance used to cook food with gas or electricity?$$, 'solution', $$A cooker (or a stove).$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing obligation (must / mustn't)$$,
        'body', $$To express an obligation, use "must" (positive) and "mustn't" (prohibition): "You must wash your hands before eating." "You mustn't eat too much salt." This structure is often used to give kitchen safety rules.$$,
        'highlights', array[$$must = obligation ; mustn't = interdiction$$]::text[],
        'example', jsonb_build_object('statement', $$Rewrite as an obligation: "Don't put chilli in the sauce."$$, 'solution', $$You mustn't put chilli in the sauce.$$),
        'fixation', jsonb_build_object('question', $$Complete: "To cook rice, you ___ boil water first."$$, 'solution', $$must.$$)
      ),
      jsonb_build_object(
        'heading', $$Practising must/mustn't with kitchen instructions$$,
        'body', $$Common kitchen rules use must/mustn't: "Before making an omelette, you must break the eggs." "Dad doesn't like hot dishes, you mustn't put too much pepper." "To cook 'foutou', you must pound some yam."$$,
        'highlights', array[$$must + verb = obligatoire ; mustn't + verb = interdit$$]::text[],
        'fixation', jsonb_build_object('question', $$Complete: "When frying cakes, you ___ cover the pot." (it's forbidden to cover it)$$, 'solution', $$mustn't.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English teacher asks you to explain how to prepare the basic food of your region.$$,
      'questions', array[
        $$Give the name of your recipe.$$,
        $$List the different ingredients.$$,
        $$Explain what you must and mustn't do during its preparation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What kitchen tool do you use to cook food over a flame?$$,
      'hint', $$Think of the traditional cooking method.$$,
      'expected', $$Fire (or a stove/cooker).$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Il faut laver les mains avant de manger."$$,
      'hint', $$Use "must".$$,
      'expected', $$You must wash your hands before eating.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Vous ne devez pas manger trop de sel."$$,
      'hint', $$Use "mustn't".$$,
      'expected', $$You mustn't eat too much salt.$$
    ),
    jsonb_build_object(
      'question', $$What does "to stir" mean?$$,
      'hint', $$Think of mixing a sauce with a spoon.$$,
      'expected', $$To mix a liquid or food with a spoon or utensil.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-cuisine';
