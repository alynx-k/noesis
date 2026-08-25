-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 7: Health and Environment — Lesson 2: Insanitary
-- places and common diseases". Contenu réécrit à partir du PDF source ;
-- vocabulaire, situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 5ème lisent des lettres de leurs correspondants américains qui parlent des endroits insalubres et des maladies courantes dans leur pays.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: common diseases$$,
        'body', $$A disease/sickness/illness = a malady. Fever: a high temperature caused by a disease. Common diseases: diarrhea, conjunctivitis (pink eye), chickenpox (varicella), malaria, coronavirus-covid-19, AIDS, typhoid fever, tuberculosis. Other pains: stomachache, headache, toothache.$$,
        'highlights', array[$$diarrhea, conjunctivitis, chickenpox, malaria, covid-19, AIDS, typhoid fever$$, $$stomachache, headache, toothache, fever$$]::text[],
        'fixation', jsonb_build_object('question', $$What disease is also called "pink eye"?$$, 'solution', $$Conjunctivitis.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing causes$$,
        'body', $$To explain what causes an illness: subject + cause(s) + complement. "Mosquito bites cause malaria." "Microbes in the mouth cause toothache." "Eating many mangoes causes stomachache."$$,
        'highlights', array[$$[cause] + cause(s) + [maladie]$$]::text[],
        'example', jsonb_build_object('statement', $$What causes conjunctivitis? (bacteria infection of the eye)$$, 'solution', $$A bacteria infection of the eye causes conjunctivitis.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Covid-19 can ___ cold and flu, respiration problems and coughing."$$, 'solution', $$cause.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: insanitary conditions$$,
        'body', $$An insanitary place is a place which is very dirty; a salubrious place is a place which is clean. Related words: rubbish, a rubbish can, leftover food, to sweep, to collect, to throw rubbish away, to prevent, to protect oneself against.$$,
        'highlights', array[$$insanitary ≠ salubrious$$, $$rubbish, rubbish can, to sweep, to collect, to throw away$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the opposite of "insanitary"?$$, 'solution', $$Salubrious.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Giving advice (should/shouldn't)$$,
        'body', $$"We should keep our environment clean." "We shouldn't live in dirty places." Structure: subject + should/shouldn't + verb + complement.$$,
        'highlights', array[$$should = conseil positif ; shouldn't = conseil négatif$$]::text[],
        'fixation', jsonb_build_object('question', $$Complete: "We ___ protect ourselves against malaria by sleeping under mosquito nets." (should/shouldn't)$$, 'solution', $$should.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the celebration of Health Day, you are asked to present a short talk on conjunctivitis to your class.$$,
      'questions', array[
        $$Say what conjunctivitis is.$$,
        $$State the causes and symptoms of conjunctivitis.$$,
        $$Suggest measures to avoid conjunctivitis using should/shouldn't.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What disease is caused by mosquito bites?$$,
      'hint', $$It's very common in Côte d'Ivoire.$$,
      'expected', $$Malaria.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Nous devrions garder notre environnement propre."$$,
      'hint', $$Use "should".$$,
      'expected', $$We should keep our environment clean.$$
    ),
    jsonb_build_object(
      'question', $$What do you call food that is left on a plate after a meal?$$,
      'hint', $$It should be thrown away.$$,
      'expected', $$Leftover food.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Eating too much ___ stomachache." (cause/causes)$$,
      'hint', $$Subject "eating too much" is singular.$$,
      'expected', $$causes.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-insalubrite-maladies';
