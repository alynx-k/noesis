-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3137: "MATH_2C L7: ANGLES INSCRITS"
-- (https://lyc.ecole-ci.org/course/view.php?id=3137)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30919, redirecting
-- to pluginfile "Maths 2C_L7_Angles inscrits.pdf" (19 pages).
-- Rewritten/paraphrased from the source PDF: angle inscrit et angle au
-- centre associé, angle inscrit défini par une corde et une demi-tangente,
-- propriétés des angles inscrits interceptant le même arc ou des arcs
-- complémentaires, arcs capables, aire d'un triangle par la formule au
-- sinus et théorème des sinus (relatif au cercle circonscrit). La situation
-- complexe d'évaluation (plantation de roses dans un triangle inscrit dans
-- un cercle) est reformulée avec d'autres valeurs numériques. 100% original
-- wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-angles-inscrits',
  '2nde',
  'C',
  'mathematiques',
  $$Angles inscrits$$,
  7,
  '2nde-c-maths-fonctions-polynomes-rationnelles',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur le terrain d'un stade circulaire, un arbitre doit vérifier depuis quels points du gradin un supporter peut voir les deux poteaux d'un but sous un angle donné, par exemple 60°. Un élève de seconde C, passionné de football, se demande s'il existe une règle mathématique reliant l'angle sous lequel on voit un segment depuis un point d'un cercle, et l'angle que ce même segment forme vu depuis le centre du cercle.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Angle inscrit et angle au centre associé$$,
        'body', $$Soit un cercle de centre O et deux points A et B de ce cercle. Pour tout point M du cercle appartenant à l'arc AB (l'arc qui ne contient pas la corde entre A et B du côté opposé), l'angle AMB est appelé angle inscrit interceptant l'arc AB, et l'angle AOB est appelé angle au centre associé à cet angle inscrit. Lorsque M appartient au petit arc AB, l'angle inscrit est aigu ; lorsqu'il appartient au grand arc, l'angle inscrit est obtus. Dans les deux cas, la mesure de l'angle inscrit est exactement la moitié de celle de l'angle au centre associé qui intercepte le même arc.$$,
        'highlights', array[$$angle inscrit$$, $$angle au centre associé$$, $$arc intercepté$$]::text[],
        'property', jsonb_build_object('label', $$Propriété fondamentale$$, 'text', $$Si l'angle inscrit AMB intercepte l'arc AB (le même arc que l'angle au centre AOB), alors mesAMB = (1/2)×mesAOB.$$),
        'example', jsonb_build_object('statement', $$Dans un cercle de centre O, l'angle au centre BOC mesure 138°. B et C sont deux points du cercle et A un troisième point appartenant à l'arc BC qui ne contient pas le point diamétralement opposé. Calcule mesBAC.$$, 'solution', $$L'angle inscrit BAC intercepte le même arc BC que l'angle au centre BOC, donc mesBAC = (1/2)×138° = 69°.$$),
        'fixation', jsonb_build_object('question', $$Un angle inscrit qui intercepte un arc AB vaut-il le double ou la moitié de l'angle au centre associé ?$$, 'solution', $$Il vaut la moitié de l'angle au centre associé qui intercepte le même arc.$$)
      ),
      jsonb_build_object(
        'heading', $$Angle inscrit défini par une corde et une demi-tangente$$,
        'body', $$Soit (TT') la tangente en un point A à un cercle de centre O, et B un autre point du cercle. L'angle TAB, formé par la demi-tangente [AT contenue dans le demi-plan de frontière (AB) qui ne contient pas O, est encore appelé angle inscrit : il vérifie la même propriété que les angles inscrits classiques, à savoir que sa mesure est la moitié de celle de l'angle au centre AOB associé.$$,
        'highlights', array[$$demi-tangente$$, $$angle inscrit corde-tangente$$]::text[],
        'example', jsonb_build_object('statement', $$(TT') est la tangente en A à un cercle de centre O, B un point du cercle, et mesAOB = 108°. Calcule mesBAT.$$, 'solution', $$D'après la propriété, mesBAT = (1/2)×mesAOB = (1/2)×108° = 54°.$$),
        'fixation', jsonb_build_object('question', $$Quelle propriété relie l'angle formé par une corde et une demi-tangente à l'angle au centre associé ?$$, 'solution', $$Sa mesure est égale à la moitié de la mesure de l'angle au centre qui intercepte le même arc.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés des angles inscrits interceptant un même arc$$,
        'body', $$Deux angles inscrits qui interceptent le même arc ont la même mesure, puisqu'ils sont tous les deux égaux à la moitié du même angle au centre associé. La bissectrice d'un angle inscrit partage l'arc intercepté en deux arcs de même longueur. Enfin, si deux points M et N appartiennent respectivement aux deux arcs déterminés par une corde AB (c'est-à-dire M et N de part et d'autre de la corde), alors les angles inscrits AMB et ANB sont supplémentaires, c'est-à-dire que leur somme vaut 180°.$$,
        'highlights', array[$$angles inscrits égaux$$, $$angles inscrits supplémentaires$$]::text[],
        'example', jsonb_build_object('statement', $$M et N sont deux points appartenant respectivement aux deux arcs déterminés par la corde AB, et mesAMB = 37°. Détermine mesANB.$$, 'solution', $$Les angles inscrits AMB et ANB sont supplémentaires (M et N de part et d'autre de AB), donc mesANB = 180° − 37° = 143°.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi deux angles inscrits qui interceptent le même arc ont-ils la même mesure ?$$, 'solution', $$Parce qu'ils sont chacun égaux à la moitié de la mesure du même angle au centre associé.$$)
      ),
      jsonb_build_object(
        'heading', $$Arcs capables$$,
        'body', $$Étant donné un segment [AB] et un angle θ compris strictement entre 0° et 180°, l'ensemble des points M tels que mesAMB = θ est appelé arc capable de l'angle θ relatif à [AB] : c'est en fait la réunion de deux arcs de cercle symétriques par rapport à la droite (AB). Pour le construire, on trace une demi-droite [AT telle que mesTAB = θ, on construit le point O intersection de la perpendiculaire à (AT) en A et de la médiatrice de [AB], puis l'arc de cercle de centre O et de rayon OA du côté de (AB) ne contenant pas T ; le second arc s'obtient par symétrie par rapport à (AB).$$,
        'highlights', array[$$arc capable$$, $$lieu géométrique$$]::text[],
        'example', jsonb_build_object('statement', $$Quel est l'ensemble des points M distincts de A et B tels que mesAMB = 90° ?$$, 'solution', $$C'est le cercle de diamètre [AB], privé des points A et B eux-mêmes.$$),
        'fixation', jsonb_build_object('question', $$Que représente l'ensemble des points M tels que mesAMB = 180° ?$$, 'solution', $$C'est le segment [AB] lui-même, privé de ses extrémités A et B.$$)
      ),
      jsonb_build_object(
        'heading', $$Aire d'un triangle et théorème des sinus$$,
        'body', $$Dans un triangle ABC d'aire notée A, en posant a=BC, b=AC et c=AB, on peut calculer l'aire à partir de deux côtés et de l'angle qu'ils forment : A = (1/2)bc·sinA = (1/2)ac·sinB = (1/2)ab·sinC. Par ailleurs, le théorème des sinus relie les côtés d'un triangle aux sinus des angles opposés et au rayon R du cercle circonscrit : a/sinA = b/sinB = c/sinC = 2R. Ces deux résultats permettent de résoudre de nombreux problèmes de triangles inscrits dans un cercle, sans avoir besoin de connaître toutes les longueurs ou tous les angles.$$,
        'highlights', array[$$aire d'un triangle$$, $$théorème des sinus$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un triangle ABC, AB = 5 cm, BC = 6 cm et mesABC = 30°. Calcule l'aire de ABC.$$, 'solution', $$A = (1/2)×AB×BC×sin(ABC) = (1/2)×5×6×sin(30°) = 15×0,5 = 7,5 cm².$$),
        'fixation', jsonb_build_object('question', $$Quelle relation relie les trois côtés d'un triangle, les sinus des angles opposés, et le rayon R de son cercle circonscrit ?$$, 'solution', $$a/sinA = b/sinB = c/sinC = 2R (théorème des sinus).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour embellir la devanture de leur classe, des élèves de seconde C décident de planter des roses à l'intérieur d'un triangle ABC inscrit dans un cercle (C) de centre O. Elles ont acheté 40 pieds de roses blanches et souhaitent réserver toute l'aire du triangle ABC pour cette plantation, à raison de 5 pieds au mètre carré. On donne AC = 5 m, mesACB = 60° et mesBAC = 100°. Le chef de classe soutient qu'avec 5 pieds au mètre carré, elles n'ont pas suffisamment de roses ; les filles ne sont pas d'accord.$$,
      'questions', array[
        $$Calcule la mesure de l'angle ABC, sachant que la somme des angles d'un triangle vaut 180°.$$,
        $$En utilisant le théorème des sinus dans le triangle ABC, calcule la longueur BC.$$,
        $$Calcule l'aire du triangle ABC, puis détermine combien de pieds de roses sont réellement nécessaires. Qui a raison entre le chef de classe et les filles ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans un cercle de centre O, l'angle au centre AOB mesure 76°. Quelle est la mesure d'un angle inscrit AMB qui intercepte le même arc AB ?$$,
      'hint', $$L'angle inscrit vaut la moitié de l'angle au centre associé.$$,
      'expected', $$mesAMB = 76°/2 = 38°.$$
    ),
    jsonb_build_object(
      'question', $$M et N appartiennent respectivement aux deux arcs déterminés par la corde AB. Si mesAMB = 112°, calcule mesANB.$$,
      'hint', $$Rappelle-toi que ces deux angles inscrits sont supplémentaires.$$,
      'expected', $$mesANB = 180° − 112° = 68°.$$
    ),
    jsonb_build_object(
      'question', $$Que représente l'ensemble des points M tels que mesAMB = 90°, où A et B sont deux points fixés ?$$,
      'hint', $$Pense au cas particulier bien connu de l'angle droit inscrit.$$,
      'expected', $$C'est le cercle de diamètre [AB], privé des points A et B.$$
    ),
    jsonb_build_object(
      'question', $$Dans un triangle ABC, AB = 8 cm, AC = 6 cm et mesBAC = 45°. Calcule l'aire du triangle ABC (on donne sin45° ≈ 0,71).$$,
      'hint', $$Utilise la formule A = (1/2)×AB×AC×sin(BAC).$$,
      'expected', $$A ≈ (1/2)×8×6×0,71 ≈ 17,04 cm².$$
    )
  ),
  now()
);
