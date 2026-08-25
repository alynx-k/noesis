-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 8: Sports and Games — Lesson 1: The importance of
-- sports". Contenu réécrit à partir du PDF source ; vocabulaire, situations
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 5ème ont reçu un texte en anglais de leur correspondant libérien qui traite de l'importance du sport. Leur professeur leur demande de le lire pour en discuter en classe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: sports and games$$,
        'body', $$Sports: athletics, cycling, rugby, boxing, swimming, football. Games: draughtboard, cards, scrabble, video games, ludo, marbles.$$,
        'highlights', array[$$sports: athletics, cycling, rugby, boxing, swimming, football$$, $$games: draughtboard, cards, scrabble, video games, ludo, marbles$$]::text[],
        'fixation', jsonb_build_object('question', $$What sport involves hitting an opponent with gloved fists?$$, 'solution', $$Boxing.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing preferences$$,
        'body', $$To talk about a favourite sport or game: "Possessive adjective + favourite + sport/game is..." Example: "My favourite sport is football." "Konan's favourite game is ludo." "The boys' favourite sport is cycling."$$,
        'highlights', array[$$[possessive] favourite [sport/game] is...$$]::text[],
        'example', jsonb_build_object('statement', $$Ask and answer about "Aya / draughtboard".$$, 'solution', $$What's Aya's favourite game? — Aya's favourite game is draughtboard.$$),
        'fixation', jsonb_build_object('question', $$What's the teacher's favourite sport, knowing it's athletics?$$, 'solution', $$The teacher's favourite sport is athletics.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: the importance of sports$$,
        'body', $$Key words: team, wealthy (= rich), to keep fit (to be physically and mentally well), to socialize (to fraternize with people), weight, disease, healthy.$$,
        'highlights', array[$$team, wealthy, to keep fit, to socialize, weight, disease, healthy$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "to keep fit" mean?$$, 'solution', $$To be physically and mentally well.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing purpose$$,
        'body', $$To explain the purpose of an action, use "in order to + verb": "I play football in order to become wealthy." "People practise sports in order to control their weight and combat diseases."$$,
        'highlights', array[$$[action] + in order to + [verbe] (but)$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "Why do the students practise sports at school?" (to develop physically)$$, 'solution', $$The students practise sports at school in order to develop physically.$$),
        'fixation', jsonb_build_object('question', $$Answer: "Why do you practise cycling?" (to control your weight)$$, 'solution', $$I practise cycling in order to control my weight.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your Liberian friend shared a text on Facebook about the importance of sports and wants your opinion about sports in Côte d'Ivoire.$$,
      'questions', array[
        $$Name some sports people practise in Côte d'Ivoire.$$,
        $$Identify one person's favourite sport and say why they like it.$$,
        $$Give your opinion about the importance of practising sports.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Je joue au football pour rester en forme."$$,
      'hint', $$Use "in order to keep fit".$$,
      'expected', $$I play football in order to keep fit.$$
    ),
    jsonb_build_object(
      'question', $$What's the word for a board game played with black and white pieces?$$,
      'hint', $$Similar to checkers.$$,
      'expected', $$Draughtboard.$$
    ),
    jsonb_build_object(
      'question', $$What does "wealthy" mean?$$,
      'hint', $$Think of having a lot of money.$$,
      'expected', $$Rich.$$
    ),
    jsonb_build_object(
      'question', $$Ask what Aline's favourite sport is, knowing the answer is "handball".$$,
      'hint', $$Use the possessive structure.$$,
      'expected', $$What's Aline's favourite sport? — Aline's favourite sport is handball.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-importance-sport';
