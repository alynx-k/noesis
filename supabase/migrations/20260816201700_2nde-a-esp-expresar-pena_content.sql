-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3185: "L19 Exprimer la peine"
-- (https://lyc.ecole-ci.org/course/view.php?id=3185)
-- Contenu extrait de la même pluginfile que L13-L18 (pages 20-22 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 5 Fiche 2".
-- Support: article sur la Journée Mondiale du Lavage des Mains en Colombie.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Aucune phrase copiée verbatim du PDF source ;
-- reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-pena',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la pena$$,
  18,
  '2nde-a-esp-expresar-inquietud',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante una sesión del club de español, unos alumnos ven un documental sobre la dramática situación de los migrantes irregulares africanos. Muy conmovidos, deciden escribir un mensaje para informar a sus compañeros que no vieron el documental. En clase de español, identifican las expresiones de la pena, las usan y redactan su mensaje.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: la pena, entristecer, la salud$$,
        'body', $$« La pena » es un sentimiento de tristeza profunda: la muerte de una figura pública, por ejemplo, puede provocar una gran pena en todo un país. « Entristecer » significa dar pena o volverse triste. « La salud » es el estado de bienestar físico de una persona: cuando alguien está enfermo, toma medicinas para recobrar la salud.$$,
        'highlights', array[$$la pena$$, $$entristecer$$, $$la salud$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Pena = tristeza profunda; entristecer = dar pena, volverse triste; salud = estado de bienestar físico.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « entristecer »?$$, 'solution', $$Dar pena o volverse triste.$$)
      ),
      jsonb_build_object(
        'heading', $$El Día Mundial del Lavado de Manos$$,
        'body', $$El texto de referencia relata cómo unos ochenta países, entre ellos Colombia, celebran el Día Mundial del Lavado de Manos para promover este hábito esencial para la salud pública. Varios especialistas expresan su pena al constatar que una parte de la población sigue descuidando esta práctica tan sencilla, lo que provoca infecciones evitables, especialmente entre los niños pequeños.$$,
        'highlights', array[$$Día Mundial del Lavado de Manos$$, $$hábito de higiene$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué los especialistas expresan pena en el texto sobre el lavado de manos?$$, 'solution', $$Porque una parte de la población descuida este hábito, lo que provoca infecciones evitables, sobre todo en los niños.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la pena$$,
        'body', $$Para expresar pena en español se pueden usar estructuras como « es de temer que », « es una pena que », « es lamentable que » (seguidas de subjuntivo); verbos como entristecer(se), apenar(se); y exclamaciones como « ¡qué pena! ». Estas expresiones permiten manifestar tristeza o pesar frente a una situación negativa.$$,
        'highlights', array[$$es una pena que$$, $$es de temer que$$, $$¡qué pena!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Es una pena que + subjuntivo$$, $$Es una pena que la gente no se lave las manos.$$),
            jsonb_build_array($$Es de temer que + subjuntivo$$, $$Es de temer que la situación empeore.$$),
            jsonb_build_array($$¡Qué pena!$$, $$¡Qué pena ver tanto sufrimiento!$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de pena: « Muchos niños se enferman por falta de higiene ».$$, 'solution', $$Es una pena que muchos niños se enfermen por falta de higiene.$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal sigue a « es una pena que »?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$Sensibilizar frente a los malos hábitos de salud$$,
        'body', $$Expresar pena también sirve para sensibilizar a otras personas sobre malos hábitos de salud, como fumar, beber en exceso o alimentarse mal. Un artículo de sensibilización puede describir el problema, expresar la pena que provoca ver a personas sufrir sus consecuencias (obesidad, enfermedades), y terminar con un consejo o una invitación a cambiar de comportamiento.$$,
        'highlights', array[$$malos hábitos$$, $$sensibilización sobre la salud$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué estructura suele tener un artículo de sensibilización sobre malos hábitos de salud?$$, 'solution', $$Describir el problema, expresar la pena que provoca, y terminar con un consejo para cambiar de comportamiento.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un médico advierte en un cartel sobre los malos hábitos de salud (tabaco, alcohol, mala alimentación) que ves a diario entre tus compañeros. Esta situación te choca. Decides sensibilizar a los miembros del club de español mediante un artículo en la revista del club.$$,
      'questions', array[
        $$Cita al menos tres expresiones que sirven para expresar pena en español.$$,
        $$Redacta un breve artículo expresando tu pena frente a los malos hábitos de salud que observas.$$,
        $$Explica por qué el lavado de manos es tan importante para la salud pública, según la lección.$$,
        $$Da un consejo para mejorar los hábitos de salud de tus compañeros.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué expresión exclamativa se usa para expresar pena de forma breve?$$,
      'hint', $$Empieza con « ¡Qué... »$$,
      'expected', $$« ¡Qué pena! ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué modo verbal sigue a « es de temer que »?$$,
      'hint', $$Es el mismo modo que sigue a « es una pena que ».$$,
      'expected', $$El subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué evento internacional se menciona en la lección sobre la higiene?$$,
      'hint', $$Se celebra en muchos países, incluida Colombia.$$,
      'expected', $$El Día Mundial del Lavado de Manos.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « la pena »?$$,
      'hint', $$Piensa en la muerte de una figura pública.$$,
      'expected', $$Un sentimiento de tristeza profunda.$$
    )
  ),
  now()
);
