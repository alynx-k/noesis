-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 4: Jobs and Occupations — Lesson 3: Where does
-- Aunt Enoh work?". Contenu réécrit à partir du PDF source ; vocabulaire,
-- situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors de la journée des métiers organisée par le club d'Anglais du Lycée Moderne 1 de Grand-Bassam, les élèves de 5ème visitent différents lieux de travail afin d'en rédiger la description.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: work places$$,
        'body', $$Key words: building site, law court, shop, car wash, dental clinic, workshop. Examples: an engineer works at a building site; a lawyer works at a law court; the barber and the greengrocer work in a shop.$$,
        'highlights', array[$$building site, law court, shop, car wash, dental clinic, workshop$$]::text[],
        'fixation', jsonb_build_object('question', $$Where does a lawyer work?$$, 'solution', $$At a law court.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Talking about work places$$,
        'body', $$To ask where someone works: "Where does the cook work? — He/she works in a kitchen." / "Can you tell me where accountants work? — They work in offices."$$,
        'highlights', array[$$Where does [subject] work? / He/She works in/at [place]$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "Where does a car washer work?"$$, 'solution', $$He works in a car wash.$$),
        'fixation', jsonb_build_object('question', $$Ask where architects work, knowing the answer is "on building sites".$$, 'solution', $$Where do architects work? — They work on building sites.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing places and performances (adjectives)$$,
        'body', $$Useful adjectives: smelly (having a bad odour), crowded (full of persons), fast (rapid), fragrant (perfumed), muddy (covered in mud). Example: "SOTRA's buses are crowded." "Muriel Ahouré runs fast."$$,
        'highlights', array[$$smelly, crowded, fast, fragrant, muddy$$]::text[],
        'fixation', jsonb_build_object('question', $$Complete: "Road building sites are generally ___." (covered in dust)$$, 'solution', $$dusty.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$With your Ghanaian friend Akwam, you discuss on Facebook about the work and workplaces of your parents.$$,
      'questions', array[
        $$Tell Akwam what your father's or mother's job is.$$,
        $$Say where he or she works.$$,
        $$Describe that workplace briefly using an adjective (crowded, fragrant, dusty...).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Where does a dentist work?$$,
      'hint', $$Think of the place dedicated to dental care.$$,
      'expected', $$At a dental clinic.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Le marché d'Adjamé est toujours bondé."$$,
      'hint', $$Use "crowded".$$,
      'expected', $$Adjamé market is always crowded.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Pilots work ___ a plane." (in/at/on)$$,
      'hint', $$Think of being inside the aircraft.$$,
      'expected', $$in.$$
    ),
    jsonb_build_object(
      'question', $$What's the opposite of "fragrant" (in the sense of a bad smell)?$$,
      'hint', $$Think of an unpleasant odour.$$,
      'expected', $$Smelly.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-lieux-travail';
