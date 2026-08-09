-- Re-applies the CURRENT on-disk content of 25 already-applied migration
-- files whose content was edited in place AFTER their first (fallback)
-- push. supabase db push tracks applied migrations by filename/version,
-- not by content hash, so in-place edits to already-applied files were
-- silently ignored by a plain 'db push' -- this new-timestamped file
-- forces the real (re-sourced) content to actually reach the database.

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un magazine scientifique, une collégienne de 4ème repère plusieurs mesures impressionnantes : la distance Terre-Soleil vaut environ 150 000 000 km, alors que l'épaisseur d'un cheveu n'est que de 0,00005 m. Elle voudrait recopier ces nombres sans se tromper dans le compte des zéros, et se demande s'il n'existe pas une écriture plus compacte. Les puissances de 10 et la notation scientifique vont lui fournir cette écriture.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Puissances de 10 d'exposant relatif$$,
        'body', $$Pour un entier n strictement positif, 10 à la puissance n s'écrit 1 suivi de n zéros, tandis que 10 à la puissance moins n s'écrit 0, suivi de (n−1) zéros puis d'un 1. On retient aussi que 10 à la puissance 0 vaut 1, et que 10^(-n) est l'inverse de 10^n.$$,
        'highlights', array[$$puissance de 10$$, $$exposant relatif$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés des puissances de 10$$, 'text', $$Pour m et n entiers relatifs : 10^m × 10^n = 10^(m+n) ; (10^m)^n = 10^(m×n) ; 10^m ÷ 10^n = 10^(m−n).$$),
        'example', jsonb_build_object('statement', $$Calcule 10^5 × 10^2 puis (10^-3)^4.$$, 'solution', $$10^5 × 10^2 = 10^(5+2) = 10^7. (10^-3)^4 = 10^(-3×4) = 10^-12.$$),
        'fixation', jsonb_build_object('question', $$Calcule 10^-6 × 10^6 puis 10^8 ÷ 10^-3.$$, 'solution', $$10^-6 × 10^6 = 10^(-6+6) = 10^0 = 1. 10^8 ÷ 10^-3 = 10^(8−(−3)) = 10^11.$$)
      ),
      jsonb_build_object(
        'heading', $$Écriture a × 10^p et notation scientifique$$,
        'body', $$Tout nombre décimal peut s'écrire sous la forme a×10^p, où a est un décimal et p un entier relatif — et cette écriture n'est pas unique. Parmi toutes ces écritures, la notation scientifique est celle où a n'a qu'un seul chiffre non nul avant la virgule.$$,
        'highlights', array[$$notation scientifique$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La notation scientifique d'un nombre décimal est son écriture sous la forme a×10^p, où a est un nombre décimal ayant un seul chiffre non nul avant la virgule et p un entier relatif.$$),
        'example', jsonb_build_object('statement', $$Donne la notation scientifique de 47 000 et de 0,0623.$$, 'solution', $$47 000 = 4,7×10^4. 0,0623 = 6,23×10^-2.$$),
        'fixation', jsonb_build_object('question', $$Donne la notation scientifique de 8 300 000 et de 0,00091.$$, 'solution', $$8 300 000 = 8,3×10^6. 0,00091 = 9,1×10^-4.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparer des nombres écrits sous forme a × 10^p$$,
        'body', $$Pour comparer deux nombres positifs écrits avec une puissance de 10, on les met d'abord en notation scientifique. Si les exposants obtenus sont égaux, on compare les facteurs décimaux ; sinon, on compare directement les exposants. Pour deux nombres négatifs, on compare leurs opposés puis on inverse le résultat.$$,
        'highlights', array[$$comparaison$$, $$notation scientifique$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$A = a×10^m et B = b×10^n étant écrits en notation scientifique : si m=n, alors A et B sont rangés dans le même ordre que a et b ; si m≠n, alors A et B sont rangés dans le même ordre que m et n.$$),
        'example', jsonb_build_object('statement', $$Compare A = 52×10^-6 et B = 6,1×10^-5.$$, 'solution', $$A = 5,2×10^-5 en notation scientifique. Les deux exposants valent -5, donc on compare 5,2 et 6,1 : 5,2 < 6,1, donc A < B.$$),
        'fixation', jsonb_build_object('question', $$Compare A = 3,4×10^-8 et B = 27×10^-9.$$, 'solution', $$B = 2,7×10^-9 en notation scientifique. Comme -8 > -9, on a A > B.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombre décimal d'ordre n$$,
        'body', $$Un nombre décimal d'ordre n est un nombre qui peut s'écrire sous la forme d×10^(-n), où d est un entier relatif et n un entier naturel. Concrètement, un nombre écrit avec exactement n chiffres après la virgule est d'ordre n — et il est aussi d'ordre n+1, n+2, et ainsi de suite.$$,
        'highlights', array[$$nombre décimal d'ordre n$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$n étant un entier naturel, un nombre décimal d'ordre n s'écrit d×10^(-n) avec d entier relatif. Un nombre décimal d'ordre n est aussi un nombre décimal d'ordre supérieur à n.$$),
        'example', jsonb_build_object('statement', $$Donne l'ordre du nombre décimal 0,00048.$$, 'solution', $$0,00048 = 48×10^-5, donc 0,00048 est un nombre décimal d'ordre 5.$$),
        'fixation', jsonb_build_object('question', $$Donne l'ordre du nombre décimal 3,207.$$, 'solution', $$3,207 = 3207×10^-3, donc 3,207 est un nombre décimal d'ordre 3.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un laboratoire scolaire d'Abidjan, une enseignante de SVT explique à sa classe que des micro-organismes rectangulaires et identiques, de longueur 20 micromètres et de largeur 5 micromètres, recouvrent entièrement une lame de verre dont l'aire est de 0,00005 m². On rappelle que 1 micromètre = 10^-6 m.$$,
      'questions', array[
        $$Écris en notation scientifique l'aire, en m², de la lame de verre.$$,
        $$Calcule, en notation scientifique, la surface occupée par un seul micro-organisme (exprimée en m²).$$,
        $$Déduis-en, en notation scientifique, le nombre de micro-organismes nécessaires pour recouvrir entièrement la lame.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris chacun des nombres suivants sous forme de puissance de 10 : 100 000 ; 0,0001 ; 1 000 000 000.$$,
      'hint', $$Compte le nombre de zéros pour trouver l'exposant, en te souvenant que les nombres plus petits que 1 ont un exposant négatif.$$,
      'expected', $$100 000 = 10^5 ; 0,0001 = 10^-4 ; 1 000 000 000 = 10^9.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (4×10^5) × (2×10^-8) et donne le résultat sous la forme a×10^p.$$,
      'hint', $$Multiplie les facteurs décimaux entre eux, puis additionne les exposants des puissances de 10.$$,
      'expected', $$(4×10^5)×(2×10^-8) = (4×2)×10^(5+(-8)) = 8×10^-3.$$
    ),
    jsonb_build_object(
      'question', $$Compare A = 6,4×10^12 et B = 640×10^9 après avoir mis B en notation scientifique.$$,
      'hint', $$Mets d'abord B sous la forme a×10^p avec un seul chiffre non nul avant la virgule.$$,
      'expected', $$B = 6,4×10^11. Comme 12 > 11, on a A > B.$$
    ),
    jsonb_build_object(
      'question', $$Donne l'ordre du nombre décimal −0,000072, puis écris sa notation scientifique.$$,
      'hint', $$Compte le nombre de chiffres après la virgule pour trouver l'ordre ; pour la notation scientifique, garde un seul chiffre non nul avant la virgule.$$,
      'expected', $$−0,000072 = −72×10^-6, donc ce nombre est d'ordre 6. Sa notation scientifique est −7,2×10^-5.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-nombres-decimaux-relatifs';

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

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dès la rentrée de septembre, un élève de 4ème dépose 1500 F dans sa tirelire. Chaque mois suivant, il y ajoute une pièce de 250 F économisée sur son argent de poche. Il aimerait écrire une formule unique qui donne directement le montant de son épargne au bout de n mois, sans refaire le calcul à la main chaque fois — c'est exactement ce que permet le calcul littéral.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Expressions littérales et suppression de parenthèses$$,
        'body', $$Une expression littérale contient une ou plusieurs lettres représentant des nombres. Dans une somme algébrique, on peut supprimer une parenthèse précédée d'un signe + sans rien changer aux termes qu'elle contient ; en revanche, si elle est précédée d'un signe −, il faut changer le signe de chacun de ses termes en la supprimant.$$,
        'highlights', array[$$expression littérale$$, $$suppression de parenthèses$$]::text[],
        'property', jsonb_build_object('label', $$Règles$$, 'text', $$Règle 1 : une parenthèse précédée du signe + (ou d'aucun signe) se supprime sans changer les signes de ses termes. Règle 2 : une parenthèse précédée du signe − se supprime en changeant le signe de chacun de ses termes.$$),
        'example', jsonb_build_object('statement', $$Écris sans parenthèses : x − (3a − b) − (−m + t).$$, 'solution', $$x − (3a − b) − (−m + t) = x − 3a + b + m − t.$$),
        'fixation', jsonb_build_object('question', $$Écris sans parenthèses : (5 − 2a) + (−c + 3) − a.$$, 'solution', $$(5 − 2a) + (−c + 3) − a = 5 − 2a − c + 3 − a = 8 − 3a − c.$$)
      ),
      jsonb_build_object(
        'heading', $$Développement d'un produit$$,
        'body', $$Développer un produit consiste à l'écrire sous la forme d'une somme. Pour un facteur unique multipliant une parenthèse, on distribue ce facteur à chaque terme. Pour deux parenthèses de deux termes chacune, chaque terme de la première se multiplie par chaque terme de la seconde.$$,
        'highlights', array[$$développer$$, $$distributivité$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$a(x+y) = ax+ay et a(x−y) = ax−ay. Pour deux parenthèses : (a+b)(x+y) = ax+ay+bx+by.$$),
        'example', jsonb_build_object('statement', $$Développe (x+4)(y−3).$$, 'solution', $$(x+4)(y−3) = xy − 3x + 4y − 12.$$),
        'fixation', jsonb_build_object('question', $$Développe −3(2x − 5).$$, 'solution', $$−3(2x−5) = −3×2x − 3×(−5) = −6x + 15.$$)
      ),
      jsonb_build_object(
        'heading', $$Produits remarquables$$,
        'body', $$Trois développements reviennent si souvent qu'on les appelle produits remarquables : le carré d'une somme, le carré d'une différence, et le produit d'une somme par une différence. Les connaître par cœur évite de redévelopper à chaque fois terme à terme.$$,
        'highlights', array[$$produits remarquables$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$(a+b)² = a² + 2ab + b² ; (a−b)² = a² − 2ab + b² ; (a+b)(a−b) = a² − b².$$),
        'example', jsonb_build_object('statement', $$Développe (x+6)² et (x+9)(x−9).$$, 'solution', $$(x+6)² = x² + 2×x×6 + 6² = x² + 12x + 36. (x+9)(x−9) = x² − 9² = x² − 81.$$),
        'fixation', jsonb_build_object('question', $$Développe (x−5)².$$, 'solution', $$(x−5)² = x² − 2×x×5 + 5² = x² − 10x + 25.$$)
      ),
      jsonb_build_object(
        'heading', $$Factorisation$$,
        'body', $$Factoriser une somme, c'est l'écrire sous forme d'un produit de facteurs — l'opération inverse du développement. On peut soit mettre en évidence un facteur commun à tous les termes, soit reconnaître la forme d'un produit remarquable pour revenir directement à sa forme factorisée.$$,
        'highlights', array[$$factoriser$$, $$facteur commun$$]::text[],
        'property', jsonb_build_object('label', $$Méthodes$$, 'text', $$Facteur commun : ka+kb = k(a+b). Produits remarquables à l'envers : a²+2ab+b² = (a+b)² ; a²−2ab+b² = (a−b)² ; a²−b² = (a+b)(a−b).$$),
        'example', jsonb_build_object('statement', $$Factorise A = 8x² − 20x, puis B = x² + 16x + 64.$$, 'solution', $$A = 4x×2x − 4x×5 = 4x(2x−5). B = x² + 2×x×8 + 8² = (x+8)².$$),
        'fixation', jsonb_build_object('question', $$Factorise C = x² − 49.$$, 'solution', $$C = x² − 7² = (x+7)(x−7).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un collège veut clôturer un terrain rectangulaire de longueur (x+y) et de largeur z avec un grillage, en prévoyant une porte en bois de 1 m de large. La porte coûte 12 000 F et le mètre de grillage coûte 1 800 F.$$,
      'questions', array[
        $$Justifie que le périmètre du terrain s'écrit 2(x+y) + 2z, puis calcule-le pour x = 12 m, y = 28 m et z = 18 m.$$,
        $$Sachant que la longueur de grillage nécessaire est (périmètre − 1), exprime puis calcule le coût total C des travaux (grillage + porte).$$,
        $$Le trésorier de la coopérative dispose de 130 000 F. Cette somme suffit-elle pour financer les travaux ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris sans parenthèses l'expression 9 − (2x − 5) + (−y + 1).$$,
      'hint', $$Change les signes des termes de la parenthèse précédée d'un −, garde ceux de la parenthèse précédée d'un +.$$,
      'expected', $$9 − (2x − 5) + (−y + 1) = 9 − 2x + 5 − y + 1 = 15 − 2x − y.$$
    ),
    jsonb_build_object(
      'question', $$Développe et réduis (x+3)(x−7).$$,
      'hint', $$Multiplie chaque terme de la première parenthèse par chaque terme de la seconde, puis regroupe les termes semblables.$$,
      'expected', $$(x+3)(x−7) = x² − 7x + 3x − 21 = x² − 4x − 21.$$
    ),
    jsonb_build_object(
      'question', $$Développe (2x−3)² à l'aide d'un produit remarquable.$$,
      'hint', $$Utilise (a−b)² = a² − 2ab + b² avec a = 2x et b = 3.$$,
      'expected', $$(2x−3)² = (2x)² − 2×2x×3 + 3² = 4x² − 12x + 9.$$
    ),
    jsonb_build_object(
      'question', $$Factorise D = 5x(x+2) − (x+2), puis calcule sa valeur pour x = 4.$$,
      'hint', $$Repère le facteur commun (x+2) dans les deux termes de D.$$,
      'expected', $$D = (x+2)(5x−1). Pour x=4 : D = (4+2)(5×4−1) = 6×19 = 114.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-calcul-litteral';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant une soirée culturelle organisée par le club théâtre d'un collège, 90 spectateurs ont assisté au spectacle : ceux qui étaient assis ont payé 400 F le billet, ceux qui sont restés debout ont payé 100 F. La recette totale s'élève à 27 000 F. Pour vérifier les comptes du trésorier, les élèves de 4ème du club doivent poser puis résoudre une équation afin de retrouver le nombre exact de spectateurs assis.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équation : vocabulaire et solutions$$,
        'body', $$Une égalité du type ax+b=c, où x désigne un nombre rationnel inconnu, est appelée équation d'inconnue x. Le morceau à gauche du signe = est le premier membre, celui de droite le second membre. Une solution de l'équation est un nombre qui, mis à la place de x, rend l'égalité vraie.$$,
        'highlights', array[$$équation$$, $$premier membre$$, $$solution$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Dans l'équation ax+b=c : ax+b est le premier membre, c est le second membre. Tout nombre rationnel qui rend l'égalité vraie est une solution de l'équation ; résoudre l'équation, c'est trouver toutes ses solutions.$$),
        'example', jsonb_build_object('statement', $$Vérifie que 5 est solution de l'équation 3x − 4 = 11.$$, 'solution', $$Pour x = 5 : 3×5 − 4 = 15 − 4 = 11, qui est bien le second membre. Donc 5 est solution.$$),
        'fixation', jsonb_build_object('question', $$Vérifie que −2 n'est pas solution de l'équation 4x + 9 = 3.$$, 'solution', $$Pour x = −2 : 4×(−2) + 9 = −8+9 = 1, ce qui n'est pas égal à 3. Donc −2 n'est pas solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Égalités et opérations$$,
        'body', $$Pour transformer une équation sans changer ses solutions, on peut ajouter (ou soustraire) le même nombre aux deux membres, ou multiplier (ou diviser) les deux membres par un même nombre non nul. Ces deux propriétés sont la base de toute résolution d'équation.$$,
        'highlights', array[$$ajouter aux deux membres$$, $$multiplier les deux membres$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Si a=b, alors a+c=b+c pour tout rationnel c. Si a=b, alors ka=kb pour tout rationnel k non nul.$$),
        'example', jsonb_build_object('statement', $$Sachant que 3x+2=8, déduis l'égalité obtenue en soustrayant 2 aux deux membres.$$, 'solution', $$3x+2−2 = 8−2, c'est-à-dire 3x = 6.$$),
        'fixation', jsonb_build_object('question', $$Sachant que 5x=20, déduis l'égalité obtenue en multipliant les deux membres par 1/5.$$, 'solution', $$(1/5)×5x = (1/5)×20, c'est-à-dire x = 4.$$)
      ),
      jsonb_build_object(
        'heading', $$Résoudre une équation du type a+x=b ou ax=b$$,
        'body', $$Une équation a+x=b a pour unique solution la différence b−a. Une équation ax=b (avec a non nul) a pour unique solution le quotient b/a. Ces deux formules couvrent tous les cas d'équations du premier degré ramenées à leur forme la plus simple.$$,
        'highlights', array[$$b−a$$, $$b/a$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$L'équation a+x=b a pour unique solution x = b−a. L'équation ax=b, avec a non nul, a pour unique solution x = b/a.$$),
        'example', jsonb_build_object('statement', $$Résous −9+x=4, puis résous −6x=15.$$, 'solution', $$−9+x=4, donc x = 4−(−9) = 13. −6x=15, donc x = 15/(−6) = −5/2.$$),
        'fixation', jsonb_build_object('question', $$Résous x+17=5, puis résous 8x=−28.$$, 'solution', $$x+17=5, donc x = 5−17 = −12. 8x=−28, donc x = −28/8 = −7/2.$$)
      ),
      jsonb_build_object(
        'heading', $$Inéquations et résolution$$,
        'body', $$Une inéquation du type ax+b>c (ou <c) se résout comme une équation en ajoutant ou soustrayant un même nombre aux deux membres. Mais dès qu'on multiplie ou divise les deux membres par un nombre négatif, le sens de l'inégalité doit être inversé ; il reste inchangé si le nombre est positif.$$,
        'highlights', array[$$inéquation$$, $$sens de l'inégalité$$]::text[],
        'property', jsonb_build_object('label', $$Règles$$, 'text', $$Ajouter (ou soustraire) un même nombre aux deux membres conserve le sens de l'inégalité. Multiplier (ou diviser) par un nombre positif conserve le sens ; multiplier (ou diviser) par un nombre négatif inverse le sens.$$),
        'example', jsonb_build_object('statement', $$Résous −5x+2>17.$$, 'solution', $$−5x+2>17, donc −5x>15. On divise par −5 (négatif), le sens s'inverse : x<−3.$$),
        'fixation', jsonb_build_object('question', $$Résous 4x−9≤3.$$, 'solution', $$4x≤12. On divise par 4 (positif), le sens ne change pas : x≤3.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux frères, Yao et Séka, cultivent ensemble 5 tonnes de cacao qu'ils livrent à leur coopérative de Divo. Yao a produit plus de 3 tonnes. Après avoir payé Yao, le gérant annonce qu'il ne reste que 980 000 F dans la caisse, alors que le cacao se vend 700 F le kilogramme.$$,
      'questions', array[
        $$En notant x le poids, en kg, de la production de Yao, écris une inéquation traduisant que sa production dépasse 3 tonnes.$$,
        $$Déduis-en un encadrement du poids de la production de Séka, sachant que le total des deux productions est 5 tonnes.$$,
        $$Détermine si le gérant peut payer intégralement la production de Séka avec les 980 000 F restants, en justifiant ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Vérifie si 7 est solution de l'équation 2x + 5 = 19.$$,
      'hint', $$Remplace x par 7 dans le premier membre et compare avec le second membre.$$,
      'expected', $$2×7+5 = 14+5 = 19, qui est bien le second membre. Donc 7 est solution.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation −7 + x = −2.$$,
      'hint', $$Utilise la propriété : l'équation a+x=b a pour solution x = b−a.$$,
      'expected', $$x = −2 − (−7) = 5.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation 9x = −6.$$,
      'hint', $$Utilise la propriété : l'équation ax=b a pour solution x = b/a.$$,
      'expected', $$x = −6/9 = −2/3.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'inéquation −3x − 4 > 8.$$,
      'hint', $$Isole d'abord le terme en x, puis fais attention au sens de l'inégalité en divisant par un nombre négatif.$$,
      'expected', $$−3x > 12. On divise par −3 (négatif), le sens s'inverse : x < −4.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-equations-inequations-q';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une entreprise de Korhogo a accueilli cinq stagiaires d'un lycée technique et leur a attribué des notes régulières tout au long du stage. À la fin, l'entreprise veut embaucher les trois meilleurs stagiaires en les classant par mérite. Le petit frère de l'un d'eux, élève en 4ème, se propose de calculer les moyennes de chacun pour savoir si son frère sera repris.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mode d'une série statistique$$,
        'body', $$Le mode d'une série statistique est la modalité qui possède le plus grand effectif, c'est-à-dire la valeur la plus fréquemment observée. Une série peut avoir un seul mode, mais aussi plusieurs modalités à égalité, auquel cas elle admet plusieurs modes.$$,
        'highlights', array[$$mode$$, $$effectif$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le mode d'une série statistique est toute modalité ayant le plus grand effectif (ou la plus grande fréquence). Une série statistique peut avoir un ou plusieurs modes.$$),
        'example', jsonb_build_object('statement', $$Une classe compte 3 élèves nés en janvier, 9 en mars et 5 en juin. Donne le mode de cette série.$$, 'solution', $$Le plus grand effectif est 9, associé au mois de mars. Le mode de cette série est donc mars.$$),
        'fixation', jsonb_build_object('question', $$Un sondage donne : Bio 12, Anglais 18, Sport 18, Musique 6. Donne le ou les modes de cette série.$$, 'solution', $$Le plus grand effectif est 18, atteint deux fois : la série a deux modes, Anglais et Sport.$$)
      ),
      jsonb_build_object(
        'heading', $$Moyenne d'une série statistique$$,
        'body', $$La moyenne d'une série est le quotient de la somme de toutes les valeurs par l'effectif total. Quand une même valeur revient plusieurs fois, on utilise sa moyenne pondérée : on multiplie chaque valeur par son effectif, on additionne ces produits, puis on divise par l'effectif total.$$,
        'highlights', array[$$moyenne$$, $$moyenne pondérée$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Moyenne = (somme des valeurs) ÷ (effectif total). Moyenne pondérée = (somme des produits valeur×effectif) ÷ (effectif total).$$),
        'example', jsonb_build_object('statement', $$Un stagiaire a obtenu les notes 14 ; 16 ; 12 ; 14 ; 13 ; 14. Calcule sa moyenne.$$, 'solution', $$Moyenne = (14+16+12+14+13+14)/6 = 83/6 ≈ 13,83.$$),
        'fixation', jsonb_build_object('question', $$Un tableau donne : note 8 (effectif 3), note 12 (effectif 5), note 15 (effectif 2). Calcule la moyenne pondérée.$$, 'solution', $$Moyenne = (8×3+12×5+15×2)/(3+5+2) = (24+60+30)/10 = 114/10 = 11,4.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire un diagramme semi-circulaire$$,
        'body', $$Un diagramme semi-circulaire répartit les effectifs d'une série en secteurs angulaires découpés dans un demi-disque, dont la somme des mesures d'angle vaut 180°. Chaque modalité reçoit un secteur dont la mesure est proportionnelle à son effectif.$$,
        'highlights', array[$$diagramme semi-circulaire$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$Mesure de l'angle du secteur = (180° × effectif de la modalité) ÷ effectif total. Dans un diagramme semi-circulaire, la somme de toutes les mesures d'angle vaut exactement 180°.$$),
        'example', jsonb_build_object('statement', $$Un vendeur a écoulé 90 articles : 36 bananes, 27 mangues et 27 papayes. Calcule la mesure d'angle du secteur des bananes.$$, 'solution', $$Angle = 180×36/90 = 72°.$$),
        'fixation', jsonb_build_object('question', $$Dans la même série (90 articles au total), calcule la mesure d'angle du secteur des mangues (effectif 27).$$, 'solution', $$Angle = 180×27/90 = 54°.$$),
        'table', jsonb_build_object(
          'headers', array[$$Fruit$$, $$Effectif$$, $$Angle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Bananes$$, $$36$$, $$72°$$),
            jsonb_build_array($$Mangues$$, $$27$$, $$54°$$),
            jsonb_build_array($$Papayes$$, $$27$$, $$54°$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Lire un diagramme semi-circulaire$$,
        'body', $$Face à un diagramme semi-circulaire déjà tracé, on peut retrouver l'effectif de chaque modalité connaissant l'effectif total, ou retrouver sa fréquence, à l'aide d'un tableau de proportionnalité entre la mesure d'angle (sur 180°) et l'effectif (ou la fréquence) cherchés.$$,
        'highlights', array[$$tableau de proportionnalité$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour retrouver un effectif : effectif de la modalité = (mesure d'angle × effectif total) ÷ 180°. Pour retrouver une fréquence : fréquence de la modalité = mesure d'angle ÷ 180°.$$),
        'example', jsonb_build_object('statement', $$Un diagramme semi-circulaire de 60 votants donne un secteur de 108° pour le candidat A. Calcule son effectif et sa fréquence.$$, 'solution', $$Effectif = 108×60/180 = 36. Fréquence = 108/180 = 0,6, soit 60 %.$$),
        'fixation', jsonb_build_object('question', $$Dans le même diagramme (60 votants), un secteur de 36° correspond au candidat B. Calcule son effectif.$$, 'solution', $$Effectif = 36×60/180 = 12.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour préparer une soirée de fin d'année, une classe de 4ème vote pour l'artiste qu'elle préfère parmi quatre propositions. Le dépouillement donne : 14 voix pour l'artiste A, 21 pour B, 9 pour C et 16 pour D.$$,
      'questions', array[
        $$Calcule l'effectif total des votants, puis donne le mode de cette série (l'artiste le plus voté).$$,
        $$Calcule la mesure d'angle, dans un diagramme semi-circulaire, du secteur associé à l'artiste B.$$,
        $$Calcule la fréquence, en pourcentage, des votes obtenus par l'artiste C.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un tableau donne : modalité Football (effectif 22), Basketball (effectif 30), Judo (effectif 30), Natation (effectif 8). Donne le ou les modes de cette série.$$,
      'hint', $$Cherche la ou les modalités qui ont le plus grand effectif.$$,
      'expected', $$Le plus grand effectif est 30, atteint deux fois : la série a deux modes, Basketball et Judo.$$
    ),
    jsonb_build_object(
      'question', $$Une série donne : valeur 5 (effectif 4), valeur 9 (effectif 6), valeur 12 (effectif 10). Calcule la moyenne pondérée.$$,
      'hint', $$Multiplie chaque valeur par son effectif, additionne les produits, puis divise par l'effectif total.$$,
      'expected', $$Moyenne = (5×4+9×6+12×10)/(4+6+10) = (20+54+120)/20 = 194/20 = 9,7.$$
    ),
    jsonb_build_object(
      'question', $$Sur 120 élèves interrogés sur leur matière préférée, 40 préfèrent les mathématiques. Calcule la mesure d'angle du secteur correspondant dans un diagramme semi-circulaire.$$,
      'hint', $$Utilise la formule : angle = (180° × effectif) ÷ effectif total.$$,
      'expected', $$Angle = 180×40/120 = 60°.$$
    ),
    jsonb_build_object(
      'question', $$Un diagramme semi-circulaire de 50 clients donne un secteur de 90° pour un produit donné. Calcule l'effectif et la fréquence, en pourcentage, de ce produit.$$,
      'hint', $$Utilise le tableau de proportionnalité entre la mesure d'angle sur 180° et l'effectif ou la fréquence.$$,
      'expected', $$Effectif = 90×50/180 = 25. Fréquence = 90/180 = 0,5, soit 50 %.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-statistique';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour le logo du club de mathématiques de son collège, une élève de 4ème propose un motif fait d'un cercle et de plusieurs droites : deux droites parallèles, et une sécante qui les coupe toutes les deux. Le meilleur élève de la classe affirme qu'à l'intérieur de cette figure, plusieurs angles ont exactement la même mesure qu'un angle donné. Ses camarades se lancent alors dans une recherche méthodique pour retrouver tous ces angles égaux.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Angles alternes-internes$$,
        'body', $$Quand une sécante coupe deux droites en deux points distincts, elle forme quatre angles en chaque point. Deux de ces angles, situés entre les deux droites mais de part et d'autre de la sécante, sont appelés angles alternes-internes. Si les deux droites sont parallèles, ces angles ont toujours la même mesure — et réciproquement, deux angles alternes-internes égaux prouvent que les droites sont parallèles.$$,
        'highlights', array[$$angles alternes-internes$$]::text[],
        'property', jsonb_build_object('label', $$Propriété et réciproque$$, 'text', $$Si deux angles alternes-internes sont formés par deux droites parallèles et une sécante, alors ils ont la même mesure. Réciproquement, si deux droites forment avec une sécante deux angles alternes-internes de même mesure, alors ces deux droites sont parallèles.$$),
        'example', jsonb_build_object('statement', $$Les droites (AE) et (KI) sont parallèles ; la droite (OM) les coupe respectivement en O et M. Que peut-on dire des angles AOM et OMI, alternes-internes ?$$, 'solution', $$Comme (AE) et (KI) sont parallèles et que AOM et OMI sont alternes-internes formés par la sécante (OM), ces deux angles ont la même mesure.$$),
        'fixation', jsonb_build_object('question', $$Deux droites (D) et (L) sont coupées par une sécante en A et B. Les angles EAB et ABF, alternes-internes, ont la même mesure. Que peut-on en conclure sur (D) et (L) ?$$, 'solution', $$Deux angles alternes-internes de même mesure prouvent que les droites (D) et (L) sont parallèles.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 20, 'y', 50, 'label', $$D1$$),
            jsonb_build_object('x', 180, 'y', 50, 'label', $$$$),
            jsonb_build_object('x', 20, 'y', 130, 'label', $$D2$$),
            jsonb_build_object('x', 180, 'y', 130, 'label', $$$$),
            jsonb_build_object('x', 70, 'y', 50, 'label', $$A$$),
            jsonb_build_object('x', 130, 'y', 130, 'label', $$B$$),
            jsonb_build_object('x', 40, 'y', 10, 'label', $$$$),
            jsonb_build_object('x', 160, 'y', 170, 'label', $$$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(2,3), jsonb_build_array(6,7))
        )
      ),
      jsonb_build_object(
        'heading', $$Angles correspondants$$,
        'body', $$Deux angles sont dits correspondants quand ils occupent la même position par rapport à la sécante et à leur droite respective (par exemple, tous deux « en haut à droite » de leur point d'intersection). Comme pour les angles alternes-internes, deux droites parallèles coupées par une sécante donnent des angles correspondants de même mesure, et la réciproque est vraie aussi.$$,
        'highlights', array[$$angles correspondants$$]::text[],
        'property', jsonb_build_object('label', $$Propriété et réciproque$$, 'text', $$Si deux angles correspondants sont formés par deux droites parallèles et une sécante, alors ils ont la même mesure. Réciproquement, si deux droites forment avec une sécante deux angles correspondants de même mesure, alors ces deux droites sont parallèles.$$),
        'example', jsonb_build_object('statement', $$Les droites (AB) et (DF) sont parallèles et coupées par la sécante (BD). L'angle BDF mesure 68°. Que vaut l'angle correspondant HBG ?$$, 'solution', $$Comme (AB) et (DF) sont parallèles, l'angle correspondant HBG a la même mesure que BDF, donc HBG mesure 68°.$$),
        'fixation', jsonb_build_object('question', $$Une sécante coupe deux droites (D) et (L) en A et B, formant deux angles correspondants KAB et TBH de même mesure. Que peut-on en déduire sur (D) et (L) ?$$, 'solution', $$Deux angles correspondants de même mesure prouvent que les droites (D) et (L) sont parallèles.$$)
      ),
      jsonb_build_object(
        'heading', $$Angle au centre et arc intercepté$$,
        'body', $$Dans un cercle, un angle au centre est un angle dont le sommet est le centre du cercle. Un tel angle « intercepte » un arc de cercle, c'est-à-dire la portion du cercle comprise entre ses deux côtés. La longueur de cet arc est proportionnelle à la mesure de l'angle au centre qui l'intercepte.$$,
        'highlights', array[$$angle au centre$$, $$arc intercepté$$]::text[],
        'property', jsonb_build_object('label', $$Définition et formule$$, 'text', $$Un angle au centre a pour sommet le centre du cercle. Pour un cercle de rayon r, la longueur de l'arc intercepté par un angle au centre de mesure m (en degrés) vaut : longueur = π×r×(m/180°).$$),
        'example', jsonb_build_object('statement', $$Un cercle de centre O a un rayon de 3 cm. A et B sont deux points du cercle tels que l'angle AOB mesure 60°. Calcule la longueur de l'arc AB (on prendra π ≈ 3,14).$$, 'solution', $$Longueur AB = 3×3,14×(60/180) = 3×3,14×(1/3) = 3,14 cm.$$),
        'fixation', jsonb_build_object('question', $$Un cercle de centre O a un rayon de 5 cm. Un angle au centre mesure 90°. Calcule la longueur de l'arc intercepté (π ≈ 3,14).$$, 'solution', $$Longueur = 5×3,14×(90/180) = 5×3,14×0,5 = 7,85 cm.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'circle', jsonb_build_object('cx', 100, 'cy', 100, 'r', 70),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 100, 'label', $$O$$),
            jsonb_build_object('x', 170, 'y', 100, 'label', $$A$$),
            jsonb_build_object('x', 135, 'y', 39, 'label', $$B$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Cordes et arcs de même longueur$$,
        'body', $$Une corde d'un cercle est un segment reliant deux points du cercle. Il existe un lien direct entre deux angles au centre de même mesure, les arcs qu'ils interceptent et les cordes qui sous-tendent ces arcs : les trois notions « avancent ensemble ».$$,
        'highlights', array[$$corde$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Dans un même cercle : si deux angles au centre ont la même mesure, alors ils interceptent deux arcs de même longueur, et les cordes qui sous-tendent ces arcs ont aussi la même longueur (et réciproquement dans chaque cas).$$),
        'example', jsonb_build_object('statement', $$Dans un cercle de centre O, les angles au centre AOB et COD ont la même mesure. Que peut-on dire des cordes [AB] et [CD] ?$$, 'solution', $$Deux angles au centre de même mesure interceptent des arcs de même longueur, sous-tendus par des cordes de même longueur : donc AB = CD.$$),
        'fixation', jsonb_build_object('question', $$Dans un cercle de centre E, les cordes [IJ] et [KS] ont la même longueur. Que peut-on dire des angles au centre IEJ et KES ?$$, 'solution', $$Des cordes de même longueur sous-tendent des arcs de même longueur, interceptés par des angles au centre de même mesure : donc les angles IEJ et KES ont la même mesure.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur le motif du logo, O est le centre du cercle ; les droites (AC) et (FD) sont parallèles, tout comme les droites (OF) et (CE). Le meilleur élève affirme que plusieurs angles de la figure ont la même mesure que l'angle AOF.$$,
      'questions', array[
        $$Nomme un angle opposé par le sommet à l'angle AOF, et justifie pourquoi il a la même mesure.$$,
        $$Nomme un angle correspondant à AOF, formé par les parallèles (OF) et (CE) avec une sécante commune, et justifie l'égalité des mesures.$$,
        $$Nomme un angle alterne-interne à AOF, formé par les parallèles (AC) et (FD), et justifie l'égalité des mesures.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Deux droites parallèles (D1) et (D2) sont coupées par une sécante. Deux angles alternes-internes sont formés, et l'un mesure 74°. Calcule la mesure de l'autre.$$,
      'hint', $$Relis la propriété : deux angles alternes-internes formés par des droites parallèles ont la même mesure.$$,
      'expected', $$Comme les droites sont parallèles, les angles alternes-internes sont égaux : l'autre mesure aussi 74°.$$
    ),
    jsonb_build_object(
      'question', $$Deux droites parallèles sont coupées par une sécante. Deux angles correspondants sont formés, et l'un mesure 105°. Calcule la mesure de l'autre.$$,
      'hint', $$Relis la propriété des angles correspondants formés par des droites parallèles.$$,
      'expected', $$Comme les droites sont parallèles, les angles correspondants sont égaux : l'autre mesure aussi 105°.$$
    ),
    jsonb_build_object(
      'question', $$Un cercle de centre O a un rayon de 4 cm. Un angle au centre mesure 45°. Calcule la longueur de l'arc intercepté (π ≈ 3,14).$$,
      'hint', $$Utilise la formule : longueur = π×r×(mesure de l'angle/180°).$$,
      'expected', $$Longueur = 4×3,14×(45/180) = 4×3,14×0,25 = 3,14 cm.$$
    ),
    jsonb_build_object(
      'question', $$Dans un cercle de centre O, les cordes [MN] et [PQ] ont la même longueur. Compare les angles au centre MON et POQ, puis les arcs MN et PQ, et justifie chaque comparaison.$$,
      'hint', $$Relis les propriétés reliant cordes, arcs et angles au centre de même mesure.$$,
      'expected', $$Des cordes de même longueur sous-tendent des arcs de même longueur, eux-mêmes interceptés par des angles au centre de même mesure. Donc MON = POQ et les arcs MN et PQ ont la même longueur.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-angles';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un planteur de la région de Bonon veut faire tracer le chemin le plus court reliant son champ à la route principale, bitumée et rectiligne à cet endroit, pour réduire ses frais de transport. Il confie ce tracé à son fils, élève de 4ème, qui doit trouver, sur la carte, le segment le plus court joignant le champ à la route — c'est-à-dire la distance du point représentant le champ à la droite représentant la route.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Distance d'un point à une droite$$,
        'body', $$Parmi tous les segments reliant un point K, extérieur à une droite (D), à un point quelconque de (D), un seul est le plus court : celui qui rejoint (D) perpendiculairement. Cette longueur minimale s'appelle la distance du point K à la droite (D).$$,
        'highlights', array[$$distance d'un point à une droite$$, $$perpendiculaire$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Si M est le pied de la perpendiculaire à (D) passant par K, alors KM est la distance de K à la droite (D). Pour tout autre point G de (D) distinct de M, on a KM < KG.$$),
        'example', jsonb_build_object('statement', $$La droite (SH) est perpendiculaire à la droite (L) au point H. Que représente la longueur SH ?$$, 'solution', $$Comme (SH) est perpendiculaire à (L) en H, SH est la distance du point S à la droite (L).$$),
        'fixation', jsonb_build_object('question', $$Un point A est relié perpendiculairement à une droite (D) par un segment [AH]. Un autre point G de (D), distinct de H, est tel que AG = 9 cm et AH = 6 cm. Explique pourquoi c'est bien AH, et non AG, qui est la distance de A à (D).$$, 'solution', $$AH est la distance de A à (D) car [AH] est le segment perpendiculaire à (D) ; pour tout autre point G de (D), on a AH < AG, ce que confirment les 6 cm et 9 cm donnés.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(220, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 110, 'y', 30, 'label', $$K$$),
            jsonb_build_object('x', 110, 'y', 120, 'label', $$M$$),
            jsonb_build_object('x', 20, 'y', 120, 'label', $$$$),
            jsonb_build_object('x', 200, 'y', 120, 'label', $$G$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(2,3)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,3)),
          'rightAngleAt', jsonb_build_array(1)
        )
      ),
      jsonb_build_object(
        'heading', $$Distance de deux droites parallèles$$,
        'body', $$Pour deux droites parallèles (L) et (D), on choisit un point A sur (L) et un point B sur (D) tels que la droite (AB) soit perpendiculaire à (L) ; la longueur AB, appelée distance des deux droites parallèles, est alors la même quel que soit l'endroit où l'on a choisi de la mesurer.$$,
        'highlights', array[$$droites parallèles$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$(L) et (D) étant parallèles, A un point de (L) et B un point de (D) tels que (AB) soit perpendiculaire à (L), la distance AB est appelée distance des droites parallèles (L) et (D).$$),
        'example', jsonb_build_object('statement', $$(D) et (Δ) sont deux droites parallèles ; A appartient à (D), B appartient à (Δ), (AB) est perpendiculaire à (Δ) et AB = 2,6 cm. Que représente cette longueur ?$$, 'solution', $$AB est la distance des deux droites parallèles (D) et (Δ), soit 2,6 cm.$$),
        'fixation', jsonb_build_object('question', $$Deux murs parallèles d'un couloir sont espacés de 1,8 m à l'entrée. Quelle est la distance entre ces mêmes murs à 15 m plus loin ?$$, 'solution', $$Les murs sont parallèles, donc leur distance est constante quel que soit l'endroit mesuré : elle reste 1,8 m.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractérisation de la bissectrice — propriété directe$$,
        'body', $$La bissectrice d'un angle possède une propriété de distance remarquable : tout point qui se trouve sur elle est automatiquement à la même distance des deux côtés (ou de leurs supports) de cet angle, sans qu'il soit nécessaire de le mesurer.$$,
        'highlights', array[$$bissectrice$$, $$équidistant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si un point appartient à la bissectrice d'un angle, alors il est équidistant des supports des côtés de cet angle.$$),
        'example', jsonb_build_object('statement', $$M est un point de la bissectrice (D) de l'angle AOB. Que peut-on dire des distances de M aux droites (OA) et (OB) ?$$, 'solution', $$Comme M appartient à la bissectrice de l'angle AOB, il est équidistant des supports (OA) et (OB) : distance de M à (OA) = distance de M à (OB).$$),
        'fixation', jsonb_build_object('question', $$La droite (OM) est la bissectrice de l'angle AOB, et M appartient à cette droite. Justifie que M est équidistant des droites (OA) et (OB).$$, 'solution', $$M appartient à la bissectrice (OM) de l'angle AOB, donc d'après la propriété, M est équidistant des supports des côtés (OA) et (OB) de cet angle.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractérisation de la bissectrice — réciproque$$,
        'body', $$La réciproque permet de repérer une bissectrice sans la construire directement : si un point se révèle équidistant des deux côtés d'un angle, on peut affirmer avec certitude qu'il se trouve sur la bissectrice de cet angle.$$,
        'highlights', array[$$réciproque$$]::text[],
        'property', jsonb_build_object('label', $$Propriété (réciproque)$$, 'text', $$Si un point est équidistant des supports des côtés d'un angle, alors ce point appartient à la bissectrice de cet angle.$$),
        'example', jsonb_build_object('statement', $$(C) est un cercle de centre M ; A et B sont deux points de (C) situés respectivement sur les côtés d'un angle AOB, avec donc MA = MB. Que peut-on en déduire sur M ?$$, 'solution', $$MA = MB, donc M est équidistant des supports des côtés de l'angle AOB. D'après la réciproque, M appartient à la bissectrice de cet angle.$$),
        'fixation', jsonb_build_object('question', $$Un point S est à égale distance des droites (PQ) et (QR), côtés de l'angle PQR. Que peut-on affirmer sur S ?$$, 'solution', $$S étant équidistant des supports (PQ) et (QR), il appartient, d'après la réciproque, à la bissectrice de l'angle PQR.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un nouveau collège, le mât du drapeau doit être planté au centre d'une dalle circulaire, elle-même installée dans un espace triangulaire ABC, de sorte que le mât soit à égale distance des trois côtés du triangle. On donne AB = 24 m, AC = 20 m et BC = 16 m.$$,
      'questions', array[
        $$Justifie que le centre O de la dalle circulaire appartient à la bissectrice de l'angle ABC et à la bissectrice de l'angle ACB.$$,
        $$Décris un programme de construction du point O à partir de cette propriété.$$,
        $$Sachant que le rayon de la dalle est r, exprime en fonction de r l'aire de chacun des triangles AOB, AOC et BOC, puis déduis-en l'aire totale du triangle ABC en fonction de r.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un point A est relié perpendiculairement à une route (D) par un segment [AH] de 28 m. Un autre point P de la route est tel que AP = 41 m. Donne la distance de A à la route (D), et justifie.$$,
      'hint', $$Relis la définition : la distance d'un point à une droite est la longueur du segment perpendiculaire à cette droite.$$,
      'expected', $$La distance de A à (D) est AH = 28 m, car [AH] est le segment perpendiculaire à la route ; c'est nécessairement le plus court, donc AH < AP.$$
    ),
    jsonb_build_object(
      'question', $$Deux rails de chemin de fer parallèles sont espacés de 1,435 m à un endroit donné. Quelle est leur distance à 300 m de là ?$$,
      'hint', $$Relis la propriété : la distance entre deux droites parallèles est constante, où qu'on la mesure.$$,
      'expected', $$Les rails restent parallèles, donc leur distance reste 1,435 m, quel que soit l'endroit choisi.$$
    ),
    jsonb_build_object(
      'question', $$Un point M appartient à la bissectrice de l'angle XOY. Que peut-on affirmer sur les distances de M aux droites (OX) et (OY) ? Justifie avec la propriété directe.$$,
      'hint', $$Applique directement la propriété : appartenir à la bissectrice entraîne l'équidistance.$$,
      'expected', $$M appartenant à la bissectrice de l'angle XOY, il est équidistant des supports (OX) et (OY) : distance de M à (OX) = distance de M à (OY).$$
    ),
    jsonb_build_object(
      'question', $$Un point T est équidistant des droites (RS) et (RU), côtés de l'angle SRU. Que peut-on affirmer sur T ? Justifie avec la réciproque.$$,
      'hint', $$Applique la réciproque de la caractérisation de la bissectrice.$$,
      'expected', $$T étant équidistant des supports (RS) et (RU), il appartient, d'après la réciproque, à la bissectrice de l'angle SRU.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-distances';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir remporté un tournoi inter-établissements, les joueurs d'un collège reçoivent des médailles gravées de figures géométriques faites de cercles et de droites. Des élèves de 4ème veulent reproduire fidèlement ces figures, mais pour cela, ils doivent d'abord savoir reconnaître comment une droite peut se positionner par rapport à un cercle, et comment construire précisément une tangente.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Positions relatives d'une droite et d'un cercle$$,
        'body', $$Pour un cercle de centre O et de rayon r, et une droite (D), on compare la distance OH (H étant le pied de la perpendiculaire à (D) issue de O) au rayon r. Trois cas se présentent : si OH est plus petite que r, la droite coupe le cercle en deux points (elle est sécante) ; si OH est égale à r, elle le touche en un seul point (elle est tangente) ; si OH est plus grande que r, elle ne le rencontre pas (elle est disjointe du cercle).$$,
        'highlights', array[$$sécante$$, $$tangente$$, $$disjointe$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Si OH < r, (D) et le cercle sont sécants (deux points communs). Si OH = r, ils sont tangents (un seul point commun). Si OH > r, ils sont disjoints (aucun point commun). Chacune de ces propriétés admet aussi sa réciproque.$$),
        'example', jsonb_build_object('statement', $$Un cercle de centre I a un rayon de 3 cm. Une droite (L) est telle qu'un point K de (L) vérifie IK = 5 cm et (IK) est perpendiculaire à (L). Détermine la position relative de (L) et du cercle.$$, 'solution', $$La distance de I à (L) est IK = 5 cm, or 5 > 3, donc (L) et le cercle sont disjoints.$$),
        'fixation', jsonb_build_object('question', $$Un cercle de centre O a un rayon de 4,5 cm. Une droite (D) est telle que la distance de O à (D) vaut 4,5 cm. Quelle est la position relative de (D) et du cercle ?$$, 'solution', $$La distance de O à (D) est égale au rayon (4,5 cm = 4,5 cm), donc (D) est tangente au cercle.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'circle', jsonb_build_object('cx', 100, 'cy', 100, 'r', 60),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 100, 'label', $$O$$),
            jsonb_build_object('x', 100, 'y', 40, 'label', $$H$$),
            jsonb_build_object('x', 20, 'y', 40, 'label', $$$$),
            jsonb_build_object('x', 180, 'y', 40, 'label', $$$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(2,3)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,1)),
          'rightAngleAt', jsonb_build_array(1)
        )
      ),
      jsonb_build_object(
        'heading', $$Droite des milieux dans un triangle$$,
        'body', $$Dans un triangle, la droite qui joint les milieux de deux côtés est toujours parallèle au troisième côté, et sa longueur en vaut exactement la moitié. Cette propriété se retourne aussi : si une droite passe par le milieu d'un côté et qu'elle est parallèle à un deuxième côté, alors elle passe forcément par le milieu du troisième côté.$$,
        'highlights', array[$$droite des milieux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété et réciproque$$, 'text', $$Dans un triangle ABC, si C' est le milieu de [AB] et B' le milieu de [AC], alors (B'C') est parallèle à (BC) et B'C' = BC/2. Réciproquement, si une droite passe par le milieu d'un côté et est parallèle au support d'un autre côté, alors elle passe par le milieu du troisième côté.$$),
        'example', jsonb_build_object('statement', $$Dans un triangle ABC, D est le milieu de [AB], E est le milieu de [AC], et BC = 18 cm. Calcule DE et justifie que (DE) est parallèle à (BC).$$, 'solution', $$D et E étant les milieux de deux côtés, la droite (DE) est parallèle à (BC) d'après le théorème des milieux, et DE = BC/2 = 18/2 = 9 cm.$$),
        'fixation', jsonb_build_object('question', $$Dans un triangle rectangle en B, la médiatrice (D) de [BC] coupe l'hypoténuse [AC] en un point I. Justifie que I est le milieu de [AC].$$, 'solution', $$(AB) et (D) sont toutes deux perpendiculaires à (BC), donc elles sont parallèles. Comme (D) passe par le milieu de [BC] et est parallèle à (AB), elle passe par le milieu de [AC] ; or (D) passe par I sur [AC], donc I est ce milieu.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 20, 'label', $$A$$),
            jsonb_build_object('x', 20, 'y', 140, 'label', $$B$$),
            jsonb_build_object('x', 180, 'y', 140, 'label', $$C$$),
            jsonb_build_object('x', 60, 'y', 80, 'label', $$D$$),
            jsonb_build_object('x', 140, 'y', 80, 'label', $$E$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,0), jsonb_build_array(3,4))
        )
      ),
      jsonb_build_object(
        'heading', $$Hauteurs, orthocentre, médianes et centre de gravité$$,
        'body', $$Une hauteur d'un triangle est la droite passant par un sommet et perpendiculaire au côté opposé ; les trois hauteurs se coupent toujours en un même point, l'orthocentre. Une médiane relie un sommet au milieu du côté opposé ; les trois médianes se coupent elles aussi en un même point, le centre de gravité, situé aux deux tiers de chaque médiane à partir du sommet.$$,
        'highlights', array[$$orthocentre$$, $$centre de gravité$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Les trois hauteurs d'un triangle sont concourantes en un point appelé orthocentre. Les trois médianes d'un triangle sont concourantes en un point appelé centre de gravité, situé aux 2/3 de chaque médiane à partir du sommet : si G est le centre de gravité et (AA') une médiane, alors AG = (2/3)×AA'.$$),
        'example', jsonb_build_object('statement', $$G est le centre de gravité d'un triangle ABC, et la médiane issue de A mesure AA' = 12 cm. Calcule AG.$$, 'solution', $$AG = (2/3)×AA' = (2/3)×12 = 8 cm.$$),
        'fixation', jsonb_build_object('question', $$G est le centre de gravité d'un triangle DEF, et la médiane issue de D mesure DD' = 9 cm. Calcule DG.$$, 'solution', $$DG = (2/3)×DD' = (2/3)×9 = 6 cm.$$)
      ),
      jsonb_build_object(
        'heading', $$Bissectrices et cercle inscrit$$,
        'body', $$Le cercle inscrit dans un triangle est le cercle intérieur au triangle, tangent aux supports de ses trois côtés. Ce cercle existe toujours et son centre est unique : c'est le point de concours des trois bissectrices des angles du triangle.$$,
        'highlights', array[$$cercle inscrit$$, $$bissectrices$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les trois bissectrices des angles d'un triangle sont concourantes ; leur point de concours est le centre du cercle inscrit dans ce triangle, tangent aux supports des trois côtés.$$),
        'example', jsonb_build_object('statement', $$I est le point de concours des bissectrices d'un triangle ABC. Que représente le point I pour ce triangle ?$$, 'solution', $$I est le centre du cercle inscrit dans le triangle ABC, c'est-à-dire le cercle tangent aux supports des trois côtés du triangle.$$),
        'fixation', jsonb_build_object('question', $$Pour construire le cercle inscrit dans un triangle MNP, quelles droites suffit-il de tracer pour situer son centre ?$$, 'solution', $$Il suffit de tracer les bissectrices d'au moins deux angles du triangle MNP ; leur point d'intersection est le centre du cercle inscrit.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un géomètre a réalisé un schéma pour calculer la hauteur d'un immeuble, avec les points B, F, G, A et C tels que G est le milieu de [CA] et F est le milieu de [BA], et où l'on sait que [GF] et [BC] sont deux segments liés par le théorème des milieux.$$,
      'questions', array[
        $$Rappelle la propriété qui permet d'affirmer que les supports de [GF] et de [BC] sont parallèles.$$,
        $$Sachant que GF = 21 m, calcule la hauteur BC de l'immeuble à l'aide du théorème des milieux.$$,
        $$Explique pourquoi il suffisait de mesurer GF, plus accessible depuis le sol, pour connaître BC.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un cercle de centre E a pour rayon 3,5 cm. Une droite (T) est telle que la distance de E à (T) vaut 3,5 cm. Quelle est la position relative de (T) et du cercle ?$$,
      'hint', $$Compare la distance du centre à la droite avec le rayon du cercle.$$,
      'expected', $$La distance de E à (T) est égale au rayon (3,5 cm = 3,5 cm), donc (T) est tangente au cercle.$$
    ),
    jsonb_build_object(
      'question', $$Dans un triangle GHK, M est le milieu de [GH] et N est le milieu de [GK], avec HK = 22 cm. Calcule MN.$$,
      'hint', $$Applique le théorème des milieux : le segment joignant les milieux vaut la moitié du troisième côté.$$,
      'expected', $$D'après le théorème des milieux, MN = HK/2 = 22/2 = 11 cm.$$
    ),
    jsonb_build_object(
      'question', $$G est le centre de gravité d'un triangle XYZ, et la médiane issue de X mesure XX' = 15 cm. Calcule XG.$$,
      'hint', $$Relis la propriété : le centre de gravité est situé aux deux tiers de chaque médiane à partir du sommet.$$,
      'expected', $$XG = (2/3)×XX' = (2/3)×15 = 10 cm.$$
    ),
    jsonb_build_object(
      'question', $$Un point I est le centre du cercle inscrit dans un triangle RST. Quelles droites remarquables de ce triangle passent nécessairement par I ? Justifie.$$,
      'hint', $$Relis la définition du cercle inscrit et du point de concours qui en est le centre.$$,
      'expected', $$Les trois bissectrices des angles du triangle RST passent par I, car I est justement leur point de concours et le centre du cercle inscrit dans RST.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-cercles-triangles';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite d'entreprise, des élèves de 4ème découvrent une usine qui fabrique des savons en forme de pavé droit. De retour en classe, leur professeur leur demande de représenter ce savon sur une feuille, puis constate qu'aucun des dessins produits ne respecte les règles de la perspective cavalière. Curieux, les élèves décident d'étudier précisément ces règles avant de recommencer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulaire de la perspective cavalière$$,
        'body', $$La perspective cavalière est une technique de dessin qui représente un solide de l'espace sur une feuille plane, tout en laissant deviner ses parties cachées. Sur un tel dessin, on distingue le plan vertical de face (dessiné sans déformation), le plan vertical de profil et le plan horizontal (représentés par des parallélogrammes), ainsi que les arêtes fuyantes, inclinées d'un certain angle par rapport à l'horizontale du dessin.$$,
        'highlights', array[$$plan vertical de face$$, $$plan horizontal$$, $$fuyantes$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Le plan vertical de face est dessiné en vraie grandeur (souvent un carré ou un rectangle). Les plans vertical de profil et horizontal sont représentés par des parallélogrammes. Les arêtes fuyantes, à supports perpendiculaires au plan vertical de face, sont inclinées de l'angle α (l'inclinaison des fuyantes) par rapport à l'horizontale.$$),
        'example', jsonb_build_object('statement', $$Sur le dessin d'un pavé droit LKJIEFGH (I,J,K,L à l'arrière et E,F,G,H à l'avant), le parallélogramme EHGF est dessiné sans déformation. Quel plan représente-t-il ?$$, 'solution', $$EHGF est le plan vertical de face, car c'est celui qui est dessiné sans déformation, en vraie grandeur.$$),
        'fixation', jsonb_build_object('question', $$Sur ce même pavé droit, le parallélogramme LKJI se trouve tout en haut du dessin. Quel type de plan représente-t-il ?$$, 'solution', $$LKJI représente un plan horizontal, car il correspond à la face du dessus du solide.$$)
      ),
      jsonb_build_object(
        'heading', $$Les cinq règles de la perspective cavalière$$,
        'body', $$Dessiner en perspective cavalière obéit à cinq règles précises : les arêtes parallèles sur l'objet restent parallèles sur le dessin ; toute face située dans le plan vertical de face est dessinée sans déformation ; les arêtes cachées sont en pointillés ; les arêtes perpendiculaires au plan vertical de face sont représentées par des fuyantes parallèles inclinées d'un même angle α ; et ces fuyantes sont réduites selon un même coefficient c.$$,
        'highlights', array[$$règles de la perspective cavalière$$, $$coefficient de réduction$$]::text[],
        'property', jsonb_build_object('label', $$Les cinq règles$$, 'text', $$1) Des arêtes parallèles sur l'objet restent représentées par des segments parallèles. 2) Une face du plan vertical de face est dessinée sans déformation. 3) Les arêtes cachées sont en pointillés. 4) Les arêtes perpendiculaires au plan vertical de face sont des fuyantes parallèles, inclinées d'un même angle α par rapport à l'horizontale. 5) Les longueurs de ces fuyantes sont multipliées par un même coefficient de réduction c.$$),
        'example', jsonb_build_object('statement', $$Vrai ou faux : « les arêtes cachées d'un solide sont représentées par des traits continus en perspective cavalière ».$$, 'solution', $$Faux : d'après la règle 3, les arêtes cachées sont représentées par des traits en pointillés, pas des traits continus.$$),
        'fixation', jsonb_build_object('question', $$Vrai ou faux : « toute face de l'objet située dans le plan vertical de face est représentée sans déformation ».$$, 'solution', $$Vrai : c'est exactement la règle 2 de la perspective cavalière.$$)
      ),
      jsonb_build_object(
        'heading', $$Représenter un pavé droit ou un cube$$,
        'body', $$Pour représenter un pavé droit, on dessine d'abord sa face avant en vraie grandeur, puis on trace depuis chacun de ses sommets visibles une fuyante de même angle et de même coefficient, avant de relier leurs extrémités pour former la face arrière ; les arêtes qui aboutissent au sommet le plus caché sont ensuite repassées en pointillés.$$,
        'highlights', array[$$pavé droit$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$1) Dessiner la face avant en vraie grandeur. 2) Tracer, depuis chaque sommet visible, une fuyante de même angle α et de même coefficient c. 3) Relier les extrémités des fuyantes pour former la face arrière. 4) Repasser en pointillés les arêtes cachées, celles qui aboutissent au sommet arrière invisible depuis l'avant.$$),
        'example', jsonb_build_object('statement', $$Un pavé droit a pour arête de profondeur réelle 8 cm. Avec un coefficient de réduction c = 0,5, quelle longueur doit-on tracer pour représenter cette arête en fuyante ?$$, 'solution', $$Longueur tracée = c × longueur réelle = 0,5 × 8 = 4 cm.$$),
        'fixation', jsonb_build_object('question', $$Combien d'arêtes d'un pavé droit sont représentées en pointillés sur un dessin en perspective cavalière ?$$, 'solution', $$Trois arêtes sont cachées : celles qui aboutissent au sommet arrière, invisible depuis l'avant du solide.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(220, 190),
          'points', jsonb_build_array(
            jsonb_build_object('x', 40, 'y', 150, 'label', $$E$$),
            jsonb_build_object('x', 140, 'y', 150, 'label', $$F$$),
            jsonb_build_object('x', 140, 'y', 70, 'label', $$G$$),
            jsonb_build_object('x', 40, 'y', 70, 'label', $$H$$),
            jsonb_build_object('x', 75, 'y', 115, 'label', $$I$$),
            jsonb_build_object('x', 175, 'y', 115, 'label', $$J$$),
            jsonb_build_object('x', 175, 'y', 35, 'label', $$K$$),
            jsonb_build_object('x', 75, 'y', 35, 'label', $$L$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,3), jsonb_build_array(3,0), jsonb_build_array(3,7), jsonb_build_array(2,6), jsonb_build_array(7,6), jsonb_build_array(1,5), jsonb_build_array(5,6)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,4), jsonb_build_array(4,5), jsonb_build_array(4,7))
        )
      ),
      jsonb_build_object(
        'heading', $$Calculer avec le coefficient de réduction$$,
        'body', $$Le coefficient de réduction relie toujours la longueur réelle d'une arête fuyante à la longueur tracée sur le dessin : la longueur dessinée s'obtient en multipliant la longueur réelle par ce coefficient, et inversement on retrouve la longueur réelle en divisant la longueur dessinée par le coefficient.$$,
        'highlights', array[$$coefficient de réduction$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$Longueur dessinée = c × longueur réelle, donc longueur réelle = longueur dessinée ÷ c.$$),
        'example', jsonb_build_object('statement', $$Une boîte a pour face avant IJ = 9 cm et IF = 6 cm, et une arête fuyante réelle [IK] = 6 cm. Avec c = 0,5, calcule les longueurs à tracer pour IJ, IF et IK.$$, 'solution', $$La face avant est dessinée en vraie grandeur : IJ = 9 cm et IF = 6 cm restent inchangées. L'arête fuyante [IK] est réduite : IK dessinée = 0,5×6 = 3 cm.$$),
        'fixation', jsonb_build_object('question', $$Sur un dessin en perspective cavalière de coefficient c = 0,25, une fuyante est tracée avec une longueur de 3 cm. Calcule sa longueur réelle.$$, 'solution', $$Longueur réelle = longueur dessinée ÷ c = 3 ÷ 0,25 = 12 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour un concours de mathématiques, des candidats doivent représenter en perspective cavalière une boîte à chaussures de forme pavé droit. La face avant IJFH mesure IJ = 12 cm et IH = 8 cm, et l'arête de profondeur [IK] mesure 10 cm. On donne le coefficient de réduction c = 0,4 et l'angle d'inclinaison des fuyantes α = 35°.$$,
      'questions', array[
        $$Donne les dimensions à tracer pour la face avant IJFH, sachant qu'elle est dessinée en vraie grandeur.$$,
        $$Calcule la longueur à tracer pour l'arête fuyante [IK].$$,
        $$Un candidat affirme que la longueur des fuyantes sera de 4 cm : a-t-il raison ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Vrai ou faux : « les arêtes de l'objet perpendiculaires au plan vertical de face sont représentées par des segments à supports parallèles ».$$,
      'hint', $$Relis la règle 4 des cinq règles de la perspective cavalière.$$,
      'expected', $$Vrai : ces arêtes sont représentées par des fuyantes, toutes parallèles entre elles et inclinées du même angle.$$
    ),
    jsonb_build_object(
      'question', $$Un pavé droit a une profondeur réelle de 14 cm. Avec un coefficient de réduction c = 0,5, quelle longueur doit-on tracer pour l'arête fuyante correspondante ?$$,
      'hint', $$Utilise la formule : longueur dessinée = c × longueur réelle.$$,
      'expected', $$Longueur dessinée = 0,5 × 14 = 7 cm.$$
    ),
    jsonb_build_object(
      'question', $$Sur un dessin en perspective cavalière de coefficient c = 0,75, une fuyante est tracée avec une longueur de 6 cm. Calcule sa longueur réelle.$$,
      'hint', $$Utilise la formule inverse : longueur réelle = longueur dessinée ÷ c.$$,
      'expected', $$Longueur réelle = 6 ÷ 0,75 = 8 cm.$$
    ),
    jsonb_build_object(
      'question', $$Sur le dessin d'un cube en perspective cavalière, quelle face est dessinée sans déformation, et pourquoi ?$$,
      'hint', $$Relis la règle 2 sur le plan vertical de face.$$,
      'expected', $$La face située dans le plan vertical de face est dessinée sans déformation, car la règle 2 impose de la représenter en vraie grandeur, contrairement aux faces fuyantes qui sont inclinées et réduites.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-perspective-cavaliere';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En famille, tu regardes sur RTI 1 un documentaire consacré à l'histoire de la France. Le présentateur affirme : « le 14 juillet 1789 marque une étape décisive dans l'histoire de la France : c'est le début de la révolution française ». De retour en classe, tu cherches à comprendre d'où vient cette révolution, comment elle s'est déroulée, et ce qu'elle a changé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une France en crise à la veille de 1789$$,
        'body', $$Avant 1789, la France est une monarchie de droit divin : le roi détient seul les pouvoirs politique et judiciaire, et sa personne est considérée comme sacrée. La société est divisée en trois ordres inégaux. Le clergé et la noblesse, qui ne représentent que 2 % de la population, sont des privilégiés dispensés d'impôts, tandis que le tiers état, composé surtout de paysans et d'ouvriers et formant 98 % de la population, supporte à lui seul toutes les charges fiscales. À cela s'ajoute une crise économique et financière : les inondations de 1787 puis la sécheresse et la grêle de juillet 1788 font chuter les récoltes et flamber les prix, tandis que l'État affiche en 1788 un déficit budgétaire de 162 millions de livres, aggravé par le soutien financier apporté à la guerre d'indépendance des États-Unis et par les dépenses de la cour royale. Les nobles refusent toute réforme fiscale qui les obligerait eux aussi à contribuer. Les idées des philosophes des Lumières, comme Voltaire, Rousseau et Diderot, qui dénoncent l'arbitraire royal et réclament l'égalité entre les hommes, achèvent de préparer les esprits au changement.$$,
        'highlights', array[$$monarchie de droit divin$$, $$trois ordres$$, $$déficit de 162 millions de livres$$, $$philosophie des Lumières$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La Révolution française de 1789 trouve son origine dans le pouvoir absolu du roi, l'inégalité entre les trois ordres de la société (2 % de privilégiés face à 98 % de tiers état imposé), une grave crise économique et financière, et la diffusion des idées des philosophes des Lumières.$$),
        'table', jsonb_build_object(
          'headers', array[$$Ordre$$, $$Part de la population$$, $$Situation face à l'impôt$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Clergé et noblesse$$, $$2 %$$, $$Privilégiés, exemptés d'impôts$$),
            jsonb_build_array($$Tiers état$$, $$98 %$$, $$Supporte l'ensemble des impôts$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi les nobles s'opposent-ils à toute réforme des impôts en 1788 ?$$, 'solution', $$Parce qu'une telle réforme les obligerait, eux qui étaient jusque-là exemptés, à participer eux aussi au paiement des impôts, ce qui menacerait leurs privilèges.$$),
        'fixation', jsonb_build_object('question', $$Quelle part de la population française les privilégiés (clergé et noblesse) représentaient-ils avant 1789 ?$$, 'solution', $$Environ 2 % de la population.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes étapes de la Révolution$$,
        'body', $$Cherchant de nouvelles recettes fiscales, le roi convoque les états généraux, qui se réunissent le 5 mai 1789. Après un blocage prolongé entre les trois ordres, les députés du tiers état prêtent le serment du Jeu de paume puis se proclament, le 9 juillet 1789, Assemblée nationale constituante, chargée de rédiger une constitution. Le 14 juillet 1789, alors que le roi masse des troupes autour de Paris, le peuple parisien s'empare de la Bastille, ancienne prison d'État symbole de l'arbitraire royal, sauvant ainsi la jeune Assemblée d'un coup de force. La France devient alors une monarchie constitutionnelle (1789-1792), avant que la Convention ne proclame la Première République le 21 septembre 1792, mettant fin au règne de Louis XVI. En 1799, Napoléon Bonaparte instaure à son tour le régime du Consulat, dont il devient le premier Consul.$$,
        'highlights', array[$$états généraux$$, $$serment du Jeu de paume$$, $$prise de la Bastille$$, $$Première République$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Date$$, $$Événement$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$5 mai 1789$$, $$Réunion des états généraux$$),
            jsonb_build_array($$9 juillet 1789$$, $$Les députés du tiers état se proclament Assemblée nationale constituante$$),
            jsonb_build_array($$14 juillet 1789$$, $$Prise de la Bastille$$),
            jsonb_build_array($$21 septembre 1792$$, $$Proclamation de la Première République$$),
            jsonb_build_array($$1799$$, $$Napoléon Bonaparte instaure le Consulat$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi la prise de la Bastille, le 14 juillet 1789, est-elle restée un événement symbolique ?$$, 'solution', $$Parce qu'elle marque la chute d'une prison d'État perçue comme le symbole de l'arbitraire de la monarchie absolue, et parce qu'elle protège l'Assemblée constituante naissante face à la menace des troupes royales.$$),
        'fixation', jsonb_build_object('question', $$En quelle année la Première République est-elle proclamée, et que devient alors la monarchie ?$$, 'solution', $$En 1792 (le 21 septembre) ; la monarchie constitutionnelle prend fin.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences politiques de la Révolution$$,
        'body', $$Sur le plan politique, la Révolution met fin à la monarchie absolue et au système seigneurial hérité de l'Ancien Régime. Elle fait naître la première République française, instaure la séparation des pouvoirs, réorganise le territoire national en 83 départements et établit le droit de vote pour les citoyens. Portée par ces changements, la Révolution française va aussi influencer, dans les décennies suivantes, des mouvements révolutionnaires en Europe centrale et en Amérique du Sud.$$,
        'highlights', array[$$fin de la monarchie absolue$$, $$83 départements$$, $$séparation des pouvoirs$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Sur le plan politique, la Révolution française de 1789 met fin à la monarchie absolue et au système seigneurial, instaure la séparation des pouvoirs et le droit de vote des citoyens, réorganise la France en 83 départements, et inspirera par la suite d'autres mouvements révolutionnaires dans le monde.$$),
        'fixation', jsonb_build_object('question', $$En combien de départements la France est-elle réorganisée après la Révolution ?$$, 'solution', $$En 83 départements.$$)
      ),
      jsonb_build_object(
        'heading', $$La Déclaration des droits de l'homme et du citoyen$$,
        'body', $$Sur le plan social, économique et religieux, l'Assemblée abolit dans la nuit du 4 août 1789 les privilèges du clergé et de la noblesse, avant d'adopter, le 26 août 1789, la Déclaration des droits de l'homme et du citoyen, qui proclame l'égalité de tous devant la loi. Ce texte fondateur défend en particulier la liberté et l'égalité des citoyens en droit, la liberté d'association politique, le droit à la propriété et à la sûreté, le droit à une justice équitable, ainsi que la liberté d'expression, d'opinion et de religion.$$,
        'highlights', array[$$Déclaration des droits de l'homme et du citoyen$$, $$26 août 1789$$, $$égalité en droit$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux droits ou libertés affirmés par la Déclaration des droits de l'homme et du citoyen de 1789.$$, 'solution', $$Par exemple la liberté et l'égalité des citoyens en droit, et le droit à la propriété et à la sûreté ; on peut aussi citer la liberté d'expression, d'opinion et de religion.$$),
        'fixation', jsonb_build_object('question', $$À quelle date la Déclaration des droits de l'homme et du citoyen est-elle adoptée ?$$, 'solution', $$Le 26 août 1789.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur TV5, un présentateur déclare : « La révolution française de 1789 constitue un fait marquant dans l'histoire du pays. Elle a mis fin aux inégalités en France et transformé profondément la société française. »$$,
      'questions', array[
        $$Cite deux causes de la Révolution française de 1789.$$,
        $$Place dans l'ordre chronologique : prise de la Bastille, réunion des états généraux, proclamation de la Première République.$$,
        $$Explique en quoi la Déclaration des droits de l'homme et du citoyen a mis fin à certaines inégalités de l'Ancien Régime.$$,
        $$Cite deux conséquences politiques de la Révolution française sur l'organisation de l'État.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$À quelle date les états généraux sont-ils réunis, ouvrant la voie à la Révolution ?$$,
      'hint', $$C'est au début du mois de mai 1789.$$,
      'expected', $$Le 5 mai 1789.$$
    ),
    jsonb_build_object(
      'question', $$Que se passe-t-il à Paris le 14 juillet 1789 ?$$,
      'hint', $$Pense à une ancienne prison d'État, symbole de l'arbitraire royal.$$,
      'expected', $$Le peuple de Paris s'empare de la Bastille.$$
    ),
    jsonb_build_object(
      'question', $$Quel pourcentage de la population française le tiers état représentait-il avant 1789, et quel poids fiscal supportait-il ?$$,
      'hint', $$Pense à la part écrasante de la population qui n'était ni noble ni membre du clergé.$$,
      'expected', $$Le tiers état représentait environ 98 % de la population et supportait à lui seul l'ensemble des impôts.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année la Première République est-elle proclamée en France, mettant fin à la monarchie ?$$,
      'hint', $$C'est en septembre, trois ans après la prise de la Bastille.$$,
      'expected', $$En 1792 (le 21 septembre).$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-revolution-francaise';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Chez toi, tu regardes avec des camarades de classe une émission de la chaîne Africa Business 24 consacrée à l'intégration économique en Afrique. Le présentateur affirme : « L'intégration en Afrique de l'Ouest piétine. La CEDEAO est minée par de nombreuses difficultés — insécurité, attaques terroristes, faiblesse des infrastructures, financement limité — mais elle reste championne en Afrique dans le domaine de la libre circulation. » Tu décides de mener des recherches pour mieux connaître cette organisation, son fonctionnement et son bilan.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La naissance et l'espace de la CEDEAO$$,
        'body', $$L'idée d'une organisation régionale ouest-africaine est lancée en avril 1972 par les présidents Gnassingbé Eyadéma du Togo et Yakubu Gowon du Nigeria. Elle se concrétise le 28 mai 1975 à Lagos, au Nigeria, avec la signature du traité créant la Communauté économique des États de l'Afrique de l'Ouest (CEDEAO). L'organisation regroupe quinze États membres : huit pays francophones (Côte d'Ivoire, Mali, Niger, Burkina Faso, Sénégal, Guinée, Bénin, Togo), cinq pays anglophones (Ghana, Liberia, Nigeria, Gambie, Sierra Leone) et deux pays lusophones (Guinée-Bissau, Cap-Vert). Selon le document de référence de la leçon, la CEDEAO couvre une superficie de 5,2 millions de km² et compte près de 386 millions d'habitants.$$,
        'highlights', array[$$28 mai 1975$$, $$traité de Lagos$$, $$quinze États membres$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La CEDEAO est créée le 28 mai 1975 à Lagos, à la suite d'une initiative lancée en 1972 par le Togo et le Nigeria ; elle regroupe quinze États membres d'Afrique de l'Ouest, répartis entre pays francophones, anglophones et lusophones.$$),
        'table', jsonb_build_object(
          'headers', array[$$Groupe linguistique$$, $$Nombre d'États$$, $$Exemples$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Francophones$$, $$8$$, $$Côte d'Ivoire, Mali, Sénégal, Togo$$),
            jsonb_build_array($$Anglophones$$, $$5$$, $$Ghana, Nigeria, Sierra Leone$$),
            jsonb_build_array($$Lusophones$$, $$2$$, $$Guinée-Bissau, Cap-Vert$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$En quelle année et dans quelle ville le traité créant la CEDEAO est-il signé ?$$, 'solution', $$En 1975 (le 28 mai), à Lagos, au Nigeria.$$)
      ),
      jsonb_build_object(
        'heading', $$Les objectifs et les atouts économiques de la CEDEAO$$,
        'body', $$La CEDEAO poursuit plusieurs objectifs : assurer le bien-être de ses populations, promouvoir la coopération et le développement dans tous les secteurs économiques, instaurer un passeport commun facilitant la mobilité, créer à terme une monnaie unique, et bâtir un vaste marché commun. Elle s'appuie pour cela sur d'importants atouts : de vastes terres arables et pastorales, de grands bassins fluviaux propices à l'irrigation, et un sous-sol riche en ressources minières et énergétiques — or (notamment au Ghana), diamants (notamment en Sierra Leone), pétrole et gaz (notamment au Nigeria), ainsi que fer, bauxite et manganèse. La région produit aussi en abondance des céréales et cultures vivrières ou de rente (mil, maïs, riz, café, cacao, coton), et dispose, selon le document de la leçon, d'une population estimée à plus de 86 millions d'habitants formant une main-d'œuvre et un marché de consommation importants.$$,
        'highlights', array[$$monnaie unique$$, $$ressources minières$$, $$marché commun$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux ressources du sous-sol ouest-africain qui constituent un atout économique pour la CEDEAO.$$, 'solution', $$Par exemple l'or (surtout au Ghana) et le pétrole (surtout au Nigeria) ; on peut aussi citer les diamants de Sierra Leone ou le fer et la bauxite.$$),
        'fixation', jsonb_build_object('question', $$Cite deux objectifs de la CEDEAO.$$, 'solution', $$Par exemple assurer le bien-être des populations et créer un vaste marché de consommation ; on peut aussi citer la mise en place d'une monnaie unique ou d'un passeport commun.$$)
      ),
      jsonb_build_object(
        'heading', $$Le fonctionnement des institutions de la CEDEAO$$,
        'body', $$La CEDEAO s'organise autour de plusieurs types d'organes. Les organes de décision comprennent la Conférence des chefs d'État et de gouvernement, organe suprême qui fixe les grandes orientations, le Conseil des ministres, qui veille au bon fonctionnement de la communauté, et le Parlement de la communauté. Les organes d'exécution comptent la Commission de la CEDEAO, chargée de la mise en œuvre des décisions et composée de neuf commissaires, ainsi que des commissions techniques spécialisées (agriculture, commerce, transport, industrie) et une commission chargée de la défense, de la sécurité et de la paix. Le contrôle et l'arbitrage reviennent à la Cour de justice de la communauté, dont le siège est à Abuja. Enfin, des organes à vocation économique et sociale complètent le dispositif : le Conseil économique et social, l'Organisation ouest-africaine de la santé, et la Banque d'investissement et de développement de la CEDEAO (BIDC), qui finance des projets publics et privés dans la région.$$,
        'highlights', array[$$Conférence des chefs d'État$$, $$Commission de la CEDEAO$$, $$Cour de justice$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Institution$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Conférence des chefs d'État et de gouvernement$$, $$Organe suprême : oriente et contrôle la CEDEAO$$),
            jsonb_build_array($$Commission de la CEDEAO$$, $$Met en œuvre les décisions au quotidien$$),
            jsonb_build_array($$Cour de justice de la communauté$$, $$Règle les différends (siège à Abuja)$$),
            jsonb_build_array($$Banque d'investissement et de développement (BIDC)$$, $$Finance les projets de développement$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Où siège la Cour de justice de la CEDEAO, et quel est son rôle ?$$, 'solution', $$Elle siège à Abuja et règle les différends liés à l'interprétation et à l'application des textes de la communauté.$$)
      ),
      jsonb_build_object(
        'heading', $$Le bilan de la CEDEAO : succès et limites$$,
        'body', $$La CEDEAO peut se prévaloir de plusieurs succès : sur le plan politique et sécuritaire, ses forces de l'ECOMOG sont intervenues pour rétablir ou maintenir la paix dans des pays comme le Liberia, la Guinée-Bissau ou la Gambie ; sur le plan économique, elle a adopté un tarif extérieur commun et favorisé la libre circulation des capitaux et des travailleurs ; sur le plan social, elle a instauré la libre circulation des personnes et une carte d'identité biométrique commune. Mais l'organisation se heurte encore à de nombreuses limites : l'absence d'une monnaie unique effective, des irrégularités dans le paiement des cotisations par les États membres, la concurrence des produits étrangers, la faiblesse des échanges commerciaux entre pays membres, des tensions de leadership entre États francophones et anglophones, ainsi que la persistance de crises internes et d'attaques djihadistes dans plusieurs pays de la sous-région.$$,
        'highlights', array[$$ECOMOG$$, $$libre circulation$$, $$limites de l'intégration$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La CEDEAO a remporté des succès réels, notamment en matière de libre circulation des personnes et d'interventions de paix (ECOMOG), mais son intégration économique reste freinée par l'absence de monnaie unique, la faiblesse des échanges internes et des crises sécuritaires persistantes.$$),
        'example', jsonb_build_object('statement', $$Dans quels pays les forces de l'ECOMOG sont-elles intervenues pour rétablir ou maintenir la paix, selon le document de la leçon ?$$, 'solution', $$Au Liberia, en Guinée-Bissau et en Gambie.$$),
        'fixation', jsonb_build_object('question', $$Cite une limite qui freine encore l'intégration économique de la CEDEAO.$$, 'solution', $$Par exemple l'absence d'une monnaie unique, la faiblesse des échanges internes, ou les crises et attaques dans certains États membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de l'installation de la quatrième législature du Parlement de la CEDEAO, son président déclare : « Sur le plan de l'intégration, des progrès importants ont été accomplis, notamment dans la libre circulation des personnes et des biens. Toutefois, de nombreux défis demeurent, avec les attaques terroristes. »$$,
      'questions', array[
        $$Quand et où la CEDEAO a-t-elle été créée, et combien d'États regroupe-t-elle ?$$,
        $$Cite deux institutions de la CEDEAO et leur rôle.$$,
        $$Explique en quoi la libre circulation des personnes est un succès de la CEDEAO.$$,
        $$Cite deux limites qui freinent encore l'intégration régionale de la CEDEAO.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$En quelle année et dans quelle ville la CEDEAO est-elle créée ?$$,
      'hint', $$C'est en 1975, dans la capitale économique du Nigeria à l'époque.$$,
      'expected', $$En 1975 (le 28 mai), à Lagos.$$
    ),
    jsonb_build_object(
      'question', $$Combien d'États membres compte la CEDEAO, et cite deux d'entre eux.$$,
      'hint', $$Le nombre est le même que celui des jours d'un mois court.$$,
      'expected', $$Quinze États membres, par exemple la Côte d'Ivoire et le Ghana.$$
    ),
    jsonb_build_object(
      'question', $$Quel organe de la CEDEAO constitue son organe suprême, chargé des grandes orientations ?$$,
      'hint', $$Il réunit les chefs d'État des pays membres.$$,
      'expected', $$La Conférence des chefs d'État et de gouvernement.$$
    ),
    jsonb_build_object(
      'question', $$Cite une limite qui empêche encore la CEDEAO d'atteindre une pleine intégration économique.$$,
      'hint', $$Pense à la monnaie ou aux échanges commerciaux entre pays membres.$$,
      'expected', $$Par exemple l'absence d'une monnaie unique effective, ou la faiblesse des échanges commerciaux entre États membres.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-4e-cedeao';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de tu colegio prepara una exposición sobre "El mundo hispánico" para la semana cultural. Debes presentar España, un país de la América hispánica y Guinea Ecuatorial, y explicar a los visitantes cómo se pronuncia correctamente el español.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$España: fronteras y Comunidades Autónomas$$,
        'body', $$Para presentar un país con precisión, necesitas vocabulario de geografía política: la frontera (o límite) con otros países, y la manera en que España organiza su territorio en Comunidades Autónomas.$$,
        'highlights', array[$$la frontera$$, $$la Comunidad Autónoma$$, $$una ciudad$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Comunidad Autónoma$$, $$Ciudad importante$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Andalucía$$, $$Sevilla$$),
            jsonb_build_array($$Cataluña$$, $$Barcelona$$),
            jsonb_build_array($$Comunidad de Madrid$$, $$Madrid$$),
            jsonb_build_array($$Galicia$$, $$La Coruña$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Se dice "tener frontera con" + país. España tiene frontera terrestre con Portugal, Francia, Andorra y Marruecos, y también, de forma indirecta, con el Reino Unido "a través de" Gibraltar. "Comunidad Autónoma" es femenino: una Comunidad Autónoma, la Comunidad de Madrid.$$),
        'example', jsonb_build_object('statement', $$Explica con qué países tiene frontera España.$$, 'solution', $$España tiene frontera con Portugal, Francia, Andorra y Marruecos, y también con el Reino Unido a través de Gibraltar.$$),
        'fixation', jsonb_build_object('question', $$Completa: Cataluña es una ___ de España cuya capital es Barcelona.$$, 'solution', $$Cataluña es una Comunidad Autónoma de España cuya capital es Barcelona.$$)
      ),
      jsonb_build_object(
        'heading', $$Sonidos especiales del español: c, ch, g, j, ll, ñ, rr, y, z$$,
        'body', $$Antes de presentar oralmente un país, debes dominar los sonidos que no existen en francés: son letras y dígrafos con una pronunciación particular, muy distinta de su equivalente escrito en otros idiomas.$$,
        'highlights', array[$$la eñe$$, $$la jota$$, $$la doble erre$$, $$la elle$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Letra / dígrafo$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$c (ante e, i)$$, $$cinco$$),
            jsonb_build_array($$g (ante e, i) / j$$, $$gente, jardín$$),
            jsonb_build_array($$ll$$, $$llamar$$),
            jsonb_build_array($$ñ$$, $$español$$),
            jsonb_build_array($$rr$$, $$perro$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$La "ñ" es una consonante nasal palatal, distinta de "n". La "rr" (y la "r" a principio de palabra) es un sonido vibrante múltiple, más fuerte que la "r" simple entre vocales. "G" y "j" delante de "e" o "i" producen un sonido gutural aspirado. "Ll" y "y" suenan de forma palatal, parecida en muchas zonas hispanohablantes.$$),
        'example', jsonb_build_object('statement', $$Explica el sonido especial de la palabra "cañón".$$, 'solution', $$La palabra "cañón" contiene una "ñ", consonante nasal palatal que no existe en francés.$$),
        'fixation', jsonb_build_object('question', $$Subraya las letras de pronunciación especial en "el niño lleva un zapato rojo".$$, 'solution', $$El niño lleva un zapato rojo: las letras especiales son ñ, ll, z y j.$$)
      ),
      jsonb_build_object(
        'heading', $$Hispanoamérica: vocabulario y el acento tónico$$,
        'body', $$Para hablar de los países de la América hispánica, necesitas vocabulario como "indígena" o "idioma", y también dos reglas generales para saber en qué sílaba de una palabra recae la fuerza de la voz, sin necesidad de tilde escrita.$$,
        'highlights', array[$$un indígena$$, $$un idioma$$, $$la sílaba tónica$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra$$, $$Termina en$$, $$Sílaba tónica$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$amigo$$, $$vocal$$, $$penúltima (a-MI-go)$$),
            jsonb_build_array($$hablan$$, $$consonante n$$, $$penúltima (HA-blan)$$),
            jsonb_build_array($$ciudad$$, $$consonante d$$, $$última (ciu-DAD)$$),
            jsonb_build_array($$profesor$$, $$consonante r$$, $$última (profe-SOR)$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Regla 1: las palabras terminadas en vocal, o en las consonantes "n" o "s", llevan el acento tónico en la penúltima sílaba. Regla 2: las palabras terminadas en cualquier otra consonante llevan el acento tónico en la última sílaba. Ninguna de las dos necesita tilde escrita, porque siguen la regla general.$$),
        'example', jsonb_build_object('statement', $$Indica la sílaba tónica de "profesor" y explica por qué.$$, 'solution', $$"Profesor" termina en "r", una consonante distinta de n/s, así que el acento tónico cae en la última sílaba: profe-SOR.$$),
        'fixation', jsonb_build_object('question', $$¿En qué sílaba recae el acento tónico de "hablan"?$$, 'solution', $$"Hablan" termina en "n", así que el acento tónico cae en la penúltima sílaba: HA-blan.$$)
      ),
      jsonb_build_object(
        'heading', $$Guinea Ecuatorial y el acento escrito (la tilde)$$,
        'body', $$Guinea Ecuatorial, único país africano donde el español es lengua oficial, te permite descubrir palabras como "madera" o "turismo", y sobre todo una tercera regla: qué hacer cuando una palabra no respeta las dos reglas generales de acentuación.$$,
        'highlights', array[$$la tilde$$, $$el acento escrito$$, $$la madera$$, $$el turismo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra$$, $$Por qué lleva tilde$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$América$$, $$esdrújula (a-MÉ-ri-ca), rompe la regla$$),
            jsonb_build_array($$Panamá$$, $$termina en vocal pero se acentúa en la última sílaba$$),
            jsonb_build_array($$indígena$$, $$esdrújula (in-DÍ-ge-na), rompe la regla$$),
            jsonb_build_array($$petróleo$$, $$esdrújula (pe-TRÓ-le-o), rompe la regla$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Cuando una palabra no sigue ninguna de las dos reglas generales de acentuación (vistas en la sección anterior), su sílaba tónica lleva una tilde escrita. Es el caso de casi todas las palabras esdrújulas (acentuadas en la antepenúltima sílaba), y de algunas palabras terminadas en vocal cuyo acento cae, excepcionalmente, en la última sílaba.$$),
        'example', jsonb_build_object('statement', $$Explica por qué "Panamá" lleva tilde.$$, 'solution', $$"Panamá" termina en vocal, así que por la regla general el acento debería caer en la penúltima sílaba, pero en realidad se pronuncia Pa-na-MÁ; como no sigue la regla, necesita tilde escrita.$$),
        'fixation', jsonb_build_object('question', $$¿Por qué "indígena" lleva tilde?$$, 'solution', $$"Indígena" es una palabra esdrújula (el acento cae en la antepenúltima sílaba: in-DÍ-ge-na), lo cual no sigue ninguna de las dos reglas generales, así que necesita tilde.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Para la exposición "El mundo hispánico" de tu colegio, debes localizar España, pronunciar correctamente una palabra con un sonido especial, aplicar la regla del acento tónico, y presentar Guinea Ecuatorial explicando por qué una de sus palabras clave lleva tilde.$$,
      'questions', array[
        $$Localiza España y cita dos países con los que tiene frontera.$$,
        $$Pronuncia una palabra con "ñ" o "rr" y explica su sonido especial.$$,
        $$Da la sílaba tónica de una palabra que termine en una consonante distinta de n/s.$$,
        $$Explica por qué una palabra esdrújula necesita tilde escrita.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: España tiene frontera con Portugal, Francia, Andorra y ___ (país africano).$$,
      'hint', $$Es el país que separa España de África por el estrecho de Gibraltar.$$,
      'expected', $$España tiene frontera con Portugal, Francia, Andorra y Marruecos.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué tiene de especial el sonido de la doble "rr" en la palabra "perro"?$$,
      'hint', $$Compárala con la "r" simple entre vocales.$$,
      'expected', $$La "rr" es un sonido vibrante múltiple, más fuerte que la "r" simple.$$
    ),
    jsonb_build_object(
      'question', $$Indica la sílaba tónica de "ciudad" y explica la regla que se aplica.$$,
      'hint', $$"Ciudad" termina en una consonante distinta de n y de s.$$,
      'expected', $$"Ciudad" termina en "d", así que el acento tónico cae en la última sílaba: ciu-DAD.$$
    ),
    jsonb_build_object(
      'question', $$¿Por qué la palabra "México" lleva tilde?$$,
      'hint', $$Cuenta las sílabas y localiza dónde cae la fuerza de la voz.$$,
      'expected', $$"México" es una palabra esdrújula (el acento cae en la antepenúltima sílaba: MÉ-xi-co), lo cual no sigue las reglas generales de acentuación, por eso necesita tilde escrita.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-decouverte-monde-hispanique';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Una delegación de estudiantes españoles visita tu colegio durante una semana. Como responsable de la bienvenida, debes saludarles según el momento del día, presentarles a otros compañeros, invitarles a actividades y felicitarles o agradecerles cuando corresponda.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Saludar según el momento del día$$,
        'body', $$El primer gesto de cortesía es saludar correctamente. En español, la fórmula de saludo cambia según la hora, salvo "hola", que sirve en cualquier momento entre personas conocidas.$$,
        'highlights', array[$$buenos días$$, $$buenas tardes$$, $$buenas noches$$, $$hola$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Momento del día$$, $$Fórmula$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$por la mañana$$, $$¡Buenos días!$$),
            jsonb_build_array($$por la tarde$$, $$¡Buenas tardes!$$),
            jsonb_build_array($$por la noche$$, $$¡Buenas noches!$$),
            jsonb_build_array($$en cualquier momento (informal)$$, $$¡Hola!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Buenos días", "buenas tardes" y "buenas noches" van siempre en plural, aunque saludes a una sola persona. "Hola" se puede combinar con las otras fórmulas: "¡Hola, buenos días!". Para preguntar cómo está alguien, se añade "¿Qué tal estás?" o, con cortesía, "¿Qué tal está usted?".$$),
        'example', jsonb_build_object('statement', $$Saluda a tu director a las tres de la tarde.$$, 'solution', $$¡Buenas tardes, señor director!$$),
        'fixation', jsonb_build_object('question', $$Completa: Son las ocho de la mañana, saludas a tu profesor diciendo ___.$$, 'solution', $$Son las ocho de la mañana, saludas a tu profesor diciendo "¡Buenos días!".$$)
      ),
      jsonb_build_object(
        'heading', $$Presentarse y presentar a otra persona$$,
        'body', $$Para presentarte a ti mismo usas "llamarse", pero para presentar a un tercero necesitas otras fórmulas con "ser", y saber responder con cortesía a una presentación.$$,
        'highlights', array[$$me llamo$$, $$éste es / ésta es$$, $$encantado / encantada$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fórmula$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Me llamo...$$, $$presentarse uno mismo$$),
            jsonb_build_array($$Éste es mi amigo Kofi.$$, $$presentar a un chico$$),
            jsonb_build_array($$Ésta es mi amiga Aya.$$, $$presentar a una chica$$),
            jsonb_build_array($$Encantado / Encantada$$, $$responder a una presentación$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para presentarse y presentar a alguien se usan sobre todo los verbos "llamarse" y "ser": me llamo Aya / éste es mi amigo. "Encantado" concuerda en género con quien habla: un chico dice "encantado", una chica dice "encantada". Al final de un encuentro, se usa "despedirse": nos despedimos diciendo adiós.$$),
        'example', jsonb_build_object('statement', $$Presenta a tu amiga Fatou a un compañero español.$$, 'solution', $$Ésta es mi amiga Fatou.$$),
        'fixation', jsonb_build_object('question', $$Completa el diálogo: A: Éste es mi hermano Yao. B: ___.$$, 'solution', $$A: Éste es mi hermano Yao. B: Encantado.$$)
      ),
      jsonb_build_object(
        'heading', $$Invitar a alguien y responder a una invitación$$,
        'body', $$Recibir a invitados también significa saber invitarles a actividades, y entender cómo aceptar o rehusar una invitación con cortesía.$$,
        'highlights', array[$$te invito$$, $$¿quieres venir?$$, $$no puedo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Para invitar$$, $$Para responder$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Te invito a...$$, $$Sí, gracias, ¡vale!$$),
            jsonb_build_array($$¿Puedes venir?$$, $$Claro que sí.$$),
            jsonb_build_array($$¿Quieres ver la tele conmigo?$$, $$Lo siento, no puedo, estoy ocupado.$$),
            jsonb_build_array($$¿Venís a la fiesta?$$, $$Ahora no, gracias.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para invitar se usa sobre todo el verbo "invitar" (te invito a...) o una pregunta con "poder" o "querer" (¿puedes venir?, ¿quieres...?). Para rehusar una invitación con cortesía, se explica el motivo: "no puedo, estoy ocupado" es más educado que un simple "no".$$),
        'example', jsonb_build_object('statement', $$Invita a un compañero español a tu casa el sábado.$$, 'solution', $$Te invito a mi casa el sábado, ¿puedes venir?$$),
        'fixation', jsonb_build_object('question', $$Rehúsa cortésmente esta invitación: "¿Vienes al cine esta tarde?"$$, 'solution', $$Lo siento, no puedo, esta tarde estoy ocupado.$$)
      ),
      jsonb_build_object(
        'heading', $$Felicitar y dar las gracias$$,
        'body', $$Para cerrar bien la semana de intercambio, necesitas felicitar a alguien por un logro y dar las gracias correctamente, incluyendo la conjugación irregular de "agradecer".$$,
        'highlights', array[$$te felicito$$, $$felicidades$$, $$te agradezco$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$AGRADECER (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$agradezco$$),
            jsonb_build_array($$tú$$, $$agradeces$$),
            jsonb_build_array($$nosotros$$, $$agradecemos$$),
            jsonb_build_array($$vosotros$$, $$agradecéis$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para felicitar se usa "felicidades", "te felicito" o, para un cumpleaños, "feliz cumpleaños". Para dar las gracias se usa "gracias", "muchas gracias" o el verbo "agradecer", irregular en la primera persona del singular (yo agradezco, con "zc" como "conocer").$$),
        'example', jsonb_build_object('statement', $$Felicita a un compañero por su buena nota en español.$$, 'solution', $$¡Te felicito por tu buena nota en español!$$),
        'fixation', jsonb_build_object('question', $$Conjuga "agradecer" con "yo": ___ a mis profesores por su ayuda.$$, 'solution', $$Agradezco a mis profesores por su ayuda.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Durante la visita de los estudiantes españoles, debes saludarles según la hora, presentar a un compañero, invitarles a una actividad del colegio, y felicitar o agradecer a alguien del grupo.$$,
      'questions', array[
        $$Saluda a un invitado según el momento del día indicado.$$,
        $$Presenta a un compañero usando "éste es" o "ésta es".$$,
        $$Invita a un estudiante español a una actividad y da una respuesta.$$,
        $$Felicita o da las gracias a alguien del grupo.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: Son las nueve de la noche, saludas a un invitado diciendo ___.$$,
      'hint', $$Usa la fórmula de saludo correspondiente a la noche.$$,
      'expected', $$Son las nueve de la noche, saludas a un invitado diciendo "¡Buenas noches!".$$
    ),
    jsonb_build_object(
      'question', $$Completa: ___ (llamarse, yo) Kouadio, y ___ (ser) mi hermana Adjoba.$$,
      'hint', $$Usa "llamarse" para presentarte y "ser" para presentar a otra persona.$$,
      'expected', $$Me llamo Kouadio, y ésta es mi hermana Adjoba.$$
    ),
    jsonb_build_object(
      'question', $$Responde cortésmente a esta invitación: "¿Puedes venir a mi cumpleaños?" (no puedes ir)$$,
      'hint', $$Da una excusa educada en vez de decir simplemente "no".$$,
      'expected', $$Lo siento, no puedo venir, estoy ocupado ese día.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "agradecer" con "nosotros": ___ a la profesora por su paciencia.$$,
      'hint', $$"Agradecer" con "nosotros" es regular en esta persona.$$,
      'expected', $$Agradecemos a la profesora por su paciencia.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-presentation-civilites';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Trabajas en la radio de tu colegio. Debes hacer preguntas a un compañero sobre un acontecimiento reciente, describir un lugar, orientar a un oyente que busca el colegio, y contar lo que ha pasado en un evento.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Preguntar y responder: las palabras interrogativas$$,
        'body', $$Para obtener información precisa durante una entrevista, necesitas dominar las principales palabras interrogativas del español, y distinguir "preguntar" de "contestar" (o "responder").$$,
        'highlights', array[$$preguntar$$, $$contestar$$, $$adónde$$, $$por qué$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra interrogativa$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Adónde...?$$, $$destino de un movimiento$$),
            jsonb_build_array($$¿Dónde...?$$, $$lugar$$),
            jsonb_build_array($$¿Cuándo...?$$, $$momento$$),
            jsonb_build_array($$¿Por qué...?$$, $$causa$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Todas las palabras interrogativas llevan tilde: qué, cómo, cuándo, dónde, adónde, quién/es, cuál/es, por qué. "Preguntar" es la acción de hacer una pregunta; "contestar" y "responder" son sinónimos para reaccionar a una pregunta.$$),
        'example', jsonb_build_object('statement', $$Pregunta a tu compañero adónde va después de las clases.$$, 'solution', $$¿Adónde vas después de las clases?$$),
        'fixation', jsonb_build_object('question', $$Completa con la palabra interrogativa adecuada: ¿___ te llamas tú?$$, 'solution', $$¿Cómo te llamas tú?$$)
      ),
      jsonb_build_object(
        'heading', $$Describir con adjetivos$$,
        'body', $$Transmitir información también significa describir un lugar o un objeto con precisión, usando adjetivos de forma, de tamaño y de color que concuerdan con el sustantivo.$$,
        'highlights', array[$$redondo/a$$, $$alto/a$$, $$limpio/a$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Categoría$$, $$Ejemplos$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$forma$$, $$redondo/a, cuadrado/a$$),
            jsonb_build_array($$tamaño$$, $$alto/a, bajo/a, grande$$),
            jsonb_build_array($$color$$, $$blanco/a, negro/a, azul$$),
            jsonb_build_array($$estado$$, $$limpio/a, sucio/a$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Los adjetivos terminados en -o/-a concuerdan en género y número con el sustantivo: un edificio alto, una casa alta, unas casas altas. Los adjetivos de color como "azul" tienen una sola forma para masculino y femenino, pero sí concuerdan en número: un techo azul, unas paredes azules.$$),
        'example', jsonb_build_object('statement', $$Describe el patio de tu colegio.$$, 'solution', $$El patio de mi colegio es grande y siempre está limpio.$$),
        'fixation', jsonb_build_object('question', $$Completa con el adjetivo en la forma correcta: Las paredes del estudio de radio son ___ (blanco).$$, 'solution', $$Las paredes del estudio de radio son blancas.$$)
      ),
      jsonb_build_object(
        'heading', $$Orientarse y orientar a alguien$$,
        'body', $$Cuando un oyente busca cómo llegar a un lugar, necesitas adverbios de lugar para indicarle el camino con claridad.$$,
        'highlights', array[$$a la derecha$$, $$a la izquierda$$, $$cerca de$$, $$enfrente de$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Adverbio / expresión$$, $$Contrario$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a la derecha$$, $$a la izquierda$$),
            jsonb_build_array($$cerca de$$, $$lejos de$$),
            jsonb_build_array($$delante de$$, $$detrás de$$),
            jsonb_build_array($$enfrente de$$, $$al lado de$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para preguntar por un camino se usan "¿por dónde?" (recorrido), "¿adónde?" (destino) y "¿de dónde?" (procedencia). Para orientar, se dan instrucciones con imperativo o infinitivo: gira a la derecha, sigue todo recto, bajas en la parada del mercado.$$),
        'example', jsonb_build_object('statement', $$Orienta a un oyente que busca la entrada del colegio desde la parada de autobús.$$, 'solution', $$Desde la parada de autobús, sigue todo recto y la entrada del colegio está a la izquierda, enfrente de la farmacia.$$),
        'fixation', jsonb_build_object('question', $$Completa: La biblioteca está ___ (contrario de "lejos de") de la sala de radio.$$, 'solution', $$La biblioteca está cerca de la sala de radio.$$)
      ),
      jsonb_build_object(
        'heading', $$Contar un hecho: el presente de indicativo$$,
        'body', $$Para el boletín de la radio, se cuenta un acontecimiento reciente o habitual usando el presente de indicativo, el tiempo más sencillo y directo para relatar algo que pasa o que suele pasar.$$,
        'highlights', array[$$corren$$, $$empieza$$, $$gritan$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Uso del presente$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$hecho actual$$, $$Los jugadores entran en el campo.$$),
            jsonb_build_array($$hecho habitual$$, $$Todos los años, hay una fiesta en el colegio.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$El presente de indicativo sirve tanto para un hecho que ocurre en el momento (un partido que se está jugando) como para un hecho habitual (algo que pasa cada año). Es el tiempo más usado para dar un relato en directo, como en un boletín de radio.$$),
        'example', jsonb_build_object('statement', $$Relata en presente el comienzo de un partido de fútbol del colegio.$$, 'solution', $$Los dos equipos entran en el campo, el árbitro silba y empieza el partido.$$),
        'fixation', jsonb_build_object('question', $$Conjuga en presente: Cada año, los alumnos ___ (celebrar) el fin del curso con una fiesta.$$, 'solution', $$Cada año, los alumnos celebran el fin del curso con una fiesta.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Para el boletín de la radio del colegio, debes hacer una pregunta a un compañero, describir un lugar, orientar a un oyente hacia el colegio, y contar en presente un acontecimiento reciente.$$,
      'questions', array[
        $$Haz una pregunta a un compañero usando una palabra interrogativa.$$,
        $$Describe un lugar del colegio con dos adjetivos.$$,
        $$Orienta a alguien hacia la entrada del colegio.$$,
        $$Cuenta en presente de indicativo un acontecimiento reciente.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con la palabra interrogativa adecuada: ¿___ vive tu familia?$$,
      'hint', $$Preguntas por un lugar.$$,
      'expected', $$¿Dónde vive tu familia?$$
    ),
    jsonb_build_object(
      'question', $$Completa con el adjetivo en la forma correcta: La sala de radio es ___ (pequeño) pero muy ___ (limpio).$$,
      'hint', $$Recuerda hacer concordar el adjetivo con "sala" (femenino singular).$$,
      'expected', $$La sala de radio es pequeña pero muy limpia.$$
    ),
    jsonb_build_object(
      'question', $$Completa con el adverbio de lugar contrario: La cantina no está lejos del patio, está ___ del patio.$$,
      'hint', $$Es el contrario exacto de "lejos de".$$,
      'expected', $$La cantina no está lejos del patio, está cerca del patio.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga en presente de indicativo: Todos los viernes, el club de español ___ (organizar) una actividad.$$,
      'hint', $$Es un hecho habitual, usa el presente.$$,
      'expected', $$Todos los viernes, el club de español organiza una actividad.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-echange-information';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tu colegio organiza un debate sobre el uso de las redes sociales entre los adolescentes. Debes pedir la opinión de tus compañeros, dar la tuya, mostrar tu acuerdo o desacuerdo, y convencer a alguien de moderar su uso de las pantallas.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pedir la opinión de alguien$$,
        'body', $$Antes de dar tu propia opinión, un buen debate empieza por preguntar la de los demás. Existen varias fórmulas para pedir la opinión de una persona, según el grado de formalidad.$$,
        'highlights', array[$$¿qué piensas de...?$$, $$¿qué te parece...?$$, $$¿cuál es tu opinión?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fórmula$$, $$Registro$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué piensas de...?$$, $$informal (un amigo)$$),
            jsonb_build_array($$¿Qué piensa usted de...?$$, $$formal (un adulto)$$),
            jsonb_build_array($$¿Qué te parece...?$$, $$informal$$),
            jsonb_build_array($$¿Cuál es tu opinión sobre...?$$, $$neutro$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Con "usted" se usa la tercera persona del singular: ¿qué piensa usted?, mientras que con "tú" se usa la segunda: ¿qué piensas tú? "¿Qué te parece?" siempre lleva el pronombre de complemento indirecto (me, te, le) antes del verbo "parecer".$$),
        'example', jsonb_build_object('statement', $$Pide la opinión de un compañero sobre las redes sociales.$$, 'solution', $$¿Qué piensas de las redes sociales?$$),
        'fixation', jsonb_build_object('question', $$Transforma en pregunta formal (con "usted"): "¿Qué piensas del debate?"$$, 'solution', $$¿Qué piensa usted del debate?$$)
      ),
      jsonb_build_object(
        'heading', $$Dar su opinión$$,
        'body', $$Para responder a una pregunta de opinión, el español usa varias expresiones equivalentes, todas seguidas del indicativo, que puedes variar para no repetir siempre la misma.$$,
        'highlights', array[$$según yo$$, $$pienso que$$, $$a mi parecer$$, $$para mí$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Según yo,...$$, $$Según yo, las redes sociales conectan a la gente.$$),
            jsonb_build_array($$A mi parecer,...$$, $$A mi parecer, hay que usarlas con moderación.$$),
            jsonb_build_array($$Opino que...$$, $$Opino que son útiles para estudiar.$$),
            jsonb_build_array($$Para mí,...$$, $$Para mí, el tiempo de pantalla es importante.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Todas estas expresiones de opinión van seguidas del indicativo (el modo normal): pienso que son útiles, opino que ayudan. No confundas "según yo" (mi punto de vista) con "según él/ella" (el punto de vista de otra persona).$$),
        'example', jsonb_build_object('statement', $$Da tu opinión sobre el tiempo que pasan los jóvenes en las redes sociales.$$, 'solution', $$A mi parecer, muchos jóvenes pasan demasiado tiempo en las redes sociales.$$),
        'fixation', jsonb_build_object('question', $$Completa con una expresión de opinión: ___ las redes sociales ayudan a mantener el contacto con la familia lejana.$$, 'solution', $$Según yo, las redes sociales ayudan a mantener el contacto con la familia lejana.$$)
      ),
      jsonb_build_object(
        'heading', $$Aprobar o desaprobar una opinión$$,
        'body', $$Durante un debate, también debes reaccionar a la opinión de otra persona: mostrar que estás de acuerdo, o al contrario, expresar tu desacuerdo con cortesía.$$,
        'highlights', array[$$estoy de acuerdo$$, $$tienes razón$$, $$no estoy de acuerdo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Aprobar$$, $$Desaprobar$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Estoy de acuerdo.$$, $$No estoy de acuerdo.$$),
            jsonb_build_array($$¡Claro! / Tienes razón.$$, $$No acepto lo que dices.$$),
            jsonb_build_array($$Apruebo tu idea.$$, $$Pienso lo contrario.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Estar de acuerdo" siempre se construye con "con": estoy de acuerdo con tu idea, estoy de acuerdo contigo. Para desaprobar con cortesía, se puede matizar en vez de decir un "no" brusco: "no estoy totalmente de acuerdo" es más suave que "no estoy de acuerdo".$$),
        'example', jsonb_build_object('statement', $$Expresa tu desacuerdo con la idea de prohibir totalmente las redes sociales.$$, 'solution', $$No estoy de acuerdo con prohibir totalmente las redes sociales.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi amigo piensa que las redes sociales son peligrosas, y yo ___ (estar de acuerdo) con él.$$, 'solution', $$Mi amigo piensa que las redes sociales son peligrosas, y yo estoy de acuerdo con él.$$)
      ),
      jsonb_build_object(
        'heading', $$Convencer a alguien: TENER QUE + infinitivo$$,
        'body', $$Después del debate, quizás quieras convencer a un compañero de cambiar de comportamiento. La estructura más usada para esto es "tener que" seguido de un infinitivo.$$,
        'highlights', array[$$tienes que$$, $$tenemos que$$, $$tenéis que$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tener que + infinitivo$$, $$Tienes que limitar el tiempo de pantalla.$$),
            jsonb_build_array($$tener que + infinitivo$$, $$Tenemos que hablar de esto con los padres.$$),
            jsonb_build_array($$tener que + infinitivo$$, $$Tenéis que usar las redes con moderación.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Tener que" es un verbo irregular (tengo, tienes, tiene, tenemos, tenéis, tienen) seguido siempre de un infinitivo, sin preposición: tienes que estudiar (no "tienes que a estudiar"). Es la forma más directa de convencer o dar una obligación fuerte.$$),
        'example', jsonb_build_object('statement', $$Convence a un amigo de dejar el móvil durante las comidas.$$, 'solution', $$Tienes que dejar el móvil durante las comidas.$$),
        'fixation', jsonb_build_object('question', $$Completa con "tener que": Vosotros ___ (tener que, descansar) la vista después de tanto tiempo en pantalla.$$, 'solution', $$Vosotros tenéis que descansar la vista después de tanto tiempo en pantalla.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En el debate sobre las redes sociales, debes pedir la opinión de un compañero, dar la tuya, reaccionar con acuerdo o desacuerdo, y convencer a alguien de moderar su uso de las pantallas.$$,
      'questions', array[
        $$Pide la opinión de un compañero sobre un tema del debate.$$,
        $$Da tu opinión usando una expresión como "pienso que" o "a mi parecer".$$,
        $$Reacciona con acuerdo o desacuerdo a una opinión.$$,
        $$Convence a alguien usando "tener que" + infinitivo.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Transforma en pregunta formal: "¿Qué piensas de las redes sociales?" (dirigido a un adulto)$$,
      'hint', $$Con "usted" se usa la tercera persona del verbo.$$,
      'expected', $$¿Qué piensa usted de las redes sociales?$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de opinión: ___ es importante hablar cara a cara, no solo por mensaje.$$,
      'hint', $$Usa "a mi parecer", "según yo" o "opino que".$$,
      'expected', $$A mi parecer, es importante hablar cara a cara, no solo por mensaje.$$
    ),
    jsonb_build_object(
      'question', $$Completa: Nuestro profesor piensa que hay que limitar el móvil en clase, y nosotros ___ (estar de acuerdo).$$,
      'hint', $$"Estar de acuerdo" se construye con "con".$$,
      'expected', $$Nuestro profesor piensa que hay que limitar el móvil en clase, y nosotros estamos de acuerdo con él.$$
    ),
    jsonb_build_object(
      'question', $$Convence a un amigo con "tener que": (él necesita dormir más)$$,
      'hint', $$Usa "tener que" + infinitivo con "tú".$$,
      'expected', $$Tienes que dormir más.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-opinion';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un canal de YouTube hispanohablante te invita a grabar un vídeo con tus compañeros: debes preguntarles sus gustos, expresar los tuyos con varios verbos, preguntarles su preferencia entre varias opciones, y decir cuál es la tuya.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Preguntar por los gustos de alguien$$,
        'body', $$Antes de expresar tus propios gustos, es útil saber preguntar por los de otra persona, usando distintos verbos según lo que quieres saber.$$,
        'highlights', array[$$¿qué te gusta?$$, $$¿qué te encanta?$$, $$¿te interesa...?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pregunta$$, $$Verbo usado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué te gusta?$$, $$gustar$$),
            jsonb_build_array($$¿Qué te encanta?$$, $$encantar$$),
            jsonb_build_array($$¿Te interesan las lenguas?$$, $$interesar$$),
            jsonb_build_array($$¿Cuál es tu gusto sobre la música?$$, $$el gusto (sustantivo)$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Estas preguntas usan el mismo tipo de construcción que "gustar": pronombre (te, le) + verbo + sujeto real. Con "usted" se dice "¿qué le gusta?" en vez de "¿qué te gusta?". "El gusto" también existe como sustantivo: ¿cuál es tu gusto en la música?$$),
        'example', jsonb_build_object('statement', $$Pregunta a un invitado si le interesan los deportes.$$, 'solution', $$¿Te interesan los deportes?$$),
        'fixation', jsonb_build_object('question', $$Transforma en pregunta formal: "¿Qué te encanta hacer los fines de semana?"$$, 'solution', $$¿Qué le encanta hacer los fines de semana?$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar los gustos: verbos como GUSTAR$$,
        'body', $$Existen varios verbos que se construyen igual que "gustar" (pronombre + verbo en singular o plural según lo que sigue), y que te permiten variar la manera de hablar de tus gustos.$$,
        'highlights', array[$$gustar$$, $$encantar$$, $$interesar$$, $$agradar$$, $$apetecer$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verbo$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$gustar$$, $$Me gusta la música latina.$$),
            jsonb_build_array($$encantar$$, $$Le encanta el fútbol.$$),
            jsonb_build_array($$interesar$$, $$Nos interesan los idiomas.$$),
            jsonb_build_array($$apetecer$$, $$Hoy no me apetece salir.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Todos estos verbos concuerdan con lo que sigue, no con la persona: me gusta el cine (singular), me gustan las películas (plural). "Apetecer" se usa a menudo con un infinitivo: me apetece descansar. "Agradar" es un sinónimo más formal de "gustar".$$),
        'example', jsonb_build_object('statement', $$Expresa que te interesan mucho las culturas hispánicas.$$, 'solution', $$Me interesan mucho las culturas hispánicas.$$),
        'fixation', jsonb_build_object('question', $$Completa: A mi amiga no ___ (apetecer) grabar el vídeo hoy, prefiere hacerlo mañana.$$, 'solution', $$A mi amiga no le apetece grabar el vídeo hoy, prefiere hacerlo mañana.$$)
      ),
      jsonb_build_object(
        'heading', $$Preguntar por las preferencias de alguien$$,
        'body', $$Cuando hay varias opciones posibles, ya no basta con preguntar por un gusto general: necesitas preguntar cuál es la preferida entre varias.$$,
        'highlights', array[$$¿qué prefieres?$$, $$¿cuál es tu favorito?$$, $$¿qué eliges?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pregunta$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué prefieres?$$, $$elegir entre dos o más opciones$$),
            jsonb_build_array($$¿Cuál es tu favorito/a?$$, $$identificar el elemento preferido$$),
            jsonb_build_array($$¿Qué te gusta más?$$, $$comparar dos gustos$$),
            jsonb_build_array($$¿Qué eliges?$$, $$pedir una decisión$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Favorito/a" concuerda en género con el sustantivo al que se refiere: mi color favorito, mi canción favorita. "¿Cuál?" se usa para elegir dentro de un conjunto ya conocido, mientras que "¿qué?" es más general.$$),
        'example', jsonb_build_object('statement', $$Pregunta a un compañero cuál es su plato favorito.$$, 'solution', $$¿Cuál es tu plato favorito?$$),
        'fixation', jsonb_build_object('question', $$Completa: Entre el fútbol y el baloncesto, ¿qué deporte ___ (preferir, tú)?$$, 'solution', $$Entre el fútbol y el baloncesto, ¿qué deporte prefieres?$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar las preferencias: PREFERIR, optar por, escoger$$,
        'body', $$Para responder y expresar tu preferencia con precisión, dispones del verbo "preferir" y de otras expresiones equivalentes que enriquecen tu vídeo.$$,
        'highlights', array[$$prefiero$$, $$opto por$$, $$escojo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$PREFERIR (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$prefiero$$),
            jsonb_build_array($$tú$$, $$prefieres$$),
            jsonb_build_array($$nosotros$$, $$preferimos$$),
            jsonb_build_array($$ellos$$, $$prefieren$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Preferir" es irregular: la "e" de la raíz cambia en "ie" en todas las personas excepto "nosotros" y "vosotros" (prefiero, prefieres, preferimos). "Optar por" siempre lleva la preposición "por": opto por el español. "Escoger" y "elegir" son sinónimos regulares de "preferir" en este contexto.$$),
        'example', jsonb_build_object('statement', $$Expresa tu preferencia entre el cine y la música.$$, 'solution', $$Entre el cine y la música, prefiero la música.$$),
        'fixation', jsonb_build_object('question', $$Completa: Nosotros ___ (optar por) grabar el vídeo el sábado en vez del domingo.$$, 'solution', $$Nosotros optamos por grabar el vídeo el sábado en vez del domingo.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En tu vídeo para el canal de YouTube, debes preguntar a un compañero sus gustos, expresar los tuyos con un verbo variado, preguntar su preferencia entre dos opciones, y expresar la tuya con "preferir" u otra expresión equivalente.$$,
      'questions', array[
        $$Pregunta a alguien qué le gusta o qué le interesa.$$,
        $$Expresa un gusto tuyo usando un verbo como "encantar" o "apetecer".$$,
        $$Pregunta a alguien cuál es su favorito/a entre varias opciones.$$,
        $$Expresa tu preferencia usando "preferir" u "optar por".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: A mi hermano ___ (interesar) mucho la cultura hispánica.$$,
      'hint', $$"Interesar" se construye como "gustar".$$,
      'expected', $$A mi hermano le interesa mucho la cultura hispánica.$$
    ),
    jsonb_build_object(
      'question', $$Completa: A nosotros nos ___ (encantar) grabar vídeos para el canal.$$,
      'hint', $$"Encantar" concuerda con lo que sigue: aquí es un infinitivo, singular.$$,
      'expected', $$A nosotros nos encanta grabar vídeos para el canal.$$
    ),
    jsonb_build_object(
      'question', $$Transforma en pregunta de preferencia: "¿Te gusta el chocolate?" (entre chocolate y vainilla)$$,
      'hint', $$Usa "preferir" o "gustar más" para comparar dos opciones.$$,
      'expected', $$Entre el chocolate y la vainilla, ¿qué prefieres?$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "preferir" con "ella": Entre el español y el inglés, ella ___ el español.$$,
      'hint', $$"Preferir" cambia la e en ie, excepto con "nosotros/vosotros".$$,
      'expected', $$Entre el español y el inglés, ella prefiere el español.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-gouts-preferences';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Escribes en la revista del club de español para contar la semana: una buena noticia que te dio alegría, un momento triste, una disculpa que tuviste que pedir o aceptar, y algo que lamentas o que, al contrario, te da igual.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Expresar la alegría$$,
        'body', $$Cuando algo te hace feliz, el español dispone de varias expresiones fijas para manifestar tu alegría, además del simple "estoy contento".$$,
        'highlights', array[$$¡qué alegría!$$, $$estoy contento/a$$, $$me alegro$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Qué alegría!$$, $$exclamación general$$),
            jsonb_build_array($$Estoy contento/a.$$, $$estado personal$$),
            jsonb_build_array($$Me alegro.$$, $$reacción a una noticia$$),
            jsonb_build_array($$¡Fenomenal! / ¡Fantástico!$$, $$entusiasmo$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Contento/a" concuerda en género con quien habla: un chico dice "estoy contento", una chica dice "estoy contenta". "¡Qué alegría!" es una exclamación invariable que se puede usar sola o seguida de una causa: ¡Qué alegría verte!$$),
        'example', jsonb_build_object('statement', $$Expresa tu alegría al ganar un concurso de español.$$, 'solution', $$¡Qué alegría! Estoy muy contento de haber ganado el concurso.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi hermana ___ (estar) muy ___ (contento) por su nueva nota.$$, 'solution', $$Mi hermana está muy contenta por su nueva nota.$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar la pena o la tristeza$$,
        'body', $$De la misma manera, existen expresiones fijas para manifestar tristeza o pena ante una situación difícil.$$,
        'highlights', array[$$¡qué pena!$$, $$¡qué lástima!$$, $$estoy triste$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Qué pena!$$, $$exclamación general$$),
            jsonb_build_array($$¡Qué lástima!$$, $$lamentar algo$$),
            jsonb_build_array($$Estoy triste.$$, $$estado personal$$),
            jsonb_build_array($$Me da pena.$$, $$reacción a una noticia triste$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Triste" tiene una sola forma para masculino y femenino (estoy triste), a diferencia de "contento/a". "Me da pena" se construye como "gustar": me da pena, te da pena, le da pena + la causa.$$),
        'example', jsonb_build_object('statement', $$Expresa tu pena porque un amigo se muda a otra ciudad.$$, 'solution', $$¡Qué pena! Estoy triste porque mi amigo se muda a otra ciudad.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi equipo perdió el partido, ___.$$, 'solution', $$Mi equipo perdió el partido, ¡qué lástima!$$)
      ),
      jsonb_build_object(
        'heading', $$Pedir y aceptar disculpas$$,
        'body', $$Cuando has molestado a alguien, necesitas saber disculparte con las fórmulas adecuadas, y también saber aceptar las disculpas de otra persona.$$,
        'highlights', array[$$discúlpame$$, $$lo siento$$, $$no pasa nada$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Para disculparse$$, $$Para aceptar$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Discúlpame!$$, $$No pasa nada.$$),
            jsonb_build_array($$Perdón.$$, $$No te preocupes.$$),
            jsonb_build_array($$Lo siento / lo lamento.$$, $$De acuerdo, vale.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Discúlpame" es un imperativo con el pronombre pegado al final ("me"), dirigido directamente a la persona ofendida. "Lo siento" y "lo lamento" son sinónimos y siempre llevan el pronombre neutro "lo" antes del verbo.$$),
        'example', jsonb_build_object('statement', $$Discúlpate con un compañero por haber llegado tarde a la reunión del club.$$, 'solution', $$Lo siento, discúlpame por llegar tarde a la reunión.$$),
        'fixation', jsonb_build_object('question', $$Tu amigo se disculpa contigo diciendo "perdón, no quería molestarte". ¿Qué le respondes?$$, 'solution', $$No pasa nada, no te preocupes.$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar el arrepentimiento o la indiferencia$$,
        'body', $$Por último, puedes expresar que lamentas algo que has hecho (arrepentimiento), o al contrario, que una situación no te importa (indiferencia).$$,
        'highlights', array[$$me arrepiento$$, $$deploro$$, $$me da igual$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Arrepentimiento$$, $$Indiferencia$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Me arrepiento.$$, $$Me da igual.$$),
            jsonb_build_array($$Lo lamento.$$, $$No importa.$$),
            jsonb_build_array($$Deploro lo que ha pasado.$$, $$¡Qué más da!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Arrepentirse" es un verbo pronominal: me arrepiento, te arrepientes, se arrepiente. "Deplorar" es más formal que "lamentar". "Me da igual" se construye como "gustar" (me da igual, te da igual, le da igual) y expresa que algo no te importa, sin necesariamente ser negativo.$$),
        'example', jsonb_build_object('statement', $$Expresa que te arrepientes de haber llegado tarde al club de español.$$, 'solution', $$Me arrepiento de haber llegado tarde al club de español.$$),
        'fixation', jsonb_build_object('question', $$Completa con una expresión de indiferencia: No sé qué película vamos a ver, la verdad es que ___.$$, 'solution', $$No sé qué película vamos a ver, la verdad es que me da igual.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En la revista del club de español, debes contar una buena noticia con alegría, un momento triste, una disculpa pedida o aceptada, y una situación que lamentas o que te da igual.$$,
      'questions', array[
        $$Expresa tu alegría por una buena noticia reciente.$$,
        $$Expresa tu tristeza o pena por una situación difícil.$$,
        $$Pide disculpas por algo, o acepta la disculpa de otra persona.$$,
        $$Expresa arrepentimiento o indiferencia frente a una situación.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: Ganamos el torneo del colegio, ___ (exclamación de alegría)!$$,
      'hint', $$Es la exclamación general para expresar la alegría.$$,
      'expected', $$Ganamos el torneo del colegio, ¡qué alegría!$$
    ),
    jsonb_build_object(
      'question', $$Completa: Mi amiga está muy ___ (triste) porque perdió su cuaderno de español.$$,
      'hint', $$"Triste" tiene una sola forma para masculino y femenino.$$,
      'expected', $$Mi amiga está muy triste porque perdió su cuaderno de español.$$
    ),
    jsonb_build_object(
      'question', $$Un compañero te dice "discúlpame por el retraso". ¿Qué le respondes para aceptar la disculpa?$$,
      'hint', $$Usa una de las fórmulas para aceptar disculpas.$$,
      'expected', $$No te preocupes, no pasa nada.$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de arrepentimiento: ___ no haber estudiado más para el examen.$$,
      'hint', $$Usa el verbo pronominal de arrepentimiento.$$,
      'expected', $$Me arrepiento de no haber estudiado más para el examen.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-sentiments';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Eres delegado de tu clase de 4ème y organizas, con tus compañeros, una campaña de sensibilización en el colegio: darás instrucciones durante los preparativos, aconsejarás a tus compañeros sobre sus deberes cívicos y su salud, prohibirás ciertos comportamientos peligrosos dentro del colegio, y desaconsejarás el consumo de alcohol antes de los exámenes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Dar una orden: el imperativo$$,
        'body', $$Para organizar los preparativos de la campaña, das instrucciones directas a tus compañeros. En español, esto se hace con el imperativo, cuya forma cambia según a quién te diriges: tú, usted, vosotros o ustedes.$$,
        'highlights', array[$$¡prepara!$$, $$¡prepare usted!$$, $$¡preparad!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Persona$$, $$PREPARAR (imperativo)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tú$$, $$¡prepara!$$),
            jsonb_build_array($$usted$$, $$¡prepare!$$),
            jsonb_build_array($$vosotros$$, $$¡preparad!$$),
            jsonb_build_array($$ustedes$$, $$¡preparen!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Con "vosotros", el imperativo se forma cambiando la -r final del infinitivo por una -d: preparar → preparad, colgar → colgad. Con "usted" y "ustedes", se usa la forma del subjuntivo presente: prepare, preparen. Con "tú", varios verbos son irregulares: poner → pon, hacer → haz, decir → di.$$),
        'example', jsonb_build_object('statement', $$Da la orden a todo el grupo (vosotros) de colgar los carteles de la campaña ahora mismo.$$, 'solution', $$¡Colgad los carteles de la campaña ahora mismo!$$),
        'fixation', jsonb_build_object('question', $$Da la orden con "usted" al director: (venir) a la reunión del club de español.$$, 'solution', $$¡Venga usted a la reunión del club de español!$$)
      ),
      jsonb_build_object(
        'heading', $$Aconsejar: DEBER + infinitivo / ACONSEJAR + infinitivo$$,
        'body', $$Durante la campaña, también aconsejas a tus compañeros sobre sus deberes cívicos y su salud, en vez de solo dar órdenes. Para eso, el español usa sobre todo "deber" o "aconsejar", ambos seguidos de un infinitivo.$$,
        'highlights', array[$$debéis$$, $$te aconsejo$$, $$tenéis que$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$deber + infinitivo$$, $$Debéis declarar vuestros ingresos si trabajáis los fines de semana.$$),
            jsonb_build_array($$aconsejar + infinitivo$$, $$Te aconsejo ahorrar una parte de tu dinero de bolsillo.$$),
            jsonb_build_array($$tener que + infinitivo$$, $$Tenéis que respetar las normas del colegio.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Deber" es un verbo regular en -er (debo, debes, debe, debemos, debéis, deben) seguido siempre de infinitivo. "Aconsejar" necesita un pronombre de complemento indirecto antes del verbo: te aconsejo, os aconsejamos, le aconsejo. "Tener que + infinitivo" expresa una obligación cercana al consejo.$$),
        'example', jsonb_build_object('statement', $$Aconseja a un compañero cuidar su salud antes de los exámenes.$$, 'solution', $$Te aconsejo cuidar tu salud antes de los exámenes.$$),
        'fixation', jsonb_build_object('question', $$Completa: Vosotros ___ (deber, informarse) sobre vuestros derechos como ciudadanos.$$, 'solution', $$Vosotros debéis informaros sobre vuestros derechos como ciudadanos.$$)
      ),
      jsonb_build_object(
        'heading', $$Prohibir: NO + subjuntivo presente$$,
        'body', $$Para prohibir un comportamiento peligroso en el colegio, como fumar, el español no usa el imperativo negativo directamente, sino "no" seguido del verbo en subjuntivo presente.$$,
        'highlights', array[$$no fumes$$, $$no fuméis$$, $$no fumen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Persona$$, $$FUMAR (prohibición)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tú$$, $$¡no fumes!$$),
            jsonb_build_array($$vosotros$$, $$¡no fuméis!$$),
            jsonb_build_array($$ustedes$$, $$¡no fumen!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$La regla es: NO + verbo en subjuntivo presente, en todas las personas y no solo con "usted/ustedes": "no fumes" (tú), "no fuméis" (vosotros), "no fumen" (ustedes). Esta forma es distinta de la del imperativo afirmativo, que no usa el subjuntivo.$$),
        'example', jsonb_build_object('statement', $$Prohíbe a todo el grupo (vosotros) fumar dentro del colegio.$$, 'solution', $$¡No fuméis dentro del colegio!$$),
        'fixation', jsonb_build_object('question', $$Prohíbe a un compañero (tú) traer sustancias prohibidas al colegio.$$, 'solution', $$¡No traigas sustancias prohibidas al colegio!$$)
      ),
      jsonb_build_object(
        'heading', $$Desaconsejar: NO ACONSEJAR / NO DEBER + infinitivo$$,
        'body', $$Antes de los exámenes, también quieres desaconsejar hábitos peligrosos como el consumo de alcohol, sin llegar a una prohibición tan firme.$$,
        'highlights', array[$$no debéis$$, $$no te aconsejo$$, $$lo mejor es que no$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$no deber + infinitivo$$, $$No debéis beber alcohol la noche antes del examen.$$),
            jsonb_build_array($$no aconsejar + infinitivo$$, $$No te aconsejo salir de fiesta esta semana.$$),
            jsonb_build_array($$lo mejor es que no + subjuntivo$$, $$Lo mejor es que no conduzcáis después de beber.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"No deber" y "no aconsejar" van seguidos de infinitivo, igual que sus formas afirmativas. "Lo mejor es que" exige el subjuntivo cuando va seguido de "no": lo mejor es que no + subjuntivo, una manera más suave de desaconsejar que una prohibición directa.$$),
        'example', jsonb_build_object('statement', $$Desaconseja a un compañero conducir después de haber bebido alcohol.$$, 'solution', $$No te aconsejo conducir después de haber bebido alcohol.$$),
        'fixation', jsonb_build_object('question', $$Completa: Lo mejor es que ___ (no, salir, vosotros) de noche antes de los exámenes.$$, 'solution', $$Lo mejor es que no salgáis de noche antes de los exámenes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Durante la campaña de sensibilización en tu colegio, debes dar una orden con el imperativo, aconsejar a un compañero sobre sus deberes cívicos, prohibir un comportamiento peligroso con subjuntivo, y desaconsejar el consumo de alcohol antes de los exámenes.$$,
      'questions', array[
        $$Da una orden con el imperativo, a "tú" o a "vosotros".$$,
        $$Aconseja algo usando "deber" o "aconsejar" + infinitivo.$$,
        $$Prohíbe un comportamiento con "no" + subjuntivo presente.$$,
        $$Desaconseja un hábito con "no deber" o "lo mejor es que no".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Da la orden con "tú": (poner) los carteles de la campaña en la pared.$$,
      'hint', $$"Poner" es irregular en imperativo con "tú": pon.$$,
      'expected', $$¡Pon los carteles de la campaña en la pared!$$
    ),
    jsonb_build_object(
      'question', $$Completa con "deber": Nosotros ___ (deber, respetar) las normas del colegio durante la campaña.$$,
      'hint', $$"Deber" es regular en -er, seguido de infinitivo.$$,
      'expected', $$Nosotros debemos respetar las normas del colegio durante la campaña.$$
    ),
    jsonb_build_object(
      'question', $$Prohíbe con "ustedes": (fumar) dentro del colegio.$$,
      'hint', $$Usa NO + subjuntivo presente con "ustedes".$$,
      'expected', $$¡No fumen dentro del colegio!$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de desaconsejar: ___ beber alcohol antes de los exámenes.$$,
      'hint', $$Usa "no debes" o "no te aconsejo".$$,
      'expected', $$No debes beber alcohol antes de los exámenes.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-ordre';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Es ist der erste Schultag nach den großen Ferien. Auf dem Schulhof triffst du eine neue Mitschülerin. Ihr begrüßt euch und lernt euch gegenseitig kennen: Namen, Herkunft und Wohnort.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Sich begrüßen: die richtige Tageszeit$$,
        'body', $$Auf Deutsch grüßt man nicht immer gleich: der passende Gruß hängt von der Tageszeit ab.$$,
        'highlights', array[$$guten Morgen$$, $$guten Tag$$, $$guten Abend$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Tageszeit$$, $$Gruß$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$von 4 bis 11 Uhr$$, $$Guten Morgen!$$),
            jsonb_build_array($$von 11 bis 17 Uhr$$, $$Guten Tag!$$),
            jsonb_build_array($$von 18 bis 22 Uhr$$, $$Guten Abend!$$),
            jsonb_build_array($$vor dem Schlafen$$, $$Gute Nacht!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Unter Jugendlichen benutzt man oft auch die informellen Grüße "hallo" oder "grüß dich", unabhängig von der Uhrzeit.$$),
        'example', jsonb_build_object('statement', $$Wie grüßt man einen Mitschüler um 15 Uhr?$$, 'solution', $$Man sagt: Guten Tag! oder einfach Hallo!$$),
        'fixation', jsonb_build_object('question', $$Welchen Gruß benutzt man um 20 Uhr?$$, 'solution', $$Um 20 Uhr sagt man: Guten Abend!$$)
      ),
      jsonb_build_object(
        'heading', $$Sich vorstellen: heißen, sein und haben$$,
        'body', $$Um sich vorzustellen, braucht man die Verben heißen, sein und haben im Präsens (Singular).$$,
        'highlights', array[$$heißen$$, $$sein$$, $$haben$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$ich-Form$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$heißen$$, $$ich heiße$$),
            jsonb_build_array($$sein$$, $$ich bin$$),
            jsonb_build_array($$haben$$, $$ich habe$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die drei Verben werden im Singular unterschiedlich konjugiert: du heißt/bist/hast, er/sie/es heißt/ist/hat. "heißen" und "sein" dienen zur Namensangabe (Ich heiße Aya. / Ich bin Aya.), "haben" dagegen zur Angabe eines Besitzes (Ich habe eine Schwester.).$$),
        'example', jsonb_build_object('statement', $$Wie stellt sich Kofi vor?$$, 'solution', $$Ich heiße Kofi, ich bin Ivorer, und ich habe eine Schwester.$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Ich ___ (heißen) Ama und ich ___ (haben) einen Bruder.$$, 'solution', $$Ich heiße Ama und ich habe einen Bruder.$$)
      ),
      jsonb_build_object(
        'heading', $$Herkunft und Wohnort: woher und wo$$,
        'body', $$Um zu sagen, woher man kommt und wo man wohnt, benutzt man zwei verschiedene Fragewörter mit je einer eigenen Präposition.$$,
        'highlights', array[$$woher$$, $$wo$$, $$aus$$, $$in$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Frage$$, $$Antwort$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Woher kommst du?$$, $$Ich komme aus der Elfenbeinküste.$$),
            jsonb_build_array($$Wo wohnst du?$$, $$Ich wohne in Bouaké.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Auf die Frage mit "woher" antwortet man mit der Präposition "aus" (+ Dativ); auf die Frage mit "wo" antwortet man mit der Präposition "in" (+ Dativ). Die beiden Fragen betreffen also zwei unterschiedliche Informationen: die Herkunft und den aktuellen Wohnort.$$),
        'example', jsonb_build_object('statement', $$Kannst du nach Herkunft und Wohnort fragen?$$, 'solution', $$Woher kommst du, und wo wohnst du?$$),
        'fixation', jsonb_build_object('question', $$Antworte: Woher kommst du? (Senegal)$$, 'solution', $$Ich komme aus dem Senegal.$$)
      ),
      jsonb_build_object(
        'heading', $$Mehrere Personen: der Plural und die Höflichkeitsform$$,
        'body', $$Wenn man über mehrere Personen spricht oder eine erwachsene Person respektvoll anspricht, ändert sich die Verbform.$$,
        'highlights', array[$$wir$$, $$ihr$$, $$Sie (Höflichkeitsform)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Person$$, $$kommen$$, $$wohnen$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$wir$$, $$kommen$$, $$wohnen$$),
            jsonb_build_array($$ihr$$, $$kommt$$, $$wohnt$$),
            jsonb_build_array($$sie/Sie$$, $$kommen$$, $$wohnen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Regelmäßige Verben wie kommen, wohnen, zeigen und machen bekommen im Plural die Endung -en (wir/sie/Sie) bzw. -t (ihr). Die Höflichkeitsform "Sie" wird benutzt, um eine erwachsene oder fremde Person respektvoll anzusprechen, zum Beispiel eine Lehrkraft.$$),
        'example', jsonb_build_object('statement', $$Wie fragt man eine Lehrerin höflich, woher sie kommt?$$, 'solution', $$Frau Koffi, woher kommen Sie?$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Ihr ___ (wohnen) in Yamoussoukro.$$, 'solution', $$Ihr wohnt in Yamoussoukro.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Nach dem ersten Schultag kommst du nach Hause. Deine Mutter möchte wissen, was du gelernt hast, und bittet dich, sie auf Deutsch zu begrüßen und dich vorzustellen.$$,
      'questions', array[
        $$Begrüße deine Mutter mit dem passenden Gruß für den Abend.$$,
        $$Stelle dich vor: sag deinen Namen und deine Herkunft.$$,
        $$Sag, wo du wohnst.$$,
        $$Frag höflich (mit "Sie"), woher ein Erwachsener kommt.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit "sein": Meine Freundin ___ Ivorerin.$$,
      'hint', $$"sein" in der 3. Person Singular: ist.$$,
      'expected', $$Meine Freundin ist Ivorerin.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz: ich / kommen / aus / Ghana$$,
      'hint', $$"aus" + Dativ: aus Ghana.$$,
      'expected', $$Ich komme aus Ghana.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "wohnen": Wir ___ in Korhogo.$$,
      'hint', $$Plural-Endung -en: wir wohnen.$$,
      'expected', $$Wir wohnen in Korhogo.$$
    ),
    jsonb_build_object(
      'question', $$Stell einem Lehrer höflich die Frage nach seinem Namen (mit "Sie").$$,
      'hint', $$Benutz die Sie-Form von "heißen".$$,
      'expected', $$Wie heißen Sie, bitte?$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-bienvenue-afrique';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deine Schule nimmt an einem Wettbewerb um die schönste Schule der Region teil. Du musst deine Schule, deinen Schulhof und deine Lehrkräfte auf Deutsch beschreiben.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Schule beschreiben$$,
        'body', $$Um seine Schule und die Personen dort zu beschreiben, braucht man Vokabular für Orte und passende Adjektive.$$,
        'highlights', array[$$der Schulhof$$, $$der Stundenplan$$, $$der Deutschlehrer$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Schulhof$$, $$der Platz im Freien vor der Schule$$),
            jsonb_build_array($$der Stundenplan$$, $$die Übersicht der Unterrichtsstunden$$),
            jsonb_build_array($$der Deutschlehrer$$, $$der Lehrer für das Fach Deutsch$$),
            jsonb_build_array($$die Hausaufgabe$$, $$die Übung, die man zu Hause macht$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Viele Adjektive haben ein festes Gegenteil: sauber ≠ schmutzig, streng ≠ nett, schwer ≠ leicht, schnell ≠ langsam. Damit kann man Orte und Personen genauer beschreiben.$$),
        'example', jsonb_build_object('statement', $$Wie ist der Schulhof deiner Schule?$$, 'solution', $$Der Schulhof ist groß und sauber.$$),
        'fixation', jsonb_build_object('question', $$Nenne das Gegenteil von "streng".$$, 'solution', $$Das Gegenteil von "streng" ist "nett".$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: der Akkusativ nach sehen und kaufen$$,
        'body', $$Das direkte Objekt eines Satzes (das Akkusativobjekt) verändert den bestimmten und unbestimmten Artikel im Maskulinum.$$,
        'highlights', array[$$der Akkusativ$$, $$den$$, $$einen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nominativ$$, $$Akkusativ (bestimmt)$$, $$Akkusativ (unbestimmt)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Lehrer$$, $$den Lehrer$$, $$einen Lehrer$$),
            jsonb_build_array($$die Tasche$$, $$die Tasche$$, $$eine Tasche$$),
            jsonb_build_array($$das Heft$$, $$das Heft$$, $$ein Heft$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Nur beim maskulinen Artikel ändert sich die Form im Akkusativ (der→den, ein→einen); der feminine und der neutrale Artikel bleiben gleich. Verben wie sehen, kaufen und haben verlangen ein Akkusativobjekt.$$),
        'example', jsonb_build_object('statement', $$Was siehst du auf dem Schulhof?$$, 'solution', $$Ich sehe einen Lehrer und eine Schülerin.$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Akkusativ: Kaufst du ___ (ein Kugelschreiber)?$$, 'solution', $$Kaufst du einen Kugelschreiber?$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: kaufen und lernen im Präsens und im Perfekt$$,
        'body', $$Um über regelmäßige Handlungen und über bereits abgeschlossene Handlungen zu sprechen, braucht man das Präsens und das Perfekt.$$,
        'highlights', array[$$das Perfekt$$, $$gekauft$$, $$gelernt$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Präsens$$, $$Perfekt$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$ich lerne$$, $$ich habe gelernt$$),
            jsonb_build_array($$du kaufst$$, $$du hast gekauft$$),
            jsonb_build_array($$wir machen$$, $$wir haben gemacht$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Regelmäßige Verben bilden das Perfekt mit dem Hilfsverb "haben" und dem Partizip II auf ge-...-t (gelernt, gekauft, gemacht). Das Partizip steht am Ende des Satzes.$$),
        'example', jsonb_build_object('statement', $$Was hast du gestern in der Schule gemacht?$$, 'solution', $$Ich habe die Hausaufgabe gemacht und ein neues Heft gekauft.$$),
        'fixation', jsonb_build_object('question', $$Bilde das Perfekt: ich / lernen / die Vokabeln$$, 'solution', $$Ich habe die Vokabeln gelernt.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du nimmst an einem Wettbewerb über die schönste Schule teil und musst deine Schule und deine Lehrkräfte vorstellen.$$,
      'questions', array[
        $$Beschreibe den Schulhof deiner Schule (mit einem Adjektiv und seinem Gegenteil).$$,
        $$Sag, was du in deiner Schultasche hast (im Akkusativ).$$,
        $$Beschreibe deinen Deutschlehrer / deine Deutschlehrerin mit zwei Adjektiven.$$,
        $$Sag, was du gestern für die Schule gemacht hast (im Perfekt).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze im Akkusativ: Siehst du ___ (die Lehrerin)?$$,
      'hint', $$Feminin bleibt im Akkusativ gleich.$$,
      'expected', $$Siehst du die Lehrerin?$$
    ),
    jsonb_build_object(
      'question', $$Nenne das Gegenteil von "schmutzig".$$,
      'hint', $$Es ist das Gegenteil von sauber.$$,
      'expected', $$Das Gegenteil von "schmutzig" ist "sauber".$$
    ),
    jsonb_build_object(
      'question', $$Bilde das Perfekt: wir / kaufen / ein Wörterbuch$$,
      'hint', $$haben + ge...t: gekauft.$$,
      'expected', $$Wir haben ein Wörterbuch gekauft.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Akkusativ: Ich habe ___ (ein Heft) und ___ (ein Kugelschreiber).$$,
      'hint', $$Neutrum bleibt gleich; maskulin wird "einen".$$,
      'expected', $$Ich habe ein Heft und einen Kugelschreiber.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-vie-ecole';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deine Freundin Adjoua hat heute Geburtstag. Die ganze Klasse feiert mit ihr: man fragt nach ihrem neuen Alter, schenkt ihr etwas und wünscht ihr alles Gute.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Zahlen von 0 bis 20$$,
        'body', $$Um sein Alter zu nennen, muss man zuerst die Zahlen von 0 bis 20 beherrschen.$$,
        'highlights', array[$$null$$, $$zehn$$, $$zwanzig$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zahl$$, $$Deutsch$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$0$$, $$null$$),
            jsonb_build_array($$5$$, $$fünf$$),
            jsonb_build_array($$10$$, $$zehn$$),
            jsonb_build_array($$15$$, $$fünfzehn$$),
            jsonb_build_array($$20$$, $$zwanzig$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die Zahlen von 13 bis 19 enden auf "-zehn" (dreizehn, vierzehn...), und man muss sie auswendig lernen, um sein Alter richtig auszusprechen.$$),
        'example', jsonb_build_object('statement', $$Wie schreibt man die Zahl 14 auf Deutsch?$$, 'solution', $$Man schreibt: vierzehn.$$),
        'fixation', jsonb_build_object('question', $$Schreib die Zahl 17 auf Deutsch.$$, 'solution', $$siebzehn$$)
      ),
      jsonb_build_object(
        'heading', $$Nach dem Alter fragen und antworten$$,
        'body', $$Um das Alter einer Person zu erfragen, benutzt man "wie alt", gefolgt vom Verb "sein".$$,
        'highlights', array[$$wie alt$$, $$Jahre alt$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Frage$$, $$Antwort$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Wie alt bist du?$$, $$Ich bin dreizehn Jahre alt.$$),
            jsonb_build_array($$Wie alt seid ihr?$$, $$Wir sind vierzehn Jahre alt.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Im Plural bekommen "sein", "haben", "heißen" und "sagen" eigene Formen: wir sind/haben/heißen/sagen, ihr seid/habt/heißt/sagt, sie/Sie sind/haben/heißen/sagen.$$),
        'example', jsonb_build_object('statement', $$Wie fragst du zwei Freunde nach ihrem Alter?$$, 'solution', $$Wie alt seid ihr?$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Plural: Wir ___ (sein) zwölf Jahre alt.$$, 'solution', $$Wir sind zwölf Jahre alt.$$)
      ),
      jsonb_build_object(
        'heading', $$Am Geburtstag: mit "werden" ein neues Alter erreichen$$,
        'body', $$An seinem Geburtstag wird man ein Jahr älter. Dafür benutzt man das Verb "werden" statt "sein".$$,
        'highlights', array[$$werden$$, $$der Geburtstag$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"werden" konjugiert: ich werde, du wirst, er/sie/es wird, wir werden, ihr werdet, sie/Sie werden. Struktur: Person + werden + Zahl + Jahre alt.$$),
        'example', jsonb_build_object('statement', $$Wie alt wird dein Bruder morgen?$$, 'solution', $$Mein Bruder wird morgen fünfzehn Jahre alt.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "werden": Meine Schwester ___ heute elf Jahre alt.$$, 'solution', $$Meine Schwester wird heute elf Jahre alt.$$)
      ),
      jsonb_build_object(
        'heading', $$Gute Wünsche und ein Geschenk machen (Dativ)$$,
        'body', $$Am Geburtstag wünscht man der Person alles Gute und macht ihr oft ein Geschenk. Die beschenkte Person steht dabei im Dativ.$$,
        'highlights', array[$$schenken$$, $$der Dativ$$, $$Herzlichen Glückwunsch$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nominativ$$, $$Dativ$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Freund$$, $$dem Freund$$),
            jsonb_build_array($$die Freundin$$, $$der Freundin$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Der klassische deutsche Geburtstagswunsch ist "Herzlichen Glückwunsch zum Geburtstag!". Bei "schenken" steht die beschenkte Person im Dativ und die Sache im Akkusativ.$$),
        'example', jsonb_build_object('statement', $$Was schenkst du deinem Freund zum Geburtstag?$$, 'solution', $$Ich schenke meinem Freund ein Buch.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz: wir / schenken / die Schwester / eine Kette$$, 'solution', $$Wir schenken der Schwester eine Kette.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deine Klasse feiert den Geburtstag von Adjoua. Ihr fragt nach ihrem Alter, wünscht ihr alles Gute und macht ihr ein Geschenk.$$,
      'questions', array[
        $$Frag Adjoua, wie alt sie heute wird.$$,
        $$Sag, wie alt du selbst bist.$$,
        $$Schreib den klassischen deutschen Geburtstagswunsch.$$,
        $$Sag, was ihr Adjoua schenkt (im Dativ).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Schreib die Zahl 17 auf Deutsch.$$,
      'hint', $$Sie endet auf "-zehn".$$,
      'expected', $$siebzehn$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "werden": Ihr ___ (werden) heute vierzehn Jahre alt.$$,
      'hint', $$"werden" in der ihr-Form: werdet.$$,
      'expected', $$Ihr werdet heute vierzehn Jahre alt.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Plural mit "sein": Wir ___ dreizehn Jahre alt.$$,
      'hint', $$Plural von sein: sind.$$,
      'expected', $$Wir sind dreizehn Jahre alt.$$
    ),
    jsonb_build_object(
      'question', $$Setze die Person in den Dativ: Ich schenke ___ (der Bruder) ein Spiel.$$,
      'hint', $$"der" wird im Dativ zu "dem".$$,
      'expected', $$Ich schenke dem Bruder ein Spiel.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-joyeux-anniversaire';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Auf dem Markt in Abidjan probiert eine deutsche Austauschschülerin zum ersten Mal ivorisches Essen. Ihre Gastfamilie ermutigt sie, verschiedene Gerichte zu probieren.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Essen und Geschmack$$,
        'body', $$Um über Essen und Geschmack zu sprechen, braucht man Vokabular für Lebensmittel und Geschmacksrichtungen.$$,
        'highlights', array[$$das Essen$$, $$probieren$$, $$schmecken$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Obst$$, $$Bananen, Ananas, Mangos$$),
            jsonb_build_array($$der Reis$$, $$ein wichtiges Grundnahrungsmittel$$),
            jsonb_build_array($$süß$$, $$wie Zucker$$),
            jsonb_build_array($$scharf$$, $$wie Pfeffer oder Chili$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Das Verb "probieren" bedeutet, ein Gericht zum ersten Mal zu kosten.$$),
        'example', jsonb_build_object('statement', $$Was isst du gern auf dem Markt?$$, 'solution', $$Ich esse gern Mangos und Reis.$$),
        'fixation', jsonb_build_object('question', $$Nenne ein süßes und ein scharfes Gericht.$$, 'solution', $$Die Mango ist süß, und der Pfeffer ist scharf.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: der Imperativ, um jemanden aufzufordern$$,
        'body', $$Um jemanden freundlich aufzufordern, etwas zu tun (zum Beispiel ein Gericht zu probieren), benutzt man den Imperativ. Er hat vier Formen: du, wir, ihr und die Höflichkeitsform Sie.$$,
        'highlights', array[$$der Imperativ$$, $$probier$$, $$probiert$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Person$$, $$Imperativform$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$du$$, $$Probier(e) den Fisch!$$),
            jsonb_build_array($$wir$$, $$Probieren wir den Fisch!$$),
            jsonb_build_array($$ihr$$, $$Probiert den Fisch!$$),
            jsonb_build_array($$Sie$$, $$Probieren Sie den Fisch!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Der du-Imperativ entspricht dem Verbstamm, manchmal mit einem zusätzlichen -e (probier/probiere); der ihr-Imperativ entspricht der ihr-Form ohne Pronomen (probiert); der Sie-Imperativ stellt das Verb vor "Sie" (Probieren Sie). Einige Verben sind unregelmäßig: essen → iss!, nehmen → nimm!, geben → gib!, lesen → lies!$$),
        'example', jsonb_build_object('statement', $$Wie fordert man einen Freund auf, den Kuchen zu probieren?$$, 'solution', $$Probier den Kuchen!$$),
        'fixation', jsonb_build_object('question', $$Bilde den Imperativ (du-Form): essen / die Suppe$$, 'solution', $$Iss die Suppe!$$)
      ),
      jsonb_build_object(
        'heading', $$Vorlieben ausdrücken: schmecken und gern/lieber$$,
        'body', $$Um zu sagen, ob einem ein Gericht gefällt, benutzt man "schmecken" mit dem Dativ, oder "gern"/"lieber" nach dem konjugierten Verb.$$,
        'highlights', array[$$schmecken$$, $$gern$$, $$lieber$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"schmecken" braucht die Person im Dativ: Das Essen schmeckt mir/dir/ihm gut. "gern" steht direkt nach dem Verb (ich esse gern Reis); die Steigerung ist "lieber" (ich esse lieber Fisch).$$),
        'example', jsonb_build_object('statement', $$Schmeckt dir das Gericht?$$, 'solution', $$Ja, es schmeckt mir sehr gut, aber ich esse lieber Fufu.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "schmecken": Der Kuchen ___ ihnen gut.$$, 'solution', $$Der Kuchen schmeckt ihnen gut.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du isst mit einem deutschen Gast zu Mittag und ermutigst ihn, verschiedene ivorische Gerichte zu probieren.$$,
      'questions', array[
        $$Fordere den Gast höflich auf (mit "Sie"), den Fisch zu probieren.$$,
        $$Fordere zwei Freunde auf (ihr-Form), die Suppe zu probieren.$$,
        $$Frag, wie ihm das Gericht schmeckt.$$,
        $$Sag, was du lieber isst.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Bilde den Imperativ (du-Form): probieren / die Banane$$,
      'hint', $$Verbstamm + e.$$,
      'expected', $$Probier(e) die Banane!$$
    ),
    jsonb_build_object(
      'question', $$Bilde den Imperativ (Sie-Form): nehmen / etwas Reis$$,
      'hint', $$Bei der Sie-Form bleibt die Infinitivform: Nehmen Sie...$$,
      'expected', $$Nehmen Sie etwas Reis!$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "schmecken": Das Gericht ___ mir sehr gut.$$,
      'hint', $$3. Person Singular: schmeckt.$$,
      'expected', $$Das Gericht schmeckt mir sehr gut.$$
    ),
    jsonb_build_object(
      'question', $$Bilde den Imperativ (ihr-Form): essen / die Suppe$$,
      'hint', $$Der ihr-Imperativ entspricht der ihr-Form: esst.$$,
      'expected', $$Esst die Suppe!$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-goute-donc';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dein Freund Kouassi ist krank und bleibt zu Hause. Du besuchst ihn, sprichst mit ihm über seinen Arztbesuch und gibst ihm Ratschläge.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: beim Arzt$$,
        'body', $$Wenn man krank ist, geht man ins Krankenhaus und trifft dort einen Arzt oder eine Ärztin, der/die einen untersucht.$$,
        'highlights', array[$$das Krankenhaus$$, $$der Arzt$$, $$der Schmerz$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Krankenhaus$$, $$der Ort, wohin kranke Menschen gehen$$),
            jsonb_build_array($$der Patient / die Patientin$$, $$eine kranke Person beim Arzt$$),
            jsonb_build_array($$untersuchen$$, $$den Gesundheitszustand prüfen$$),
            jsonb_build_array($$verschreiben$$, $$ein Medikament auf einem Rezept aufschreiben$$),
            jsonb_build_array($$die Spritze$$, $$eine Injektion mit einer Nadel$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um sein Befinden zu beschreiben, sagt man "Es geht mir schlecht" (allgemein) oder "Es tut mir weh" (an einer bestimmten Stelle).$$),
        'example', jsonb_build_object('statement', $$Was macht ein Arzt, wenn ein Patient krank ist?$$, 'solution', $$Er untersucht ihn und verschreibt ihm ein Medikament.$$),
        'fixation', jsonb_build_object('question', $$Was bekommt man beim Arzt, wenn man ein Medikament braucht?$$, 'solution', $$Man bekommt ein Rezept.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Körperteile, Pluralformen und wehtun$$,
        'body', $$Deutsche Nomen bilden den Plural auf verschiedene Weisen; das gilt auch für die Körperteile, über die man beim Arzt spricht.$$,
        'highlights', array[$$der Plural$$, $$wehtun$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Singular$$, $$Plural$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Auge$$, $$die Augen$$),
            jsonb_build_array($$die Hand$$, $$die Hände$$),
            jsonb_build_array($$das Bein$$, $$die Beine$$),
            jsonb_build_array($$der Finger$$, $$die Finger$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Bei einem Körperteil im Singular sagt man "... tut mir weh", im Plural "... tun mir weh". Da es mehrere Pluralformen gibt (Endung -e, -er, -n, Umlaut oder keine Änderung), muss man jedes Nomen mit seinem Plural lernen.$$),
        'example', jsonb_build_object('statement', $$Was sagst du, wenn beide Augen schmerzen?$$, 'solution', $$Meine Augen tun mir weh.$$),
        'fixation', jsonb_build_object('question', $$Bilde den Plural: der Finger tut mir weh. (mehrere Finger)$$, 'solution', $$Die Finger tun mir weh.$$)
      ),
      jsonb_build_object(
        'heading', $$Ratschläge geben: sollen und müssen$$,
        'body', $$Um einem Kranken einen guten Rat zu geben, benutzt man die Modalverben "sollen" oder "müssen", gefolgt vom Infinitiv am Satzende.$$,
        'highlights', array[$$sollen$$, $$müssen$$, $$der Ratschlag$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Problem$$, $$Ratschlag$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Zahnschmerzen$$, $$Du sollst dir regelmäßig die Zähne putzen.$$),
            jsonb_build_array($$Malaria$$, $$Du musst unter einem Moskitonetz schlafen.$$),
            jsonb_build_array($$Durchfall$$, $$Du sollst nur sauberes Wasser trinken.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"sollen" konjugiert: ich soll, du sollst, er/sie/es soll, wir sollen, ihr sollt, sie/Sie sollen. "müssen" konjugiert: ich muss, du musst, er/sie/es muss. Beide stehen an zweiter Stelle im Satz; der Infinitiv steht am Ende.$$),
        'example', jsonb_build_object('statement', $$Was soll ein Kranker mit Fieber machen?$$, 'solution', $$Er soll viel Wasser trinken und sich ausruhen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "müssen": Du ___ (müssen) ein Medikament gegen die Schmerzen kaufen.$$, 'solution', $$Du musst ein Medikament gegen die Schmerzen kaufen.$$)
      ),
      jsonb_build_object(
        'heading', $$Gute Besserung wünschen$$,
        'body', $$Wenn jemand krank ist, wünscht man ihm auf Deutsch gute Besserung.$$,
        'highlights', array[$$Gute Besserung$$, $$krank sein$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Der klassische Wunsch für einen Kranken ist "Gute Besserung!". Man kann auch sagen: "Ich hoffe, es geht dir bald besser."$$),
        'example', jsonb_build_object('statement', $$Was sagt man einem kranken Freund zum Abschied?$$, 'solution', $$Gute Besserung! Ich hoffe, es geht dir bald besser.$$),
        'fixation', jsonb_build_object('question', $$Schreib den klassischen deutschen Wunsch für einen Kranken.$$, 'solution', $$Gute Besserung!$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dein Freund Kouassi liegt krank im Bett. Du besuchst ihn, fragst nach seinen Schmerzen und gibst ihm Ratschläge.$$,
      'questions', array[
        $$Frag Kouassi, was ihm wehtut.$$,
        $$Nenne zwei Körperteile im Plural.$$,
        $$Gib Kouassi einen Ratschlag mit "sollen" oder "müssen".$$,
        $$Wünsche Kouassi gute Besserung.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze im Plural: Meine ___ (das Bein) tun mir weh.$$,
      'hint', $$das Bein → die Beine.$$,
      'expected', $$Meine Beine tun mir weh.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "sollen": Ihr ___ (sollen) zum Arzt gehen.$$,
      'hint', $$"sollen" in der ihr-Form: sollt.$$,
      'expected', $$Ihr sollt zum Arzt gehen.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz: der Arzt / verschreiben / ein Medikament$$,
      'hint', $$Präsens, 3. Person Singular: verschreibt.$$,
      'expected', $$Der Arzt verschreibt ein Medikament.$$
    ),
    jsonb_build_object(
      'question', $$Schreib den klassischen deutschen Wunsch für einen Kranken.$$,
      'hint', $$Er beginnt mit "Gute..."$$,
      'expected', $$Gute Besserung!$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-bon-retablissement';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In deiner Schule gibt es einen Deutschclub. Die Mitglieder sprechen über ihre Hobbys und darüber, was sie im Club schon auf Deutsch können.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Hobbys und Freizeitaktivitäten$$,
        'body', $$Im Deutschclub spricht man oft über die eigenen Hobbys, also die Aktivitäten, die man in der Freizeit gern macht.$$,
        'highlights', array[$$das Hobby$$, $$die Freizeit$$, $$gern$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Hobby$$, $$eine Lieblingsbeschäftigung in der Freizeit$$),
            jsonb_build_array($$die Freizeit$$, $$die Zeit ohne Schule oder Arbeit$$),
            jsonb_build_array($$Fußball spielen$$, $$ein beliebter Sport$$),
            jsonb_build_array($$Musik hören$$, $$Lieder oder Radio anhören$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um sein Hobby zu nennen, sagt man "Mein Hobby ist..." oder "In meiner Freizeit spiele ich gern...".$$),
        'example', jsonb_build_object('statement', $$Was ist dein Hobby?$$, 'solution', $$Mein Hobby ist Musik hören, und ich spiele auch gern Fußball.$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Freizeitaktivitäten, die man im Deutschclub machen kann.$$, 'solution', $$Man kann im Deutschclub Lieder hören und Spiele spielen.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: die Modalverben möchten, wollen, können, mögen$$,
        'body', $$Um über Wünsche, Absichten und Fähigkeiten zu sprechen, benutzt man Modalverben. Sie stehen an zweiter Stelle, das Hauptverb steht als Infinitiv am Satzende.$$,
        'highlights', array[$$möchten$$, $$können$$, $$das Modalverb$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$möchten$$, $$einen Wunsch ausdrücken$$),
            jsonb_build_array($$wollen$$, $$eine feste Absicht ausdrücken$$),
            jsonb_build_array($$können$$, $$eine Fähigkeit ausdrücken$$),
            jsonb_build_array($$mögen$$, $$eine Vorliebe ausdrücken$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"können" konjugiert: ich kann, du kannst, er/sie/es kann, wir können, ihr könnt, sie/Sie können. Die anderen Modalverben (möchten, wollen, mögen) folgen einem ähnlichen Muster mit unregelmäßigem Singular.$$),
        'example', jsonb_build_object('statement', $$Was möchtest du im Deutschclub lernen?$$, 'solution', $$Ich möchte ein deutsches Lied singen können.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "können": Nach einem Jahr im Club ___ (können) wir viele Wörter auf Deutsch.$$, 'solution', $$Nach einem Jahr im Club können wir viele Wörter auf Deutsch.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Nebensätze mit weil, dass und wenn$$,
        'body', $$Um einen Grund, eine Aussage oder eine Bedingung auszudrücken, benutzt man die Subjunktionen weil, dass und wenn. Das konjugierte Verb steht dabei am Ende des Nebensatzes.$$,
        'highlights', array[$$weil$$, $$dass$$, $$wenn$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Konjunktion$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$weil$$, $$drückt einen Grund aus$$),
            jsonb_build_array($$dass$$, $$leitet eine Aussage ein$$),
            jsonb_build_array($$wenn$$, $$drückt eine Bedingung aus$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$In einem Nebensatz mit weil, dass oder wenn steht das konjugierte Verb ganz am Ende: Ich gehe in den Club, weil ich Deutsch üben möchte.$$),
        'example', jsonb_build_object('statement', $$Warum gehst du in den Deutschclub?$$, 'solution', $$Ich gehe in den Deutschclub, weil ich gern Deutsch spreche.$$),
        'fixation', jsonb_build_object('question', $$Verbinde die Sätze mit "weil": Ich singe gern. Ich bin im Deutschclub.$$, 'solution', $$Ich bin im Deutschclub, weil ich gern singe.$$)
      ),
      jsonb_build_object(
        'heading', $$Sich treffen: ein reflexives Verb für den Club$$,
        'body', $$Um zu sagen, dass sich die Mitglieder eines Clubs regelmäßig versammeln, benutzt man das reflexive Verb "sich treffen".$$,
        'highlights', array[$$sich treffen$$, $$das Mitglied$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"sich treffen" konjugiert: ich treffe mich, du triffst dich, er/sie/es trifft sich, wir treffen uns, ihr trefft euch, sie/Sie treffen sich.$$),
        'example', jsonb_build_object('statement', $$Wann trefft ihr euch im Deutschclub?$$, 'solution', $$Wir treffen uns jeden Mittwoch nach der Schule.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "sich treffen": Die Mitglieder ___ ___ jeden Freitag.$$, 'solution', $$Die Mitglieder treffen sich jeden Freitag.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du stellst den Deutschclub deiner Schule einem neuen Mitglied vor: eure Hobbys, was ihr könnt und warum ihr euch trefft.$$,
      'questions', array[
        $$Sag, was dein Hobby ist.$$,
        $$Sag, was du im Club schon auf Deutsch kannst (mit "können").$$,
        $$Erkläre mit "weil", warum du in den Club gehst.$$,
        $$Sag, wann sich der Club trifft (mit "sich treffen").$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit "möchten": Ich ___ (möchten) ein deutsches Lied lernen.$$,
      'hint', $$"möchten" in der ich-Form: möchte.$$,
      'expected', $$Ich möchte ein deutsches Lied lernen.$$
    ),
    jsonb_build_object(
      'question', $$Verbinde mit "dass": Der Lehrer sagt. Der Club trifft sich am Montag.$$,
      'hint', $$"dass" leitet eine Aussage ein, Verb ans Ende.$$,
      'expected', $$Der Lehrer sagt, dass sich der Club am Montag trifft.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "sich treffen": Wir ___ ___ jeden Dienstag.$$,
      'hint', $$wir-Form: wir treffen uns.$$,
      'expected', $$Wir treffen uns jeden Dienstag.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz mit "wenn": (du / kommen früh) (wir / singen zusammen)$$,
      'hint', $$"wenn" + Verb am Ende des Nebensatzes.$$,
      'expected', $$Wenn du früh kommst, singen wir zusammen.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-club-allemand';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Es ist Freitagnachmittag. Du schreibst einem deutschen Brieffreund über dein letztes Wochenende: wohin deine Familie gefahren ist und wer wem geholfen hat.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Werktage und Wochenende$$,
        'body', $$Man unterscheidet zwischen den Werktagen (Montag bis Freitag), an denen man arbeitet oder zur Schule geht, und dem Wochenende, das der Erholung dient.$$,
        'highlights', array[$$der Werktag$$, $$das Wochenende$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Werktag$$, $$ein Tag mit Schule oder Arbeit$$),
            jsonb_build_array($$das Wochenende$$, $$Samstag und Sonntag, ohne Schule$$),
            jsonb_build_array($$sich ausruhen$$, $$sich erholen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Am Wochenende benutzt man oft die Präposition "am": am Wochenende, am Samstag.$$),
        'example', jsonb_build_object('statement', $$Was macht man am Wochenende?$$, 'solution', $$Am Wochenende ruht man sich aus und fährt manchmal ans Meer.$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Werktage.$$, 'solution', $$Montag und Donnerstag sind zwei Werktage.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: starke Verben im Präsens (fahren, helfen, sehen)$$,
        'body', $$Manche Verben ändern im Präsens ihren Stammvokal in der 2. und 3. Person Singular (du/er/sie/es). Man nennt sie starke Verben.$$,
        'highlights', array[$$starke Verben$$, $$der Vokalwechsel$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$du-Form$$, $$er/sie/es-Form$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$fahren (a→ä)$$, $$du fährst$$, $$er fährt$$),
            jsonb_build_array($$helfen (e→i)$$, $$du hilfst$$, $$er hilft$$),
            jsonb_build_array($$sehen (e→ie)$$, $$du siehst$$, $$er sieht$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Nur in der 2. und 3. Person Singular ändert sich der Stammvokal; im Plural bleibt die Form regelmäßig (wir fahren, ihr fahrt, sie fahren).$$),
        'example', jsonb_build_object('statement', $$Wohin fährt deine Familie am Wochenende?$$, 'solution', $$Meine Familie fährt am Wochenende ans Meer.$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Meine Schwester ___ (helfen) mir bei den Hausaufgaben.$$, 'solution', $$Meine Schwester hilft mir bei den Hausaufgaben.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: das Perfekt mit haben oder sein$$,
        'body', $$Im Perfekt benutzt man meistens "haben", aber Verben der Bewegung wie "fahren" bilden das Perfekt mit "sein".$$,
        'highlights', array[$$das Perfekt$$, $$sein$$, $$haben$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$Perfekt$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$machen$$, $$wir haben gemacht$$),
            jsonb_build_array($$fahren$$, $$wir sind gefahren$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Bewegungsverben ohne Objekt (fahren, gehen, kommen) bilden das Perfekt mit "sein" + Partizip II; die meisten anderen Verben benutzen "haben".$$),
        'example', jsonb_build_object('statement', $$Wie sagt man im Perfekt: Wir fahren ans Meer?$$, 'solution', $$Wir sind ans Meer gefahren.$$),
        'fixation', jsonb_build_object('question', $$Bilde das Perfekt mit "sein": ihr / fahren / ins Dorf$$, 'solution', $$Ihr seid ins Dorf gefahren.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du beschreibst einem deutschen Brieffreund dein letztes Wochenende: was deine Familie am Samstag gemacht hat und wer wem geholfen hat.$$,
      'questions', array[
        $$Sag, wohin deine Familie am Wochenende gefahren ist (im Perfekt).$$,
        $$Sag, wer dir bei den Hausaufgaben hilft (mit "helfen").$$,
        $$Sag, was du am Wochenende siehst oder machst (mit "sehen" oder "machen").$$,
        $$Nenne einen Unterschied zwischen einem Werktag und dem Wochenende.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze: Du ___ (fahren) am Sonntag zu deiner Tante.$$,
      'hint', $$du-Form mit Vokalwechsel a→ä: fährst.$$,
      'expected', $$Du fährst am Sonntag zu deiner Tante.$$
    ),
    jsonb_build_object(
      'question', $$Bilde das Perfekt: wir / fahren / ans Meer$$,
      'hint', $$Bewegungsverb: sein + gefahren.$$,
      'expected', $$Wir sind ans Meer gefahren.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze: Er ___ (sehen) seine Freunde auf dem Markt.$$,
      'hint', $$er-Form mit Vokalwechsel e→ie: sieht.$$,
      'expected', $$Er sieht seine Freunde auf dem Markt.$$
    ),
    jsonb_build_object(
      'question', $$Bilde das Perfekt: die Kinder / machen / die Hausaufgaben$$,
      'hint', $$Kein Bewegungsverb: haben + gemacht.$$,
      'expected', $$Die Kinder haben die Hausaufgaben gemacht.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-bon-weekend';

