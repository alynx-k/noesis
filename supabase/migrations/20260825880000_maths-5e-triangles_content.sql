-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Géométrie du plan).
-- Cours : "Leçon 7 : Triangles". Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés,
-- valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La promotion 5ème d'un collège dispose d'une parcelle triangulaire équilatérale pour sa coopérative. Les six classes doivent avoir chacune la même superficie. Le professeur affirme qu'il suffirait de tracer la médiatrice de chaque côté. Les élèves cherchent à s'informer sur les droites particulières d'un triangle et à les construire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les quatre droites particulières d'un triangle$$,
        'body', $$Un triangle possède quatre types de droites remarquables, chacun au nombre de trois : la médiane (passe par un sommet et le milieu du côté opposé), la médiatrice d'un côté (perpendiculaire au côté en son milieu), la hauteur (passe par un sommet, perpendiculaire au côté opposé), et la bissectrice d'un angle (partage l'angle en deux angles égaux, passe par le sommet).$$,
        'highlights', array[$$médiane : sommet → milieu du côté opposé$$, $$médiatrice : perpendiculaire à un côté en son milieu$$, $$hauteur : sommet, perpendiculaire au côté opposé$$, $$bissectrice : partage un angle en deux parties égales$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle droite particulière d'un triangle est perpendiculaire à un côté et passe par son milieu, sans nécessairement passer par un sommet ?$$, 'solution', $$La médiatrice de ce côté.$$)
      ),
      jsonb_build_object(
        'heading', $$Triangles particuliers$$,
        'body', $$Un triangle isocèle possède un axe de symétrie (à la fois hauteur, médiane, bissectrice du sommet principal et médiatrice de la base) ; ses deux angles à la base sont égaux. Un triangle équilatéral possède trois axes de symétrie ; ses trois angles mesurent 60°. Un triangle rectangle possède deux angles complémentaires (dont la somme fait 90°). Réciproquement : deux angles égaux ⟹ isocèle ; trois angles égaux (ou un angle de 60° dans un isocèle) ⟹ équilatéral ; deux angles complémentaires ⟹ rectangle.$$,
        'highlights', array[$$isocèle : 1 axe de symétrie, angles à la base égaux$$, $$équilatéral : 3 axes de symétrie, tous les angles = 60°$$, $$rectangle : 2 angles complémentaires (somme = 90°)$$]::text[],
        'example', jsonb_build_object('statement', $$ABC est isocèle en A avec mes B = 65°. Trouve mes C.$$, 'solution', $$mes C = mes B = 65° (angles à la base égaux).$$),
        'fixation', jsonb_build_object('question', $$Un triangle a un angle droit et un angle de 40°. Quelle est la mesure du troisième angle ? De quel type de triangle s'agit-il ?$$, 'solution', $$50° (car 90+40+50=180) ; c'est un triangle rectangle.$$)
      ),
      jsonb_build_object(
        'heading', $$Inégalité triangulaire$$,
        'body', $$Dans tout triangle, la longueur de chaque côté est inférieure à la somme des longueurs des deux autres côtés. Si cette condition n'est pas respectée pour trois longueurs données, le triangle ne peut pas être construit.$$,
        'highlights', array[$$dans un triangle ABC : AB < AC+BC, AC < AB+BC, BC < AB+AC$$, $$condition non respectée → triangle impossible à construire$$]::text[],
        'example', jsonb_build_object('statement', $$Peut-on construire un triangle PQR avec PR=3cm, PQ=9cm, RQ=5cm ?$$, 'solution', $$Non, car PQ (9) n'est pas inférieur à PR+RQ (3+5=8) : l'inégalité triangulaire n'est pas respectée.$$),
        'fixation', jsonb_build_object('question', $$Peut-on construire un triangle avec des côtés de 7cm, 4cm et 5cm ?$$, 'solution', $$Oui : 7<4+5, 5<7+4, 4<7+5 — toutes les inégalités sont vérifiées.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un trésor a été caché au pied d'un baobab (aujourd'hui disparu) situé à égale distance d'une mare (M), d'un puits (P) et d'un rocher (R). Un élève de 5ème veut retrouver son emplacement en utilisant les propriétés du triangle PRM.$$,
      'questions', array[
        $$Nomme les droites particulières à construire pour retrouver l'emplacement du trésor.$$,
        $$Explique pourquoi le point d'intersection de ces droites est équidistant de M, P et R.$$,
        $$Indique où se trouve l'emplacement T du trésor.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de médianes possède un triangle ?$$,
      'hint', $$Une par sommet.$$,
      'expected', $$Trois.$$
    ),
    jsonb_build_object(
      'question', $$ABC est un triangle avec mes A=110° et mes B=30°. Calcule mes C.$$,
      'hint', $$La somme des trois angles vaut 180°.$$,
      'expected', $$180° - (110°+30°) = 40°.$$
    ),
    jsonb_build_object(
      'question', $$Un triangle équilatéral a-t-il un ou trois axes de symétrie ?$$,
      'hint', $$Il a plus d'axes qu'un triangle isocèle.$$,
      'expected', $$Trois axes de symétrie.$$
    ),
    jsonb_build_object(
      'question', $$Dans un triangle rectangle, si un angle mesure 30°, quelle est la mesure de l'autre angle aigu ?$$,
      'hint', $$Les deux angles aigus sont complémentaires (somme = 90°).$$,
      'expected', $$60°.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-triangles';
