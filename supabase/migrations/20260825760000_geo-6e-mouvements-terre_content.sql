-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 6 : Les mouvements de la terre et leurs influences sur
-- la vie quotidienne" (Thème 1 : Les bases de l'étude de la
-- géographie). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En faisant des recherches sur internet, des élèves de 6ème découvrent avec étonnement que la finale de la coupe du monde 2002 à Yokohama (Japon) s'est jouée entre 16h et 18h heure locale, alors qu'en Côte d'Ivoire les téléspectateurs l'ont suivie de 11h à 13h. Leur professeur leur explique que ce décalage horaire est dû aux mouvements de la terre. Ils décident donc de mener des recherches pour identifier ces mouvements et leurs conséquences sur la vie quotidienne.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les deux mouvements de la terre$$,
        'body', $$La terre appartient au système solaire (le soleil et ses 8 planètes : Mercure, Vénus, Terre, Mars, Jupiter, Saturne, Uranus, Neptune), lui-même dans la galaxie de la Voie lactée, un élément de l'Univers. La terre est animée de deux mouvements : la rotation, tour complet que la terre effectue sur elle-même autour de l'axe des pôles en 24h, d'ouest en est ; et la révolution, tour complet qu'elle effectue autour du soleil en 365 jours ¼ (d'où l'année bissextile de 366 jours tous les 4 ans).$$,
        'highlights', array[$$rotation = tour sur soi-même en 24h, d'ouest en est$$, $$révolution = tour autour du soleil en 365 jours ¼ (année bissextile = 366 jours)$$]::text[],
        'fixation', jsonb_build_object('question', $$En combien de temps la terre effectue-t-elle sa rotation complète ?$$, 'solution', $$En 24 heures.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la rotation$$,
        'body', $$La rotation de la terre a trois conséquences : la succession des jours et des nuits (chaque partie de la terre est tour à tour éclairée puis plongée dans le noir), le mouvement apparent du soleil (qui semble se déplacer dans le ciel), et la division de la terre en 24 fuseaux horaires, créant un décalage horaire entre régions. Les régions à l'est du méridien de Greenwich ajoutent une heure par fuseau, celles à l'ouest en retranchent une.$$,
        'highlights', array[$$conséquences de la rotation : jour/nuit, mouvement apparent du soleil, 24 fuseaux horaires$$, $$est de Greenwich → on ajoute des heures ; ouest → on en retranche$$]::text[],
        'example', jsonb_build_object('statement', $$Il est 5h à Greenwich. Quelle heure est-il au Caire, situé à 2 fuseaux horaires à l'est ?$$, 'solution', $$7h (5h + 2h, car Le Caire est à l'est de Greenwich).$$),
        'fixation', jsonb_build_object('question', $$Combien de fuseaux horaires divisent la terre ?$$, 'solution', $$24 fuseaux horaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la révolution$$,
        'body', $$La révolution de la terre entraîne l'inégale durée des jours et des nuits selon les moments de l'année, ainsi que la succession des quatre saisons astronomiques dans l'hémisphère nord : l'équinoxe de printemps (21 mars au 21/22 juin, jour = nuit), le solstice d'été (21/22 juin au 23 septembre, jour plus long), l'équinoxe d'automne (23 septembre au 21/22 décembre, jour = nuit), et le solstice d'hiver (21/22 décembre au 21 mars, nuit plus longue).$$,
        'highlights', array[$$révolution → 4 saisons : équinoxe de printemps, solstice d'été, équinoxe d'automne, solstice d'hiver$$, $$aux équinoxes, jour = nuit ; aux solstices, l'un est plus long que l'autre$$]::text[],
        'fixation', jsonb_build_object('question', $$Pendant quelle saison la nuit est-elle plus longue que le jour, dans l'hémisphère nord ?$$, 'solution', $$Pendant le solstice d'hiver.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un petit frère en classe de CE2, surpris par une coupure d'électricité en pleine nuit, demande à sa mère pourquoi il y a le jour et la nuit. N'ayant pas été à l'école, elle sollicite son grand frère (l'élève de 6ème) pour expliquer le phénomène.$$,
      'questions', array[
        $$Identifie le problème posé par le petit frère.$$,
        $$Nomme le mouvement de la terre à la base de l'alternance jour/nuit, et indique une autre de ses conséquences.$$,
        $$Détermine l'autre mouvement de la terre et indique une de ses conséquences.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$La succession des jours et des nuits est-elle due à la rotation ou à la révolution de la terre ?$$,
      'hint', $$C'est le mouvement le plus rapide (24h).$$,
      'expected', $$À la rotation de la terre.$$
    ),
    jsonb_build_object(
      'question', $$Quelle planète du système solaire est la plus proche du soleil ?$$,
      'hint', $$C'est la première de la liste.$$,
      'expected', $$Mercure.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel sens s'effectue la rotation de la terre ?$$,
      'hint', $$C'est le sens apparent du mouvement du soleil, levant à couchant.$$,
      'expected', $$D'ouest en est.$$
    ),
    jsonb_build_object(
      'question', $$La succession des saisons est-elle une conséquence de la rotation ou de la révolution de la terre ?$$,
      'hint', $$C'est le mouvement qui dure 365 jours ¼.$$,
      'expected', $$De la révolution de la terre.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-mouvements-terre';
