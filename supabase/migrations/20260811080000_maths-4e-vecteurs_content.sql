-- Same CourseContentV2 shape as 20260811000000_maths-4e-nombres-decimaux-
-- relatifs_content.sql (see that file's header for sourcing note: ecole-
-- ci.org unreachable behind its login wall, so this is original fallback
-- content from standard Ivorian/French 4ème mathématiques programme
-- knowledge, Leçon "Vecteurs"). Deliberately more foundational than the
-- 3ème vecteurs lesson (relation de Chasles avancée, colinéarité,
-- orthogonalité) already in the catalog: here the focus is la notion de
-- vecteur associée à une translation, l'égalité de vecteurs, une première
-- somme géométrique et les coordonnées dans un repère. Every sentence,
-- example and exercise is an original composition. Diagram: a generic
-- parallelogram illustrating two equal vectors, own coordinates.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur un jeu de dames traditionnel, un joueur déplace tous ses pions de trois cases vers la droite et deux cases vers le haut, en une seule fois. Ce déplacement a une direction, un sens et une longueur bien précis, et il est exactement le même pour chaque pion. Pour décrire ce genre de déplacement de manière rigoureuse, les mathématiciens utilisent un objet appelé vecteur.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vecteur associé à une translation$$,
        'body', $$Une translation est un déplacement qui fait glisser tous les points d'une figure dans la même direction, le même sens et sur la même longueur. Le vecteur AB représente exactement ce déplacement : il indique comment passer du point A au point B.$$,
        'highlights', array[$$translation$$, $$vecteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$À tout couple de points (A, B) est associé un vecteur, noté AB, caractérisé par sa direction (la droite (AB)), son sens (de A vers B) et sa longueur (la distance AB). La translation qui transforme A en B est dite associée au vecteur AB.$$),
        'example', jsonb_build_object('statement', $$La translation qui transforme A en B est associée au vecteur AB. Cette même translation transforme un point C en un point D. Que peut-on dire des vecteurs AB et CD ?$$, 'solution', $$Une translation déplace tous les points de la même façon, donc le vecteur CD est le même déplacement que AB : les vecteurs AB et CD sont égaux.$$),
        'fixation', jsonb_build_object('question', $$Une translation transforme E en F. Comment appelle-t-on le vecteur qui décrit ce déplacement ?$$, 'solution', $$C'est le vecteur EF, associé à cette translation.$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs égaux$$,
        'body', $$Deux vecteurs sont égaux lorsqu'ils ont la même direction, le même sens et la même longueur. Quand A, B, C et D ne sont pas alignés, cela revient à dire que ABDC est un parallélogramme.$$,
        'highlights', array[$$vecteurs égaux$$, $$parallélogramme$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les vecteurs AB et CD sont égaux si et seulement si ils ont la même direction, le même sens et la même longueur, ce qui équivaut, lorsque les points ne sont pas alignés, à dire que ABDC est un parallélogramme.$$),
        'example', jsonb_build_object('statement', $$ABDC est un parallélogramme. Que peut-on dire des vecteurs AB et CD ?$$, 'solution', $$Comme ABDC est un parallélogramme, les côtés [AB] et [CD] sont parallèles et de même longueur, avec le même sens : les vecteurs AB et CD sont égaux.$$),
        'fixation', jsonb_build_object('question', $$On sait que les vecteurs GH et IJ sont égaux, avec G, H, I, J non alignés. Que peut-on en déduire pour le quadrilatère GHJI ?$$, 'solution', $$Comme GH et IJ sont égaux, le quadrilatère GHJI est un parallélogramme.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(220, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 30, 'y', 140, 'label', $$A$$),
            jsonb_build_object('x', 150, 'y', 140, 'label', $$B$$),
            jsonb_build_object('x', 70, 'y', 40, 'label', $$C$$),
            jsonb_build_object('x', 190, 'y', 40, 'label', $$D$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(2,3)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,2), jsonb_build_array(1,3))
        )
      ),
      jsonb_build_object(
        'heading', $$Somme de deux vecteurs$$,
        'body', $$Enchaîner deux translations revient à en effectuer une seule, qui va directement du point de départ au point d'arrivée final. Le vecteur de cette translation unique est la somme des deux vecteurs des translations enchaînées.$$,
        'highlights', array[$$somme de vecteurs$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour tous points A, B et C : AB + BC = AC. Cette égalité s'appelle la relation de Chasles.$$),
        'example', jsonb_build_object('statement', $$Une première translation associée au vecteur PQ transforme P en Q, puis une deuxième associée au vecteur QR transforme Q en R. Quel est le vecteur de la translation qui transforme directement P en R ?$$, 'solution', $$D'après la relation de Chasles, PQ + QR = PR : c'est le vecteur PR.$$),
        'fixation', jsonb_build_object('question', $$Simplifie l'écriture MN + NO.$$, 'solution', $$D'après la relation de Chasles, MN + NO = MO.$$)
      ),
      jsonb_build_object(
        'heading', $$Coordonnées d'un vecteur dans un repère$$,
        'body', $$Dans un repère du plan, chaque vecteur AB a des coordonnées, qui s'obtiennent en soustrayant les coordonnées de A à celles de B. Ces coordonnées permettent de calculer avec les vecteurs sans avoir besoin de figure.$$,
        'highlights', array[$$coordonnées d'un vecteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Dans un repère, si A a pour coordonnées (xA ; yA) et B a pour coordonnées (xB ; yB), alors le vecteur AB a pour coordonnées (xB − xA ; yB − yA).$$),
        'example', jsonb_build_object('statement', $$Dans un repère, A(2 ; 3) et B(5 ; 7). Donne les coordonnées du vecteur AB.$$, 'solution', $$Les coordonnées de AB sont (5−2 ; 7−3), soit (3 ; 4).$$),
        'fixation', jsonb_build_object('question', $$Dans un repère, C(−1 ; 4) et D(3 ; −2). Donne les coordonnées du vecteur CD.$$, 'solution', $$Les coordonnées de CD sont (3−(−1) ; −2−4), soit (4 ; −6).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un repère associé à un plan de quartier, une pharmacie est au point A(1 ; 2) et une école au point B(6 ; 5). Un livreur part de la pharmacie A, effectue le déplacement associé au vecteur AB pour rejoindre l'école B, puis un second déplacement associé au vecteur BC pour rejoindre un dépôt C(9 ; 1).$$,
      'questions', array[
        $$Calcule les coordonnées du vecteur AB.$$,
        $$Calcule les coordonnées du vecteur BC.$$,
        $$En utilisant la relation de Chasles, donne les coordonnées du vecteur AC, puis vérifie ce résultat en calculant directement les coordonnées de AC à partir de A et C.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une translation transforme le point S en un point T. Comment appelle-t-on le vecteur qui décrit ce déplacement, et quelles sont ses trois caractéristiques ?$$,
      'hint', $$Relis la définition du vecteur associé à une translation.$$,
      'expected', $$C'est le vecteur ST, caractérisé par sa direction, son sens (de S vers T) et sa longueur ST.$$
    ),
    jsonb_build_object(
      'question', $$WXZY est un parallélogramme. Que peut-on dire des vecteurs WX et YZ ?$$,
      'hint', $$Relis la propriété reliant vecteurs égaux et parallélogramme.$$,
      'expected', $$Comme WXZY est un parallélogramme, les vecteurs WX et YZ sont égaux.$$
    ),
    jsonb_build_object(
      'question', $$Simplifie l'écriture AB + BC + CD.$$,
      'hint', $$Applique deux fois la relation de Chasles.$$,
      'expected', $$AB+BC = AC (Chasles), puis AC+CD = AD (Chasles). Donc AB+BC+CD = AD.$$
    ),
    jsonb_build_object(
      'question', $$Dans un repère, E(0 ; −3) et F(4 ; 2). Donne les coordonnées du vecteur EF.$$,
      'hint', $$Soustrais les coordonnées de E à celles de F.$$,
      'expected', $$Les coordonnées de EF sont (4−0 ; 2−(−3)), soit (4 ; 5).$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-vecteurs';
