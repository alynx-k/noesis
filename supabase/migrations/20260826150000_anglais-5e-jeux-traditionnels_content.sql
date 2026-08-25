-- Contenu de secours (fallback) : le PDF source correspondant à cette
-- leçon n'a pas pu être retrouvé sur coll.ecole-ci.org (lien indisponible).
-- Contenu rédigé à partir du programme éducatif officiel DPFC de 5ème
-- (Anglais, compétence "Traditional games"), dans le registre de la leçon
-- voisine "The importance of sports" déjà disponible sur la plateforme
-- (mêmes jeux : ludo, draughtboard, marbles, cards).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant la récréation, des élèves de 5ème jouent à des jeux traditionnels ivoiriens. Leur correspondant anglophone leur demande de les lui décrire en anglais.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: traditional games$$,
        'body', $$Key words: marbles, ludo, draughtboard, hide-and-seek, a skipping rope, a top (a spinning toy), awalé (a traditional board game), to play, a player, a game.$$,
        'highlights', array[$$marbles, ludo, draughtboard, hide-and-seek$$, $$a skipping rope, a top, awalé$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the English name for the game where children hide and one seeks them?$$, 'solution', $$Hide-and-seek.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Describing how to play a game$$,
        'body', $$To explain the rules of a game, use the imperative with sequence words: "First, hide the seeds in the holes. Then, take turns to move them." Also: "You need two players to play awalé."$$,
        'highlights', array[$$First, .../ Then, ... (règles d'un jeu)$$, $$You need [nombre] players to play [jeu]$$]::text[],
        'example', jsonb_build_object('statement', $$Explain that you need two players for draughtboard.$$, 'solution', $$You need two players to play draughtboard.$$),
        'fixation', jsonb_build_object('question', $$What do children use to play marbles?$$, 'solution', $$Small round balls called marbles.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing preferences about games$$,
        'body', $$To say which traditional game you prefer: "My favourite traditional game is marbles." / "I prefer awalé to ludo because it needs more strategy."$$,
        'highlights', array[$$My favourite traditional game is...$$, $$I prefer [jeu A] to [jeu B] because...$$]::text[],
        'fixation', jsonb_build_object('question', $$Say you prefer hide-and-seek to marbles.$$, 'solution', $$I prefer hide-and-seek to marbles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton correspondant anglophone veut savoir comment les enfants ivoiriens s'amusent pendant la récréation.$$,
      'questions', array[
        $$Cite trois jeux traditionnels que tu connais.$$,
        $$Explique brièvement les règles de ton jeu traditionnel préféré.$$,
        $$Dis pourquoi tu préfères ce jeu à un autre.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Mon jeu traditionnel préféré est les billes."$$,
      'hint', $$Use "My favourite traditional game is...".$$,
      'expected', $$My favourite traditional game is marbles.$$
    ),
    jsonb_build_object(
      'question', $$What game involves hiding and being found by another player?$$,
      'hint', $$Two-word English name.$$,
      'expected', $$Hide-and-seek.$$
    ),
    jsonb_build_object(
      'question', $$How many players do you need to play awalé?$$,
      'hint', $$It's played face-to-face.$$,
      'expected', $$Two players.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Je préfère les dames à la marelle."$$,
      'hint', $$Use "I prefer... to...".$$,
      'expected', $$I prefer draughtboard to hopscotch.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-jeux-traditionnels';
