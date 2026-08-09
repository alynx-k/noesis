-- Rewrite of exercise_questions for fr-oeuvre-integrale. The only
-- ecole-ci.org page previously found (id 2346) was a thin H5P activity with
-- no extractable text (see 20260806530000_fr_oeuvre_integrale_content.sql).
-- Revisited this session: the site is unreachable without login credentials
-- this session doesn't have (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding), so even that thin page could not be re-checked. These exercises
-- are original, from general knowledge of the standard 3ème programme,
-- grounded in this lesson's own methodology content (paratexte, schéma
-- narratif, point de vue, interprétation) and matching the existing
-- difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Cite deux éléments du paratexte d'un roman qui peuvent t'aider avant de commencer ta lecture.$$,
    'hint', $$Pense à ce qui se trouve autour du texte lui-même, sur la couverture par exemple.$$,
    'expected', $$Le titre et la quatrième de couverture, qui donnent des indices sur le genre et le sujet de l'histoire avant même d'ouvrir le livre.$$
  ),
  jsonb_build_object(
    'question', $$À quelle étape du schéma narratif correspond le moment où un événement vient bouleverser la situation de départ ?$$,
    'hint', $$Pense au terme qui désigne ce qui déclenche l'action.$$,
    'expected', $$C'est l'élément perturbateur (ou déclencheur), qui met fin à la situation initiale et lance l'intrigue.$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi est-il utile de savoir si le narrateur d'un roman connaît les pensées de tous les personnages ou seulement celles d'un seul ?$$,
    'hint', $$Pense au point de vue narratif et à ce qu'il nous permet de savoir.$$,
    'expected', $$Parce que cela indique le point de vue adopté (omniscient ou interne) et détermine quelles informations le lecteur reçoit ou non sur les personnages.$$
  ),
  jsonb_build_object(
    'question', $$Un élève affirme qu'un roman parle « de la liberté » sans citer aucun passage précis. Que lui manque-t-il pour que son interprétation soit convaincante ?$$,
    'hint', $$Pense à ce qui rend une analyse démontrable plutôt qu'une simple impression.$$,
    'expected', $$Il lui manque des exemples précis tirés du texte (une scène, une citation) pour appuyer et démontrer son interprétation.$$
  )
)
where id = 'fr-oeuvre-integrale';
