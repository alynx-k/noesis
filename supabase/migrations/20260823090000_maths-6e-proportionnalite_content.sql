-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2097: "Leçon9: Proportionnalité"
-- (https://coll.ecole-ci.org/course/view.php?id=2097), resource id 17449.
-- Contenu réécrit à partir du PDF source (thème "Organisation et
-- traitement de données", programme officiel MENA) ; situation
-- d'apprentissage, définitions et exercices reformulés, non copiés
-- verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le président d'une coopérative agricole du Gontougo veut élargir ses activités. Un organisme international exige 25% de femmes au conseil d'administration. Le conseil actuel compte 16 membres dont 3 femmes. Le président se demande si cette composition respecte la condition. Son fils, en 6ème, et ses camarades décident d'étudier la proportionnalité pour l'aider.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Grandeurs proportionnelles et coefficient$$,
        'body', $$Deux grandeurs sont proportionnelles lorsque les valeurs de l'une s'obtiennent en multipliant les valeurs de l'autre par un même nombre non nul, appelé coefficient de proportionnalité (il y en a deux : un dans chaque sens). Pour vérifier une situation de proportionnalité, on compare les quotients valeur/valeur pour chaque couple : s'ils sont tous égaux, c'est proportionnel.$$,
        'highlights', array[$$même coefficient partout = proportionnalité$$, $$2 coefficients : un pour chaque sens (aller/retour)$$]::text[],
        'example', jsonb_build_object('statement', $$20 morceaux de sucre pèsent 160 g, 80 morceaux pèsent 640 g. Est-ce proportionnel ?$$, 'solution', $$Oui : 160/20 = 8 et 640/80 = 8, les quotients sont égaux.$$),
        'fixation', jsonb_build_object('question', $$5 stylos coûtent 500 F et 10 stylos coûtent 800 F. Est-ce proportionnel ?$$, 'solution', $$Non : 500/5 = 100 mais 800/10 = 80 ; les quotients sont différents.$$)
      ),
      jsonb_build_object(
        'heading', $$Tableau de proportionnalité et propriétés de linéarité$$,
        'body', $$Un tableau de proportionnalité est un tableau où les nombres d'une ligne s'obtiennent en multipliant les nombres correspondants de l'autre ligne par un même nombre (le coefficient). Deux propriétés utiles pour le compléter : (1) on peut multiplier/diviser les deux nombres d'une colonne par un même nombre pour créer une nouvelle colonne ; (2) on peut additionner ou soustraire deux colonnes, ligne par ligne, pour en déduire une troisième.$$,
        'highlights', array[$$propriété 1 : multiplier/diviser une colonne entière par k$$, $$propriété 2 : additionner/soustraire deux colonnes ligne par ligne$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un tableau, 3 correspond à 2,1 et 12 correspond à 8,4. Comme 3+12=15, à quoi correspond 15 ?$$, 'solution', $$2,1 + 8,4 = 10,5 (on additionne les valeurs correspondantes, ligne par ligne).$$),
        'fixation', jsonb_build_object('question', $$Dans un tableau de proportionnalité, 3 correspond à 13,5. Quel est le coefficient qui permet de passer de 3 à 13,5 ?$$, 'solution', $$13,5 ÷ 3 = 4,5.$$)
      ),
      jsonb_build_object(
        'heading', $$Le pourcentage, un coefficient particulier$$,
        'body', $$Un pourcentage est un coefficient de proportionnalité écrit comme une fraction de dénominateur 100 ; le signe « % » remplace « /100 ». Calculer p% d'un nombre revient à multiplier ce nombre par p/100. Exemple : 43% = 43/100 = 0,43.$$,
        'highlights', array[$$p% = p/100$$, $$calculer p% de N = N × (p/100)$$]::text[],
        'example', jsonb_build_object('statement', $$Sur 1465 élèves, 80% aiment une chanson. Combien d'élèves cela représente-t-il ?$$, 'solution', $$1465 × 80/100 = 1172 élèves.$$),
        'fixation', jsonb_build_object('question', $$Écris 143% sous forme décimale.$$, 'solution', $$143% = 143/100 = 1,43.$$)
      ),
      jsonb_build_object(
        'heading', $$L'échelle$$,
        'body', $$L'échelle est un coefficient de proportionnalité qui permet de passer des longueurs réelles aux longueurs sur un dessin (plan, carte, photo), les deux longueurs étant exprimées dans la même unité : échelle = longueur sur le dessin / longueur réelle.$$,
        'highlights', array[$$échelle = longueur dessin ÷ longueur réelle (même unité)$$]::text[],
        'example', jsonb_build_object('statement', $$Sur une carte à l'échelle 1/400 000, un fleuve mesure 8 cm. Quelle est sa longueur réelle ?$$, 'solution', $$8 × 400 000 = 3 200 000 cm = 32 km.$$),
        'fixation', jsonb_build_object('question', $$Sur un plan à l'échelle 1/40, une distance mesure 1,49 cm. Quelle est la distance réelle ?$$, 'solution', $$1,49 × 40 = 59,6 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de 6ème doit commander 55 bouteilles de jus de Bissap. La vendeuse produit habituellement 5 bouteilles avec 1,5 kg de sucre, et 30 bouteilles avec 9 kg de sucre.$$,
      'questions', array[
        $$Vérifie que le tableau (5 bouteilles → 1,5 kg ; 30 bouteilles → 9 kg) est bien un tableau de proportionnalité.$$,
        $$Détermine le coefficient de proportionnalité qui permet de passer du nombre de bouteilles à la quantité de sucre.$$,
        $$Calcule la quantité de sucre nécessaire pour 55 bouteilles.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule 18% de 16 000.$$,
      'hint', $$Multiplie 16 000 par 18/100.$$,
      'expected', $$16 000 × 18/100 = 2 880.$$
    ),
    jsonb_build_object(
      'question', $$Un conseil d'administration compte 16 membres dont 3 femmes. Cela respecte-t-il une condition de 25% de femmes ?$$,
      'hint', $$Calcule 25% de 16 et compare à 3.$$,
      'expected', $$25% de 16 = 4. Comme 3 < 4, la condition de 25% n'est pas respectée.$$
    ),
    jsonb_build_object(
      'question', $$Le prix du tissu est proportionnel à la longueur : 3 m coûtent 1500 F. Quel est le prix de 13 m ?$$,
      'hint', $$Trouve d'abord le coefficient (prix pour 1 m).$$,
      'expected', $$Coefficient = 1500/3 = 500 F/m ; pour 13 m : 13 × 500 = 6500 F.$$
    ),
    jsonb_build_object(
      'question', $$Un tableau donne 1,5 correspondant à 4,2, et 9 correspondant à une valeur inconnue. Quel est le coefficient de proportionnalité, et à quoi correspond 9 ?$$,
      'hint', $$Coefficient = 4,2 ÷ 1,5.$$,
      'expected', $$Coefficient = 2,8 ; 9 correspond à 9 × 2,8 = 25,2.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-proportionnalite';
