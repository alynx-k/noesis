-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 810: "L6 Insister" (https://lyc.ecole-ci.org/course/view.php?id=810),
-- resource id 3369. Support: "La educación en la era digital", in ¡Más
-- allá! Espagnol 1ère p.29. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Aucune phrase copiée
-- verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-insistir-educacion-digital',
  '1ere',
  'A',
  'espagnol',
  $$Insistir: la educación en la era digital$$,
  6,
  '1ere-a-esp-raconter-lorca',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El delegado de la clase de 1ère A leyó en el periódico del club de español que muchos alumnos usan el móvil solo para jugar, en vez de estudiar. Con sus compañeros, decide escribir carteles para sensibilizar sobre el buen uso del móvil, insistiendo en los inconvenientes de un mal uso.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: insistir en, la red social, estar conectado$$,
        'body', $$« Insistir en » significa subrayar o reforzar la importancia de una información: « El Gobierno insiste cada día en la necesidad de vivir en paz ». « Una red social » es una plataforma digital que conecta a las personas entre sí: Facebook y WhatsApp son redes sociales. « Estar conectado » significa tener acceso activo a Internet: « Hoy la mayoría de los jóvenes están conectados a Internet ».$$,
        'highlights', array[$$insistir en = subrayar/reforzar una información$$, $$la red social$$, $$estar conectado$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué significa « insistir en una información »?$$, 'solution', $$Reforzar, subrayar o acentuar esa información (no ignorarla ni negarla).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la insistencia$$,
        'body', $$La insistencia marca la importancia de una información. Para expresarla, se usan las fórmulas « no... sino » y « no... sino que ». Se usa « no... sino » cuando el elemento de insistencia es un sustantivo, un adjetivo o un verbo en infinitivo. Se usa « no... sino que » cuando el elemento de insistencia es un verbo conjugado. Existen también las variantes reforzadas « no sólo... sino » y « no sólo... sino que ».$$,
        'highlights', array[$$no... sino + sustantivo/adjetivo/infinitivo$$, $$no... sino que + verbo conjugado$$, $$variantes : no sólo... sino (que)$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Fórmula', 'Se usa cuando...', 'Ejemplo']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$no... sino$$, $$el elemento insistido es un sustantivo/adjetivo/infinitivo$$, $$El profesor no es bueno sino estricto.$$),
            jsonb_build_array($$no... sino que$$, $$el elemento insistido es un verbo conjugado$$, $$El chico no canta bien sino que baila bien.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma para expresar la insistencia: « La era digital ha revolucionado nuestra forma de comunicarnos y ha creado nuevas formas de ocio. »$$, 'solution', $$La era digital no solo ha revolucionado nuestra forma de comunicarnos sino que ha creado nuevas formas de ocio.$$),
        'fixation', jsonb_build_object('question', $$¿Por qué se usa « sino que » y no simplemente « sino » en la frase « El chico no canta bien sino que baila bien »?$$, 'solution', $$Porque el segundo elemento de la frase (« baila ») es un verbo conjugado, y en ese caso la regla exige « sino que » en vez de « sino ».$$)
      ),
      jsonb_build_object(
        'heading', $$El impacto de la era digital en la educación$$,
        'body', $$Las tecnologías de la información no solo son un medio útil para los estudiantes, sino que también facilitan el trabajo de los profesores. Entre las ventajas frecuentemente citadas: la comunicación rápida, la supresión de las distancias, el acceso a los mejores recursos educativos a escala mundial, y el papel reforzado del profesor gracias a nuevas herramientas pedagógicas. En Costa de Marfil, la integración de las TICE (Tecnologías de la Información y la Comunicación para la Enseñanza) en el sistema educativo busca facilitar el aprendizaje de los alumnos.$$,
        'highlights', array[$$ventajas : comunicación rápida, acceso mundial a recursos educativos$$, $$TICE : Tecnologías de la Información y la Comunicación para la Enseñanza$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué significa la sigla TICE?$$, 'solution', $$Tecnologías de la Información y la Comunicación para la Enseñanza.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Has participado en una conferencia sobre la importancia de Internet. Durante una sesión del club de español de tu colegio, decides dar consejos a los miembros sobre el buen uso de Internet.$$,
      'questions', array[
        $$Cita algunas ventajas de Internet para los estudiantes.$$,
        $$Informa a los miembros del club, insistiendo en la importancia de estas ventajas con « no solo... sino que ».$$,
        $$Da un consejo a tus compañeros sobre cómo usar bien Internet para sus estudios.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué fórmula se usa para insistir cuando el elemento insistido es un verbo conjugado?$$,
      'hint', $$Es la fórmula más larga.$$,
      'expected', $$No... sino que.$$
    ),
    jsonb_build_object(
      'question', $$Transforma con « no... sino »: « El profesor de español es bueno y estricto. »$$,
      'hint', $$« Estricto » es un adjetivo.$$,
      'expected', $$El profesor de español no es bueno sino estricto.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué es « una red social »? Da un ejemplo.$$,
      'hint', $$Conecta a las personas.$$,
      'expected', $$Una plataforma digital que conecta a las personas entre sí; por ejemplo Facebook o WhatsApp.$$
    ),
    jsonb_build_object(
      'question', $$Cita una ventaja de las tecnologías de la información para los profesores.$$,
      'hint', $$Facilita su trabajo.$$,
      'expected', $$Por ejemplo, el acceso a nuevas herramientas pedagógicas que refuerzan su papel.$$
    )
  ),
  now()
);
