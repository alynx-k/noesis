-- Contenu de secours (fallback) : le PDF source de la Leçon 1 de l'unité
-- "Jobs and Occupations" (5e) n'a pas pu être retrouvé sur coll.ecole-ci.org
-- (lien indisponible). Contenu rédigé à partir du programme éducatif
-- officiel DPFC de 5ème, dans le registre des Leçons 2 et 3 de la même
-- unité déjà disponibles sur la plateforme (outils et lieux de travail).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour le journal du club d'Anglais, les élèves de 5ème rédigent un article présentant les métiers et professions des membres de leur famille.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: jobs and occupations$$,
        'body', $$Key words: a teacher, a doctor, a nurse, a farmer, a driver, an engineer, a lawyer, a trader, a mechanic, a tailor, a fisherman.$$,
        'highlights', array[$$a teacher, a doctor, a nurse, a farmer, a driver$$, $$an engineer, a lawyer, a trader, a mechanic, a tailor$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call a person who repairs cars?$$, 'solution', $$A mechanic.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking and giving someone's job$$,
        'body', $$To ask about a job: "What is your father's job? — He is a farmer." / "What does your mother do? — She is a nurse."$$,
        'highlights', array[$$What is [subject]'s job? / What does [subject] do?$$]::text[],
        'example', jsonb_build_object('statement', $$Ask what Aya's mother's job is, knowing she is a teacher.$$, 'solution', $$What is Aya's mother's job? — She is a teacher.$$),
        'fixation', jsonb_build_object('question', $$Complete: "My uncle is a ___. He drives a taxi." (job)$$, 'solution', $$driver.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Defining jobs$$,
        'body', $$To define what a job consists of: "What does a teacher do? — A teacher teaches students." / "What does a farmer do? — A farmer grows crops."$$,
        'highlights', array[$$What does a [job] do? / A [job] + verbe$$]::text[],
        'fixation', jsonb_build_object('question', $$What does a nurse do?$$, 'solution', $$A nurse takes care of sick people.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le journal du club d'Anglais, tu dois rédiger un court paragraphe présentant les métiers de deux membres de ta famille.$$,
      'questions', array[
        $$Cite les métiers de deux membres de ta famille.$$,
        $$Définis chacun de ces métiers avec "What does a... do?"$$,
        $$Dis quel métier tu aimerais exercer plus tard et pourquoi.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Quel est le métier de ton père ? — Il est ingénieur."$$,
      'hint', $$Use "What is your father's job?"$$,
      'expected', $$What is your father's job? — He is an engineer.$$
    ),
    jsonb_build_object(
      'question', $$What does a lawyer do?$$,
      'hint', $$Think of the law court.$$,
      'expected', $$A lawyer defends or accuses people in court.$$
    ),
    jsonb_build_object(
      'question', $$What do you call a person who sews clothes?$$,
      'hint', $$Think of making garments.$$,
      'expected', $$A tailor.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "A farmer ___ crops." (job definition)$$,
      'hint', $$Think of agriculture.$$,
      'expected', $$grows.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-metiers-professions';
