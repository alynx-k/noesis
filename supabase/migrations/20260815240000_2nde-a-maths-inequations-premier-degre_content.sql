-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- complements the official Ivorian Seconde A programme (Compétence 1,
-- Thème 2: Inéquations du premier degré à une inconnue, following on from
-- "Équations du premier degré à une inconnue") with original,
-- general-knowledge content adapted to the série A (littéraire) level:
-- solving simple inequations, the sign-reversal rule, writing the solution
-- set as an interval, systems of two inequations, and word problems. No
-- source PDF was available for this topic; entirely original wording,
-- examples and exercises.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-inequations-premier-degre',
  '2nde',
  'A',
  'mathematiques',
  $$Inéquations du premier degré à une inconnue$$,
  5,
  '2nde-a-maths-equations-premier-degre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un couturier dispose de 12 mètres de tissu pour confectionner des tenues. Chaque tenue nécessite 1,5 mètre de tissu, plus 2 mètres réservés à des retouches communes. Il se demande combien de tenues il peut confectionner au maximum sans dépasser la quantité de tissu disponible : il ne s'agit plus de trouver une valeur exacte comme dans une équation, mais de déterminer tout un ensemble de valeurs possibles — c'est le rôle des inéquations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Résoudre une inéquation simple$$,
        'body', $$Résoudre une inéquation ressemble beaucoup à résoudre une équation : on isole l'inconnue en ajoutant ou soustrayant un même nombre aux deux membres, ou en divisant par le coefficient de x. La seule différence essentielle concerne la division ou la multiplication par un nombre négatif.$$,
        'highlights', array[$$inéquation$$, $$isoler l'inconnue$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Ajouter ou soustraire un même nombre aux deux membres d'une inéquation, ou les multiplier ou diviser par un même nombre strictement positif, ne change pas le sens de l'inégalité.$$),
        'example', jsonb_build_object('statement', $$Résous l'inéquation x − 4 < 9.$$, 'solution', $$x − 4 < 9 équivaut à x < 13.$$),
        'fixation', jsonb_build_object('question', $$Résous l'inéquation 5x ≥ 30.$$, 'solution', $$5x ≥ 30 équivaut à x ≥ 6.$$)
      ),
      jsonb_build_object(
        'heading', $$Le changement de sens de l'inégalité$$,
        'body', $$Quand on multiplie ou qu'on divise les deux membres d'une inéquation par un nombre strictement négatif, le sens de l'inégalité s'inverse : un « plus grand que » devient un « plus petit que », et inversement. C'est l'erreur la plus fréquente à surveiller.$$,
        'highlights', array[$$sens de l'inégalité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Multiplier ou diviser les deux membres d'une inéquation par un même nombre strictement négatif inverse le sens de l'inégalité.$$),
        'example', jsonb_build_object('statement', $$Résous l'inéquation −3x > 15.$$, 'solution', $$En divisant par −3 (négatif), le sens s'inverse : x < 15/(−3) = −5.$$),
        'fixation', jsonb_build_object('question', $$Résous l'inéquation −2x ≤ 8.$$, 'solution', $$En divisant par −2 (négatif), le sens s'inverse : x ≥ 8/(−2) = −4.$$)
      ),
      jsonb_build_object(
        'heading', $$Inéquations du type ax + b ⩾ cx + d$$,
        'body', $$Comme pour les équations, quand l'inconnue apparaît des deux côtés, on regroupe tous les termes en x d'un même côté et les nombres de l'autre, en surveillant à chaque étape si l'on divise par un nombre positif ou négatif.$$,
        'highlights', array[$$regrouper les termes$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Regrouper les termes en x d'un côté et les termes constants de l'autre, réduire, puis diviser par le coefficient de x en appliquant, si besoin, la règle du changement de sens.$$),
        'example', jsonb_build_object('statement', $$Résous l'inéquation 4x + 3 ≤ 7x − 9.$$, 'solution', $$3 + 9 ≤ 7x − 4x, donc 12 ≤ 3x, donc 4 ≤ x, c'est-à-dire x ≥ 4.$$),
        'fixation', jsonb_build_object('question', $$Résous l'inéquation 9x − 2 > 5x + 14.$$, 'solution', $$9x − 5x > 14 + 2, donc 4x > 16, donc x > 4.$$)
      ),
      jsonb_build_object(
        'heading', $$Écriture de l'ensemble des solutions$$,
        'body', $$Contrairement à une équation qui possède en général une unique solution, une inéquation possède une infinité de solutions, que l'on décrit sous la forme d'un intervalle de ℝ.$$,
        'highlights', array[$$ensemble des solutions$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Une fois l'inéquation résolue sous la forme x > a, x ≥ a, x < a ou x ≤ a, on écrit l'ensemble des solutions comme un intervalle : par exemple x > a donne S = ]a ; +∞[.$$),
        'example', jsonb_build_object('statement', $$Résous 2x − 6 > 0 et donne l'ensemble des solutions sous forme d'intervalle.$$, 'solution', $$2x > 6, donc x > 3. L'ensemble des solutions est S = ]3 ; +∞[.$$),
        'fixation', jsonb_build_object('question', $$Résous −5x + 20 ≥ 0 et donne l'ensemble des solutions sous forme d'intervalle.$$, 'solution', $$−5x ≥ −20, donc x ≤ 4 (le sens s'inverse en divisant par −5). L'ensemble des solutions est S = ]−∞ ; 4].$$)
      ),
      jsonb_build_object(
        'heading', $$Systèmes de deux inéquations$$,
        'body', $$Résoudre un système de deux inéquations à une même inconnue, c'est trouver toutes les valeurs qui vérifient les deux inéquations en même temps. On résout chaque inéquation séparément, puis on prend l'intersection des deux ensembles de solutions obtenus.$$,
        'highlights', array[$$système d'inéquations$$, $$intersection$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour un système {ax+b>0 ; cx+d≤0}, on résout chaque inéquation séparément pour obtenir S1 et S2, puis l'ensemble solution du système est S = S1 ∩ S2.$$),
        'example', jsonb_build_object('statement', $$Résous le système {x − 2 > 0 ; 3x − 15 ≤ 0}.$$, 'solution', $$x − 2 > 0 donne x > 2, donc S1 = ]2 ; +∞[. 3x − 15 ≤ 0 donne x ≤ 5, donc S2 = ]−∞ ; 5]. L'ensemble solution est S = S1 ∩ S2 = ]2 ; 5].$$),
        'fixation', jsonb_build_object('question', $$Résous le système {2x + 4 ≥ 0 ; x − 6 < 0}.$$, 'solution', $$2x+4≥0 donne x≥−2, donc S1=[−2 ; +∞[. x−6<0 donne x<6, donc S2=]−∞ ; 6[. L'ensemble solution est S = [−2 ; 6[.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes conduisant à une inéquation$$,
        'body', $$Comme pour une équation, on nomme d'abord l'inconnue, on traduit l'énoncé du problème par une inéquation, on la résout, puis on interprète le résultat en tenant compte du contexte : par exemple, un nombre de tenues ou de personnes doit être un entier positif.$$,
        'highlights', array[$$traduire$$, $$interpréter$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Nommer l'inconnue, traduire l'énoncé par une inéquation, la résoudre, puis interpréter le résultat dans le contexte du problème, en tenant compte des contraintes (par exemple un entier positif).$$),
        'example', jsonb_build_object('statement', $$Un taxi facture 400 F de prise en charge, puis 120 F par kilomètre. Un client dispose de 2200 F. Quel est le nombre maximal de kilomètres qu'il peut parcourir ?$$, 'solution', $$Notons x le nombre de kilomètres. On résout 400+120x ≤ 2200, soit 120x ≤ 1800, soit x ≤ 15. Le client peut parcourir au maximum 15 km.$$),
        'fixation', jsonb_build_object('question', $$Une boutique vend un article à 800 F l'unité, avec des frais de livraison fixes de 500 F. Un client dispose de 5000 F. Combien d'articles peut-il acheter au maximum, livraison comprise ?$$, 'solution', $$Notons x le nombre d'articles. On résout 500+800x ≤ 5000, soit 800x ≤ 4500, soit x ≤ 5,625. Comme x est un entier, le client peut acheter au maximum 5 articles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le couturier de la situation d'apprentissage : il dispose de 12 mètres de tissu, chaque tenue nécessitant 1,5 mètre, et 2 mètres étant réservés aux retouches communes quel que soit le nombre de tenues. Il veut savoir combien de tenues il peut confectionner au maximum sans dépasser son stock de tissu.$$,
      'questions', array[
        $$En notant x le nombre de tenues confectionnées, exprime la quantité totale de tissu utilisée en fonction de x.$$,
        $$Pose l'inéquation traduisant que cette quantité ne doit pas dépasser 12 mètres, puis résous-la.$$,
        $$En tenant compte du fait que x est un nombre entier de tenues, donne le nombre maximal de tenues que le couturier peut confectionner.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Résous l'inéquation 7x − 4 < 3x + 16.$$,
      'hint', $$Regroupe les termes en x d'un côté et les nombres de l'autre, comme pour une équation.$$,
      'expected', $$7x−3x < 16+4, donc 4x < 20, donc x < 5. L'ensemble des solutions est ]−∞ ; 5[.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'inéquation −6x + 12 ≥ 0, en expliquant ce qui se passe pour le sens de l'inégalité.$$,
      'hint', $$Relis la règle du changement de sens quand on divise par un nombre négatif.$$,
      'expected', $$−6x ≥ −12, donc x ≤ 2 (le sens s'inverse car on divise par −6, un nombre négatif). L'ensemble des solutions est ]−∞ ; 2].$$
    ),
    jsonb_build_object(
      'question', $$Résous le système {x + 1 > 0 ; 4x − 20 ≤ 0}.$$,
      'hint', $$Résous chaque inéquation séparément, puis prends l'intersection des deux ensembles obtenus.$$,
      'expected', $$x+1>0 donne x>−1, S1=]−1 ; +∞[. 4x−20≤0 donne x≤5, S2=]−∞ ; 5]. L'ensemble solution du système est S = ]−1 ; 5].$$
    ),
    jsonb_build_object(
      'question', $$Un club de sport propose un abonnement de 3000 F par mois donnant accès à des séances à 200 F chacune, contre 500 F par séance sans abonnement ailleurs. À partir de combien de séances par mois l'abonnement devient-il plus avantageux ? Pose l'inéquation puis résous-la.$$,
      'hint', $$Notons x le nombre de séances. Compare le coût total avec abonnement (3000+200x) et sans abonnement (500x).$$,
      'expected', $$On résout 3000+200x < 500x, soit 3000 < 300x, soit x > 10. L'abonnement devient plus avantageux à partir de 11 séances par mois.$$
    )
  ),
  now()
);
