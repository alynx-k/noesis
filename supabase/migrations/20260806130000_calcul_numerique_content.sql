-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 5: Calcul numérique"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. No diagram: purely numerical content.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une coopérative agricole veut savoir si la quantité de cacao récoltée cette année, estimée entre 420 et 460 sacs sans qu'on puisse la peser exactement tout de suite, suffira pour honorer une commande qui demande entre 400 et 500 sacs. Sans connaître le nombre exact, on peut déjà raisonner avec des encadrements — c'est tout l'objet du calcul numérique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Intervalles$$,
        'body', $$Un intervalle regroupe tous les nombres réels compris entre deux bornes, en précisant si ces bornes sont incluses (crochet fermé) ou exclues (crochet ouvert).$$,
        'highlights', array[$$intervalle$$, $$bornes$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$[a;b] est l'intervalle fermé des x tels que a ≤ x ≤ b. ]a;b[ est l'intervalle ouvert des x tels que a < x < b. L'amplitude d'un intervalle est |a − b|, et son centre est (a+b)/2.$$),
        'example', jsonb_build_object('statement', $$Donne le centre et l'amplitude de l'intervalle [2;10].$$, 'solution', $$Centre = (2+10)/2 = 6. Amplitude = |2−10| = 8.$$),
        'fixation', jsonb_build_object('question', $$Traduis par une inégalité : x ∈ ]−3;5].$$, 'solution', $$x ∈ ]−3;5] équivaut à −3 < x ≤ 5.$$)
      ),
      jsonb_build_object(
        'heading', $$Réunion et intersection d'intervalles$$,
        'body', $$Deux intervalles peuvent se chevaucher, ou être complètement séparés (on dit alors qu'ils sont disjoints). Leur intersection regroupe ce qu'ils ont en commun, leur réunion regroupe tout ce qui appartient à l'un ou à l'autre.$$,
        'highlights', array[$$intersection$$, $$réunion$$, $$disjoints$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$x ∈ A ∩ B équivaut à x ∈ A et x ∈ B. x ∈ A ∪ B équivaut à x ∈ A ou x ∈ B.$$),
        'example', jsonb_build_object('statement', $$Détermine [1;6] ∩ [4;9].$$, 'solution', $$Les deux intervalles se chevauchent entre 4 et 6, donc [1;6] ∩ [4;9] = [4;6].$$),
        'fixation', jsonb_build_object('question', $$Détermine [−2;1[ ∩ [3;5].$$, 'solution', $$Ces deux intervalles n'ont aucun nombre en commun, donc [−2;1[ ∩ [3;5] = ∅ (ensemble vide).$$)
      ),
      jsonb_build_object(
        'heading', $$Comparer des carrés et des racines carrées$$,
        'body', $$Pour comparer deux nombres positifs, comparer leurs carrés donne souvent la réponse plus vite que de manipuler des racines carrées directement. Pour des nombres négatifs, la règle s'inverse.$$,
        'highlights', array[$$carrés$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a et b positifs : a < b équivaut à a² < b². Pour a et b négatifs, la comparaison des carrés donne le sens contraire. Et pour a, b positifs : a < b équivaut à √a < √b.$$),
        'example', jsonb_build_object('statement', $$Compare 4√2 et 5√3.$$, 'solution', $$(4√2)² = 32 et (5√3)² = 75. Comme 32 < 75, on a 4√2 < 5√3.$$),
        'fixation', jsonb_build_object('question', $$Compare √13 et √17.$$, 'solution', $$13 < 17, donc √13 < √17.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparer des inverses$$,
        'body', $$Attention, comparer des inverses inverse le sens de l'inégalité de départ — c'est une source d'erreur fréquente si on l'oublie.$$,
        'highlights', array[$$inverses$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a et b de même signe, non nuls : a < b équivaut à 1/a > 1/b.$$),
        'example', jsonb_build_object('statement', $$Compare 1/√6 et 1/√10.$$, 'solution', $$6 < 10 donc √6 < √10, donc 1/√6 > 1/√10.$$),
        'fixation', jsonb_build_object('question', $$Compare 1/8 et 1/3.$$, 'solution', $$8 > 3 donc 1/8 < 1/3.$$)
      ),
      jsonb_build_object(
        'heading', $$Encadrer une somme ou une différence$$,
        'body', $$Pour encadrer une somme, on additionne les bornes correspondantes des deux encadrements. Pour une différence, il faut d'abord retourner l'encadrement du nombre soustrait, car passer à l'opposé inverse le sens des inégalités.$$,
        'highlights', array[$$encadrer$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si a1<a<a2 et b1<b<b2, alors a1+b1 < a+b < a2+b2. Pour a−b, on encadre d'abord −b (en inversant le sens de l'encadrement de b), puis on additionne.$$),
        'example', jsonb_build_object('statement', $$Sachant que 2,44<√6<2,45 et 3,16<√10<3,17, encadre √6+√10.$$, 'solution', $$2,44+3,16 < √6+√10 < 2,45+3,17, donc 5,60 < √6+√10 < 5,62.$$),
        'fixation', jsonb_build_object('question', $$Avec les mêmes encadrements, encadre √10−√6.$$, 'solution', $$On inverse l'encadrement de √6 : −2,45<−√6<−2,44. Donc 3,16−2,45 < √10−√6 < 3,17−2,44, soit 0,71 < √10−√6 < 0,73.$$)
      ),
      jsonb_build_object(
        'heading', $$Encadrer un produit ou un quotient$$,
        'body', $$Pour un produit de deux nombres positifs, on multiplie les bornes de même position. Pour un quotient, on encadre d'abord l'inverse du dénominateur (en inversant le sens), puis on multiplie.$$,
        'highlights', array[$$produit$$, $$quotient$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si 0<a1<a<a2 et 0<b1<b<b2, alors a1×b1 < a×b < a2×b2. Pour a/b, on encadre 1/b (en inversant le sens de l'encadrement de b) puis on multiplie par l'encadrement de a.$$),
        'example', jsonb_build_object('statement', $$Sachant que 1,73<√3<1,74 et 2,23<√5<2,24, encadre √3×√5.$$, 'solution', $$1,73×2,23 < √3×√5 < 1,74×2,24, donc 3,85 < √3×√5 < 3,90.$$),
        'fixation', jsonb_build_object('question', $$Avec les mêmes encadrements, donne un encadrement approché de √5/√3.$$, 'solution', $$On encadre d'abord 1/√3 : 1/1,74 < 1/√3 < 1/1,73, soit environ 0,574 < 1/√3 < 0,578. En multipliant par l'encadrement de √5, on obtient environ 1,28 < √5/√3 < 1,29.$$)
      ),
      jsonb_build_object(
        'heading', $$Arrondir une racine carrée$$,
        'body', $$Quand une racine carrée n'a pas de valeur exacte simple, on l'arrondit à un certain ordre décimal selon la précision voulue.$$,
        'highlights', array[$$arrondi$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'arrondi d'ordre n d'un nombre est sa valeur approchée avec n chiffres après la virgule, en regardant le chiffre suivant pour arrondir au plus proche.$$),
        'example', jsonb_build_object('statement', $$Donne l'arrondi d'ordre 2 de √20 = 4,4721…$$, 'solution', $$Le troisième chiffre après la virgule est 2, donc on arrondit à 4,47.$$),
        'fixation', jsonb_build_object('question', $$Donne l'arrondi d'ordre 1 de √30 = 5,4772…$$, 'solution', $$Le deuxième chiffre après la virgule est 7, donc on arrondit à 5,5.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un pisciculteur possède un bassin rectangulaire. Il connaît la longueur L = 25√3 mètres et sait que la largeur ℓ vérifie 6 < ℓ < 7. Il veut savoir combien de poissons il peut y élever, sachant qu'il faut compter 2 m² par poisson au minimum.$$,
      'questions', array[
        $$Sachant que 1,73 < √3 < 1,74, donne un encadrement de L.$$,
        $$Déduis-en un encadrement de l'aire du bassin, L × ℓ.$$,
        $$Le pisciculteur peut-il garantir qu'il pourra élever au moins 100 poissons ? Justifie ta réponse à partir de l'encadrement trouvé.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Traduis par un encadrement : x ∈ [−4;9[.$$,
      'hint', $$Relis le vocabulaire des intervalles : crochet fermé signifie borne incluse, crochet ouvert signifie borne exclue.$$,
      'expected', $$x ∈ [−4;9[ équivaut à −4 ≤ x < 9.$$
    ),
    jsonb_build_object(
      'question', $$Compare 3√5 et 4√3 en comparant leurs carrés.$$,
      'hint', $$Relis la propriété de comparaison des carrés pour des nombres positifs.$$,
      'expected', $$(3√5)² = 45 et (4√3)² = 48. Comme 45 < 48, on a 3√5 < 4√3.$$
    ),
    jsonb_build_object(
      'question', $$Sachant que 2,64<√7<2,65 et 3,60<√13<3,61, donne un encadrement de √7+√13.$$,
      'hint', $$Relis la méthode d'encadrement d'une somme : on additionne les bornes correspondantes.$$,
      'expected', $$2,64+3,60 < √7+√13 < 2,65+3,61, donc 6,24 < √7+√13 < 6,26.$$
    ),
    jsonb_build_object(
      'question', $$Sachant que 1,41<√2<1,42, donne un encadrement de 1/√2, puis explique pourquoi le sens de l'encadrement s'inverse.$$,
      'hint', $$Relis la propriété de comparaison des inverses : elle inverse le sens de l'inégalité.$$,
      'expected', $$1/1,42 < 1/√2 < 1/1,41, soit environ 0,704 < 1/√2 < 0,709 ; le sens s'inverse car pour deux nombres positifs, le plus grand a le plus petit inverse.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-calcul-numerique';
