-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3145: "MATH_2C L14: ROTATION"
-- (https://lyc.ecole-ci.org/course/view.php?id=3145)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31015, redirecting
-- to pluginfile "Maths 2C_L14_Rotations.pdf" (16 pages).
-- Rewritten/paraphrased from the source PDF: définition d'une rotation (via
-- l'angle orienté), cas particuliers (angle π, ±π/2), propriété
-- fondamentale (conservation des longueurs et des angles orientés), images
-- de figures simples (droite, segment, cercle), propriétés générales
-- conservées, et caractérisation d'une rotation par son centre et un point
-- ou par deux points distincts et leurs images. La situation complexe
-- d'évaluation (construction d'un triangle équilatéral inscrit dans deux
-- cercles concentriques) est reformulée avec d'autres noms de points. 100%
-- original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-rotation',
  '2nde',
  'C',
  'mathematiques',
  $$Rotation$$,
  14,
  '2nde-c-maths-etude-fonctions-elementaires',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un artisan a fabriqué un moulinet décoratif à quatre pales colorées, obtenu en faisant pivoter un même triangle plusieurs fois autour d'un point central, chaque fois du même angle. Un élève de seconde C, admirant l'objet, se demande quelle transformation du plan permet de décrire précisément ce pivotement autour d'un point fixe, sans jamais déformer la forme du triangle de départ.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition d'une rotation et cas particuliers$$,
        'body', $$Soit O un point du plan orienté et α un nombre réel appartenant à l'intervalle ]−π ; π]. On appelle rotation de centre O et d'angle orienté de mesure principale α l'application du plan qui, à tout point M, associe le point M' tel que : si M ≠ O, alors OM = OM' et Mes(OM,OM') = α ; si M = O, alors M' = O. Parmi les cas particuliers à retenir : une rotation d'angle π (ou demi-tour) coïncide avec la symétrie de centre O ; une rotation d'angle π/2 est appelée quart de tour direct, et une rotation d'angle −π/2 est appelée quart de tour indirect.$$,
        'highlights', array[$$rotation$$, $$centre, angle orienté$$, $$demi-tour, quart de tour$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Rotation de centre O et d'angle α : si M≠O, OM'=OM et Mes(OM,OM')=α ; si M=O, M'=O. Cas particuliers : angle π = symétrie centrale ; angle π/2 = quart de tour direct ; angle −π/2 = quart de tour indirect.$$),
        'example', jsonb_build_object('statement', $$C et A, B sont trois points tels que CA=CB et Mes(CA,CB)=π/3. Que peut-on dire de B et de la rotation de centre C ?$$, 'solution', $$B est l'image de A par la rotation de centre C et d'angle π/3, ce qu'on note B = r(C ; π/3)(A).$$),
        'fixation', jsonb_build_object('question', $$À quelle transformation classique correspond une rotation d'angle π ?$$, 'solution', $$Elle correspond à la symétrie de centre O (le centre de la rotation).$$)
      ),
      jsonb_build_object(
        'heading', $$Propriété fondamentale de la rotation$$,
        'body', $$Soit r une rotation d'angle α. Si M' et N' sont les images respectives de deux points distincts M et N par r, alors M'N' = MN (les longueurs sont conservées) et Mes(MN,M'N') = α (l'angle orienté entre le segment initial et son image est toujours égal à l'angle de la rotation). Cette double propriété distingue la rotation de l'homothétie, qui conserve les angles mais pas nécessairement les longueurs.$$,
        'highlights', array[$$M'N'=MN$$, $$conservation des longueurs et des angles$$]::text[],
        'example', jsonb_build_object('statement', $$ABC est un triangle de sens direct. On considère la rotation r de centre A et d'angle π/2. Sachant que r(B)=C, que peut-on dire des longueurs AB et AC ?$$, 'solution', $$Comme la rotation conserve les distances au centre, AC = AB (puisque C est l'image de B par une rotation de centre A).$$),
        'fixation', jsonb_build_object('question', $$Une rotation conserve-t-elle les longueurs des segments ?$$, 'solution', $$Oui, toujours : si M' et N' sont les images de M et N, alors M'N' = MN.$$)
      ),
      jsonb_build_object(
        'heading', $$Images de figures simples par une rotation$$,
        'body', $$Si A et B sont deux points distincts d'images respectives A' et B' par une rotation, alors l'image de la droite (AB) est la droite (A'B'), l'image de la demi-droite [AB) est la demi-droite [A'B'), et l'image du segment [AB] est le segment [A'B'] (de même longueur, puisque A'B'=AB). L'image d'un cercle de centre O et de rayon r par une rotation est un cercle de même rayon r, dont le centre est l'image de O par cette rotation.$$,
        'highlights', array[$$image d'une droite$$, $$image d'un cercle de même rayon$$]::text[],
        'example', jsonb_build_object('statement', $$Un cercle (C) a pour centre O et pour rayon 4 cm. Quelle est l'image de (C) par une rotation de centre I et d'angle π/4 ?$$, 'solution', $$C'est le cercle de même rayon 4 cm, dont le centre est l'image de O par cette rotation.$$),
        'fixation', jsonb_build_object('question', $$Le rayon d'un cercle change-t-il par une rotation ?$$, 'solution', $$Non, l'image d'un cercle par une rotation est un cercle de même rayon.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés générales conservées par une rotation$$,
        'body', $$Comme les autres transformations du plan déjà étudiées, une rotation envoie des points alignés sur des points alignés, le milieu d'un segment sur le milieu de son image, deux droites parallèles sur deux droites parallèles, et deux droites perpendiculaires sur deux droites perpendiculaires. De plus, si des points E, A et B ont pour images respectives F, A et C par une rotation de centre A, alors la mesure de l'angle orienté (EB,EA) est conservée et égale à celle de (FC,FA), d'après la propriété de conservation des angles orientés.$$,
        'highlights', array[$$conservation de l'alignement$$, $$conservation des angles orientés$$]::text[],
        'example', jsonb_build_object('statement', $$ABC est un triangle de sens direct, F et E sont tels que r(B)=C et r(E)=F pour la rotation r de centre A et d'angle π/2 (avec AB=AC et AE=AF). Que peut-on dire des angles orientés (EB,EA) et (FC,FA) ?$$, 'solution', $$Comme les rotations conservent les angles orientés, Mes(EB,EA) = Mes(FC,FA).$$),
        'fixation', jsonb_build_object('question', $$Une rotation conserve-t-elle le parallélisme de deux droites ?$$, 'solution', $$Oui, deux droites parallèles ont pour images deux droites parallèles par une rotation.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractérisation d'une rotation$$,
        'body', $$Soient A, B, C et D quatre points deux à deux distincts du plan tels que AB = CD (longueurs égales) mais AB différent de CD en tant que vecteurs (les segments [AB] et [CD] ne sont pas de simples translatés l'un de l'autre). Il existe alors une unique rotation qui transforme A en C et B en D. Pour construire son centre, on utilise le fait que ce centre est équidistant de A et C (donc sur la médiatrice de [AC]) et équidistant de B et D (donc sur la médiatrice de [BD]) : le centre est l'intersection de ces deux médiatrices.$$,
        'highlights', array[$$caractérisation d'une rotation$$, $$médiatrices$$]::text[],
        'example', jsonb_build_object('statement', $$A, B, C, D sont quatre points distincts tels que AB=CD et AB≠CD (comme vecteurs). Comment construire le centre de la rotation qui transforme A en C et B en D ?$$, 'solution', $$Le centre est le point d'intersection de la médiatrice de [AC] et de la médiatrice de [BD].$$),
        'fixation', jsonb_build_object('question', $$Sur quelles droites se trouve le centre d'une rotation qui transforme A en C et B en D ?$$, 'solution', $$Sur la médiatrice de [AC] et sur la médiatrice de [BD], puisque le centre est équidistant de chaque point et de son image.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une séance de formation, un membre d'un club de mathématiques construit deux cercles concentriques dont le rayon de l'un est le double de celui de l'autre. Après avoir placé un point A sur le plus petit des deux cercles, il affirme que l'on peut construire un triangle équilatéral ABC où B et C sont respectivement sur le plus petit cercle et sur le grand cercle. Curieux, les membres du club se proposent de réfléchir à une construction possible, en utilisant les rotations.$$,
      'questions', array[
        $$En notant O le centre commun des deux cercles et O' un point tel que AOBO' soit un losange (ou une figure adaptée), explique comment une rotation de centre O et d'un angle bien choisi peut permettre de construire le point B sur le petit cercle.$$,
        $$Explique pourquoi l'angle inscrit associé à un certain angle au centre dans le grand cercle permet de montrer que le triangle ABC est équilatéral.$$,
        $$Résume les étapes de construction à suivre pour obtenir effectivement les points B et C répondant à la question posée.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle rotation particulière correspond à la symétrie de centre O ?$$,
      'hint', $$Pense à l'angle de cette rotation.$$,
      'expected', $$C'est la rotation de centre O et d'angle π (le demi-tour).$$
    ),
    jsonb_build_object(
      'question', $$M et N ont pour images M' et N' par une rotation d'angle π/3. Sachant que MN=6 cm, quelle est la longueur M'N' ?$$,
      'hint', $$Rappelle la propriété fondamentale de conservation des longueurs.$$,
      'expected', $$M'N' = MN = 6 cm (les longueurs sont toujours conservées par une rotation).$$
    ),
    jsonb_build_object(
      'question', $$Une rotation transforme un cercle de rayon 7 cm. Quel est le rayon de l'image ?$$,
      'hint', $$Une rotation conserve-t-elle le rayon d'un cercle ?$$,
      'expected', $$Le rayon de l'image est aussi 7 cm, car une rotation conserve toujours le rayon d'un cercle.$$
    ),
    jsonb_build_object(
      'question', $$A, B, C, D sont quatre points distincts avec AB=CD et AB≠CD (comme vecteurs). Sur quelles droites se situe le centre de la rotation qui transforme A en C et B en D ?$$,
      'hint', $$Pense à l'équidistance entre un point et son image.$$,
      'expected', $$Sur la médiatrice de [AC] et sur la médiatrice de [BD].$$
    )
  ),
  now()
);
