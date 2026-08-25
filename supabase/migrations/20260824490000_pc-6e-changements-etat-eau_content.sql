-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 8 : Les changements d'état de l'eau" (id 2088). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$De retour de l'école, une élève de 6ème aide sa mère à cuisiner. En ouvrant la marmite placée sur le feu, elle observe des gouttelettes d'eau sur le couvercle et un brouillard qui s'en dégage. Avec ses camarades et leur professeur, ils décident d'étudier la fusion, la solidification, la vaporisation, la condensation, et le cycle de l'eau.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Solidification et fusion de l'eau$$,
        'body', $$La solidification de l'eau est le passage de l'état liquide à l'état solide (glace) ; elle se fait à 0°C, température qui reste constante pendant toute la durée du changement d'état. La fusion est le passage inverse, de l'état solide à l'état liquide ; elle se fait aussi à 0°C, avec une température constante tant que toute la glace n'a pas fondu. Lors de la fusion, le volume de l'eau diminue (la glace est plus volumineuse que l'eau liquide correspondante) ; lors de la solidification, le volume augmente. Dans les deux cas, la masse de l'eau ne varie pas.$$,
        'highlights', array[$$solidification (liquide→solide) et fusion (solide→liquide) : toutes deux à 0°C, température constante$$, $$fusion : volume diminue ; solidification : volume augmente ; masse toujours constante$$]::text[],
        'fixation', jsonb_build_object('question', $$À quelle température se produisent la fusion et la solidification de l'eau ?$$, 'solution', $$À 0°C.$$)
      ),
      jsonb_build_object(
        'heading', $$Vaporisation et condensation$$,
        'body', $$La vaporisation est le passage de l'état liquide à l'état gazeux ; elle se fait par ébullition à 100°C, ou par évaporation à température ambiante. La condensation (ou liquéfaction) est le passage inverse, de l'état gazeux à l'état liquide — c'est ce qui forme les gouttelettes d'eau sur un couvercle froid au-dessus d'une marmite bouillante.$$,
        'highlights', array[$$vaporisation (liquide→gaz) : ébullition (100°C) ou évaporation (température ambiante)$$, $$condensation/liquéfaction (gaz→liquide) : ex. gouttelettes sur un couvercle froid$$]::text[],
        'example', jsonb_build_object('statement', $$De l'eau bout dans une casserole ; un couvercle froid placé au-dessus se couvre de gouttelettes. Nomme les deux changements d'état en jeu.$$, 'solution', $$La vaporisation (l'eau devient vapeur en bouillant) et la condensation (la vapeur redevient liquide au contact du couvercle froid).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre ébullition et évaporation ?$$, 'solution', $$L'ébullition se produit à 100°C (vaporisation rapide dans toute la masse du liquide) ; l'évaporation se produit à température ambiante, plus lentement, en surface.$$)
      ),
      jsonb_build_object(
        'heading', $$Le cycle de l'eau et son importance$$,
        'body', $$Sur Terre, l'eau existe dans les mers, lacs, rivières, le sol, les plantes. Sous l'effet de la chaleur du soleil, elle s'évapore ; en se refroidissant, la vapeur se condense en gouttelettes formant les nuages ; cette eau retombe en pluie ou en neige ; une partie ruisselle vers les cours d'eau, une autre s'infiltre dans le sol et est absorbée par les racines. Le cycle reprend. Ce cycle inclut évaporation, condensation, solidification, et fusion. L'eau, "l'or bleu", est indispensable à la vie (agriculture, médecine, alimentation), mais seulement 3% de l'eau totale sur Terre est douce — d'où la nécessité de la protéger, de ne pas la polluer, et de faire bouillir l'eau non traitée avant de la consommer.$$,
        'highlights', array[$$cycle de l'eau : évaporation → condensation (nuages) → précipitations → ruissellement/infiltration → répétition$$, $$seulement 3% de l'eau sur Terre est douce → importance de la protéger$$]::text[],
        'example', jsonb_build_object('statement', $$Un uniforme mouillé étalé sur une corde sèche au soleil sans laisser de flaque d'eau au sol. Quel changement d'état explique cela ?$$, 'solution', $$L'évaporation : l'eau liquide se transforme directement en vapeur (gaz) sous l'effet de la chaleur, sans laisser de trace liquide.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi faut-il faire bouillir l'eau non traitée avant de la consommer ?$$, 'solution', $$Pour tuer les microbes qu'elle pourrait contenir.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une élève de 6ème observe, en ouvrant la marmite que sa mère a placée sur le feu, des gouttelettes d'eau sur le couvercle et une forte vapeur qui s'en dégage.$$,
      'questions', array[
        $$Indique l'état dans lequel se trouve l'eau quand l'élève observe la forte vapeur.$$,
        $$Donne l'état de l'eau avant que la marmite ne soit placée sur le feu.$$,
        $$Nomme la transformation qui se produit quand la mère ouvre la marmite.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Au cours de la fusion de la glace, le volume de l'eau augmente-t-il ou diminue-t-il ?$$,
      'hint', $$La glace est plus volumineuse que l'eau liquide qui en résulte.$$,
      'expected', $$Il diminue.$$
    ),
    jsonb_build_object(
      'question', $$La masse de l'eau change-t-elle pendant la solidification ?$$,
      'hint', $$Seul le volume varie, pas la quantité de matière.$$,
      'expected', $$Non, la masse reste constante.$$
    ),
    jsonb_build_object(
      'question', $$Une bouteille en verre, remplie à ras bord et fermée, est placée au congélateur. Elle se brise. Pourquoi ?$$,
      'hint', $$Pense à la variation de volume de l'eau en train de geler.$$,
      'expected', $$Parce que le volume de l'eau augmente en se solidifiant (en glace), ce qui fait éclater la bouteille fermée.$$
    ),
    jsonb_build_object(
      'question', $$Nomme le passage de l'état gazeux à l'état liquide.$$,
      'hint', $$C'est ce qui forme la buée sur une vitre froide.$$,
      'expected', $$La condensation (ou liquéfaction).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-changements-etat-eau';
