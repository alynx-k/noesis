-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 868: "MATHS_1A L4: DERIVABILITE ET ETUDE DE FONCTIONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=868), resource id 4065.
-- Contenu réécrit à partir du PDF source (tangente, nombre dérivé,
-- fonction dérivée, dérivées de référence, opérations sur les dérivées,
-- équation de la tangente, sens de variation, extremum relatif).
-- Propriétés/formules reprises telles quelles ; explications, exemples et
-- situation d'apprentissage/complexe (fonction bénéfice) reformulés avec
-- un autre contexte et d'autres valeurs numériques que la source. Aucune
-- phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-derivabilite-etude-fonctions',
  '1ere',
  'A',
  'mathematiques',
  $$Dérivabilité et étude de fonctions$$,
  4,
  '1ere-a-maths-generalites-fonctions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un artisan fabrique et vend des tabourets en bois. Sa capacité de production journalière est comprise entre 0 et 20 tabourets, et toute la production est vendue. Une étude a montré que son bénéfice journalier, en milliers de francs CFA, pour la production et la vente de x tabourets, est modélisé sur [0;20] par P(x)=−3x²+90x−200. L'artisan veut savoir combien de tabourets produire par jour, à l'unité près, pour maximiser son bénéfice. Sa fille, élève en 1ère A, décide de l'aider avec ses connaissances en mathématiques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Tangente et nombre dérivé$$,
        'body', $$Quand un point M se déplace sur une courbe (Cf) et se rapproche d'un point fixe A, la sécante (AM) tend vers une position limite appelée tangente en A à (Cf). Une fonction f, définie sur un intervalle ouvert I, est dérivable en a∈I lorsque sa courbe admet en a une tangente non parallèle à l'axe des ordonnées ; le nombre dérivé f'(a) est alors le coefficient directeur de cette tangente.$$,
        'highlights', array[$$tangente$$, $$nombre dérivé f'(a)$$, $$coefficient directeur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$f'(a) est le coefficient directeur de la tangente à (Cf) au point d'abscisse a, quand cette tangente existe et n'est pas verticale.$$),
        'fixation', jsonb_build_object('question', $$Si la courbe d'une fonction f admet au point A(2;5) une tangente de coefficient directeur −4, que peut-on en déduire ?$$, 'solution', $$f est dérivable en 2 et f'(2)=−4.$$)
      ),
      jsonb_build_object(
        'heading', $$Fonction dérivée et dérivées de référence$$,
        'body', $$Si f est dérivable en tout point d'un intervalle I, la fonction qui à x associe f'(x) est la fonction dérivée de f, notée f'. Les dérivées des fonctions usuelles sont à connaître : la dérivée de x↦k (constante) est 0 ; celle de x↦x est 1 ; celle de x↦ax+b est a ; celle de x↦x² est 2x ; celle de x↦x³ est 3x² ; celle de x↦1/x est −1/x² (sur ]−∞;0[ ou ]0;+∞[).$$,
        'highlights', array[$$(x²)' = 2x$$, $$(x³)' = 3x²$$, $$(1/x)' = −1/x²$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fonction$$, $$Dérivée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$x ↦ k$$, $$x ↦ 0$$),
            jsonb_build_array($$x ↦ ax+b$$, $$x ↦ a$$),
            jsonb_build_array($$x ↦ x²$$, $$x ↦ 2x$$),
            jsonb_build_array($$x ↦ x³$$, $$x ↦ 3x²$$),
            jsonb_build_array($$x ↦ 1/x$$, $$x ↦ −1/x²$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Calcule la dérivée de f(x)=5x²−7 sur ℝ.$$, 'solution', $$f'(x)=5×2x−0=10x.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la dérivée de la fonction constante x↦8 ?$$, 'solution', $$La fonction nulle : x↦0.$$)
      ),
      jsonb_build_object(
        'heading', $$Opérations sur les dérivées et équation de la tangente$$,
        'body', $$Pour u et v dérivables sur un intervalle I : (u+v)'=u'+v' ; (uv)'=u'v+uv' ; (ku)'=ku' (k réel) ; (u/v)'=(u'v−uv')/v² là où v≠0. Une équation de la tangente à (Cf) au point d'abscisse a (quand f est dérivable en a) est : y=f'(a)(x−a)+f(a). Lorsque f'(a)=0, la tangente est horizontale.$$,
        'highlights', array[$$(uv)' = u'v + uv'$$, $$y = f'(a)(x−a) + f(a)$$, $$tangente horizontale : f'(a)=0$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x)=x³−4 sur ℝ. Détermine une équation de la tangente à (Cf) au point d'abscisse 1.$$, 'solution', $$f'(x)=3x², donc f'(1)=3, et f(1)=−3. L'équation est y=3(x−1)−3=3x−6.$$),
        'fixation', jsonb_build_object('question', $$Que peut-on dire de la tangente à (Cf) au point d'abscisse a lorsque f'(a)=0 ?$$, 'solution', $$Elle est horizontale, c'est-à-dire parallèle à l'axe des abscisses.$$)
      ),
      jsonb_build_object(
        'heading', $$Sens de variation et extremum relatif$$,
        'body', $$Soit f dérivable sur un intervalle ouvert I : si f'(x)≥0 pour tout x de I, f est croissante sur I ; si f'(x)≤0, f est décroissante ; si f'(x)=0, f est constante. Si f' s'annule en x0 en changeant de signe, f admet un extremum relatif en x0 (un maximum si f' passe de + à −, un minimum si f' passe de − à +). On étudie le signe de f' pour dresser le tableau de variation de f.$$,
        'highlights', array[$$f'≥0 : croissante$$, $$f'≤0 : décroissante$$, $$f' change de signe : extremum relatif$$]::text[],
        'example', jsonb_build_object('statement', $$Soit g(x)=x²−6x+2 sur ℝ. Étudie le signe de g' et le sens de variation de g.$$, 'solution', $$g'(x)=2x−6, qui s'annule en x=3 : négative avant 3, positive après. g est donc décroissante sur ]−∞;3] et croissante sur [3;+∞[, avec un minimum relatif en 3.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on qu'une fonction admet un extremum relatif en un point x0 à partir du signe de sa dérivée ?$$, 'solution', $$La dérivée s'annule en x0 et change de signe de part et d'autre de x0.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$L'artisan veut connaître le nombre de tabourets à produire par jour, à l'unité près, pour maximiser son bénéfice journalier P(x)=−3x²+90x−200 sur l'intervalle [0;20].$$,
      'questions', array[
        $$Calcule la dérivée P'(x) de la fonction bénéfice.$$,
        $$Étudie le signe de P'(x) sur [0;20] et dresse le tableau de variation de P.$$,
        $$Combien de tabourets l'artisan doit-il produire par jour pour maximiser son bénéfice, et quel est ce bénéfice maximal ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule la dérivée de f(x)=4x³ sur ℝ.$$,
      'hint', $$Utilise (x³)'=3x², puis multiplie par le coefficient.$$,
      'expected', $$f'(x)=4×3x²=12x².$$
    ),
    jsonb_build_object(
      'question', $$Soit f(x)=x²+1. Détermine une équation de la tangente à (Cf) au point d'abscisse 0.$$,
      'hint', $$Calcule f'(0) et f(0), puis utilise y=f'(a)(x−a)+f(a).$$,
      'expected', $$f'(x)=2x donc f'(0)=0, et f(0)=1. La tangente est horizontale : y=1.$$
    ),
    jsonb_build_object(
      'question', $$Une fonction f a pour dérivée f'(x)=−2 sur ℝ. Quel est le sens de variation de f ?$$,
      'hint', $$Regarde le signe constant de f'.$$,
      'expected', $$f'(x)<0 pour tout x, donc f est décroissante sur ℝ.$$
    ),
    jsonb_build_object(
      'question', $$La dérivée d'une fonction g s'annule en x=2 en passant du positif au négatif. Que peut-on en conclure ?$$,
      'hint', $$Positif avant, négatif après : la fonction monte puis descend.$$,
      'expected', $$g admet un maximum relatif en x=2.$$
    )
  ),
  now()
);
