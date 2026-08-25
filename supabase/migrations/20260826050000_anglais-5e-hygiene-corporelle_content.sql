-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 7: Health and Environment — Lesson 1: Hygiene and
-- the parts of the body". Contenu réécrit à partir du PDF source ;
-- vocabulaire, situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'occasion de la journée internationale de la santé, les élèves de 5ème lisent un texte sur l'importance de l'hygiène corporelle afin d'en discuter avec leurs camarades.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: parts of the body$$,
        'body', $$Key words: head, shoulder(s), neck, arm(s), hand(s), finger(s), leg(s), knee(s), foot (feet), toe(s). Also: to touch, to smell, to taste, to hear, to see (linked to body parts: ear, eye, nose, tongue, body).$$,
        'highlights', array[$$head, shoulder, neck, arm, hand, finger, leg, knee, foot (feet), toe$$, $$to touch/ear, to smell/nose, to taste/tongue, to hear/ear, to see/eye$$]::text[],
        'fixation', jsonb_build_object('question', $$Which sense do you use with your tongue?$$, 'solution', $$To taste.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: hygiene$$,
        'body', $$Key words: hygiene, to wash, clean ≠ dirty, to do the washing-up, to do the dishes, to brush one's teeth (= to clean one's teeth), to care for.$$,
        'highlights', array[$$clean ≠ dirty$$, $$to do the washing-up ; to do the dishes$$, $$to brush one's teeth$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the opposite of "clean"?$$, 'solution', $$Dirty.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing obligation (must/mustn't)$$,
        'body', $$To express an obligation: "We must practise hygiene to be clean." To express a prohibition: "We mustn't make our hands dirty." Structure: subject + must/mustn't + verb + complement.$$,
        'highlights', array[$$must = obligation ; mustn't = interdiction$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "You ___ wash your hands before taking your meal." (must/mustn't)$$, 'solution', $$must.$$),
        'fixation', jsonb_build_object('question', $$True or false: "I must see the dentist regularly to keep my teeth safe."$$, 'solution', $$True.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Giving orders with the imperative$$,
        'body', $$To give an order about the body, use the imperative: "Wash your hands before eating!" "Turn your head!" Negative form: "Don't sleep in class!" / "Do not eat too much!"$$,
        'highlights', array[$$verb + complement (order) ; Don't/Do not + verb (interdiction)$$]::text[],
        'fixation', jsonb_build_object('question', $$Give an order meaning "ne pas fermer les yeux".$$, 'solution', $$Don't close your eyes!$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English teacher has chosen you to talk about the importance of personal hygiene to your classmates.$$,
      'questions', array[
        $$Name five parts of the body you must wash every day.$$,
        $$Say three things you must do to be hygienic.$$,
        $$Say one thing you mustn't do (a bad hygiene habit).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Name the part of the body between the head and the shoulders.$$,
      'hint', $$It lets you turn your head.$$,
      'expected', $$The neck.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Nous devons garder notre corps propre."$$,
      'hint', $$Use "must".$$,
      'expected', $$We must keep our body clean.$$
    ),
    jsonb_build_object(
      'question', $$What's the word for washing plates, forks and glasses after a meal?$$,
      'hint', $$It's a kitchen chore.$$,
      'expected', $$To do the dishes.$$
    ),
    jsonb_build_object(
      'question', $$Give an order meaning "lave-toi les mains avant de manger !"$$,
      'hint', $$Use the imperative.$$,
      'expected', $$Wash your hands before eating!$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-hygiene-corporelle';
