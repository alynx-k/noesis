-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3159: "L4 Exprimer la gratitude"
-- (https://lyc.ecole-ci.org/course/view.php?id=3159)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31171, redirecting
-- to pluginfile "L4 Exprimer la gratitude.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (message d'un ministre
-- guinéo-équatorien remerciant son peuple, expressions de la gratitude).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-gratitud',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la gratitud$$,
  4,
  '2nde-a-esp-etnias-guinea-ecuatorial',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Al final del primer trimestre, una ONG española ofrece diccionarios de español al club de español de un liceo. Los alumnos, muy contentos, quieren expresar su gratitud a esta organización. En clase, con la ayuda del profesor, identifican las expresiones adecuadas para agradecer, las practican y las intercambian entre ellos.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: la gratitud, la oportunidad, la soberanía$$,
        'body', $$« La gratitud » es el sentimiento de reconocimiento que se expresa después de recibir un beneficio o un favor: cuando alguien recibe una recompensa, suele expresar su gratitud a la persona que se la ha dado. « Una oportunidad » es una ocasión favorable que conviene aprovechar: las fiestas de fin de año, por ejemplo, son una buena oportunidad para los vendedores de juguetes. « La soberanía » (o « independencia ») designa la capacidad de un Estado para gobernarse a sí mismo: Costa de Marfil obtuvo su soberanía el 7 de agosto de 1960.$$,
        'highlights', array[$$gratitud$$, $$oportunidad$$, $$soberanía$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Gratitud = reconocimiento por un favor recibido; oportunidad = ocasión favorable; soberanía = independencia de un Estado.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa la palabra « soberanía »?$$, 'solution', $$La independencia de un Estado, su capacidad de gobernarse a sí mismo.$$)
      ),
      jsonb_build_object(
        'heading', $$Un mensaje oficial de agradecimiento$$,
        'body', $$El texto de referencia relata una entrevista entre un periodista y un ministro guineoecuatoriano. El 19 de junio, en un mensaje dirigido a su pueblo, el ministro expresa su gratitud a los habitantes de Guinea Ecuatorial por el comportamiento ejemplar que mantuvieron durante unas manifestaciones celebradas en las ciudades de Malabo y Bata, así como en las localidades vecinas. Este tipo de discurso oficial muestra cómo un dirigente puede usar la lengua española para reconocer públicamente una actitud positiva de la población.$$,
        'highlights', array[$$mensaje oficial$$, $$agradecimiento público$$]::text[],
        'fixation', jsonb_build_object('question', $$¿A quién dirige su mensaje de agradecimiento el ministro?$$, 'solution', $$Al pueblo guineoecuatoriano, por su buena conducta durante unas manifestaciones.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: cómo expresar la gratitud$$,
        'body', $$Para expresar la gratitud en español, se dispone de varias estructuras útiles. La más común es « gracias por » seguida de un verbo en infinitivo o de un sustantivo: « gracias por la oportunidad », « gracias por venir ». También se puede decir « estoy agradecido/a con » alguien, o simplemente « es muy amable » para reconocer un gesto amable. Estas expresiones permiten adaptar el registro según la situación, desde un agradecimiento informal entre amigos hasta un discurso oficial.$$,
        'highlights', array[$$gracias por + infinitivo/sustantivo$$, $$estoy agradecido/a con$$, $$es muy amable$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Gracias por + sustantivo/infinitivo$$, $$Gracias por la oportunidad.$$),
            jsonb_build_array($$Estoy agradecido/a con$$, $$Estoy agradecido con vosotros por vuestra gran movilización.$$),
            jsonb_build_array($$Es muy amable (de tu/su parte)$$, $$Es muy amable de tu parte ayudarnos.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de agradecimiento: (recibir un diccionario).$$, 'solution', $$Gracias por el diccionario. / Estoy agradecido/a por el diccionario.$$),
        'fixation', jsonb_build_object('question', $$Completa: « Estoy agradecido…… vosotros por vuestra ayuda ».$$, 'solution', $$Estoy agradecido CON vosotros por vuestra ayuda.$$)
      ),
      jsonb_build_object(
        'heading', $$Practicar la gratitud en situaciones oficiales$$,
        'body', $$Expresar la gratitud no se limita a la vida cotidiana: también es frecuente en discursos oficiales, por ejemplo cuando una ONG hace una donación o cuando una municipalidad recibe una ayuda financiera extranjera para construir nuevos edificios escolares. En estos casos, el discurso de agradecimiento suele seguir una estructura fija: un saludo (« Estimados señores, buenos días »), la presentación de quién habla, la mención concreta del beneficio recibido, y finalmente la expresión explícita de la gratitud.$$,
        'highlights', array[$$discurso de agradecimiento$$, $$estructura del discurso$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué elementos suele incluir un discurso oficial de agradecimiento?$$, 'solution', $$Un saludo, la presentación de quién habla, la mención del beneficio recibido y la expresión de la gratitud.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$El 5 de junio, Día Mundial del Medio Ambiente, una ONG española hace una donación de material de protección de la selva y participa en una celebración organizada en tu pueblo. Las autoridades te piden que agradezcas a los visitantes en español, delante de todos los presentes.$$,
      'questions', array[
        $$Enumera al menos tres expresiones que sirven para expresar la gratitud en español.$$,
        $$Redacta un breve discurso de agradecimiento dirigido a la ONG española, usando « gracias por ».$$,
        $$Explica en qué consiste el mensaje del ministro guineoecuatoriano relatado en la lección.$$,
        $$Da tu opinión sobre la importancia de agradecer públicamente a quienes ayudan a una comunidad.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué expresión se usa con « por » seguido de un infinitivo o un sustantivo para agradecer?$$,
      'hint', $$Es la expresión más común de agradecimiento en español.$$,
      'expected', $$« Gracias por » (+ infinitivo o sustantivo).$$
    ),
    jsonb_build_object(
      'question', $$¿A quién agradeció el ministro guineoecuatoriano en su mensaje del 19 de junio?$$,
      'hint', $$Piensa en las ciudades de Malabo y Bata.$$,
      'expected', $$Al pueblo guineoecuatoriano, por su buena conducta durante las manifestaciones.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « una oportunidad »?$$,
      'hint', $$Piensa en el ejemplo de las fiestas de fin de año para los vendedores de juguetes.$$,
      'expected', $$Una ocasión favorable que conviene aprovechar.$$
    ),
    jsonb_build_object(
      'question', $$Completa la frase: « Es muy…… de tu parte ayudarme ».$$,
      'hint', $$Es un adjetivo que describe un gesto generoso.$$,
      'expected', $$Es muy AMABLE de tu parte ayudarme.$$
    )
  ),
  now()
);
