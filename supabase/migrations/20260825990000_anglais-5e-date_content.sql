-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 3: Time and Date — Lesson 3: Adon's schedule".
-- Contenu réécrit à partir du PDF source ; il porte sur les projets futurs
-- et l'organisation d'un emploi du temps personnel avec des dates
-- précises (ordinaux, mois), le contenu le plus proche du thème "La date"
-- disponible sur la plateforme source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour obtenir de bons résultats à l'école, les élèves de 5ème du Lycée municipal de Niakara rédigent un emploi du temps personnel indiquant leurs activités avec des dates précises.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: schedules and dates$$,
        'body', $$Key words: tidy (≠ messy), to take a quiz, to travel, to plan. Dates are written with ordinal numbers: September 8th, July 15th, August 3rd.$$,
        'highlights', array[$$tidy ≠ messy$$, $$dates: month + ordinal number (September 8th)$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the opposite of "tidy"?$$, 'solution', $$Messy.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Talking about future plans (present continuous)$$,
        'body', $$To talk about a planned future event, use "am/is/are + verb-ing" with a future time marker: "I am visiting my grandparents next month." / "She is taking her quiz on September 8th."$$,
        'highlights', array[$$subject + am/is/are + verb-ing + [date/time future]$$]::text[],
        'example', jsonb_build_object('statement', $$Ask what Sally is doing on September 28th, knowing the answer is "take a quiz".$$, 'solution', $$What is Sally doing on September 28th? — She is taking a quiz.$$),
        'fixation', jsonb_build_object('question', $$Complete: "I ___ (to travel) to Paris for Christmas."$$, 'solution', $$am travelling.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing sequences$$,
        'body', $$To describe the order of a schedule, use: first, second, next/then/after that, finally/last/in the end. Example: "First, I wake up at 6 o'clock. Second, I take my bath. Next, I have my breakfast. Then, I wear my uniform and finally I go to school."$$,
        'highlights', array[$$first, second, next/then, finally/last$$]::text[]
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$In order to get good results at school, you decide to make a personal schedule with precise dates for your daily and future activities.$$,
      'questions', array[
        $$Write your schedule with at least three dated events.$$,
        $$Describe it using the present continuous for future plans.$$,
        $$Describe one day of your schedule using sequencing words (first, second, then, finally).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Je pars pour Toumodi le 3 août."$$,
      'hint', $$Use the present continuous with an ordinal date.$$,
      'expected', $$I am travelling to Toumodi on August 3rd.$$
    ),
    jsonb_build_object(
      'question', $$Reorder: "personal / a / has / Adon / schedule."$$,
      'hint', $$Subject + verb + object.$$,
      'expected', $$Adon has a personal schedule.$$
    ),
    jsonb_build_object(
      'question', $$What does "to take a quiz" mean?$$,
      'hint', $$It's a small school evaluation.$$,
      'expected', $$To have a small test/evaluation.$$
    ),
    jsonb_build_object(
      'question', $$Complete the sequence: "First, I wake up. ___, I take my bath."$$,
      'hint', $$What comes after "first"?$$,
      'expected', $$Second.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-date';
