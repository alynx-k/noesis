-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2030: "MATHS_1C L9: DERIVATION"
-- (https://lyc.ecole-ci.org/course/view.php?id=2030), resource id 17822.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-derivation',
  '1ere',
  'C',
  'mathematiques',
  $$Dérivation$$,
  9,
  '1ere-c-maths-composees-transformations',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève découvre un triangle ABC rectangle en B, avec AB=8, BC=6, AC=10. À l'intérieur, on construit un rectangle BPMQ avec M∈]AC[, Q∈]AB[, P∈]BC[, et MC=x. En faisant varier M de C à A, il constate que l'aire du rectangle croît puis décroît. Il veut déterminer la valeur de x pour laquelle l'aire est maximale, sans passer par la forme canonique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Nombre dérivé en un point et interprétation graphique$$,
        'body', $$Une fonction f définie sur un intervalle ouvert K contenant x0 est dérivable en x0 si [f(x)−f(x0)]/(x−x0) admet une limite finie en x0 ; cette limite est le nombre dérivé f'(x0). Si f est dérivable en x0, la courbe (Cf) admet en son point d'abscisse x0 une tangente (T) de coefficient directeur f'(x0), d'équation y = f'(x0)(x−x0)+f(x0). Si f est dérivable en x0, alors f est continue en x0 (réciproque fausse : x↦√x est continue en 0 mais non dérivable en 0).$$,
        'highlights', array[$$f'(x0) = lim(x→x0) [f(x)−f(x0)]/(x−x0)$$, $$tangente en x0 : y = f'(x0)(x−x0)+f(x0)$$, $$dérivable en x0 ⟹ continue en x0 (réciproque fausse)$$]::text[],
        'example', jsonb_build_object('statement', $$Montre que f(x)=x²−2 est dérivable en 3, en utilisant la définition.$$, 'solution', $$lim(x→3) [f(x)−f(3)]/(x−3) = lim(x→3) (x²−9)/(x−3) = lim(x→3) (x+3) = 6 ∈ ℝ. Donc f est dérivable en 3 et f'(3)=6.$$),
        'fixation', jsonb_build_object('question', $$f est dérivable en 2, avec f(2)=−4 et f'(2)=−3. Détermine une équation de la tangente à (Cf) au point d'abscisse 2.$$, 'solution', $$y = f'(2)(x−2)+f(2) = −3(x−2)−4 = −3x+2. Donc (T) : y=−3x+2.$$)
      ),
      jsonb_build_object(
        'heading', $$Fonction dérivée et dérivées de référence$$,
        'body', $$f est dérivable sur un intervalle ouvert K si elle est dérivable en chaque point de K ; la fonction f' associe à chaque x de K le nombre dérivé f'(x). Dérivées de référence : (k)'=0 ; (x)'=1 ; (ax+b)'=a ; (xⁿ)'=nxⁿ⁻¹ ; (√x)'=1/(2√x) sur ]0;+∞[ ; (1/x)'=−1/x² sur ℝ* ; (1/xⁿ)'=−n/xⁿ⁺¹ sur ℝ* ; (sin x)'=cos x ; (cos x)'=−sin x ; (tan x)'=1+tan²x=1/cos²x, sur ℝ\{π/2+kπ}.$$,
        'highlights', array[$$(xⁿ)' = nxⁿ⁻¹ ; (√x)' = 1/(2√x) sur ]0;+∞[$$, $$(sin x)' = cos x ; (cos x)' = −sin x ; (tan x)' = 1+tan²x$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine la fonction dérivée de g(x)=x³ sur ℝ, en utilisant la définition.$$, 'solution', $$lim(x→x0) (x³−x0³)/(x−x0) = lim(x→x0) (x²+xx0+x0²) = 3x0². Donc g'(x)=3x².$$),
        'fixation', jsonb_build_object('question', $$Quelle est la dérivée de x↦1/x⁴ sur ℝ* ?$$, 'solution', $$x↦−4/x⁵.$$)
      ),
      jsonb_build_object(
        'heading', $$Dérivées et opérations$$,
        'body', $$Pour u, v dérivables sur K : (u+v)'=u'+v' ; (uv)'=u'v+uv' ; (au)'=au' (a∈ℝ) ; (1/u)'=−u'/u² (u≠0 sur K) ; (u/v)'=(u'v−uv')/v² (v≠0 sur K) ; (cos(ax+b))'=−a sin(ax+b) ; (sin(ax+b))'=a cos(ax+b) ; (√(ax+b))'=a/(2√(ax+b)).$$,
        'highlights', array[$$(uv)' = u'v+uv' ; (u/v)' = (u'v−uv')/v²$$, $$(√(ax+b))' = a/(2√(ax+b))$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine la fonction dérivée de g(x)=x²/(x+5).$$, 'solution', $$g est dérivable sur ℝ\{−5} et g'(x) = [2x(x+5)−x²]/(x+5)² = (x²+10x)/(x+5)².$$),
        'fixation', jsonb_build_object('question', $$Détermine la dérivée de h(x)=√(3x+6).$$, 'solution', $$h est dérivable sur ]−2;+∞[ et h'(x) = 3/(2√(3x+6)).$$)
      ),
      jsonb_build_object(
        'heading', $$Sens de variation et extremums relatifs$$,
        'body', $$Soit f dérivable sur un intervalle ouvert K : f est croissante (resp. décroissante, constante) sur K si et seulement si f' est positive (resp. négative, nulle) sur K ; f est strictement croissante (resp. décroissante) si f' est strictement positive (resp. négative) sur K. Si f' est positive (ou négative) sur K et ne s'annule qu'en un nombre fini de points, f est strictement croissante (ou décroissante) sur K. Si f' s'annule et change de signe en x0, alors f(x0) est un extremum relatif de f.$$,
        'highlights', array[$$f'>0 sur K ⟹ f strictement croissante sur K$$, $$f' s'annule et change de signe en x0 ⟹ f(x0) extremum relatif$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x)=x³−3x. Détermine f'(x) et le sens de variation de f.$$, 'solution', $$f'(x)=3x²−3=3(x+1)(x−1). f'(x)<0 sur ]−1;1[ donc f y est strictement décroissante ; f'(x)>0 sur ]−∞;−1[ et ]1;+∞[ donc f y est strictement croissante.$$),
        'fixation', jsonb_build_object('question', $$La dérivée de g s'annule en 3/2 en changeant de signe (négative avant, positive après), avec g(3/2)=27/4. Que représente cette valeur ?$$, 'solution', $$27/4 est un minimum relatif de g.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Monsieur Moussa, menuisier, veut confectionner une caisse en bois en forme de pavé droit, de volume 8 m³, dont la base est un carré de côté x. Il veut connaître les dimensions (côté de la base et hauteur) qui minimisent la quantité de bois utilisée, donc l'aire totale de la surface de la caisse.$$,
      'questions', array[
        $$Exprime la hauteur h de la caisse en fonction de x, sachant que le volume vaut 8 m³, puis exprime l'aire totale f(x) de la surface de la caisse (2 faces carrées + 4 faces rectangulaires) en fonction de x.$$,
        $$Calcule f'(x) pour x>0, factorise-la sous la forme (4/x²)(x³−8), et étudie son signe sur ]0;+∞[.$$,
        $$Déduis-en les dimensions (côté de la base et hauteur) qui minimisent la quantité de bois utilisée.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition du nombre dérivé f'(x0) ?$$,
      'hint', $$C'est une limite d'un taux d'accroissement.$$,
      'expected', $$f'(x0) = lim(x→x0) [f(x)−f(x0)]/(x−x0), lorsque cette limite est finie.$$
    ),
    jsonb_build_object(
      'question', $$Une fonction dérivable en x0 est-elle nécessairement continue en x0 ? Et l'inverse est-il vrai ?$$,
      'hint', $$L'implication n'est vraie que dans un sens.$$,
      'expected', $$Oui, dérivable en x0 implique continue en x0, mais la réciproque est fausse (ex : x↦√x est continue en 0 mais non dérivable en 0).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule de dérivation d'un quotient u/v ?$$,
      'hint', $$Elle fait intervenir u', v, u et v'.$$,
      'expected', $$(u/v)' = (u'v−uv')/v², pour v≠0 sur K.$$
    ),
    jsonb_build_object(
      'question', $$Que peut-on conclure si f' s'annule et change de signe en x0 ?$$,
      'hint', $$C'est une conséquence directe sur la fonction f elle-même.$$,
      'expected', $$f(x0) est un extremum relatif de f.$$
    )
  ),
  now()
);
