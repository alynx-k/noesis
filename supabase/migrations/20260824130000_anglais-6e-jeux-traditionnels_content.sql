-- FALLBACK CONTENT: this lesson ("Les jeux traditionnels", Unit 8, final
-- lesson of the official catalog sequence) does not exist as a distinct
-- real lesson on coll.ecole-ci.org (Collège Numérique) — the 6ème Anglais
-- course tree there stops at Unit 7 (Health and Environment). Written from
-- general knowledge of the standard Ivorian 6ème Anglais programme (MENA),
-- reusing structures already taught earlier in the unit sequence (simple
-- present, adverbs of frequency, "to be going to") applied to traditional
-- Ivorian games as a culturally relevant closing topic for the grade.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During a school cultural day at Collège Municipal Koro, 6ème students present traditional Ivorian games to their English-speaking pen pals.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: traditional games$$,
        'body', $$Awalé (a traditional board game), a rope, to skip rope, hide and seek, a marble, to play marbles, a team, to hide, to seek/find.$$,
        'highlights', array[$$awalé, rope, marbles, hide and seek$$, $$to skip rope, to play marbles, to hide, to seek$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the name of the traditional Ivorian board game played with seeds and pits?$$, 'solution', $$Awalé.$$)
      ),
      jsonb_build_object(
        'heading', $$Describing how to play a game$$,
        'body', $$To describe a game's rules, we use the simple present: "In awalé, players move seeds around the board." "One player hides while the others count and then seek." Sequence words help describe the steps: "First, one player hides. Then, the others count to twenty. Finally, they look for the hidden player."$$,
        'highlights', array[$$simple present for rules$$, $$first, then, finally — describing steps$$]::text[],
        'example', jsonb_build_object('statement', $$Describe the first step of hide and seek.$$, 'solution', $$"First, one player hides while the others close their eyes and count."$$),
        'fixation', jsonb_build_object('question', $$What do players use in the game of marbles?$$, 'solution', $$Marbles (small round balls, often glass).$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about game preferences and frequency$$,
        'body', $$To ask about preference: "What traditional game do you like?" — answer: "I like awalé." / "I like playing marbles." To ask about frequency: "How often do you play this game?" — answer: "I often play it with my friends after school."$$,
        'highlights', array[$$What traditional game do you like? → I like...$$, $$How often do you play...? → I often/sometimes/always play...$$]::text[],
        'example', jsonb_build_object('statement', $$Say you play hide and seek every weekend.$$, 'solution', $$"I always play hide and seek every weekend."$$),
        'fixation', jsonb_build_object('question', $$How do you ask a friend which traditional game they prefer?$$, 'solution', $$"What traditional game do you like?"$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For a school cultural day, you are asked to present a traditional Ivorian game to your English-speaking pen pal in a short paragraph.$$,
      'questions', array[
        $$Name the traditional game you are presenting.$$,
        $$Describe how to play it, step by step, using first, then, and finally.$$,
        $$Say how often you play it and with whom.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Name a traditional Ivorian board game played with seeds.$$,
      'hint', $$It's a two-player strategy game.$$,
      'expected', $$Awalé.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "In hide and seek, one player ______ (to hide) while the others count."$$,
      'hint', $$Third person singular takes -s.$$,
      'expected', $$"In hide and seek, one player hides while the others count."$$
    ),
    jsonb_build_object(
      'question', $$Write a sentence saying you sometimes play marbles with your friends.$$,
      'hint', $$Use the adverb "sometimes".$$,
      'expected', $$"I sometimes play marbles with my friends."$$
    ),
    jsonb_build_object(
      'question', $$Describe the first step of a game of hide and seek using "First,".$$,
      'hint', $$Think about what happens before anyone starts looking.$$,
      'expected', $$"First, one player hides while the others count to twenty."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-jeux-traditionnels';
