-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2400: "LEÇON 12: RÉFLEXION ET RÉFRACTION DE LA LUMIÈRE
-- BLANCHE" (https://lyc.ecole-ci.org/course/view.php?id=2400), resource
-- id 22158. Contenu réécrit à partir du PDF source (lois de Descartes pour
-- la réflexion, lois de Descartes-Snell pour la réfraction, angle limite
-- de réfraction, réflexion totale). Tout le contenu est factuel (optique
-- géométrique) : lois, formules et exercices numériques sont
-- repris/adaptés tels quels ; explications reformulées. Cette leçon
-- termine, avec les leçons 1, 3, 8 et 10, le thread Physique disponible
-- pour 1ère C sur la plateforme source (leçons 2, la leçon non numérotée
-- « Énergie potentielle électrostatique », et 9 étant des coquilles de
-- cours vides confirmées ; leçons 4, 5, 6, 7 et 11 absentes de la liste
-- de cours de cette catégorie).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-physique-reflexion-refraction-lumiere',
  '1ere',
  'C',
  'physique-chimie',
  $$Réflexion et réfraction de la lumière blanche$$,
  16,
  '1ere-c-pc-physique-amplificateur-operationnel',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le professeur de physique-chimie de 1ère D2 du Lycée Municipal 1 d'Attécoubé fait observer à ses élèves l'image des jeux de lumière lors de l'ouverture des Jeux Olympiques de Londres. Émerveillés par les figures formées par la lumière et voulant en savoir davantage, les élèves entreprennent, sous la supervision de leur professeur, de connaître les lois de la réflexion, de la réfraction, et quelques-unes de leurs applications.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La réflexion de la lumière$$,
        'body', $$La réflexion de la lumière est un changement de direction et de sens de propagation lorsqu'elle rencontre une surface réfléchissante (par exemple un miroir), en restant dans le même milieu de propagation. Une étude expérimentale, mesurant l'angle de réflexion r pour différentes valeurs de l'angle d'incidence i, montre que la mesure de i est toujours égale à celle de r. On en déduit les lois de Descartes pour la réflexion : le rayon incident et le rayon réfléchi appartiennent à un même plan, appelé plan d'incidence (première loi) ; et l'angle d'incidence et l'angle de réflexion ont la même mesure : i = r (deuxième loi).$$,
        'highlights', array[$$réflexion : changement de direction sans changer de milieu$$, $$1ère loi : rayon incident et rayon réfléchi dans le même plan d'incidence$$, $$2ème loi : mesure(i) = mesure(r)$$]::text[],
        'fixation', jsonb_build_object('question', $$Un rayon lumineux arrive sur un miroir avec un angle d'incidence de 35°. Quel est l'angle de réflexion ?$$, 'solution', $$35°, car l'angle de réflexion est toujours égal à l'angle d'incidence.$$)
      ),
      jsonb_build_object(
        'heading', $$La réfraction de la lumière$$,
        'body', $$La réfraction de la lumière est un changement de direction de propagation lorsqu'elle traverse la surface de séparation de deux milieux transparents distincts (par exemple air-verre ou air-eau). Une étude expérimentale sur un rayon traversant l'air (indice n1) puis pénétrant dans le verre (indice n2) montre que le rapport n2/n1 = sin i1/sin i2 reste constant. On en déduit les lois de Descartes-Snell : le rayon incident et le rayon réfracté appartiennent à un même plan d'incidence (première loi) ; et n1 × sin i1 = n2 × sin i2, où i1 est l'angle d'incidence et i2 l'angle de réfraction (deuxième loi).$$,
        'highlights', array[$$réfraction : changement de direction en changeant de milieu transparent$$, $$loi de Descartes-Snell : n1 × sin i1 = n2 × sin i2$$]::text[],
        'example', jsonb_build_object('statement', $$Un rayon lumineux arrive à la surface de l'eau (n2 = 1,33) avec un angle d'incidence de 60°, depuis l'air (n1 = 1). Calcule l'angle de réfraction.$$, 'solution', $$n1×sin i1 = n2×sin i2 ⟹ sin i2 = (1×sin60°)/1,33 ⟹ i2 = 40°.$$),
        'fixation', jsonb_build_object('question', $$Qu'ont en commun le rayon incident et le rayon réfracté, d'après la première loi de Descartes-Snell ?$$, 'solution', $$Ils appartiennent au même plan, le plan d'incidence.$$)
      ),
      jsonb_build_object(
        'heading', $$Angle limite de réfraction$$,
        'body', $$Lorsque le rayon passe d'un milieu 1 (indice n1) vers un milieu 2 plus réfringent (n2 > n1), l'angle de réfraction i2 reste toujours inférieur à l'angle d'incidence i1. Quand i1 atteint 90° (sin i1 = 1), i2 atteint sa valeur maximale, appelée angle limite de réfraction L, telle que sin L = n1/n2.$$,
        'highlights', array[$$milieu 2 plus réfringent que 1 (n2 > n1) : i2 < i1 toujours$$, $$angle limite L : sin L = n1/n2 (atteint quand i1 = 90°)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quand l'angle de réfraction i2 atteint-il sa valeur maximale L ?$$, 'solution', $$Lorsque l'angle d'incidence i1 atteint 90° (sin i1 = 1).$$)
      ),
      jsonb_build_object(
        'heading', $$La réflexion totale$$,
        'body', $$Lorsque le rayon passe d'un milieu 1 plus réfringent (n1 > n2) vers un milieu 2 moins réfringent, l'angle de réfraction i2 est toujours supérieur à l'angle d'incidence i1. Il existe alors un angle limite L (tel que sin L = n2/n1) au-delà duquel il n'y a plus de rayon réfracté : si l'angle d'incidence i1 est supérieur à L, le rayon incident est intégralement réfléchi par la surface de séparation — c'est la réflexion totale. Ce phénomène est notamment exploité dans les fibres optiques (télécommunications, médecine, éclairage décoratif).$$,
        'highlights', array[$$milieu 1 plus réfringent que 2 (n1 > n2) : i2 > i1 toujours$$, $$si i1 > L : réflexion totale (plus de rayon réfracté)$$, $$application : la fibre optique$$]::text[],
        'fixation', jsonb_build_object('question', $$Que se passe-t-il si l'angle d'incidence dépasse l'angle limite L, lorsqu'on passe d'un milieu plus réfringent vers un milieu moins réfringent ?$$, 'solution', $$Il n'y a plus de rayon réfracté : le rayon incident est intégralement réfléchi (réflexion totale).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves vérifie expérimentalement les lois de la réfraction. À partir d'une source laser, un rayon lumineux arrive à la surface libre de l'eau contenue dans une cuve, sous un angle d'incidence i1 = 60°. Au fond de la cuve est placé un miroir plan. L'indice de réfraction de l'air est n1 = 1 et celui de l'eau est n2 = 1,33. Le professeur demande de déterminer l'angle avec lequel le rayon ressortira de l'eau.$$,
      'questions', array[
        $$Précise quel milieu (air ou eau) est le plus réfringent, et trace qualitativement la marche du rayon jusqu'à ce qu'il ressorte de l'eau.$$,
        $$Détermine l'angle réfracté i2 dans l'eau, puis l'angle réfléchi i3 sur le miroir plan au fond de la cuve.$$,
        $$Déduis-en l'angle avec lequel le rayon ressortira de l'eau vers l'air.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Énonce la deuxième loi de Descartes pour la réflexion de la lumière.$$,
      'hint', $$Elle porte sur les angles.$$,
      'expected', $$L'angle d'incidence et l'angle de réflexion ont la même mesure (i = r).$$
    ),
    jsonb_build_object(
      'question', $$Écris la relation de Descartes-Snell pour la réfraction de la lumière.$$,
      'hint', $$Elle relie les indices et les sinus des angles.$$,
      'expected', $$n1 × sin i1 = n2 × sin i2.$$
    ),
    jsonb_build_object(
      'question', $$Un rayon passe de l'air (n1 = 1) vers un verre d'indice n2 = 1,5. Quelle relation donne l'angle limite de réfraction L ?$$,
      'hint', $$Le verre est plus réfringent que l'air.$$,
      'expected', $$sin L = n1/n2 = 1/1,5.$$
    ),
    jsonb_build_object(
      'question', $$Dans quelles conditions un rayon lumineux subit-il une réflexion totale à la surface de séparation de deux milieux ?$$,
      'hint', $$Il faut deux conditions : sur le sens de passage et sur l'angle.$$,
      'expected', $$Quand il passe d'un milieu plus réfringent vers un milieu moins réfringent (n1 > n2), avec un angle d'incidence supérieur à l'angle limite L.$$
    )
  ),
  now()
);
