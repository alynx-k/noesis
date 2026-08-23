-- FALLBACK CONTENT: this lesson ("La CAN", Unit 8 in the official catalog
-- sequence) does not exist as a distinct real lesson on coll.ecole-ci.org
-- (Collège Numérique) — the 6ème Anglais course tree there stops at Unit 7
-- (Health and Environment). Written from general knowledge of the
-- standard Ivorian 6ème Anglais programme (MENA), reusing sport
-- vocabulary and structures (simple present, adverbs of frequency,
-- comparatives) already introduced earlier in the unit sequence, applied
-- to the AFCON (Africa Cup of Nations) as a culturally relevant topic for
-- Ivorian students.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During the AFCON (Africa Cup of Nations) season, 6ème students at the English Club talk about the competition, the teams, and their favourite players.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: the AFCON (CAN)$$,
        'body', $$The AFCON (Africa Cup of Nations), a team, a player, a match, a goal, to win, to lose, to draw, a supporter, a trophy, the Elephants (Côte d'Ivoire's national team nickname).$$,
        'highlights', array[$$team, player, match, goal$$, $$to win, to lose, to draw, supporter, trophy$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the nickname of Côte d'Ivoire's national football team?$$, 'solution', $$"The Elephants."$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about matches and results$$,
        'body', $$To ask about a result: "Who won the match?" — answer: "Côte d'Ivoire won the match." To say a team lost: "They lost the match." To say the score was equal: "The match ended in a draw." Example: "Côte d'Ivoire beat Senegal 2 to 1."$$,
        'highlights', array[$$Who won the match? → [Team] won the match$$, $$to win / to lose / to draw$$]::text[],
        'example', jsonb_build_object('statement', $$The Elephants scored 2 goals, the other team scored 1. Write the result.$$, 'solution', $$"The Elephants won the match 2 to 1."$$),
        'fixation', jsonb_build_object('question', $$How do you say both teams scored the same number of goals?$$, 'solution', $$"The match ended in a draw."$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing support and preference$$,
        'body', $$To say which team you support: "I support the Elephants." To ask: "Which team do you support?" To compare players or teams: "Player A is better than player B." "This team is stronger than that team."$$,
        'highlights', array[$$I support... / Which team do you support?$$, $$better than / stronger than (comparatives)$$]::text[],
        'example', jsonb_build_object('statement', $$Say which national team you support.$$, 'solution', $$"I support the Elephants of Côte d'Ivoire."$$),
        'fixation', jsonb_build_object('question', $$Complete: "Our team is ______ than their team." (strong)$$, 'solution', $$"Our team is stronger than their team."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the English Club's sports report, you are asked to describe an AFCON match you watched.$$,
      'questions', array[
        $$Name the two teams that played.$$,
        $$Say who won, lost, or if the match ended in a draw.$$,
        $$Say which team you support and why.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Côte d'Ivoire scored 3 goals, Ghana scored 3 goals. What was the result?$$,
      'hint', $$Equal scores mean a draw.$$,
      'expected', $$"The match ended in a draw."$$
    ),
    jsonb_build_object(
      'question', $$Write the question you ask to know who won a match.$$,
      'hint', $$Start with "Who".$$,
      'expected', $$"Who won the match?"$$
    ),
    jsonb_build_object(
      'question', $$What do we call a person who cheers for a team?$$,
      'hint', $$It starts with "sup-".$$,
      'expected', $$A supporter.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Côte d'Ivoire ______ Senegal 2 to 1." (choose: won, beat)$$,
      'hint', $$Both can work, but pick the one meaning "defeated".$$,
      'expected', $$"Côte d'Ivoire beat Senegal 2 to 1."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-can';
