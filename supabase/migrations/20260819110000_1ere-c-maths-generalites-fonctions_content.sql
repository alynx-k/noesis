-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2024: "MATHS_1C L3: GÉNÉRALITÉS SUR LES FONCTIONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=2024), resource id 17750.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-generalites-fonctions',
  '1ere',
  'C',
  'mathematiques',
  $$Généralités sur les fonctions$$,
  3,
  '1ere-c-maths-barycentre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une PME emploie 6 personnes : le directeur (200 000 F), le comptable (150 000 F) et 4 employés (70 000 F chacun). Le propriétaire veut embaucher de nouveaux employés à 70 000 F chacun, sachant que le salaire moyen de tous les employés doit rester supérieur à 80 000 F. Il veut savoir combien de personnes il peut embaucher.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Applications injectives, surjectives, bijectives$$,
        'body', $$Une application f de E vers F est injective si tout élément de F admet au plus un antécédent (équivalent : f(a)=f(b) ⟹ a=b). Elle est surjective si tout élément de F admet au moins un antécédent (pour tout b∈F, l'équation f(x)=b a au moins une solution). Elle est bijective si tout élément de F admet un unique antécédent — c'est-à-dire si elle est à la fois injective et surjective.$$,
        'highlights', array[$$injective : au plus un antécédent (f(a)=f(b) ⟹ a=b)$$, $$surjective : au moins un antécédent$$, $$bijective = injective + surjective$$]::text[],
        'example', jsonb_build_object('statement', $$Justifie que f: ]−∞;0] → [0;+∞[, f(x)=x² est bijective.$$, 'solution', $$Pour y∈[0;+∞[, f(x)=y ⟺ x²=y ⟺ x=−√y ou x=√y ; comme x≤0, seul x=−√y convient. Tout y admet un unique antécédent, donc f est bijective.$$),
        'fixation', jsonb_build_object('question', $$Comment démontre-t-on qu'une application f de E vers F est injective ?$$, 'solution', $$En justifiant que pour tous a, b de E, f(a)=f(b) entraîne a=b (ou que pour tout b de F, l'équation f(x)=b admet au plus une solution).$$)
      ),
      jsonb_build_object(
        'heading', $$Bijection réciproque$$,
        'body', $$Si f est une bijection de E vers F, sa bijection réciproque f⁻¹ est l'application de F vers E qui à tout élément de F associe son unique antécédent par f. On a f⁻¹∘f = idE et f∘f⁻¹ = idF. Dans un repère orthonormé, les courbes de f et f⁻¹ sont symétriques par rapport à la droite d'équation y = x (première bissectrice).$$,
        'highlights', array[$$f⁻¹∘f = idE et f∘f⁻¹ = idF$$, $$(Cf) et (Cf⁻¹) symétriques par rapport à y = x$$]::text[],
        'example', jsonb_build_object('statement', $$f: ℝ⁺→ℝ⁺, f(x)=√x est bijective. Détermine f⁻¹.$$, 'solution', $$Pour b≥0, f(x)=b ⟺ √x=b ⟺ x=b². Donc f⁻¹: ℝ⁺→ℝ⁺, f⁻¹(x)=x².$$),
        'fixation', jsonb_build_object('question', $$Quelle est la relation entre les représentations graphiques d'une bijection et de sa réciproque ?$$, 'solution', $$Elles sont symétriques par rapport à la droite d'équation y = x, dans un repère orthonormé.$$)
      ),
      jsonb_build_object(
        'heading', $$Opérations, comparaison et composition de fonctions$$,
        'body', $$Pour f et g de ℝ vers ℝ : D(f+g) = D(fg) = Df∩Dg ; D(f/g) = Df∩Dg∩{x: g(x)≠0}. f ≤ g sur I si pour tout x de I, f(x)≤g(x) (méthode : étudier le signe de f(x)−g(x)). La composée g∘f est définie par g∘f(x) = g[f(x)], avec x∈D(g∘f) ⟺ x∈Df et f(x)∈Dg.$$,
        'highlights', array[$$D(f+g) = D(fg) = Df∩Dg$$, $$f≤g sur I ⟺ f(x)−g(x)≤0 sur I$$, $$x∈D(g∘f) ⟺ x∈Df et f(x)∈Dg$$]::text[],
        'example', jsonb_build_object('statement', $$Justifie que pour tout réel x, x²+1 ≥ 2x.$$, 'solution', $$x²+1−2x = (x−1)² ≥ 0 pour tout x, donc x²+1 ≥ 2x.$$),
        'fixation', jsonb_build_object('question', $$Comment détermine-t-on l'ensemble de définition de g∘f ?$$, 'solution', $$C'est l'ensemble des x tels que x appartient à Df et f(x) appartient à Dg.$$)
      ),
      jsonb_build_object(
        'heading', $$Représentations graphiques de fonctions associées$$,
        'body', $$Dans un repère (O,I,J), avec (Cf) la courbe de f : la courbe de x↦f(x−a) est l'image de (Cf) par la translation de vecteur a·OI⃗ ; celle de x↦f(x)+b est l'image par la translation de vecteur b·OJ⃗ ; celle de x↦f(x−a)+b combine les deux translations ; celle de x↦f(−x) est l'image de (Cf) par la symétrie d'axe (OJ) ; celle de x↦−f(x) par la symétrie d'axe (OI) ; celle de x↦−f(−x) par la symétrie centrale de centre O.$$,
        'highlights', array[$$f(x−a) : translation a·OI⃗$$, $$f(x)+b : translation b·OJ⃗$$, $$f(−x) : symétrie d'axe (OJ) ; −f(x) : symétrie d'axe (OI) ; −f(−x) : symétrie de centre O$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle transformation relie les courbes de f(x) et de −f(−x) ?$$, 'solution', $$La symétrie centrale de centre O.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un père cède une parcelle à ses deux enfants, séparée en deux parts égales par une piste (AB) identifiée à la première bissectrice, les contours du lac s'apparentant à la courbe de la fonction inverse f(x) = 1/x. Le plus jeune fils pense être lésé.$$,
      'questions', array[
        $$Montre que la restriction g de f à ℝ\{0} vers ℝ\{0} est une application bijective (calcule g∘g).$$,
        $$Déduis-en que g est sa propre bijection réciproque (g⁻¹ = g).$$,
        $$Explique pourquoi la symétrie de (Cg) par rapport à la droite (AB) [y=x] permet de rassurer le jeune fils sur l'égalité des surfaces.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une application injective ?$$,
      'hint', $$Elle concerne le nombre d'antécédents.$$,
      'expected', $$Une application où tout élément de l'ensemble d'arrivée admet au plus un antécédent.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une application bijective ?$$,
      'hint', $$Elle combine deux propriétés.$$,
      'expected', $$Une application à la fois injective et surjective : tout élément de l'ensemble d'arrivée admet un unique antécédent.$$
    ),
    jsonb_build_object(
      'question', $$Comment obtient-on la courbe de x↦f(x)+b à partir de celle de f ?$$,
      'hint', $$C'est une translation.$$,
      'expected', $$Par la translation de vecteur b·OJ⃗ (translation verticale de b unités).$$
    ),
    jsonb_build_object(
      'question', $$Que vaut f⁻¹∘f pour une bijection f de E vers F ?$$,
      'hint', $$C'est une application particulière de E.$$,
      'expected', $$L'application identique de E (idE).$$
    )
  ),
  now()
);
