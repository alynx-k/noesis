-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 1 : La formation de la graine" (id 2062). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une sortie d'étude, des élèves de 6ème découvrent des plants d'Orgueil de Chine portant des boutons floraux, des fleurs épanouies, des fleurs fanées, et des gousses contenant des graines. Pour comprendre l'origine de ces graines, ils cherchent à s'informer sur les fleurs et les phénomènes qui interviennent dans la formation des graines.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les pièces de la fleur$$,
        'body', $$La fleur d'Orgueil de Chine comprend : 5 sépales (formant le calice), 5 pétales (formant la corolle), 10 étamines composées d'un filet et d'une anthère (formant l'androcée), et un pistil (ou gynécée) composé d'un ovaire, d'un style et d'un stigmate. La fleur évolue du bouton floral (pièces repliées) à la fleur épanouie (pièces individualisées) puis à la fleur fanée (sépales et pétales tombent, le pistil reste). Les sépales et pétales sont les pièces protectrices ; les étamines et le pistil sont les pièces reproductrices.$$,
        'highlights', array[$$calice (sépales) + corolle (pétales) = pièces protectrices$$, $$androcée (étamines) + pistil (ovaire+style+stigmate) = pièces reproductrices$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les pièces protectrices de la fleur ?$$, 'solution', $$Les sépales (calice) et les pétales (corolle).$$)
      ),
      jsonb_build_object(
        'heading', $$Pollinisation et fécondation$$,
        'body', $$Une expérience compare une fleur A (pollen déposé sur le stigmate) et une fleur B (pollen empêché) : seule la fleur A donne un fruit avec des graines. Le transport et le dépôt du grain de pollen sur le stigmate constituent la pollinisation. Le grain de pollen germe ensuite et forme un tube pollinique qui s'allonge, traverse le style, et atteint l'ovule dans l'ovaire. La cellule reproductrice mâle (du grain de pollen) fusionne alors avec la cellule reproductrice femelle (de l'ovule) : c'est la fécondation, qui forme une cellule-œuf (zygote).$$,
        'highlights', array[$$pollinisation = dépôt du pollen sur le stigmate$$, $$fécondation = fusion cellule mâle (pollen) + cellule femelle (ovule) → cellule-œuf$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la fleur B (sans pollen sur le stigmate) ne donne-t-elle pas de fruit ?$$, 'solution', $$Sans pollinisation, il n'y a pas de fécondation possible : l'ovule ne se développe pas et l'ovaire ne grossit pas en fruit.$$),
        'fixation', jsonb_build_object('question', $$Que devient le tube pollinique après la germination du grain de pollen ?$$, 'solution', $$Il s'allonge, traverse le style, et atteint l'ovule dans l'ovaire.$$)
      ),
      jsonb_build_object(
        'heading', $$De la fécondation à la graine : la reproduction sexuée$$,
        'body', $$Après la fécondation, la cellule-œuf se développe pour donner une plantule contenue dans la graine ; l'ovaire grossit pour donner le fruit, et les ovules se transforment en graines. Ce type de reproduction, qui nécessite l'union d'une cellule reproductrice mâle et d'une cellule reproductrice femelle, est appelé reproduction sexuée. La graine se forme donc à partir de la fleur, grâce à la pollinisation et à la fécondation.$$,
        'highlights', array[$$ovaire → fruit ; ovule fécondé → graine$$, $$reproduction sexuée = union de cellules reproductrices mâle et femelle$$]::text[],
        'example', jsonb_build_object('statement', $$Que devient l'ovaire après la fécondation ?$$, 'solution', $$Il grossit pour donner le fruit.$$),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on "reproduction sexuée" ?$$, 'solution', $$Un type de reproduction qui nécessite l'union d'une cellule reproductrice mâle et d'une cellule reproductrice femelle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un camarade de classe découvre, dans un manuel de 6ème, un schéma indiquant les moments importants de la transformation de la fleur en fruit contenant la graine, et te demande de l'aider à le comprendre.$$,
      'questions', array[
        $$Annote le schéma d'une fleur en identifiant ses différentes pièces.$$,
        $$Décris le devenir du grain de pollen jusqu'à la formation du fruit contenant la graine.$$,
        $$Explique la notion de reproduction sexuée à partir de cet exemple.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le filet et l'anthère forment-ils l'androcée ou le gynécée ?$$,
      'hint', $$Ce sont des parties de l'étamine.$$,
      'expected', $$L'androcée.$$
    ),
    jsonb_build_object(
      'question', $$La pollinisation est-elle le dépôt du grain de pollen sur le stigmate ?$$,
      'hint', $$C'est la définition exacte.$$,
      'expected', $$Oui, c'est le transport et le dépôt du grain de pollen sur le stigmate du pistil.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre chronologique : union des cellules reproductrices / pollinisation / formation du tube pollinique / germination du grain de pollen.$$,
      'hint', $$La pollinisation vient toujours en premier.$$,
      'expected', $$1. Pollinisation, 2. Germination du grain de pollen, 3. Formation du tube pollinique, 4. Union des cellules reproductrices.$$
    ),
    jsonb_build_object(
      'question', $$Le pistil est-il composé du style, du stigmate et de l'ovaire ?$$,
      'hint', $$Relis la définition du pistil (gynécée).$$,
      'expected', $$Oui.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-formation-graine';
