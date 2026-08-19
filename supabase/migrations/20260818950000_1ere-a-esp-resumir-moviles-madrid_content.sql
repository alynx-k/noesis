-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1803: "L7 Résumer" (https://lyc.ecole-ci.org/course/view.php?id=1803),
-- resource id 15098. Support: "Madrid prohíbe los móviles", in ¡Más
-- allá! Espagnol 1ère p.32. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Fait réel (mesure
-- d'interdiction des téléphones portables dans les écoles publiques de
-- Madrid) repris tel quel ; aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-resumir-moviles-madrid',
  '1ere',
  'A',
  'espagnol',
  $$Resumir: Madrid prohíbe los móviles$$,
  7,
  '1ere-a-esp-insistir-educacion-digital',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de tu instituto organiza una conferencia sobre la influencia de las lenguas africanas en el español. Como representante del club, tendrás que contar la conferencia a los demás miembros. Para decir solo lo esencial, aprendes a usar las expresiones para resumir.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: resumir, prohibir, la convivencia$$,
        'body', $$« Resumir » significa expresar de forma breve lo esencial de un texto o de una información: « Después de leer su novela, Koffi la resume en su cuaderno de lectura ». « Prohibir » significa no permitir algo: « Para evitar el fraude, se prohíbe el uso de los móviles durante los exámenes ». « La convivencia » es la cohabitación pacífica entre personas o grupos: « La tolerancia favorece la convivencia entre los pueblos ».$$,
        'highlights', array[$$resumir = expresar brevemente lo esencial$$, $$prohibir = no permitir$$, $$la convivencia = cohabitación pacífica$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el sinónimo de « convivencia »?$$, 'solution', $$Cohabitación.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: los marcadores para resumir$$,
        'body', $$Para resumir una información, se usan marcadores como: en resumen, resumiendo, recapitulando, brevemente, en pocas palabras, sucintamente, en suma, en resumidas cuentas, para resumir, globalmente. Estos marcadores señalan que lo que sigue es lo esencial de lo dicho anteriormente. Ejemplo: « En suma, promoveremos el respeto ».$$,
        'highlights', array[$$en resumen, resumiendo, en pocas palabras, en suma, en resumidas cuentas$$]::text[],
        'example', jsonb_build_object('statement', $$¿Cuál de estas frases expresa la idea de resumen? « Las redes sociales permiten desarrollar aficiones » o « En resumen, mañana saldremos de vacaciones »?$$, 'solution', $$« En resumen, mañana saldremos de vacaciones » — el marcador « en resumen » señala claramente la idea de síntesis; la otra frase es una simple afirmación sin marcador de resumen.$$),
        'fixation', jsonb_build_object('question', $$Da tres ejemplos de marcadores para resumir.$$, 'solution', $$Por ejemplo: « en resumen », « brevemente », « en pocas palabras » (otras respuestas válidas: resumiendo, sucintamente, en suma, en resumidas cuentas, para resumir, globalmente).$$)
      ),
      jsonb_build_object(
        'heading', $$Madrid prohíbe los móviles en las aulas$$,
        'body', $$Las autoridades educativas de Madrid decidieron prohibir el uso de los teléfonos móviles en los colegios públicos de la región, a partir del curso 2020-2021. El objetivo principal de esta medida es mejorar los resultados académicos de los alumnos con dificultades, reduciendo las distracciones en el aula. Las autoridades también esperan que esta prohibición favorezca la convivencia y el respeto hacia el profesorado dentro de las aulas.$$,
        'highlights', array[$$prohibición de los móviles en las aulas públicas de Madrid (desde 2020-2021)$$, $$objetivo : mejorar los resultados académicos, favorecer la convivencia$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el objetivo principal de la prohibición de los móviles en las aulas de Madrid?$$, 'solution', $$Mejorar los resultados académicos de los alumnos con dificultades y favorecer la convivencia y el respeto en las aulas.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un compañero que estuvo ausente durante la clase sobre « Madrid prohíbe los móviles » te pide que le expliques lo esencial de la lección.$$,
      'questions', array[
        $$Cita algunas expresiones para resumir.$$,
        $$Resume, en pocas palabras, la medida tomada por las autoridades madrileñas y su objetivo.$$,
        $$Da tu opinión personal sobre esta medida, usando al menos un marcador de resumen al final.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué significa « resumir »?$$,
      'hint', $$Es lo contrario de detallar.$$,
      'expected', $$Expresar de forma breve lo esencial de un texto o de una información.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué medida tomaron las autoridades de Madrid respecto a los móviles?$$,
      'hint', $$Está relacionado con las aulas.$$,
      'expected', $$Prohibieron el uso de los móviles en las aulas de los colegios públicos, a partir del curso 2020-2021.$$
    ),
    jsonb_build_object(
      'question', $$Da un sinónimo de « en resumen ».$$,
      'hint', $$Hay varias expresiones posibles.$$,
      'expected', $$Por ejemplo « en suma », « brevemente » o « en pocas palabras ».$$
    ),
    jsonb_build_object(
      'question', $$¿Cuál es el objetivo principal de la prohibición de los móviles en las aulas madrileñas?$$,
      'hint', $$Piensa en los alumnos con dificultades.$$,
      'expected', $$Mejorar los resultados académicos de los alumnos con dificultades.$$
    )
  ),
  now()
);
