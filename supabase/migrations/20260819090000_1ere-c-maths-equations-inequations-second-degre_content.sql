-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2022: "MATHS_1C L1: ÉQUATIONS ET INÉQUATIONS DU SECOND
-- DEGRÉ DANS IR" (https://lyc.ecole-ci.org/course/view.php?id=2022),
-- resource id 17726. Contenu mathématique factuel (définitions, théorèmes,
-- formules, exercices), non soumis au droit d'auteur ; reformulé pour la
-- structure CourseContentV2 mais les résultats mathématiques (discriminant,
-- formules des racines, tableaux de signes) sont repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-equations-inequations-second-degre',
  '1ere',
  'C',
  'mathematiques',
  $$Équations et inéquations du second degré dans IR$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de 1ère décide de faire un jardin de tomates rectangulaire. Son père lui offre 20 mètres de grillage pour la clôture, qu'elle veut utiliser entièrement, en laissant un côté de longueur sans clôture. Elle veut que l'aire du jardin soit de 48 m², mais peine à déterminer les dimensions. Avec ses camarades, elle décide de résoudre ce problème.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le discriminant d'un polynôme du second degré$$,
        'body', $$Pour un polynôme P(x) = ax² + bx + c avec a ≠ 0, on appelle discriminant le nombre réel Δ = b² − 4ac. Si Δ > 0, P admet deux zéros distincts x₁ = (−b−√Δ)/(2a) et x₂ = (−b+√Δ)/(2a), et se factorise en P(x) = a(x−x₁)(x−x₂). Si Δ = 0, P admet un zéro double x₀ = −b/(2a), et P(x) = a(x−x₀)². Si Δ < 0, P n'admet aucun zéro réel et n'est pas factorisable.$$,
        'highlights', array[$$Δ = b² − 4ac$$, $$Δ > 0 : deux zéros distincts$$, $$Δ = 0 : zéro double$$, $$Δ < 0 : aucun zéro réel$$]::text[],
        'property', jsonb_build_object('label', $$Formules des racines$$, 'text', $$x₁ = (−b−√Δ)/(2a) et x₂ = (−b+√Δ)/(2a) lorsque Δ > 0 ; x₀ = −b/(2a) lorsque Δ = 0.$$),
        'example', jsonb_build_object('statement', $$Calcule les zéros éventuels de R(x) = 2x² + 3x − 5 et factorise si possible.$$, 'solution', $$Δ = 3² − 4×2×(−5) = 9 + 40 = 49, donc Δ > 0. x₁ = (−3−7)/4 = −5/2 et x₂ = (−3+7)/4 = 1. R(x) = 2(x + 5/2)(x − 1).$$),
        'fixation', jsonb_build_object('question', $$Le polynôme Q(x) = x² − 4x + 4 a pour discriminant Δ = 0. Quel est son zéro et sa forme factorisée ?$$, 'solution', $$Le zéro double est x₀ = −(−4)/(2×1) = 2, donc Q(x) = (x − 2)².$$)
      ),
      jsonb_build_object(
        'heading', $$Résolution d'une équation du second degré$$,
        'body', $$Résoudre ax² + bx + c = 0 (a ≠ 0) revient à trouver les zéros du polynôme P(x) = ax² + bx + c, en utilisant le discriminant. Propriété (somme et produit) : si l'équation admet deux solutions x₁ et x₂ (distinctes ou non), alors x₁ + x₂ = −b/a et x₁x₂ = c/a. Réciproquement, si S² − 4P ≥ 0, il existe deux réels de somme S et de produit P, solutions de x² − Sx + P = 0.$$,
        'highlights', array[$$x₁ + x₂ = −b/a et x₁x₂ = c/a$$, $$déterminer 2 nombres de somme S et produit P : résoudre x² − Sx + P = 0 (si S² − 4P ≥ 0)$$]::text[],
        'example', jsonb_build_object('statement', $$L'équation x² + 5x + 4 = 0 admet deux solutions dont l'une est −1. Détermine l'autre.$$, 'solution', $$x₁ + x₂ = −b/a = −5, donc −1 + x₂ = −5, d'où x₂ = −4. (Vérification par le produit : x₁x₂ = c/a = 4, donc −1×x₂ = 4, x₂ = −4.)$$),
        'fixation', jsonb_build_object('question', $$Détermine deux nombres réels dont la somme est −3 et le produit est −4.$$, 'solution', $$S² − 4P = 9 + 16 = 25 ≥ 0, donc ils existent : solutions de x² + 3x − 4 = 0, soit Δ = 25, x₁ = 1 et x₂ = −4. Les deux nombres sont 1 et −4.$$)
      ),
      jsonb_build_object(
        'heading', $$Signe d'un polynôme et résolution d'une inéquation du second degré$$,
        'body', $$Pour P(x) = ax² + bx + c : si Δ > 0 (zéros x₁ < x₂), P(x) est du signe de a à l'extérieur de [x₁;x₂] et du signe de −a entre x₁ et x₂. Si Δ = 0 (zéro double x₀), P(x) est du signe de a partout sauf en x₀ où il s'annule. Si Δ < 0, P(x) garde le signe de a sur tout ℝ. Résoudre une inéquation du second degré revient à étudier ce signe puis à identifier le ou les intervalles correspondant à l'inégalité recherchée.$$,
        'highlights', array[$$Δ > 0 : signe de a à l'extérieur des racines, signe de −a entre les racines$$, $$Δ ≤ 0 : signe constant de a (sauf annulation en x₀ si Δ=0)$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans ℝ l'inéquation 2x² − 5x + 3 < 0.$$, 'solution', $$Δ = 25 − 24 = 1 > 0. Zéros : x₁ = 1 et x₂ = 3/2. Comme a = 2 > 0, P(x) < 0 entre les racines. S_ℝ = ]1 ; 3/2[.$$),
        'fixation', jsonb_build_object('question', $$L'inéquation −x² − 4x − 4 ≥ 0 a pour discriminant Δ = 0 et zéro double x₀ = −2, avec a = −1 < 0. Quel est l'ensemble des solutions ?$$, 'solution', $$Comme a < 0 et Δ = 0, le polynôme est négatif ou nul partout, avec égalité seulement en x₀ = −2. Donc S_ℝ = {−2}.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations bicarrées et équations/inéquations irrationnelles$$,
        'body', $$Une équation bicarrée est du type ax⁴ + bx² + c = 0 (a ≠ 0) : on pose X = x², on résout aX² + bX + c = 0, puis pour chaque solution X ≥ 0 trouvée on résout x² = X. Pour une équation irrationnelle √P(x) = Q(x), on utilise l'équivalence : Q(x) ≥ 0 et P(x) = Q(x)². Pour une inéquation √P(x) < Q(x) : P(x) ≥ 0, Q(x) ≥ 0 et P(x) < Q(x)². Pour √P(x) ≥ Q(x) : (Q(x) ≥ 0 et P(x) ≥ Q(x)²) ou (P(x) ≥ 0 et Q(x) ≤ 0).$$,
        'highlights', array[$$équation bicarrée : poser X = x², résoudre en X, puis x² = X$$, $$√P(x) = Q(x) ⟺ Q(x)≥0 et P(x)=Q(x)²$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans ℝ l'équation √(x²−1) = x + 2.$$, 'solution', $$Équivaut à x+2 ≥ 0 et x²−1 = (x+2)² = x²+4x+4, soit x = −5/4. Comme −5/4 ∈ [−2;+∞[, S_ℝ = {−5/4}.$$),
        'fixation', jsonb_build_object('question', $$Pour résoudre l'équation bicarrée 2x⁴ − 3x² + 1 = 0, quelle substitution utilise-t-on en premier ?$$, 'solution', $$On pose X = x², ce qui transforme l'équation en 2X² − 3X + 1 = 0.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une visite d'entreprise, les élèves apprennent que le coût de production de q objets est c(q) = 0,1q² + 10q + 1500 (en milliers de F CFA), et que chaque objet est vendu 87 000 F. Un agent affirme que pour un bénéfice supérieur ou égal à 12 832 500 F, il faut produire entre 310 et 460 objets.$$,
      'questions', array[
        $$Exprime le bénéfice en fonction du nombre d'objets q produits.$$,
        $$Détermine, en résolvant une inéquation du second degré, l'intervalle exact des valeurs de q pour lesquelles le bénéfice est supérieur ou égal à 12 832 500 F.$$,
        $$L'agent de l'entreprise a-t-il raison ? Justifie ta réponse en comparant ton résultat à l'intervalle [310 ; 460].$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la formule du discriminant d'un polynôme ax² + bx + c ?$$,
      'hint', $$Elle utilise a, b et c.$$,
      'expected', $$Δ = b² − 4ac.$$
    ),
    jsonb_build_object(
      'question', $$Si Δ < 0 pour un polynôme du second degré, combien de zéros réels admet-il ?$$,
      'hint', $$Aucun nombre réel n'est solution.$$,
      'expected', $$Aucun zéro réel.$$
    ),
    jsonb_build_object(
      'question', $$Quelle substitution permet de résoudre une équation bicarrée ax⁴ + bx² + c = 0 ?$$,
      'hint', $$On remplace x² par une nouvelle inconnue.$$,
      'expected', $$On pose X = x².$$
    ),
    jsonb_build_object(
      'question', $$Résous dans ℝ l'équation x² + x + 2 = 0.$$,
      'hint', $$Calcule d'abord le discriminant.$$,
      'expected', $$Δ = 1 − 8 = −7 < 0, donc l'ensemble des solutions est vide : S_ℝ = ∅.$$
    )
  ),
  now()
);
