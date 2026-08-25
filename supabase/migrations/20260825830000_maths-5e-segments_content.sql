-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Géométrie du plan).
-- Cours : "Leçon 5 : Segments". Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés,
-- valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un Conseil Municipal décide de construire une pompe d'eau potable pour deux villages voisins situés sur un même plateau. Pour éviter tout conflit, la pompe doit être installée à égale distance des deux villages. Des élèves de 5ème, sollicités par leur professeur, cherchent à déterminer les emplacements possibles de cette pompe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractérisation d'un segment$$,
        'body', $$Pour trois points A, B et M du plan : si M appartient au segment [AB], alors AM + MB = AB (propriété 1) ; réciproquement, si AM + MB = AB, alors M appartient à [AB] (propriété 2). Ces deux propriétés permettent de vérifier ou déduire l'appartenance d'un point à un segment.$$,
        'highlights', array[$$M ∈ [AB] ⟺ AM + MB = AB (double implication)$$]::text[],
        'example', jsonb_build_object('statement', $$P, Q, R sont trois points tels que PR=5, RQ=3, PQ=8. R appartient-il à [PQ] ?$$, 'solution', $$Oui, car PR + RQ = 5+3 = 8 = PQ.$$),
        'fixation', jsonb_build_object('question', $$[AB] mesure 7cm et M est un point de [AB] tel que AM=4cm. Calcule MB.$$, 'solution', $$MB = AB - AM = 7 - 4 = 3 cm.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractérisation de la médiatrice d'un segment$$,
        'body', $$Pour trois points A, B et M : si M appartient à la médiatrice de [AB], alors MA = MB (propriété 1) ; réciproquement, si MA = MB, alors M appartient à la médiatrice de [AB] (propriété 2). Autrement dit, un point est sur la médiatrice d'un segment si et seulement s'il est équidistant des deux extrémités de ce segment.$$,
        'highlights', array[$$M sur la médiatrice de [AB] ⟺ MA = MB$$]::text[],
        'example', jsonb_build_object('statement', $$Les points A, B et C appartiennent tous à la médiatrice du segment [RS]. Quelles égalités de distances peut-on écrire ?$$, 'solution', $$AR = AS ; BR = BS ; CR = CS.$$),
        'fixation', jsonb_build_object('question', $$Le point I est le milieu de la corde [AB] d'un cercle de centre O. Pourquoi O appartient-il à la médiatrice de [AB] ?$$, 'solution', $$Parce que OA et OB sont deux rayons du cercle, donc OA = OB, ce qui place O sur la médiatrice de [AB].$$)
      ),
      jsonb_build_object(
        'heading', $$Construction de la médiatrice au compas et à la règle$$,
        'body', $$Pour construire la médiatrice d'un segment [CK] : tracer le segment [CK] ; prendre un écartement de compas plus grand que la moitié de CK et tracer un arc de cercle de centre C de part et d'autre de (CK) ; avec le même écartement, tracer un arc de centre K ; les deux arcs se coupent en deux points ; tracer la droite passant par ces deux points d'intersection : c'est la médiatrice de [CK], et son point d'intersection avec [CK] en est le milieu.$$,
        'highlights', array[$$construction : arcs de même rayon centrés en C puis K → droite passant par les 2 intersections = médiatrice$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi utilise-t-on le même écartement de compas pour les deux arcs (centré en C, puis en K) ?$$, 'solution', $$Pour que les points d'intersection soient équidistants de C et de K, garantissant qu'ils appartiennent bien à la médiatrice.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conseil scolaire souhaite construire un point d'eau à égale distance de trois bâtiments E, F et G d'un établissement, pour ne favoriser aucun bâtiment. Un groupe d'élèves a placé le point O sur un plan, avec des codes montrant que O appartient à la médiatrice de [EF] et à la médiatrice de [FG].$$,
      'questions', array[
        $$Justifie que OE = OF = OG.$$,
        $$Dis si le groupe d'élèves a raison de proposer cet emplacement pour le point O.$$,
        $$Explique pourquoi une médiatrice est l'outil adapté pour ce type de problème.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$P, Q, R sont trois points tels que PR=50, PQ=120, RQ=70. R appartient-il à [PQ] ?$$,
      'hint', $$Vérifie si PR + RQ = PQ.$$,
      'expected', $$Oui, car 50 + 70 = 120 = PQ.$$
    ),
    jsonb_build_object(
      'question', $$Sur une figure, AC=5 et BC=7, avec (D) médiatrice de [BC] et A un point de (D). Que vaut AB ?$$,
      'hint', $$Un point de la médiatrice est équidistant des deux extrémités.$$,
      'expected', $$AB = AC = 5.$$
    ),
    jsonb_build_object(
      'question', $$Si K appartient à la médiatrice de [MN], que peut-on dire de KM et KN ?$$,
      'hint', $$C'est la propriété caractéristique de la médiatrice.$$,
      'expected', $$KM = KN.$$
    ),
    jsonb_build_object(
      'question', $$Les droites (D1) et (D2), médiatrices respectives de [AB] et [AC], se coupent en E. Pourquoi la médiatrice de [BC] passe-t-elle aussi par E ?$$,
      'hint', $$Compare EA, EB et EC.$$,
      'expected', $$Parce que EA=EB (E sur la médiatrice de [AB]) et EA=EC (E sur la médiatrice de [AC]), donc EB=EC, ce qui place E sur la médiatrice de [BC].$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-segments';
