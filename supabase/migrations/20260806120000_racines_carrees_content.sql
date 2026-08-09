-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 3: Racines carrées"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. No diagram: purely algebraic content.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un menuisier doit fabriquer un plateau de table carré dont l'aire doit être exactement 200 dm². Il ne connaît aucun nombre entier dont le carré donne 200, alors il se demande comment calculer précisément la longueur du côté à découper — c'est exactement le rôle de la racine carrée : trouver le nombre positif qui, élevé au carré, redonne l'aire de départ.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de la racine carrée$$,
        'body', $$Pour un nombre positif a, il existe un unique nombre positif dont le carré vaut a : c'est la racine carrée de a, notée √a. Le symbole √ s'appelle un radical.$$,
        'highlights', array[$$racine carrée$$, $$radical$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a positif, √a est le nombre positif tel que (√a)² = a. On a toujours √a ≥ 0, et √a = b équivaut à a = b².$$),
        'example', jsonb_build_object('statement', $$Calcule √49.$$, 'solution', $$7² = 49 et 7 est positif, donc √49 = 7.$$),
        'fixation', jsonb_build_object('question', $$Calcule √81.$$, 'solution', $$9² = 81 et 9 est positif, donc √81 = 9.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres réels et valeur absolue$$,
        'body', $$Certains nombres, comme √2, ne peuvent pas s'écrire comme une fraction : on les appelle irrationnels. Avec les rationnels, ils forment l'ensemble des nombres réels, noté ℝ. Pour mesurer la distance d'un nombre réel à zéro, on utilise sa valeur absolue.$$,
        'highlights', array[$$irrationnels$$, $$nombres réels$$, $$valeur absolue$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tout réel a positif, |a| = a. Pour tout réel a négatif, |a| = −a. Et pour tout réel a, √(a²) = |a|.$$),
        'example', jsonb_build_object('statement', $$Simplifie √((−9)²).$$, 'solution', $$√((−9)²) = |−9| = 9.$$),
        'fixation', jsonb_build_object('question', $$Simplifie √((−4,5)²).$$, 'solution', $$√((−4,5)²) = |−4,5| = 4,5.$$)
      ),
      jsonb_build_object(
        'heading', $$Racine carrée d'un produit$$,
        'body', $$Pour calculer la racine carrée d'un produit de deux nombres positifs, on peut séparer les deux facteurs et prendre la racine carrée de chacun séparément.$$,
        'highlights', array[$$produit$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a et b positifs : √(a × b) = √a × √b.$$),
        'example', jsonb_build_object('statement', $$Écris √(9 × 25) sans radical.$$, 'solution', $$√(9×25) = √9 × √25 = 3 × 5 = 15.$$),
        'fixation', jsonb_build_object('question', $$Écris √8 × √2 sans radical.$$, 'solution', $$√8 × √2 = √(8×2) = √16 = 4.$$)
      ),
      jsonb_build_object(
        'heading', $$Racine carrée d'un quotient$$,
        'body', $$La même idée s'applique à un quotient : on peut séparer numérateur et dénominateur, à condition que le dénominateur ne soit pas nul.$$,
        'highlights', array[$$quotient$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a positif et b strictement positif : √(a/b) = √a/√b.$$),
        'example', jsonb_build_object('statement', $$Écris √(16/25) sans radical.$$, 'solution', $$√(16/25) = √16/√25 = 4/5.$$),
        'fixation', jsonb_build_object('question', $$Écris √50/√2 sans radical.$$, 'solution', $$√50/√2 = √(50/2) = √25 = 5.$$)
      ),
      jsonb_build_object(
        'heading', $$Rendre un dénominateur sans radical$$,
        'body', $$Une fraction avec un radical au dénominateur n'est pas considérée comme totalement simplifiée. Pour l'éliminer, on multiplie le numérateur et le dénominateur par une expression bien choisie qui fait disparaître le radical en bas.$$,
        'highlights', array[$$dénominateur$$, $$expression conjuguée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour a/√b, on multiplie haut et bas par √b. Pour a/(b+c√d), on multiplie par l'expression conjuguée b − c√d, choisie pour que (b+c√d)(b−c√d) = b² − c²d ne contienne plus de radical.$$),
        'example', jsonb_build_object('statement', $$Écris 3/√5 sans radical au dénominateur.$$, 'solution', $$3/√5 = (3×√5)/(√5×√5) = 3√5/5.$$),
        'fixation', jsonb_build_object('question', $$Écris 2/(1+√3) sans radical au dénominateur.$$, 'solution', $$2/(1+√3) = 2(1−√3)/[(1+√3)(1−√3)] = 2(1−√3)/(1−3) = √3 − 1.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un jardinier dispose d'un terrain carré MNPQ de côté 20√3 mètres. Il réserve un coin carré de côté x mètres pour une allée. Il veut connaître le coût pour engazonner le reste du terrain, à 50 F CFA le mètre carré.$$,
      'questions', array[
        $$Exprime en fonction de x l'aire du terrain carré MNPQ, puis celle de l'allée carrée.$$,
        $$Montre que l'aire à engazonner est Ar = (20√3 − x)(20√3 + x) m².$$,
        $$Sachant que x = 10 m et que 1,73 < √3 < 1,74, donne un encadrement de l'aire à engazonner, puis du coût total.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule √64 puis vérifie ta réponse en calculant son carré.$$,
      'hint', $$Relis la définition : √a est le nombre positif dont le carré vaut a.$$,
      'expected', $$√64 = 8, car 8² = 64 et 8 est positif.$$
    ),
    jsonb_build_object(
      'question', $$Écris √12 sous la forme a√b avec b le plus petit possible.$$,
      'hint', $$Relis le passage sur la racine carrée d'un produit : cherche un facteur carré parfait dans 12.$$,
      'expected', $$√12 = √(4×3) = √4×√3 = 2√3.$$
    ),
    jsonb_build_object(
      'question', $$Écris √18 × √2 sans radical.$$,
      'hint', $$Relis la propriété du produit de deux racines carrées.$$,
      'expected', $$√18 × √2 = √(18×2) = √36 = 6.$$
    ),
    jsonb_build_object(
      'question', $$Écris 5/√2 sans radical au dénominateur, en détaillant l'étape de multiplication.$$,
      'hint', $$Relis la méthode pour rendre un dénominateur sans radical : multiplie haut et bas par √2.$$,
      'expected', $$5/√2 = (5×√2)/(√2×√2) = 5√2/2.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-racines-carrees';
