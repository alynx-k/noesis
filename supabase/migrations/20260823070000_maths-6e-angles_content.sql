-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2099: "Leçon7: Angles"
-- (https://coll.ecole-ci.org/course/view.php?id=2099), resource id 17473.
-- Contenu réécrit à partir du PDF source (thème "Géométrie du plan",
-- programme officiel MENA) ; situation d'apprentissage, définitions et
-- exercices reformulés, non copiés verbatim. Les instructions de tracé
-- (rapporteur, compas) sont décrites textuellement (figures non
-- reproductibles en JSON).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour préparer le tournoi de football du Lycée Moderne de Tiassalé, des élèves de 6ème s'entraînent aux tirs au but. Sur leur feuille d'exercice, A et B sont les pieds des poteaux, G la position du gardien et P celle d'un joueur. Le professeur d'EPS leur explique qu'il existe des angles de tir à respecter pour marquer un but, et les élèves décident de s'informer sur les angles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Angle : définition, notation et vocabulaire$$,
        'body', $$Deux demi-droites [AB) et [AC) de même origine A déterminent un angle, noté BÂC (ou CÂB). Le point A est le sommet de l'angle ; les demi-droites [AB) et [AC) en sont les côtés.$$,
        'highlights', array[$$BÂC = CÂB (même angle, deux écritures)$$, $$sommet = origine commune des deux côtés$$]::text[],
        'fixation', jsonb_build_object('question', $$Un angle a pour sommet le point K et pour côtés [KM) et [KP). Comment le note-t-on ?$$, 'solution', $$MK̂P (ou PK̂M).$$)
      ),
      jsonb_build_object(
        'heading', $$Mesure d'un angle avec le rapporteur$$,
        'body', $$L'instrument de mesure d'un angle est le rapporteur. Pour mesurer l'angle AÔB : on place le centre du rapporteur sur le sommet O, on aligne la graduation 0° sur un des côtés (ex. [OA)), puis on lit la graduation correspondant à l'autre côté (ex. [OB)).$$,
        'highlights', array[$$le rapporteur mesure les angles en degrés$$, $$centre du rapporteur sur le sommet, 0° aligné sur un côté$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quel point du rapporteur doit-on placer le sommet de l'angle à mesurer ?$$, 'solution', $$Sur le centre (le réticule) du rapporteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Angles particuliers$$,
        'body', $$Selon sa mesure, un angle est : nul (0°, les deux côtés sont la même demi-droite), aigu (entre 0° et 90°), droit (exactement 90°, côtés à supports perpendiculaires), obtus (entre 90° et 180°), ou plat (180°, les côtés sont deux demi-droites opposées, formant une droite).$$,
        'highlights', array[$$nul = 0° ; aigu ]0°,90°[ ; droit = 90° ; obtus ]90°,180°[ ; plat = 180°$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Type', 'Mesure']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nul$$, $$0°$$),
            jsonb_build_array($$Aigu$$, $$entre 0° et 90°$$),
            jsonb_build_array($$Droit$$, $$exactement 90°$$),
            jsonb_build_array($$Obtus$$, $$entre 90° et 180°$$),
            jsonb_build_array($$Plat$$, $$exactement 180°$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Les droites (IJ) et (KJ) sont perpendiculaires. Quelle est la nature de l'angle KĴI ?$$, 'solution', $$Il est droit (90°), puisque les côtés de cet angle ont des supports perpendiculaires.$$),
        'fixation', jsonb_build_object('question', $$Un angle mesure 145°. Quelle est sa nature ?$$, 'solution', $$Obtus (car sa mesure est comprise entre 90° et 180°).$$)
      ),
      jsonb_build_object(
        'heading', $$Bissectrice d'un angle$$,
        'body', $$La bissectrice d'un angle est la droite qui passe par son sommet et le partage en deux angles de même mesure (dans la pratique, on parle aussi de la demi-droite bissectrice). Pour la construire : mesurer l'angle AÔB avec le rapporteur, placer un point C tel que la mesure de AÔC soit égale à la moitié de la mesure de AÔB, puis tracer la droite (OC).$$,
        'highlights', array[$$bissectrice : passe par le sommet, partage l'angle en deux parts égales$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un angle droit ABC (90°), la bissectrice (L) passe par B avec un point O sur (L). Que vaut la mesure de l'angle ABO ?$$, 'solution', $$45°, car la bissectrice partage l'angle droit de 90° en deux angles égaux de 45° chacun.$$),
        'fixation', jsonb_build_object('question', $$Si (CD) partage l'angle BĈE en deux angles de 30° chacun, que peut-on dire de (CD) ?$$, 'solution', $$(CD) est la bissectrice de l'angle BĈE.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux élèves se placent en des points fixes A et B du port de San Pedro pour repérer trois bateaux. Depuis A, on voit les bateaux 1, 2 et 3 sous des angles de 68°, 48° et 50° ; depuis B, sous des angles de 54°, 74° et 50°. Kouman affirme que les trois bateaux sont alignés ; son camarade pense le contraire.$$,
      'questions', array[
        $$En utilisant les angles donnés depuis A et B, explique comment construire la position du bateau n°2.$$,
        $$Fais de même pour le bateau n°3.$$,
        $$Qui, de Kouman ou de son camarade, a raison ? Justifie à partir des positions construites.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel est l'instrument utilisé pour mesurer un angle ?$$,
      'hint', $$Il est gradué en degrés.$$,
      'expected', $$Le rapporteur.$$
    ),
    jsonb_build_object(
      'question', $$Un angle a une mesure de 0°. Comment l'appelle-t-on, et que peut-on dire de ses côtés ?$$,
      'hint', $$C'est le cas où les deux côtés se confondent.$$,
      'expected', $$Un angle nul ; ses côtés sont deux noms de la même demi-droite.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la bissectrice d'un angle ?$$,
      'hint', $$Elle passe par un point particulier de l'angle.$$,
      'expected', $$La droite qui passe par le sommet de l'angle et qui le partage en deux angles de même mesure.$$
    ),
    jsonb_build_object(
      'question', $$Un angle mesure 180°. Quel est son nom, et quelle est la particularité de ses côtés ?$$,
      'hint', $$C'est l'angle qui forme une droite.$$,
      'expected', $$C'est un angle plat ; ses côtés sont deux demi-droites opposées.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-angles';
