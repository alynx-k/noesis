-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2098: "Leçon8: Triangles"
-- (https://coll.ecole-ci.org/course/view.php?id=2098), resource id 17461.
-- Contenu réécrit à partir du PDF source (thème "Géométrie du plan",
-- programme officiel MENA) ; situation d'apprentissage, définitions,
-- formules et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 6ème du Lycée Moderne de Koumassi veulent acheter une nappe pour le bureau des professeurs. Leur chef de classe revient avec un échantillon décoré de nombreux motifs triangulaires. Fascinés par ces figures géométriques, les élèves décident de faire des recherches sur les triangles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Triangle : vocabulaire et construction$$,
        'body', $$Un triangle ABC a pour sommets A, B, C et pour côtés les segments [AB], [BC] et [AC]. Le côté [BC] est opposé au sommet A (et réciproquement). Pour construire un triangle ABC connaissant ses trois côtés (ex. AB=4, AC=3, BC=6) : tracer [BC] à la règle, puis tracer un arc de cercle de centre B et de rayon 4, un autre de centre C et de rayon 3 ; leur point d'intersection est A.$$,
        'highlights', array[$$triangle ABC = BAC = CAB (même triangle)$$, $$construction : deux arcs de cercle centrés sur les extrémités du premier côté$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans un triangle EFG, quel est le côté opposé au sommet G ?$$, 'solution', $$Le côté [EF].$$)
      ),
      jsonb_build_object(
        'heading', $$Droites particulières du triangle$$,
        'body', $$La hauteur issue d'un sommet est la droite qui passe par ce sommet et qui est perpendiculaire au support du côté opposé. La médiane issue d'un sommet passe par ce sommet et par le milieu du côté opposé. La médiatrice d'un triangle est la médiatrice de l'un de ses côtés (passe par son milieu, perpendiculaire à son support).$$,
        'highlights', array[$$hauteur : perpendiculaire au côté opposé, passe par le sommet$$, $$médiane : passe par le sommet ET le milieu du côté opposé$$, $$médiatrice : médiatrice d'un côté (pas forcément liée à un sommet précis)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle différence entre la hauteur et la médiane issues d'un même sommet ?$$, 'solution', $$La hauteur est perpendiculaire au côté opposé (condition d'angle) ; la médiane passe par le milieu du côté opposé (condition de position) — elles ne coïncident pas en général.$$)
      ),
      jsonb_build_object(
        'heading', $$Triangles particuliers$$,
        'body', $$Un triangle rectangle a deux côtés de supports perpendiculaires ; le côté opposé à l'angle droit s'appelle l'hypoténuse. Un triangle isocèle a deux côtés de même longueur (le troisième est la base, le sommet commun aux deux côtés égaux est le sommet principal). Un triangle équilatéral a ses trois côtés de même longueur — il est donc automatiquement isocèle. Un triangle peut être à la fois rectangle et isocèle.$$,
        'highlights', array[$$rectangle : un angle droit, hypoténuse = côté opposé à l'angle droit$$, $$isocèle : 2 côtés égaux ; équilatéral : 3 côtés égaux (donc isocèle)$$]::text[],
        'example', jsonb_build_object('statement', $$MAN est rectangle en M, avec MA=5 et MN=3. Quelle est son hypoténuse ?$$, 'solution', $$[AN], le côté opposé à l'angle droit en M.$$),
        'fixation', jsonb_build_object('question', $$Un triangle équilatéral est-il toujours isocèle ?$$, 'solution', $$Oui : ayant ses trois côtés égaux, il a nécessairement deux côtés égaux, ce qui en fait un cas particulier de triangle isocèle.$$)
      ),
      jsonb_build_object(
        'heading', $$Périmètre et aire d'un triangle$$,
        'body', $$Le périmètre d'un triangle est la somme des longueurs de ses trois côtés : P = a + b + c. L'aire d'un triangle de base b et de hauteur h (relative à cette base) est 𝒜 = (b × h) / 2.$$,
        'highlights', array[$$P = a + b + c$$, $$𝒜 = (base × hauteur) / 2$$]::text[],
        'example', jsonb_build_object('statement', $$Un triangle PUR a pour côté PR=12,5 cm et une hauteur UH=6 cm issue de U. Calcule son aire.$$, 'solution', $$𝒜 = (PR × UH) / 2 = (12,5 × 6) / 2 = 37,5 cm².$$),
        'fixation', jsonb_build_object('question', $$Un triangle a des côtés de 7,5 cm, 10 cm et 12,5 cm. Quel est son périmètre ?$$, 'solution', $$P = 7,5 + 10 + 12,5 = 30 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève veut construire en vraie grandeur la « lunule » (tache claire à la base des ongles) à partir d'un triangle ABC, avec AB = 10 cm, un cercle de centre A et de rayon 6 cm, et un cercle de centre C et de rayon 8 cm dont l'intersection donne le point B.$$,
      'questions', array[
        $$Décris comment construire le point B à partir des deux arcs de cercle de centres A et C.$$,
        $$Sachant que AB=10, et que les deux arcs donnent AB et CB comme rayons (6 et 8), quelle relation remarquable relie 6, 8 et 10 (indice : 6²+8²=10²) ?$$,
        $$Quelle est la nature du triangle ABC ainsi obtenu ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'appelle-t-on l'hypoténuse d'un triangle rectangle ?$$,
      'hint', $$C'est un côté particulier, opposé à un angle particulier.$$,
      'expected', $$Le côté opposé à l'angle droit.$$
    ),
    jsonb_build_object(
      'question', $$Un triangle a pour côtés AB=15, BC=12 et AC=10. Calcule son périmètre.$$,
      'hint', $$Additionne les trois côtés.$$,
      'expected', $$P = 15 + 12 + 10 = 37.$$
    ),
    jsonb_build_object(
      'question', $$Un triangle a une base de 7 cm et une hauteur de 4 cm (relative à cette base). Calcule son aire.$$,
      'hint', $$Utilise 𝒜 = (base × hauteur) / 2.$$,
      'expected', $$𝒜 = (7 × 4) / 2 = 14 cm².$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la définition d'un triangle isocèle ?$$,
      'hint', $$C'est une question de longueurs de côtés.$$,
      'expected', $$Un triangle qui a deux côtés de même longueur.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-triangles';
