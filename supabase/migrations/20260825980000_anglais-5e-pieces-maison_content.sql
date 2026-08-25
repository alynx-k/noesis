-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 2: At Home — Lesson 2: A Sunday with my family"
-- (Speaking). Note : le titre du catalogue local est "Les pièces d'une
-- maison (My house)" ; aucun PDF source dédié au nom des pièces n'a pu être
-- retrouvé — le contenu réel disponible sur la plateforme couvre le
-- vocabulaire des activités domestiques quotidiennes (chambre/salon), le
-- sujet le plus proche disponible. Contenu réécrit à partir du PDF source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 5ème échange au téléphone avec son correspondant anglophone. Ils parlent des activités qu'ils font à la maison lorsqu'ils ne vont pas à l'école, pour mieux connaître leurs habitudes quotidiennes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: activities at home$$,
        'body', $$Key words: to brush one's teeth, to put on makeup, to shave, bed sheet, blanket, to switch on/off the light, to sweep. These are everyday actions and objects found in the different rooms of a house (bedroom, bathroom).$$,
        'highlights', array[$$to sweep, to brush one's teeth, to shave, a bed sheet, a blanket, to switch on/off the light, to put on makeup$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you use to cover yourself in bed when it's cold?$$, 'solution', $$A blanket.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing ongoing and habitual actions$$,
        'body', $$Use the present continuous for an action happening now, and the simple present for a habit: "Awa is making her bed." (now) / "She makes her bed every morning." (habit).$$,
        'highlights', array[$$present continuous = action en cours ; simple present = habitude$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "What is dad doing in the sitting room?" (to read a newspaper)$$, 'solution', $$He is reading a newspaper.$$),
        'fixation', jsonb_build_object('question', $$Complete with the correct form: "Every day I ___ (to take) a shower before going to school."$$, 'solution', $$take.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary and language function: Weekend activities (simple past)$$,
        'body', $$More home vocabulary: to learn, to revise, to go to church, to go to the mosque, to pray, to go fishing, to wash the dishes, to read a newspaper. To describe a past action: "What did you do last weekend? — I visited my grandparents."$$,
        'highlights', array[$$What did you do last weekend? / I + verbe au prétérit$$]::text[],
        'fixation', jsonb_build_object('question', $$Ask what someone did last Saturday, knowing the answer is "played football".$$, 'solution', $$What did you do last Saturday? — Last Saturday I played football.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Comme devoir de maison, le professeur te demande de décrire ce que tu fais à la maison les weekends.$$,
      'questions', array[
        $$Make five sentences about your weekend activities at home.$$,
        $$Say what you did last weekend using the simple past.$$,
        $$Read your sentences in class.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What's the word for the piece of cloth that covers a mattress?$$,
      'hint', $$You change it when you make the bed.$$,
      'expected', $$A bed sheet.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Elle balaie la maison tous les matins."$$,
      'hint', $$Use the simple present for a habit.$$,
      'expected', $$She sweeps the house every morning.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "My parents are in the living room, they ___ (to watch) the TV set." (present continuous)$$,
      'hint', $$Action happening right now.$$,
      'expected', $$are watching.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Qu'as-tu fait le week-end dernier ? — J'ai rendu visite à mes grands-parents."$$,
      'hint', $$Use the simple past.$$,
      'expected', $$What did you do last weekend? — I visited my grandparents.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-pieces-maison';
