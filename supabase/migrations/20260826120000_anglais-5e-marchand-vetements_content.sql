-- Contenu de secours (fallback) : le PDF source de la Leçon 3 de l'unité
-- "Clothes and Colours" (5e) n'a pas pu être retrouvé sur coll.ecole-ci.org
-- (lien indisponible). Contenu rédigé à partir du programme éducatif
-- officiel DPFC de 5ème, dans le registre des Leçons 1 et 2 de la même
-- unité déjà disponibles sur la plateforme (vêtements, couleurs).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 5ème accompagne sa mère au marché pour acheter de nouveaux vêtements avant la rentrée. Il doit échanger avec le marchand pour choisir et négocier ses articles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: at the clothes shop$$,
        'body', $$Key words: a customer, a seller/trader, a price, cheap ≠ expensive, size (small, medium, large), to try on, to fit.$$,
        'highlights', array[$$a customer, a seller, a price$$, $$cheap ≠ expensive$$, $$size, to try on, to fit$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the opposite of "cheap"?$$, 'solution', $$Expensive.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking the price$$,
        'body', $$To ask how much something costs: "How much is this shirt? — It's 2000 francs." / "How much are these shoes? — They are 5000 francs."$$,
        'highlights', array[$$How much is/are...? / It's.../They are...$$]::text[],
        'example', jsonb_build_object('statement', $$Ask the price of a skirt that costs 3000 francs.$$, 'solution', $$How much is this skirt? — It's 3000 francs.$$),
        'fixation', jsonb_build_object('question', $$Complete: "___ are these trousers? — They are 4000 francs." (How much)$$, 'solution', $$How much.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Buying clothes$$,
        'body', $$Useful expressions: "Can I try this dress on, please?" "Do you have a smaller/bigger size?" "I'll take it." / "It's too expensive, can you reduce the price?"$$,
        'highlights', array[$$Can I try...on? / Do you have a smaller/bigger size?$$, $$I'll take it. / Can you reduce the price?$$]::text[],
        'fixation', jsonb_build_object('question', $$Ask the seller to try on a hat.$$, 'solution', $$Can I try this hat on, please?$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu accompagnes ta mère au marché pour acheter des vêtements pour la rentrée scolaire.$$,
      'questions', array[
        $$Cite trois vêtements que tu voudrais acheter.$$,
        $$Écris un court dialogue avec le marchand pour demander le prix et négocier.$$,
        $$Dis si le vêtement te va bien en utilisant "to fit".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Combien coûte cette chemise ?"$$,
      'hint', $$Use "How much is...?"$$,
      'expected', $$How much is this shirt?$$
    ),
    jsonb_build_object(
      'question', $$What word means "not expensive"?$$,
      'hint', $$Think of a low price.$$,
      'expected', $$Cheap.$$
    ),
    jsonb_build_object(
      'question', $$Ask a seller if you can try on a dress.$$,
      'hint', $$Use "Can I try...on?"$$,
      'expected', $$Can I try this dress on, please?$$
    ),
    jsonb_build_object(
      'question', $$What do you say when you decide to buy an item?$$,
      'hint', $$A short expression of decision.$$,
      'expected', $$I'll take it.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-marchand-vetements';
