-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 4 : La notion de chronologie" (Thème 1 : Les bases de
-- l'étude de l'histoire). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au CDI de leur établissement, des élèves de 6ème découvrent une frise chronologique avec des unités de mesure variées (millénaires, siècles, périodes) et des événements historiques. Curieux de savoir comment ces éléments ont été fixés, ils décident de mener des recherches sur la manière de compter le temps et de construire une frise chronologique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les unités de mesure du temps$$,
        'body', $$Le mot chronologie vient des mots grecs « chronos » (temps) et « logos » (science) : c'est la science qui étudie la manière de compter le temps. Les unités de temps courts sont l'heure, le jour, la semaine, le mois, l'année (365 ou 366 jours) et la décennie (10 ans). Les unités de temps longs sont le siècle (100 ans), le millénaire (1000 ans, soit 10 siècles), la période, l'ère (longue période avec un point de départ précis, comme l'ère chrétienne débutant à la naissance de Jésus-Christ, ou l'ère musulmane débutant à l'Hégire en 622), l'époque et la génération (environ 25 ans).$$,
        'highlights', array[$$temps courts : heure, jour, semaine, mois, année, décennie (10 ans)$$, $$temps longs : siècle (100 ans), millénaire (1000 ans), ère, époque, génération (~25 ans)$$]::text[],
        'example', jsonb_build_object('statement', $$À quel siècle appartient l'année 1235 ?$$, 'solution', $$Au XIIIe siècle (on ajoute 1 au chiffre des centaines : 12 + 1 = 13).$$),
        'fixation', jsonb_build_object('question', $$Combien d'années compte un millénaire ?$$, 'solution', $$1000 ans, soit 10 siècles.$$)
      ),
      jsonb_build_object(
        'heading', $$Compter avant et après une origine$$,
        'body', $$Pour compter le temps, il faut un point de départ (une ère). L'ère chrétienne, utilisée dans le calendrier grégorien, débute à la naissance de Jésus-Christ (l'an 1). Les années antérieures à ce point de départ sont précédées du signe « moins » (par exemple, -3000 pour la naissance de l'écriture). L'ère musulmane, elle, débute en l'an 622, date de l'Hégire (le départ du prophète Mahomet de La Mecque vers Médine).$$,
        'highlights', array[$$ère chrétienne : point de départ = naissance de Jésus-Christ (an 1)$$, $$ère musulmane : point de départ = Hégire (622)$$, $$années avant l'an 1 précédées du signe "moins"$$]::text[],
        'fixation', jsonb_build_object('question', $$Que représente l'Hégire ?$$, 'solution', $$Le départ du prophète Mahomet de La Mecque vers Médine, en l'an 622, point de départ de l'ère musulmane.$$)
      ),
      jsonb_build_object(
        'heading', $$La construction d'une frise chronologique$$,
        'body', $$Une frise chronologique est une ligne (horizontale ou verticale) sur laquelle sont représentés les années et les faits, dans leur ordre de déroulement. Elle se termine par une flèche, car le temps continue. Pour la construire : tracer deux segments parallèles selon une largeur donnée, graduer l'axe selon une échelle choisie (par exemple 3cm pour 1000 ans), fermer l'extrémité gauche, poser une flèche à droite, porter les dates et événements, puis indiquer le titre et l'échelle.$$,
        'highlights', array[$$étapes : tracer les segments → graduer selon l'échelle → fermer à gauche, flèche à droite → placer dates/événements → titre + échelle$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'extrémité droite d'une frise chronologique est-elle représentée par une flèche ?$$, 'solution', $$Parce que le temps continue de s'écouler après le dernier événement représenté.$$),
        'fixation', jsonb_build_object('question', $$Une frise chronologique se lit-elle de la gauche vers la droite, ou l'inverse ?$$, 'solution', $$De la gauche (les événements les plus anciens) vers la droite (les plus récents).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève découvre un document mentionnant les événements suivants : 1910 (révolte des Abbey), -500 (découverte du fer en Nubie), 622 (l'Hégire), 476 (chute de l'Empire romain d'Occident), 1789 (Révolution française), -3000 (naissance de l'écriture).$$,
      'questions', array[
        $$Ordonne ces années et événements du plus ancien au plus récent.$$,
        $$Détermine le siècle correspondant à chacune de ces années.$$,
        $$Explique pourquoi certaines de ces années sont précédées du signe "moins".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$À quel siècle appartient l'année 1789 ?$$,
      'hint', $$Ajoute 1 au chiffre des centaines.$$,
      'expected', $$Le XVIIIe siècle (17 + 1).$$
    ),
    jsonb_build_object(
      'question', $$Combien d'années dure une génération, en moyenne ?$$,
      'hint', $$C'est un peu plus qu'un quart de siècle.$$,
      'expected', $$Environ 25 ans.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre chronologique : 1960 ; -1275 ; 2002 ; 65 ; 1621.$$,
      'hint', $$Les années négatives sont les plus anciennes.$$,
      'expected', $$-1275, 65, 1621, 1960, 2002.$$
    ),
    jsonb_build_object(
      'question', $$Quel événement marque le point de départ de l'ère chrétienne ?$$,
      'hint', $$C'est l'an 1 du calendrier grégorien.$$,
      'expected', $$La naissance de Jésus-Christ.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-notion-chronologie';
