-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2100: "Leçon6: fractions"
-- (https://coll.ecole-ci.org/course/view.php?id=2100), resource id 17485.
-- Contenu réécrit à partir du PDF source (thème "Activités numériques",
-- programme officiel MENA) ; situation d'apprentissage, définitions,
-- règles et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après le décès de M. Diallo, le conseil de famille partage ses bœufs entre ses trois enfants : l'aîné recevra les deux cinquièmes, le cadet le un cinquième, et le benjamin se contentera du reste. Avant le partage, le benjamin en parle à ses camarades de 6ème, qui espèrent qu'il aura la plus grande part et décident d'écrire la part de chaque enfant sous forme de fraction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Fraction : définition et fractions décimales$$,
        'body', $$Pour a un entier naturel et b un entier naturel non nul, l'écriture a/b est une fraction : a est le numérateur, b le dénominateur. Tout entier naturel s'écrit comme fraction de dénominateur 1 (ex. 7 = 7/1). Une fraction décimale est une fraction dont le dénominateur est 10, 100, 1000, etc. (ex. 4/10, 7/100).$$,
        'highlights', array[$$a/b : a = numérateur, b = dénominateur (b ≠ 0)$$, $$fraction décimale : dénominateur 10, 100, 1000...$$]::text[],
        'example', jsonb_build_object('statement', $$Écris 2,7 sous forme de fraction décimale.$$, 'solution', $$2,7 = 27/10.$$),
        'fixation', jsonb_build_object('question', $$Comment écrire le nombre 0 sous forme de fraction ?$$, 'solution', $$0 = 0/1.$$)
      ),
      jsonb_build_object(
        'heading', $$Fractions égales et simplification$$,
        'body', $$On obtient une fraction égale à une fraction donnée en multipliant OU en divisant son numérateur et son dénominateur par un même nombre entier non nul (ex. 7/4 = 21/12 car on multiplie par 3). Simplifier une fraction consiste à diviser numérateur et dénominateur par un même nombre entier non nul, en s'aidant des critères de divisibilité (ex. 12/9 = 4/3 en divisant par 3).$$,
        'highlights', array[$$fractions égales : même multiplication/division du numérateur et dénominateur$$, $$simplifier = diviser les deux termes par un diviseur commun$$]::text[],
        'example', jsonb_build_object('statement', $$Simplifie la fraction 40/95.$$, 'solution', $$40/95 = (40÷5)/(95÷5) = 8/19.$$),
        'fixation', jsonb_build_object('question', $$15/6 est-elle égale à 5/2 ?$$, 'solution', $$Oui : 15/6 = (15÷3)/(6÷3) = 5/2.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparaison de fractions et comparaison à 1$$,
        'body', $$Même dénominateur : la plus petite fraction est celle qui a le plus petit numérateur. Même numérateur : la plus petite fraction est celle qui a le plus grand dénominateur. Dénominateurs différents : on réduit au même dénominateur (en multipliant chaque fraction par le dénominateur de l'autre) puis on compare les numérateurs. Comparaison à 1 : numérateur < dénominateur ⟹ fraction < 1 ; numérateur > dénominateur ⟹ fraction > 1 ; numérateur = dénominateur ⟹ fraction = 1.$$,
        'highlights', array[$$même dénominateur → plus petit numérateur = plus petite fraction$$, $$même numérateur → plus grand dénominateur = plus petite fraction$$, $$numérateur < dénominateur ⟹ fraction < 1$$]::text[],
        'example', jsonb_build_object('statement', $$Compare 3/5 et 7/9.$$, 'solution', $$3/5 = 27/45 et 7/9 = 35/45 (même dénominateur 45). Comme 27 < 35, on a 3/5 < 7/9.$$),
        'fixation', jsonb_build_object('question', $$9/14 et 9/23 : laquelle est la plus grande ?$$, 'solution', $$9/14, car à numérateur égal, la fraction avec le plus petit dénominateur est la plus grande.$$)
      ),
      jsonb_build_object(
        'heading', $$Somme de deux fractions$$,
        'body', $$Pour additionner deux fractions de même dénominateur, on additionne les numérateurs et on garde le dénominateur commun (ex. 5/10 + 4/10 = 9/10). Pour des dénominateurs différents, on réduit d'abord au même dénominateur, puis on additionne (ex. 7/6 + 2/11 = 77/66 + 12/66 = 89/66).$$,
        'highlights', array[$$même dénominateur : additionner seulement les numérateurs$$, $$dénominateurs différents : réduire au même dénominateur d'abord$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule 3/4 + 7/2.$$, 'solution', $$3/4 + 7/2 = 3/4 + 14/4 = 17/4 (on multiplie 7/2 par 2/2 pour obtenir le dénominateur 4).$$),
        'fixation', jsonb_build_object('question', $$Calcule 11/7 + 4/7.$$, 'solution', $$15/7 (on additionne seulement les numérateurs, le dénominateur 7 reste inchangé).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À l'issue d'un concours d'excellence, une ONG publie les taux de réussite de trois lycées : Lycée 1, 5 admis sur 7 ; Lycée 2, 8 admis sur 11 ; Lycée 3, 10 admis sur 13. L'ONG récompensera l'établissement au taux de réussite le plus élevé. Un élève du Lycée 3 veut savoir si son établissement sera primé.$$,
      'questions', array[
        $$Écris la fraction représentant le taux d'admission de chaque lycée.$$,
        $$Réduis ces trois fractions à un dénominateur commun de 1001 pour les comparer facilement.$$,
        $$Quel lycée l'ONG va-t-elle récompenser ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Simplifie la fraction 24/18.$$,
      'hint', $$Cherche un diviseur commun à 24 et 18.$$,
      'expected', $$24/18 = (24÷6)/(18÷6) = 4/3.$$
    ),
    jsonb_build_object(
      'question', $$Compare 8/9 et 9/5 au nombre 1.$$,
      'hint', $$Compare le numérateur au dénominateur pour chacune.$$,
      'expected', $$8/9 < 1 (car 8 < 9) et 9/5 > 1 (car 9 > 5).$$
    ),
    jsonb_build_object(
      'question', $$Calcule 5/9 + 13/9, puis simplifie le résultat si possible.$$,
      'hint', $$Même dénominateur : additionne les numérateurs.$$,
      'expected', $$5/9 + 13/9 = 18/9 = 2.$$
    ),
    jsonb_build_object(
      'question', $$Un gardien de but a arrêté 16 tirs sur 25, un autre 13 tirs sur 20. Lequel est le plus efficace ?$$,
      'hint', $$Réduis les deux fractions au même dénominateur 100.$$,
      'expected', $$16/25 = 64/100 et 13/20 = 65/100 ; comme 64 < 65, le gardien qui a arrêté 13 tirs sur 20 est le plus efficace.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-fractions';
