-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 1772: "L1 Connaitre les réalités de l'Espagne"
-- (https://lyc.ecole-ci.org/course/view.php?id=1772)
-- Resource "Je lis le résumé de la leçon", mod_resource id 14726, redirecting
-- to pluginfile "L1 Connaitre les réalités de lEspagne.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (vocabulaire de base sur
-- l'hispanophonie mondiale, les numéraux cardinaux et ordinaux). Aucune
-- phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-realidad-idioma-espanol',
  '2nde',
  'A',
  'espagnol',
  $$Las realidades del idioma español en el mundo$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un alumno de un liceo de Costa de Marfil gana un concurso organizado por el Instituto Cervantes. El premio es un viaje a España. Antes del viaje, quiere conocer mejor la realidad del español: ¿en cuántos países se habla?, ¿cuántas personas lo hablan?, ¿por qué es una lengua tan importante hoy en día? Junto con sus compañeros de clase, escucha una grabación para descubrirlo.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario esencial sobre la lengua española$$,
        'body', $$Antes de hablar de las realidades del español, conviene fijar tres palabras clave. « El idioma » (sinónimo de « la lengua ») designa el sistema de comunicación de una comunidad: el español es el idioma oficial de España. Un « hispanohablante » es una persona que tiene el español como lengua materna o de uso habitual: los colombianos, por ejemplo, son hispanohablantes. Por último, « nativo/a de » indica el país de origen de una persona, que no coincide siempre con el país donde vive o trabaja: el futbolista Lionel Messi juega en Europa, pero es nativo de Argentina.$$,
        'highlights', array[$$idioma / lengua$$, $$hispanohablante$$, $$nativo/a$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Idioma = lengua; hispanohablante = persona de lengua española; nativo/a de = originario/a de un país determinado.$$),
        'fixation', jsonb_build_object('question', $$¿Cómo se llama a una persona que tiene el español como lengua habitual?$$, 'solution', $$Un hispanohablante.$$)
      ),
      jsonb_build_object(
        'heading', $$El español, una lengua de alcance mundial$$,
        'body', $$El español no es solamente la lengua de España: es el idioma oficial de veintiún países repartidos en varios continentes, entre ellos España, Venezuela, Cuba, México y Guinea Ecuatorial. Ocupa el tercer lugar entre las lenguas más habladas del planeta, justo después del inglés y del chino mandarín. Los especialistas en lingüística calculan además que el número de personas que lo hablan seguirá aumentando de manera notable en las próximas décadas, gracias al crecimiento demográfico de los países hispanohablantes y al interés creciente por aprenderlo como lengua extranjera.$$,
        'highlights', array[$$veintiún países$$, $$tercera lengua más hablada$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Dato$$, $$Información$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Países con el español como lengua oficial$$, $$21 (España, Venezuela, Cuba, México, Guinea Ecuatorial, entre otros)$$),
            jsonb_build_array($$Posición mundial$$, $$Tercera lengua más hablada, después del inglés y del chino mandarín$$),
            jsonb_build_array($$Tendencia$$, $$Crecimiento notable previsto para las próximas décadas$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Cita dos países, además de España, donde el español es lengua oficial.$$, 'solution', $$Por ejemplo Venezuela y Cuba (también válido: México, Guinea Ecuatorial, Argentina, Chile, Ecuador...).$$),
        'fixation', jsonb_build_object('question', $$¿En qué posición se sitúa el español entre las lenguas más habladas del mundo?$$, 'solution', $$En tercera posición, después del inglés y del chino mandarín.$$)
      ),
      jsonb_build_object(
        'heading', $$Los numerales cardinales$$,
        'body', $$Los numerales cardinales sirven para contar y para indicar una cantidad exacta. Se usan, por ejemplo, para hablar del número de países, de habitantes o de años. España cuenta con diecisiete comunidades autónomas. Una persona puede tener veintisiete años. Una biblioteca puede reunir cien libros. Estos numerales acompañan directamente al sustantivo, sin preposición: « diecisiete comunidades », « cien libros ».$$,
        'highlights', array[$$numerales cardinales$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Cifra$$, $$Numeral cardinal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$17$$, $$diecisiete$$),
            jsonb_build_array($$27$$, $$veintisiete$$),
            jsonb_build_array($$100$$, $$cien$$),
            jsonb_build_array($$21$$, $$veintiuno / veintiún (delante de sustantivo masculino)$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Escribe con letras el número 21 usado delante de la palabra « países ».$$, 'solution', $$Veintiún países.$$)
      ),
      jsonb_build_object(
        'heading', $$Los numerales ordinales$$,
        'body', $$A diferencia de los cardinales, los numerales ordinales no indican cantidad sino orden o clasificación dentro de una serie. Enero es el primer mes del año; diciembre es el duodécimo, es decir el último. Los ordinales concuerdan en género y número con el sustantivo al que acompañan, y « primero » y « tercero » pierden la « o » final delante de un sustantivo masculino singular (primer mes, tercer país).$$,
        'highlights', array[$$numerales ordinales$$, $$primer$$, $$duodécimo$$]::text[],
        'example', jsonb_build_object('statement', $$¿Cómo se dice « el segundo mes del año » en español?$$, 'solution', $$El segundo mes del año (febrero).$$),
        'fixation', jsonb_build_object('question', $$¿Qué numeral ordinal corresponde al mes de diciembre?$$, 'solution', $$Duodécimo (12º), porque diciembre es el último mes del año.$$)
      ),
      jsonb_build_object(
        'heading', $$Una lengua en plena expansión$$,
        'body', $$Más de cuatrocientos millones de personas tienen el español como lengua materna, y esta cifra no deja de crecer. Los expertos predicen que hacia el año 2050 el número de hispanohablantes en el mundo podría superar los quinientos treinta millones. Este dinamismo es particularmente visible en Estados Unidos, donde la comunidad hispana crece rápidamente y se integra en todos los ámbitos de la sociedad: la demanda de documentos e informaciones en español aumenta allí de forma exponencial. El español es, además, la segunda lengua extranjera más estudiada del mundo, con más de catorce millones de estudiantes oficiales.$$,
        'highlights', array[$$más de 400 millones de nativos$$, $$expansión en Estados Unidos$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué se puede decir que la comunidad hispana de Estados Unidos está en plena expansión?$$, 'solution', $$Porque crece rápidamente, se integra en todos los ámbitos de la sociedad y la demanda de documentos e informaciones en español aumenta de forma exponencial.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo del día mundial del idioma español, escuchaste en la radio un debate sobre los idiomas más hablados en el mundo. Impresionado por la posición del español, decides compartir lo aprendido con el club de español de tu liceo, citando países hispanohablantes, cifras clave y algunos numerales.$$,
      'questions', array[
        $$Cita al menos tres países donde el español es lengua oficial.$$,
        $$Presenta la importancia del español en el mundo con dos datos concretos (posición mundial, número de hablantes).$$,
        $$Escribe con letras los numerales cardinales 17, 21 y 100.$$,
        $$Explica, con un ejemplo, la diferencia entre un numeral cardinal y un numeral ordinal.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Cuántos países tienen el español como lengua oficial?$$,
      'hint', $$Es el mismo número que se usa en « veintiún países ».$$,
      'expected', $$Veintiún (21) países.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué lugar ocupa el español entre las lenguas más habladas del mundo?$$,
      'hint', $$Va después del inglés y del chino mandarín.$$,
      'expected', $$El tercer lugar.$$
    ),
    jsonb_build_object(
      'question', $$Escribe con letras el número 543.$$,
      'hint', $$Es un numeral cardinal compuesto de centenas, decenas y unidades.$$,
      'expected', $$Quinientos cuarenta y tres.$$
    ),
    jsonb_build_object(
      'question', $$¿Cómo se llama a una persona nativa de Argentina que vive y trabaja en Europa?$$,
      'hint', $$Piensa en el ejemplo de un futbolista famoso.$$,
      'expected', $$Es nativa de Argentina, aunque resida y trabaje en Europa (como el ejemplo de Lionel Messi).$$
    )
  ),
  now()
);
