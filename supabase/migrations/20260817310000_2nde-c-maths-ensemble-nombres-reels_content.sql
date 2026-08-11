-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3132: "MATH_2C L2: ENSEMBLE DES NOMBRES REELS"
-- (https://lyc.ecole-ci.org/course/view.php?id=3132)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30859, redirecting
-- to pluginfile "Maths 2C_L2_ENSEMBLE DES NOMBRES REELS.pdf" (15 pages).
-- Rewritten/paraphrased from the source PDF: nombres rationnels/irrationnels
-- (avec preuve par l'absurde de l'irrationalité de racine de 2), ordre et
-- opérations dans R, minorants/majorants, valeur absolue et distance entre
-- deux réels, équations et inéquations du type |x-a|=r et |x-a|<=r, valeur
-- approchée et encadrement. 100% original wording; no sentence copied from
-- the source; numeric examples changed.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-ensemble-nombres-reels',
  '2nde',
  'C',
  'mathematiques',
  $$Ensemble des nombres réels$$,
  2,
  '2nde-c-maths-vecteurs-points-plan',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un laboratoire de sciences, quatre professeurs relèvent la même mesure mais l'écrivent chacun différemment : l'un note 5/3, l'autre 1,666..., un troisième √(25/9) et le dernier une écriture décimale approchée. Un élève de seconde C, venu chercher du matériel, remarque ces relevés et affirme que les quatre professeurs ont en réalité employé des langages différents pour exprimer la même chose. Ses camarades, surpris, décident de vérifier cette affirmation en se renseignant sur l'ensemble des nombres réels.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Nombres rationnels et irrationnels$$,
        'body', $$Un nombre rationnel est un nombre qui peut s'écrire sous la forme d'une fraction a/b, où a est un entier relatif et b un entier relatif non nul. Par exemple, 5 ; −3 ; 10,32 ; −4,7 et −5/3 sont tous des nombres rationnels, car chacun peut se ramener à une fraction de deux entiers. Un nombre est dit irrationnel lorsqu'il n'est pas rationnel, c'est-à-dire lorsqu'il est impossible de l'écrire sous forme d'une fraction de deux entiers : c'est le cas de √2, √3, π ou encore √(7/6).$$,
        'highlights', array[$$nombre rationnel$$, $$nombre irrationnel$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un nombre rationnel s'écrit a/b avec a entier relatif et b entier relatif non nul. Un nombre irrationnel ne peut pas s'écrire sous cette forme.$$),
        'example', jsonb_build_object('statement', $$Pourquoi √2 est-il un nombre irrationnel ? (Raisonnement par l'absurde résumé.)$$, 'solution', $$On suppose le contraire : que √2 s'écrit a/b avec a et b entiers et la fraction irréductible. En élevant au carré et en manipulant l'égalité, on montre que a et b seraient tous deux pairs, ce qui contredit le fait que la fraction est irréductible. Cette contradiction prouve que √2 ne peut pas être rationnel.$$),
        'fixation', jsonb_build_object('question', $$Le nombre 10,32 est-il rationnel ? Justifie.$$, 'solution', $$Oui, car il peut s'écrire sous forme de fraction, par exemple 1032/100, qui est bien le quotient de deux entiers.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ensemble des nombres réels et l'ordre dans R$$,
        'body', $$L'ensemble formé de tous les nombres rationnels et de tous les nombres irrationnels est appelé l'ensemble des nombres réels, noté R. Comme dans les ensembles de nombres déjà connus, R est muni d'une relation d'ordre qui se comporte bien avec les opérations : on peut additionner un même nombre aux deux membres d'une inégalité, multiplier une inégalité par un nombre positif sans changer son sens, ou par un nombre négatif en inversant son sens. Ces règles permettent de comparer deux réels sans forcément les calculer complètement, par exemple en étudiant le signe de leur différence.$$,
        'highlights', array[$$ensemble R$$, $$relation d'ordre$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Hypothèse$$, $$Conséquence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a ≤ b$$, $$a + c ≤ b + c$$),
            jsonb_build_array($$a ≤ b et c > 0$$, $$ac ≤ bc$$),
            jsonb_build_array($$a ≤ b et c < 0$$, $$ac ≥ bc$$),
            jsonb_build_array($$a ≤ b, a et b positifs$$, $$a² ≤ b² et √a ≤ √b$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Compare les nombres −3/5 et −5/7 en étudiant le signe de leur différence.$$, 'solution', $$(−3/5) − (−5/7) = −3/5 + 5/7 = (−21+25)/35 = 4/35, or 4/35 > 0, donc −3/5 > −5/7.$$),
        'fixation', jsonb_build_object('question', $$Si a ≤ b et c < 0, que peut-on dire de ac et bc ?$$, 'solution', $$Multiplier par un nombre négatif inverse le sens de l'inégalité : on a donc ac ≥ bc.$$)
      ),
      jsonb_build_object(
        'heading', $$Minorants, majorants et bornes$$,
        'body', $$Soit E une partie non vide de R. Un nombre réel M est un majorant de E lorsque M est supérieur ou égal à tous les éléments de E ; un ensemble qui admet un majorant est dit majoré. De même, un nombre réel m est un minorant de E lorsqu'il est inférieur ou égal à tous les éléments de E, et l'ensemble est alors dit minoré. Lorsqu'il existe, le plus petit des majorants d'un ensemble en est le maximum, et le plus grand de ses minorants en est le minimum. Toute partie finie de R admet à la fois un maximum et un minimum.$$,
        'highlights', array[$$majorant$$, $$minorant$$, $$maximum, minimum$$]::text[],
        'example', jsonb_build_object('statement', $$Quels sont le minimum et le maximum de l'intervalle [0 ; 1] ? Que dire de l'intervalle ]−1 ; 6[ ?$$, 'solution', $$L'intervalle [0 ; 1] admet 0 comme minimum et 1 comme maximum, car ses bornes sont incluses. L'intervalle ]−1 ; 6[ n'admet ni maximum ni minimum, car ses bornes sont exclues.$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire qu'un nombre réel m est un minorant d'un ensemble E ?$$, 'solution', $$Cela signifie que m est inférieur ou égal à tout élément de E.$$)
      ),
      jsonb_build_object(
        'heading', $$Valeur absolue et distance entre deux réels$$,
        'body', $$La valeur absolue d'un nombre réel a, notée |a|, est la distance de ce nombre à zéro sur une droite graduée : |a| = a si a ≥ 0, et |a| = −a si a ≤ 0. Elle vérifie de nombreuses propriétés utiles pour simplifier des expressions : |x+y| = |x|+|y| n'est vraie qu'exceptionnellement, mais |xy| = |x|×|y| et |x/y| = |x|/|y| (pour y non nul) le sont toujours. On appelle distance entre deux réels x et y le nombre d(x;y) = |x−y|, qui mesure l'écart entre les deux points correspondants sur la droite graduée.$$,
        'highlights', array[$$valeur absolue$$, $$distance entre deux réels$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule la distance entre 9 et 12, puis entre −5 et −7.$$, 'solution', $$d(9;12) = |9−12| = |−3| = 3. d(−5;−7) = |−5−(−7)| = |−5+7| = |2| = 2.$$),
        'fixation', jsonb_build_object('question', $$Calcule |4| et |√3 − 2|.$$, 'solution', $$|4| = 4 car 4 > 0. |√3 − 2| = 2 − √3 car √3 − 2 < 0 (donc on prend l'opposé).$$)
      ),
      jsonb_build_object(
        'heading', $$Équations et inéquations avec valeur absolue$$,
        'body', $$Pour un réel a et un réel strictement positif r, l'équation |x−a| = r a pour ensemble de solutions {a−r ; a+r} : les deux solutions sont symétriques par rapport à a, à une distance r de part et d'autre. De la même façon, l'inéquation |x−a| ≤ r équivaut à a−r ≤ x ≤ a+r, c'est-à-dire à x appartenant à l'intervalle [a−r ; a+r]. Ces résultats permettent de résoudre rapidement des problèmes d'encadrement, notamment lorsqu'une valeur approchée y d'un réel x est donnée avec une incertitude ε telle que |x−y| ≤ ε.$$,
        'highlights', array[$$|x−a| = r$$, $$|x−a| ≤ r$$, $$valeur approchée$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans R l'inéquation |x−2| ≤ 3.$$, 'solution', $$C'est une inéquation de la forme |x−a| ≤ r avec a=2 et r=3, donc l'ensemble des solutions est [2−3 ; 2+3] = [−1 ; 5].$$),
        'fixation', jsonb_build_object('question', $$Résous dans R l'équation |x+1| = 2.$$, 'solution', $$Les solutions sont −1−2 = −3 et −1+2 = 1, donc S = {−3 ; 1}.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux élèves, positionnés respectivement au point d'abscisse 0 et au point d'abscisse 400 (en mètres) le long d'une même rue rectiligne, se donnent rendez-vous en un point M d'abscisse x. Le premier élève accepte de marcher au maximum 200 mètres et le second au maximum 300 mètres pour se rejoindre. On veut déterminer la zone de la rue où leur rencontre peut avoir lieu.$$,
      'questions', array[
        $$Traduis chacune des deux contraintes de marche à l'aide d'une inéquation avec valeur absolue portant sur x.$$,
        $$Résous chacune de ces deux inéquations pour obtenir un encadrement de x.$$,
        $$En combinant les deux résultats, donne l'intervalle exact dans lequel peut se trouver le point de rencontre M.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Le nombre −4,7 est-il rationnel ou irrationnel ? Justifie.$$,
      'hint', $$Peux-tu l'écrire comme une fraction de deux entiers ?$$,
      'expected', $$Il est rationnel, car −4,7 = −47/10, qui est bien le quotient de deux entiers.$$
    ),
    jsonb_build_object(
      'question', $$Compare 2√5 et 3√2 en comparant leurs carrés.$$,
      'hint', $$Calcule (2√5)² et (3√2)², puis compare les deux résultats.$$,
      'expected', $$(2√5)² = 20 et (3√2)² = 18. Comme 20 > 18, on a 2√5 > 3√2.$$
    ),
    jsonb_build_object(
      'question', $$Calcule la distance entre les réels −16 et 23.$$,
      'hint', $$Utilise la formule d(x;y) = |x−y|.$$,
      'expected', $$d(−16;23) = |−16−23| = |−39| = 39.$$
    ),
    jsonb_build_object(
      'question', $$Résous dans R l'inéquation |x−4| ≤ 5.$$,
      'hint', $$C'est une inéquation du type |x−a| ≤ r ; identifie a et r.$$,
      'expected', $$Ici a=4 et r=5, donc S = [4−5 ; 4+5] = [−1 ; 9].$$
    )
  ),
  now()
);
