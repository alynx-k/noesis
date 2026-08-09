-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 7
-- LESSON 1: Is it an epidemic or a pandemic?" PDF (impersonal passive,
-- asking about symptoms), but every sentence, name, and exercise is an
-- original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$For World Health Day, your class prepares an English poster about common diseases in your region. You need vocabulary to describe diseases and symptoms, and grammar to report what people generally say about them.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: types of disease$$,
        'body', $$Diseases can be described by how widely they spread. These words help you talk about that scale, and name some common illnesses.$$,
        'highlights', array[$$an epidemic$$, $$a pandemic$$, $$malaria$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a disease$$, $$an illness$$),
            jsonb_build_array($$malaria$$, $$a disease transmitted by the bite of a mosquito$$),
            jsonb_build_array($$diarrhea$$, $$an illness causing frequent, watery bowel movements$$),
            jsonb_build_array($$AIDS$$, $$a disease transmitted by HIV, with no vaccine$$),
            jsonb_build_array($$an epidemic$$, $$a disease that affects many people in one specific region$$),
            jsonb_build_array($$a pandemic$$, $$a contagious disease that spreads across the whole world$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The impersonal passive reports a general belief without naming who believes it: "People say that + subject + verb" becomes "Subject + is/are said to + base verb".$$),
        'example', jsonb_build_object('statement', $$Turn this into the impersonal passive: "People say that malaria is dangerous."$$, 'solution', $$Malaria is said to be dangerous.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using the impersonal passive: "People believe that this disease spreads quickly."$$, 'solution', $$This disease is believed to spread quickly.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: symptoms and treatment$$,
        'body', $$When someone is sick, doctors and patients need precise words to describe what is wrong and what to do about it.$$,
        'highlights', array[$$a symptom$$, $$a prescription$$, $$high fever$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a symptom$$, $$a sign in the body that shows a person is ill$$),
            jsonb_build_array($$high fever$$, $$a body temperature clearly above normal$$),
            jsonb_build_array($$a headache$$, $$a pain felt inside the head$$),
            jsonb_build_array($$lack of appetite$$, $$not wanting to eat$$),
            jsonb_build_array($$a drug$$, $$a medicine used to treat an illness$$),
            jsonb_build_array($$a prescription$$, $$a paper on which a doctor writes the medicine a patient needs$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To ask about symptoms, use "What are the symptoms of + disease?". To answer, list them with "You have + symptom, symptom, and symptom."$$),
        'example', jsonb_build_object('statement', $$Ask and answer about the symptoms of a cold.$$, 'solution', $$What are the symptoms of a cold? You have a headache, a light fever, and a lack of appetite.$$),
        'fixation', jsonb_build_object('question', $$Answer this question: "What are the symptoms of malaria?" (high fever, body aches, headache)$$, 'solution', $$When you have malaria, you have high fever, body aches, and a headache.$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about a disease you can't name the source of$$,
        'body', $$The impersonal passive is especially useful for health information: it lets you report common knowledge about a disease without claiming personal proof.$$,
        'highlights', array[$$common knowledge$$, $$without personal proof$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "is/are said/believed/known/thought to + base verb" whenever you want to report general knowledge or opinion about health, without saying exactly who said it.$$),
        'example', jsonb_build_object('statement', $$Report general knowledge about handwashing using the impersonal passive.$$, 'solution', $$Regular handwashing is known to prevent many diseases.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "is thought to": "People think that this treatment cures the disease quickly."$$, 'solution', $$This treatment is thought to cure the disease quickly.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your class is preparing an English poster about a common disease in your region for World Health Day.$$,
      'questions', array[
        $$Name the disease you chose and classify it as an epidemic or a pandemic.$$,
        $$List its main symptoms, using "What are the symptoms of...?" and its answer.$$,
        $$Report one piece of common knowledge about the disease, using the impersonal passive.$$,
        $$Give one piece of advice to prevent this disease.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Rewrite using the impersonal passive: "People say that AIDS has no vaccine."$$,
      'hint', $$Subject + is said to + base verb.$$,
      'expected', $$AIDS is said to have no vaccine.$$
    ),
    jsonb_build_object(
      'question', $$Fill the gap: A person with typhoid fever often has a ___ (very small desire to eat).$$,
      'hint', $$Re-read the vocabulary for "lack of appetite".$$,
      'expected', $$A person with typhoid fever often has a lack of appetite.$$
    ),
    jsonb_build_object(
      'question', $$Ask a question about the symptoms of cholera, then answer it (dehydration, vomiting, diarrhea).$$,
      'hint', $$What are the symptoms of...? You have...$$,
      'expected', $$What are the symptoms of cholera? You have dehydration, vomiting, and diarrhea.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using the impersonal passive: "People believe that this disease spreads through dirty water."$$,
      'hint', $$Subject + is believed to + base verb.$$,
      'expected', $$This disease is believed to spread through dirty water.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-maladies-endemiques';
