-- Contenu de secours (fallback) : aucun PDF source spécifiquement consacré
-- aux fruits et légumes n'a pu être retrouvé dans l'unité "Food and Drinks"
-- (5e) sur coll.ecole-ci.org (lien indisponible). Contenu rédigé à partir
-- du programme éducatif officiel DPFC de 5ème, dans le registre des autres
-- leçons de la même unité déjà disponibles sur la plateforme (menu,
-- diète et santé, recettes de cuisine).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au marché de son quartier, un élève de 5ème aide sa mère à choisir des fruits et légumes frais pour préparer les repas de la semaine.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: fruit$$,
        'body', $$Key words: a mango, a banana, a pineapple, an orange, a papaya, an avocado, a coconut, a lemon.$$,
        'highlights', array[$$a mango, a banana, a pineapple, an orange$$, $$a papaya, an avocado, a coconut, a lemon$$]::text[],
        'fixation', jsonb_build_object('question', $$What fruit is green outside and has a big seed inside, often eaten with fish?$$, 'solution', $$An avocado.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: vegetables$$,
        'body', $$Key words: a tomato, an onion, a carrot, a cabbage, a pepper, a potato, an eggplant (aubergine), okra.$$,
        'highlights', array[$$a tomato, an onion, a carrot, a cabbage$$, $$a pepper, a potato, an eggplant, okra$$]::text[],
        'fixation', jsonb_build_object('question', $$What vegetable makes you cry when you cut it?$$, 'solution', $$An onion.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Buying fruit and vegetables$$,
        'body', $$Useful expressions at the market: "How much are the tomatoes? — They are 500 francs a kilo." "I would like three mangoes and two onions, please."$$,
        'highlights', array[$$How much are the...? / They are... a kilo.$$, $$I would like + [quantité] + [fruit/légume]$$]::text[],
        'example', jsonb_build_object('statement', $$Ask the price of pineapples, knowing they cost 1000 francs each.$$, 'solution', $$How much are the pineapples? — They are 1000 francs each.$$),
        'fixation', jsonb_build_object('question', $$Ask for two carrots and one cabbage at the market.$$, 'solution', $$I would like two carrots and one cabbage, please.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ta mère t'envoie au marché acheter des fruits et légumes pour préparer le repas du soir.$$,
      'questions', array[
        $$Cite trois fruits et trois légumes que tu vas acheter.$$,
        $$Écris un court dialogue avec le vendeur pour demander les prix.$$,
        $$Dis quel est ton fruit préféré et pourquoi.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Combien coûtent les oranges ?"$$,
      'hint', $$Use "How much are...?"$$,
      'expected', $$How much are the oranges?$$
    ),
    jsonb_build_object(
      'question', $$What vegetable is round, red and used in sauces?$$,
      'hint', $$It's a key base ingredient of many Ivorian sauces.$$,
      'expected', $$A tomato.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Je voudrais deux ananas, s'il vous plaît."$$,
      'hint', $$Use "I would like...".$$,
      'expected', $$I would like two pineapples, please.$$
    ),
    jsonb_build_object(
      'question', $$What fruit grows in a bunch and is yellow when ripe?$$,
      'hint', $$Monkeys love it.$$,
      'expected', $$A banana.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-fruits-legumes';
