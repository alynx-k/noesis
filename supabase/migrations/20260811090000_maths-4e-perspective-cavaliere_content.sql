-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths leçon 9 Perspective
-- Cavaliere" (Collège Numérique, Thème "Géométrie dans l'espace", Leçon
-- 11, course id 1987, resource id 16140, downloaded from coll.ecole-ci.org
-- and read directly). The real lesson opens with vocabulaire (plan
-- vertical de face/profil, plan horizontal, angle d'inclinaison des
-- fuyantes) before stating the five rules and applying them with an
-- explicit coefficient c and angle α on a worked example — content this
-- rewrite follows closely in structure while composing all wording
-- originally. Every sentence, example and exercise below is an original
-- composition — no sentence is copied verbatim from the source PDF.
-- Diagram: a generic pavé droit (pseudo-3D, dashed hidden edges), own
-- coordinates, reused from the earlier version since it already matches
-- the real PDF's cube/pavé droit illustrations.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite d'entreprise, des élèves de 4ème découvrent une usine qui fabrique des savons en forme de pavé droit. De retour en classe, leur professeur leur demande de représenter ce savon sur une feuille, puis constate qu'aucun des dessins produits ne respecte les règles de la perspective cavalière. Curieux, les élèves décident d'étudier précisément ces règles avant de recommencer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulaire de la perspective cavalière$$,
        'body', $$La perspective cavalière est une technique de dessin qui représente un solide de l'espace sur une feuille plane, tout en laissant deviner ses parties cachées. Sur un tel dessin, on distingue le plan vertical de face (dessiné sans déformation), le plan vertical de profil et le plan horizontal (représentés par des parallélogrammes), ainsi que les arêtes fuyantes, inclinées d'un certain angle par rapport à l'horizontale du dessin.$$,
        'highlights', array[$$plan vertical de face$$, $$plan horizontal$$, $$fuyantes$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Le plan vertical de face est dessiné en vraie grandeur (souvent un carré ou un rectangle). Les plans vertical de profil et horizontal sont représentés par des parallélogrammes. Les arêtes fuyantes, à supports perpendiculaires au plan vertical de face, sont inclinées de l'angle α (l'inclinaison des fuyantes) par rapport à l'horizontale.$$),
        'example', jsonb_build_object('statement', $$Sur le dessin d'un pavé droit LKJIEFGH (I,J,K,L à l'arrière et E,F,G,H à l'avant), le parallélogramme EHGF est dessiné sans déformation. Quel plan représente-t-il ?$$, 'solution', $$EHGF est le plan vertical de face, car c'est celui qui est dessiné sans déformation, en vraie grandeur.$$),
        'fixation', jsonb_build_object('question', $$Sur ce même pavé droit, le parallélogramme LKJI se trouve tout en haut du dessin. Quel type de plan représente-t-il ?$$, 'solution', $$LKJI représente un plan horizontal, car il correspond à la face du dessus du solide.$$)
      ),
      jsonb_build_object(
        'heading', $$Les cinq règles de la perspective cavalière$$,
        'body', $$Dessiner en perspective cavalière obéit à cinq règles précises : les arêtes parallèles sur l'objet restent parallèles sur le dessin ; toute face située dans le plan vertical de face est dessinée sans déformation ; les arêtes cachées sont en pointillés ; les arêtes perpendiculaires au plan vertical de face sont représentées par des fuyantes parallèles inclinées d'un même angle α ; et ces fuyantes sont réduites selon un même coefficient c.$$,
        'highlights', array[$$règles de la perspective cavalière$$, $$coefficient de réduction$$]::text[],
        'property', jsonb_build_object('label', $$Les cinq règles$$, 'text', $$1) Des arêtes parallèles sur l'objet restent représentées par des segments parallèles. 2) Une face du plan vertical de face est dessinée sans déformation. 3) Les arêtes cachées sont en pointillés. 4) Les arêtes perpendiculaires au plan vertical de face sont des fuyantes parallèles, inclinées d'un même angle α par rapport à l'horizontale. 5) Les longueurs de ces fuyantes sont multipliées par un même coefficient de réduction c.$$),
        'example', jsonb_build_object('statement', $$Vrai ou faux : « les arêtes cachées d'un solide sont représentées par des traits continus en perspective cavalière ».$$, 'solution', $$Faux : d'après la règle 3, les arêtes cachées sont représentées par des traits en pointillés, pas des traits continus.$$),
        'fixation', jsonb_build_object('question', $$Vrai ou faux : « toute face de l'objet située dans le plan vertical de face est représentée sans déformation ».$$, 'solution', $$Vrai : c'est exactement la règle 2 de la perspective cavalière.$$)
      ),
      jsonb_build_object(
        'heading', $$Représenter un pavé droit ou un cube$$,
        'body', $$Pour représenter un pavé droit, on dessine d'abord sa face avant en vraie grandeur, puis on trace depuis chacun de ses sommets visibles une fuyante de même angle et de même coefficient, avant de relier leurs extrémités pour former la face arrière ; les arêtes qui aboutissent au sommet le plus caché sont ensuite repassées en pointillés.$$,
        'highlights', array[$$pavé droit$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$1) Dessiner la face avant en vraie grandeur. 2) Tracer, depuis chaque sommet visible, une fuyante de même angle α et de même coefficient c. 3) Relier les extrémités des fuyantes pour former la face arrière. 4) Repasser en pointillés les arêtes cachées, celles qui aboutissent au sommet arrière invisible depuis l'avant.$$),
        'example', jsonb_build_object('statement', $$Un pavé droit a pour arête de profondeur réelle 8 cm. Avec un coefficient de réduction c = 0,5, quelle longueur doit-on tracer pour représenter cette arête en fuyante ?$$, 'solution', $$Longueur tracée = c × longueur réelle = 0,5 × 8 = 4 cm.$$),
        'fixation', jsonb_build_object('question', $$Combien d'arêtes d'un pavé droit sont représentées en pointillés sur un dessin en perspective cavalière ?$$, 'solution', $$Trois arêtes sont cachées : celles qui aboutissent au sommet arrière, invisible depuis l'avant du solide.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(220, 190),
          'points', jsonb_build_array(
            jsonb_build_object('x', 40, 'y', 150, 'label', $$E$$),
            jsonb_build_object('x', 140, 'y', 150, 'label', $$F$$),
            jsonb_build_object('x', 140, 'y', 70, 'label', $$G$$),
            jsonb_build_object('x', 40, 'y', 70, 'label', $$H$$),
            jsonb_build_object('x', 75, 'y', 115, 'label', $$I$$),
            jsonb_build_object('x', 175, 'y', 115, 'label', $$J$$),
            jsonb_build_object('x', 175, 'y', 35, 'label', $$K$$),
            jsonb_build_object('x', 75, 'y', 35, 'label', $$L$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,3), jsonb_build_array(3,0), jsonb_build_array(3,7), jsonb_build_array(2,6), jsonb_build_array(7,6), jsonb_build_array(1,5), jsonb_build_array(5,6)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,4), jsonb_build_array(4,5), jsonb_build_array(4,7))
        )
      ),
      jsonb_build_object(
        'heading', $$Calculer avec le coefficient de réduction$$,
        'body', $$Le coefficient de réduction relie toujours la longueur réelle d'une arête fuyante à la longueur tracée sur le dessin : la longueur dessinée s'obtient en multipliant la longueur réelle par ce coefficient, et inversement on retrouve la longueur réelle en divisant la longueur dessinée par le coefficient.$$,
        'highlights', array[$$coefficient de réduction$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$Longueur dessinée = c × longueur réelle, donc longueur réelle = longueur dessinée ÷ c.$$),
        'example', jsonb_build_object('statement', $$Une boîte a pour face avant IJ = 9 cm et IF = 6 cm, et une arête fuyante réelle [IK] = 6 cm. Avec c = 0,5, calcule les longueurs à tracer pour IJ, IF et IK.$$, 'solution', $$La face avant est dessinée en vraie grandeur : IJ = 9 cm et IF = 6 cm restent inchangées. L'arête fuyante [IK] est réduite : IK dessinée = 0,5×6 = 3 cm.$$),
        'fixation', jsonb_build_object('question', $$Sur un dessin en perspective cavalière de coefficient c = 0,25, une fuyante est tracée avec une longueur de 3 cm. Calcule sa longueur réelle.$$, 'solution', $$Longueur réelle = longueur dessinée ÷ c = 3 ÷ 0,25 = 12 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour un concours de mathématiques, des candidats doivent représenter en perspective cavalière une boîte à chaussures de forme pavé droit. La face avant IJFH mesure IJ = 12 cm et IH = 8 cm, et l'arête de profondeur [IK] mesure 10 cm. On donne le coefficient de réduction c = 0,4 et l'angle d'inclinaison des fuyantes α = 35°.$$,
      'questions', array[
        $$Donne les dimensions à tracer pour la face avant IJFH, sachant qu'elle est dessinée en vraie grandeur.$$,
        $$Calcule la longueur à tracer pour l'arête fuyante [IK].$$,
        $$Un candidat affirme que la longueur des fuyantes sera de 4 cm : a-t-il raison ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Vrai ou faux : « les arêtes de l'objet perpendiculaires au plan vertical de face sont représentées par des segments à supports parallèles ».$$,
      'hint', $$Relis la règle 4 des cinq règles de la perspective cavalière.$$,
      'expected', $$Vrai : ces arêtes sont représentées par des fuyantes, toutes parallèles entre elles et inclinées du même angle.$$
    ),
    jsonb_build_object(
      'question', $$Un pavé droit a une profondeur réelle de 14 cm. Avec un coefficient de réduction c = 0,5, quelle longueur doit-on tracer pour l'arête fuyante correspondante ?$$,
      'hint', $$Utilise la formule : longueur dessinée = c × longueur réelle.$$,
      'expected', $$Longueur dessinée = 0,5 × 14 = 7 cm.$$
    ),
    jsonb_build_object(
      'question', $$Sur un dessin en perspective cavalière de coefficient c = 0,75, une fuyante est tracée avec une longueur de 6 cm. Calcule sa longueur réelle.$$,
      'hint', $$Utilise la formule inverse : longueur réelle = longueur dessinée ÷ c.$$,
      'expected', $$Longueur réelle = 6 ÷ 0,75 = 8 cm.$$
    ),
    jsonb_build_object(
      'question', $$Sur le dessin d'un cube en perspective cavalière, quelle face est dessinée sans déformation, et pourquoi ?$$,
      'hint', $$Relis la règle 2 sur le plan vertical de face.$$,
      'expected', $$La face située dans le plan vertical de face est dessinée sans déformation, car la règle 2 impose de la représenter en vraie grandeur, contrairement aux faces fuyantes qui sont inclinées et réduites.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-perspective-cavaliere';
