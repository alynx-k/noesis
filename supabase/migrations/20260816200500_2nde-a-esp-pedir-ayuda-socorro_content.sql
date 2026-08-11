-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3162: "L6 Demander de l'aide ou secours"
-- (https://lyc.ecole-ci.org/course/view.php?id=3162)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31207, redirecting
-- to pluginfile "L6 Demander de laide ou secours.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (demande d'aide sociale,
-- vocabulaire de la précarité, expressions pour solliciter du secours).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-pedir-ayuda-socorro',
  '2nde',
  'A',
  'espagnol',
  $$Pedir ayuda o socorro$$,
  6,
  '2nde-a-esp-invitar-alguien',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Los alumnos del club de español de un liceo se enteran de que un compañero vive en condiciones muy difíciles: su padre está desempleado, y él debe recorrer largas distancias a pie y no siempre puede comer tres veces al día. Conmovidos, los alumnos deciden solicitar ayuda para él. En clase, con el profesor, identifican las expresiones adecuadas para pedir ayuda, las practican e intercambian.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: solicitar ayuda y situación precaria$$,
        'body', $$« Solicitar » (o « pedir ») « ayuda » significa recurrir a alguien para obtener apoyo cuando uno no puede resolver un problema solo: por ejemplo, un alumno puede solicitar la ayuda de su hermano mayor para comprender unos ejercicios de gramática. « Una situación precaria » describe una situación de pobreza o de gran inestabilidad económica, en la que las necesidades básicas de una persona no están garantizadas.$$,
        'highlights', array[$$solicitar/pedir ayuda$$, $$situación precaria$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Solicitar/pedir ayuda = recurrir a alguien para obtener apoyo; situación precaria = situación de pobreza o de gran inestabilidad.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « una situación precaria »?$$, 'solution', $$Una situación de pobreza o de gran inestabilidad económica.$$)
      ),
      jsonb_build_object(
        'heading', $$Un caso concreto: la carta al alcalde$$,
        'body', $$El texto de referencia relata el caso de una persona que, viviendo en una situación precaria, solicita ayuda financiera al alcalde de su localidad. Este tipo de gestión -dirigirse por escrito a una autoridad para exponer una dificultad y pedir apoyo- es habitual cuando una persona o una familia no puede salir sola de una situación de necesidad. La carta permite explicar el problema con claridad y pedir una solución concreta.$$,
        'highlights', array[$$carta al alcalde$$, $$ayuda financiera$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué una persona puede escribir una carta a un alcalde?$$, 'solution', $$Para exponer una dificultad concreta (por ejemplo una situación precaria) y solicitar su ayuda o su apoyo.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las expresiones para pedir socorro$$,
        'body', $$Para pedir ayuda o socorro en español, se dispone de varias fórmulas: « solicitar ayuda », « pedir socorro », o la pregunta directa « ¿puede usted ayudarme? ». También se puede usar el verbo « rogar » seguido de « que » y un verbo en subjuntivo, en un registro más formal: « le ruego que nos ayude ». Estas expresiones se adaptan según el grado de urgencia y el nivel de formalidad de la situación.$$,
        'highlights', array[$$solicitar ayuda$$, $$pedir socorro$$, $$¿puede usted ayudarme?$$, $$rogar que + subjuntivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Registro$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Ayuda! / ¡Socorro!$$, $$Urgente, informal$$),
            jsonb_build_array($$¿Puede usted ayudarme?$$, $$Formal, cortés$$),
            jsonb_build_array($$Le ruego que nos ayude$$, $$Muy formal (carta, discurso oficial)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en petición formal: « ¡Necesitamos ayuda! »$$, 'solution', $$Le rogamos que nos ayude. / Solicitamos su ayuda.$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal sigue a la expresión « rogar que »?$$, 'solution', $$El subjuntivo (por ejemplo: rogar que nos AYUDE).$$)
      ),
      jsonb_build_object(
        'heading', $$Solicitar ayuda ante una crisis colectiva$$,
        'body', $$La solicitud de ayuda no concierne solo a los individuos: también puede dirigirse a organizaciones frente a una crisis colectiva, como una pandemia que provoca el desempleo de muchas familias en un barrio. En estos casos, un portavoz puede dirigirse a una ONG en nombre de sus vecinos, describiendo la situación con precisión y pidiendo explícitamente el apoyo necesario, antes de agradecer la atención recibida.$$,
        'highlights', array[$$portavoz$$, $$crisis colectiva$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué papel desempeña un « portavoz » cuando un barrio pide ayuda a una ONG?$$, 'solution', $$Habla en nombre de los vecinos para describir la situación y solicitar la ayuda de la organización.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$El embajador de España visita tu liceo. Como presidente del club de español, te designan para leer el discurso de la ceremonia. Aprovechas la ocasión para hablarle de un problema de escasez de agua potable en tu ciudad y para solicitar su ayuda.$$,
      'questions', array[
        $$Cita al menos tres expresiones útiles para solicitar ayuda o socorro en español.$$,
        $$Redacta un breve discurso en el que expliques el problema del agua y pidas ayuda al embajador.$$,
        $$Explica la diferencia de registro entre « ¡socorro! » y « le ruego que nos ayude ».$$,
        $$Da tu opinión sobre la importancia de la cooperación internacional para resolver problemas locales.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué expresión formal se usa con « que » + subjuntivo para pedir ayuda?$$,
      'hint', $$Empieza con el verbo « rogar ».$$,
      'expected', $$« Rogar que » (+ subjuntivo), por ejemplo « le ruego que nos ayude ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « una situación precaria »?$$,
      'hint', $$Piensa en la pobreza o la inestabilidad económica.$$,
      'expected', $$Una situación de pobreza o de gran inestabilidad económica.$$
    ),
    jsonb_build_object(
      'question', $$Da una expresión informal y urgente para pedir socorro.$$,
      'hint', $$Es una sola palabra, muy corta, que se grita en caso de peligro.$$,
      'expected', $$« ¡Socorro! » (o « ¡Ayuda! »).$$
    ),
    jsonb_build_object(
      'question', $$¿A quién puede dirigirse un portavoz de un barrio para pedir ayuda ante una crisis?$$,
      'hint', $$Piensa en una organización no gubernamental.$$,
      'expected', $$A una ONG (organización no gubernamental) o a una autoridad como el alcalde.$$
    )
  ),
  now()
);
