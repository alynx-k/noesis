-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3182: "L18 Exprimer l'inquiétude"
-- (https://lyc.ecole-ci.org/course/view.php?id=3182)
-- Contenu extrait de la même pluginfile que L13-L17 (pages 16-19 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 5 Fiche 1".
-- Support: article sur le risque d'empoisonnement des vautours africains.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Aucune phrase copiée verbatim du PDF source ;
-- reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-inquietud',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la inquietud$$,
  17,
  '2nde-a-esp-expresar-duda',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Frente al aumento de casos de una enfermedad contagiosa, un telediario anuncia el cierre de varias escuelas. Esta noticia inquieta mucho a un grupo de alumnos, que deciden escribir una carta al embajador de España para expresar sus preocupaciones. En clase de español, identifican las expresiones de la inquietud, las utilizan y redactan su carta.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: inquietud, envenenar$$,
        'body', $$« La inquietud » es un sentimiento de preocupación o de malestar ante una situación incierta: en muchos países africanos, las elecciones presidenciales provocan inquietudes en la población. « Envenenar » significa intoxicar con un veneno, es decir, con una sustancia peligrosa para la salud o la vida.$$,
        'highlights', array[$$inquietud$$, $$envenenar$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Inquietud = sentimiento de preocupación; envenenar = intoxicar con una sustancia peligrosa.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « envenenar »?$$, 'solution', $$Intoxicar con una sustancia peligrosa para la salud o la vida (un veneno).$$)
      ),
      jsonb_build_object(
        'heading', $$Los buitres africanos en peligro$$,
        'body', $$El texto de referencia relata la inquietud de un grupo de ecologistas frente al riesgo de envenenamiento de los buitres africanos. Estas aves, que salen de los parques naturales protegidos para buscar comida en zonas agrícolas cercanas, corren el riesgo de intoxicarse con productos químicos, lo que amenaza a una especie ya en vías de extinción.$$,
        'highlights', array[$$buitres africanos$$, $$especie en vías de extinción$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué los buitres africanos corren riesgo de envenenamiento, según el texto?$$, 'solution', $$Porque salen de los parques protegidos para buscar comida en zonas agrícolas donde hay productos químicos peligrosos.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la inquietud$$,
        'body', $$Para expresar inquietud en español, se puede usar el verbo « estar » seguido de un adjetivo o participio de sentimiento: « la población está inquieta », « Pedro está preocupado por sus resultados ». También existen verbos específicos como inquietar(se), preocupar(se), afectar y desamparar, a menudo seguidos de la preposición « por »: « cada uno se preocupa por su porvenir ».$$,
        'highlights', array[$$estar + adjetivo de sentimiento$$, $$preocuparse por$$, $$inquietarse por$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Estar + adjetivo$$, $$La población está inquieta.$$),
            jsonb_build_array($$Verbo + por$$, $$Me preocupo por el futuro de estas aves.$$),
            jsonb_build_array($$Afectar / desamparar$$, $$Esta noticia me afecta mucho.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de inquietud: « Los exámenes se acercan ».$$, 'solution', $$Los alumnos están preocupados porque los exámenes se acercan. (o: Los exámenes me inquietan.)$$),
        'fixation', jsonb_build_object('question', $$Da un verbo (además de « preocupar ») que sirva para expresar inquietud.$$, 'solution', $$Por ejemplo « inquietar » (también válido: afectar, desamparar).$$)
      ),
      jsonb_build_object(
        'heading', $$Escribir para alertar sobre una causa$$,
        'body', $$Expresar la inquietud es útil para movilizar a otras personas frente a una causa, como la protección de la fauna. Un artículo o un mensaje de sensibilización suele describir primero el problema (por ejemplo, el envenenamiento de una especie), explicar por qué preocupa (riesgo de extinción, impacto en el ecosistema) y, finalmente, invitar a la acción o a la reflexión colectiva.$$,
        'highlights', array[$$sensibilización$$, $$protección de la fauna$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué elementos suele incluir un artículo de sensibilización sobre una causa medioambiental?$$, 'solution', $$La descripción del problema, la explicación de por qué preocupa, y una invitación a la acción o reflexión.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ves en la televisión un documental sobre la caza furtiva de rinocerontes que te impresiona mucho. Como participante en un proyecto de sensibilización para la protección de la fauna organizado por un periódico español, decides escribir un mensaje expresando tu inquietud.$$,
      'questions', array[
        $$Cita al menos tres expresiones o verbos que sirven para expresar inquietud en español.$$,
        $$Redacta un breve mensaje expresando tu inquietud sobre la caza furtiva de animales en peligro.$$,
        $$Explica por qué los ecologistas del texto se inquietan por los buitres africanos.$$,
        $$Da tu opinión sobre la importancia de proteger las especies animales en peligro de extinción.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué verbo, seguido de un adjetivo, se usa para describir un estado de inquietud?$$,
      'hint', $$Es el verbo « ser o estar »; aquí es el que se usa con estados temporales.$$,
      'expected', $$El verbo « estar » (por ejemplo: estar inquieto/preocupado).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué especie animal corre riesgo de envenenamiento según el texto?$$,
      'hint', $$Es un ave carroñera africana.$$,
      'expected', $$Los buitres africanos.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « envenenar »?$$,
      'hint', $$Piensa en una sustancia peligrosa.$$,
      'expected', $$Intoxicar con un veneno o una sustancia peligrosa.$$
    ),
    jsonb_build_object(
      'question', $$Da una preposición que acompaña frecuentemente a los verbos de inquietud como « preocuparse ».$$,
      'hint', $$Es una preposición corta y muy común.$$,
      'expected', $$« Por » (preocuparse por, inquietarse por).$$
    )
  ),
  now()
);
