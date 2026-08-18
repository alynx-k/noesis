-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 859: "L1 Connaitre les réalités de l'espagnol dans le
-- monde" (https://lyc.ecole-ci.org/course/view.php?id=859), resource id 3957.
-- Support: "Los retos económicos de Sánchez", in ¡Más allá! Espagnol 1ère
-- p.6. Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Aucune phrase copiée verbatim du
-- PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-retos-socioeconomicos-espana',
  '1ere',
  'A',
  'espagnol',
  $$Los retos socioeconómicos de España$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un alumno de 1ère vuelve de un viaje a España con muchas fotos. En clase, sus compañeros las miran con curiosidad y quieren saber más sobre la situación actual del país. Deciden entonces identificar y analizar las realidades socioeconómicas de España para poder informar con precisión a los demás miembros del club de español.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: reto, reforma, fraude fiscal$$,
        'body', $$« Un reto » (sinónimo: « un desafío ») es una dificultad importante que hay que superar. « Una reforma » es el cambio que se hace a una ley o a un sistema cuando éste ya no funciona bien: cuando una disposición legal deja de ser eficaz, los dirigentes de un país deciden reformarla. « Cometer un fraude fiscal » significa no pagar los impuestos que se deben al Estado.$$,
        'highlights', array[$$un reto$$, $$una reforma$$, $$fraude fiscal$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Reto = desafío importante; reforma = cambio de una ley o de un sistema; fraude fiscal = no pagar los impuestos debidos.$$),
        'fixation', jsonb_build_object('question', $$¿Qué diferencia hay entre « un reto » y « una reforma »?$$, 'solution', $$Un reto es la dificultad a superar; una reforma es el cambio concreto que se hace para superarla.$$)
      ),
      jsonb_build_object(
        'heading', $$Los desafíos económicos del gobierno español$$,
        'body', $$El texto de referencia presenta los retos socioeconómicos que enfrenta el Primer Ministro español para relanzar la economía del país. Entre las reformas previstas figuran: la actualización de la normativa laboral, la reforma del sistema de pensiones para garantizar su sostenibilidad, la creación de un nuevo modelo tributario más justo, una mejor financiación de las regiones autónomas, y la reforma del mercado energético.$$,
        'highlights', array[$$normativa laboral$$, $$sistema de pensiones$$, $$modelo tributario$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita dos de los retos económicos mencionados en el texto.$$, 'solution', $$Por ejemplo: la reforma del sistema de pensiones y la creación de un nuevo modelo tributario (también válido: normativa laboral, financiación autonómica, mercado energético).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la obligación personal$$,
        'body', $$Para expresar una obligación personal en español se pueden usar varias construcciones: a) DEBER + INFINITIVO (« El gobierno debe estudiar el papel de los impuestos »); b) TENER QUE + INFINITIVO (« El gobierno tiene que abordar una reforma completa »); c) SER PRECISO / SER NECESARIO / SER OBLIGATORIO / HACER FALTA + QUE + verbo en subjuntivo (« Hace falta que el gobierno aborde las reformas »). Las tres primeras construcciones usan el infinitivo, mientras que la última exige el modo subjuntivo porque introduce una obligación mediante « que ».$$,
        'highlights', array[$$deber + infinitivo$$, $$tener que + infinitivo$$, $$hacer falta que + subjuntivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Construcción$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Deber + infinitivo$$, $$El ministro debe reformar el sistema.$$),
            jsonb_build_array($$Tener que + infinitivo$$, $$Los ciudadanos tienen que pagar sus impuestos.$$),
            jsonb_build_array($$Hacer falta que + subjuntivo$$, $$Hace falta que el gobierno actúe rápido.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de obligación: « Los jóvenes / estudiar mucho para aprobar ».$$, 'solution', $$Los jóvenes tienen que estudiar mucho para aprobar. / Es necesario que los jóvenes estudien mucho para aprobar.$$),
        'fixation', jsonb_build_object('question', $$¿Con qué modo verbal se construye « hacer falta que »?$$, 'solution', $$Con el modo subjuntivo, ya que la obligación se expresa a través de la conjunción « que ».$$)
      ),
      jsonb_build_object(
        'heading', $$Informar a los compañeros con precisión$$,
        'body', $$Después de estudiar un tema de actualidad, es importante saber resumirlo con precisión para informar a los demás: se citan primero los hechos principales (los retos identificados), y luego se explican con sus propias palabras usando las expresiones de obligación aprendidas, para mostrar por qué cada reforma es necesaria.$$,
        'highlights', array[$$resumir$$, $$informar con precisión$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué es útil usar las expresiones de obligación al informar sobre un tema de actualidad?$$, 'solution', $$Porque permiten mostrar con claridad por qué una acción o una reforma es necesaria, y no solamente describir los hechos.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Durante la reunión del club de español, tus compañeros quieren saber más sobre la situación económica de España después de tu viaje. Decides explicarles los retos del país y por qué ciertas reformas son necesarias.$$,
      'questions', array[
        $$Cita al menos tres retos socioeconómicos mencionados en el texto.$$,
        $$Explica con tus propias palabras en qué consiste la reforma del sistema de pensiones.$$,
        $$Usando « tener que » y « hacer falta que », indica dos obligaciones del gobierno español frente a estos retos.$$,
        $$Da tu opinión: ¿por qué crees que es importante reformar ahora el sistema de pensiones?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué significa « un reto » en español?$$,
      'hint', $$Piensa en un sinónimo con « desafío ».$$,
      'expected', $$Una dificultad importante que hay que superar (sinónimo: un desafío).$$
    ),
    jsonb_build_object(
      'question', $$Transforma con « deber + infinitivo »: « El gobierno / reformar el sistema de pensiones ».$$,
      'hint', $$Conjuga « deber » y deja el segundo verbo en infinitivo.$$,
      'expected', $$El gobierno debe reformar el sistema de pensiones.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué modo verbal exige la construcción « hacer falta que »?$$,
      'hint', $$No es el indicativo.$$,
      'expected', $$El modo subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$Cita un reto económico mencionado en el texto relacionado con los impuestos.$$,
      'hint', $$Piensa en el « modelo tributario ».$$,
      'expected', $$La creación de un nuevo modelo tributario (también válido: la lucha contra el fraude fiscal).$$
    )
  ),
  now()
);
