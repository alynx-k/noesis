-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- complements the official Ivorian Seconde A programme (Compétence 1:
-- Généralités sur les fonctions numériques, following on from the
-- équations/inéquations lessons) with original, general-knowledge content
-- adapted to the série A (littéraire) level: the vocabulary of functions
-- (image, antécédent), ensemble de définition, graphical representation,
-- graphical reading, and sense of variation — without the deeper analytic
-- study (derivatives, specific function families) reserved for séries
-- C/D. No source PDF was available for this topic; entirely original
-- wording, examples and exercises.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-generalites-fonctions',
  '2nde',
  'A',
  'mathematiques',
  $$Généralités sur les fonctions$$,
  6,
  '2nde-a-maths-inequations-premier-degre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un chauffeur de taxi facture ses courses selon une règle fixe : 300 F de prise en charge, puis 150 F par kilomètre parcouru. Un client remarque que pour chaque distance parcourue, il n'existe qu'un seul prix possible, et qu'il peut prévoir ce prix avant même de monter dans le taxi. Cette relation qui, à chaque distance, associe un unique prix, est un exemple concret de fonction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Notion de fonction, image et antécédent$$,
        'body', $$Une fonction est un procédé qui, à chaque nombre x d'un ensemble de départ, associe un unique nombre noté f(x). On dit que f(x) est l'image de x par la fonction f, et que x est un antécédent de f(x). Chaque nombre a au plus une image, mais peut avoir plusieurs antécédents, ou aucun.$$,
        'highlights', array[$$fonction$$, $$image$$, $$antécédent$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une fonction f associe à chaque nombre x d'un ensemble un unique nombre f(x), appelé image de x par f. Tout nombre x tel que f(x) soit égal à un nombre donné y est appelé antécédent de y par f.$$),
        'example', jsonb_build_object('statement', $$Une fonction f est définie par f(x) = 2x + 1. Calcule l'image de 3 par f.$$, 'solution', $$f(3) = 2×3 + 1 = 7 : l'image de 3 par f est 7.$$),
        'fixation', jsonb_build_object('question', $$Avec la même fonction f(x) = 2x + 1, détermine un antécédent de 9.$$, 'solution', $$On résout 2x+1=9, soit 2x=8, soit x=4 : 4 est un antécédent de 9 par f.$$)
      ),
      jsonb_build_object(
        'heading', $$Ensemble de définition d'une fonction$$,
        'body', $$Une fonction n'est pas toujours définie pour tous les nombres réels : certaines valeurs de x doivent parfois être exclues, en particulier celles qui annuleraient un dénominateur. L'ensemble des valeurs pour lesquelles f(x) peut être calculé s'appelle l'ensemble de définition de f, noté Df.$$,
        'highlights', array[$$ensemble de définition$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour déterminer l'ensemble de définition d'une fonction donnée par une expression, on exclut les valeurs de x qui rendraient un dénominateur nul ou qui n'auraient pas de sens dans l'expression.$$),
        'example', jsonb_build_object('statement', $$Détermine l'ensemble de définition de la fonction f définie par f(x) = 5/(x−2).$$, 'solution', $$Le dénominateur x−2 s'annule pour x=2, valeur à exclure : Df = ℝ privé de {2}, c'est-à-dire ]−∞ ; 2[ ∪ ]2 ; +∞[.$$),
        'fixation', jsonb_build_object('question', $$Détermine l'ensemble de définition de la fonction g définie par g(x) = 3x + 7.$$, 'solution', $$Cette expression a un sens pour tout réel x, il n'y a aucune valeur à exclure : Dg = ℝ.$$)
      ),
      jsonb_build_object(
        'heading', $$Représentation graphique d'une fonction$$,
        'body', $$Dans un repère du plan, la courbe représentative d'une fonction f est l'ensemble des points de coordonnées (x ; f(x)), pour x parcourant l'ensemble de définition de f. Chaque point de la courbe traduit ainsi une paire (antécédent ; image).$$,
        'highlights', array[$$courbe représentative$$, $$repère$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La courbe représentative d'une fonction f, dans un repère donné, est l'ensemble des points M de coordonnées (x ; f(x)), où x décrit l'ensemble de définition de f.$$),
        'table', jsonb_build_object(
          'headers', array[$$x$$, $$−1$$, $$0$$, $$1$$, $$2$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$f(x) = 2x + 1$$, $$−1$$, $$1$$, $$3$$, $$5$$)
          )
        ),
        'example', jsonb_build_object('statement', $$La fonction f définie par f(x)=2x+1 vérifie f(2)=5. Donne les coordonnées du point correspondant sur la courbe de f.$$, 'solution', $$Le point a pour coordonnées (2 ; 5), puisque x=2 et f(x)=5.$$),
        'fixation', jsonb_build_object('question', $$Avec la même fonction, donne les coordonnées du point de la courbe correspondant à x = −1.$$, 'solution', $$f(−1) = 2×(−1)+1 = −1 : le point a pour coordonnées (−1 ; −1).$$)
      ),
      jsonb_build_object(
        'heading', $$Lecture graphique d'images et d'antécédents$$,
        'body', $$Sur une courbe représentative déjà tracée, on peut lire une image en partant d'une valeur x sur l'axe des abscisses, en montant (ou descendant) jusqu'à la courbe, puis en lisant l'ordonnée du point atteint. Pour lire un antécédent, on part cette fois d'une valeur y sur l'axe des ordonnées.$$,
        'highlights', array[$$lecture graphique$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour lire graphiquement f(a), on trace la verticale d'abscisse a jusqu'à la courbe, puis on lit l'ordonnée du point d'intersection obtenu. Pour lire un antécédent de b, on trace l'horizontale d'ordonnée b jusqu'à la courbe, puis on lit l'abscisse de chaque point d'intersection.$$),
        'example', jsonb_build_object('statement', $$Sur la courbe d'une fonction f, le point de coordonnées (4 ; 10) appartient à la courbe. Que peut-on en déduire ?$$, 'solution', $$On en déduit que f(4) = 10, c'est-à-dire que l'image de 4 par f est 10, et que 4 est un antécédent de 10 par f.$$),
        'fixation', jsonb_build_object('question', $$Sur la courbe d'une fonction g, on lit que g(−3) = 0. Que représente le nombre −3 pour la valeur 0 ?$$, 'solution', $$−3 est un antécédent de 0 par la fonction g.$$)
      ),
      jsonb_build_object(
        'heading', $$Sens de variation d'une fonction$$,
        'body', $$Étudier le sens de variation d'une fonction, c'est déterminer sur quels intervalles ses images augmentent (fonction croissante) ou diminuent (fonction décroissante) lorsque x augmente. On résume ces observations dans un tableau de variation.$$,
        'highlights', array[$$fonction croissante$$, $$fonction décroissante$$, $$tableau de variation$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une fonction f est croissante sur un intervalle I si, pour tous a et b de I tels que a < b, on a f(a) ≤ f(b). Elle est décroissante sur I si, pour tous a et b de I tels que a < b, on a f(a) ≥ f(b).$$),
        'example', jsonb_build_object('statement', $$Une fonction f vérifie f(1)=3 et f(5)=11, et l'on sait qu'elle est croissante sur [1 ; 5]. Que peut-on dire de f(3) ?$$, 'solution', $$Comme f est croissante sur [1 ; 5] et que 1 < 3 < 5, on a f(1) ≤ f(3) ≤ f(5), c'est-à-dire 3 ≤ f(3) ≤ 11.$$),
        'fixation', jsonb_build_object('question', $$Une fonction g est décroissante sur [0 ; 10], avec g(0)=20 et g(10)=2. Range g(2) et g(8) dans l'ordre croissant.$$, 'solution', $$Comme g est décroissante et 2 < 8, on a g(2) > g(8) : g(8) est donc le plus petit des deux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le taxi de la situation d'apprentissage, dont le prix d'une course de x kilomètres est donné par la fonction f(x) = 150x + 300. Un client veut comparer le prix de deux trajets, de 6 km et de 14 km, et savoir si le prix augmente toujours avec la distance.$$,
      'questions', array[
        $$Calcule f(6) et f(14), en précisant ce que représente chaque résultat pour le client.$$,
        $$D'après les deux résultats obtenus, la fonction f semble-t-elle croissante ? Justifie à l'aide de la définition du sens de variation.$$,
        $$Le client dispose de 1800 F. Détermine, à l'aide d'une inéquation, la distance maximale qu'il peut parcourir sans dépasser cette somme.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Une fonction f est définie par f(x) = 3x − 4. Calcule l'image de 5 par f.$$,
      'hint', $$Remplace x par 5 dans l'expression de f.$$,
      'expected', $$f(5) = 3×5 − 4 = 11.$$
    ),
    jsonb_build_object(
      'question', $$Avec la même fonction f(x) = 3x − 4, détermine un antécédent de 8.$$,
      'hint', $$Résous l'équation f(x) = 8.$$,
      'expected', $$On résout 3x−4=8, soit 3x=12, soit x=4 : 4 est un antécédent de 8 par f.$$
    ),
    jsonb_build_object(
      'question', $$Détermine l'ensemble de définition de la fonction h définie par h(x) = 7/(x+5).$$,
      'hint', $$Cherche la valeur de x qui annule le dénominateur.$$,
      'expected', $$Le dénominateur s'annule pour x=−5, valeur à exclure : Dh = ℝ privé de {−5}.$$
    ),
    jsonb_build_object(
      'question', $$Une fonction f est croissante sur [0 ; 20], avec f(0)=5 et f(20)=45. Range f(4) et f(15) dans l'ordre croissant, en justifiant à l'aide de la définition du sens de variation.$$,
      'hint', $$Comme f est croissante, l'ordre des images suit l'ordre des antécédents.$$,
      'expected', $$Comme f est croissante et que 4 < 15, on a f(4) ≤ f(15) : f(4) est donc inférieure ou égale à f(15).$$
    )
  ),
  now()
);
