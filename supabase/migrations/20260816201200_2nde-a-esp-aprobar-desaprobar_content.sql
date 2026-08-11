-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3176: "L14 Approuver - Désapprouver"
-- (https://lyc.ecole-ci.org/course/view.php?id=3176)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31375, redirecting
-- to pluginfile "L14 Approuver - Désapprouver.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (débat sur le travail
-- infantile, expressions de l'accord/désaccord). Aucune phrase copiée
-- verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-aprobar-desaprobar',
  '2nde',
  'A',
  'espagnol',
  $$Aprobar y desaprobar$$,
  13,
  '2nde-a-esp-raccontar-un-hecho',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Unos alumnos leen en un periódico español el titular: « La explotación de los niños a través del trabajo: un fenómeno contemporáneo de esclavitud ». Muy interesados, al día siguiente en clase de español identifican las expresiones que permiten expresar acuerdo o desacuerdo, las utilizan y debaten entre ellos sobre el trabajo infantil.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: lustrabotas, dignificar, el crecimiento$$,
        'body', $$« Un lustrabotas » (o limpiabotas) es una persona que se dedica a limpiar zapatos a cambio de dinero, a menudo en la calle: durante las vacaciones, un joven puede trabajar como lustrabotas en un barrio popular. « Dignificar » significa hacer digno de algo o de alguien. « El crecimiento » designa la evolución o el avance, por ejemplo de una economía o de una sociedad.$$,
        'highlights', array[$$lustrabotas$$, $$dignificar$$, $$el crecimiento$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Lustrabotas = quien limpia zapatos por dinero; dignificar = hacer digno de; crecimiento = evolución o avance.$$),
        'fixation', jsonb_build_object('question', $$¿Qué hace un « lustrabotas »?$$, 'solution', $$Limpia zapatos a cambio de dinero, a menudo en la calle.$$)
      ),
      jsonb_build_object(
        'heading', $$Un debate sobre el trabajo infantil$$,
        'body', $$El texto de referencia presenta un debate entre dos personas, Walter y Carlos, sobre el trabajo de los niños. Walter está a favor del trabajo infantil, argumentando que dignifica al ser humano. Carlos, por su parte, no se opone completamente, pero insiste en que es fundamental diferenciar el trabajo infantil razonable de la explotación de los niños, que es mucho más grave y debe ser condenada.$$,
        'highlights', array[$$trabajo infantil$$, $$explotación de los niños$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué distinción hace Carlos en el debate sobre el trabajo de los niños?$$, 'solution', $$La distinción entre el trabajo infantil razonable y la explotación de los niños.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar el acuerdo y el desacuerdo$$,
        'body', $$Para expresar acuerdo con alguien, se usan expresiones como « estoy de acuerdo contigo », « apruebo tu decisión », « comparto tu opinión », « tienes razón », « estoy a favor de », « pienso lo mismo ». Para expresar desacuerdo, basta con negar estas mismas expresiones: « no estoy de acuerdo contigo », « no apruebo tu decisión », « no comparto tu opinión », « no tienes razón », « estoy en contra de ».$$,
        'highlights', array[$$estoy de acuerdo con$$, $$no estoy de acuerdo con$$, $$estoy a favor/en contra de$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Acuerdo$$, $$Desacuerdo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Estoy de acuerdo contigo.$$, $$No estoy de acuerdo contigo.$$),
            jsonb_build_array($$Comparto tu opinión.$$, $$No comparto tu opinión.$$),
            jsonb_build_array($$Estoy a favor de...$$, $$Estoy en contra de...$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en desacuerdo: « Tienes razón sobre el trabajo infantil ».$$, 'solution', $$No tienes razón sobre el trabajo infantil.$$),
        'fixation', jsonb_build_object('question', $$Da una expresión que sirve para mostrar acuerdo con una idea.$$, 'solution', $$Por ejemplo « estoy de acuerdo contigo » (también válido: comparto tu opinión, tienes razón, estoy a favor de).$$)
      ),
      jsonb_build_object(
        'heading', $$Argumentar una posición sobre el trabajo infantil$$,
        'body', $$Al tomar posición en un debate como el del trabajo infantil, conviene distinguir los argumentos a favor (por ejemplo, que el trabajo enseña responsabilidad) de los argumentos en contra (que un niño debe disfrutar de su niñez en lugar de trabajar). Una posición matizada puede reconocer que ayudar en tareas domésticas ligeras es distinto de una explotación que pone en peligro la salud física o mental del niño.$$,
        'highlights', array[$$argumentos a favor/en contra$$]::text[],
        'fixation', jsonb_build_object('question', $$Da un argumento a favor y uno en contra del trabajo infantil mencionados en la lección.$$, 'solution', $$A favor: el trabajo enseña responsabilidad. En contra: un niño debe disfrutar de su niñez en vez de trabajar.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Los alumnos de español de tu colegio descubren en un periódico español el informe de un debate parlamentario sobre el trabajo infantil: algunos diputados condenan todo trabajo realizado por menores, otros lo defienden bajo ciertas condiciones. Decides precisar tu posición ante tus compañeros del club de español.$$,
      'questions', array[
        $$Cita al menos tres expresiones de acuerdo y tres de desacuerdo en español.$$,
        $$Explica la diferencia entre trabajo infantil razonable y explotación de los niños.$$,
        $$Da tu opinión personal sobre el trabajo infantil, con un argumento que la justifique.$$,
        $$Explica por qué, según la lección, la educación es importante para la integración del futuro ciudadano.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da una expresión que sirve para mostrar desacuerdo.$$,
      'hint', $$Empieza por « no ».$$,
      'expected', $$Por ejemplo « no estoy de acuerdo contigo » (también válido: no comparto tu opinión, estoy en contra de).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « dignificar »?$$,
      'hint', $$Piensa en la palabra « digno ».$$,
      'expected', $$Hacer digno de algo o de alguien.$$
    ),
    jsonb_build_object(
      'question', $$Según Walter, en el debate estudiado, ¿por qué el trabajo infantil sería positivo?$$,
      'hint', $$Piensa en el verbo « dignificar ».$$,
      'expected', $$Porque, según él, dignifica al ser humano.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué distinción importante hace Carlos sobre el trabajo de los niños?$$,
      'hint', $$Piensa en dos términos: uno más grave que el otro.$$,
      'expected', $$La distinción entre el trabajo infantil razonable y la explotación de los niños.$$
    )
  ),
  now()
);
