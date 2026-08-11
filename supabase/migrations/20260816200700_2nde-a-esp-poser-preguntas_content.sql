-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3165: "L8 Poser des questions"
-- (https://lyc.ecole-ci.org/course/view.php?id=3165)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31255, redirecting
-- to pluginfile "L8 Poser des questions.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (interview sur les
-- manifestations au Chili, pronoms interrogatifs). Aucune phrase copiée
-- verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-poser-preguntas',
  '2nde',
  'A',
  'espagnol',
  $$Formular preguntas$$,
  8,
  '2nde-a-esp-expresion-interpelacion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Los miembros del club de español de un liceo organizan una visita a la Embajada de España en Costa de Marfil. Planean entrevistar al Secretario de la Embajada sobre las realidades actuales de España. Muy entusiasmados, los alumnos buscan en clase las expresiones adecuadas para formular preguntas y preparan cuidadosamente su cuestionario.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: el alza, el boleto, el disturbio$$,
        'body', $$« El alza » designa un aumento de precio: por ejemplo, el alza del precio del pan en Francia provocó la Revolución de 1789. « El boleto » es el billete que permite subir a un transporte público: cada pasajero debe tener su boleto para subir al autobús. « Un disturbio », por último, es un desorden o una agitación colectiva: los disturbios en un aula, por ejemplo, impiden a los alumnos concentrarse para trabajar.$$,
        'highlights', array[$$el alza$$, $$el boleto$$, $$el disturbio$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Alza = aumento de precio; boleto = billete de transporte; disturbio = desorden o agitación colectiva.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « el alza »?$$, 'solution', $$Un aumento de precio.$$)
      ),
      jsonb_build_object(
        'heading', $$Un caso de actualidad: las protestas en Chile$$,
        'body', $$El texto de referencia es una entrevista en la que un periodista pregunta a alguien sobre el motivo y el desarrollo de unas protestas ocurridas en Chile. Estas protestas fueron provocadas por el alza del precio del boleto del metro, y movilizaron a casi un millón de personas en las calles de Santiago. Este tipo de entrevista periodística es un ejemplo perfecto de contexto en el que se necesitan preguntas precisas y bien formuladas.$$,
        'highlights', array[$$protestas en Chile$$, $$alza del boleto del metro$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué generó las protestas en Chile, según el texto?$$, 'solution', $$El alza del precio del boleto del metro.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: los pronombres interrogativos$$,
        'body', $$Para formular una pregunta en español, se usan pronombres interrogativos como qué, cuál(es), cuándo, cómo, por qué, cuánto/a/os/as, quién(es) y dónde, colocados en la forma verbal de la pregunta. Una particularidad importante del español escrito es que toda frase interrogativa lleva un signo de interrogación invertido (¿) al principio y el signo normal (?) al final: por ejemplo, « ¿Qué generó las protestas? ».$$,
        'highlights', array[$$pronombres interrogativos$$, $$¿...?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Qué$$, $$Pide una definición o una acción$$),
            jsonb_build_array($$Cuál(es)$$, $$Pide una elección entre varias opciones$$),
            jsonb_build_array($$Cuándo / Dónde$$, $$Piden el tiempo o el lugar$$),
            jsonb_build_array($$Cuánto/a/os/as$$, $$Pide una cantidad$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en pregunta: « Casi un millón de personas ocuparon las calles ».$$, 'solution', $$¿Cuántas personas ocuparon las calles?$$),
        'fixation', jsonb_build_object('question', $$¿Qué signo de puntuación se coloca al principio de una pregunta escrita en español?$$, 'solution', $$El signo de interrogación invertido (¿).$$)
      ),
      jsonb_build_object(
        'heading', $$Preparar una entrevista o un cuestionario$$,
        'body', $$Preparar buenas preguntas es esencial para conducir una entrevista o recoger información, por ejemplo durante una manifestación de descontento social. Un buen cuestionario suele combinar preguntas sobre las causas (¿por qué?), sobre los hechos (¿qué?, ¿cuándo?, ¿cómo?) y sobre las posibles soluciones (¿qué proponen las autoridades?), permitiendo así entender completamente una situación antes de informar a otras personas.$$,
        'highlights', array[$$entrevista$$, $$cuestionario$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué tipo de preguntas conviene incluir en un buen cuestionario periodístico?$$, 'solution', $$Preguntas sobre las causas, los hechos y las posibles soluciones de la situación.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Los alumnos de tu liceo están descontentos con las condiciones de trabajo en las aulas y proyectan manifestarse. Como periodista de la revista del club de español, decides entrevistar al portavoz de los alumnos para entender la situación y proponer soluciones.$$,
      'questions', array[
        $$Cita al menos cuatro pronombres interrogativos en español.$$,
        $$Redacta tres preguntas que le harías al portavoz de los alumnos.$$,
        $$Explica qué signo de puntuación es obligatorio al principio de una pregunta escrita en español.$$,
        $$Da tu opinión sobre la importancia de formular buenas preguntas antes de informar a otras personas.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué signo de puntuación se coloca al principio de una pregunta en español?$$,
      'hint', $$Es un signo de interrogación, pero al revés.$$,
      'expected', $$El signo de interrogación invertido (¿).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué pronombre interrogativo se usa para pedir una cantidad?$$,
      'hint', $$Tiene formas masculina y femenina, singular y plural.$$,
      'expected', $$« Cuánto/a/os/as » (por ejemplo: ¿Cuántas personas?).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué provocó las protestas en Chile, según el texto?$$,
      'hint', $$Piensa en el transporte público.$$,
      'expected', $$El alza del precio del boleto del metro.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un disturbio »?$$,
      'hint', $$Piensa en una situación que impide concentrarse en un aula.$$,
      'expected', $$Un desorden o una agitación colectiva.$$
    )
  ),
  now()
);
