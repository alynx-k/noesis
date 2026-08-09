-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths leçon 3 Nombres
-- Rationnels" (Collège Numérique, Thème "Calculs algébriques", Leçon 3,
-- course id 1993, resource id 16212, downloaded from coll.ecole-ci.org and
-- read directly). The real lesson opens with PPCM/PGCD of whole numbers
-- before defining rational numbers and their product/inverse/quotient, and
-- closes with decimal approximation, arrondi and troncature — a broader
-- scope than the earlier fallback (which only covered add/sub/mult/div/
-- compare of fractions). Every sentence, example and exercise below is an
-- original composition in our own wording — no sentence is copied verbatim
-- from the source PDF. No diagram: purely numerical lesson.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un collège ivoirien compte 420 élèves, dont 180 filles. Après une campagne de reboisement, les élèves veulent former des équipes de nettoyage comportant chacune le même nombre de filles et le même nombre de garçons, avec le plus grand nombre d'équipes possible. Pour y arriver sans tâtonner, les élèves de 4ème doivent chercher le plus grand diviseur commun de 420 et 180 — un outil qui, avec les nombres rationnels, va aussi leur servir à répartir précisément le matériel entre les équipes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$PPCM et PGCD de deux nombres entiers$$,
        'body', $$Le PPCM (plus petit commun multiple) de deux entiers non nuls est le plus petit nombre qui soit à la fois multiple de l'un et de l'autre. Le PGCD (plus grand commun diviseur) est le plus grand nombre qui divise à la fois les deux entiers. On les obtient en décomposant chaque nombre en produit de facteurs premiers : le PPCM prend chaque facteur avec son plus grand exposant, le PGCD ne garde que les facteurs communs avec leur plus petit exposant.$$,
        'highlights', array[$$PPCM$$, $$PGCD$$, $$facteurs premiers$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$On décompose chaque nombre en produit de facteurs premiers. Le PPCM est le produit de tous les facteurs apparus, chacun affecté de son plus grand exposant. Le PGCD est le produit des seuls facteurs communs aux deux décompositions, chacun affecté de son plus petit exposant.$$),
        'example', jsonb_build_object('statement', $$Sachant que 180 = 2²×3²×5 et 420 = 2²×3×5×7, calcule PGCD(180 ; 420) et PPCM(180 ; 420).$$, 'solution', $$Facteurs communs : 2 (exposant min 2) et 3 (exposant min 1) et 5 (exposant min 1), donc PGCD = 2²×3×5 = 60. Pour le PPCM, on prend chaque facteur avec son plus grand exposant : PPCM = 2²×3²×5×7 = 1260.$$),
        'fixation', jsonb_build_object('question', $$Sachant que 24 = 2³×3 et 36 = 2²×3², calcule PGCD(24 ; 36) et PPCM(24 ; 36).$$, 'solution', $$PGCD(24 ; 36) = 2²×3 = 12. PPCM(24 ; 36) = 2³×3² = 72.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres rationnels : définition et écriture$$,
        'body', $$Un nombre rationnel est un nombre qui peut s'écrire comme une fraction ou comme l'opposé d'une fraction ; l'ensemble de ces nombres se note ℚ. Une même valeur peut s'écrire a/b avec a et b entiers relatifs, b non nul, et on peut toujours déplacer le signe : −a/b = a/(−b) = −(a/b).$$,
        'highlights', array[$$nombre rationnel$$, $$ℚ$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un nombre rationnel s'écrit a/b avec a et b entiers relatifs et b non nul. Tout nombre décimal est un nombre rationnel. Pour a et b entiers naturels non nuls : −a/b = a/(−b) = −(a/b).$$),
        'example', jsonb_build_object('statement', $$Réécris −7/(−3) sans signe négatif au dénominateur.$$, 'solution', $$−7/(−3) = 7/(−(−3)) = 7/3.$$),
        'fixation', jsonb_build_object('question', $$Réécris 5/(−9) avec le signe négatif devant la fraction.$$, 'solution', $$5/(−9) = −5/9.$$)
      ),
      jsonb_build_object(
        'heading', $$Produit, inverse et quotient de nombres rationnels$$,
        'body', $$Pour multiplier deux nombres rationnels, on multiplie les numérateurs entre eux et les dénominateurs entre eux. L'inverse d'un rationnel a/b (non nul) est b/a, puisque leur produit vaut 1. Diviser par un rationnel c/d revient donc à multiplier par son inverse d/c.$$,
        'highlights', array[$$produit$$, $$inverse$$, $$quotient$$]::text[],
        'property', jsonb_build_object('label', $$Règles$$, 'text', $$Pour a, b, c, d entiers relatifs avec b et d non nuls : a/b × c/d = (a×c)/(b×d). L'inverse de a/b (a et b non nuls) est b/a. a/b ÷ c/d = a/b × d/c, pour c non nul.$$),
        'example', jsonb_build_object('statement', $$Calcule (−4/9) × (3/(−2)), puis donne l'inverse de −5/8.$$, 'solution', $$(−4/9) × (3/(−2)) = (−4×3)/(9×(−2)) = −12/(−18) = 12/18 = 2/3 après simplification. L'inverse de −5/8 est −8/5.$$),
        'fixation', jsonb_build_object('question', $$Calcule (7/(−5)) ÷ (2/3).$$, 'solution', $$(7/(−5)) ÷ (2/3) = 7/(−5) × 3/2 = 21/(−10) = −21/10.$$)
      ),
      jsonb_build_object(
        'heading', $$Approximation décimale, arrondi et troncature$$,
        'body', $$Un nombre rationnel qui n'est pas décimal a une écriture décimale illimitée ; on l'encadre alors par deux décimaux consécutifs d'un ordre donné, appelés approximations par défaut et par excès. L'arrondi d'ordre n regarde le chiffre suivant pour choisir entre ces deux approximations, tandis que la troncature se contente de couper l'écriture après n chiffres après la virgule, sans arrondir.$$,
        'highlights', array[$$approximation décimale$$, $$arrondi$$, $$troncature$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour l'arrondi d'ordre n de a/b : si le chiffre à la position (n+1) est 0, 1, 2, 3 ou 4, l'arrondi est l'approximation par défaut ; si ce chiffre est 5, 6, 7, 8 ou 9, l'arrondi est l'approximation par excès. La troncature à n décimales garde simplement les n premiers chiffres après la virgule, sans regarder la suite.$$),
        'example', jsonb_build_object('statement', $$Sachant que 22/7 ≈ 3,1428571, donne l'arrondi d'ordre 3 puis la troncature à 3 décimales de 22/7.$$, 'solution', $$Le 4ᵉ chiffre après la virgule est 8, donc l'arrondi d'ordre 3 est 3,143 (par excès). La troncature à 3 décimales, qui ne regarde pas la suite, est 3,142.$$),
        'fixation', jsonb_build_object('question', $$Sachant que 17/6 ≈ 2,8333333, donne l'arrondi d'ordre 2 de 17/6.$$, 'solution', $$Le 3ᵉ chiffre après la virgule est 3, donc l'arrondi d'ordre 2 est 2,83 (par défaut).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux motos-taxis de Bouaké partent en même temps d'un même carrefour pour des tournées circulaires sur des trajets différents. La première moto revient au carrefour toutes les 24 minutes, la seconde toutes les 40 minutes. Le chef de station affirme que les deux motos se retrouveront de nouveau ensemble au carrefour après un certain temps, autre qu'au départ.$$,
      'questions', array[
        $$Décompose 24 et 40 en produits de facteurs premiers.$$,
        $$Calcule le PPCM de 24 et 40, et déduis-en au bout de combien de minutes les deux motos se retrouveront ensemble au carrefour.$$,
        $$Calcule aussi le nombre de tours effectués par chaque moto à ce moment-là.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule le PGCD de 150 et 90, puis simplifie la fraction 150/90 à l'aide de ce PGCD.$$,
      'hint', $$Décompose 150 et 90 en facteurs premiers, puis ne garde que les facteurs communs avec leur plus petit exposant.$$,
      'expected', $$150 = 2×3×5² et 90 = 2×3²×5, donc PGCD(150 ; 90) = 2×3×5 = 30. En divisant : 150/90 = (150÷30)/(90÷30) = 5/3.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (−6/7) × (14/(−9)) et donne le résultat sous forme de fraction irréductible.$$,
      'hint', $$Multiplie numérateurs entre eux et dénominateurs entre eux, puis simplifie.$$,
      'expected', $$(−6/7) × (14/(−9)) = (−6×14)/(7×(−9)) = −84/(−63) = 84/63 = 4/3 après simplification.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (−8/3) ÷ (2/9).$$,
      'hint', $$Diviser par une fraction revient à multiplier par son inverse.$$,
      'expected', $$(−8/3) ÷ (2/9) = (−8/3) × (9/2) = −72/6 = −12.$$
    ),
    jsonb_build_object(
      'question', $$Sachant que 13/9 ≈ 1,4444444, donne l'arrondi d'ordre 1 et la troncature à 2 décimales de 13/9.$$,
      'hint', $$Pour l'arrondi, regarde le chiffre juste après le rang demandé ; pour la troncature, coupe simplement sans arrondir.$$,
      'expected', $$Arrondi d'ordre 1 : le 2ᵉ chiffre après la virgule est 4, donc l'arrondi est 1,4 (par défaut). Troncature à 2 décimales : 1,44.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-nombres-rationnels';
