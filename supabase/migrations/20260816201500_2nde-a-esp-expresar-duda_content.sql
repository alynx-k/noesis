-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3180: "L17 Exprimer le doute"
-- (https://lyc.ecole-ci.org/course/view.php?id=3180)
-- Contenu extrait de la même pluginfile que L13-L16 (pages 13-16 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 4 Fiche 5".
-- Support: article sur l'attentat du 11 mars 2004 à Madrid et sa couverture
-- médiatique contradictoire. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Aucune phrase copiée
-- verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-duda',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la duda$$,
  16,
  '2nde-a-esp-expresar-certeza',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Unos alumnos leen en la revista del club de español que una ONG española va a hacer una donación de material escolar a alumnos en situación difícil. La noticia suscita muchas preguntas: ¿serán ellos los beneficiarios? Durante la reunión del club, los miembros identifican las expresiones de la duda para hablar con precisión de esta incertidumbre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: duda, trauma, estallar$$,
        'body', $$« Una duda » es lo contrario de « una certeza »: no se puede acusar a nadie si existen dudas sobre la identidad del culpable. « Un trauma » es una herida psicológica profunda, provocada por ejemplo por el ruido de las armas en las víctimas civiles de una guerra. « Estallar » significa explotar de repente, como una bomba cuando alguien pisa una mina antipersonal.$$,
        'highlights', array[$$duda$$, $$trauma$$, $$estallar$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Duda = incertidumbre, lo contrario de certeza; trauma = herida psicológica profunda; estallar = explotar de repente.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es lo contrario de « una certeza »?$$, 'solution', $$« Una duda ».$$)
      ),
      jsonb_build_object(
        'heading', $$Un atentado y su cobertura contradictoria$$,
        'body', $$El texto de referencia relata el terrible atentado ocurrido en Madrid en 2004, en el que varias bombas estallaron causando numerosas muertes y heridos, tres días antes de unas elecciones generales. El tratamiento del suceso dividió a la prensa española: mientras un diario descartaba dudas sobre el origen del atentado, otro sugería que se trataba de un montaje policial, lo que instaló la duda entre la población.$$,
        'highlights', array[$$atentado de Madrid$$, $$prensa contradictoria$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué se instaló la duda entre la población española, según el texto?$$, 'solution', $$Porque los principales diarios españoles se contradecían sobre el origen del atentado.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la duda$$,
        'body', $$Para expresar duda o incertidumbre en español se pueden usar expresiones como « podría decirse que », « no se puede asegurar que », « puede que »; verbos como « dudar que », « no creer que », « no ser cierto que », « temer que » (seguidos generalmente de subjuntivo); y adverbios o locuciones como « tal vez », « quizá », « acaso », « a lo mejor », « al parecer ».$$,
        'highlights', array[$$dudar que + subjuntivo$$, $$tal vez / quizá$$, $$al parecer$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Categoría$$, $$Ejemplos$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Expresiones verbales$$, $$Podría decirse que, no se puede asegurar que, puede que$$),
            jsonb_build_array($$Verbos de duda + subjuntivo$$, $$Dudar que, no creer que, no ser cierto que, temer que$$),
            jsonb_build_array($$Adverbios/locuciones$$, $$Tal vez, quizá, a lo mejor, al parecer$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de duda: « El resultado fue catastrófico ».$$, 'solution', $$Quizá el resultado fuera catastrófico. (o: Tal vez el resultado haya sido catastrófico.)$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal suele seguir a « dudar que » o « no creer que »?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$Manejar la duda ante informaciones contradictorias$$,
        'body', $$Cuando dos fuentes de información se contradicen, como en el caso del atentado de Madrid, es prudente expresar la propia incertidumbre en lugar de afirmar con total certeza. Se puede, por ejemplo, presentar las dos versiones, señalar la falta de pruebas definitivas, y usar expresiones de duda para invitar a la reflexión crítica antes de sacar conclusiones apresuradas.$$,
        'highlights', array[$$fuentes contradictorias$$, $$reflexión crítica$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué actitud es prudente adoptar cuando dos fuentes de información se contradicen?$$, 'solution', $$Expresar la propia incertidumbre y presentar las dos versiones antes de sacar conclusiones.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Al regresar de las vacaciones, los alumnos descubren que su colegio ha sido vandalizado. La revista del club de español publica que los ladrones robaron únicamente los documentos con las notas de los alumnos y que, al parecer, serían alumnos que iban a repetir el año. Debes comentar esta noticia usando expresiones de duda, ya que no hay pruebas definitivas.$$,
      'questions', array[
        $$Cita al menos cuatro expresiones o verbos que sirven para expresar duda en español.$$,
        $$Explica por qué conviene usar expresiones de duda ante una noticia sin pruebas definitivas.$$,
        $$Redacta una frase de duda sobre la identidad de los presuntos ladrones del colegio.$$,
        $$Explica, según el texto, por qué la prensa española se dividió sobre el atentado de Madrid.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da un adverbio que exprese duda en español.$$,
      'hint', $$Empieza por « t » o por « q ».$$,
      'expected', $$Por ejemplo « tal vez » o « quizá » (también válido: acaso, a lo mejor, al parecer).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué modo verbal sigue generalmente a « dudar que »?$$,
      'hint', $$Es el mismo modo que sigue a « querer que » o « esperar que ».$$,
      'expected', $$El subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « un trauma »?$$,
      'hint', $$Piensa en las consecuencias psicológicas de la guerra.$$,
      'expected', $$Una herida psicológica profunda.$$
    ),
    jsonb_build_object(
      'question', $$¿En qué año y ciudad ocurrió el atentado mencionado en la lección?$$,
      'hint', $$Es una capital europea, en 2004.$$,
      'expected', $$En Madrid, en 2004 (el 11 de marzo).$$
    )
  ),
  now()
);
