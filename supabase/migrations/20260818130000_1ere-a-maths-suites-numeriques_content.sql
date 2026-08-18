-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 869: "MATHS_1A L5: SUITES NUMERIQUES"
-- (https://lyc.ecole-ci.org/course/view.php?id=869). Contrairement aux
-- leçons précédentes, cette leçon ne propose pas de PDF "résumé" mais deux
-- activités H5P InteractiveBook (resource ids 39809/42159, packages
-- 1AMATHL5.h5p) contenant les objectifs ("habiletés essentielles") et des
-- exercices interactifs (Activité 1, 2...) sans texte de cours rédigé. Le
-- contenu ci-dessous développe ces objectifs (définition d'une suite,
-- formule explicite, formule de récurrence, représentation graphique) en
-- un cours structuré standard du programme ivoirien, en réutilisant les
-- suites numériques données en exemple dans les activités du H5P
-- (u0=2,un+1=5un+2 ; u0=-4,un+1=un+2 ; un=3n+1 ; un=3n²+1). Rédaction 100%
-- originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-suites-numeriques',
  '1ere',
  'A',
  'mathematiques',
  $$Suites numériques$$,
  5,
  '1ere-a-maths-derivabilite-etude-fonctions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un club d'épargne scolaire propose deux façons de faire fructifier une cotisation de départ : la première consiste à ajouter un montant fixe chaque mois, la seconde à appliquer un pourcentage d'intérêt au montant du mois précédent. Des élèves de 1ère A veulent comparer les deux méthodes mois par mois, et se rendent compte qu'ils ont besoin de la notion de suite numérique pour bien les décrire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition d'une suite numérique$$,
        'body', $$Une suite numérique est une fonction définie sur ℕ (ou sur une partie de ℕ) et à valeurs dans ℝ. Au lieu de la noter u(n) comme une fonction ordinaire, on note le terme de rang n : un (on lit « u indice n »). La suite elle-même se note (un). Le terme u0 est appelé premier terme (ou terme initial) lorsque la suite est définie à partir de n=0.$$,
        'highlights', array[$$suite numérique : fonction de ℕ vers ℝ$$, $$un (terme de rang n)$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une suite numérique (un) est une fonction de ℕ (ou d'une partie de ℕ) vers ℝ, qui à chaque entier n associe un réel un.$$),
        'fixation', jsonb_build_object('question', $$Comment note-t-on le terme d'une suite (un) correspondant au rang n=3 ?$$, 'solution', $$On le note u3.$$)
      ),
      jsonb_build_object(
        'heading', $$Suite définie par une formule explicite$$,
        'body', $$Une suite (un) est définie par une formule explicite lorsque un s'exprime directement en fonction de n, sous la forme un=f(n). Cela permet de calculer n'importe quel terme directement, sans connaître les termes précédents.$$,
        'highlights', array[$$un = f(n)$$, $$calcul direct$$]::text[],
        'example', jsonb_build_object('statement', $$Soit (un) la suite définie pour tout entier naturel n par un=3n+1. Calcule u0 et u5.$$, 'solution', $$u0=3×0+1=1. u5=3×5+1=16.$$),
        'fixation', jsonb_build_object('question', $$Soit (un) définie par un=3n²+1. Calcule u2.$$, 'solution', $$u2=3×2²+1=3×4+1=13.$$)
      ),
      jsonb_build_object(
        'heading', $$Suite définie par une formule de récurrence$$,
        'body', $$Une suite (un) est définie par une formule de récurrence lorsqu'on donne son premier terme (par exemple u0), et une relation qui permet de calculer chaque terme à partir du précédent, du type un+1=f(un). Pour calculer un terme, il faut alors connaître tous les termes qui le précèdent.$$,
        'highlights', array[$$premier terme + relation$$, $$un+1 = f(un)$$]::text[],
        'example', jsonb_build_object('statement', $$Soit (un) définie par u0=2 et, pour tout entier naturel n, un+1=5un+2. Calcule u1 et u2.$$, 'solution', $$u1=5×u0+2=5×2+2=12. u2=5×u1+2=5×12+2=62.$$),
        'fixation', jsonb_build_object('question', $$Soit (un) définie par u0=−4 et un+1=un+2. Calcule u1 et u2.$$, 'solution', $$u1=u0+2=−4+2=−2. u2=u1+2=−2+2=0.$$)
      ),
      jsonb_build_object(
        'heading', $$Suite donnée par ses termes ou par sa représentation graphique$$,
        'body', $$Une suite peut aussi être définie directement par la liste de quelques-uns de ses termes (par exemple u0=1, u1=3, u2=5...), sans formule explicite ni relation de récurrence. Elle peut également être représentée graphiquement : dans un repère, on place les points de coordonnées (n;un) pour chaque rang n ; cette représentation est un nuage de points isolés, jamais une courbe continue, car n ne prend que des valeurs entières.$$,
        'highlights', array[$$liste de termes$$, $$représentation graphique : points isolés (n;un)$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la représentation graphique d'une suite numérique est-elle un nuage de points et non une courbe continue ?$$, 'solution', $$Parce que l'entier n ne prend que des valeurs discrètes (0, 1, 2, 3...) et non toutes les valeurs réelles d'un intervalle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club d'épargne scolaire compare deux formules à partir d'une cotisation de départ de 1000 F CFA. La formule A ajoute 200 F CFA chaque mois : an=1000+200n. La formule B ajoute 5% du montant du mois précédent : b0=1000 et bn+1=1,05×bn.$$,
      'questions', array[
        $$La formule A est-elle une suite définie par une formule explicite ou par une formule de récurrence ? Justifie.$$,
        $$Calcule a3, le montant après 3 mois avec la formule A.$$,
        $$La formule B est-elle une suite définie par une formule explicite ou par une formule de récurrence ? Calcule b1 et b2.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Une suite numérique est une fonction définie sur quel ensemble et à valeurs dans quel ensemble ?$$,
      'hint', $$L'un des deux ensembles est celui des entiers naturels.$$,
      'expected', $$Elle est définie sur ℕ (ou une partie de ℕ) et à valeurs dans ℝ.$$
    ),
    jsonb_build_object(
      'question', $$Soit (un) définie par un=2n−5. Calcule u4.$$,
      'hint', $$Remplace n par 4 dans la formule.$$,
      'expected', $$u4=2×4−5=3.$$
    ),
    jsonb_build_object(
      'question', $$Soit (un) définie par u0=3 et un+1=2un−1. Calcule u1.$$,
      'hint', $$Remplace un par u0 dans la relation.$$,
      'expected', $$u1=2×3−1=5.$$
    ),
    jsonb_build_object(
      'question', $$Pour une suite définie par une formule de récurrence, peut-on calculer u10 directement sans connaître u9 ?$$,
      'hint', $$Repense à la définition d'une relation de récurrence.$$,
      'expected', $$Non : il faut connaître u9 (et donc tous les termes précédents jusqu'à u0) pour calculer u10.$$
    )
  ),
  now()
);
