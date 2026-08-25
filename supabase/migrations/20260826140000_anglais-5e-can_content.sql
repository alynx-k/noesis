-- Contenu de secours (fallback) : le PDF source correspondant à cette
-- leçon n'a pas pu être retrouvé sur coll.ecole-ci.org (lien indisponible).
-- Contenu rédigé à partir du programme éducatif officiel DPFC de 5ème
-- (Anglais, compétence "The CAN"), dans le registre de la leçon voisine
-- "The importance of sports" déjà disponible sur la plateforme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La Côte d'Ivoire a accueilli la Coupe d'Afrique des Nations (CAN) de football. Les élèves de 5ème échangent avec leur correspondant anglophone sur cet évènement sportif.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: the CAN (Africa Cup of Nations)$$,
        'body', $$Key words: a competition, a stadium, a supporter, a national team, a match, a goal, a trophy, to win ≠ to lose, a champion.$$,
        'highlights', array[$$a competition, a stadium, a supporter, a national team$$, $$a match, a goal, a trophy, a champion$$, $$to win ≠ to lose$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call the prize a winning team receives?$$, 'solution', $$A trophy.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Talking about a sporting event$$,
        'body', $$To talk about a match result: "Côte d'Ivoire won the match 2 to 1." "Who won the CAN in 2023? — Côte d'Ivoire won it." To express excitement: "It was a great match!"$$,
        'highlights', array[$$[team] won/lost the match [score]$$, $$Who won...? / [Team] won it.$$]::text[],
        'example', jsonb_build_object('statement', $$Say that the Elephants (Côte d'Ivoire's team) won the final.$$, 'solution', $$The Elephants won the final.$$),
        'fixation', jsonb_build_object('question', $$What do you call a person who supports a football team?$$, 'solution', $$A supporter.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing feelings about the CAN$$,
        'body', $$To express your feelings: "I was very happy when Côte d'Ivoire won the CAN." "The supporters were proud of their national team."$$,
        'highlights', array[$$I was happy/proud when...$$]::text[],
        'fixation', jsonb_build_object('question', $$Express how you felt when your national team scored a goal.$$, 'solution', $$I was very happy when our team scored a goal.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton correspondant anglophone te demande de lui raconter la CAN organisée en Côte d'Ivoire.$$,
      'questions', array[
        $$Dis dans quel pays et quand la CAN a eu lieu.$$,
        $$Raconte comment s'est terminée la finale (score, vainqueur).$$,
        $$Exprime ce que tu as ressenti pendant la compétition.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "L'équipe nationale a gagné le match 2 à 0."$$,
      'hint', $$Use "won the match".$$,
      'expected', $$The national team won the match 2 to 0.$$
    ),
    jsonb_build_object(
      'question', $$What's the opposite of "to win"?$$,
      'hint', $$It's what happens to the losing team.$$,
      'expected', $$To lose.$$
    ),
    jsonb_build_object(
      'question', $$What do you call the place where football matches are played?$$,
      'hint', $$It's a large sports venue.$$,
      'expected', $$A stadium.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Les supporters étaient fiers de leur équipe."$$,
      'hint', $$Use "proud of".$$,
      'expected', $$The supporters were proud of their team.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-can';
