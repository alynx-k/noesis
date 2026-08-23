-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 7_HEALTH AND ENVIRONMENT_Lesson 2_Reading (Insalubrity
-- and common diseases)". Contenu réécrit à partir du PDF source (Learn it,
-- do it 6è, programme officiel MENA) ; situation d'apprentissage,
-- vocabulaire, dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$At Collège Municipal Koro, as part of a Coronavirus awareness campaign, 6ème students learn about common diseases from the school nurse in order to raise awareness within the school's English Club.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: diseases, asking and giving advice$$,
        'body', $$Headache, stomachache, toothache, diarrhea, malaria, cold. To ask for advice: "What should I do?" — to give advice: "You should [verb]." Example: "I have a headache. What should I do?" → "You should take some paracetamol." / "You should see a doctor."$$,
        'highlights', array[$$headache, stomachache, toothache, diarrhea, malaria, cold$$, $$What should I do? → You should...$$]::text[],
        'fixation', jsonb_build_object('question', $$Moussa wants to move up to 5ème. What should he do?$$, 'solution', $$"He should study his lessons."$$)
      ),
      jsonb_build_object(
        'heading', $$Insalubrity vocabulary and yes/no questions with should$$,
        'body', $$Dustbin, garbage, broom, sweep, collect, wash, clean. To ask about advice with yes/no: "Should students study their lessons?" → "Yes, they should." "Should Yao eat with dirty hands?" → "No, he shouldn't."$$,
        'highlights', array[$$dustbin, garbage, broom, sweep, collect, clean$$, $$Should...? → Yes, ...should. / No, ...shouldn't.$$]::text[],
        'example', jsonb_build_object('statement', $$Ali has a very bad toothache; what should he do?$$, 'solution', $$"He should go to see a dentist."$$),
        'fixation', jsonb_build_object('question', $$Should I clean my hands before eating?$$, 'solution', $$"Yes, you should."$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: preventing malaria$$,
        'body', $$"Malaria is a common and dangerous disease in Africa. To avoid it, we should always clean our house, mop the bathroom, and sleep under a mosquito net. We should not throw rubbish in rivers and streets, and we should not keep dirty water near the house."$$,
        'highlights', array[$$to prevent malaria: clean house, mop, sleep under mosquito net$$, $$avoid: rubbish in rivers/streets, dirty water near the house$$]::text[],
        'example', jsonb_build_object('statement', $$According to the text, name one thing we should do to avoid malaria.$$, 'solution', $$"We should sleep under a mosquito net." (or clean the house / mop the bathroom)$$),
        'fixation', jsonb_build_object('question', $$Name one thing the text says we should not do.$$, 'solution', $$"We should not throw rubbish in rivers and streets." (or keep dirty water near the house)$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For a "Health for All" day organized by the English Club at Collège Municipal Koro, students match diseases to their symptoms: cold (fever, cough, sneezing, runny nose), malaria (fever, stiff muscles, vomiting, headache, tiredness), diarrhea (painful stomach, multiple liquid stools), toothache (painful teeth, difficulty chewing).$$,
      'questions', array[
        $$What is a text about preventing malaria mainly about?$$,
        $$What should we do to be healthy? Name at least two things.$$,
        $$Match each disease (cold, malaria, diarrhea, toothache) to its correct symptoms.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Unscramble the letters to find a disease: "ahohSmcetca"$$,
      'hint', $$It's a pain in the belly.$$,
      'expected', $$Stomachache.$$
    ),
    jsonb_build_object(
      'question', $$Mum and Fanta have malaria; what should they do?$$,
      'hint', $$Think of the appropriate medicine.$$,
      'expected', $$"They should take an anti-malaria medicine."$$
    ),
    jsonb_build_object(
      'question', $$Should he sleep in class?$$,
      'hint', $$This is not good behaviour — answer negatively.$$,
      'expected', $$"No, he shouldn't."$$
    ),
    jsonb_build_object(
      'question', $$Which disease has these symptoms: fever, difficulty breathing, cough, sneezing, runny nose?$$,
      'hint', $$It's a common, mild illness.$$,
      'expected', $$Cold.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-maladies-courantes';
