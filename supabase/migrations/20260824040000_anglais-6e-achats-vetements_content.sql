-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_UNIT 5_CLOTHES AND COLOURS_Lesson 3_Listening (Buying
-- clothes)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During the Christmas holidays in Ghana, students from Lycée Jeunes Filles de Yopougon listen to a text in English about clothing and shoe prices to prepare Christmas shopping.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Numbers and vocabulary$$,
        'body', $$1,000 = one thousand; 2,000 = two thousand; 4,500 = four thousand, five hundred; 7,850 = seven thousand, eight hundred and fifty. "To sell" = to give an object and receive money. "To buy" = to give money and obtain an object.$$,
        'highlights', array[$$thousands: [number] thousand, [hundreds]$$, $$to sell ≠ to buy$$]::text[],
        'fixation', jsonb_build_object('question', $$Write 3,850 in letters.$$, 'solution', $$"Three thousand, eight hundred and fifty."$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about prices$$,
        'body', $$To ask the price of a single item: "How much is this [item]?" — answer: "It is [price] francs CFA." For plural items: "How much are these [items]?" — answer: "They are [price] francs CFA."$$,
        'highlights', array[$$How much is this...? → It is... francs CFA$$, $$How much are these...? → They are... francs CFA$$]::text[],
        'example', jsonb_build_object('statement', $$The dress costs 5,500 FCFA. Write the question and answer.$$, 'solution', $$"How much is the dress?" — "It is 5,500 FCFA."$$),
        'fixation', jsonb_build_object('question', $$How do you ask the price of shoes (plural)?$$, 'solution', $$"How much are the shoes?"$$)
      ),
      jsonb_build_object(
        'heading', $$Comparing clothes$$,
        'body', $$Adjectives: beautiful, big, small, long, short, nice, cheap, expensive. To compare with a short adjective, add "-er + than": "The shirt is cheaper than the jeans." With a long adjective, use "more + adjective + than": "The jeans are more expensive than the shirt."$$,
        'highlights', array[$$short adjective + er + than (cheap → cheaper)$$, $$more + long adjective + than (expensive → more expensive)$$]::text[],
        'example', jsonb_build_object('statement', $$Black trousers cost 5,000F, red trousers cost 3,000F. Compare them.$$, 'solution', $$"Black trousers are more expensive than red trousers."$$),
        'fixation', jsonb_build_object('question', $$Complete: "A dress is ______ than a skirt." (expensive)$$, 'solution', $$"A dress is more expensive than a skirt."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$To shop online on an American website, you and your friends listen to a recording in English about the prices of clothing items.$$,
      'questions', array[
        $$Identify the clothes mentioned.$$,
        $$Say whether the following statements are true or false: "The yellow trousers are 2,000 francs CFA"; "The black trousers are cheaper than the yellow trousers."$$,
        $$Compare the prices of two items using "cheaper than" or "more expensive than".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$How much is a shirt that costs 4500 FCFA? Write the full question and answer.$$,
      'hint', $$Use "How much is this shirt?"$$,
      'expected', $$"How much is this shirt?" — "It is 4500 FCFA."$$
    ),
    jsonb_build_object(
      'question', $$Unscramble: "siveexpen" to find an adjective$$,
      'hint', $$It means "costs a lot".$$,
      'expected', $$Expensive.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Trainers are ______ than sandals." (comfortable)$$,
      'hint', $$"Comfortable" is a long adjective — use "more".$$,
      'expected', $$"Trainers are more comfortable than sandals."$$
    ),
    jsonb_build_object(
      'question', $$A pair of jeans costs 12,000 FCFA and a skirt costs 6,000 FCFA. Compare them using "expensive".$$,
      'hint', $$Use "more expensive than".$$,
      'expected', $$"The jeans are more expensive than the skirt."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-achats-vetements';
