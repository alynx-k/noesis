-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2032: "MATHS_1C L11: ETUDE ET REPRESENTATION GRAPHIQUE
-- D'UNE FONCTION" (https://lyc.ecole-ci.org/course/view.php?id=2032),
-- resource id 17846. Contenu mathématique factuel (définitions, théorèmes,
-- formules, exercices), non soumis au droit d'auteur ; reformulé pour la
-- structure CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-etude-representation-graphique-fonction',
  '1ere',
  'C',
  'mathematiques',
  $$Étude et représentation graphique d'une fonction$$,
  11,
  '1ere-c-maths-probabilite',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une entreprise fabrique des jus de fruits, en quantité ne pouvant excéder 100 par jour. Chaque jus est vendu à 100 F CFA et tous les jus fabriqués sont vendus. Le coût unitaire de production journalière par jus vérifie V(x) = x²−130x+4225, où x est la quantité produite. On veut déterminer la quantité exacte de jus à fabriquer pour un profit maximal.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Fonction paire, fonction impaire$$,
        'body', $$f est paire si pour tout x de Df, −x∈Df et f(−x)=f(x) ; f est paire si et seulement si la droite (OJ) est axe de symétrie de (Cf). f est impaire si pour tout x de Df, −x∈Df et f(−x)=−f(x) ; f est impaire si et seulement si le point O est centre de symétrie de (Cf). Un ensemble E est symétrique par rapport à 0 si pour tout x de E, −x∈E. Si f est paire ou impaire, il suffit de l'étudier sur Df∩[0;+∞[, puis de compléter par symétrie (axiale pour paire, centrale pour impaire).$$,
        'highlights', array[$$f paire ⟺ f(−x)=f(x) ⟺ (OJ) axe de symétrie de (Cf)$$, $$f impaire ⟺ f(−x)=−f(x) ⟺ O centre de symétrie de (Cf)$$]::text[],
        'example', jsonb_build_object('statement', $$Étudie la parité de f(x) = x³/(x²−1).$$, 'solution', $$Df=ℝ\{−1;1}, symétrique par rapport à 0. f(−x) = (−x)³/((−x)²−1) = −x³/(x²−1) = −f(x). Donc f est impaire.$$),
        'fixation', jsonb_build_object('question', $$f(x) = x²+4x−8, définie sur ℝ. f est-elle paire, impaire, ou ni l'un ni l'autre ?$$, 'solution', $$f(−x) = x²−4x−8. Comme f(−x)≠f(x) et f(−x)≠−f(x), f n'est ni paire ni impaire.$$)
      ),
      jsonb_build_object(
        'heading', $$Axe de symétrie et centre de symétrie$$,
        'body', $$La droite (D) d'équation x=a est axe de symétrie de (Cf) si et seulement si pour tout x de Df, (2a−x)∈Df et f(2a−x)=f(x) — équivalent à f(a+h)=f(a−h) pour tout h. Le point A(a,b) est centre de symétrie de (Cf) si et seulement si pour tout x de Df, (2a−x)∈Df et f(2a−x)+f(x)=2b — équivalent à [f(a+h)+f(a−h)]/2=b pour tout h.$$,
        'highlights', array[$$x=a axe de symétrie ⟺ f(2a−x)=f(x) pour tout x de Df$$, $$A(a,b) centre de symétrie ⟺ f(2a−x)+f(x)=2b pour tout x de Df$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x)=x²−4x+7. Démontre que la droite x=2 est axe de symétrie de (Cf).$$, 'solution', $$On pose g(x)=f(x+2)=(x+2)²−4(x+2)+7=x²+3. g(−x)=x²+3=g(x), donc g est paire, donc x=2 est axe de symétrie de (Cf).$$),
        'fixation', jsonb_build_object('question', $$Soit g(x)=(x−2)³+3. Quel est le centre de symétrie de sa courbe ?$$, 'solution', $$Le point A(2;3).$$)
      ),
      jsonb_build_object(
        'heading', $$Fonction périodique$$,
        'body', $$f est périodique de période T (T>0) si pour tout x de Df, x+T∈Df, x−T∈Df et f(x+T)=f(x). Les fonctions sin et cos sont 2π-périodiques ; tan est π-périodique. Si T est une période de f, alors f(x+kT)=f(x) pour tout k∈ℤ\{0}. Si f est périodique de période T, il suffit de l'étudier sur Df∩[a;a+T[, la courbe étant ensuite complétée par les translations de vecteurs T·OI⃗ et −T·OI⃗.$$,
        'highlights', array[$$f(x+T) = f(x) pour tout x de Df ; sin, cos : période 2π ; tan : période π$$, $$courbe complétée par translations de vecteurs ±T·OI⃗$$]::text[],
        'example', jsonb_build_object('statement', $$Démontre que f(x)=sin(2x) est périodique de période π.$$, 'solution', $$Df=ℝ. sin(2(x+π)) = sin(2x+2π) = sin(2x) car sin est 2π-périodique. Donc f(x+π)=f(x) : f est π-périodique.$$),
        'fixation', jsonb_build_object('question', $$Sachant que f est périodique de période 2π/3, que peut-on dire de f(x+4π/3) ?$$, 'solution', $$f(x+4π/3) = f(x), car 4π/3 = 2×(2π/3), un multiple entier de la période.$$)
      ),
      jsonb_build_object(
        'heading', $$Asymptote oblique$$,
        'body', $$Soit a et b des réels avec a≠0. Lorsque lim(x→+∞)[f(x)−(ax+b)]=0 (resp. en −∞), la droite d'équation y=ax+b est asymptote oblique à (Cf) en +∞ (resp. en −∞). En pratique, on effectue souvent une division euclidienne pour écrire f(x)=ax+b+c/(x−d), puis on vérifie que c/(x−d) tend vers 0.$$,
        'highlights', array[$$y=ax+b asymptote oblique en +∞ ⟺ lim(x→+∞)[f(x)−(ax+b)]=0$$, $$division euclidienne : f(x)=ax+b+c/(x−d), avec c/(x−d)→0$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x)=(2x²+3x−1)/(x−1). Démontre que y=2x+5 est asymptote à (Cf).$$, 'solution', $$La division euclidienne donne f(x)=2x+5+4/(x−1). f(x)−(2x+5)=4/(x−1), et lim(x→±∞) 4/(x−1)=0. Donc y=2x+5 est asymptote à (Cf) en +∞ et en −∞.$$),
        'fixation', jsonb_build_object('question', $$Pour étudier la position d'une courbe (Cf) par rapport à son asymptote oblique y=ax+b, que doit-on étudier ?$$, 'solution', $$Le signe de f(x)−(ax+b) sur l'ensemble de définition.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une entreprise fabrique et vend chaque jour un nombre x d'ampoules économiques, vendues 100 F CFA chacune. Le coût de production de x ampoules est U(x) = x−10+900/x, pour x∈[10;100]. Le directeur veut déterminer le nombre d'ampoules à fabriquer pour minimiser le coût de production.$$,
      'questions', array[
        $$Calcule U'(x) pour x∈[10;100], et factorise-la sous la forme (x−30)(x+30)/x².$$,
        $$Étudie le signe de U'(x) sur [10;100] (en tenant compte du signe de x²−900), puis dresse le tableau de variation de U.$$,
        $$Déduis-en le nombre d'ampoules à fabriquer pour minimiser le coût de production, et la valeur de ce coût minimal.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle propriété graphique caractérise une fonction paire ?$$,
      'hint', $$Elle concerne un axe particulier du repère.$$,
      'expected', $$Sa courbe (Cf) admet la droite (OJ) (l'axe des ordonnées) comme axe de symétrie.$$
    ),
    jsonb_build_object(
      'question', $$Comment démontre-t-on que la droite x=a est un axe de symétrie de la courbe de f ?$$,
      'hint', $$On peut poser une nouvelle fonction g(x)=f(x+a) et étudier sa parité.$$,
      'expected', $$On vérifie que pour tout x de Df, (2a−x)∈Df et f(2a−x)=f(x) (ou, en posant g(x)=f(x+a), on montre que g est paire).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la condition pour que la droite y=ax+b soit asymptote oblique à (Cf) en +∞ ?$$,
      'hint', $$C'est une limite qui doit être nulle.$$,
      'expected', $$lim(x→+∞) [f(x)−(ax+b)] = 0.$$
    ),
    jsonb_build_object(
      'question', $$Les fonctions sinus et cosinus sont-elles périodiques ? De quelle période ?$$,
      'hint', $$C'est une propriété classique des fonctions trigonométriques.$$,
      'expected', $$Oui, elles sont périodiques de période 2π.$$
    )
  ),
  now()
);
