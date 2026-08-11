-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3138: "MATH_2C L8: ANGLES ORIENTÉS ET TRIGONOMÉTRIE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3138)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30931, redirecting
-- to pluginfile "Maths 2C_L8_Angle orienté et trigonometrie.pdf" (13 pages).
-- Rewritten/paraphrased from the source PDF: le radian et la correspondance
-- degré/radian, longueur d'un arc, angle orienté de deux vecteurs (sens
-- direct/indirect), mesure principale d'un angle orienté, cercle
-- trigonométrique et point image d'un réel, cosinus/sinus/tangente d'un
-- angle orienté et leurs propriétés (relation fondamentale, parité). La
-- situation complexe d'évaluation (question de concours administratif sur
-- tanα à partir de cosα) est reformulée avec d'autres valeurs. 100% original
-- wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-angles-orientes-trigonometrie',
  '2nde',
  'C',
  'mathematiques',
  $$Angles orientés et trigonométrie$$,
  8,
  '2nde-c-maths-angles-inscrits',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un professeur d'éducation physique demande à ses élèves de courir sur une piste circulaire en tournant toujours dans le même sens, tandis qu'un autre groupe court dans le sens inverse. Il affirme que les deux sens de parcours d'un cercle jouent un rôle important en mathématiques, notamment en trigonométrie. Intrigués, les élèves d'une classe de seconde C décident de faire des recherches sur les angles orientés et la trigonométrie afin de vérifier cette affirmation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le radian et la longueur d'un arc$$,
        'body', $$La mesure en radian d'un angle AOB est égale à la longueur de l'arc intercepté par cet angle sur le cercle de centre O et de rayon 1. Ainsi, la mesure en radians de l'angle nul est 0, et celle de l'angle plat est π. Pour passer d'une mesure en degrés x à une mesure en radians y (ou inversement), on utilise la relation de proportionnalité y = xπ/180° et x = 180°y/π. Sur un cercle de rayon R, si un angle au centre a pour mesure α radians, alors la longueur de l'arc qu'il intercepte est égale à R×α.$$,
        'highlights', array[$$radian$$, $$correspondance degré-radian$$, $$longueur d'un arc$$]::text[],
        'example', jsonb_build_object('statement', $$Sur un cercle de rayon R = 3 cm, un angle au centre mesure 2π/3 radians. Calcule la longueur de l'arc intercepté.$$, 'solution', $$Longueur = R×α = 3×(2π/3) = 2π cm.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la mesure en radians d'un angle de 90° ?$$, 'solution', $$y = 90×π/180 = π/2 radians.$$)
      ),
      jsonb_build_object(
        'heading', $$Angle orienté de deux vecteurs$$,
        'body', $$Orienter un cercle, c'est choisir l'un de ses deux sens de parcours possibles comme sens de référence : ce sens est appelé sens direct (ou positif, ou trigonométrique), l'autre étant le sens indirect (ou rétrograde, ou négatif). Étant donné deux vecteurs non nuls u et v, on définit l'angle orienté (u,v) : si u et v sont colinéaires et de même sens, cet angle orienté est nul ; s'ils sont colinéaires et de sens contraires, il est plat. L'angle orienté (u,v) est dit direct s'il est parcouru dans le sens direct, indirect sinon.$$,
        'highlights', array[$$sens direct, sens indirect$$, $$angle orienté de deux vecteurs$$]::text[],
        'example', jsonb_build_object('statement', $$u et v sont deux vecteurs colinéaires et de même sens. Que peut-on dire de l'angle orienté (u,v) ?$$, 'solution', $$C'est l'angle orienté nul, car u et v sont colinéaires et de même sens.$$),
        'fixation', jsonb_build_object('question', $$Que représente le sens direct sur un cercle orienté ?$$, 'solution', $$C'est le sens de parcours choisi comme référence positive (aussi appelé sens trigonométrique).$$)
      ),
      jsonb_build_object(
        'heading', $$Mesure principale d'un angle orienté$$,
        'body', $$Soit (OX,OY) un angle orienté, et M, N les points d'intersection respectifs des demi-droites [OX) et [OY) avec un cercle de centre O. La mesure principale de cet angle orienté, notée Mes(OX,OY), est définie ainsi : elle vaut 0 si l'angle est nul, π s'il est plat, et sinon elle vaut la mesure de l'angle géométrique XOY (comptée positivement) si le sens du déplacement de M vers N sur l'arc MN est le sens direct, ou l'opposé de cette mesure si ce déplacement se fait dans le sens indirect. Cette mesure principale appartient toujours à l'intervalle ]−π ; π].$$,
        'highlights', array[$$mesure principale$$, $$intervalle ]−π ; π]$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la mesure principale de l'angle orienté droit direct ? Et de l'angle orienté droit indirect ?$$, 'solution', $$L'angle orienté droit direct a pour mesure principale π/2, et l'angle orienté droit indirect a pour mesure principale −π/2.$$),
        'fixation', jsonb_build_object('question', $$Dans quel intervalle se situe toujours la mesure principale d'un angle orienté ?$$, 'solution', $$Elle appartient à l'intervalle ]−π ; π].$$)
      ),
      jsonb_build_object(
        'heading', $$Cercle trigonométrique et point image d'un réel$$,
        'body', $$On appelle cercle trigonométrique le cercle de centre O et de rayon 1, associé à un repère orthonormé direct (O,I,J). Pour tout réel α appartenant à l'intervalle ]−π ; π], le point image de α est l'unique point M du cercle trigonométrique tel que la mesure principale de l'angle orienté (OI,OM) soit égale à α. Ainsi, le point image de 0 est I, et le point image de π/2 est J.$$,
        'highlights', array[$$cercle trigonométrique$$, $$point image d'un réel$$]::text[],
        'example', jsonb_build_object('statement', $$Quel est le point image de π sur le cercle trigonométrique associé au repère (O,I,J) ?$$, 'solution', $$C'est le point diamétralement opposé à I, c'est-à-dire le point de coordonnées (−1 ; 0).$$),
        'fixation', jsonb_build_object('question', $$Quel est le point image du réel 0 sur le cercle trigonométrique ?$$, 'solution', $$C'est le point I.$$)
      ),
      jsonb_build_object(
        'heading', $$Cosinus, sinus, tangente d'un angle orienté$$,
        'body', $$Soit (u,v) un angle orienté de mesure principale α, et M son point image sur le cercle trigonométrique. En notant P et Q les projetés orthogonaux de M respectivement sur (OI) et sur (OJ), on définit cos(u,v) = cosα = abscisse de M, et sin(u,v) = sinα = ordonnée de M ; lorsque l'angle n'est pas droit, on définit aussi tan(u,v) = tanα = sinα/cosα. Pour tout réel α, on a toujours −1 ≤ cosα ≤ 1, −1 ≤ sinα ≤ 1, et la relation fondamentale cos²α + sin²α = 1. On a aussi les relations de parité cos(−α) = cosα et sin(−α) = −sinα.$$,
        'highlights', array[$$cosinus, sinus, tangente$$, $$relation fondamentale cos²+sin²=1$$, $$parité$$]::text[],
        'example', jsonb_build_object('statement', $$M est le point image de π/3 sur le cercle trigonométrique associé au repère (O,I,J). Détermine les coordonnées de M (on donne cos(π/3)=1/2 et sin(π/3)=√3/2).$$, 'solution', $$M a pour coordonnées (cos(π/3) ; sin(π/3)), soit M(1/2 ; √3/2).$$),
        'fixation', jsonb_build_object('question', $$Quelle relation relie toujours cosα et sinα, pour tout réel α ?$$, 'solution', $$La relation fondamentale cos²α + sin²α = 1.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un candidat se prépare à un concours administratif. Dans le sujet d'une session précédente, une question retient son attention : « On donne α ∈ ]0 ; π/2[ et cosα = √(2+√2)/2. Justifie que tanα = √2 − 1. » Après des heures de recherche infructueuse, il sollicite l'aide d'un élève de seconde C pour comprendre comment résoudre cette question à l'aide des outils de trigonométrie étudiés en classe.$$,
      'questions', array[
        $$En utilisant la relation fondamentale cos²α + sin²α = 1, exprime sinα en fonction de cosα, puis calcule sin²α à partir de la valeur donnée de cosα.$$,
        $$Sachant que α appartient à ]0 ; π/2[, précise le signe de sinα, puis calcule sinα.$$,
        $$Calcule tanα = sinα/cosα et simplifie le résultat pour retrouver l'expression √2 − 1 (en éliminant le radical au dénominateur).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Convertis en radians la mesure d'un angle de 60°.$$,
      'hint', $$Utilise la relation y = xπ/180.$$,
      'expected', $$y = 60×π/180 = π/3 radians.$$
    ),
    jsonb_build_object(
      'question', $$Sur un cercle de rayon 5 cm, un angle au centre mesure π/2 radians. Calcule la longueur de l'arc intercepté.$$,
      'hint', $$Utilise la formule longueur = R×α.$$,
      'expected', $$Longueur = 5×(π/2) = 5π/2 cm.$$
    ),
    jsonb_build_object(
      'question', $$Sachant que sinα = 3/5 et que α ∈ ]0 ; π/2[, calcule cosα à l'aide de la relation fondamentale.$$,
      'hint', $$cos²α = 1 − sin²α, puis choisis le bon signe pour cosα.$$,
      'expected', $$cos²α = 1 − 9/25 = 16/25, et comme α ∈ ]0 ; π/2[, cosα > 0, donc cosα = 4/5.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les valeurs de cos(−α) et sin(−α) en fonction de cosα et sinα ?$$,
      'hint', $$Rappelle les relations de parité du cosinus et du sinus.$$,
      'expected', $$cos(−α) = cosα (fonction paire) et sin(−α) = −sinα (fonction impaire).$$
    )
  ),
  now()
);
