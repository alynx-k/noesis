-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 9 : Combustion d'un solide et d'un liquide dans l'air"
-- (id 2087). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 6ème apprend auprès de son grand frère que la combustion du charbon de bois et celle de l'alcool produisent des corps. Avec sa classe, il décide de réaliser ces deux combustions pour identifier les produits formés et écrire leurs équations chimiques littérales.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Combustion du charbon de bois et de l'alcool$$,
        'body', $$Le charbon de bois est essentiellement constitué de carbone. Il brûle dans le dioxygène avec une vive incandescence, sa longueur diminue, et un gaz incolore se forme, qui trouble l'eau de chaux : c'est le dioxyde de carbone (gaz carbonique). La combustion s'arrête quand le dioxygène est épuisé. L'alcool, lui, s'enflamme avec une flamme bleue ; sa combustion dans le gaz oxygène donne de l'eau (mise en évidence par le bleuissement du sulfate de cuivre anhydre) et du dioxyde de carbone (mis en évidence par le trouble de l'eau de chaux).$$,
        'highlights', array[$$charbon de bois (carbone) + oxygène → dioxyde de carbone (trouble l'eau de chaux)$$, $$alcool + oxygène → eau (bleuit le sulfate de cuivre anhydre) + dioxyde de carbone$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel corps permet d'identifier le gaz carbonique ?$$, 'solution', $$L'eau de chaux (elle se trouble en présence de dioxyde de carbone).$$)
      ),
      jsonb_build_object(
        'heading', $$Réaction chimique et équations littérales$$,
        'body', $$Une réaction chimique est une transformation où les corps de départ (réactifs) disparaissent pour former de nouveaux corps (produits). Les combustions du charbon de bois et de l'alcool sont des réactions chimiques. Leurs équations littérales : "carbone + gaz oxygène → dioxyde de carbone" et "alcool + gaz oxygène → dioxyde de carbone + eau". Un combustible est un corps qui peut brûler (charbon de bois, bois sec, alcool, essence, gaz butane) ; un comburant permet au combustible de brûler (le gaz oxygène).$$,
        'highlights', array[$$réaction chimique = réactifs disparaissent → produits apparaissent$$, $$combustible (brûle) ≠ comburant (permet la combustion, ex : le gaz oxygène)$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la combustion du charbon de bois, quels sont les réactifs et le produit ?$$, 'solution', $$Réactifs : carbone et gaz oxygène. Produit : dioxyde de carbone.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les produits de la combustion de l'alcool ?$$, 'solution', $$L'eau et le dioxyde de carbone.$$)
      ),
      jsonb_build_object(
        'heading', $$Réaction chimique vs. transformation physique$$,
        'body', $$Dans la combustion du carbone, le carbone et le gaz oxygène sont consommés et de nouveaux corps apparaissent (le dioxyde de carbone) : c'est une transformation chimique. Dans la solidification de l'eau, le corps de départ (eau liquide) et le corps formé (glace) sont le même corps sous deux états différents : c'est une transformation physique (changement d'état), pas une réaction chimique.$$,
        'highlights', array[$$réaction chimique = nouveaux corps apparaissent (combustion)$$, $$transformation physique = même corps, état différent (changement d'état)$$]::text[],
        'example', jsonb_build_object('statement', $$La fonte de la glace est-elle une réaction chimique ou une transformation physique ?$$, 'solution', $$Une transformation physique : c'est toujours de l'eau, seul son état change (solide → liquide).$$),
        'fixation', jsonb_build_object('question', $$Comment distingue-t-on une réaction chimique d'une transformation physique ?$$, 'solution', $$Dans une réaction chimique, de nouveaux corps apparaissent ; dans une transformation physique, c'est le même corps qui change d'état.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une séance de travaux pratiques, un groupe d'élèves brûle du charbon de bois dans un bocal. Certains affirment qu'il s'agit d'une réaction chimique, d'autres d'une transformation physique.$$,
      'questions', array[
        $$Nomme le constituant essentiel du charbon de bois.$$,
        $$Explique pourquoi le charbon de bois s'éteint dans cette expérience.$$,
        $$Montre que cette expérience est une réaction chimique et écris son équation chimique littérale.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complète : "______ + gaz oxygène → dioxyde de carbone".$$,
      'hint', $$C'est le constituant du charbon de bois.$$,
      'expected', $$"Carbone + gaz oxygène → dioxyde de carbone."$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Alcool + ______ → dioxyde de carbone + ______".$$,
      'hint', $$Le comburant, et le deuxième produit.$$,
      'expected', $$"Alcool + gaz oxygène → dioxyde de carbone + eau."$$
    ),
    jsonb_build_object(
      'question', $$Toutes les combustions sont-elles des réactions chimiques ?$$,
      'hint', $$Une combustion transforme toujours la matière en nouveaux corps.$$,
      'expected', $$Oui.$$
    ),
    jsonb_build_object(
      'question', $$Le gaz oxygène est-il un combustible ou un comburant ?$$,
      'hint', $$Il permet la combustion sans brûler lui-même.$$,
      'expected', $$Un comburant.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-combustion-solide-liquide';
