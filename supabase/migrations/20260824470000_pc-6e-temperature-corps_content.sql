-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 6 : Température d'un corps" (id 2090). Contenu réécrit à
-- partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une dame arrive tôt le matin au centre de santé avec son bébé qui a "chauffé" toute la nuit. Avant toute consultation, l'infirmier procède à une prise de température. Son grand frère, élève de 6ème, décide avec ses camarades de comprendre l'utilisation du thermomètre et de repérer les températures de différents corps.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Notion de température et unités$$,
        'body', $$En plongeant les mains dans de l'eau tiède et de l'eau froide, on ressent une sensation différente : ces deux eaux ne sont pas à la même température. La température est une grandeur physique qui permet de dire qu'un corps est chaud ou froid ; elle se repère à l'aide d'un thermomètre. L'unité légale de température est le Kelvin (K) ; l'unité usuelle est le degré Celsius (°C) ; dans les pays anglo-saxons, on utilise le degré Fahrenheit (°F). La sensation du chaud ou du froid par le toucher n'est pas fiable — seul le thermomètre donne une mesure exacte.$$,
        'highlights', array[$$température = grandeur physique (chaud/froid), mesurée avec un thermomètre$$, $$Kelvin (K, unité légale) ; degré Celsius (°C, unité usuelle) ; Fahrenheit (°F, pays anglo-saxons)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est l'unité usuelle de température, et son symbole ?$$, 'solution', $$Le degré Celsius, symbole °C.$$)
      ),
      jsonb_build_object(
        'heading', $$Le thermomètre de laboratoire et la lecture de température$$,
        'body', $$Le thermomètre de laboratoire comprend un réservoir (contenant le liquide thermométrique : alcool ou mercure), un tube capillaire, une échelle graduée, et une ampoule de sécurité. Pour lire la température, on repère la valeur d'une graduation puis on lit le niveau du liquide. Exemple : si une graduation vaut 2 unités et le liquide est entre 30 et 32, la lecture est 32°C.$$,
        'highlights', array[$$thermomètre = réservoir + tube capillaire + graduation + ampoule de sécurité$$, $$lecture = valeur d'une graduation × position du liquide$$]::text[],
        'example', jsonb_build_object('statement', $$Sur un thermomètre où chaque graduation vaut 0,2°C, le liquide s'arrête entre 52 et 53, à 2 petites graduations de 52. Quelle est la température ?$$, 'solution', $$52,4°C.$$),
        'fixation', jsonb_build_object('question', $$Quel est le rôle du réservoir d'un thermomètre ?$$, 'solution', $$Il contient le liquide thermométrique (alcool ou mercure) qui se dilate avec la chaleur.$$)
      ),
      jsonb_build_object(
        'heading', $$Températures de référence et thermomètre médical$$,
        'body', $$La température de la glace fondante est 0°C (le liquide thermométrique est alors "en équilibre thermique" avec la glace). La température de l'eau bouillante est 100°C. Le thermomètre médical, gradué de 35°C à 42°C, sert à repérer la température du corps humain : on l'agite, on met le réservoir en contact avec le corps (aisselle, bouche...), on attend l'équilibre thermique, puis on lit. La température normale du corps humain est 37°C ; au-dessus, c'est une hyperthermie (fièvre) ; en dessous, une hypothermie.$$,
        'highlights', array[$$glace fondante = 0°C ; eau bouillante = 100°C ; corps humain normal = 37°C$$, $$hyperthermie (> 37°C) ; hypothermie (< 37°C)$$]::text[],
        'example', jsonb_build_object('statement', $$Un enfant a une température de 39,4°C. Est-ce une hyperthermie ou une hypothermie ?$$, 'solution', $$Une hyperthermie (fièvre), car 39,4°C est supérieur à la normale de 37°C.$$),
        'fixation', jsonb_build_object('question', $$Que signifie "équilibre thermique" entre un thermomètre et le corps mesuré ?$$, 'solution', $$C'est le moment où le liquide thermométrique cesse de monter ou descendre : sa température devient identique à celle du corps mesuré.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de 6ème accompagne son frère qui fait une forte fièvre au dispensaire. L'infirmière utilise un thermomètre médical dont l'échelle affiche une valeur de 39,4 entre les graduations 39 et 40.$$,
      'questions', array[
        $$Donne le nom de l'instrument utilisé et son usage.$$,
        $$Indique la valeur en degrés Celsius d'une graduation sur cet instrument.$$,
        $$Indique la température relevée et précise s'il s'agit d'une hyperthermie ou d'une hypothermie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la température de l'eau bouillante ?$$,
      'hint', $$C'est un point de repère classique.$$,
      'expected', $$100°C.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'unité internationale (légale) de température ?$$,
      'hint', $$Ce n'est pas le degré Celsius.$$,
      'expected', $$Le Kelvin (K).$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre : faire la lecture / plonger le réservoir dans le liquide / attendre la stabilisation / placer l'œil face au niveau du liquide.$$,
      'hint', $$On plonge d'abord, on lit en dernier.$$,
      'expected', $$1. Plonger le réservoir, 2. Attendre la stabilisation, 3. Placer l'œil face au niveau, 4. Faire la lecture.$$
    ),
    jsonb_build_object(
      'question', $$Un corps a une température de 35°C. S'agit-il d'une hyperthermie ou d'une hypothermie ?$$,
      'hint', $$C'est en dessous de la normale (37°C).$$,
      'expected', $$Une hypothermie.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-temperature-corps';
