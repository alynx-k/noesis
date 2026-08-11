-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3168: "L9 Décrire"
-- (https://lyc.ecole-ci.org/course/view.php?id=3168)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31279, redirecting
-- to pluginfile "L9  Décrire.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (les sept merveilles
-- naturelles d'Argentine, comparatifs et superlatifs pour décrire).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-describir',
  '2nde',
  'A',
  'espagnol',
  $$Describir$$,
  9,
  '2nde-a-esp-poser-preguntas',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En una conversación telefónica con su corresponsal guineoecuatoriano, un alumno promete hablarle de su país durante la próxima llamada. Con la ayuda de un compañero de clase, se ejercita en identificar las fórmulas adecuadas para describir un lugar, para poder presentar su país con precisión y entusiasmo.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: paisaje, maravilla, bosque$$,
        'body', $$« Un paisaje » es el conjunto de elementos naturales que se pueden observar en una extensión de terreno. « Una maravilla » designa un sitio turístico excepcional, de una belleza notable. « Un bosque » es una gran extensión cubierta de árboles y de vegetación densa: la Amazonía, por ejemplo, es un bosque inmenso que se encuentra en América Latina.$$,
        'highlights', array[$$paisaje$$, $$maravilla$$, $$bosque$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Paisaje = conjunto de elementos naturales observables; maravilla = sitio excepcional; bosque = gran extensión de árboles.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es « una maravilla » en el contexto turístico?$$, 'solution', $$Un sitio turístico excepcional, de una belleza y atracción notables.$$)
      ),
      jsonb_build_object(
        'heading', $$Las siete maravillas naturales de Argentina$$,
        'body', $$El texto de referencia describe siete sitios turísticos naturales de Argentina, calificados de « maravillas » por su belleza excepcional: las Salinas Grandes de Jujuy, el Glaciar Perito Moreno de Santa Cruz, el Parque Nacional Talampaya de La Rioja, la Selva Misionera, el Río Mina de Córdoba, el Parque Nacional Nahuel Huapi de Río Negro y el Bañado La Estrella de Formosa, segundo humedal más grande del país. Estos siete lugares fueron elegidos mediante una votación en línea abierta al público.$$,
        'highlights', array[$$siete maravillas de Argentina$$, $$votación en línea$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Maravilla$$, $$Provincia$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Salinas Grandes$$, $$Jujuy$$),
            jsonb_build_array($$Glaciar Perito Moreno$$, $$Santa Cruz$$),
            jsonb_build_array($$Parque Nacional Talampaya$$, $$La Rioja$$),
            jsonb_build_array($$Bañado La Estrella$$, $$Formosa$$)
          )
        ),
        'example', jsonb_build_object('statement', $$¿Cómo se eligieron las siete maravillas naturales de Argentina?$$, 'solution', $$Mediante una votación en línea (votos digitales) abierta al público.$$),
        'fixation', jsonb_build_object('question', $$Cita dos de las siete maravillas naturales de Argentina.$$, 'solution', $$Por ejemplo las Salinas Grandes de Jujuy y el Glaciar Perito Moreno (también válido: cualquier otra de las siete).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: describir con comparativos y superlativos$$,
        'body', $$Para describir de manera precisa y viva, el español utiliza con frecuencia los comparativos (más... que, menos... que, tan... como) y los superlativos (el/la más..., -ísimo/a). Por ejemplo, se puede decir que un lago es « el paisaje más emblemático de la Patagonia », o que una selva tiene « una vegetación densísima ». Estas estructuras permiten resaltar una cualidad excepcional de lo que se describe.$$,
        'highlights', array[$$más... que$$, $$el/la más...$$, $$-ísimo/a$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Superlativo relativo (el/la más)$$, $$El lago Nahuel Huapi es el paisaje más emblemático de la Patagonia.$$),
            jsonb_build_array($$Superlativo absoluto (-ísimo/a)$$, $$La Selva Misionera tiene una vegetación densísima.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma usando un superlativo: « El pedregal de la Rioja es famoso ».$$, 'solution', $$El pedregal de la Rioja es el más famoso (por su notoriedad).$$),
        'fixation', jsonb_build_object('question', $$¿Qué sufijo se añade a un adjetivo para formar un superlativo absoluto?$$, 'solution', $$El sufijo « -ísimo/a » (por ejemplo: densísima).$$)
      ),
      jsonb_build_object(
        'heading', $$Los elementos clave de una buena descripción$$,
        'body', $$Una buena descripción combina varios elementos: los adjetivos calificativos, los comparativos y superlativos, y el verbo « ser » para presentar características esenciales. Al describir una foto o un lugar, conviene mencionar quién o qué aparece, el entorno (naturaleza, objetos) y las sensaciones o impresiones que transmite la escena.$$,
        'highlights', array[$$adjetivos$$, $$verbo SER$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita tres elementos que ayudan a construir una buena descripción en español.$$, 'solution', $$Por ejemplo los adjetivos, los comparativos/superlativos y el verbo « ser ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un grupo de turistas argentinos llega a tu país y quiere informarse sobre los lugares que se pueden visitar y dónde comer. Como guía de turismo improvisado, debes describirles tu país usando comparativos y superlativos para destacar sus atractivos.$$,
      'questions', array[
        $$Cita al menos dos estructuras gramaticales usadas para describir (comparativo y superlativo).$$,
        $$Describe brevemente un paisaje o un monumento de tu país usando un superlativo.$$,
        $$Cita al menos tres de las siete maravillas naturales de Argentina mencionadas en la lección.$$,
        $$Explica cómo se seleccionaron las siete maravillas naturales de Argentina.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué sufijo forma el superlativo absoluto de un adjetivo?$$,
      'hint', $$Aparece en la palabra « densísima ».$$,
      'expected', $$El sufijo « -ísimo/a ».$$
    ),
    jsonb_build_object(
      'question', $$¿Cómo se llama el glaciar mencionado en la lección, ubicado en Santa Cruz?$$,
      'hint', $$Lleva el nombre de un explorador argentino.$$,
      'expected', $$El Glaciar Perito Moreno.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un bosque »?$$,
      'hint', $$Piensa en el ejemplo de la Amazonía.$$,
      'expected', $$Una gran extensión de terreno cubierta de árboles y vegetación densa.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué verbo se usa frecuentemente en las descripciones para presentar una característica esencial?$$,
      'hint', $$Es uno de los dos verbos españoles que corresponden a « être » en francés.$$,
      'expected', $$El verbo « ser ».$$
    )
  ),
  now()
);
