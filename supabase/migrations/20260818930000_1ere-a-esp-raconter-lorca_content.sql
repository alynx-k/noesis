-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 855: "L5 Raconter un fait" (https://lyc.ecole-ci.org/course/view.php?id=855),
-- resource id 3909. Support: "Biografía de Lorca", in ¡Más allá! Espagnol
-- 1ère p.26. Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Faits biographiques réels sur
-- Federico García Lorca (naissance, exécution) repris tels quels ;
-- aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-raconter-lorca',
  '1ere',
  'A',
  'espagnol',
  $$Raconter un fait: la biografía de García Lorca$$,
  5,
  '1ere-a-esp-describir-castilla',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Unos alumnos de 1ère A presenciaron un accidente de tráfico en la calle. Afligidos, deciden contar el evento en el periódico del club de español. Se reúnen para identificar los elementos del relato y aprender a usarlos correctamente.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: relatar, un testimonio$$,
        'body', $$« Relatar » significa contar detalladamente un hecho o una historia: « La historia nos relata siempre los hechos pasados ». « Un testimonio » es la declaración de alguien que presenció un acontecimiento: « Como él era el único que asistió al accidente, la policía lo convocó para oír su testimonio ».$$,
        'highlights', array[$$relatar = contar un hecho$$, $$un testimonio = declaración de un testigo$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué diferencia hay entre « describir » y « relatar »?$$, 'solution', $$Describir consiste en dar detalles sobre el aspecto de algo (cómo es); relatar consiste en contar una sucesión de hechos ocurridos (qué pasó, en qué orden).$$)
      ),
      jsonb_build_object(
        'heading', $$Federico García Lorca: una breve biografía$$,
        'body', $$Federico García Lorca nació en Granada el 5 de junio de 1898, en el seno de una familia acomodada económicamente. A lo largo de su vida, escribió numerosas obras poéticas y teatrales que lo convirtieron en uno de los escritores españoles más importantes del siglo XX. Durante la Guerra Civil española, fue fusilado por partidarios del bando franquista, cerca de un olivo, por haber escrito obras consideradas contrarias a la voluntad del régimen de Franco.$$,
        'highlights', array[$$García Lorca : nacido en Granada, escritor español del siglo XX$$, $$fusilado durante la Guerra Civil por partidarios de Franco$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué fue fusilado García Lorca?$$, 'solution', $$Por haber escrito obras consideradas contrarias a la voluntad del régimen franquista, durante la Guerra Civil española.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: los tiempos verbales de la narración$$,
        'body', $$Para narrar una acción se usan principalmente tres tiempos: (1) el presente de indicativo, para una acción habitual o que ocurre en el momento actual (« Solemos cenar a las 8 »; « Cae la lluvia »); (2) el pretérito perfecto simple, para una acción terminada y puntual en el pasado (« Ayer fuimos al cine »; « Nació en Granada »); (3) el pretérito imperfecto de indicativo, para una acción pasada que se prolonga en el tiempo o que describe un estado (« La madre veía la tele cada tarde »; « Su familia era acomodada »).$$,
        'highlights', array[$$presente : acción habitual o actual$$, $$pretérito perfecto simple : acción puntual y terminada en el pasado$$, $$pretérito imperfecto : acción prolongada o estado en el pasado$$]::text[],
        'example', jsonb_build_object('statement', $$Pon en la forma correcta: « Cuando (llegar tú) a la ciudad, (tener tú) doce años. »$$, 'solution', $$Cuando llegaste a la ciudad, tenías doce años. (llegaste = pretérito perfecto simple, acción puntual; tenías = pretérito imperfecto, estado que se prolongaba)$$),
        'fixation', jsonb_build_object('question', $$¿Cuándo se usa el pretérito perfecto simple, en vez del pretérito imperfecto, al narrar un hecho pasado?$$, 'solution', $$Cuando la acción está terminada y es puntual en el pasado (por ejemplo, « nació », « fuimos al cine »), a diferencia del pretérito imperfecto que describe un estado o una acción que se prolongaba en el tiempo.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo del fin de trimestre, el club de español de tu colegio organizó una fiesta con concursos de poema, baile y canciones. Tu amigo español te llama para saber qué pasó.$$,
      'questions', array[
        $$Indica los elementos esenciales de un relato (personajes, lugar, momento, acciones).$$,
        $$Cuenta lo que sucedió durante la fiesta, usando el pretérito perfecto simple para las acciones puntuales.$$,
        $$Añade una frase con el pretérito imperfecto para describir el ambiente general de la fiesta.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Dónde nació Federico García Lorca?$$,
      'hint', $$Una ciudad andaluza.$$,
      'expected', $$En Granada.$$
    ),
    jsonb_build_object(
      'question', $$¿Cómo murió García Lorca?$$,
      'hint', $$Durante la Guerra Civil española.$$,
      'expected', $$Fue fusilado por partidarios del bando franquista.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué tiempo verbal se usa para una acción habitual, como « Solemos cenar a las 8 »?$$,
      'hint', $$Es el tiempo más simple.$$,
      'expected', $$El presente de indicativo.$$
    ),
    jsonb_build_object(
      'question', $$Pon en pretérito perfecto simple: « Ayer (pasar nosotros) un día extraordinario. »$$,
      'hint', $$Es una acción puntual y terminada.$$,
      'expected', $$Ayer pasamos un día extraordinario.$$
    )
  ),
  now()
);
