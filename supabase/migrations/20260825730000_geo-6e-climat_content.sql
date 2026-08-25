-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 3 : Le climat" (Thème 1 : Les bases de l'étude de la
-- géographie). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En suivant le bulletin météo à la télévision, des élèves de 6ème apprennent qu'il fait froid en France pendant qu'il fait chaud en Côte d'Ivoire, au mois de janvier. Étonnés, ils décident de mener des recherches pour comprendre la notion de climat et ses instruments de mesure, identifier les grandes zones climatiques de la terre, et construire un diagramme ombrothermique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les éléments du climat et leurs instruments de mesure$$,
        'body', $$Le climat est l'ensemble des types de temps qui se succèdent dans une région sur une longue période (le temps étant l'état passager de l'atmosphère à un moment donné). Ses trois éléments sont la température (mesurée par le thermomètre, en degrés Celsius, Fahrenheit ou Kelvin), les précipitations (pluie, neige, grêle, rosée — mesurées par le pluviomètre, en millimètres) et les vents (mesurés en vitesse par l'anémomètre, en km/h, et en direction par la girouette). En Côte d'Ivoire soufflent l'harmattan (sec, du nord vers le sud), la mousson (humide, de la mer vers le continent) et la brise de mer. La pression atmosphérique se mesure au baromètre (en bars ou pascals) ; les vents se déplacent des hautes vers les basses pressions.$$,
        'highlights', array[$$3 éléments du climat : température (thermomètre), précipitations (pluviomètre), vents (anémomètre/girouette)$$, $$vents en Côte d'Ivoire : harmattan (sec, nord→sud), mousson (humide, mer→continent), brise de mer$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel instrument mesure la quantité de pluie tombée ?$$, 'solution', $$Le pluviomètre.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes zones climatiques du monde$$,
        'body', $$Le monde compte trois grandes zones climatiques. La zone chaude (ou intertropicale), entre les tropiques du Cancer et du Capricorne, se caractérise par une chaleur constante ; elle comprend les climats équatorial, tropical (sec ou humide) et désertique. La zone tempérée, entre les tropiques et les cercles polaires, a un climat doux et modéré ; elle comprend les climats océanique, continental et méditerranéen. La zone froide (polaire), entre les cercles polaires et les pôles, connaît un grand froid et de la neige permanente : c'est le climat polaire. Le climat de montagne, lui, est dit azonal (il ne dépend pas d'une zone précise mais de l'altitude).$$,
        'highlights', array[$$zone chaude (intertropicale) : équatorial, tropical, désertique$$, $$zone tempérée : océanique, continental, méditerranéen$$, $$zone froide (polaire) : climat polaire$$, $$climat de montagne = azonal$$]::text[],
        'example', jsonb_build_object('statement', $$Un pays situé entre le tropique du Cancer et le cercle arctique a-t-il un climat de la zone chaude ou de la zone tempérée ?$$, 'solution', $$De la zone tempérée (entre un tropique et un cercle polaire).$$),
        'fixation', jsonb_build_object('question', $$Dans quelle zone climatique se trouve le climat équatorial ?$$, 'solution', $$Dans la zone chaude (intertropicale).$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi le climat varie selon les régions$$,
        'body', $$La zone équatoriale, la plus proche du soleil toute l'année, reçoit une chaleur constante et de fortes précipitations, ce qui en fait la zone la plus arrosée et la plus humide du globe. Ces données pluviométriques et thermiques recueillies région par région permettent de délimiter les grandes zones climatiques à la surface de la terre.$$,
        'highlights', array[$$zone équatoriale = la plus arrosée et la plus humide de la planète$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la zone équatoriale est-elle la plus humide de la planète ?$$, 'solution', $$Parce qu'elle bénéficie d'une chaleur constante et de fortes précipitations tout au long de l'année.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un débat télévisé sur la variation du climat dans le monde, un intervenant affirme que les données pluviométriques et thermiques recueillies par zone climatique montrent que la zone équatoriale est la plus arrosée et la plus humide. Un second intervenant précise que ces données permettent de délimiter les grandes zones climatiques de la terre.$$,
      'questions', array[
        $$Dis de quoi il est question dans ce débat.$$,
        $$Relève les éléments du climat évoqués dans la situation.$$,
        $$Cite les trois grandes zones climatiques de la terre, du pôle à l'équateur.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite les trois éléments du climat.$$,
      'hint', $$Ce sont les trois sous-parties de la première section.$$,
      'expected', $$La température, les précipitations, et les vents.$$
    ),
    jsonb_build_object(
      'question', $$L'harmattan apporte-t-il la sécheresse ou la pluie en Côte d'Ivoire ?$$,
      'hint', $$Il souffle du désert vers le sud.$$,
      'expected', $$La sécheresse.$$
    ),
    jsonb_build_object(
      'question', $$Dans quelle zone climatique se situe la Côte d'Ivoire, entre les deux tropiques ?$$,
      'hint', $$C'est la zone la plus chaude.$$,
      'expected', $$La zone chaude (intertropicale).$$
    ),
    jsonb_build_object(
      'question', $$Quel instrument mesure la direction du vent ?$$,
      'hint', $$Ce n'est pas l'anémomètre, qui mesure la vitesse.$$,
      'expected', $$La girouette.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-climat';
