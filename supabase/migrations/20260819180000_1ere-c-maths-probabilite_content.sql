-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2031: "MATHS_1C L10: PROBABILITE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2031), resource id 17834.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-probabilite',
  '1ere',
  'C',
  'mathematiques',
  $$Probabilité$$,
  10,
  '1ere-c-maths-derivation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$M. Konan a oublié le code secret de son compte bancaire. Après deux essais infructueux, il appelle son épouse pour de l'aide. Celle-ci lui communique les quatre chiffres, mais pas dans le bon ordre ! Ne disposant que d'un dernier essai, il envisage tous les cas et veut quantifier la chance qu'il a de retirer l'argent à l'ultime essai.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Expérience aléatoire, univers et événement$$,
        'body', $$Une expérience aléatoire est une expérience dont on ne connaît pas d'avance le résultat mais dont on connaît les résultats possibles. Chaque résultat possible est une éventualité ; l'ensemble de ces résultats est l'univers, noté U ou Ω. Un événement est une partie de U : un singleton est un événement élémentaire, l'ensemble vide est l'événement impossible, U lui-même est l'événement certain. Deux événements A et B sont incompatibles si A∩B=∅ (l'événement « A et B » est impossible).$$,
        'highlights', array[$$univers U : ensemble de toutes les éventualités d'une expérience aléatoire$$, $$événement = partie de U ; événements incompatibles ⟺ A∩B=∅$$]::text[],
        'example', jsonb_build_object('statement', $$Lors du lancer de deux pièces de monnaie, écris l'univers U et l'événement A « obtenir Pile au 1er lancer ».$$, 'solution', $$U = {(P,P),(P,F),(F,P),(F,F)}. A = {(P,P),(P,F)}.$$),
        'fixation', jsonb_build_object('question', $$Lors d'un lancer de dé à 6 faces, quel est l'événement contraire de « obtenir un nombre pair » ?$$, 'solution', $$« Obtenir un nombre impair », soit {1;3;5}.$$)
      ),
      jsonb_build_object(
        'heading', $$Probabilité d'un événement$$,
        'body', $$Une probabilité P sur U est une application des parties de U vers [0;1] telle que P(U)=1, et si A et B sont incompatibles, P(A∪B)=P(A)+P(B). Propriétés : P(Ā)=1−P(A) ; P(∅)=0 ; si A={e1;...;ek}, P(A)=P({e1})+...+P({ek}) ; pour tous événements A et B (compatibles ou non), P(A∪B)=P(A)+P(B)−P(A∩B).$$,
        'highlights', array[$$P(Ā) = 1−P(A) ; P(∅)=0$$, $$P(A∪B) = P(A)+P(B)−P(A∩B), formule générale$$]::text[],
        'example', jsonb_build_object('statement', $$Deux événements A et B vérifient P(A)=0,33, P(B)=0,15, P(A∩B)=0,09. Calcule P(A∪B).$$, 'solution', $$P(A∪B) = 0,33+0,15−0,09 = 0,39.$$),
        'fixation', jsonb_build_object('question', $$On lance un dé truqué avec P({1})=1/16, P({2})=3/16, P({3})=5/16, P({4})=2/16, P({5})=3/16, P({6})=2/16. Calcule la probabilité de « obtenir un nombre pair ».$$, 'solution', $$P({2;4;6}) = 3/16+2/16+2/16 = 7/16.$$)
      ),
      jsonb_build_object(
        'heading', $$Équiprobabilité$$,
        'body', $$Une expérience aléatoire a lieu dans un cadre d'équiprobabilité lorsque tous les événements élémentaires ont la même probabilité. Si card(U)=n, sous cette hypothèse, chaque événement élémentaire a pour probabilité 1/n, et pour tout événement A, P(A) = card(A)/card(U) (nombre de cas favorables sur nombre de cas possibles). Mots-clés signalant l'équiprobabilité : « équitable », « équilibré », « parfait », « uniforme », « même chance », « indiscernable au toucher ».$$,
        'highlights', array[$$équiprobabilité : P(A) = card(A)/card(U)$$, $$mots-clés : équilibré, parfait, uniforme, indiscernable au toucher$$]::text[],
        'example', jsonb_build_object('statement', $$On lance un dé équilibré à 6 faces. Détermine la probabilité de l'événement E « obtenir un multiple de 3 ».$$, 'solution', $$Ω={1;2;3;4;5;6}, card(Ω)=6. E={3;6}, card(E)=2. P(E)=2/6=1/3.$$),
        'fixation', jsonb_build_object('question', $$On lance deux fois de suite un dé équilibré à 6 faces. Combien y a-t-il de résultats possibles au total ?$$, 'solution', $$36 résultats possibles (couples de nombres de 1 à 6, avec répétition).$$)
      ),
      jsonb_build_object(
        'heading', $$Probabilité et dénombrement$$,
        'body', $$Il n'est pas toujours facile d'écrire un événement en extension pour compter ses éléments : les formules de dénombrement (p-uplets, arrangements, combinaisons) permettent de calculer directement card(A) et card(U). Exemple : le choix d'une délégation de p membres parmi n, sans ordre, se compte avec Cnp ; un tirage successif sans remise se compte avec un arrangement Anp.$$,
        'highlights', array[$$délégation (choix non ordonné) : Cnp$$, $$tirage successif sans remise (ordonné) : Anp$$]::text[],
        'example', jsonb_build_object('statement', $$Une coopérative comprend 7 hommes et 3 femmes, dont un couple. On choisit au hasard une délégation de 4 membres. Calcule la probabilité que le couple en fasse partie.$$, 'solution', $$Il y a C10⁴=210 délégations possibles. Le couple étant fixé, il reste à choisir 2 membres parmi les 8 restants : C8²=28. La probabilité est 28/210=2/15.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule de dénombrement utilise-t-on pour compter le nombre de codes secrets à 4 chiffres distincts pris sur un clavier de 10 touches, avec répétition possible ?$$, 'solution', $$Le nombre de 4-uplets : 10⁴.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une loterie consiste à tourner une roue partagée en huit secteurs de même chance d'être désignés. Si le secteur désigné est blanc (4 secteurs), on perd 2000 FCFA ; s'il est noir (3 secteurs), on gagne 1000 FCFA ; s'il est rouge (1 secteur), on gagne 2000 FCFA. Un groupe d'élèves affirme qu'un joueur a autant de chance de gagner que de perdre.$$,
      'questions', array[
        $$Définis les événements B (« on perd »), N (« on gagne 1000 FCFA »), R (« on gagne 2000 FCFA ») et G (« on gagne »), avec leurs cardinaux, sachant que card(Ω)=8.$$,
        $$Calcule P(B), P(N) et P(R), puis calcule P(G) = P(N)+P(R) en justifiant que N et R sont incompatibles.$$,
        $$Compare P(B) et P(G) pour déterminer si le groupe d'élèves a raison.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition d'un événement impossible ?$$,
      'hint', $$C'est une partie particulière de l'univers U.$$,
      'expected', $$C'est l'événement représenté par l'ensemble vide (∅).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule générale de P(A∪B) pour deux événements quelconques A et B ?$$,
      'hint', $$Elle vaut aussi bien pour des événements compatibles qu'incompatibles.$$,
      'expected', $$P(A∪B) = P(A) + P(B) − P(A∩B).$$
    ),
    jsonb_build_object(
      'question', $$Dans une situation d'équiprobabilité avec card(U)=n, quelle est la probabilité d'un événement A ?$$,
      'hint', $$Elle se calcule à partir des cardinaux de A et de U.$$,
      'expected', $$P(A) = card(A)/card(U).$$
    ),
    jsonb_build_object(
      'question', $$On lance un dé truqué avec P({1})=1/16, P({2})=3/16, P({3})=5/16, P({4})=2/16, P({5})=3/16, P({6})=2/16. Calcule la probabilité de l'événement « le résultat est différent de 6 ».$$,
      'hint', $$Utilise la propriété de l'événement contraire.$$,
      'expected', $$P = 1 − P({6}) = 1 − 2/16 = 14/16 = 7/8.$$
    )
  ),
  now()
);
