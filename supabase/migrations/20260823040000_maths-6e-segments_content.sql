-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2102: "Leçon4: Segment"
-- (https://coll.ecole-ci.org/course/view.php?id=2102), resource id 17509.
-- Contenu réécrit à partir du PDF source (thème "Géométrie du plan",
-- programme officiel MENA) ; situation d'apprentissage, définitions et
-- exercices reformulés, non copiés verbatim. Les figures géométriques du
-- PDF sont décrites textuellement (schéma non reproductible en JSON).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deux villages sont distants de six kilomètres sur une route rectiligne. Pour soutenir la politique de scolarisation, le conseil général veut construire une école primaire à égale distance des deux villages, représentés par les points A et B. Des élèves de sixième proposent de construire le segment qui joint A et B pour y trouver la position de l'école.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Segment : définition et notation$$,
        'body', $$Si (D) est une droite et A, B deux points distincts de (D), la partie de la droite comprise entre A et B est appelée « segment AB », noté [AB] (ou [BA]). A et B sont les extrémités du segment ; A ∈ [AB] et B ∈ [AB]. La droite (AB) est appelée le support du segment [AB]. Contrairement à (AB) qui est une droite illimitée, [AB] est limité à la portion entre ses deux extrémités.$$,
        'highlights', array[$$[AB] = segment ; (AB) = droite (son support) ; [AB) = demi-droite$$, $$extrémités A et B appartiennent au segment [AB]$$]::text[],
        'fixation', jsonb_build_object('question', $$(AB) est-elle la même chose qu'un segment [AB] ?$$, 'solution', $$Non : (AB) désigne la droite illimitée passant par A et B (le support), tandis que [AB] est la portion limitée entre A et B.$$)
      ),
      jsonb_build_object(
        'heading', $$Mesure et comparaison de segments$$,
        'body', $$On mesure la longueur d'un segment avec une règle graduée. La longueur du segment [AB] se note AB (sans crochets). Deux segments de même longueur sont codés par un même signe (petit trait) sur la figure. Pour comparer les longueurs de deux segments sans les mesurer, on peut aussi utiliser un compas.$$,
        'highlights', array[$$AB (sans crochets) = longueur du segment [AB]$$, $$même codage sur la figure = même longueur$$]::text[],
        'example', jsonb_build_object('statement', $$Sur une figure quadrillée de petits carrés identiques, DC = 2 (2 carreaux). Si AC traverse 5 carreaux et BC en traverse 3, que vaut AC et BC ?$$, 'solution', $$AC = 5 et BC = 3, en comptant le nombre de côtés de petits carrés parcourus.$$),
        'fixation', jsonb_build_object('question', $$Avec quel instrument peut-on comparer deux longueurs de segments sans les mesurer avec une règle ?$$, 'solution', $$Un compas.$$)
      ),
      jsonb_build_object(
        'heading', $$Milieu d'un segment$$,
        'body', $$Le milieu d'un segment est le point de ce segment qui est à égale distance de ses deux extrémités. Autrement dit : si I ∈ [AB] et AI = IB, alors I est le milieu de [AB].$$,
        'highlights', array[$$milieu I de [AB] : I ∈ [AB] et AI = IB$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux conditions pour qu'un point I soit le milieu d'un segment [AB] ?$$, 'solution', $$I doit appartenir au segment [AB], et les distances AI et IB doivent être égales.$$)
      ),
      jsonb_build_object(
        'heading', $$Médiatrice d'un segment$$,
        'body', $$La médiatrice d'un segment est la droite qui passe par le milieu de ce segment et qui est perpendiculaire à son support. Ainsi, une droite (D) est la médiatrice de [YM] si (D) passe par le milieu de [YM] ET (D) est perpendiculaire à (YM) — les deux conditions sont nécessaires ensemble.$$,
        'highlights', array[$$médiatrice de [AB] : passe par le milieu ET perpendiculaire au support (AB)$$]::text[],
        'example', jsonb_build_object('statement', $$Une droite (R) passe par le milieu de [AB] mais n'est pas perpendiculaire à (AB) (elle la traverse en biais). Est-elle la médiatrice de [AB] ?$$, 'solution', $$Non : il ne suffit pas de passer par le milieu, il faut aussi être perpendiculaire au support du segment. Comme (R) n'est pas perpendiculaire à (AB), ce n'est pas sa médiatrice.$$),
        'fixation', jsonb_build_object('question', $$Une droite perpendiculaire à [AB] mais qui ne passe pas par son milieu est-elle la médiatrice de [AB] ?$$, 'solution', $$Non, les deux conditions (passer par le milieu ET être perpendiculaire) sont nécessaires simultanément.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux villages A et B, distants de 8 km, se cotisent pour construire un moulin M et un dispensaire D, tous deux à égale distance des deux villages. Le dispensaire doit être à 4 km des deux villages, et le moulin à 5 km des deux villages.$$,
      'questions', array[
        $$Trace le segment [AB] à l'échelle 1 cm pour 1 km, puis construis sa médiatrice (W).$$,
        $$Sur quelle droite doivent se trouver le dispensaire D et le moulin M pour être à égale distance de A et de B ?$$,
        $$Le dispensaire, à 4 km des deux villages, correspond-il au milieu du segment [AB] ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment note-t-on la longueur du segment [AB] ?$$,
      'hint', $$Elle se note sans les crochets.$$,
      'expected', $$AB.$$
    ),
    jsonb_build_object(
      'question', $$Sur une droite, les points A, B et F sont alignés dans cet ordre. Cite tous les segments que l'on peut former avec ces trois points.$$,
      'hint', $$Il faut prendre les points deux à deux.$$,
      'expected', $$[AB], [AF] et [BF].$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux propriétés que doit vérifier une droite pour être la médiatrice d'un segment [RM] ?$$,
      'hint', $$Une condition de position et une condition d'angle.$$,
      'expected', $$Elle doit passer par le milieu de [RM] et être perpendiculaire à la droite (RM).$$
    ),
    jsonb_build_object(
      'question', $$I est le milieu de [AB] avec AB = 6 cm. Quelle est la longueur AI ?$$,
      'hint', $$Le milieu partage le segment en deux parties égales.$$,
      'expected', $$AI = 3 cm (la moitié de 6 cm).$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-segments';
