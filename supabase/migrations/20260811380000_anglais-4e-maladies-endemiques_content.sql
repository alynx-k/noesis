-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806430000_anglais_maladies_endemiques_content.sql, the 3ème
-- equivalent, for the CourseContentV2 shape). 3ème covered the impersonal
-- passive "is said to"; this 4ème lesson steps up to passive verbs with
-- modals ("should be treated") and the present perfect passive ("has been
-- eradicated"), for a public-health-report register.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school's health club is preparing a public-health bulletin about endemic diseases in your region for the community noticeboard. The bulletin must sound like a real health report: precise about what should be done, and what progress has already been made.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: public health reporting$$,
        'body', $$A health bulletin needs precise, official vocabulary about disease control and treatment.$$,
        'highlights', array[$$to eradicate$$, $$to administer (treatment)$$, $$an outbreak$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to eradicate$$, $$to completely get rid of a disease$$),
            jsonb_build_array($$to administer (treatment)$$, $$to give medicine or care to a patient$$),
            jsonb_build_array($$an outbreak$$, $$a sudden appearance of a disease in a community$$),
            jsonb_build_array($$to quarantine$$, $$to isolate someone to prevent a disease spreading$$),
            jsonb_build_array($$a vector$$, $$a living thing, such as a mosquito, that spreads disease$$),
            jsonb_build_array($$immunisation$$, $$the process of making someone immune to a disease$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Passive verbs can combine with modals to state medical recommendations: "should be + past participle" gives official advice about treatment: Malaria should be treated promptly with the correct medication.$$),
        'example', jsonb_build_object('statement', $$Give official advice about a suspected case of malaria.$$, 'solution', $$Suspected cases should be tested immediately at the nearest health centre.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Contaminated water ___ (should/boil) before it is used for drinking."$$, 'solution', $$Contaminated water should be boiled before it is used for drinking.$$)
      ),
      jsonb_build_object(
        'heading', $$Reporting progress: the present perfect passive$$,
        'body', $$A health bulletin also needs to report progress already achieved -- work completed over recent years, described without naming exactly who did it.$$,
        'highlights', array[$$has been eradicated$$, $$has been reduced$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The present perfect passive (has/have been + past participle) reports progress up to now: Guinea worm disease has been eradicated in most regions. Malaria cases have been reduced significantly since the campaign began.$$),
        'example', jsonb_build_object('statement', $$Report progress made against a disease in the last decade.$$, 'solution', $$The number of measles cases has been reduced by half over the past ten years.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Thousands of children ___ (already/vaccinate) against polio this year."$$, 'solution', $$Thousands of children have already been vaccinated against polio this year.$$)
      ),
      jsonb_build_object(
        'heading', $$Recommendation vs achievement$$,
        'body', $$A convincing health bulletin balances what still needs to be done with what has already been achieved -- two different passive structures for two different purposes.$$,
        'highlights', array[$$a recommendation$$, $$an achievement$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "should be + past participle" for a current recommendation about what ought to happen. Use "has/have been + past participle" for an achievement already accomplished, describing progress up to now.$$),
        'example', jsonb_build_object('statement', $$Combine a recommendation and an achievement about mosquito nets.$$, 'solution', $$Mosquito nets should be distributed to every household. Over ten thousand nets have already been distributed this year.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct structure: "Clean water sources ___ (should be protected/have been protected) to prevent future outbreaks."$$, 'solution', $$Clean water sources should be protected to prevent future outbreaks, because this is a current recommendation, not a completed achievement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your school health club's bulletin must give recommendations about an endemic disease and report progress already achieved in fighting it.$$,
      'questions', array[
        $$Give one recommendation using "should be + past participle".$$,
        $$Report one achievement using the present perfect passive.$$,
        $$Name one disease vector and explain how it spreads disease.$$,
        $$Suggest one action the community can still take.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "All suspected cases ___ (should/report) to the health centre immediately."$$,
      'hint', $$Should be + past participle for an official recommendation.$$,
      'expected', $$All suspected cases should be reported to the health centre immediately.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Over five thousand people ___ (already/vaccinate) in this region."$$,
      'hint', $$Present perfect passive: has/have been + past participle.$$,
      'expected', $$Over five thousand people have already been vaccinated in this region.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite as a recommendation: "People should treat stagnant water with insecticide."$$,
      'hint', $$Focus on the water, using "should be + past participle".$$,
      'expected', $$Stagnant water should be treated with insecticide.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "This disease ___ (successfully/eradicate) in several neighbouring countries."$$,
      'hint', $$Present perfect passive for a completed achievement.$$,
      'expected', $$This disease has been successfully eradicated in several neighbouring countries.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-maladies-endemiques';
