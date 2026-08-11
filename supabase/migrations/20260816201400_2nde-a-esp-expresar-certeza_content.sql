-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3178: "L16 Exprimer la certitude"
-- (https://lyc.ecole-ci.org/course/view.php?id=3178)
-- Contenu extrait de la même pluginfile que L13/L14/L15 (pages 10-13 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 4 Fiche 4".
-- Support: analyse d'une spécialiste sur les fake news / "El imperio de la
-- falsedad" de Màrius Carol. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Aucune phrase copiée
-- verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-certeza',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la certeza$$,
  15,
  '2nde-a-esp-pedir-dar-opinion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Unos alumnos leen en un diario esta información: « 12 muertos en un atentado terrorista, cerca de la Embajada marfileña en Malí… ». Escandalizados, quieren saber si la noticia es verdadera. En clase de español, identifican las expresiones que permiten expresar certeza para poder juzgar con precisión la veracidad de una información.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: certeza, estar seguro, usuario$$,
        'body', $$« Una certeza » es un hecho indiscutible, del que no se puede dudar: que los alumnos serios y trabajadores aprueben siempre sus exámenes es casi una certeza. « Estar seguro/a » (o « estar convencido/a ») significa no tener ninguna duda sobre algo. « El usuario » es la persona que utiliza un servicio, por ejemplo una red social o una compañía telefónica.$$,
        'highlights', array[$$certeza$$, $$estar seguro/a$$, $$usuario$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Certeza = hecho indiscutible; estar seguro/a = no tener ninguna duda; usuario = quien utiliza un servicio.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es « una certeza »?$$, 'solution', $$Un hecho indiscutible, del que no se puede dudar.$$)
      ),
      jsonb_build_object(
        'heading', $$El imperio de la falsedad en las redes sociales$$,
        'body', $$El texto de referencia, inspirado en un análisis de una especialista en tecnología informática, pone de relieve el impacto de las noticias falsas en los usuarios de las redes sociales. Según ella, es una certeza que las noticias falsas están superando a las verdaderas, y que la inteligencia artificial facilita la creación de contenidos falsificados, lo que representa un peligro real para la información y la democracia.$$,
        'highlights', array[$$noticias falsas$$, $$inteligencia artificial$$]::text[],
        'fixation', jsonb_build_object('question', $$Según el texto, ¿qué papel juega la inteligencia artificial en la difusión de noticias falsas?$$, 'solution', $$Facilita la creación de contenidos falsificados que se hacen pasar por reales.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la certeza$$,
        'body', $$Para expresar certeza en español se pueden usar adverbios como « ciertamente » y « convincentemente », o expresiones como « estar seguro/seguirísimo de que », « estar (absolutamente) convencido de que », « no hay duda de que », « es obvio que », « tener la certeza de que ». Estas expresiones se construyen generalmente con el modo indicativo, ya que afirman un hecho considerado verdadero.$$,
        'highlights', array[$$ciertamente$$, $$no hay duda de que$$, $$es obvio que$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión de certeza$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ciertamente$$, $$Ciertamente, va a llover.$$),
            jsonb_build_array($$No hay duda de que$$, $$No hay duda de que el profesor se marchará.$$),
            jsonb_build_array($$Estoy convencido/a de que$$, $$Estoy convencido de que dice la verdad.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de certeza: « Las redes sociales difunden noticias falsas ».$$, 'solution', $$Es obvio que las redes sociales difunden noticias falsas. / No hay duda de que las redes sociales difunden noticias falsas.$$),
        'fixation', jsonb_build_object('question', $$Da dos adverbios que expresan certeza en español.$$, 'solution', $$« Ciertamente » y « convincentemente ».$$)
      ),
      jsonb_build_object(
        'heading', $$Verificar la información antes de afirmar con certeza$$,
        'body', $$Expresar certeza implica una responsabilidad: antes de afirmar algo con seguridad, especialmente en el contexto de la prensa o de las redes sociales, conviene comprobar la fuente y la veracidad de la información. Un periodista, por ejemplo, debe verificar todos los datos que recibe y estar seguro de su autenticidad antes de publicarlos, para mantener su credibilidad.$$,
        'highlights', array[$$verificar la fuente$$, $$credibilidad$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué debe hacer un periodista antes de afirmar algo con certeza?$$, 'solution', $$Comprobar la fuente y la veracidad de la información, para estar seguro de su autenticidad.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Después de leer un artículo titulado « El imperio de la falsedad », hablas con tus compañeros del club de español sobre la difusión de noticias falsas en las redes sociales y sobre el papel de la inteligencia artificial en este fenómeno.$$,
      'questions', array[
        $$Cita al menos tres expresiones que sirven para expresar certeza en español.$$,
        $$Explica, con tus propias palabras, en qué consiste el « imperio de la falsedad » evocado en el título del texto.$$,
        $$Da tu opinión, con certeza, sobre la fiabilidad de la información encontrada en las redes sociales.$$,
        $$Explica qué debe hacer un periodista antes de publicar una información.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da un adverbio que exprese certeza en español.$$,
      'hint', $$Termina en « -mente ».$$,
      'expected', $$Por ejemplo « ciertamente » (también válido: convincentemente).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué expresión con « duda » se usa para expresar certeza absoluta?$$,
      'hint', $$Empieza con « no hay ».$$,
      'expected', $$« No hay duda de que ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué es « un usuario »?$$,
      'hint', $$Piensa en alguien que usa una red social o un servicio.$$,
      'expected', $$La persona que utiliza un servicio (por ejemplo una red social).$$
    ),
    jsonb_build_object(
      'question', $$Según el texto, ¿qué está superando qué en las redes sociales?$$,
      'hint', $$Piensa en la falsedad frente a la realidad.$$,
      'expected', $$Las noticias falsas están superando a las verdaderas.$$
    )
  ),
  now()
);
