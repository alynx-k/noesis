-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- complements the official Ivorian Seconde A programme (Compétence 1,
-- Thème 2: Calcul algébrique, following on from "Calculs numériques") with
-- original, general-knowledge content adapted to the série A (littéraire)
-- level: developing and reducing expressions, the three usual remarkable
-- identities, and factorisation by common factor or by a remarkable
-- identity. No source PDF was available for this topic; entirely original
-- wording, examples and exercises.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-calcul-algebrique',
  '2nde',
  'A',
  'mathematiques',
  $$Calcul algébrique$$,
  3,
  '2nde-a-maths-ensembles-de-nombres',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un menuisier calcule l'aire d'une planche rectangulaire dont la longueur vaut (x + 3) et la largeur (x − 2), x désignant une mesure en décimètres qu'il ne connaît pas encore précisément. Pour commander la bonne quantité de vernis, il doit exprimer cette aire sous une forme qui ne contient plus de parenthèses. Le calcul algébrique lui permet justement de transformer une écriture avec parenthèses en une expression équivalente, plus facile à utiliser.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Développer une expression$$,
        'body', $$Développer une expression, c'est transformer un produit en une somme, en supprimant les parenthèses. Pour un facteur unique devant une somme, on distribue ce facteur à chaque terme. Pour deux sommes entre parenthèses, chaque terme de la première doit être multiplié par chaque terme de la seconde.$$,
        'highlights', array[$$développer$$, $$distributivité$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Pour tous réels a, b, c, d : k(a+b) = ka + kb ; (a+b)(c+d) = ac + ad + bc + bd.$$),
        'example', jsonb_build_object('statement', $$Développe (x+3)(x−2).$$, 'solution', $$(x+3)(x−2) = x×x + x×(−2) + 3×x + 3×(−2) = x² − 2x + 3x − 6 = x² + x − 6.$$),
        'fixation', jsonb_build_object('question', $$Développe 4(2x − 5).$$, 'solution', $$4(2x−5) = 4×2x − 4×5 = 8x − 20.$$)
      ),
      jsonb_build_object(
        'heading', $$Les identités remarquables$$,
        'body', $$Trois développements reviennent si souvent qu'on les mémorise directement comme des identités remarquables : le carré d'une somme, le carré d'une différence, et le produit d'une somme par une différence. Les reconnaître permet de développer ou de factoriser beaucoup plus vite qu'en distribuant terme à terme.$$,
        'highlights', array[$$identités remarquables$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Pour tous réels a et b : (a+b)² = a² + 2ab + b² ; (a−b)² = a² − 2ab + b² ; (a+b)(a−b) = a² − b².$$),
        'example', jsonb_build_object('statement', $$Développe (2x+5)².$$, 'solution', $$(2x+5)² = (2x)² + 2×(2x)×5 + 5² = 4x² + 20x + 25.$$),
        'fixation', jsonb_build_object('question', $$Développe (3x−1)(3x+1).$$, 'solution', $$(3x−1)(3x+1) = (3x)² − 1² = 9x² − 1.$$)
      ),
      jsonb_build_object(
        'heading', $$Réduire une expression algébrique$$,
        'body', $$Après avoir développé, une expression contient souvent plusieurs termes qui se ressemblent, appelés termes semblables (même lettre affectée du même exposant). Réduire l'expression consiste à les regrouper en un seul terme, pour obtenir l'écriture la plus simple possible.$$,
        'highlights', array[$$termes semblables$$, $$réduire$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Pour réduire une expression, on additionne entre eux les coefficients des termes qui contiennent la même lettre au même exposant, et on additionne séparément les termes constants.$$),
        'example', jsonb_build_object('statement', $$Réduis l'expression 5x + 3 − 2x + 7.$$, 'solution', $$5x + 3 − 2x + 7 = (5x−2x) + (3+7) = 3x + 10.$$),
        'fixation', jsonb_build_object('question', $$Réduis l'expression 4x² − x + 6x² + 5x.$$, 'solution', $$4x² − x + 6x² + 5x = (4x²+6x²) + (−x+5x) = 10x² + 4x.$$)
      ),
      jsonb_build_object(
        'heading', $$Factoriser à l'aide d'un facteur commun$$,
        'body', $$Factoriser une expression, c'est l'écrire sous la forme d'un produit. Quand plusieurs termes contiennent une même expression, appelée facteur commun, on peut la mettre en évidence en utilisant la distributivité dans l'autre sens.$$,
        'highlights', array[$$facteur commun$$, $$factoriser$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$Si chaque terme d'une somme contient un même facteur k, alors ka + kb = k(a+b) : on écrit k une seule fois, suivi entre parenthèses de ce qui reste dans chaque terme.$$),
        'example', jsonb_build_object('statement', $$Factorise 6x + 15.$$, 'solution', $$6x et 15 ont pour facteur commun 3 : 6x + 15 = 3(2x + 5).$$),
        'fixation', jsonb_build_object('question', $$Factorise 4x² − 8x.$$, 'solution', $$4x² et 8x ont pour facteur commun 4x : 4x² − 8x = 4x(x − 2).$$)
      ),
      jsonb_build_object(
        'heading', $$Factoriser à l'aide d'une identité remarquable$$,
        'body', $$Quand une expression a la forme d'un carré développé ou d'une différence de deux carrés, on peut la factoriser directement en reconnaissant l'identité remarquable correspondante, lue cette fois de droite à gauche.$$,
        'highlights', array[$$factorisation$$, $$différence de carrés$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$a² + 2ab + b² = (a+b)² ; a² − 2ab + b² = (a−b)² ; a² − b² = (a+b)(a−b).$$),
        'example', jsonb_build_object('statement', $$Factorise x² − 49.$$, 'solution', $$x² − 49 = x² − 7² = (x+7)(x−7).$$),
        'fixation', jsonb_build_object('question', $$Factorise x² − 6x + 9.$$, 'solution', $$x² − 6x + 9 = x² − 2×x×3 + 3² = (x−3)².$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une association agricole dispose d'un champ carré de côté (x+4) mètres. Elle veut y aménager un bassin carré de côté (x−1) mètres, situé dans un coin du champ, et cultiver le reste. Le trésorier veut connaître l'aire cultivable en fonction de x, sous une forme la plus simple possible, avant de fixer le prix de vente des récoltes au mètre carré.$$,
      'questions', array[
        $$Exprime l'aire du champ carré et celle du bassin carré à l'aide d'une identité remarquable, sans les développer entièrement.$$,
        $$Développe chacune des deux aires obtenues, puis réduis l'expression de l'aire cultivable (aire du champ moins aire du bassin).$$,
        $$Factorise l'expression obtenue pour l'aire cultivable, en reconnaissant une différence de carrés ou un facteur commun.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Développe et réduis (x+6)(x−4).$$,
      'hint', $$Distribue chaque terme de la première parenthèse à chaque terme de la seconde, puis regroupe les termes semblables.$$,
      'expected', $$(x+6)(x−4) = x²−4x+6x−24 = x²+2x−24.$$
    ),
    jsonb_build_object(
      'question', $$Développe (5x−2)² à l'aide d'une identité remarquable.$$,
      'hint', $$Relis l'identité (a−b)² = a² − 2ab + b², avec a=5x et b=2.$$,
      'expected', $$(5x−2)² = (5x)² − 2×(5x)×2 + 2² = 25x² − 20x + 4.$$
    ),
    jsonb_build_object(
      'question', $$Factorise 9x + 21.$$,
      'hint', $$Cherche le plus grand facteur commun aux deux termes.$$,
      'expected', $$9x et 21 ont pour facteur commun 3 : 9x + 21 = 3(3x + 7).$$
    ),
    jsonb_build_object(
      'question', $$Factorise 16x² − 25 à l'aide d'une identité remarquable.$$,
      'hint', $$Écris 16x² et 25 comme des carrés, puis utilise a² − b² = (a+b)(a−b).$$,
      'expected', $$16x² − 25 = (4x)² − 5² = (4x+5)(4x−5).$$
    )
  ),
  now()
);
