-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2105: "Leçon1: Nombre entiers naturels (1)"
-- (https://coll.ecole-ci.org/course/view.php?id=2105), resource id 17545.
-- Contenu réécrit à partir du PDF source (thème "Calculs algébriques",
-- programme officiel MENA) ; situation d'apprentissage, définitions,
-- exemples numériques et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$YAO est un élève de sixième au Collège Moderne de Bondoukou. Son père sera absent du 04 mai au 24 mai 2021 et lui promet une somme de 1 890 francs à dépenser entièrement pour son goûter pendant cette absence. Pour bien gérer cet argent, YAO veut dépenser le même montant chaque jour. Sa camarade Fanta lui propose de dépenser 105 francs par jour. YAO décide de vérifier si cette proposition est pertinente en cherchant le nombre de jours d'absence de son père et le montant fixe à dépenser chaque jour.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les nombres entiers naturels$$,
        'body', $$Les nombres 0 ; 1 ; 105 ; 1890 ; 2021 ; … sont des nombres entiers naturels. Leur ensemble se note ℕ. Pour exprimer que 105 est un nombre entier naturel, on écrit 105 ∈ ℕ (« 105 appartient à l'ensemble ℕ »). Pour exprimer que 3,5 n'est pas un nombre entier naturel, on écrit 3,5 ∉ ℕ (« 3,5 n'appartient pas à l'ensemble ℕ »).$$,
        'highlights', array[$$ensemble des nombres entiers naturels : ℕ$$, $$∈ = « appartient à » ; ∉ = « n'appartient pas à »$$]::text[],
        'example', jsonb_build_object('statement', $$200 est-il un nombre entier naturel ? Et 0,25 ?$$, 'solution', $$200 ∈ ℕ (200 est un nombre entier naturel). 0,25 ∉ ℕ (0,25 n'est pas un nombre entier naturel, car ce n'est pas un nombre entier).$$),
        'fixation', jsonb_build_object('question', $$Comment note-t-on l'ensemble des nombres entiers naturels ?$$, 'solution', $$ℕ.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres entiers naturels consécutifs$$,
        'body', $$21 et 22 sont deux nombres entiers naturels consécutifs ; 12, 13 et 14 en sont trois. En revanche, 30 et 35 ne sont pas consécutifs. Pour deux nombres entiers naturels m et n avec m plus petit que n, le nombre d'entiers naturels consécutifs de m à n se calcule par n − m + 1.$$,
        'highlights', array[$$m et n consécutifs de m à n → nombre de termes = n − m + 1$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine le nombre d'entiers naturels consécutifs de 30 à 90.$$, 'solution', $$90 − 30 + 1 = 61. Il y a donc 61 entiers naturels consécutifs de 30 à 90.$$),
        'fixation', jsonb_build_object('question', $$Détermine le nombre d'entiers naturels consécutifs de 1 à 103.$$, 'solution', $$103 − 1 + 1 = 103.$$)
      ),
      jsonb_build_object(
        'heading', $$Multiples, nombres pairs et impairs$$,
        'body', $$Un multiple d'un nombre entier naturel est le produit de ce nombre par un nombre entier naturel : par exemple 0×98=0, 1×98=98 et 2×98=196, donc 0, 98 et 196 sont des multiples de 98. Chaque nombre entier naturel est multiple de 1 et de lui-même ; 0 est multiple de chaque nombre entier naturel. Les multiples de 2 sont appelés nombres pairs ; les nombres entiers naturels qui ne sont pas pairs sont appelés nombres impairs.$$,
        'highlights', array[$$multiple de a = produit de a par un entier naturel$$, $$nombres pairs = multiples de 2 ; les autres sont impairs$$]::text[],
        'example', jsonb_build_object('statement', $$Parmi 24 ; 46 ; 72 ; 124 ; 400 ; 8 ; 0, lesquels sont multiples de 8 ?$$, 'solution', $$24, 72, 400, 8 et 0 sont multiples de 8, car 24=8×3 ; 72=8×9 ; 400=8×50 ; 8=8×1 ; 0=8×0. En revanche, 46 et 124 ne sont pas multiples de 8.$$),
        'fixation', jsonb_build_object('question', $$Cite tous les nombres pairs compris entre 30 et 41.$$, 'solution', $$32 ; 34 ; 36 ; 38 et 40.$$)
      ),
      jsonb_build_object(
        'heading', $$Diviseurs et caractères de divisibilité$$,
        'body', $$Lorsque, dans la division d'un nombre entier naturel a par un nombre entier naturel non nul b, le reste est zéro, on dit que b est un diviseur de a (ou que a est divisible par b). Ainsi 1890 = 105×18, donc 105 est un diviseur de 1890. Tout nombre entier naturel non nul est divisible par 1 et par lui-même ; 0 n'est diviseur d'aucun nombre. Caractères de divisibilité : par 2 (le nombre se termine par 0, 2, 4, 6 ou 8), par 3 (la somme des chiffres est multiple de 3), par 5 (le nombre se termine par 0 ou 5), par 9 (la somme des chiffres est multiple de 9), par 10/100/1000 (le nombre se termine par autant de zéros).$$,
        'highlights', array[$$b est diviseur de a ⟺ a divisé par b a un reste nul$$, $$divisible par 3 ou 9 : somme des chiffres multiple de 3 ou de 9$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Critère', 'Règle']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Divisible par 2$$, $$se termine par 0, 2, 4, 6 ou 8$$),
            jsonb_build_array($$Divisible par 3$$, $$somme des chiffres multiple de 3$$),
            jsonb_build_array($$Divisible par 5$$, $$se termine par 0 ou 5$$),
            jsonb_build_array($$Divisible par 9$$, $$somme des chiffres multiple de 9$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Écris en extension l'ensemble E des diviseurs de 12.$$, 'solution', $$E = {1 ; 2 ; 3 ; 4 ; 6 ; 12}.$$),
        'fixation', jsonb_build_object('question', $$153 est-il un multiple de 9 ?$$, 'solution', $$Oui : 1+5+3=9, qui est un multiple de 9, donc 153 est divisible par 9.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un établissement scolaire organise tous les 4 ans une semaine sportive et tous les 3 ans une journée de distribution de prix. Lorsque ces deux événements tombent la même année, l'établissement envoie les meilleurs élèves et sportifs en voyage. Le dernier voyage a eu lieu en 2020.$$,
      'questions', array[
        $$Écris en extension l'ensemble des 4 premiers multiples non nuls de 4.$$,
        $$Justifie que les 6 premiers multiples non nuls de 3 sont 3 ; 6 ; 9 ; 12 ; 15 et 18.$$,
        $$En t'appuyant sur les deux questions précédentes, détermine l'année du prochain voyage.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie écrire 10 ∈ ℕ et 0,7 ∉ ℕ ?$$,
      'hint', $$∈ et ∉ décrivent l'appartenance à un ensemble.$$,
      'expected', $$10 ∈ ℕ signifie que 10 appartient à l'ensemble des entiers naturels ; 0,7 ∉ ℕ signifie que 0,7 n'appartient pas à cet ensemble (ce n'est pas un entier).$$
    ),
    jsonb_build_object(
      'question', $$Détermine tous les diviseurs de 24.$$,
      'hint', $$Cherche tous les couples de nombres dont le produit vaut 24.$$,
      'expected', $$1 ; 2 ; 3 ; 4 ; 6 ; 8 ; 12 ; 24.$$
    ),
    jsonb_build_object(
      'question', $$153 est un multiple de 9 : justifie-le par le caractère de divisibilité par 9.$$,
      'hint', $$Additionne les chiffres de 153.$$,
      'expected', $$1+5+3 = 9, qui est un multiple de 9 ; donc 153 est divisible par 9, c'est-à-dire multiple de 9.$$
    ),
    jsonb_build_object(
      'question', $$Le nombre 2020 est-il pair ou impair ?$$,
      'hint', $$Un nombre pair est un multiple de 2.$$,
      'expected', $$Pair, car 2020 se termine par 0, donc il est divisible par 2 (multiple de 2).$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-nombres-entiers-naturels';
