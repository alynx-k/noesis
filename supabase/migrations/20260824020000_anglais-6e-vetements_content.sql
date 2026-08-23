-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_UNIT 5_CLOTHES AND COLOURS_Lesson 1_Listening (Clothes)".
-- Contenu réécrit à partir du PDF source (Learn it, do it 6è, programme
-- officiel MENA) ; situation d'apprentissage, vocabulaire, dialogues et
-- exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Back from the Easter holidays, 6ème students meet in the schoolyard and chat, describing the clothes they wore.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: clothes$$,
        'body', $$A blouse, a dress, a tie, a skirt, a suit, a shirt, a wrapper, a cap.$$,
        'highlights', array[$$blouse, dress, tie, skirt$$, $$suit, shirt, wrapper, cap$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the traditional piece of cloth called that women wrap around themselves?$$, 'solution', $$A wrapper.$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about what people are wearing$$,
        'body', $$To ask about someone's clothes, we say "What is [name] wearing?" — answer: "He/She is wearing a [clothing item]." Example: "What is Carla wearing?" → "She is wearing a dress."$$,
        'highlights', array[$$What is [name] wearing? → He/She is wearing a...$$]::text[],
        'example', jsonb_build_object('statement', $$Zady is wearing jeans. Write the question this answers.$$, 'solution', $$"What is Zady wearing?"$$),
        'fixation', jsonb_build_object('question', $$How do you ask what a group of children is wearing?$$, 'solution', $$"What are the children wearing?"$$)
      ),
      jsonb_build_object(
        'heading', $$More vocabulary and yes/no questions$$,
        'body', $$Trousers, socks, jeans, sunglasses, shorts, a pair of shoes, earrings, panties. To confirm or deny what someone is wearing, we ask "Is [name] wearing [item]?" — answers: "Yes, he/she is." or "No, he/she isn't. He/She is wearing [correct item]."$$,
        'highlights', array[$$trousers, socks, jeans, sunglasses, shorts, pair of shoes, earrings$$, $$Is X wearing...? → Yes, X is. / No, X isn't, X is wearing...$$]::text[],
        'example', jsonb_build_object('statement', $$Is Mr John wearing jeans? (He is actually wearing a suit.)$$, 'solution', $$"No, he isn't. He is wearing a suit."$$),
        'fixation', jsonb_build_object('question', $$Is Miss Fatou wearing glasses? (yes)$$, 'solution', $$"Yes, she is."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your Ghanaian friend sends you an audio recording of his sister's baptism ceremony. As you listen, you note what each family member is wearing: your father a suit and glasses, your mother a wrapper, your sister Jenny a skirt, and your friends caps and sunglasses.$$,
      'questions', array[
        $$What is your father wearing?$$,
        $$What is your mother wearing?$$,
        $$What are your friends wearing?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Write a correct sentence using: wrapper – Mummy – wearing – a nice – is$$,
      'hint', $$Subject + is wearing + adjective + noun.$$,
      'expected', $$"Mummy is wearing a nice wrapper."$$
    ),
    jsonb_build_object(
      'question', $$Reorder the letters: "t-s-r-h-o" (a clothing item)$$,
      'hint', $$It's shorter than trousers.$$,
      'expected', $$Shorts.$$
    ),
    jsonb_build_object(
      'question', $$Write the question for: "No, he isn't. He's wearing trousers."$$,
      'hint', $$Ask about a specific piece of clothing.$$,
      'expected', $$"Is he wearing jeans?"$$
    ),
    jsonb_build_object(
      'question', $$The teachers are wearing suits. Write a correct sentence using: The teachers – suits – wearing – are$$,
      'hint', $$Plural subject takes "are".$$,
      'expected', $$"The teachers are wearing suits."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-vetements';
