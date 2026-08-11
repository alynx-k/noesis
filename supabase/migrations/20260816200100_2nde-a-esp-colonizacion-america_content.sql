-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3157: "L2 Connaitre les réalités de l'Amérique hispa[nique]"
-- (https://lyc.ecole-ci.org/course/view.php?id=3157)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31147, redirecting
-- to pluginfile "L2 Connaitre les réalités de lAmérique hispa.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (colonisation de
-- l'Amérique hispanique, vocabulaire de la conquête, préposition « tras »).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-colonizacion-america',
  '2nde',
  'A',
  'espagnol',
  $$La colonización de la América hispánica$$,
  2,
  '2nde-a-esp-realidad-idioma-espanol',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En un reportaje sobre la Hispanoamérica de hoy, un periodista recuerda que, a partir de 1492, los españoles emprendieron la colonización del continente americano desde la isla que hoy corresponde a la República Dominicana. Al día siguiente, en clase de español, los alumnos quieren saber más: ¿qué países participaron en esta colonización?, ¿por qué la emprendieron?, ¿qué huellas dejó en la lengua y en la cultura de América?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario de la conquista y de la colonización$$,
        'body', $$Tres palabras permiten hablar con precisión de este periodo histórico. « Una conquista » designa la toma de posesión de un territorio, generalmente por la fuerza: en Costa de Marfil, Samory Touré amplió sus territorios gracias a varias conquistas militares. « Un colono » (o « colonizador ») es la persona que se instala en un territorio conquistado para explotarlo y administrarlo en nombre de una potencia extranjera: en Costa de Marfil, Treich-Laplène desempeñó ese papel durante la colonización. « Una potencia », por último, es un país que dispone de una fuerza económica, política o militar suficiente para dominar a otros: hoy en día, Alemania es considerada la primera potencia económica de Europa.$$,
        'highlights', array[$$conquista$$, $$colono$$, $$potencia$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Conquista = toma de un territorio por la fuerza; colono/colonizador = quien se instala y explota el territorio conquistado; potencia = país con fuerza suficiente para dominar a otros.$$),
        'fixation', jsonb_build_object('question', $$¿Cómo se llama a la persona que se instala en un territorio conquistado para explotarlo?$$, 'solution', $$Un colono (o colonizador).$$)
      ),
      jsonb_build_object(
        'heading', $$Las cinco potencias que colonizaron América$$,
        'body', $$La colonización del continente americano no fue obra de un único país europeo. Cinco potencias se repartieron sucesivamente el territorio: España, Portugal, Francia, el Reino Unido (Inglaterra) y los Países Bajos (Holanda). Cada una de ellas perseguía un doble objetivo: por un lado, un objetivo económico, ya que buscaba conquistar y explotar nuevos territorios ricos en materias primas; por otro lado, un objetivo cultural, puesto que también deseaba imponer su propia lengua y sus costumbres a las poblaciones colonizadas.$$,
        'highlights', array[$$cinco potencias colonizadoras$$, $$objetivo económico$$, $$objetivo cultural$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Potencia colonizadora$$, $$Ejemplo de colonia en América$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$España$$, $$México, Perú, Venezuela, Argentina, Chile, entre otras$$),
            jsonb_build_array($$Portugal$$, $$Brasil$$),
            jsonb_build_array($$Francia, Reino Unido, Países Bajos$$, $$Otros territorios repartidos por el continente americano$$)
          )
        ),
        'example', jsonb_build_object('statement', $$¿Qué país europeo colonizó Brasil?$$, 'solution', $$Portugal.$$),
        'fixation', jsonb_build_object('question', $$Cita dos de las cinco potencias que colonizaron América.$$, 'solution', $$Por ejemplo España y Portugal (también válido: Francia, Reino Unido, Países Bajos).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la preposición « tras »$$,
        'body', $$La preposición « tras » significa « después de » o « a continuación de », y se puede aplicar tanto al espacio como al tiempo. Se usa para señalar que un hecho ocurre inmediatamente después de otro: tras la llegada de los primeros colonos, estos comenzaron a abrirse paso a través del continente. De la misma manera, se puede decir que, tras la conquista, los europeos colonizaron América.$$,
        'highlights', array[$$tras = después de$$]::text[],
        'example', jsonb_build_object('statement', $$Completa: ……. la clase de español, los alumnos vuelven a casa.$$, 'solution', $$Tras (o « después de ») la clase de español, los alumnos vuelven a casa.$$),
        'fixation', jsonb_build_object('question', $$Da un sinónimo de la preposición « tras ».$$, 'solution', $$« Después de » (o « a continuación de »).$$)
      ),
      jsonb_build_object(
        'heading', $$Las consecuencias de la colonización$$,
        'body', $$La colonización tuvo consecuencias profundas para las poblaciones indígenas de América. Muchas de ellas fueron obligadas a trabajar en los campos y en las minas al servicio de los colonizadores, que disponían de una fuerza militar muy superior y buscaban constantemente nuevas fuentes de materias primas para desarrollar la economía de sus metrópolis. Con el tiempo, sin embargo, las colonias fueron independizándose progresivamente de las potencias europeas que las habían fundado.$$,
        'highlights', array[$$trabajo forzado$$, $$independencia de las colonias$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué los colonizadores obligaban a las poblaciones indígenas a trabajar en las minas?$$, 'solution', $$Porque necesitaban nuevas fuentes de materias primas para enriquecerse y desarrollar la economía de sus países.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Viste en la televisión un documental sobre la colonización de América en el que se mostraba que los indígenas fueron obligados a trabajar en los campos y en las minas. En clase de español, decides informar a tus compañeros sobre las causas y las potencias responsables de esta colonización.$$,
      'questions', array[
        $$Cita las cinco potencias que colonizaron América.$$,
        $$Explica con tus propias palabras el doble objetivo (económico y cultural) de la colonización.$$,
        $$Da un ejemplo de frase con la preposición « tras » en el sentido de « después de ».$$,
        $$Explica por qué las poblaciones indígenas fueron obligadas a trabajar en los campos y en las minas.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué país colonizó Brasil?$$,
      'hint', $$Es un país vecino de España en la península ibérica.$$,
      'expected', $$Portugal.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa la palabra « colono » en el contexto de la colonización?$$,
      'hint', $$Piensa en el ejemplo de Treich-Laplène en Costa de Marfil.$$,
      'expected', $$Una persona que se instala en un territorio conquistado para explotarlo y administrarlo en nombre de una potencia extranjera.$$
    ),
    jsonb_build_object(
      'question', $$Da un sinónimo de la preposición « tras ».$$,
      'hint', $$Indica que un hecho sucede inmediatamente después de otro.$$,
      'expected', $$« Después de » (o « a continuación de »).$$
    ),
    jsonb_build_object(
      'question', $$Cita al menos tres de las cinco potencias colonizadoras de América.$$,
      'hint', $$Piensa en España, Portugal y sus rivales europeos.$$,
      'expected', $$Por ejemplo España, Portugal y Francia (también válido: Reino Unido, Países Bajos).$$
    )
  ),
  now()
);
