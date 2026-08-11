-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 1055: "L26 Autoriser - permettre"
-- (https://lyc.ecole-ci.org/course/view.php?id=1055)
-- Contenu extrait de la même pluginfile que L13-L25 (pages 42-44 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 6 Fiche 4".
-- Support: article sur l'émancipation de la femme africaine, « pilier de
-- l'Afrique ». Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Aucune phrase copiée verbatim du
-- PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-autorizar-permitir',
  '2nde',
  'A',
  'espagnol',
  $$Autorizar y permitir$$,
  25,
  '2nde-a-esp-dar-un-orden',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Una ONG española organiza una campaña de sensibilización sobre el sida en un instituto de Abiyán. Informados y motivados, unos alumnos deciden escribir una carta al consejo de estudiantes para proponer nuevas actividades. En clase de español, identifican las fórmulas para pedir y otorgar permiso, y las utilizan para redactar su carta.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: autorizar/permitir, cuidar a, el pilar$$,
        'body', $$« Autorizar » (o « permitir ») significa dar el consentimiento para que alguien haga algo: hoy en día, en muchos países africanos, los padres autorizan la escolarización de las niñas. « Cuidar a » significa ocuparse del bienestar de alguien, como una madre que cuida a sus bebés. « Un pilar » es un elemento que sostiene una estructura, en sentido figurado: la mujer es considerada « el pilar » de muchas sociedades africanas.$$,
        'highlights', array[$$autorizar / permitir$$, $$cuidar a$$, $$el pilar$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Autorizar/permitir = dar consentimiento; cuidar a = ocuparse del bienestar de alguien; pilar = elemento que sostiene, en sentido figurado.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « un pilar », en sentido figurado?$$, 'solution', $$Un elemento fundamental que sostiene algo, como una sociedad o una familia.$$)
      ),
      jsonb_build_object(
        'heading', $$La mujer, pilar de África$$,
        'body', $$El texto de referencia trata de la integración de las mujeres africanas en todas las esferas públicas, hoy autorizada por muchos gobiernos. Sin embargo, esta emancipación se enfrenta a varios obstáculos: el peso de las tradiciones, la preferencia dada al varón, y la falta de independencia financiera de muchas mujeres, a pesar de ser consideradas el verdadero pilar de la sociedad africana.$$,
        'highlights', array[$$emancipación de la mujer$$, $$obstáculos a la igualdad$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué obstáculos enfrenta la emancipación de la mujer africana, según el texto?$$, 'solution', $$El peso de las tradiciones, la preferencia dada al varón y la falta de independencia financiera.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: autorizar y permitir$$,
        'body', $$Para expresar autorización o permiso en español se pueden usar los verbos « autorizar » y « permitir » conjugados, seguidos de « que » + subjuntivo: « el gobierno permite que cada ciudadano tenga un coche ». También se usa el verbo « dejar » + infinitivo, o « dejar que » + subjuntivo: « papá deja viajar a sus hijos » / « te dejamos que decidas ».$$,
        'highlights', array[$$permitir que + subjuntivo$$, $$dejar + infinitivo$$, $$dejar que + subjuntivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Permitir que + subjuntivo$$, $$El gobierno permite que las mujeres voten.$$),
            jsonb_build_array($$Dejar + infinitivo$$, $$Papá deja viajar a sus hijos.$$),
            jsonb_build_array($$Dejar que + subjuntivo$$, $$Te dejamos que decidas tú mismo.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de permiso: « Las mujeres pueden ingresar en la universidad ».$$, 'solution', $$Se permite que las mujeres ingresen en la universidad.$$),
        'fixation', jsonb_build_object('question', $$¿Qué verbo, seguido de infinitivo, se usa de forma más coloquial para dar permiso?$$, 'solution', $$El verbo « dejar » (dejar + infinitivo).$$)
      ),
      jsonb_build_object(
        'heading', $$Redactar una carta de recomendación o de permiso$$,
        'body', $$Una carta que solicita un permiso o una autorización (por ejemplo para una beca de estudios) sigue generalmente una estructura formal: un saludo respetuoso, la presentación de quién escribe, la petición concreta expresada con verbos como « permitir » o « autorizar », y una despedida cortés.$$,
        'highlights', array[$$carta formal de solicitud$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué elementos debe incluir una carta formal que solicita un permiso o una beca?$$, 'solution', $$Un saludo respetuoso, la presentación de quién escribe, la petición concreta y una despedida cortés.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un miembro del club de español de tu colegio está interesado en una beca de estudios ofrecida por el gobierno español. Como presidente del club, debes escribir una carta de recomendación pidiendo que se le permita optar a la beca.$$,
      'questions', array[
        $$Cita al menos tres verbos o estructuras usados para autorizar o permitir en español.$$,
        $$Redacta una breve carta de recomendación solicitando el permiso para que un alumno reciba una beca.$$,
        $$Explica por qué la educación es importante para la emancipación de la mujer, según la lección.$$,
        $$Da tu opinión sobre los obstáculos que aún enfrenta la igualdad entre hombres y mujeres.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué verbo, seguido de infinitivo, se usa de forma coloquial para dar permiso (por ejemplo a un niño)?$$,
      'hint', $$Es un verbo de tres letras.$$,
      'expected', $$El verbo « dejar » (dejar + infinitivo).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué modo verbal sigue a « permitir que » o « dejar que »?$$,
      'hint', $$Es el mismo modo que sigue a « querer que ».$$,
      'expected', $$El subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « cuidar a » alguien?$$,
      'hint', $$Piensa en una madre y sus bebés.$$,
      'expected', $$Ocuparse del bienestar de esa persona.$$
    ),
    jsonb_build_object(
      'question', $$Cita un obstáculo a la emancipación de la mujer africana mencionado en el texto.$$,
      'hint', $$Piensa en las costumbres o en el dinero.$$,
      'expected', $$Por ejemplo el peso de las tradiciones (también válido: la preferencia por el varón, la falta de independencia financiera).$$
    )
  ),
  now()
);
