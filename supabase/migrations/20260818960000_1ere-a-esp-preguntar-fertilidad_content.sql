-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1804: "L8 Poser des questions" (https://lyc.ecole-ci.org/course/view.php?id=1804),
-- resource id 15110. Support: "La extensión de la edad de la fertilidad",
-- in ¡Más allá! Espagnol 1ère p.35. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Faits
-- médicaux/scientifiques réels (fertilité féminine, méthodes de
-- reproduction assistée, prévention du COVID-19) repris tels quels ;
-- aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-preguntar-fertilidad',
  '1ere',
  'A',
  'espagnol',
  $$Preguntar: la extensión de la edad de la fertilidad$$,
  8,
  '1ere-a-esp-resumir-moviles-madrid',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de tu colegio invita al Embajador de España a una ceremonia. El embajador se propone responder a las preguntas de los alumnos. Los alumnos de 1ère A están encargados de preparar buenas preguntas para el intercambio.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: preguntar, un/a periodista, saludable$$,
        'body', $$« Preguntar » (opuesto: « contestar / responder ») significa formular una interrogación para obtener una información: « Antes de empezar la clase, el profesor pregunta siempre la fecha a los alumnos ». « Un/a periodista » es la persona que informa al público a través de los medios de comunicación. « Saludable » significa bueno para la salud: « La madre vacuna a su bebé para que esté saludable ».$$,
        'highlights', array[$$preguntar ≠ contestar/responder$$, $$un/a periodista$$, $$saludable$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el antónimo de « preguntar »?$$, 'solution', $$Contestar (o responder).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las técnicas para preguntar$$,
        'body', $$Para preguntar en español, se pueden usar dos tipos de oraciones. Primero, la oración interrogativa directa, introducida por signos de interrogación (¿...?) y a menudo por una palabra interrogativa (qué, cómo, dónde, cuándo, quién, por qué, cuánto): « ¿Les parece posible extender el período de la fertilidad? ». Segundo, la oración declarativa con valor de pregunta indirecta, introducida por expresiones como « me pregunto si... » o « me pregunto cómo... »: « Me pregunto cómo han comprobado los resultados ».$$,
        'highlights', array[$$oración interrogativa directa : ¿...? + palabra interrogativa$$, $$oración declarativa (pregunta indirecta) : « me pregunto si/cómo... »$$]::text[],
        'example', jsonb_build_object('statement', $$Transforma en pregunta: « El profesor de español se llama Manuel. »$$, 'solution', $$¿Cómo se llama el profesor de español?$$),
        'fixation', jsonb_build_object('question', $$¿Cuáles son las dos maneras de formular una pregunta en español, según la regla estudiada?$$, 'solution', $$La oración interrogativa directa (con signos ¿...?) y la oración declarativa con valor de pregunta indirecta (por ejemplo « me pregunto si... »).$$)
      ),
      jsonb_build_object(
        'heading', $$La fertilidad femenina y la ciencia$$,
        'body', $$A partir de los 35 años, y sobre todo desde los 38, la probabilidad de que una mujer se quede embarazada disminuye notablemente, porque los óvulos envejecen con el tiempo. Sin embargo, la ciencia médica ha desarrollado métodos para ayudar a extender las posibilidades de fertilidad, como la inseminación artificial, que permite a muchas parejas concebir un hijo incluso cuando la fertilidad natural ha disminuido.$$,
        'highlights', array[$$fertilidad femenina disminuye notablemente a partir de los 35-38 años$$, $$inseminación artificial : método de reproducción asistida$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué disminuye la fertilidad de la mujer a partir de los 35-38 años?$$, 'solution', $$Porque los óvulos de la mujer envejecen con el tiempo.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$El coronavirus provoca muchas interrogaciones entre los alumnos de tu instituto. A través de una videoconferencia, planteas preguntas a un médico español sobre esta enfermedad.$$,
      'questions', array[
        $$Formula tres preguntas directas (con ¿...?) que le harías al médico sobre el coronavirus.$$,
        $$Formula una pregunta indirecta usando « me pregunto si... ».$$,
        $$Redacta las posibles respuestas del médico a tus preguntas, mencionando al menos dos medidas de prevención.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué signos se usan para introducir una oración interrogativa directa en español?$$,
      'hint', $$Son dos, uno al principio y otro al final.$$,
      'expected', $$¿...? (signo de interrogación de apertura y de cierre).$$
    ),
    jsonb_build_object(
      'question', $$Transforma en pregunta indirecta: « ¿La máquina funciona bien? »$$,
      'hint', $$Usa « me pregunto si... ».$$,
      'expected', $$Me pregunto si la máquina funciona bien.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué método científico se menciona para ayudar a la fertilidad femenina?$$,
      'hint', $$Es una técnica de reproducción asistida.$$,
      'expected', $$La inseminación artificial.$$
    ),
    jsonb_build_object(
      'question', $$Cita una medida de prevención contra el coronavirus mencionada en la lección.$$,
      'hint', $$Se relaciona con la higiene.$$,
      'expected', $$Por ejemplo llevar mascarilla, lavarse frecuentemente las manos, mantener una distancia interpersonal, o vacunarse.$$
    )
  ),
  now()
);
