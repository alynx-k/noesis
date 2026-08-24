-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 9 : LA PUBERTÉ ET L'ÉPANOUISSEMENT PHYSIQUE, MORAL ET
-- SOCIAL DE L'ADOLESCENT" (id 1711). Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de 6ème fait partie d'un groupe d'adolescents qui s'habillent de manière provocante, consomment de l'alcool et fument souvent, si bien qu'elle est souvent absente au cours. Choqués par cette attitude, ses camarades décident de s'informer sur les comportements à observer en période de puberté.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et manifestations de la puberté$$,
        'body', $$La puberté est le passage de l'enfance à l'adolescence, situé en général entre 10 et 14 ans. Ses manifestations physiques (changements apparents) diffèrent selon le sexe : chez la fille, apparition des seins, développement de la poitrine, poils, élargissement du bassin ; chez le garçon, poils, allongement du corps, élargissement des épaules. Ses manifestations physiologiques (internes) sont les règles chez la fille, et l'aggravation de la voix et les pollutions nocturnes chez le garçon. Ses manifestations psychologiques touchent les deux sexes : volonté d'affirmation, désir de plaire, désir de liberté, choix d'amis du même âge, parfois refus de l'autorité parentale.$$,
        'highlights', array[$$puberté = passage enfance→adolescence, entre 10 et 14 ans$$, $$manifestations physiques (apparentes), physiologiques (internes), psychologiques (comportement)$$]::text[],
        'fixation', jsonb_build_object('question', $$Entre quel âge se situe généralement la puberté ?$$, 'solution', $$Entre 10 et 14 ans.$$)
      ),
      jsonb_build_object(
        'heading', $$Les règles de bonne conduite en période de puberté$$,
        'body', $$Au niveau individuel : s'abstenir de tout rapport sexuel, se laver régulièrement et laver ses sous-vêtements, éviter alcool/tabac/drogue, porter des vêtements décents. Au niveau familial : se confier aux parents, les respecter. Au niveau communautaire : écouter les enseignements des professeurs et éducateurs sur la puberté, éviter les mauvaises fréquentations, pratiquer des jeux sains. À l'inverse, les obstacles à l'épanouissement incluent la sexualité précoce, le manque d'hygiène, les mauvaises fréquentations, et l'influence négative des réseaux sociaux.$$,
        'highlights', array[$$individuel : hygiène, tenue décente, abstinence ; familial : confiance, respect$$, $$communautaire : bons conseils, bonnes fréquentations, jeux sains$$]::text[],
        'example', jsonb_build_object('statement', $$"Laver ses sous-vêtements" est une règle de vie de quel niveau ?$$, 'solution', $$Individuel (hygiène personnelle).$$),
        'fixation', jsonb_build_object('question', $$Cite un obstacle social à l'épanouissement en période de puberté.$$, 'solution', $$Par exemple : les mauvaises fréquentations, les jeux malsains, ou l'influence négative des réseaux sociaux.$$)
      ),
      jsonb_build_object(
        'heading', $$Le modèle du pont$$,
        'body', $$Le modèle du pont est une représentation visuelle du changement de comportement utilisée dans les pratiques de vie saine. Il comprend : la rive A (les connaissances, le point de départ), la rive B (la vie positive et saine, le but à atteindre), le fleuve (les risques et dangers à éviter), et les planches du pont (les bonnes pratiques qui permettent de traverser du point A au point B en toute sécurité). Ce modèle aide l'adolescent à éviter les comportements à risques.$$,
        'highlights', array[$$rive A = connaissances ; rive B = vie saine ; fleuve = risques/dangers ; planches = bonnes pratiques$$]::text[],
        'example', jsonb_build_object('statement', $$Que représentent les "planches du pont" dans ce modèle ?$$, 'solution', $$Les bonnes pratiques, chacune un moyen concret de résoudre un problème et d'avancer vers une vie saine.$$),
        'fixation', jsonb_build_object('question', $$Que symbolise le fleuve dans le modèle du pont ?$$, 'solution', $$Les risques et les dangers.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton camarade de classe se plaint des remarques de ses parents sur son manque d'hygiène corporelle. Il les trouve choquantes et te demande de l'accompagner chez le professeur d'EDHC pour qu'il intervienne en sa faveur.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite deux règles de bonne conduite individuelle en période de puberté.$$,
        $$Justifie ta décision de l'accompagner (ou non).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Parmi "l'apparition des seins" et "l'allongement du corps", laquelle est une manifestation de la puberté chez le garçon ?$$,
      'hint', $$L'une concerne la fille, l'autre le garçon.$$,
      'expected', $$"L'allongement du corps" (manifestation chez le garçon).$$
    ),
    jsonb_build_object(
      'question', $$"Le désir de liberté" et "le refus de l'autorité parentale" relèvent de quel type de manifestation de la puberté ?$$,
      'hint', $$Ce ne sont pas des changements physiques.$$,
      'expected', $$Des manifestations psychologiques.$$
    ),
    jsonb_build_object(
      'question', $$"Se confier aux parents" est une règle de vie de quel niveau ?$$,
      'hint', $$Ce n'est ni individuel, ni communautaire.$$,
      'expected', $$Familial.$$
    ),
    jsonb_build_object(
      'question', $$Que doit faire un adolescent pour "traverser" du modèle du pont, de la rive A à la rive B ?$$,
      'hint', $$Il utilise les éléments qui composent le pont.$$,
      'expected', $$Emprunter les planches du pont, c'est-à-dire adopter les bonnes pratiques.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-puberte';
