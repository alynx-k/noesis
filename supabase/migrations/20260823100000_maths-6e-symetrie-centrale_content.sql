-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2096: "Leçon10: Figures symetriques par rapport à un
-- point" (https://coll.ecole-ci.org/course/view.php?id=2096), resource id
-- 17437. Contenu réécrit à partir du PDF source (thème "Transformations du
-- plan", programme officiel MENA) ; situation d'apprentissage, définitions,
-- propriétés et exercices reformulés, non copiés verbatim. Les
-- constructions géométriques sont décrites textuellement (figures non
-- reproductibles en JSON).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 6ème natif de Mérégou explique à son ami d'Abidjan : « La distance entre Datan et Koudoubon est de 49 km, et ces deux villes sont symétriques par rapport à mon village ». Comme le village n'est pas indiqué sur la carte, son ami veut le placer par un point, mais rencontre des difficultés. Il décide de s'informer sur les figures symétriques par rapport à un point.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Symétrique d'un point par rapport à un point$$,
        'body', $$Un point A' est le symétrique d'un point A par rapport à un point O signifie que O est le milieu du segment [AA']. Le point O est son propre symétrique par rapport à lui-même. Si A' est le symétrique de A par rapport à O, alors A est aussi le symétrique de A' par rapport à O (la relation est réciproque).$$,
        'highlights', array[$$A' symétrique de A par rapport à O ⟺ O est le milieu de [AA']$$, $$relation réciproque : le symétrique du symétrique redonne le point de départ$$]::text[],
        'fixation', jsonb_build_object('question', $$P est le milieu du segment [RS]. Que peut-on dire de R et S ?$$, 'solution', $$R et S sont symétriques par rapport à P.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés : alignement, droites, segments, angles, cercles$$,
        'body', $$Par rapport à un point : les symétriques de points alignés restent alignés ; le symétrique d'une droite est une droite parallèle à la première ; le symétrique d'un segment est un segment de même longueur ; le symétrique du milieu d'un segment est le milieu du segment symétrique ; le symétrique d'un angle est un angle de même mesure ; le symétrique d'un cercle est un cercle de même rayon ; les symétriques de deux droites perpendiculaires restent perpendiculaires ; les symétriques de deux droites parallèles restent parallèles.$$,
        'highlights', array[$$symétrique d'une droite = droite parallèle$$, $$longueurs, mesures d'angles et rayons sont conservés par symétrie centrale$$, $$perpendicularité et parallélisme sont conservés$$]::text[],
        'example', jsonb_build_object('statement', $$L'angle ABC mesure 90°. Son symétrique A'B'C' par rapport à un point I a été construit. Quelle est la mesure de A'B'C' ?$$, 'solution', $$90°, car le symétrique d'un angle par rapport à un point est un angle de même mesure.$$),
        'fixation', jsonb_build_object('question', $$[AB] a une longueur de 5 cm. Quelle est la longueur de son symétrique [A'B'] par rapport à un point O ?$$, 'solution', $$5 cm également : le symétrique d'un segment a la même longueur.$$)
      ),
      jsonb_build_object(
        'heading', $$Centre de symétrie d'une figure$$,
        'body', $$Un point est centre de symétrie d'une figure lorsque cette figure est son propre symétrique par rapport à ce point. Cas particuliers : le centre de symétrie d'un segment est son milieu ; celui d'un cercle est son centre ; celui d'un parallélogramme est le point d'intersection de ses diagonales (le centre du parallélogramme).$$,
        'highlights', array[$$centre de symétrie d'un segment = son milieu$$, $$centre de symétrie d'un cercle = son centre$$, $$centre de symétrie d'un parallélogramme = intersection des diagonales$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le centre de symétrie d'un cercle ?$$, 'solution', $$Le centre du cercle lui-même.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour évacuer la production d'anacarde de Foronan (F), un conseil régional veut construire deux gares G et G' sur deux routes rectilignes partant de l'hôtel Hambol (H) : l'une vers Niakaramadougou (N), l'autre vers Dabakala (D). On construit (H'N') symétrique de (HN) par rapport à F, et (H'D') symétrique de (HD) par rapport à F ; G est l'intersection de (H'D') et (HN), G' celle de (H'N') et (HD).$$,
      'questions', array[
        $$Pourquoi les droites (GH) et (G'H') sont-elles parallèles ?$$,
        $$Pourquoi le quadrilatère GH'G'H est-il un parallélogramme de centre F ?$$,
        $$En déduire pourquoi F est à égale distance de G et G', répondant ainsi à la demande du conseil régional.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie « A' est le symétrique de A par rapport à O » ?$$,
      'hint', $$Cela concerne le milieu d'un segment.$$,
      'expected', $$Que O est le milieu du segment [AA'].$$
    ),
    jsonb_build_object(
      'question', $$Le symétrique d'une droite (D) par rapport à un point O est une droite (D'). Quelle relation existe-t-il entre (D) et (D') ?$$,
      'hint', $$Elles ne se coupent jamais (sauf cas particulier).$$,
      'expected', $$(D) et (D') sont parallèles.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le centre de symétrie d'un parallélogramme ?$$,
      'hint', $$C'est un point particulier défini par ses diagonales.$$,
      'expected', $$Le point d'intersection de ses diagonales (le centre du parallélogramme).$$
    ),
    jsonb_build_object(
      'question', $$Deux droites (AB) et (CD) sont perpendiculaires. Que peut-on dire de leurs symétriques (A'B') et (C'D') par rapport à un point I ?$$,
      'hint', $$La perpendicularité est conservée par symétrie centrale.$$,
      'expected', $$(A'B') et (C'D') sont aussi perpendiculaires.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-symetrie-centrale';
