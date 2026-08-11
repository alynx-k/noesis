-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3173: "L12 Raconter un fait"
-- (https://lyc.ecole-ci.org/course/view.php?id=3173)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31339, redirecting
-- to pluginfile "L12 Raconter un fait.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (enquête du PNUD sur les
-- migrants africains, prétérit simple vs imparfait pour raconter).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-raccontar-un-hecho',
  '2nde',
  'A',
  'espagnol',
  $$Contar un hecho pasado$$,
  12,
  '2nde-a-esp-orientar-orientarse',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Con motivo del Día Mundial de los Migrantes, el ayuntamiento de una localidad organiza una conferencia para sensibilizar sobre la emigración clandestina. En clase de español, el profesor pide a los alumnos que relaten lo que retuvieron de la conferencia. Deben entonces identificar y usar las expresiones y los tiempos verbales adecuados para contar hechos pasados.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: relato, peligro, migrante$$,
        'body', $$« Un relato » es una narración de hechos, reales o imaginarios: narrar una historia es hacer un relato. « Un peligro » es una situación que puede causar daño, como subir a un autobús en marcha. « Un migrante » es una persona que abandona su país para instalarse en otro, a menudo en busca de mejores condiciones de vida: los africanos que viajan de manera irregular por mar hacia Europa son migrantes.$$,
        'highlights', array[$$relato$$, $$peligro$$, $$migrante$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Relato = narración de hechos; peligro = situación que puede causar daño; migrante = persona que deja su país para instalarse en otro.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es « un migrante »?$$, 'solution', $$Una persona que abandona su país para instalarse en otro, a menudo en busca de mejores condiciones de vida.$$)
      ),
      jsonb_build_object(
        'heading', $$Una encuesta sobre la emigración africana$$,
        'body', $$El texto de referencia relata una encuesta realizada por el PNUD (Programa de las Naciones Unidas para el Desarrollo) entre casi dos mil migrantes africanos, procedentes de treinta y nueve países, sobre los motivos de su emigración hacia Europa. La encuesta reveló que buscaban sobre todo una vida mejor, tanto para ellos como para sus familias, así como más libertad para elegir a sus dirigentes políticos.$$,
        'highlights', array[$$encuesta del PNUD$$, $$motivos de la emigración$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué organismo realizó la encuesta sobre los migrantes africanos mencionada en la lección?$$, 'solution', $$El PNUD (Programa de las Naciones Unidas para el Desarrollo).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: pretérito perfecto simple e imperfecto$$,
        'body', $$Para contar un hecho pasado en español, se usan principalmente dos tiempos. El pretérito perfecto simple (o indefinido) se usa para una acción ya terminada y puntual en el pasado: « se constató que encontrar trabajo no fue el único motivo ». El pretérito imperfecto de indicativo, en cambio, describe una acción en desarrollo, habitual o de fondo en el pasado: « los migrantes buscaban una mejor vida ».$$,
        'highlights', array[$$pretérito perfecto simple$$, $$pretérito imperfecto$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Tiempo$$, $$Uso$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Pretérito perfecto simple$$, $$Acción terminada y puntual$$, $$El informe encuestó a 1.970 migrantes.$$),
            jsonb_build_array($$Pretérito imperfecto$$, $$Acción en desarrollo o habitual$$, $$Los encuestados que ganaban un salario mandaban parte a sus países.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Elige el tiempo correcto: « Ellos (decidió/decidieron) emigrar por falta de trabajo ».$$, 'solution', $$Ellos DECIDIERON emigrar (pretérito perfecto simple, acción puntual y terminada).$$),
        'fixation', jsonb_build_object('question', $$¿Qué tiempo se usa para una acción habitual o en desarrollo en el pasado?$$, 'solution', $$El pretérito imperfecto de indicativo.$$)
      ),
      jsonb_build_object(
        'heading', $$Narrar la historia de una persona$$,
        'body', $$Al narrar la historia de vida de una persona, conviene combinar ambos tiempos: el imperfecto para describir el contexto o la situación de fondo (« la situación económica de la familia era muy difícil »), y el perfecto simple para las acciones puntuales que hacen avanzar la historia (« decidió emigrar », « viajó a Madrid »). También se pueden usar marcadores narrativos como « un día », « la vez pasada » o « érase una vez ».$$,
        'highlights', array[$$marcadores narrativos$$, $$un día$$, $$érase una vez$$]::text[],
        'fixation', jsonb_build_object('question', $$Da un marcador narrativo típico para empezar un relato.$$, 'solution', $$Por ejemplo « un día » o « érase una vez ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu mejor amigo acaba de regresar a tu país tras un intento fallido de llegar a España por mar. Te ha contado su desventura y decides relatar su historia a los miembros del club de español, usando correctamente los tiempos del pasado.$$,
      'questions', array[
        $$Cita los dos tiempos verbales principales usados para contar un hecho pasado en español.$$,
        $$Explica la diferencia de uso entre el pretérito perfecto simple y el pretérito imperfecto.$$,
        $$Redacta un breve relato (3-4 frases) sobre la decisión de emigrar de una persona ficticia.$$,
        $$Explica, según la lección, cuáles son los principales motivos de la emigración de los migrantes africanos encuestados.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué tiempo verbal se usa para una acción puntual y terminada en el pasado?$$,
      'hint', $$También se llama « indefinido ».$$,
      'expected', $$El pretérito perfecto simple (indefinido).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué organismo internacional realizó la encuesta sobre los migrantes africanos?$$,
      'hint', $$Es un programa de las Naciones Unidas.$$,
      'expected', $$El PNUD (Programa de las Naciones Unidas para el Desarrollo).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un peligro »?$$,
      'hint', $$Piensa en el ejemplo de subir a un autobús en marcha.$$,
      'expected', $$Una situación que puede causar daño.$$
    ),
    jsonb_build_object(
      'question', $$Da un marcador narrativo usado para empezar un relato.$$,
      'hint', $$Es una expresión típica de los cuentos.$$,
      'expected', $$Por ejemplo « érase una vez » (también válido: un día, la vez pasada).$$
    )
  ),
  now()
);
