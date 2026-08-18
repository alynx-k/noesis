-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 867: "MATHS_1A L3: GENERALITES SUR LES FONCTIONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=867), resource id 4053.
-- Contenu réécrit à partir du PDF source (fonctions paires/impaires, axe de
-- symétrie, centre de symétrie). Propriétés/formules reprises telles
-- quelles ; explications, exemples et situation d'apprentissage/complexe
-- reformulés avec d'autres fonctions/valeurs que la source. Les exercices
-- s'appuyant sur des figures graphiques du PDF ont été remplacés par des
-- exercices équivalents formulés en termes d'expressions ou de tableaux de
-- valeurs. Aucune phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-generalites-fonctions',
  '1ere',
  'A',
  'mathematiques',
  $$Généralités sur les fonctions$$,
  3,
  '1ere-a-maths-denombrement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une expérience de physique, un capteur enregistre la position d'une bille qui oscille sur un rail et affiche sa trajectoire à l'écran. Le professeur affirme qu'en connaissant les propriétés d'une fonction impaire, on peut reconstituer toute la trajectoire à partir de sa seule moitié. Intrigués, les élèves veulent comprendre les notions de parité et de symétrie d'une fonction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Fonction paire$$,
        'body', $$Soit f une fonction numérique d'ensemble de définition Df. f est une fonction paire lorsque, pour tout x∈Df, on a −x∈Df et f(−x)=f(x). Une fonction est paire si et seulement si l'axe des ordonnées (OJ) est un axe de symétrie de sa courbe représentative.$$,
        'highlights', array[$$f(−x) = f(x)$$, $$axe des ordonnées = axe de symétrie$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$f est paire ⟺ pour tout x∈Df, −x∈Df et f(−x)=f(x).$$),
        'example', jsonb_build_object('statement', $$Montre que la fonction f définie sur ℝ par f(x)=3x²−5 est paire.$$, 'solution', $$Df=ℝ (fonction polynôme), donc pour tout x, −x∈Df. f(−x)=3(−x)²−5=3x²−5=f(x). Donc f est paire.$$),
        'fixation', jsonb_build_object('question', $$Que représente géométriquement le fait qu'une fonction soit paire ?$$, 'solution', $$Sa courbe représentative admet l'axe des ordonnées (OJ) comme axe de symétrie.$$)
      ),
      jsonb_build_object(
        'heading', $$Fonction impaire$$,
        'body', $$f est une fonction impaire lorsque, pour tout x∈Df, on a −x∈Df et f(−x)=−f(x). Une fonction est impaire si et seulement si l'origine O du repère est un centre de symétrie de sa courbe représentative. Il existe aussi des fonctions qui ne sont ni paires ni impaires : après avoir calculé f(−x), on conclut selon que f(−x)=f(x), f(−x)=−f(x), ou aucun des deux cas.$$,
        'highlights', array[$$f(−x) = −f(x)$$, $$origine = centre de symétrie$$, $$ni paire ni impaire$$]::text[],
        'example', jsonb_build_object('statement', $$Montre que f définie sur ℝ par f(x)=x³−4x est impaire.$$, 'solution', $$Df=ℝ. f(−x)=(−x)³−4(−x)=−x³+4x=−(x³−4x)=−f(x). Donc f est impaire.$$),
        'fixation', jsonb_build_object('question', $$Soit f(x)=x²+x. Calcule f(1) et f(−1), puis conclus sur sa parité.$$, 'solution', $$f(1)=2 et f(−1)=0. Comme f(1)≠f(−1) et f(1)≠−f(−1)=0, f n'est ni paire ni impaire.$$)
      ),
      jsonb_build_object(
        'heading', $$Axe de symétrie d'une courbe$$,
        'body', $$Soit f une fonction de courbe représentative (Cf) et la droite (Δ) d'équation x=a. (Δ) est un axe de symétrie de (Cf) si et seulement si, pour tout h∈ℝ tel que (a+h)∈Df, on a (a−h)∈Df et f(a+h)=f(a−h). Ce résultat généralise la propriété des fonctions paires (cas particulier a=0).$$,
        'highlights', array[$$f(a+h) = f(a−h)$$]::text[],
        'example', jsonb_build_object('statement', $$Justifie que la droite d'équation x=3 est un axe de symétrie de (Cf) où f(x)=(x−3)²+2.$$, 'solution', $$Df=ℝ. f(3+h)=(3+h−3)²+2=h²+2 et f(3−h)=(3−h−3)²+2=(−h)²+2=h²+2. Donc f(3+h)=f(3−h) : la droite x=3 est bien un axe de symétrie.$$),
        'fixation', jsonb_build_object('question', $$À quelle condition la droite d'équation x=a est-elle un axe de symétrie de (Cf) ?$$, 'solution', $$Si pour tout h tel que (a+h)∈Df, on a (a−h)∈Df et f(a+h)=f(a−h).$$)
      ),
      jsonb_build_object(
        'heading', $$Centre de symétrie d'une courbe$$,
        'body', $$Soit f une fonction de courbe représentative (Cf) et Ω(a;b) un point du plan. Ω est un centre de symétrie de (Cf) si et seulement si, pour tout h∈ℝ tel que (a+h)∈Df, on a (a−h)∈Df et [f(a+h)+f(a−h)]/2=b. Ce résultat généralise la propriété des fonctions impaires (cas particulier a=0, b=0).$$,
        'highlights', array[$$[f(a+h)+f(a−h)]/2 = b$$]::text[],
        'example', jsonb_build_object('statement', $$Justifie que le point A(2;1) est un centre de symétrie de (Cf) où f(x)=4/(x−2)+1.$$, 'solution', $$Df=ℝ\{2}. f(2+h)=4/h+1 et f(2−h)=4/(−h)+1=−4/h+1. [f(2+h)+f(2−h)]/2=[(4/h+1)+(−4/h+1)]/2=2/2=1=b. Donc A(2;1) est bien un centre de symétrie.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi l'étude d'une fonction impaire est-elle un cas particulier de l'étude d'un centre de symétrie ?$$, 'solution', $$Parce qu'une fonction impaire correspond exactement au cas où le centre de symétrie Ω est l'origine du repère, soit a=0 et b=0.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un capteur enregistre la trajectoire d'une bille oscillant sur un rail et affiche une courbe (C) sur l'écran d'un ordinateur. Faute de place, l'écran n'affiche que la partie de la courbe correspondant aux abscisses positives. Le professeur indique que la fonction représentée est impaire.$$,
      'questions', array[
        $$Rappelle la définition d'une fonction impaire.$$,
        $$Explique comment reconstituer la partie manquante de la courbe (abscisses négatives) à partir de la partie affichée, sachant que la fonction est impaire.$$,
        $$Si la fonction avait été paire au lieu d'impaire, qu'aurait-il fallu faire pour reconstituer la courbe complète ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$La fonction f(x)=5x² est-elle paire, impaire, ou ni l'une ni l'autre ?$$,
      'hint', $$Calcule f(−x) et compare-le à f(x).$$,
      'expected', $$f(−x)=5(−x)²=5x²=f(x), donc f est paire.$$
    ),
    jsonb_build_object(
      'question', $$La fonction f(x)=2x³ est-elle paire, impaire, ou ni l'une ni l'autre ?$$,
      'hint', $$Calcule f(−x) et compare-le à −f(x).$$,
      'expected', $$f(−x)=2(−x)³=−2x³=−f(x), donc f est impaire.$$
    ),
    jsonb_build_object(
      'question', $$Si une courbe admet l'axe des ordonnées comme axe de symétrie, quelle est la parité de la fonction correspondante ?$$,
      'hint', $$C'est la propriété caractéristique de l'une des deux parités.$$,
      'expected', $$La fonction est paire.$$
    ),
    jsonb_build_object(
      'question', $$Si une courbe admet l'origine du repère comme centre de symétrie, quelle est la parité de la fonction correspondante ?$$,
      'hint', $$C'est la propriété caractéristique de l'autre parité.$$,
      'expected', $$La fonction est impaire.$$
    )
  ),
  now()
);
