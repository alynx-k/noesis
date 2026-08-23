-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 6_FOOD AND DRINKS_Lesson 2_Listening (Fruits and
-- vegetables)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$After their brilliant win at an inter-club contest organized by the British Embassy in Côte d'Ivoire, 6ème students from Collège Moderne Alassane Ouattara de Ouaninou are invited to a reception. The master of ceremony presents the day's menu in English so they can choose their starter and dessert.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: fruits$$,
        'body', $$Orange, coconut, guava, apple, papaya, pineapple, mango, banana, avocado, lemon.$$,
        'highlights', array[$$orange, coconut, guava, apple, papaya$$, $$pineapple, mango, banana, avocado, lemon$$]::text[],
        'fixation', jsonb_build_object('question', $$Name a fruit with a hard hairy shell and white flesh inside.$$, 'solution', $$Coconut.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparing with short and long adjectives$$,
        'body', $$A mango costs 100 CFA, an orange costs 75 CFA — both are cheap, but to compare we say "An orange is cheaper than a mango" (short adjective: adjective + er + than). For long adjectives like "delicious" (more than two syllables), we say "A banana is more delicious than a papaya" (more + adjective + than).$$,
        'highlights', array[$$short adjective (1 syllable) + er + than$$, $$more + long adjective (2+ syllables) + than$$]::text[],
        'example', jsonb_build_object('statement', $$Compare guava and orange using "juicy" (short adjective).$$, 'solution', $$"Guava is juicier than orange."$$),
        'fixation', jsonb_build_object('question', $$Complete: "A pineapple is ______ than a papaya." (delicious)$$, 'solution', $$"A pineapple is more delicious than a papaya."$$)
      ),
      jsonb_build_object(
        'heading', $$Vegetables and expressing quantities$$,
        'body', $$Vocabulary: aubergine, cabbage, carrot, beans, okra, lettuce, onion, pepper, tomato, eggplant. To ask about quantity: "Are there any tomatoes in the basin?" — answers: "Yes, there are some tomatoes" (a few), "there are a lot of tomatoes" or "there are many tomatoes" (a large amount). Note: "many" is not used with uncountable nouns — we say "a lot of water", not "many water".$$,
        'highlights', array[$$aubergine, cabbage, carrot, beans, okra, lettuce, onion, tomato$$, $$some/any (questions/negatives) ; a lot of / many (large quantity, countable only)$$]::text[],
        'example', jsonb_build_object('statement', $$There is no fish left, but there is meat. Complete: "There's ______ meat, but ______ fish left."$$, 'solution', $$"There's some meat, but no fish left."$$),
        'fixation', jsonb_build_object('question', $$Why can't we say "many water"?$$, 'solution', $$Because "water" is an uncountable noun — use "a lot of water" instead.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Before visiting Ghana, 6ème students at Collège Municipal de Koro call their Ghanaian pen pal, who gives them a shopping list of fruits and vegetables that are rare on the Ghanaian market — including avocados, oranges, and pineapples.$$,
      'questions', array[
        $$Complete a table of the fruits and vegetables mentioned.$$,
        $$Say whether these statements are true or false: "Avocados are vegetables"; "Avocados are cheaper in Côte d'Ivoire than in Ghana."$$,
        $$Write a short dialogue asking a friend to buy fruit for you because it is expensive where you live.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Unscramble the letters to find a fruit: "a-n-a-n-b-a"$$,
      'hint', $$It's yellow and curved.$$,
      'expected', $$Banana.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "An orange is ______ than a lemon." (big)$$,
      'hint', $$"Big" is a short adjective.$$,
      'expected', $$"An orange is bigger than a lemon."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Guavas are ______ than mangoes." (expensive)$$,
      'hint', $$"Expensive" is a long adjective.$$,
      'expected', $$"Guavas are more expensive than mangoes."$$
    ),
    jsonb_build_object(
      'question', $$Is there any cabbage in the fridge? (there is none)$$,
      'hint', $$Use "no" in the answer.$$,
      'expected', $$"No, there isn't any cabbage." / "There's no cabbage."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-fruits-legumes';
