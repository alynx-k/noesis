-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3172: "L11 Orienter - s'orienter"
-- (https://lyc.ecole-ci.org/course/view.php?id=3172)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31327, redirecting
-- to pluginfile "L11 Orienter - sorienter.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (visite guidée de
-- Salamanque, adverbes de lieu pour orienter). Aucune phrase copiée verbatim
-- du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-orientar-orientarse',
  '2nde',
  'A',
  'espagnol',
  $$Orientar y orientarse$$,
  11,
  '2nde-a-esp-resumir',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante unas vacaciones en Costa de Marfil, un grupo de alumnos guineoecuatorianos visita el club de español de un liceo marfileño. Quieren aprovechar la ocasión para descubrir la ciudad y piden ayuda a sus nuevos amigos. Muy contentos, los alumnos del club se ejercitan en identificar las expresiones para orientar a alguien, antes de guiar a sus invitados durante la visita.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: rincón, paseo, acercarse a$$,
        'body', $$« Un rincón » designa un lugar particular, a menudo pequeño o pintoresco, dentro de una ciudad o de un barrio. « El paseo » es el recorrido que se hace, a pie o en otro medio, para conocer un lugar: durante sus paseos, los turistas descubren monumentos y sitios interesantes. « Acercarse a » significa aproximarse a algo o a alguien, reducir la distancia: el profesor se acerca a los alumnos para que le oigan bien.$$,
        'highlights', array[$$rincón$$, $$paseo$$, $$acercarse a$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Rincón = lugar particular de una ciudad; paseo = recorrido para descubrir un lugar; acercarse a = aproximarse a algo o alguien.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « acercarse a »?$$, 'solution', $$Aproximarse a algo o a alguien, reducir la distancia.$$)
      ),
      jsonb_build_object(
        'heading', $$Visitar una ciudad histórica: Salamanca$$,
        'body', $$El texto de referencia describe cómo visitar la ciudad española de Salamanca en veinticuatro horas, señalando los lugares más interesantes para un paseo turístico: la Plaza Mayor, la Clerecía, la Casa de las Conchas, la Universidad y las Catedrales, el Palacio de Anaya, el río Tormes con su antiguo puente romano, y el Huerto de Calixto y Melibea. Estos sitios emblemáticos explican por qué numerosos turistas visitan la ciudad cada año.$$,
        'highlights', array[$$Salamanca$$, $$sitios turísticos emblemáticos$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita dos sitios turísticos emblemáticos de Salamanca mencionados en la lección.$$, 'solution', $$Por ejemplo la Plaza Mayor y la Universidad (también válido: la Clerecía, el Palacio de Anaya, el río Tormes...).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: los adverbios de lugar$$,
        'body', $$Para orientar a alguien o para orientarse uno mismo, el español usa adverbios y locuciones de lugar como aquí, ahí, allí, cerca de, al lado de, detrás de, encima de, debajo de, lejos de, dentro de y fuera de. Estos adverbios permiten situar con precisión un objeto, un edificio o una persona en relación con un punto de referencia, por ejemplo: « Aquí en Abiyán, hay muchas playas ».$$,
        'highlights', array[$$aquí / ahí / allí$$, $$cerca de / lejos de$$, $$detrás de / encima de$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Adverbio/locución$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Aquí / ahí / allí$$, $$Cerca del hablante / cerca del oyente / lejos de ambos$$),
            jsonb_build_array($$Al lado de / cerca de$$, $$Proximidad$$),
            jsonb_build_array($$Detrás de / encima de / debajo de$$, $$Posición relativa$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Completa: La farmacia está…….. del supermercado (proximidad).$$, 'solution', $$La farmacia está CERCA DE(l) supermercado.$$),
        'fixation', jsonb_build_object('question', $$¿Qué adverbio de lugar se usa para algo lejos tanto del hablante como del oyente?$$, 'solution', $$« Allí ».$$)
      ),
      jsonb_build_object(
        'heading', $$Dar indicaciones para llegar a un lugar$$,
        'body', $$Para guiar a alguien hasta un destino preciso, se combinan los adverbios de lugar con verbos de movimiento y giros: « andar hacia », « girar a la derecha/izquierda », « ir todo recto », « pararse delante de ». Una buena indicación menciona un punto de partida claro, la dirección a seguir y un punto de referencia final, como un edificio conocido, para confirmar que se ha llegado al destino correcto.$$,
        'highlights', array[$$girar a la derecha/izquierda$$, $$ir todo recto$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué elementos debe incluir una buena indicación para llegar a un lugar?$$, 'solution', $$Un punto de partida, la dirección a seguir (giros, todo recto) y un punto de referencia final.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Te encuentras con un turista guineoecuatoriano delante de tu liceo. Quiere ir a la comisaría de tu barrio. Debes orientarlo usando adverbios de lugar y expresiones de dirección para que llegue sin problemas.$$,
      'questions', array[
        $$Cita al menos cuatro adverbios o locuciones de lugar usados para orientar.$$,
        $$Redacta indicaciones para ir desde tu liceo hasta un lugar conocido de tu barrio.$$,
        $$Explica la diferencia de uso entre « aquí », « ahí » y « allí ».$$,
        $$Cita dos sitios turísticos emblemáticos de Salamanca mencionados en la lección.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué adverbio de lugar se usa para un objeto cercano al hablante?$$,
      'hint', $$Es el más corto de los tres adverbios demostrativos de lugar.$$,
      'expected', $$« Aquí ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué expresión se usa para pedir que alguien continúe en línea recta?$$,
      'hint', $$Contiene la palabra « recto ».$$,
      'expected', $$« Ir todo recto ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un rincón » en el contexto turístico?$$,
      'hint', $$Piensa en un lugar pequeño y pintoresco de una ciudad.$$,
      'expected', $$Un lugar particular, a menudo pintoresco, dentro de una ciudad o de un barrio.$$
    ),
    jsonb_build_object(
      'question', $$Cita un monumento o sitio turístico emblemático de Salamanca.$$,
      'hint', $$Piensa en la plaza central de la ciudad.$$,
      'expected', $$Por ejemplo la Plaza Mayor (también válido: la Universidad, la Clerecía, el Palacio de Anaya).$$
    )
  ),
  now()
);
