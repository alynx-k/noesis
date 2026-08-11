-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde
-- A) has only one real lesson on the platform ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql). This lesson
-- closes out the fallback coverage of the official Ivorian Seconde A
-- programme (Compétence 3: Configurations géométriques et transformations
-- du plan — Repérage) with original, general-knowledge content adapted to
-- the série A (littéraire) level: coordinates of a point and of a vector
-- in a repère, coordinates of the midpoint of a segment, distance between
-- two points, and translations described with a vector. No source PDF was
-- available for this topic; entirely original wording, examples and
-- exercises.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-reperage-dans-le-plan',
  '2nde',
  'A',
  'mathematiques',
  $$Repérage dans le plan$$,
  9,
  '2nde-a-maths-vecteurs-du-plan',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un urbaniste travaille sur le plan d'un nouveau quartier, dessiné dans un repère orthonormé où chaque unité représente 100 mètres. Il doit installer un lampadaire exactement au milieu de la rue reliant deux carrefours déjà positionnés par leurs coordonnées, puis calculer la longueur exacte du câble électrique nécessaire pour relier ce lampadaire au poste de transformation le plus proche. Le repérage dans le plan lui fournit exactement les outils nécessaires.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Repère du plan et coordonnées d'un point$$,
        'body', $$Un repère du plan est formé de deux droites graduées sécantes, appelées axes, munies d'une origine commune O. Tout point M du plan est alors repéré par un unique couple de nombres (x ; y), appelés coordonnées de M : x est l'abscisse, y est l'ordonnée.$$,
        'highlights', array[$$repère$$, $$abscisse$$, $$ordonnée$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Dans un repère (O ; I ; J), tout point M du plan est associé à un unique couple (x ; y) de nombres réels, appelés coordonnées de M : x est l'abscisse et y est l'ordonnée de M.$$),
        'example', jsonb_build_object('statement', $$Un point M a pour abscisse 5 et pour ordonnée −2. Écris les coordonnées de M.$$, 'solution', $$M(5 ; −2).$$),
        'fixation', jsonb_build_object('question', $$Un point N a pour coordonnées (−3 ; 4). Donne son abscisse et son ordonnée.$$, 'solution', $$L'abscisse de N est −3, et son ordonnée est 4.$$)
      ),
      jsonb_build_object(
        'heading', $$Coordonnées d'un vecteur$$,
        'body', $$Dans un repère, un vecteur AB possède lui aussi des coordonnées, obtenues en soustrayant les coordonnées de son origine A à celles de son extrémité B : une coordonnée pour chaque axe.$$,
        'highlights', array[$$coordonnées d'un vecteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si A(xA ; yA) et B(xB ; yB), alors le vecteur AB a pour coordonnées (xB − xA ; yB − yA).$$),
        'example', jsonb_build_object('statement', $$On donne A(2 ; 1) et B(6 ; 4). Détermine les coordonnées du vecteur AB.$$, 'solution', $$AB a pour coordonnées (6−2 ; 4−1), soit (4 ; 3).$$),
        'fixation', jsonb_build_object('question', $$On donne C(−1 ; 5) et D(3 ; −2). Détermine les coordonnées du vecteur CD.$$, 'solution', $$CD a pour coordonnées (3−(−1) ; −2−5), soit (4 ; −7).$$)
      ),
      jsonb_build_object(
        'heading', $$Coordonnées du milieu d'un segment$$,
        'body', $$Le milieu d'un segment [AB] est le point situé exactement à mi-chemin entre A et B. Ses coordonnées s'obtiennent en faisant la moyenne des abscisses de A et B, puis la moyenne de leurs ordonnées.$$,
        'highlights', array[$$milieu d'un segment$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si A(xA ; yA) et B(xB ; yB), le milieu I du segment [AB] a pour coordonnées I((xA+xB)/2 ; (yA+yB)/2).$$),
        'example', jsonb_build_object('statement', $$On donne A(1 ; 3) et B(7 ; 9). Détermine les coordonnées du milieu I de [AB].$$, 'solution', $$I a pour coordonnées ((1+7)/2 ; (3+9)/2), soit (4 ; 6).$$),
        'fixation', jsonb_build_object('question', $$On donne C(−2 ; 6) et D(4 ; −2). Détermine les coordonnées du milieu de [CD].$$, 'solution', $$Le milieu a pour coordonnées ((−2+4)/2 ; (6+(−2))/2), soit (1 ; 2).$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 140),
          'points', jsonb_build_array(
            jsonb_build_object('x', 20, 'y', 110, 'label', $$A$$),
            jsonb_build_object('x', 180, 'y', 30, 'label', $$B$$),
            jsonb_build_object('x', 100, 'y', 70, 'label', $$I$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,2), jsonb_build_array(2,1))
        )
      ),
      jsonb_build_object(
        'heading', $$Distance entre deux points$$,
        'body', $$Dans un repère orthonormé, la distance entre deux points se calcule à partir de leurs coordonnées, sans avoir besoin de mesurer sur une figure : c'est une application directe du théorème de Pythagore au triangle formé par les deux points et leurs projections sur les axes.$$,
        'highlights', array[$$distance$$, $$repère orthonormé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un repère orthonormé, si A(xA ; yA) et B(xB ; yB), alors AB = √[(xB−xA)² + (yB−yA)²].$$),
        'example', jsonb_build_object('statement', $$On donne A(1 ; 1) et B(4 ; 5). Calcule la distance AB.$$, 'solution', $$AB = √[(4−1)² + (5−1)²] = √(9+16) = √25 = 5.$$),
        'fixation', jsonb_build_object('question', $$On donne C(0 ; 0) et D(6 ; 8). Calcule la distance CD.$$, 'solution', $$CD = √[(6−0)² + (8−0)²] = √(36+64) = √100 = 10.$$)
      ),
      jsonb_build_object(
        'heading', $$Translation de vecteur donné$$,
        'body', $$Une translation déplace tous les points du plan de la même façon, décrite par un unique vecteur : chaque point M est envoyé sur un point M' tel que le vecteur MM' soit toujours égal à ce vecteur de translation. Dans un repère, l'image d'un point s'obtient en ajoutant les coordonnées du vecteur à celles du point de départ.$$,
        'highlights', array[$$translation$$, $$vecteur de translation$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La translation de vecteur u associe à tout point M le point M' tel que MM' = u. Si u a pour coordonnées (a ; b) et M(x ; y), alors M' a pour coordonnées (x+a ; y+b).$$),
        'example', jsonb_build_object('statement', $$Le point M(2 ; 5) subit la translation de vecteur u(3 ; −4). Détermine les coordonnées de son image M'.$$, 'solution', $$M' a pour coordonnées (2+3 ; 5+(−4)), soit (5 ; 1).$$),
        'fixation', jsonb_build_object('question', $$Le point N(−1 ; 0) subit la translation de vecteur v(4 ; 6). Détermine les coordonnées de son image N'.$$, 'solution', $$N' a pour coordonnées (−1+4 ; 0+6), soit (3 ; 6).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends l'urbaniste de la situation d'apprentissage : deux carrefours P(2 ; 3) et Q(10 ; 9) sont reliés par une rue rectiligne, dans un repère orthonormé où l'unité représente 100 mètres. Il veut installer un lampadaire exactement au milieu de cette rue, puis connaître la longueur du câble à prévoir entre ce lampadaire et le poste de transformation situé au point T(6 ; 1).$$,
      'questions', array[
        $$Détermine les coordonnées du point L, milieu du segment [PQ], où sera installé le lampadaire.$$,
        $$Calcule la distance LT entre le lampadaire et le poste de transformation T(6 ; 1), en unités de repère.$$,
        $$Sachant qu'une unité représente 100 mètres, donne la longueur réelle de câble à prévoir entre L et T.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$On donne A(3 ; −1) et B(7 ; 5). Détermine les coordonnées du vecteur AB.$$,
      'hint', $$Soustrais les coordonnées de A à celles de B, axe par axe.$$,
      'expected', $$AB a pour coordonnées (7−3 ; 5−(−1)), soit (4 ; 6).$$
    ),
    jsonb_build_object(
      'question', $$On donne E(−4 ; 2) et F(8 ; −6). Détermine les coordonnées du milieu de [EF].$$,
      'hint', $$Fais la moyenne des abscisses, puis la moyenne des ordonnées.$$,
      'expected', $$Le milieu a pour coordonnées ((−4+8)/2 ; (2+(−6))/2), soit (2 ; −2).$$
    ),
    jsonb_build_object(
      'question', $$On donne G(−3 ; 0) et H(1 ; 3). Calcule la distance GH.$$,
      'hint', $$Applique la formule de la distance dans un repère orthonormé.$$,
      'expected', $$GH = √[(1−(−3))² + (3−0)²] = √(16+9) = √25 = 5.$$
    ),
    jsonb_build_object(
      'question', $$Le point R(5 ; −2) subit la translation de vecteur w(−6 ; 3). Détermine les coordonnées de son image R'.$$,
      'hint', $$Ajoute les coordonnées du vecteur de translation à celles de R.$$,
      'expected', $$R' a pour coordonnées (5+(−6) ; −2+3), soit (−1 ; 1).$$
    )
  ),
  now()
);
