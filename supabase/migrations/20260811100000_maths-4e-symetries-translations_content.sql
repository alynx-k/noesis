-- Same CourseContentV2 shape as 20260811000000_maths-4e-nombres-decimaux-
-- relatifs_content.sql (see that file's header for sourcing note: ecole-
-- ci.org unreachable behind its login wall, so this is original fallback
-- content from standard Ivorian/French 4ème mathématiques programme
-- knowledge, Leçon "Symétries et translations"). Every sentence, example
-- and exercise is an original composition. Diagrams: a generic point and
-- its image by an axial symmetry, and a generic point and its image by a
-- central symmetry, own coordinates. Uses the optional 'table' field to
-- compare the properties preserved by the three transformations.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un artisan tisse un pagne dont le motif se répète plusieurs fois : parfois il semble « retourné » comme dans un miroir, parfois il semble simplement « tourné » autour d'un point, et parfois il semble juste « glissé » plus loin sur le tissu sans être modifié. Ces trois façons de reproduire un motif correspondent exactement à trois transformations du plan étudiées en mathématiques : la symétrie axiale, la symétrie centrale et la translation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Symétrie axiale (rappel)$$,
        'body', $$Le symétrique d'un point M par rapport à une droite (d) est le point M' tel que (d) soit la médiatrice du segment [MM']. Si le point M appartient déjà à la droite (d), alors son symétrique M' est lui-même.$$,
        'highlights', array[$$symétrie axiale$$, $$médiatrice$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$M' est le symétrique de M par rapport à la droite (d) si (d) est la médiatrice de [MM'], c'est-à-dire si (d) est perpendiculaire à (MM') et passe par son milieu.$$),
        'example', jsonb_build_object('statement', $$Un point M est situé à 3,5 cm d'une droite (d), perpendiculairement. Où se trouve son symétrique M' par rapport à (d) ?$$, 'solution', $$M' se trouve de l'autre côté de (d), également à 3,5 cm, sur la perpendiculaire à (d) passant par M, de sorte que (d) coupe [MM'] en son milieu.$$),
        'fixation', jsonb_build_object('question', $$Un point P appartient à une droite (d). Que peut-on dire de son symétrique P' par rapport à (d) ?$$, 'solution', $$Comme P appartient à (d), son symétrique P' est confondu avec P lui-même.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 20),
            jsonb_build_object('x', 100, 'y', 180),
            jsonb_build_object('x', 40, 'y', 100, 'label', $$M$$),
            jsonb_build_object('x', 160, 'y', 100, 'label', $$M'$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(2,3))
        )
      ),
      jsonb_build_object(
        'heading', $$Symétrie centrale$$,
        'body', $$Le symétrique d'un point M par rapport à un point O est le point M' tel que O soit le milieu du segment [MM']. Contrairement à la symétrie axiale, la symétrie centrale ne « retourne » pas la figure : elle la fait pivoter d'un demi-tour autour du centre O.$$,
        'highlights', array[$$symétrie centrale$$, $$milieu$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$M' est le symétrique de M par rapport au point O si O est le milieu du segment [MM'], c'est-à-dire si OM = OM' et si M, O, M' sont alignés.$$),
        'example', jsonb_build_object('statement', $$Dans un repère, O(0 ; 0) est un centre de symétrie. Un point M a pour coordonnées (3 ; 5). Donne les coordonnées de son symétrique M' par rapport à O.$$, 'solution', $$Comme O est le milieu de [MM'] et que O est l'origine, les coordonnées de M' sont les opposées de celles de M : M'(−3 ; −5).$$),
        'fixation', jsonb_build_object('question', $$Un point A est tel que OA = 6,2 cm, où O est un centre de symétrie. Donne la distance OA', où A' est le symétrique de A par rapport à O.$$, 'solution', $$Comme O est le milieu de [AA'], OA' = OA = 6,2 cm.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 100, 'label', $$O$$),
            jsonb_build_object('x', 40, 'y', 60, 'label', $$M$$),
            jsonb_build_object('x', 160, 'y', 140, 'label', $$M'$$)
          ),
          'segments', jsonb_build_array(),
          'dashedSegments', jsonb_build_array(jsonb_build_array(1,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Translation et image d'une figure$$,
        'body', $$La translation associée à un vecteur u déplace chaque point M du plan vers un point M' tel que le vecteur MM' soit égal à u. Contrairement aux deux symétries, une translation n'a ni axe ni centre fixe : tous les points se déplacent de la même façon, dans la même direction.$$,
        'highlights', array[$$translation$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$M' est l'image de M par la translation de vecteur u si le vecteur MM' est égal à u. Dans un repère, si u a pour coordonnées (a ; b) et M a pour coordonnées (xM ; yM), alors M' a pour coordonnées (xM + a ; yM + b).$$),
        'example', jsonb_build_object('statement', $$Dans un repère, la translation associée au vecteur u(3 ; −2) transforme le point M(1 ; 4) en un point M'. Donne les coordonnées de M'.$$, 'solution', $$M' a pour coordonnées (1+3 ; 4+(−2)), soit M'(4 ; 2).$$),
        'fixation', jsonb_build_object('question', $$Dans un repère, la translation associée au vecteur v(−4 ; 5) transforme le point N(2 ; −1) en un point N'. Donne les coordonnées de N'.$$, 'solution', $$N' a pour coordonnées (2+(−4) ; −1+5), soit N'(−2 ; 4).$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés conservées$$,
        'body', $$La symétrie axiale, la symétrie centrale et la translation sont trois transformations qui conservent toutes les longueurs, les angles, les aires, l'alignement des points et le parallélisme des droites. Elles se distinguent seulement par le sens : la symétrie axiale retourne la figure comme dans un miroir, alors que la symétrie centrale et la translation conservent son sens.$$,
        'highlights', array[$$propriétés conservées$$, $$sens$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les trois transformations conservent longueurs, angles, aires, alignement et parallélisme. Elles transforment un segment en un segment de même longueur, une droite en une droite, et deux droites parallèles en deux droites encore parallèles.$$),
        'example', jsonb_build_object('statement', $$Un triangle ABC a une aire de 18 cm². Quelle est l'aire de son image par une symétrie centrale ?$$, 'solution', $$La symétrie centrale conserve les aires, donc l'image du triangle a aussi une aire de 18 cm².$$),
        'fixation', jsonb_build_object('question', $$Un segment [PQ] mesure 9,4 cm. Quelle est la longueur de son image par une translation ?$$, 'solution', $$La translation conserve les longueurs, donc l'image de [PQ] mesure aussi 9,4 cm.$$),
        'table', jsonb_build_object(
          'headers', array[$$Propriété$$, $$Symétrie axiale$$, $$Symétrie centrale$$, $$Translation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Longueurs$$, $$conservées$$, $$conservées$$, $$conservées$$),
            jsonb_build_array($$Angles$$, $$conservés$$, $$conservés$$, $$conservés$$),
            jsonb_build_array($$Aires$$, $$conservées$$, $$conservées$$, $$conservées$$),
            jsonb_build_array($$Parallélisme$$, $$conservé$$, $$conservé$$, $$conservé$$),
            jsonb_build_array($$Sens de la figure$$, $$inversé$$, $$conservé$$, $$conservé$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un tisserand crée un motif triangulaire ABC d'aire 24 cm², qu'il reproduit trois fois sur un pagne : une première fois par symétrie axiale par rapport au bord du tissu, une deuxième fois par symétrie centrale par rapport à un point O du tissu, et une troisième fois par translation associée à un vecteur u.$$,
      'questions', array[
        $$Donne l'aire de chacune des trois reproductions du motif, en justifiant à l'aide des propriétés conservées.$$,
        $$Parmi les trois reproductions, laquelle apparaît « retournée » comme dans un miroir par rapport au motif original ? Justifie.$$,
        $$Le tisserand affirme que les trois reproductions ont aussi le même périmètre que le motif original. A-t-il raison ? Justifie à l'aide des propriétés conservées.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un point R est situé à 4,8 cm d'une droite (d), perpendiculairement. Où se situe son symétrique R' par rapport à (d) ?$$,
      'hint', $$Relis la définition : (d) doit être la médiatrice de [RR'].$$,
      'expected', $$R' se trouve de l'autre côté de (d), également à 4,8 cm, sur la même perpendiculaire à (d).$$
    ),
    jsonb_build_object(
      'question', $$Dans un repère, O(0 ; 0) est un centre de symétrie. Un point B a pour coordonnées (−4 ; 7). Donne les coordonnées de son symétrique B' par rapport à O.$$,
      'hint', $$Les coordonnées du symétrique par rapport à l'origine sont les opposées des coordonnées de départ.$$,
      'expected', $$B' a pour coordonnées (4 ; −7).$$
    ),
    jsonb_build_object(
      'question', $$Dans un repère, la translation associée au vecteur w(5 ; −3) transforme le point C(−2 ; 6) en un point C'. Donne les coordonnées de C'.$$,
      'hint', $$Ajoute les coordonnées du vecteur à celles du point de départ.$$,
      'expected', $$C' a pour coordonnées (−2+5 ; 6+(−3)), soit C'(3 ; 3).$$
    ),
    jsonb_build_object(
      'question', $$Un angle mesure 72°. Donne la mesure de son image par une symétrie axiale, puis explique si le sens de l'angle est conservé ou inversé.$$,
      'hint', $$Relis le tableau des propriétés conservées : les angles gardent leur mesure, mais la symétrie axiale inverse le sens.$$,
      'expected', $$L'image de l'angle mesure encore 72° (les angles sont conservés), mais son sens est inversé, comme dans un miroir.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-symetries-translations';
