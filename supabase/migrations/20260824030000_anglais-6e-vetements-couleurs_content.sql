-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 5_CLOTHES AND COLOURS_Lesson 2_Listening (Clothes and
-- colours)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During their stay in Accra, English Club students from CM Koro listen to a shop assistant present the different colours of clothes in a clothing store, to help them make a choice.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: colours$$,
        'body', $$White, red, black, yellow, blue, green, pink.$$,
        'highlights', array[$$white, red, black, yellow$$, $$blue, green, pink$$]::text[],
        'fixation', jsonb_build_object('question', $$What colour do you get by mixing red and white?$$, 'solution', $$Pink.$$)
      ),
      jsonb_build_object(
        'heading', $$Asking and giving a colour$$,
        'body', $$For a single item, we ask "What colour is this [item]?" — answer: "It is [colour]." For plural items, we ask "What colour are these [items]?" — answer: "They are [colour]." Example: "What colour is this shirt?" → "It is blue." "What colour are these shoes?" → "They are red."$$,
        'highlights', array[$$What colour is...? → It is... (singular)$$, $$What colour are...? → They are... (plural)$$]::text[],
        'example', jsonb_build_object('statement', $$Awa's skirt is blue. Write the question this answers.$$, 'solution', $$"What colour is Awa's skirt?"$$),
        'fixation', jsonb_build_object('question', $$How do you ask about the colour of your brother's shorts?$$, 'solution', $$"What colour are your brother's shorts?"$$)
      ),
      jsonb_build_object(
        'heading', $$More colours and expressing likes/dislikes$$,
        'body', $$More colours: orange, grey, purple, brown, khaki. To ask about preferences: "What colour do you like?" → "I like orange." "What colour does Aya like?" → "She likes purple." "What colour do they like?" → "They like khaki."$$,
        'highlights', array[$$orange, grey, purple, brown, khaki$$, $$What colour do/does...like? → I/He/She/They like(s)...$$]::text[],
        'example', jsonb_build_object('statement', $$Koffi likes black. Write the question this answers.$$, 'solution', $$"What colour does Koffi like?"$$),
        'fixation', jsonb_build_object('question', $$How do you say you dislike a colour, e.g. brown?$$, 'solution', $$"I don't like brown."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$While shopping for a shirt during a stay in Ghana, you enter a clothing store and see shirts of different colours. As the Ghanaian shop assistant presents them to you:$$,
      'questions', array[
        $$Give the colours of the different shirts.$$,
        $$Say which colours you like and which you don't like.$$,
        $$Present your work to the class.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Write a correct sentence using: skirt – is – sister's – my – blue$$,
      'hint', $$Possessive noun + is + colour.$$,
      'expected', $$"My sister's skirt is blue."$$
    ),
    jsonb_build_object(
      'question', $$Unscramble: "h.a.k.i.k" to find a colour$$,
      'hint', $$It's a shade of olive/brown often used for uniforms.$$,
      'expected', $$Khaki.$$
    ),
    jsonb_build_object(
      'question', $$John likes purple and brown. Write the question this answers.$$,
      'hint', $$Use "does" for a singular subject.$$,
      'expected', $$"What colour does John like?"$$
    ),
    jsonb_build_object(
      'question', $$Write a correct question using: are – what – shorts – colour – your?$$,
      'hint', $$"Shorts" is treated as plural.$$,
      'expected', $$"What colour are your shorts?"$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-vetements-couleurs';
