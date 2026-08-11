-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3134: "MATH_2C L4: GÉNÉRALITES SUR LES FONCTIONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=3134)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30883, redirecting
-- to pluginfile "Maths 2C_L4_GENERALITES SUR LES FONCTIONS FINAL
-- (Réparé).pdf" (23 pages).
-- Rewritten/paraphrased from the source PDF: définition d'une fonction et
-- vocabulaire (image, antécédent, ensemble de départ/arrivée), diverses
-- déterminations d'une fonction (formule explicite, tableau de valeurs,
-- courbe représentative), ensemble de définition, image directe/réciproque
-- d'un intervalle, fonctions égales sur un ensemble, sens de variation et
-- tableau de variation, maximum et minimum. 100% original wording; no
-- sentence copied from the source; numeric examples changed.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-generalites-fonctions',
  '2nde',
  'C',
  'mathematiques',
  $$Généralités sur les fonctions$$,
  4,
  '2nde-c-maths-symetries-translations',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le gérant d'une station-service reçoit chaque jour un relevé du volume d'essence restant dans une citerne, en fonction du nombre d'heures écoulées depuis le début de la journée. Un employé lui présente ce relevé sous forme d'un tableau de nombres, un autre sous forme d'une courbe tracée sur un graphique, et un troisième propose une formule mathématique reliant directement le temps et le volume restant. Le gérant se demande si ces trois présentations, bien que différentes, décrivent réellement la même chose.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et vocabulaire d'une fonction$$,
        'body', $$Soient A et B deux ensembles non vides. On appelle fonction de A vers B toute correspondance f qui, à chaque élément de A, associe un ou zéro élément de B. Pour tout élément x de A, on note f(x) le correspondant de x par f (lorsqu'il existe) ; on dit que f(x) est l'image de x par f, et que x est un antécédent de f(x) par f. L'ensemble A est appelé ensemble de départ de f, et B son ensemble d'arrivée. Lorsque l'ensemble de départ et l'ensemble d'arrivée sont des ensembles de nombres réels, on parle de fonction numérique d'une variable réelle.$$,
        'highlights', array[$$fonction$$, $$image, antécédent$$, $$ensemble de départ, ensemble d'arrivée$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Si f est une fonction de A vers B, on note f : A → B, x ↦ f(x). x est la variable, f(x) est l'image de x par f, et x est un antécédent de f(x) par f.$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire que 4 est un antécédent de 16 par une fonction f ?$$, 'solution', $$Cela signifie que f(4) = 16, c'est-à-dire que l'image de 4 par f est 16.$$)
      ),
      jsonb_build_object(
        'heading', $$Différentes façons de déterminer une fonction$$,
        'body', $$Une fonction peut être déterminée d'au moins trois façons : par une formule explicite, qui donne directement le calcul à effectuer sur x pour obtenir f(x) (par exemple f(x) = x²−x+3) ; par un tableau de valeurs, qui liste sur deux lignes quelques nombres et leurs images ; ou par une courbe représentative dans un repère, qui donne une image visuelle de la fonction. Pour reconnaître qu'une courbe donnée représente bien une fonction, on vérifie que toute droite parallèle à l'axe des ordonnées la coupe en au plus un point : si une telle droite coupe la courbe en au moins deux points, ce n'est pas la courbe d'une fonction, car un même x aurait alors deux images distinctes.$$,
        'highlights', array[$$formule explicite$$, $$tableau de valeurs$$, $$courbe représentative$$]::text[],
        'example', jsonb_build_object('statement', $$Une fonction f de R vers R est définie par le programme de calcul suivant : prendre un nombre réel, l'élever au carré, ajouter 4, puis prendre l'inverse du résultat. Donne la formule explicite de f.$$, 'solution', $$f(x) = 1/(x²+4).$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaître, à partir d'une courbe tracée dans un repère, qu'elle représente bien une fonction ?$$, 'solution', $$Il suffit de vérifier que toute droite parallèle à l'axe des ordonnées coupe la courbe en au plus un point.$$)
      ),
      jsonb_build_object(
        'heading', $$Ensemble de définition d'une fonction$$,
        'body', $$L'ensemble de définition d'une fonction f donnée par une formule explicite est l'ensemble des nombres réels x pour lesquels le calcul de f(x) est possible. Pour le déterminer, on repère d'abord les contraintes imposées par la formule (par exemple un dénominateur qui ne doit pas s'annuler, ou une expression sous une racine carrée qui doit rester positive ou nulle), on traduit chaque contrainte par un ensemble de solutions, puis on prend l'intersection de tous ces ensembles.$$,
        'highlights', array[$$ensemble de définition$$, $$contraintes sur la variable$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine l'ensemble de définition de h : x ↦ √(x+3)/√(−x).$$, 'solution', $$Il faut x+3 ≥ 0 (donc x ≥ −3) et −x > 0, c'est-à-dire x < 0 (le dénominateur ne doit pas s'annuler). En combinant les deux conditions, on obtient Dh = [−3 ; 0[.$$),
        'fixation', jsonb_build_object('question', $$Quelle contrainte doit-on écrire pour une fonction contenant l'expression 1/(x−2) ?$$, 'solution', $$Il faut que le dénominateur ne s'annule pas, donc x−2 ≠ 0, c'est-à-dire x ≠ 2.$$)
      ),
      jsonb_build_object(
        'heading', $$Image directe, image réciproque et fonctions égales$$,
        'body', $$L'image directe d'une partie A de l'ensemble de définition d'une fonction f est l'ensemble des images par f de tous les éléments de A ; graphiquement, elle s'obtient en projetant sur l'axe des ordonnées la portion de la courbe correspondant aux abscisses de A. L'image réciproque d'une partie G de l'ensemble d'arrivée est l'ensemble de tous les antécédents par f des éléments de G ; graphiquement, elle s'obtient en projetant sur l'axe des abscisses la portion de la courbe dont les ordonnées appartiennent à G. Deux fonctions f et g sont dites égales sur un ensemble E lorsque, pour tout élément x de E, f(x) = g(x) ; leurs courbes représentatives coïncident alors exactement sur cet ensemble.$$,
        'highlights', array[$$image directe$$, $$image réciproque$$, $$fonctions égales sur un ensemble$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f définie par f(x) = 2x²−1 et A = {−1 ; 0 ; 1 ; 5}. Détermine l'image directe de A par f.$$, 'solution', $$f(−1) = 1, f(0) = −1, f(1) = 1, f(5) = 49. L'image directe de A est donc f(A) = {1 ; −1 ; 49}.$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire que deux fonctions f et g sont égales sur un ensemble E ?$$, 'solution', $$Cela signifie que pour tout élément x de E, f(x) = g(x), c'est-à-dire que leurs courbes représentatives coïncident sur E.$$)
      ),
      jsonb_build_object(
        'heading', $$Sens de variation, tableau de variation et extremums$$,
        'body', $$Étudier le sens de variation d'une fonction sur un intervalle, c'est déterminer si elle est croissante (les images sont rangées dans le même ordre que les nombres de départ), décroissante (les images sont rangées dans l'ordre inverse), ou constante (toutes les images sont égales) sur cet intervalle. On résume ces informations dans un tableau de variation, où des flèches montantes ou descendantes indiquent le comportement de la fonction sur chaque intervalle. Le maximum d'une fonction f sur un intervalle E est une valeur f(a) telle que f(a) ≥ f(x) pour tout x de E ; le minimum est défini de façon symétrique avec f(b) ≤ f(x).$$,
        'highlights', array[$$croissante, décroissante, constante$$, $$tableau de variation$$, $$maximum, minimum$$]::text[],
        'example', jsonb_build_object('statement', $$La fonction g admet le tableau de variation suivant sur [−5 ; 5] : décroissante sur [−5 ; −2], croissante sur [−2 ; 1], constante sur [1 ; 3], décroissante sur [3 ; 5], avec g(−5)=3, g(−2)=−2, g(1)=g(3)=2, g(5)=−1. Donne le maximum et le minimum de g sur [−5 ; 5].$$, 'solution', $$Le maximum de g sur [−5 ; 5] est 3 (atteint en −5) et son minimum est −2 (atteint en −2).$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire qu'une fonction f est strictement croissante sur un intervalle E ?$$, 'solution', $$Cela signifie que pour tous u et v de E tels que u < v, on a f(u) < f(v) : les nombres et leurs images sont rangés dans le même ordre.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une citerne remplie contient 5000 litres d'eau. On ouvre un robinet de vidange qui laisse s'écouler l'eau à un débit constant de 2 litres par seconde. On note f(t) la quantité d'eau, en litres, écoulée après t secondes depuis l'ouverture du robinet. Le technicien veut savoir au bout de combien de temps il ne restera plus que 250 litres dans la citerne, sans avoir à surveiller en continu le niveau.$$,
      'questions', array[
        $$Exprime f(t) en fonction de t, sachant que le débit est constant.$$,
        $$Traduis la condition « il reste 250 litres dans la citerne » par une équation portant sur f(t).$$,
        $$Résous cette équation pour déterminer au bout de combien de temps il ne restera plus que 250 litres.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Une fonction f de R vers R est définie par f(x) = 3x² + 2x − 5. Calcule f(−2).$$,
      'hint', $$Remplace x par −2 dans la formule et calcule pas à pas.$$,
      'expected', $$f(−2) = 3×4 + 2×(−2) − 5 = 12 − 4 − 5 = 3.$$
    ),
    jsonb_build_object(
      'question', $$Détermine l'ensemble de définition de la fonction k : x ↦ (x+1)/(x−4).$$,
      'hint', $$Le dénominateur ne doit pas s'annuler.$$,
      'expected', $$Il faut x−4 ≠ 0, donc x ≠ 4. Dk = R\{4}.$$
    ),
    jsonb_build_object(
      'question', $$Les fonctions f : x ↦ x et g : x ↦ x²/x sont-elles égales sur R tout entier ? Justifie.$$,
      'hint', $$Regarde attentivement l'ensemble de définition de g.$$,
      'expected', $$Non : g n'est pas définie en 0 (car on divise par x), alors que f l'est. Elles sont seulement égales sur R\{0}.$$
    ),
    jsonb_build_object(
      'question', $$Une fonction f est strictement décroissante sur [0 ; 10] avec f(0) = 8 et f(10) = −2. Quel est le maximum de f sur cet intervalle ?$$,
      'hint', $$Sur un intervalle où f décroît, où se trouve la plus grande image ?$$,
      'expected', $$Le maximum est 8, atteint en x = 0, puisque f est décroissante sur tout l'intervalle.$$
    )
  ),
  now()
);
