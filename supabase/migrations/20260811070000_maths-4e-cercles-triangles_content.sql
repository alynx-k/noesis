-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths leçon 6 Cercles et
-- Triangles" (Collège Numérique, Thème "Géométrie du plan", Leçon 6,
-- course id 1990, resource id 16176, downloaded from coll.ecole-ci.org and
-- read directly). The real lesson's actual structure is: (I) positions
-- relatives d'une droite et d'un cercle (sécante/tangente/disjointe) plus
-- the definition and construction of a tangent from an external point,
-- (II) droite des milieux in a triangle, and (III) points remarquables —
-- orthocentre, centre de gravité, cercle inscrit — a different toolkit
-- from the earlier fallback, which centered on cercle circonscrit and
-- triangle rectangle inscrit (neither of which appears in this real PDF).
-- Every sentence, example and exercise below is an original composition
-- in our own wording — no sentence is copied verbatim from the source
-- PDF. Diagrams: a generic circle with a tangent line (right angle at the
-- point of contact), and a generic triangle with its droite des milieux,
-- own coordinates.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir remporté un tournoi inter-établissements, les joueurs d'un collège reçoivent des médailles gravées de figures géométriques faites de cercles et de droites. Des élèves de 4ème veulent reproduire fidèlement ces figures, mais pour cela, ils doivent d'abord savoir reconnaître comment une droite peut se positionner par rapport à un cercle, et comment construire précisément une tangente.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Positions relatives d'une droite et d'un cercle$$,
        'body', $$Pour un cercle de centre O et de rayon r, et une droite (D), on compare la distance OH (H étant le pied de la perpendiculaire à (D) issue de O) au rayon r. Trois cas se présentent : si OH est plus petite que r, la droite coupe le cercle en deux points (elle est sécante) ; si OH est égale à r, elle le touche en un seul point (elle est tangente) ; si OH est plus grande que r, elle ne le rencontre pas (elle est disjointe du cercle).$$,
        'highlights', array[$$sécante$$, $$tangente$$, $$disjointe$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Si OH < r, (D) et le cercle sont sécants (deux points communs). Si OH = r, ils sont tangents (un seul point commun). Si OH > r, ils sont disjoints (aucun point commun). Chacune de ces propriétés admet aussi sa réciproque.$$),
        'example', jsonb_build_object('statement', $$Un cercle de centre I a un rayon de 3 cm. Une droite (L) est telle qu'un point K de (L) vérifie IK = 5 cm et (IK) est perpendiculaire à (L). Détermine la position relative de (L) et du cercle.$$, 'solution', $$La distance de I à (L) est IK = 5 cm, or 5 > 3, donc (L) et le cercle sont disjoints.$$),
        'fixation', jsonb_build_object('question', $$Un cercle de centre O a un rayon de 4,5 cm. Une droite (D) est telle que la distance de O à (D) vaut 4,5 cm. Quelle est la position relative de (D) et du cercle ?$$, 'solution', $$La distance de O à (D) est égale au rayon (4,5 cm = 4,5 cm), donc (D) est tangente au cercle.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'circle', jsonb_build_object('cx', 100, 'cy', 100, 'r', 60),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 100, 'label', $$O$$),
            jsonb_build_object('x', 100, 'y', 40, 'label', $$H$$),
            jsonb_build_object('x', 20, 'y', 40, 'label', $$$$),
            jsonb_build_object('x', 180, 'y', 40, 'label', $$$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(2,3)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,1)),
          'rightAngleAt', jsonb_build_array(1)
        )
      ),
      jsonb_build_object(
        'heading', $$Droite des milieux dans un triangle$$,
        'body', $$Dans un triangle, la droite qui joint les milieux de deux côtés est toujours parallèle au troisième côté, et sa longueur en vaut exactement la moitié. Cette propriété se retourne aussi : si une droite passe par le milieu d'un côté et qu'elle est parallèle à un deuxième côté, alors elle passe forcément par le milieu du troisième côté.$$,
        'highlights', array[$$droite des milieux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété et réciproque$$, 'text', $$Dans un triangle ABC, si C' est le milieu de [AB] et B' le milieu de [AC], alors (B'C') est parallèle à (BC) et B'C' = BC/2. Réciproquement, si une droite passe par le milieu d'un côté et est parallèle au support d'un autre côté, alors elle passe par le milieu du troisième côté.$$),
        'example', jsonb_build_object('statement', $$Dans un triangle ABC, D est le milieu de [AB], E est le milieu de [AC], et BC = 18 cm. Calcule DE et justifie que (DE) est parallèle à (BC).$$, 'solution', $$D et E étant les milieux de deux côtés, la droite (DE) est parallèle à (BC) d'après le théorème des milieux, et DE = BC/2 = 18/2 = 9 cm.$$),
        'fixation', jsonb_build_object('question', $$Dans un triangle rectangle en B, la médiatrice (D) de [BC] coupe l'hypoténuse [AC] en un point I. Justifie que I est le milieu de [AC].$$, 'solution', $$(AB) et (D) sont toutes deux perpendiculaires à (BC), donc elles sont parallèles. Comme (D) passe par le milieu de [BC] et est parallèle à (AB), elle passe par le milieu de [AC] ; or (D) passe par I sur [AC], donc I est ce milieu.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 20, 'label', $$A$$),
            jsonb_build_object('x', 20, 'y', 140, 'label', $$B$$),
            jsonb_build_object('x', 180, 'y', 140, 'label', $$C$$),
            jsonb_build_object('x', 60, 'y', 80, 'label', $$D$$),
            jsonb_build_object('x', 140, 'y', 80, 'label', $$E$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,0), jsonb_build_array(3,4))
        )
      ),
      jsonb_build_object(
        'heading', $$Hauteurs, orthocentre, médianes et centre de gravité$$,
        'body', $$Une hauteur d'un triangle est la droite passant par un sommet et perpendiculaire au côté opposé ; les trois hauteurs se coupent toujours en un même point, l'orthocentre. Une médiane relie un sommet au milieu du côté opposé ; les trois médianes se coupent elles aussi en un même point, le centre de gravité, situé aux deux tiers de chaque médiane à partir du sommet.$$,
        'highlights', array[$$orthocentre$$, $$centre de gravité$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Les trois hauteurs d'un triangle sont concourantes en un point appelé orthocentre. Les trois médianes d'un triangle sont concourantes en un point appelé centre de gravité, situé aux 2/3 de chaque médiane à partir du sommet : si G est le centre de gravité et (AA') une médiane, alors AG = (2/3)×AA'.$$),
        'example', jsonb_build_object('statement', $$G est le centre de gravité d'un triangle ABC, et la médiane issue de A mesure AA' = 12 cm. Calcule AG.$$, 'solution', $$AG = (2/3)×AA' = (2/3)×12 = 8 cm.$$),
        'fixation', jsonb_build_object('question', $$G est le centre de gravité d'un triangle DEF, et la médiane issue de D mesure DD' = 9 cm. Calcule DG.$$, 'solution', $$DG = (2/3)×DD' = (2/3)×9 = 6 cm.$$)
      ),
      jsonb_build_object(
        'heading', $$Bissectrices et cercle inscrit$$,
        'body', $$Le cercle inscrit dans un triangle est le cercle intérieur au triangle, tangent aux supports de ses trois côtés. Ce cercle existe toujours et son centre est unique : c'est le point de concours des trois bissectrices des angles du triangle.$$,
        'highlights', array[$$cercle inscrit$$, $$bissectrices$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les trois bissectrices des angles d'un triangle sont concourantes ; leur point de concours est le centre du cercle inscrit dans ce triangle, tangent aux supports des trois côtés.$$),
        'example', jsonb_build_object('statement', $$I est le point de concours des bissectrices d'un triangle ABC. Que représente le point I pour ce triangle ?$$, 'solution', $$I est le centre du cercle inscrit dans le triangle ABC, c'est-à-dire le cercle tangent aux supports des trois côtés du triangle.$$),
        'fixation', jsonb_build_object('question', $$Pour construire le cercle inscrit dans un triangle MNP, quelles droites suffit-il de tracer pour situer son centre ?$$, 'solution', $$Il suffit de tracer les bissectrices d'au moins deux angles du triangle MNP ; leur point d'intersection est le centre du cercle inscrit.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un géomètre a réalisé un schéma pour calculer la hauteur d'un immeuble, avec les points B, F, G, A et C tels que G est le milieu de [CA] et F est le milieu de [BA], et où l'on sait que [GF] et [BC] sont deux segments liés par le théorème des milieux.$$,
      'questions', array[
        $$Rappelle la propriété qui permet d'affirmer que les supports de [GF] et de [BC] sont parallèles.$$,
        $$Sachant que GF = 21 m, calcule la hauteur BC de l'immeuble à l'aide du théorème des milieux.$$,
        $$Explique pourquoi il suffisait de mesurer GF, plus accessible depuis le sol, pour connaître BC.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un cercle de centre E a pour rayon 3,5 cm. Une droite (T) est telle que la distance de E à (T) vaut 3,5 cm. Quelle est la position relative de (T) et du cercle ?$$,
      'hint', $$Compare la distance du centre à la droite avec le rayon du cercle.$$,
      'expected', $$La distance de E à (T) est égale au rayon (3,5 cm = 3,5 cm), donc (T) est tangente au cercle.$$
    ),
    jsonb_build_object(
      'question', $$Dans un triangle GHK, M est le milieu de [GH] et N est le milieu de [GK], avec HK = 22 cm. Calcule MN.$$,
      'hint', $$Applique le théorème des milieux : le segment joignant les milieux vaut la moitié du troisième côté.$$,
      'expected', $$D'après le théorème des milieux, MN = HK/2 = 22/2 = 11 cm.$$
    ),
    jsonb_build_object(
      'question', $$G est le centre de gravité d'un triangle XYZ, et la médiane issue de X mesure XX' = 15 cm. Calcule XG.$$,
      'hint', $$Relis la propriété : le centre de gravité est situé aux deux tiers de chaque médiane à partir du sommet.$$,
      'expected', $$XG = (2/3)×XX' = (2/3)×15 = 10 cm.$$
    ),
    jsonb_build_object(
      'question', $$Un point I est le centre du cercle inscrit dans un triangle RST. Quelles droites remarquables de ce triangle passent nécessairement par I ? Justifie.$$,
      'hint', $$Relis la définition du cercle inscrit et du point de concours qui en est le centre.$$,
      'expected', $$Les trois bissectrices des angles du triangle RST passent par I, car I est justement leur point de concours et le centre du cercle inscrit dans RST.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-cercles-triangles';
