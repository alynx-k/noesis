-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 7
-- LESSON 3: HIV-free generation" PDF (question tags, giving advice with
-- imperative/must/mustn't), but every sentence, name, and exercise is an
-- original rewrite, kept factual and prevention-focused as in the source
-- health-education material.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A public health NGO visits your school for HIV/AIDS Awareness Week. Before their talk, your English Club prepares questions and prevention messages in English so you can take an active part in the discussion.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: HIV and AIDS$$,
        'body', $$To understand and discuss HIV/AIDS prevention clearly, you need to know the basic medical vocabulary used to talk about the virus and how it spreads.$$,
        'highlights', array[$$HIV$$, $$AIDS$$, $$to contract$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$HIV$$, $$Human Immunodeficiency Virus, the virus that causes AIDS$$),
            jsonb_build_array($$AIDS$$, $$Acquired Immune Deficiency Syndrome, a serious illness caused by HIV$$),
            jsonb_build_array($$to contract (a disease)$$, $$to catch or become infected with a disease$$),
            jsonb_build_array($$a blood test$$, $$a medical examination of a person's blood$$),
            jsonb_build_array($$blood transfusion$$, $$the medical process of giving one person's blood to another$$),
            jsonb_build_array($$unprotected contact$$, $$contact without using any protective measure$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Question tags check information or express an opinion, adding a short question at the end of a statement. A positive statement takes a negative tag, and a negative statement takes a positive tag: HIV is dangerous, isn't it? You can't cure it easily, can you?$$),
        'example', jsonb_build_object('statement', $$Add the correct question tag: "A blood test can detect HIV, ___?"$$, 'solution', $$A blood test can detect HIV, can't it? Yes, it can.$$),
        'fixation', jsonb_build_object('question', $$Add the correct question tag: "AIDS isn't curable yet, ___?"$$, 'solution', $$AIDS isn't curable yet, is it? No, it isn't.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: prevention$$,
        'body', $$Preventing HIV/AIDS relies on specific words describing safe behaviour and the symptoms that a doctor should be told about.$$,
        'highlights', array[$$a condom$$, $$fidelity$$, $$constant fever$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$abstinence$$, $$choosing not to have sex, especially before marriage$$),
            jsonb_build_array($$fidelity$$, $$staying faithful to a single partner$$),
            jsonb_build_array($$a condom$$, $$a protective covering used during sex to prevent disease or pregnancy$$),
            jsonb_build_array($$constant fever$$, $$having a raised temperature all the time$$),
            jsonb_build_array($$to lose weight$$, $$to become thinner$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To give strong health advice, use the imperative, "must + base verb" for a recommendation, or "mustn't + base verb" for a warning: Use protection. You must get tested regularly. You mustn't share needles.$$),
        'example', jsonb_build_object('statement', $$Give a piece of prevention advice using "must" and one using "mustn't".$$, 'solution', $$You must get tested if you think you are at risk. You mustn't share razors or needles with anyone.$$),
        'fixation', jsonb_build_object('question', $$Rewrite as advice using the imperative: "You should always use protection during sexual intercourse."$$, 'solution', $$Always use protection during sexual intercourse.$$)
      ),
      jsonb_build_object(
        'heading', $$Question tags: getting the pattern right$$,
        'body', $$The trickiest part of question tags is matching the right auxiliary verb and making sure positive and negative always switch.$$,
        'highlights', array[$$a positive statement$$, $$a negative tag$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Match the tag's auxiliary to the main verb's tense: "is/isn't" for "is", "can/can't" for "can", "do/don't" for a present simple main verb. Remember: a positive statement always takes a negative tag, and a negative statement always takes a positive tag.$$),
        'example', jsonb_build_object('statement', $$Add the correct tag: "People get tested to know their status, ___?"$$, 'solution', $$People get tested to know their status, don't they? Yes, they do.$$),
        'fixation', jsonb_build_object('question', $$Add the correct tag: "She doesn't know her HIV status yet, ___?"$$, 'solution', $$She doesn't know her HIV status yet, does she? No, she doesn't.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is helping a public health NGO present HIV/AIDS prevention messages during Awareness Week at school.$$,
      'questions', array[
        $$Explain, using vocabulary from this lesson, one way HIV can be transmitted.$$,
        $$Give two pieces of prevention advice, using "must" or the imperative.$$,
        $$Ask a classmate a question about HIV using a question tag.$$,
        $$Explain why regular testing is important, using "mustn't" for one risky behaviour to avoid.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Add the correct question tag: "Condoms help prevent HIV, ___?"$$,
      'hint', $$Positive statement takes a negative tag; the main verb is "help" (present simple).$$,
      'expected', $$Condoms help prevent HIV, don't they? Yes, they do.$$
    ),
    jsonb_build_object(
      'question', $$Add the correct question tag: "You can't catch HIV from a handshake, ___?"$$,
      'hint', $$Negative statement takes a positive tag.$$,
      'expected', $$You can't catch HIV from a handshake, can you? No, you can't.$$
    ),
    jsonb_build_object(
      'question', $$Give advice using "must": (get tested regularly)$$,
      'hint', $$You must + base verb.$$,
      'expected', $$You must get tested regularly.$$
    ),
    jsonb_build_object(
      'question', $$Give advice using "mustn't": (share needles with anyone)$$,
      'hint', $$You mustn't + base verb.$$,
      'expected', $$You mustn't share needles with anyone.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-vih-sida';
