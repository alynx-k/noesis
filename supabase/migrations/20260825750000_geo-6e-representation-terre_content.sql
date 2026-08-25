-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 5 : Les moyens de représentation de la terre" (Thème
-- 1 : Les bases de l'étude de la géographie). Contenu réécrit à partir
-- du PDF source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une séance de projection sur la terre au CDI, des élèves de 6ème sont surpris de voir que l'on puisse représenter, sur des surfaces très réduites, les dimensions énormes de la terre. Curieux, ils décident de mener des recherches pour connaître les différents moyens de représentation de la terre et identifier les types de projection.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le globe et la carte$$,
        'body', $$La terre a une forme sphérique aplanie aux pôles. Il existe deux grands moyens de la représenter : le globe et la carte. Le globe est une représentation sphérique, la plus fidèle de la terre (axe incliné, continents, océans), mais elle ne montre pas la végétation ni le relief. La carte est une représentation plane ; on distingue la carte thématique (relief, végétation...), la carte topographique (courbes de niveau), la carte routière (voies de communication), et le planisphère/la mappemonde (la terre entière). Contrairement au globe, la carte montre de nombreux détails, mais déforme les angles de la terre.$$,
        'highlights', array[$$globe = représentation sphérique fidèle, mais sans relief ni végétation$$, $$carte = représentation plane, riche en détails, mais déforme les angles$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel type de carte représente les courbes de niveau d'un terrain ?$$, 'solution', $$La carte topographique.$$)
      ),
      jsonb_build_object(
        'heading', $$La lecture d'une carte$$,
        'body', $$Pour lire une carte, il faut connaître le titre (lieu et thème), la direction (sens de lecture, indiquée par une flèche ou une rose des vents), l'échelle et la légende. L'échelle est le rapport entre une distance sur la carte et la distance réelle sur le terrain (par exemple, 1/50 000 signifie que 1 cm sur la carte représente 50 000 cm sur le terrain) ; elle peut être numérique (fraction) ou graphique (trait gradué). La légende est l'ensemble des signes et symboles permettant de comprendre les couleurs et dessins de la carte.$$,
        'highlights', array[$$4 clés de lecture : titre, direction, échelle, légende$$, $$échelle numérique (fraction) ou graphique (trait gradué)$$]::text[],
        'example', jsonb_build_object('statement', $$Sur une carte à l'échelle 1/1 000 000, quelle distance réelle correspond à 2 cm sur la carte ?$$, 'solution', $$20 km (2 cm × 1 000 000 = 2 000 000 cm = 20 km).$$),
        'fixation', jsonb_build_object('question', $$À quoi sert la légende d'une carte ?$$, 'solution', $$Elle permet de comprendre les couleurs et les dessins utilisés sur la carte.$$)
      ),
      jsonb_build_object(
        'heading', $$Les techniques de projection$$,
        'body', $$La projection est la technique qui permet de passer de la forme sphérique de la terre à une surface plane. On distingue trois types : la projection cylindrique (ou Mercator), qui sert à représenter les zones intertropicales ; la projection conique (ou de Lambert), pour les zones tempérées ; et la projection polaire (ou azimutale), pour les zones polaires.$$,
        'highlights', array[$$projection cylindrique (Mercator) → zones intertropicales$$, $$projection conique (Lambert) → zones tempérées$$, $$projection polaire (azimutale) → zones polaires$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle projection utilise-t-on pour représenter les régions polaires ?$$, 'solution', $$La projection polaire (ou azimutale).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le proviseur d'un lycée souhaite établir un plan d'évacuation d'urgence en cas d'incendie, et a besoin d'un plan précis de l'établissement pour déterminer comment chaque classe devra évacuer.$$,
      'questions', array[
        $$Identifie le type de représentation dont il est question ici.$$,
        $$Cite d'autres types de cartes existants.$$,
        $$Explique l'importance d'un tel plan pour l'école.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la représentation la plus fidèle de la terre : le globe ou la carte ?$$,
      'hint', $$Elle conserve la forme sphérique réelle.$$,
      'expected', $$Le globe.$$
    ),
    jsonb_build_object(
      'question', $$Quel élément d'une carte permet de savoir dans quel sens la lire ?$$,
      'hint', $$Il est souvent représenté par une flèche ou une rose des vents.$$,
      'expected', $$La direction.$$
    ),
    jsonb_build_object(
      'question', $$Quelle projection convient pour représenter la Côte d'Ivoire, située dans la zone intertropicale ?$$,
      'hint', $$C'est aussi appelée projection de Mercator.$$,
      'expected', $$La projection cylindrique (Mercator).$$
    ),
    jsonb_build_object(
      'question', $$Le planisphère représente-t-il une partie ou la totalité de la terre ?$$,
      'hint', $$Il sert à représenter le monde entier.$$,
      'expected', $$La totalité de la terre.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-representation-terre';
