-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 5: Clothes and Colours — Lesson 1: The market
-- place". Contenu réécrit à partir du PDF source ; vocabulaire, situations
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En visite au Ghana, un élève de 5ème se rend au marché avec son correspondant ghanéen pour acheter des vêtements. Ils écoutent un marchand vanter ses articles colorés afin de faire le meilleur choix.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: clothes$$,
        'body', $$Key words: a hat, a scarf, sandals, pyjamas, a shirt, shorts, trousers, socks, shoes, a skirt, a dress, wrapper.$$,
        'highlights', array[$$a hat, a scarf, sandals, pyjamas, a shirt, shorts, trousers, socks, shoes$$, $$a skirt, a dress, wrapper$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you wear on your feet to protect them, made of a sole and straps?$$, 'solution', $$Sandals.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: accessories$$,
        'body', $$Key words: earrings, a ring, a belt, a tie, a bracelet, a wallet.$$,
        'highlights', array[$$earrings, a ring, a belt, a tie, a bracelet, a wallet$$]::text[],
        'fixation', jsonb_build_object('question', $$What accessory do you wear around your waist to hold up your trousers?$$, 'solution', $$A belt.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking what people wear (Wh-questions)$$,
        'body', $$To ask what someone wears: "What do schoolboys wear at school? — They wear khaki uniform." / "What does Soro wear? — Soro wears a shirt, trousers, socks and shoes."$$,
        'highlights', array[$$What do/does [subject] wear? / [Subject] wear(s) + [clothes]$$]::text[],
        'example', jsonb_build_object('statement', $$Ask what Julia wears, knowing the answer is "a scarf, shorts and a shirt".$$, 'solution', $$What does Julia wear? — Julia wears a scarf, shorts and a shirt.$$),
        'fixation', jsonb_build_object('question', $$Reorder: "wearing / sisters / are / my / what?"$$, 'solution', $$What are my sisters wearing?$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing what people wear (Yes/No questions)$$,
        'body', $$To confirm what someone wears: "Do girls wear trousers to go to school? — No, they don't." / "Do boys wear khaki uniform to go to school? — Yes, they do."$$,
        'highlights', array[$$Do/Does [subject] wear...? / Yes, they do. / No, they don't.$$]::text[],
        'fixation', jsonb_build_object('question', $$Answer: "Do schoolboys wear a white blouse and a stethoscope?"$$, 'solution', $$No, they don't. They wear khaki uniform.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$During his stay in Ghana, a student goes to the market to buy some clothes before going back home. He listens to a trader promoting his articles.$$,
      'questions', array[
        $$List the different clothes the trader is selling.$$,
        $$Name the clothes you want to buy, using "I would like to buy...".$$,
        $$Describe what you usually wear to go to school.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Que portent les élèves à l'école ? — Ils portent l'uniforme kaki."$$,
      'hint', $$Use "What do... wear?"$$,
      'expected', $$What do schoolboys wear at school? — They wear khaki uniform.$$
    ),
    jsonb_build_object(
      'question', $$What's the name of the piece of clothing worn to cover the head?$$,
      'hint', $$It has a brim.$$,
      'expected', $$A hat.$$
    ),
    jsonb_build_object(
      'question', $$Answer: "Do you wear pyjamas at school?"$$,
      'hint', $$Pyjamas are for sleeping.$$,
      'expected', $$No, I don't. I wear pyjamas at night/at home.$$
    ),
    jsonb_build_object(
      'question', $$What jewellery do you wear on your ears?$$,
      'hint', $$Small accessories, usually worn in pairs.$$,
      'expected', $$Earrings.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-vetements';
