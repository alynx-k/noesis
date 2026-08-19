-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 941: "SVT 1ère C_L1_La structure interne du globe
-- terrestre" (https://lyc.ecole-ci.org/course/view.php?id=941), resource
-- id 4929. Contenu réécrit à partir du PDF source (ondes sismiques P/S/L,
-- foyer/épicentre, propagation des ondes en fonction de la profondeur,
-- structure du globe terrestre : croûte, manteau, noyau, discontinuités
-- de Mohorovicic, Gutenberg et Lehmann). Tout le contenu est factuel
-- (géophysique) : observations, données numériques (hodographes, vitesses
-- des ondes) et exercices sont repris/adaptés tels quels ; explications
-- reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-structure-interne-globe-terrestre',
  '1ere',
  'C',
  'svt',
  $$La structure interne du globe terrestre$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre des activités du club SVT de leur établissement, des élèves de 1ère C effectuent une visite guidée à la station expérimentale de Lamto sous la conduite de leur professeur de SVT. Ils découvrent les appareils qui enregistrent les vibrations émanant de la Terre. Selon les techniciens de la station, ces vibrations ont souvent des conséquences désastreuses lorsque leurs intensités sont élevées. Pour comprendre ces phénomènes, les élèves décident de déterminer les caractéristiques des vibrations, d'expliquer leur propagation afin de déduire la structure de la Terre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Conséquences des activités internes du globe$$,
        'body', $$Les activités internes du globe terrestre (séismes, éruptions volcaniques) provoquent diverses conséquences : pertes en vies humaines, animales et végétales ; destruction d'infrastructures (routes, habitations) ; impacts sur l'environnement (raz-de-marée, pollution de l'air). Au cours d'une éruption volcanique, trois types de produits sont rejetés : des produits solides (cendres, bombes volcaniques), des produits liquides (coulées de lave) et des produits gazeux (fumerolles).$$,
        'highlights', array[$$conséquences des séismes/volcans : pertes humaines, destructions, pollution$$, $$éruption volcanique : produits solides, liquides et gazeux$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite les trois types de produits rejetés lors d'une éruption volcanique.$$, 'solution', $$Des produits solides (cendres, bombes volcaniques), des produits liquides (coulées de lave) et des produits gazeux (fumerolles).$$)
      ),
      jsonb_build_object(
        'heading', $$Les ondes sismiques : caractéristiques$$,
        'body', $$Un sismogramme enregistré à l'aide d'un sismographe révèle trois types d'ondes sismiques, d'amplitudes et de durées de propagation différentes. Les ondes P (primaires) sont les premières enregistrées, les plus rapides, se propageant dans les milieux solides et liquides : ce sont des ondes de compression (les particules se déplacent dans le même sens que la propagation). Les ondes S (secondaires) sont enregistrées ensuite, moins rapides, ne se propageant que dans les milieux solides : ce sont des ondes de cisaillement (les particules se déplacent perpendiculairement à la propagation). Les ondes L (longues) sont les dernières et les plus lentes, se propageant dans les couches superficielles de la Terre. Les ondes sismiques naissent d'un relâchement brutal de tensions en un point appelé foyer (ou hypocentre) ; le point de la surface terrestre situé à la verticale du foyer, où l'intensité du séisme est la plus forte, est l'épicentre. L'énergie libérée par un séisme, sa magnitude, se mesure sur l'échelle de Richter.$$,
        'highlights', array[$$onde P : la plus rapide, compression, milieux solides et liquides$$, $$onde S : plus lente, cisaillement, milieux solides uniquement$$, $$onde L : la plus lente, couches superficielles$$, $$foyer (hypocentre) → épicentre (verticale en surface)$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les ondes S ne sont-elles pas enregistrées dans un milieu liquide ?$$, 'solution', $$Parce que les ondes S sont des ondes de cisaillement qui ne se propagent que dans les milieux solides.$$)
      ),
      jsonb_build_object(
        'heading', $$La propagation des ondes révèle des couches concentriques$$,
        'body', $$L'étude du temps de propagation des ondes en fonction de la distance à l'épicentre (hodographes) montre que la vitesse de l'onde L est constante (milieu homogène), tandis que celle des ondes P et S augmente avec la profondeur (milieux hétérogènes, de plus en plus denses). L'étude de la vitesse des ondes P et S en fonction de la profondeur révèle plusieurs discontinuités : à 70 km, une chute brutale marque la limite entre la croûte et le manteau (discontinuité de Mohorovicic) ; à 2900 km, une nouvelle chute brutale marque la limite entre le manteau et le noyau (discontinuité de Gutenberg) — les ondes S s'y annulent, ce qui indique que le noyau externe est liquide ; à 5100 km, la discontinuité de Lehmann marque la limite entre noyau externe et noyau interne, où les ondes S réapparaissent, indiquant un noyau interne (graine) solide.$$,
        'highlights', array[$$discontinuité de Mohorovicic (70 km) : croûte / manteau$$, $$discontinuité de Gutenberg (2900 km) : manteau / noyau externe (liquide)$$, $$discontinuité de Lehmann (5100 km) : noyau externe / noyau interne (solide)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi peut-on affirmer que le noyau externe est liquide ?$$, 'solution', $$Parce qu'à 2900 km de profondeur, les ondes S (qui ne se propagent que dans les solides) s'annulent complètement ; leur disparition indique que le milieu traversé, le noyau externe, est liquide.$$),
        'fixation', jsonb_build_object('question', $$Que révèle la réapparition des ondes S à 5100 km de profondeur ?$$, 'solution', $$Que le noyau interne (la graine), contrairement au noyau externe, est solide.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes couches du globe terrestre$$,
        'body', $$L'analyse complète des vitesses de propagation permet de distinguer, de la surface vers le centre : la croûte (ou écorce terrestre), d'une épaisseur de 6 à 7 km sous les océans et jusqu'à 70 km sous les continents ; le manteau, subdivisé en manteau supérieur (70 à 750 km — dont la partie supérieure rigide forme, avec la croûte, la lithosphère, tandis que sa partie inférieure visqueuse est l'asthénosphère) et manteau inférieur ou mésosphère (750 à 2900 km, solide) ; le noyau externe (2900 à 5100 km, liquide) ; et le noyau interne ou graine (au-delà de 5100 km, solide).$$,
        'highlights', array[$$lithosphère = croûte + partie rigide du manteau supérieur$$, $$asthénosphère : partie visqueuse du manteau supérieur$$, $$4 grandes couches : croûte, manteau, noyau externe, noyau interne$$]::text[],
        'fixation', jsonb_build_object('question', $$Que forme, ensemble, la croûte et la partie supérieure rigide du manteau supérieur ?$$, 'solution', $$La lithosphère.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton voisin de classe, dans le cadre de ses recherches sur la structure interne du globe terrestre, trouve un document présentant l'évolution de la vitesse des ondes sismiques P et S en fonction de la profondeur. Il t'approche pour avoir plus d'informations sur cette structure.$$,
      'questions', array[
        $$Indique les profondeurs où la vitesse des ondes P et S chute brusquement.$$,
        $$Donne les raisons de ces variations brusques de la vitesse des ondes P et S à ces profondeurs.$$,
        $$Déduis-en le nombre de couches majeures à l'intérieur de la Terre, et fais un schéma simplifié de la structure interne du globe (limité à ces couches majeures).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la différence de vitesse entre les ondes P et les ondes S : laquelle est la plus rapide ?$$,
      'hint', $$Les ondes P sont enregistrées en premier.$$,
      'expected', $$Les ondes P sont plus rapides que les ondes S (elles arrivent toujours en premier sur le sismogramme).$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on le point exact, en profondeur, où naît un séisme ?$$,
      'hint', $$Il est aussi appelé « foyer ».$$,
      'expected', $$L'hypocentre (ou foyer).$$
    ),
    jsonb_build_object(
      'question', $$À quelle profondeur se situe la discontinuité de Mohorovicic, et quelles couches sépare-t-elle ?$$,
      'hint', $$C'est la limite la plus superficielle des trois discontinuités majeures.$$,
      'expected', $$Vers 70 km de profondeur (sous les continents) ; elle sépare la croûte terrestre du manteau.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'état physique (solide ou liquide) du noyau externe, et comment le sait-on ?$$,
      'hint', $$Il faut se souvenir du comportement des ondes S dans ce milieu.$$,
      'expected', $$Le noyau externe est liquide, ce qu'on déduit du fait que les ondes S, qui ne se propagent pas dans les liquides, s'y annulent complètement.$$
    )
  ),
  now()
);
