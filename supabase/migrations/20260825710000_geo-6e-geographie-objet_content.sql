-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 1 : La géographie et son objet" (Thème 1 : Les bases
-- de l'étude de la géographie). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une sortie d'étude portant sur l'observation et la description d'un paysage, un professeur guide répète sans cesse que la géographie est une science incontournable. Curieux d'en savoir davantage, des élèves de 6ème décident, une fois en classe, de mener des recherches afin d'identifier l'objet et les domaines de la géographie, comprendre la démarche du géographe et montrer son intérêt pour l'humanité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'objet et les domaines de la géographie$$,
        'body', $$Le mot « géographie » vient des mots grecs « gê » (terre) et « graphein » (dessin, écriture) : c'est donc, étymologiquement, l'écriture de la terre. La géographie est la science qui étudie les phénomènes se manifestant à la surface de la terre et les rapports entre l'homme et son milieu. Elle comprend trois grands domaines : la géographie physique (relief, climat, végétation, hydrographie, sols, ressources), la géographie humaine (population, démographie, habitat, mobilité, villes, campagnes) et la géographie économique (activités de l'homme dans l'espace : agriculture, pêche, élevage, industrie, commerce, transport, tourisme).$$,
        'highlights', array[$$géographie (grec "gê" = terre + "graphein" = écriture) = science des phénomènes à la surface de la terre$$, $$3 domaines : géographie physique, humaine, économique$$]::text[],
        'fixation', jsonb_build_object('question', $$Le climat appartient-il à la géographie physique, humaine, ou économique ?$$, 'solution', $$À la géographie physique.$$)
      ),
      jsonb_build_object(
        'heading', $$La démarche du géographe$$,
        'body', $$La démarche du géographe est scientifique et comporte cinq étapes : l'observation (directe sur le terrain, ou indirecte à travers des documents), la localisation (situer le phénomène dans l'espace), la description (décrire le phénomène), l'explication (donner les causes du phénomène), et la comparaison (rapporter le phénomène à un phénomène similaire pour en tirer des conclusions).$$,
        'highlights', array[$$5 étapes : observation → localisation → description → explication → comparaison$$]::text[],
        'example', jsonb_build_object('statement', $$Un géographe étudie une inondation. Après avoir observé et localisé le phénomène, que doit-il faire ensuite ?$$, 'solution', $$Le décrire, puis en expliquer les causes, avant de le comparer à d'autres inondations similaires.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la première étape de la démarche géographique ?$$, 'solution', $$L'observation.$$)
      ),
      jsonb_build_object(
        'heading', $$L'intérêt de l'étude de la géographie$$,
        'body', $$La géographie est importante car elle permet de s'orienter grâce aux cartes et aux coordonnées géographiques, d'acquérir une meilleure connaissance du monde, de développer l'esprit d'ouverture, de mieux connaître les autres peuples et leurs modes de vie, de favoriser la tolérance, et de mieux connaître son propre milieu de vie.$$,
        'highlights', array[$$intérêts : orientation, connaissance du monde, ouverture d'esprit, tolérance, connaissance de son milieu$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux intérêts de l'étude de la géographie.$$, 'solution', $$Par exemple : s'orienter grâce aux cartes, et mieux connaître son milieu de vie (deux parmi les intérêts cités).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de la formation des équipes pour un tournoi de football entre professeurs, certains professeurs d'Histoire-Géographie refusent de rejoindre l'équipe des matières littéraires. L'un d'eux affirme : « La géographie n'est pas une discipline littéraire. Elle a bel et bien un caractère scientifique : elle obéit à une démarche scientifique rigoureuse et couvre trois grands domaines. »$$,
      'questions', array[
        $$Dis quel est le problème posé par cette situation.$$,
        $$Explique pourquoi la géographie a un caractère scientifique.$$,
        $$Es-tu d'accord avec l'idée que la géographie présente un vaste champ d'action ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$D'où vient le mot "géographie" et que signifie-t-il littéralement ?$$,
      'hint', $$C'est un mot d'origine grecque, composé de deux racines.$$,
      'expected', $$Du grec "gê" (terre) et "graphein" (écriture/dessin) : littéralement, l'écriture de la terre.$$
    ),
    jsonb_build_object(
      'question', $$Quel domaine de la géographie étudie la population et son mode d'habitation ?$$,
      'hint', $$Ce n'est ni le domaine physique ni le domaine économique.$$,
      'expected', $$La géographie humaine.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre les étapes de la démarche du géographe : comparaison, observation, explication, description, localisation.$$,
      'hint', $$On observe toujours en premier.$$,
      'expected', $$1. Observation, 2. Localisation, 3. Description, 4. Explication, 5. Comparaison.$$
    ),
    jsonb_build_object(
      'question', $$L'agriculture appartient-elle à la géographie physique ou économique ?$$,
      'hint', $$C'est une activité de l'homme dans l'espace.$$,
      'expected', $$À la géographie économique.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-geographie-objet';
