-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 4_JOBS AND OCCUPATIONS_Lesson 1_Writing (My father is a
-- policeman)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$For the English Club newspaper, 6ème students at Lycée Gouverneur Abdoulaye Fadiga de Touba write a paragraph describing the jobs and professions of their family members.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: jobs$$,
        'body', $$A teacher, a policeman, a policewoman, a taxi man, a butcher, a nurse, a hairdresser, a trader.$$,
        'highlights', array[$$teacher, policeman, policewoman, taxi man$$, $$butcher, nurse, hairdresser, trader$$]::text[],
        'fixation', jsonb_build_object('question', $$What job does someone who drives a taxi have?$$, 'solution', $$A taxi man.$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about people's jobs$$,
        'body', $$To ask about someone's job, we say "What is [name]'s job?" — example: "What's Assalé's job?" For a parent, we ask "What is your father's job?" The answer follows the pattern "He/She is a [job]": "He is a policeman."$$,
        'highlights', array[$$What is [name]'s job? → He/She is a [job]$$]::text[],
        'example', jsonb_build_object('statement', $$Arouna is a butcher. Write the question this answers.$$, 'solution', $$"What is Arouna's job?"$$),
        'fixation', jsonb_build_object('question', $$How do you ask about your mother's job?$$, 'solution', $$"What is your mother's job?"$$)
      ),
      jsonb_build_object(
        'heading', $$Defining jobs: what does he/she do?$$,
        'body', $$More vocabulary: secretary, carpenter, mechanic, doctor, pilot, farmer, barber, soldier. To ask what a job consists of, we say "What does a [job] do?" — example: "What does a carpenter do?" → "A carpenter makes furniture." / "He makes furniture." Other examples: a barber cuts men's hair; a mechanic repairs cars; a farmer grows crops; a pilot flies planes; an English teacher teaches English.$$,
        'highlights', array[$$What does a [job] do? → He/She [verb]s...$$, $$barber = cuts hair ; mechanic = repairs cars ; farmer = grows crops ; pilot = flies planes$$]::text[],
        'example', jsonb_build_object('statement', $$What does a policeman do?$$, 'solution', $$"He protects people."$$),
        'fixation', jsonb_build_object('question', $$What does a nurse do?$$, 'solution', $$"She cares for sick people." (looks after patients)$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The US Embassy in Côte d'Ivoire organizes a competition in which 6ème students at Lycée Gouverneur Abdoulaye Fadiga de Touba write a paragraph about the jobs and professions of their family members.$$,
      'questions', array[
        $$Name the jobs and professions you know.$$,
        $$Define three of them (say what they do).$$,
        $$Describe your parents' jobs and professions.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Reorder the letters to find a job: "TOLIP"$$,
      'hint', $$This person flies planes.$$,
      'expected', $$Pilot.$$
    ),
    jsonb_build_object(
      'question', $$Patricia is a nurse. Write the question this sentence answers.$$,
      'hint', $$Use "What is...'s job?"$$,
      'expected', $$"What is Patricia's job?"$$
    ),
    jsonb_build_object(
      'question', $$What does a hairdresser do?$$,
      'hint', $$Think about hair styling.$$,
      'expected', $$"A hairdresser cuts and styles people's hair."$$
    ),
    jsonb_build_object(
      'question', $$Diallo and Fanta are traders. Write the question this sentence answers.$$,
      'hint', $$The subject is plural — use "are".$$,
      'expected', $$"What are Diallo and Fanta's jobs?"$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-metiers-professions';
