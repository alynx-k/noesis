-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 13: Applications
-- affines" programme document, but every sentence, example and exercise is
-- an original rewrite. No diagram: graphs are described in words (sens de
-- variation) rather than plotted, to keep scope tight.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un chauffeur de taxi facture une prise en charge fixe puis un tarif par kilomètre parcouru. Un client se demande comment prévoir le prix d'une course sans attendre la fin du trajet — pour cela, il faut pouvoir écrire le prix comme une formule qui dépend de la distance : c'est exactement une application affine.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition d'une application affine$$,
        'body', $$Une application affine associe à chaque nombre x un résultat obtenu en le multipliant par un coefficient puis en ajoutant un nombre fixe. On note cette correspondance f : x ↦ ax+b, et le résultat obtenu pour x s'appelle l'image de x par f.$$,
        'highlights', array[$$application affine$$, $$image$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$f : x ↦ ax+b est une application affine de coefficient a et de terme constant b. On note f(x)=ax+b, et si f(x)=y, on dit que y est l'image de x par f.$$),
        'example', jsonb_build_object('statement', $$Donne le coefficient et le terme constant de f : x ↦ −4x+9.$$, 'solution', $$Le coefficient est −4 et le terme constant est 9.$$),
        'fixation', jsonb_build_object('question', $$Donne le coefficient et le terme constant de g : x ↦ 7x−2.$$, 'solution', $$Le coefficient est 7 et le terme constant est −2.$$)
      ),
      jsonb_build_object(
        'heading', $$Calculer une image$$,
        'body', $$Pour calculer l'image d'un nombre par une application affine, on remplace simplement x par ce nombre dans l'expression de f(x).$$,
        'highlights', array[$$calculer une image$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule l'image de 3 par f : x ↦ −2x+5.$$, 'solution', $$f(3) = −2×3+5 = −6+5 = −1.$$),
        'fixation', jsonb_build_object('question', $$Calcule l'image de −4 par g : x ↦ 3x+1.$$, 'solution', $$g(−4) = 3×(−4)+1 = −12+1 = −11.$$)
      ),
      jsonb_build_object(
        'heading', $$Trouver l'antécédent d'un nombre$$,
        'body', $$Trouver l'antécédent d'un nombre y, c'est trouver la valeur de x qui donne y comme image — pour cela, on résout l'équation f(x)=y.$$,
        'highlights', array[$$antécédent$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour trouver x tel que f(x)=y, on résout l'équation ax+b=y.$$),
        'example', jsonb_build_object('statement', $$Détermine x tel que f(x)=11, avec f : x ↦ 3x−4.$$, 'solution', $$3x−4=11 équivaut à 3x=15, donc x=5.$$),
        'fixation', jsonb_build_object('question', $$Détermine x tel que g(x)=−1, avec g : x ↦ −5x+9.$$, 'solution', $$−5x+9=−1 équivaut à −5x=−10, donc x=2.$$)
      ),
      jsonb_build_object(
        'heading', $$Déterminer une application affine à partir de deux images$$,
        'body', $$Quand on connaît les images de deux nombres différents, on peut retrouver complètement l'expression de l'application affine, en posant un système de deux équations à deux inconnues a et b.$$,
        'highlights', array[$$système$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Si f(x1)=y1 et f(x2)=y2, alors a et b vérifient ax1+b=y1 et ax2+b=y2 ; on résout ce système pour trouver a et b.$$),
        'example', jsonb_build_object('statement', $$Détermine f sachant que f(1)=4 et f(3)=10.$$, 'solution', $$On a {a+b=4 ; 3a+b=10}. En soustrayant : 2a=6, donc a=3. Alors b=4−3=1. Donc f(x)=3x+1.$$),
        'fixation', jsonb_build_object('question', $$Détermine g sachant que g(2)=−1 et g(5)=8.$$, 'solution', $$On a {2a+b=−1 ; 5a+b=8}. En soustrayant : 3a=9, donc a=3. Alors b=−1−6=−7. Donc g(x)=3x−7.$$)
      ),
      jsonb_build_object(
        'heading', $$Représentation graphique$$,
        'body', $$La représentation graphique d'une application affine f(x)=ax+b est une droite : le coefficient a indique si elle monte ou descend, et b est l'endroit où elle croise l'axe vertical.$$,
        'highlights', array[$$droite$$, $$coefficient$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La droite d'équation y=ax+b passe par le point (0;b). Si a>0, f est croissante et la droite monte de gauche à droite. Si a<0, f est décroissante et la droite descend. Si a=0, f est constante et la droite est horizontale.$$),
        'example', jsonb_build_object('statement', $$Sans tracer, dis si f : x ↦ −2x+3 est croissante ou décroissante.$$, 'solution', $$Le coefficient est −2, qui est négatif, donc f est décroissante.$$),
        'fixation', jsonb_build_object('question', $$Sans tracer, dis si g : x ↦ 0,5x−1 est croissante ou décroissante.$$, 'solution', $$Le coefficient est 0,5, qui est positif, donc g est croissante.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparer des images grâce au sens de variation$$,
        'body', $$Une fois qu'on connaît le sens de variation d'une application affine, on peut comparer les images de deux nombres sans même calculer l'expression complète de f.$$,
        'highlights', array[$$sens de variation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si f est croissante et m<n, alors f(m)<f(n). Si f est décroissante et m<n, alors f(m)>f(n).$$),
        'example', jsonb_build_object('statement', $$f est une application affine décroissante. Compare f(2) et f(6).$$, 'solution', $$2<6 et f est décroissante, donc f(2)>f(6).$$),
        'fixation', jsonb_build_object('question', $$g est une application affine croissante. Compare g(−3) et g(1).$$, 'solution', $$−3<1 et g est croissante, donc g(−3)<g(1).$$)
      ),
      jsonb_build_object(
        'heading', $$Applications linéaires et proportionnalité$$,
        'body', $$Quand le terme constant b vaut 0, l'application affine s'appelle une application linéaire : sa représentation graphique passe par l'origine, et elle correspond exactement à une situation de proportionnalité.$$,
        'highlights', array[$$application linéaire$$, $$proportionnalité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une application linéaire s'écrit f(x)=ax (b=0). Sa droite passe toujours par le point (0;0). Elle correspond à une grandeur proportionnelle à une autre.$$),
        'example', jsonb_build_object('statement', $$Un kilogramme de mangues coûte 450 F. Exprime le prix p(x) de x kg de mangues.$$, 'solution', $$Le prix est proportionnel à la quantité, donc p(x)=450x — c'est une application linéaire.$$),
        'fixation', jsonb_build_object('question', $$Un taxi facture 200 F le kilomètre, sans frais fixe. Exprime le prix f(x) d'une course de x km. S'agit-il d'une application affine ou linéaire ?$$, 'solution', $$f(x)=200x. Comme il n'y a pas de terme constant (pas de frais fixe), c'est une application linéaire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un artisan facture la réparation d'un vélo selon une application affine du nombre d'heures de travail x. On sait qu'une réparation de 2 heures coûte 4000 F, et qu'une réparation de 5 heures coûte 8500 F.$$,
      'questions', array[
        $$Détermine les nombres a et b tels que le prix soit donné par f(x)=ax+b.$$,
        $$Calcule le prix d'une réparation de 3 heures.$$,
        $$Un client dispose de 10000 F. Combien d'heures de réparation peut-il faire au maximum ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Donne le coefficient et le terme constant de l'application affine f : x ↦ 6x−5.$$,
      'hint', $$Relis la définition : f(x)=ax+b, a est le coefficient, b le terme constant.$$,
      'expected', $$Le coefficient est 6 et le terme constant est −5.$$
    ),
    jsonb_build_object(
      'question', $$Calcule l'image de 4 par l'application g : x ↦ −3x+7.$$,
      'hint', $$Relis la méthode : remplace x par la valeur donnée dans l'expression de g(x).$$,
      'expected', $$g(4) = −3×4+7 = −12+7 = −5.$$
    ),
    jsonb_build_object(
      'question', $$Détermine l'application affine f sachant que f(0)=3 et f(4)=11.$$,
      'hint', $$Relis la méthode : pose le système à deux équations à partir des deux images connues.$$,
      'expected', $$f(0)=3 donne directement b=3. f(4)=11 donne 4a+3=11, donc a=2. Donc f(x)=2x+3.$$
    ),
    jsonb_build_object(
      'question', $$Une application affine h est décroissante. Compare h(−5) et h(0), puis explique ta réponse.$$,
      'hint', $$Relis la propriété du sens de variation : pour une fonction décroissante, un nombre plus petit a une image plus grande.$$,
      'expected', $$−5<0 et h est décroissante, donc h(−5)>h(0), car une fonction décroissante inverse l'ordre des nombres sur leurs images.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-applications-affines';
