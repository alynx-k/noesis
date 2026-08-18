-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1537: "UNIT 3_ Deadly Viruses and Diseases_ Writing"
-- (https://lyc.ecole-ci.org/course/view.php?id=1537), resource id 11942.
-- Contenu réécrit à partir du PDF source (méthode d'écriture en 3 étapes :
-- generating/organising/drafting ideas, appliquée au sujet Ebola). Faits
-- médicaux et historiques réels sur Ebola (épidémie de 2014 en Guinée,
-- symptômes, transmission, prévention) repris tels quels (données
-- factuelles publiques) ; présentation et exercices reformulés.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit3-deadly-viruses-writing',
  '1ere',
  'A',
  'anglais',
  $$Unit 3: Deadly Viruses and Diseases (Writing)$$,
  5,
  '1ere-a-ang-unit2-natural-resources-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$On the occasion of the 'World Health Day', the students of 1ère A are writing a text about deadly viruses and diseases in order to bring people to mind health issues.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Step 1: Generating ideas about Ebola$$,
        'body', $$Before writing, a good writer first gathers facts. Ebola is a severe, often fatal viral disease first identified near the Ebola River. The outbreak discussed here started in Southeastern Guinea and was declared an epidemic on March 23, 2014, later spreading to Guinea's bordering countries. Its symptoms include fever, headache, sore throat, muscle pain, fatigue, vomiting, diarrhea, and in severe cases internal and external bleeding. The incubation period ranges from 2 to 21 days. There is no proven cure, but treatment of specific symptoms and rehydration with fluids and body salts can improve chances of survival.$$,
        'highlights', array[$$epidemic declared : March 23, 2014, Guinea$$, $$incubation : 2-21 days$$, $$no proven cure, but symptom treatment helps$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the incubation period of Ebola, according to the lesson?$$, 'solution', $$From 2 to 21 days.$$)
      ),
      jsonb_build_object(
        'heading', $$Step 2: Organising ideas into paragraphs$$,
        'body', $$Once ideas are collected, a writer groups related ideas into paragraphs. For example, ideas about transmission (infected by bats, fruit bats, porcupines, direct contact with the blood, secretions, bodily fluids, infected people) belong together. Ideas about symptoms (fever, headache, sore throat, diarrhea, vomiting, muscle pain, internal and external bleeding) form another group. Ideas about prevention and response (hand hygiene, avoid public gatherings, contact tracing, case management, surveillance, laboratory testing, safe burials) form a third group. Ideas about social and economic impact (decline in agricultural production, loss in private sector growth, decrease in cross-border trade, orphans, great impact on children, food security) form a fourth group.$$,
        'highlights', array[$$group 1 : transmission$$, $$group 2 : symptoms$$, $$group 3 : prevention/response$$, $$group 4 : social/economic impact$$]::text[],
        'example', jsonb_build_object('statement', $$In which group would you place "contact tracing" and "safe burials"?$$, 'solution', $$In the prevention and response group, alongside hand hygiene, surveillance and laboratory testing.$$),
        'fixation', jsonb_build_object('question', $$Why is it useful to group ideas into paragraphs before drafting?$$, 'solution', $$Because it helps the writer structure the article logically, so that each paragraph develops one clear idea instead of mixing unrelated information.$$)
      ),
      jsonb_build_object(
        'heading', $$Step 3: Drafting and editing$$,
        'body', $$The final step is to write the paragraphs using the selected ideas, in full and correct sentences, then edit for spelling, grammar and punctuation, and finally produce a clean final draft — mindful of the layout of a magazine article (a title, an introduction, body paragraphs, and a conclusion).$$,
        'highlights', array[$$write → edit (spelling/grammar/punctuation) → final draft$$, $$mind the article layout$$]::text[],
        'fixation', jsonb_build_object('question', $$What should you check for when editing your draft, according to the lesson?$$, 'solution', $$Spelling, grammar and punctuation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On the occasion of the 'World Health Day', you have to write an article for your English club magazine about the Ebola disease.$$,
      'questions', array[
        $$Say how Ebola is transmitted.$$,
        $$Give its impact on social life.$$,
        $$Explain how it can be avoided (20 lines maximum).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$In which Guinean region did the 2014 Ebola epidemic discussed in the lesson break out?$$,
      'hint', $$It's a direction of the country.$$,
      'expected', $$Southeastern Guinea.$$
    ),
    jsonb_build_object(
      'question', $$Name two animals mentioned as possible sources of Ebola transmission.$$,
      'hint', $$One is a flying mammal, the other has spines.$$,
      'expected', $$Fruit bats and porcupines.$$
    ),
    jsonb_build_object(
      'question', $$Since there is no proven cure for Ebola, what can be done to treat patients?$$,
      'hint', $$Two things are mentioned in the lesson.$$,
      'expected', $$Treatment of specific symptoms, and rehydration with fluids and body salts.$$
    ),
    jsonb_build_object(
      'question', $$Using "is thought to", write a sentence about a possible origin of a disease, following the model "Monkeys are thought to be behind the transmission of Ebola."$$,
      'hint', $$Use the passive pattern "X is/are thought to be...".$$,
      'expected', $$Any grammatically correct sentence following the pattern, e.g. "Fruit bats are thought to be behind the transmission of Ebola."$$
    )
  ),
  now()
);
