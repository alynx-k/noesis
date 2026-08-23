-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_UNIT 4_Jobs and Occupations_Lesson 3_Writing (Where does
-- Aunt Enoh work?)". Contenu réécrit à partir du PDF source (Learn it, do
-- it 6è, programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During the career day organized by the English Club of Lycée Moderne 1 de Grand-Bassam, 6ème students visit different workplaces in order to write a paragraph about them.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: workplaces$$,
        'body', $$A building site (where an engineer works), a law court (where a lawyer works), a shop (where a barber or a greengrocer works), a car wash (where a car washer washes cars), a plane (where a pilot works), a dental clinic (where a dentist works).$$,
        'highlights', array[$$building site, law court, shop, car wash, plane, dental clinic$$]::text[],
        'fixation', jsonb_build_object('question', $$Where does a lawyer work?$$, 'solution', $$"At a law court."$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about workplaces$$,
        'body', $$To ask where someone works, we say "Where does [job] work?" — answer: "He/She works in a [place]." Example: "Where does the cook work?" → "He/She works in a kitchen." For plural jobs: "Where do accountants work?" → "They work in offices."$$,
        'highlights', array[$$Where does [job] work? → He/She works in/at a [place]$$, $$Where do [jobs, plural] work? → They work in [places]$$]::text[],
        'example', jsonb_build_object('statement', $$Where does a car washer work?$$, 'solution', $$"He works in a car wash."$$),
        'fixation', jsonb_build_object('question', $$Where do architects work?$$, 'solution', $$"They work on building sites."$$)
      ),
      jsonb_build_object(
        'heading', $$Describing places, objects, and performance$$,
        'body', $$Smelly (having a bad odour), crowded (full of people), fast (rapid), fragrant (perfumed), muddy (covered in mud), cool (fresh/comfortable, e.g. from air conditioning). Examples: "The socks of Tom are smelly." "SOTRA's buses are crowded." "Muriel Ahouré runs fast."$$,
        'highlights', array[$$smelly, crowded, fast, fragrant, muddy, cool — descriptive adjectives$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "Road building sites are generally ______." (choose: fragrant, dusty, fast)$$, 'solution', $$"Road building sites are generally dusty."$$),
        'fixation', jsonb_build_object('question', $$Which adjective describes a place that smells good?$$, 'solution', $$"Fragrant."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$To help the English Club make a catalogue about the jobs held by its members' families, you write a paragraph about the job of one of your family members.$$,
      'questions', array[
        $$Say which family member you are going to talk about.$$,
        $$Mention the job he or she does.$$,
        $$Give the name of his/her workplace and briefly describe it (using an adjective like fast, crowded, cool, dusty...).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Where does the dentist work?$$,
      'hint', $$Think of the specific clinic name.$$,
      'expected', $$"The dentist works in a dental clinic."$$
    ),
    jsonb_build_object(
      'question', $$Reorder the letters to find a workplace: "E C I F O F"$$,
      'hint', $$It's where accountants work.$$,
      'expected', $$Office.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Adjamé Forum market is always ______." (choose: crowded, cool)$$,
      'hint', $$A busy market is full of people.$$,
      'expected', $$"Adjamé Forum market is always crowded."$$
    ),
    jsonb_build_object(
      'question', $$Write the question this answers: "I don't work. I am a student."$$,
      'hint', $$It's a general question about occupation.$$,
      'expected', $$"What do you do?" / "Do you work?"$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-lieux-travail';
