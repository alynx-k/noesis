-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2036: "MATHS_1C L15: SUITES NUMERIQUES"
-- (https://lyc.ecole-ci.org/course/view.php?id=2036), resource id 17894.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
-- NOTE : la leçon 14 "Géométrie analytique du plan" (Moodle course id=2035,
-- resource id=17882) n'a pas été migrée : le PDF hébergé sur la plateforme
-- source est en réalité une leçon de Terminale C sur les nombres complexes
-- (mal indexée), non conforme au programme de 1ère C. Lacune structurelle
-- de la plateforme source, à traiter séparément.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-suites-numeriques',
  '1ere',
  'C',
  'mathematiques',
  $$Suites numériques$$,
  15,
  '1ere-c-maths-systemes-equations-lineaires',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une coopérative scolaire veut monter un projet de construction de ferme. Le président encourage ses 45 membres à cotiser 1000 F par mois pendant 9 mois. Au bout de la première année, il compte déposer cet argent dans une banque qui accorde un intérêt de 5% chaque année. Le budget du projet s'élève à 623 000 F. Le président veut savoir si, en 4 ans, grâce aux intérêts bancaires, la coopérative pourra réunir ce montant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Généralités sur les suites$$,
        'body', $$Une suite numérique est une fonction de ℕ vers ℝ, notée (Un), où Un est le terme d'indice n. Une suite peut être définie par une formule explicite Un=f(n) (calcul direct à partir de n), ou par une formule de récurrence : donnée d'un premier terme et d'une relation Un+1=f(Un) (chaque terme se calcule à partir du précédent).$$,
        'highlights', array[$$suite = fonction de ℕ vers ℝ, notée (Un)$$, $$formule explicite : Un=f(n) ; formule de récurrence : U0 donné + Un+1=f(Un)$$]::text[],
        'example', jsonb_build_object('statement', $$Soit (Vn) définie par V0=7 et Vn+1=2Vn−5. Calcule V1, V2, V3, V4.$$, 'solution', $$V1=2×7−5=9 ; V2=2×9−5=13... en recalculant : V2=2V1−5=13, V3=2V2−5=21, V4=2V3−5=37. (Chaque terme se déduit du précédent par la relation de récurrence.)$$),
        'fixation', jsonb_build_object('question', $$Une suite (Un) est définie par Un=3n+5. Est-ce une formule explicite ou de récurrence ?$$, 'solution', $$C'est une formule explicite : Un se calcule directement à partir de n, sans passer par les termes précédents.$$)
      ),
      jsonb_build_object(
        'heading', $$Suites arithmétiques$$,
        'body', $$(Un) est arithmétique s'il existe un réel r (la raison) tel que pour tout n, Un+1=Un+r. Terme général : Un=Uk+(n−k)r, en particulier Un=U0+nr. Somme de n termes consécutifs : elle vaut n fois la demi-somme des termes extrêmes. Si S=U1+...+Un, alors S=n×(U1+Un)/2 ; plus généralement, pour Uk+...+Uj, S=(j−k+1)×(Uk+Uj)/2.$$,
        'highlights', array[$$Un+1 = Un + r (raison r) ; Un = U0 + nr$$, $$somme de termes consécutifs = (nombre de termes) × demi-somme des termes extrêmes$$]::text[],
        'example', jsonb_build_object('statement', $$Soit (Un) arithmétique de raison 9 et U0=−2. Calcule T=U3+U4+...+U77.$$, 'solution', $$De 3 à 77, il y a 77−3+1=75 termes. T=(75/2)(U3+U77). U3=−2+3×9=25, U77=−2+77×9=691. T=(75/2)(25+691)=26850.$$),
        'fixation', jsonb_build_object('question', $$(Un) est arithmétique de raison −4 et U0=5. Exprime Un en fonction de n.$$, 'solution', $$Un = U0 + n×(−4) = 5 − 4n.$$)
      ),
      jsonb_build_object(
        'heading', $$Suites géométriques$$,
        'body', $$(Un) est géométrique s'il existe un réel q (la raison) tel que pour tout n, Un+1=q·Un. Terme général : Un=q^(n−k)·Uk, en particulier Un=q^n·U0. Somme de n termes consécutifs, si q≠1 : S=U1+...+Un=U1×(1−q^n)/(1−q) ; si q=1, S=n×U1. De façon générale, Uk+...+Uk+p = Uk×(1−q^(p+1))/(1−q) si q≠1.$$,
        'highlights', array[$$Un+1 = q·Un (raison q) ; Un = q^n·U0$$, $$somme (q≠1) : S = U1×(1−q^n)/(1−q)$$]::text[],
        'example', jsonb_build_object('statement', $$Soit (Vn) définie par Vn=(1/3)^n. Calcule T=1/3+1/3²+...+1/3⁷.$$, 'solution', $$T=V1+...+V7 = (1/3)×[1−(1/3)⁷]/[1−1/3] = (1/2)×[1−(1/3)⁷] = 1093/2187.$$),
        'fixation', jsonb_build_object('question', $$(Vn) est géométrique de raison 3 et V1=3. Exprime Vn en fonction de n (n≥1).$$, 'solution', $$Vn = V1×3^(n−1) = 3×3^(n−1) = 3^n.$$)
      ),
      jsonb_build_object(
        'heading', $$Représentation graphique d'une suite$$,
        'body', $$Pour une suite Un=f(n) : on trace la courbe (Cf) et on lit graphiquement U0=f(0), U1=f(1), U2=f(2), etc. Pour une suite définie par récurrence Un+1=f(Un) : on trace (Cf) et la droite (Δ) d'équation y=x ; on place U0 sur l'axe des abscisses, on projette verticalement sur (Cf), puis horizontalement sur (Δ), puis à nouveau verticalement sur l'axe des abscisses pour obtenir U1, et on répète le processus (méthode de l'escalier).$$,
        'highlights', array[$$suite explicite : lecture directe sur (Cf) en n=0,1,2,...$$, $$suite récurrente : construction en escalier via (Cf) et la droite y=x$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans la construction graphique d'une suite récurrente Un+1=f(Un), quel rôle joue la droite d'équation y=x ?$$, 'solution', $$Elle permet de reporter la valeur de Un obtenue en ordonnée vers l'axe des abscisses, pour pouvoir ensuite calculer graphiquement Un+1=f(Un).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Depuis 2010, la production annuelle d'un article de l'usine O.B.V baisse d'environ 3% chaque année par rapport à l'année précédente. En 2010, la production était de 65 000 articles. Une étude de marché montre que la production n'est plus rentable dès qu'elle devient inférieure à 56 000 articles. On veut savoir à partir de quelle année la production ne sera plus rentable.$$,
      'questions', array[
        $$Justifie que la suite (Un) des productions annuelles est géométrique de raison q=97/100 et de premier terme U0=65000, puis exprime Un en fonction de n.$$,
        $$Calcule les productions U1, U2, U3, U4 et U5 (arrondies à l'unité), correspondant aux années 2011 à 2015.$$,
        $$Détermine à partir de quelle année la production devient inférieure à 56 000 articles, et conclus.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition d'une suite arithmétique ?$$,
      'hint', $$Elle fait intervenir une relation entre deux termes consécutifs et un réel constant.$$,
      'expected', $$Une suite (Un) telle qu'il existe un réel r vérifiant Un+1=Un+r pour tout n ; r est appelé la raison.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule du terme général d'une suite géométrique de raison q et de premier terme U0 ?$$,
      'hint', $$Elle fait intervenir une puissance de q.$$,
      'expected', $$Un = q^n × U0.$$
    ),
    jsonb_build_object(
      'question', $$Comment calcule-t-on la somme de n termes consécutifs d'une suite arithmétique ?$$,
      'hint', $$C'est un produit avec une demi-somme.$$,
      'expected', $$C'est le produit du nombre de termes par la demi-somme des termes extrêmes.$$
    ),
    jsonb_build_object(
      'question', $$Soit (Un) définie par Un=−5n+n². Calcule U0, U1 et U2.$$,
      'hint', $$Remplace n successivement par 0, 1, 2.$$,
      'expected', $$U0=0, U1=−5+1=−4, U2=−10+4=−6.$$
    )
  ),
  now()
);
