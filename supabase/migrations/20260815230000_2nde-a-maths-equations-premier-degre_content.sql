-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- complements the official Ivorian Seconde A programme (Compétence 1,
-- Thème 2: Équations du premier degré à une inconnue, following on from
-- "Calcul algébrique") with original, general-knowledge content adapted to
-- the série A (littéraire) level: simple equations, equations with the
-- unknown on both sides, equations requiring expansion or a common
-- denominator, the null-product equation, and word problems. No source
-- PDF was available for this topic; entirely original wording, examples
-- and exercises.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-equations-premier-degre',
  '2nde',
  'A',
  'mathematiques',
  $$Équations du premier degré à une inconnue$$,
  4,
  '2nde-a-maths-calcul-algebrique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deux compagnies de transport proposent des tarifs différents pour un trajet en car. La première facture 500 F de réservation puis 150 F par kilomètre, la seconde ne facture que 200 F par kilomètre sans frais de réservation. Un voyageur se demande à partir de quelle distance les deux prix deviennent identiques, afin de choisir la compagnie la plus avantageuse selon la longueur de son trajet.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équations du type x + a = b et ax = b$$,
        'body', $$Résoudre une équation, c'est trouver la ou les valeurs de l'inconnue qui rendent l'égalité vraie. Dans les cas les plus simples, il suffit d'isoler x d'un seul côté du signe égal, en soustrayant un nombre ou en divisant par le coefficient de x.$$,
        'highlights', array[$$équation$$, $$isoler l'inconnue$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tout réel a, l'équation x + a = b équivaut à x = b − a. Pour a ≠ 0, l'équation ax = b équivaut à x = b/a.$$),
        'example', jsonb_build_object('statement', $$Résous l'équation x + 9 = 4.$$, 'solution', $$x + 9 = 4 équivaut à x = 4 − 9 = −5.$$),
        'fixation', jsonb_build_object('question', $$Résous l'équation 6x = 42.$$, 'solution', $$6x = 42 équivaut à x = 42/6 = 7.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations du type ax + b = cx + d$$,
        'body', $$Lorsque l'inconnue x apparaît des deux côtés de l'égalité, on rassemble d'abord tous les termes en x d'un même côté et tous les nombres de l'autre, pour se ramener à une équation du type ax = b déjà connue.$$,
        'highlights', array[$$regrouper les termes$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Une équation ax + b = cx + d se ramène à une équation de la forme ex = f en regroupant les termes en x d'un côté et les termes constants de l'autre ; elle admet f/e pour unique solution lorsque e ≠ 0.$$),
        'example', jsonb_build_object('statement', $$Résous l'équation 7x − 3 = 2x + 12.$$, 'solution', $$7x − 2x = 12 + 3, donc 5x = 15, donc x = 3.$$),
        'fixation', jsonb_build_object('question', $$Résous l'équation 9x + 2 = 4x + 22.$$, 'solution', $$9x − 4x = 22 − 2, donc 5x = 20, donc x = 4.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations nécessitant un développement$$,
        'body', $$Quand une équation contient des parenthèses, on commence toujours par les développer, avant d'appliquer la méthode de regroupement des termes.$$,
        'highlights', array[$$développer$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Développer chaque membre de l'équation contenant des parenthèses, réduire, puis regrouper les termes en x d'un côté et les nombres de l'autre.$$),
        'example', jsonb_build_object('statement', $$Résous l'équation 3(x+2) = x + 14.$$, 'solution', $$3x + 6 = x + 14, donc 3x − x = 14 − 6, donc 2x = 8, donc x = 4.$$),
        'fixation', jsonb_build_object('question', $$Résous l'équation 2(x−5) = 3(x−4).$$, 'solution', $$2x − 10 = 3x − 12, donc −10 + 12 = 3x − 2x, donc x = 2.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations avec des fractions$$,
        'body', $$Quand une équation contient des fractions à dénominateurs numériques, on multiplie les deux membres par un même dénominateur commun pour faire disparaître toutes les fractions, puis on résout l'équation obtenue.$$,
        'highlights', array[$$dénominateur commun$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Multiplier chaque terme de l'équation par le plus petit dénominateur commun aux fractions présentes, simplifier, puis résoudre l'équation sans fraction obtenue.$$),
        'example', jsonb_build_object('statement', $$Résous l'équation x/3 + 1 = x/2.$$, 'solution', $$En multipliant par 6 : 2x + 6 = 3x, donc 6 = 3x − 2x, donc x = 6.$$),
        'fixation', jsonb_build_object('question', $$Résous l'équation x/4 − 2 = 1.$$, 'solution', $$x/4 = 3, donc x = 12.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations produit nul$$,
        'body', $$Un produit de deux facteurs est nul si, et seulement si, l'un au moins de ces facteurs est nul. Cette propriété permet de résoudre des équations qu'on ne pourrait pas isoler directement, en les mettant sous forme de produit.$$,
        'highlights', array[$$produit nul$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tous réels a, b, c, d avec a et c non nuls : (ax+b)(cx+d) = 0 équivaut à ax+b = 0 ou cx+d = 0.$$),
        'example', jsonb_build_object('statement', $$Résous l'équation (3x−9)(x+5) = 0.$$, 'solution', $$3x−9=0 donne x=3 ; x+5=0 donne x=−5. Les solutions sont donc 3 et −5.$$),
        'fixation', jsonb_build_object('question', $$Résous l'équation (2x+4)(5x−10) = 0.$$, 'solution', $$2x+4=0 donne x=−2 ; 5x−10=0 donne x=2. Les solutions sont donc −2 et 2.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes conduisant à une équation$$,
        'body', $$Pour résoudre un problème concret à l'aide d'une équation, on commence par choisir une lettre pour désigner l'inconnue, on traduit les données de l'énoncé par une égalité, on résout cette équation, puis on interprète le résultat dans le contexte du problème.$$,
        'highlights', array[$$inconnue$$, $$traduire$$, $$interpréter$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Nommer l'inconnue par une lettre, traduire l'énoncé par une équation, résoudre cette équation, puis vérifier et interpréter le résultat dans le contexte du problème posé.$$),
        'example', jsonb_build_object('statement', $$La somme de deux nombres consécutifs est 45. Trouve ces deux nombres.$$, 'solution', $$Notons x le premier nombre ; le second est x+1. On résout x+(x+1)=45, soit 2x+1=45, soit 2x=44, soit x=22. Les deux nombres sont 22 et 23.$$),
        'fixation', jsonb_build_object('question', $$Le triple d'un nombre, diminué de 7, vaut 20. Trouve ce nombre.$$, 'solution', $$Notons x le nombre. On résout 3x−7=20, soit 3x=27, soit x=9.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends les deux compagnies de transport de la situation d'apprentissage : la première facture 500 F de réservation puis 150 F par kilomètre, la seconde facture 200 F par kilomètre sans frais de réservation. Un voyageur veut connaître la distance à partir de laquelle les deux tarifs sont égaux, pour choisir la compagnie la plus économique selon la longueur de son trajet.$$,
      'questions', array[
        $$En notant x la distance en kilomètres, exprime le prix payé chez chacune des deux compagnies en fonction de x.$$,
        $$Pose l'équation traduisant l'égalité des deux prix, puis résous-la.$$,
        $$Interprète le résultat : pour un trajet de 8 km, quelle compagnie est la plus avantageuse ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Résous l'équation 8x − 5 = 3x + 15.$$,
      'hint', $$Regroupe les termes en x d'un côté et les nombres de l'autre.$$,
      'expected', $$8x−3x = 15+5, donc 5x=20, donc x=4.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation 5(x−3) = 2(x+6).$$,
      'hint', $$Développe d'abord les deux membres, puis regroupe les termes.$$,
      'expected', $$5x−15 = 2x+12, donc 5x−2x = 12+15, donc 3x=27, donc x=9.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation (4x−8)(x+3) = 0.$$,
      'hint', $$Relis la propriété du produit nul : chaque facteur peut être égal à zéro.$$,
      'expected', $$4x−8=0 donne x=2 ; x+3=0 donne x=−3. Les solutions sont 2 et −3.$$
    ),
    jsonb_build_object(
      'question', $$Un père a 3 fois l'âge de son fils. Dans 10 ans, il aura seulement le double de son âge. Quel est l'âge actuel du fils ? Pose l'équation puis résous-la.$$,
      'hint', $$Notons x l'âge actuel du fils ; l'âge du père est alors 3x. Traduis « dans 10 ans » en ajoutant 10 à chaque âge.$$,
      'expected', $$On résout 3x+10 = 2(x+10), soit 3x+10 = 2x+20, soit x = 10. Le fils a actuellement 10 ans.$$
    )
  ),
  now()
);
