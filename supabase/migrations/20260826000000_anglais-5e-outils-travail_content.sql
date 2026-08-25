-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 4: Jobs and Occupations — Lesson 2: What do you
-- use a map for?". Contenu réécrit à partir du PDF source ; vocabulaire,
-- situations et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En préparation de la Journée des Métiers organisée par l'Ambassade des États-Unis, les élèves de 5ème apprennent le vocabulaire des outils de travail.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: work tools$$,
        'body', $$Key words: map, plan, scales, cash register, trolley, tray, anti-virus software, sponge, shearer, plunger, floor cloth, dental chair, law book. Each tool is linked to a use: a map is used to locate a country or a city; scales are used to measure the weight of fruit and vegetables; a cash register is used to collect money and calculate the change.$$,
        'highlights', array[$$map, plan, scales, cash register, trolley, tray$$, $$sponge, shearer, plunger, floor cloth, dental chair, law book$$]::text[],
        'fixation', jsonb_build_object('question', $$What tool does a greengrocer use to weigh fruit and vegetables?$$, 'solution', $$Scales.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Talking about the use of tools$$,
        'body', $$To ask about a tool's use: "What does a waitress do with a tray? / What is a tray used for? — She uses it for serving food." Structure: "[subject] uses [tool] for + verb-ing" or "to + base verb".$$,
        'highlights', array[$$What is [tool] used for? / [Subject] uses it for + verb-ing$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "What does a cashier use the cash register for?"$$, 'solution', $$He uses it to collect money and calculate the change.$$),
        'fixation', jsonb_build_object('question', $$Ask what an architect uses a plan for, knowing the answer is "to build houses".$$, 'solution', $$What does an architect use a plan for? — He uses it to build houses.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing possession (whose / 's)$$,
        'body', $$To ask who owns a tool: "Whose tool is the shearer? — It's the barber's tool." This uses "whose" for the question and the possessive "'s" for the answer.$$,
        'highlights', array[$$Whose [tool] is this? / It's the [job]'s tool.$$]::text[],
        'fixation', jsonb_build_object('question', $$Whose tool is the law book?$$, 'solution', $$It's the lawyer's tool.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You want to send a WhatsApp message to your Liberian friend Weah telling him about the job you want to do.$$,
      'questions', array[
        $$Name the job you want to do.$$,
        $$Name the tools required for that job.$$,
        $$Say what each tool is used for.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What tool does a computer scientist use to protect computers?$$,
      'hint', $$Think of protection against viruses.$$,
      'expected', $$Anti-virus software.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "À quoi sert un chariot ? — On l'utilise pour transporter les articles au supermarché."$$,
      'hint', $$Use "What is [tool] used for?"$$,
      'expected', $$What is a trolley used for? — It's used to transport things in the supermarket.$$
    ),
    jsonb_build_object(
      'question', $$What tool does a plumber use to repair water pipes?$$,
      'hint', $$It's used to unclog pipes.$$,
      'expected', $$A plunger.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "___ tool is the floor cloth? — It's the housemaid's tool."$$,
      'hint', $$Question word for possession.$$,
      'expected', $$Whose.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-outils-travail';
