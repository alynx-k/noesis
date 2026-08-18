-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1540: "Unit 3_Deadly viruses and diseases_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=1540), resource id 11978.
-- Contenu réécrit à partir du PDF source (vocabulaire, impersonal passive,
-- exercices sur la transmission/prévention du COVID-19). Faits médicaux
-- réels (mesures de prévention COVID-19) repris tels quels (données
-- factuelles publiques) ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit3-deadly-viruses-speaking',
  '1ere',
  'A',
  'anglais',
  $$Unit 3: Deadly Viruses and Diseases (Speaking)$$,
  6,
  '1ere-a-ang-unit3-deadly-viruses-writing',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$The Ghanaian embassy in Côte d'Ivoire is going to organise a debate on deadly viruses and diseases. To participate in this exchange, the students of your class are discussing in order to collect the maximum information on the topic.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Disease means illness or malady. A pandemic is a disease that spreads all over the world. An endemic disease is one that prevails in a particular region or area. Lockdown means confinement. A sanitizer is a product that kills microbs. Droplets are very small masses of liquid. A virus is a tiny organism that causes diseases such as Ebola and COVID-19. To inhale means to draw air into the lungs through the nose or mouth.$$,
        'highlights', array[$$disease, pandemic, endemic$$, $$lockdown, sanitizer, droplets, virus, inhale$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the difference between a "pandemic" and an "endemic" disease?$$, 'solution', $$A pandemic spreads all over the world, while an endemic disease prevails only in a particular region or area.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: the impersonal passive$$,
        'body', $$We use the impersonal passive to report what people generally say or believe, without naming who says it. Pattern: "It is said that + clause", which can also be rewritten as "Subject + is said to be + adjective/noun". Example: "COVID-19 is a dangerous disease." → "It is said that COVID-19 is a dangerous disease." → "COVID-19 is said to be a dangerous disease."$$,
        'highlights', array[$$It is said that + clause$$, $$Subject + is said to be + ...$$]::text[],
        'example', jsonb_build_object('statement', $$Rewrite using the impersonal passive: "There is no official treatment for this sickness."$$, 'solution', $$It is said that there is no official treatment for this sickness.$$),
        'fixation', jsonb_build_object('question', $$Rewrite "We can avoid the covid-19 easily" using "It is said that".$$, 'solution', $$It is said that we can avoid the covid-19 easily.$$)
      ),
      jsonb_build_object(
        'heading', $$Transmission, symptoms and prevention$$,
        'body', $$COVID-19 spreads mainly through droplets released when an infected person coughs, sneezes or talks; these droplets can be inhaled or land in the mouth or nose of a nearby person, or be picked up by touching a contaminated surface and then touching the eyes, nose or mouth. Common symptoms include feeling tired (fatigue) and feeling feverish. To prevent transmission, people are advised to stay home as much as possible, wash their hands often with soap and water, use an alcohol-based hand sanitizer with at least 60% alcohol, cover their face with a mask in public spaces, cover their mouth and nose with their elbow or a tissue when coughing or sneezing, and clean and disinfect high-touch surfaces such as doorknobs and light switches daily.$$,
        'highlights', array[$$transmission : droplets, contaminated surfaces$$, $$symptoms : fatigue, fever$$, $$prevention : masks, hand hygiene, disinfecting surfaces$$]::text[],
        'fixation', jsonb_build_object('question', $$Give two ways of preventing the transmission of a disease like COVID-19.$$, 'solution', $$For example washing hands often with soap and water, and wearing a face mask in public spaces (also valid: using hand sanitizer, disinfecting surfaces).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English club is organising a presentation about COVID-19. You are given the floor to give some information about this disease to the audience.$$,
      'questions', array[
        $$Tell the audience what COVID-19 is.$$,
        $$Tell the audience what people say about the way it is caught and transmitted.$$,
        $$Explain how it can be avoided.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Classify: "Cover your mouth and nose with your elbow or a tissue when you cough or sneeze" — is this transmission (T), prevention (P), symptom (S) or contamination (C)?$$,
      'hint', $$It's an action people are advised to take.$$,
      'expected', $$Prevention (P).$$
    ),
    jsonb_build_object(
      'question', $$Classify: "Feeling tired" — T, P, S or C?$$,
      'hint', $$It's something a sick person experiences.$$,
      'expected', $$Symptom (S).$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using the impersonal passive: "The covid-19 does not kill easily."$$,
      'hint', $$Use "It is said that...".$$,
      'expected', $$It is said that the covid-19 does not kill easily.$$
    ),
    jsonb_build_object(
      'question', $$What percentage of alcohol should a hand sanitizer contain, according to the lesson?$$,
      'hint', $$It's a minimum percentage.$$,
      'expected', $$At least 60% alcohol.$$
    )
  ),
  now()
);
