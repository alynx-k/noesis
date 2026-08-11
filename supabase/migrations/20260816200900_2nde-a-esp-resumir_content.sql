-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3170: "L10 Résumer"
-- (https://lyc.ecole-ci.org/course/view.php?id=3170)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31303, redirecting
-- to pluginfile "L10 Résumer.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (déclaration d'enfants
-- pour la sécurité routière, expressions pour résumer un texte).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-resumir',
  '2nde',
  'A',
  'espagnol',
  $$Resumir un texto o un discurso$$,
  10,
  '2nde-a-esp-describir',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Con motivo del Día Mundial de la Seguridad Vial, el prefecto de una localidad dio una conferencia. Algunos alumnos no pudieron asistir. Al día siguiente, en clase de español, el profesor pide a los que sí participaron que informen a sus compañeros ausentes. Deben entonces identificar y usar las expresiones adecuadas para resumir correctamente lo que escucharon.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: seguridad vial, tráfico, herido$$,
        'body', $$« La seguridad vial » designa el conjunto de reglas y comportamientos que permiten evitar accidentes en las carreteras: el civismo en la conducta favorece la seguridad vial. « El tráfico » es la circulación de vehículos en las vías públicas, que los policías regulan cuando los semáforos no funcionan. « Un herido » es una persona que ha sufrido una lesión, por ejemplo tras un accidente de tráfico.$$,
        'highlights', array[$$seguridad vial$$, $$tráfico$$, $$herido/a$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Seguridad vial = reglas para evitar accidentes; tráfico = circulación de vehículos; herido/a = persona lesionada.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « la seguridad vial »?$$, 'solution', $$El conjunto de reglas y comportamientos que permiten evitar accidentes en las carreteras.$$)
      ),
      jsonb_build_object(
        'heading', $$Una declaración de niños por la seguridad vial$$,
        'body', $$El texto de referencia resume la declaración de un grupo de niños de un colegio español, presentada con motivo de una semana mundial de la seguridad vial. En pocas palabras, estos niños piden que los responsables del tráfico establezcan leyes que protejan mejor a los menores en las carreteras, subrayando así el papel activo que pueden desempeñar los jóvenes en la defensa de sus propios derechos.$$,
        'highlights', array[$$declaración de niños$$, $$protección de los menores$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué piden los niños del colegio en su declaración?$$, 'solution', $$Que los responsables del tráfico hagan leyes que protejan a los niños en las carreteras.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las expresiones para resumir$$,
        'body', $$Para resumir un texto o un discurso oralmente, el español dispone de numerosas expresiones fijas: « en resumidas cuentas », « en resumen », « en definitiva », « en suma », « para resumir », « en pocas palabras » (o « en breves palabras »), y también « total » al principio de una frase de conclusión. Estas expresiones anuncian que sigue una síntesis de las ideas principales, sin entrar en todos los detalles del texto original.$$,
        'highlights', array[$$en resumen$$, $$en pocas palabras$$, $$total$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$En resumen / en resumidas cuentas$$, $$Introduce una síntesis general$$),
            jsonb_build_array($$En pocas palabras$$, $$Anuncia una conclusión breve$$),
            jsonb_build_array($$Total, que...$$, $$Introduce la conclusión de una anécdota$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Resume en una frase: « Juan estaba preocupado porque su hija tuvo un accidente y se fracturó el pie ».$$, 'solution', $$En resumen, Juan estaba preocupado por el accidente y la fractura de su hija.$$),
        'fixation', jsonb_build_object('question', $$Da dos expresiones que sirven para anunciar un resumen.$$, 'solution', $$Por ejemplo « en resumen » y « en pocas palabras » (también válido: en definitiva, en suma, para resumir, total).$$)
      ),
      jsonb_build_object(
        'heading', $$Resumir un discurso oficial$$,
        'body', $$Resumir un discurso oficial, como el de un secretario general o de un comisario de policía, implica identificar el mensaje esencial y las medidas propuestas, sin repetir todos los ejemplos ni detalles secundarios. Por ejemplo, un discurso extenso sobre la seguridad vial puede resumirse en dos ideas clave: la necesidad de proteger a los niños y la exigencia de prudencia por parte de los conductores.$$,
        'highlights', array[$$mensaje esencial$$, $$ideas clave$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué se debe identificar antes de resumir un discurso?$$, 'solution', $$El mensaje esencial y las ideas o medidas clave, sin repetir los detalles secundarios.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo de la Semana Mundial sobre la Seguridad Vial de las Naciones Unidas, escuchaste el mensaje del Secretario General llamando la atención sobre el creciente número de muertes en las carreteras. De regreso a clase, tu profesor de español te pide que resumas lo que dijo.$$,
      'questions', array[
        $$Cita al menos tres expresiones que sirven para resumir en español.$$,
        $$Resume en dos o tres frases el mensaje del Secretario General sobre la seguridad vial.$$,
        $$Explica qué piden los niños de la declaración estudiada en la lección.$$,
        $$Da tu opinión sobre la importancia de involucrar a los niños en la sensibilización sobre la seguridad vial.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da dos expresiones útiles para anunciar un resumen en español.$$,
      'hint', $$Una empieza por « en » y otra por « total ».$$,
      'expected', $$Por ejemplo « en resumen » y « total » (también válido: en pocas palabras, en definitiva, en suma).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué piden los niños del colegio español en su declaración sobre la seguridad vial?$$,
      'hint', $$Piensa en las leyes y en la protección en las carreteras.$$,
      'expected', $$Que los responsables del tráfico hagan leyes que protejan a los niños en las carreteras.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un herido »?$$,
      'hint', $$Piensa en las consecuencias de un accidente.$$,
      'expected', $$Una persona que ha sufrido una lesión, por ejemplo en un accidente.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué se debe evitar al resumir un texto?$$,
      'hint', $$Piensa en la diferencia entre un resumen y el texto completo.$$,
      'expected', $$Repetir todos los detalles secundarios; solo se conservan las ideas esenciales.$$
    )
  ),
  now()
);
