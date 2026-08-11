-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 1054: "L27 Suggérer"
-- (https://lyc.ecole-ci.org/course/view.php?id=1054)
-- Contenu extrait de la même pluginfile que L13-L26 (pages 45-47, dernières
-- pages du document consolidé), correspondant à la fiche "Leçon 6 Fiche 5".
-- Support: poème de Noémia de Sousa sur l'identité et l'histoire africaines.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Aucune phrase copiée verbatim du PDF source ;
-- reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-sugerir',
  '2nde',
  'A',
  'espagnol',
  $$Sugerir$$,
  26,
  '2nde-a-esp-autorizar-permitir',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tras leer en el periódico del instituto que algunos alumnos consumen drogas y descuidan sus estudios, los miembros del club de español deciden reaccionar. En clase, identifican las expresiones que permiten hacer sugerencias, las utilizan y redactan un mensaje con propuestas para sus compañeros.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: sugerir, un trozo, perseguir$$,
        'body', $$« Sugerir » significa proponer una idea o evocar algo de manera indirecta: una canción puede sugerir recuerdos de la infancia. « Un trozo » es una parte o un fragmento de algo, como un trozo de pan. « Perseguir » significa seguir a alguien con la intención de alcanzarlo, como cuando la policía persigue a unos ladrones.$$,
        'highlights', array[$$sugerir$$, $$un trozo$$, $$perseguir$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Sugerir = proponer o evocar indirectamente; trozo = fragmento de algo; perseguir = seguir con intención de alcanzar.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « perseguir »?$$, 'solution', $$Seguir a alguien con la intención de alcanzarlo.$$)
      ),
      jsonb_build_object(
        'heading', $$Un poema sobre la identidad africana$$,
        'body', $$El texto de referencia es un poema de la escritora Noémia de Sousa, que sugiere a sus lectores lo que deben hacer para conocerla verdaderamente: valorar el sufrimiento de los africanos durante los años de la esclavitud y la colonización, así como reconocer la libertad conquistada y la esperanza que representan las independencias africanas.$$,
        'highlights', array[$$Noémia de Sousa$$, $$identidad y memoria africana$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué sugiere la poeta Noémia de Sousa en su poema, según la lección?$$, 'solution', $$Que, para conocerla de verdad, hay que valorar el sufrimiento vivido durante la esclavitud y la colonización, y reconocer la libertad y la esperanza de las independencias africanas.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: hacer una sugerencia$$,
        'body', $$Para hacer una sugerencia en español se usan verbos como « sugerir », « recomendar » o la expresión « lo mejor es », seguidos de infinitivo o de « que » + subjuntivo: « el médico me sugiere comer mucha fruta » o « el médico me sugiere que coma mucha fruta ». También se puede sugerir mediante una pregunta: « ¿Por qué no comen ustedes más verdura? ».$$,
        'highlights', array[$$sugerir/recomendar + infinitivo$$, $$sugerir que + subjuntivo$$, $$¿Por qué no...?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Sugerir/recomendar + infinitivo$$, $$Te sugiero leer este poema.$$),
            jsonb_build_array($$Sugerir que + subjuntivo$$, $$Te sugiero que leas este poema.$$),
            jsonb_build_array($$¿Por qué no...?$$, $$¿Por qué no lees este poema?$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en sugerencia: « Debéis estudiar juntos ».$$, 'solution', $$Os sugiero que estudiéis juntos. (o: Lo mejor es que estudiéis juntos.)$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal sigue a « sugerir que » o « recomendar que »?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$Sugerir estrategias de estudio$$,
        'body', $$Las sugerencias son útiles en contextos prácticos, como preparar exámenes: se puede sugerir repasar una lección cada día, trabajar en grupo para compartir experiencias, y mantener la disciplina y la constancia. Combinar varias fórmulas de sugerencia hace que los consejos resulten más completos y persuasivos.$$,
        'highlights', array[$$estrategias de estudio$$]::text[],
        'fixation', jsonb_build_object('question', $$Da una sugerencia útil para preparar mejor los exámenes.$$, 'solution', $$Por ejemplo « te sugiero repasar una lección cada día » (cualquier sugerencia razonable es válida).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Al acercarse los exámenes de fin de año, los miembros del club de español están preocupados por cómo organizarse para tener éxito. Decides escribir un artículo en la revista del club con tus propias sugerencias de estudio.$$,
      'questions', array[
        $$Cita al menos tres estructuras usadas para hacer una sugerencia en español.$$,
        $$Redacta dos o tres sugerencias para ayudar a tus compañeros a preparar mejor los exámenes.$$,
        $$Explica qué sugiere la poeta Noémia de Sousa en su poema, según la lección.$$,
        $$Da tu opinión sobre la importancia de conocer la historia y la memoria de un pueblo.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué modo verbal sigue a « te sugiero que »?$$,
      'hint', $$Es el mismo modo que sigue a « te recomiendo que ».$$,
      'expected', $$El subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$Da una pregunta que sirve para hacer una sugerencia de forma indirecta.$$,
      'hint', $$Empieza con « ¿Por qué no...? »$$,
      'expected', $$Por ejemplo « ¿Por qué no estudias en grupo? ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un trozo »?$$,
      'hint', $$Piensa en un trozo de pan.$$,
      'expected', $$Una parte o un fragmento de algo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué temas evoca el poema de Noémia de Sousa mencionado en la lección?$$,
      'hint', $$Piensa en la historia de África.$$,
      'expected', $$La esclavitud, la colonización, la libertad y la esperanza de las independencias africanas.$$
    )
  ),
  now()
);
