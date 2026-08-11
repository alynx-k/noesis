-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 1182: "L24 Conseiller"
-- (https://lyc.ecole-ci.org/course/view.php?id=1182)
-- Contenu extrait de la même pluginfile que L13-L23 (pages 36-37 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 6 Fiche 2".
-- Support: article sur la gestion de l'accès à l'eau potable en Afrique.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Aucune phrase copiée verbatim du PDF source ;
-- reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-aconsejar',
  '2nde',
  'A',
  'espagnol',
  $$Aconsejar a alguien$$,
  23,
  '2nde-a-esp-dar-instrucciones',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante una sesión del club de español, unos alumnos ven un documental sobre las consecuencias del consumo de drogas en el ámbito escolar. Muy afectados por las imágenes, deciden movilizar a sus compañeros. En clase, identifican las expresiones para aconsejar y las usan para redactar consejos útiles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: aconsejar, conseguir, un reto$$,
        'body', $$« Aconsejar » significa recomendar a alguien una manera de actuar: para evitar una enfermedad contagiosa, un gobierno puede aconsejar respetar ciertas medidas de higiene. « Conseguir » significa lograr u obtener algo, por ejemplo buenas notas gracias al estudio. « Un reto » es un desafío importante que hay que superar: garantizar el acceso al agua potable es un gran reto para muchos gobiernos.$$,
        'highlights', array[$$aconsejar$$, $$conseguir$$, $$un reto$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Aconsejar = recomendar una manera de actuar; conseguir = lograr u obtener; reto = desafío importante.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « un reto »?$$, 'solution', $$Un desafío importante que hay que superar.$$)
      ),
      jsonb_build_object(
        'heading', $$El reto del acceso al agua potable en África$$,
        'body', $$El texto de referencia aborda las dificultades para garantizar el acceso al agua potable en África. El autor aconseja a los gobiernos que tomen medidas concretas de gestión del agua, y recomienda que cada persona sea consciente de la escasez de este recurso para usarlo de manera responsable, con el fin de beneficiar a toda la población.$$,
        'highlights', array[$$acceso al agua potable$$, $$gestión responsable$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué recomienda el autor del texto respecto al agua?$$, 'solution', $$Que los gobiernos tomen medidas de gestión y que cada persona use el agua de manera responsable.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: dar consejos$$,
        'body', $$Para aconsejar a alguien en español se puede usar el modo imperativo (tú si hay confianza, usted si no la hay): « ¡Ten cuidado! » / « ¡Tenga cuidado! ». También se usan los verbos aconsejar, recomendar, sugerir y proponer, seguidos de un infinitivo o de « que » + subjuntivo: « te aconsejo estudiar » o « te aconsejo que estudies ».$$,
        'highlights', array[$$imperativo (tú/usted)$$, $$aconsejar/recomendar/sugerir + que + subjuntivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Imperativo (tú)$$, $$¡Cógelo tú!$$),
            jsonb_build_array($$Imperativo (usted)$$, $$¡Cójalo usted!$$),
            jsonb_build_array($$Verbo + que + subjuntivo$$, $$Te aconsejo que estudies la lección.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en consejo formal (usted): « Bebe más agua ».$$, 'solution', $$Beba usted más agua. (o: Le aconsejo que beba más agua.)$$),
        'fixation', jsonb_build_object('question', $$¿Cuándo se usa el imperativo de « usted » en vez del de « tú » para aconsejar?$$, 'solution', $$Cuando no hay suficiente confianza con la persona a la que se dirige el consejo.$$)
      ),
      jsonb_build_object(
        'heading', $$Consejos colectivos frente a un problema común$$,
        'body', $$Aconsejar también se aplica a problemas colectivos, como la gestión del agua en una comunidad: se puede sugerir colaborar con organismos especializados, recomendar establecer normas claras de uso, y proponer que todos tomen conciencia de la escasez del recurso para evitar su despilfarro.$$,
        'highlights', array[$$consejos colectivos$$, $$toma de conciencia$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué se puede sugerir a una comunidad para gestionar mejor el agua?$$, 'solution', $$Colaborar con organismos especializados y tomar conciencia colectiva de la escasez del recurso.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu vecino no entendió bien la lección sobre cómo enfrentar los problemas derivados de la falta de agua en África. Decides enviarle un mensaje con consejos claros sobre cómo cada persona puede contribuir a un mejor uso del agua.$$,
      'questions', array[
        $$Cita al menos tres verbos o estructuras usados para aconsejar en español.$$,
        $$Redacta un mensaje con dos o tres consejos sobre el uso responsable del agua.$$,
        $$Explica la diferencia entre el imperativo de « tú » y el de « usted » para dar un consejo.$$,
        $$Da tu opinión sobre la importancia de tomar conciencia de la escasez del agua.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué modo verbal se usa para dar un consejo de forma directa (« ¡ten cuidado! »)?$$,
      'hint', $$Es el mismo modo usado para dar instrucciones.$$,
      'expected', $$El imperativo.$$
    ),
    jsonb_build_object(
      'question', $$Da un verbo (distinto de « aconsejar ») que sirva para dar un consejo.$$,
      'hint', $$Empieza por « r » o por « s ».$$,
      'expected', $$Por ejemplo « recomendar » (también válido: sugerir, proponer).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « conseguir »?$$,
      'hint', $$Piensa en obtener buenas notas.$$,
      'expected', $$Lograr u obtener algo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué recurso natural es el tema central del texto de esta lección?$$,
      'hint', $$Es esencial para la vida y escaso en muchas regiones de África.$$,
      'expected', $$El agua (potable).$$
    )
  ),
  now()
);
