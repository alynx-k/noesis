-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 7: Health and Environment — Lesson 3: Water and
-- health". Contenu réécrit à partir du PDF source ; vocabulaire, situations
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'occasion de la journée internationale de la santé, les élèves de 5ème lisent un article sur l'importance de l'eau dans le monde afin de préparer un exposé pour le club d'Anglais.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: water$$,
        'body', $$Key words: water from the tap, water from the well, water from the river, polluted water, to filter, to save water ≠ to waste water. "To filter": you should filter water from the river before drinking. "To infect" = to contaminate.$$,
        'highlights', array[$$water from the tap/well/river$$, $$polluted water ; to filter$$, $$to save water ≠ to waste water$$]::text[],
        'fixation', jsonb_build_object('question', $$What should you do to river water before drinking it?$$, 'solution', $$Filter it.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Giving advice about water (must/mustn't)$$,
        'body', $$"We must drink clean water to prevent sickness." "We mustn't waste water." Structure: subject + must/mustn't + verb + object.$$,
        'highlights', array[$$must/mustn't + verbe + complément$$]::text[],
        'example', jsonb_build_object('statement', $$Give advice: "children / swim in polluted waters" (mustn't)$$, 'solution', $$Children mustn't swim in polluted waters.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Villagers ___ boil water from the well before drinking."$$, 'solution', $$must.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: health$$,
        'body', $$Key words: to be healthy ≠ to be sick/ill, to suffer from, to feel worse, medicine/tablet/pill, to recover from, to feel better (= to feel well).$$,
        'highlights', array[$$healthy ≠ sick/ill$$, $$to suffer from ; to recover from$$, $$medicine, tablet, pill$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the opposite of "to feel worse"?$$, 'solution', $$To feel better (to feel well).$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing one's opinion$$,
        'body', $$To give an opinion, use: "For me, we should see a doctor to take medicine." or "I think it is important to practise sports to be healthy."$$,
        'highlights', array[$$For me, ... / I think ...$$]::text[],
        'fixation', jsonb_build_object('question', $$Express an opinion about drinking well water without filtering it.$$, 'solution', $$For me, you mustn't drink the water from the well without filtering it.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You are participating in a competition at the American Embassy about the importance of water for health.$$,
      'questions', array[
        $$Say why water is important for our body.$$,
        $$Give two pieces of advice about drinking water safely (must/mustn't).$$,
        $$Give your opinion on what people should do to avoid water-related diseases.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Nous ne devons pas gaspiller l'eau."$$,
      'hint', $$Use "mustn't".$$,
      'expected', $$We mustn't waste water.$$
    ),
    jsonb_build_object(
      'question', $$What's the opposite of "to save water"?$$,
      'hint', $$Think of using it carelessly.$$,
      'expected', $$To waste water.$$
    ),
    jsonb_build_object(
      'question', $$What word means "to have a good health"?$$,
      'hint', $$It's the opposite of being sick.$$,
      'expected', $$To be healthy.$$
    ),
    jsonb_build_object(
      'question', $$Give your opinion: "Is it important to drink clean water?" Use "I think..."$$,
      'hint', $$Express an opinion.$$,
      'expected', $$I think it is important to drink clean water to stay healthy.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-eau-sante';
