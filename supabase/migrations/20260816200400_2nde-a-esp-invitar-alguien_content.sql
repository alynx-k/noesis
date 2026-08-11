-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3161: "L5 Inviter quelqu'un"
-- (https://lyc.ecole-ci.org/course/view.php?id=3161)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31195, redirecting
-- to pluginfile "L5 Inviter quelquun.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (invitation d'investisseurs
-- étrangers, vocabulaire économique, prépositions « a »/« para »).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-invitar-alguien',
  '2nde',
  'A',
  'espagnol',
  $$Invitar a alguien$$,
  5,
  '2nde-a-esp-expresar-gratitud',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de un liceo organiza un gran evento y desea que el embajador de España esté presente. Muy entusiasmados, los alumnos miembros del club quieren informar a sus compañeros sobre cómo redactar una invitación correcta en español. En clase, con la ayuda del profesor, identifican las expresiones de la invitación, las practican e intercambian entre ellos.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: invitar, invertir, una ventaja$$,
        'body', $$« Invitar » significa pedir a alguien que participe en un evento o que esté presente en un lugar: por ejemplo, un alumno puede invitar a sus amigos de clase a la celebración de su cumpleaños. « Invertir » significa poner dinero en un proyecto, una empresa o un negocio con la esperanza de obtener un beneficio. « Una ventaja », por último, es lo contrario de un inconveniente o de una desventaja: es un aspecto positivo que favorece una decisión.$$,
        'highlights', array[$$invitar$$, $$invertir$$, $$una ventaja$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Invitar = pedir la presencia de alguien; invertir = poner dinero en un proyecto; ventaja = lo contrario de un inconveniente.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa el verbo « invertir »?$$, 'solution', $$Poner dinero en una empresa o un negocio con la esperanza de obtener un beneficio.$$)
      ),
      jsonb_build_object(
        'heading', $$Un gobierno que invita a invertir$$,
        'body', $$El texto de referencia relata cómo un gobierno africano invita a inversionistas extranjeros a participar en el desarrollo económico de su país. El gobierno menciona múltiples ventajas y garantías para atraerlos: apertura marítima, riqueza agrícola, mano de obra joven y calificada. Este tipo de discurso es habitual cuando un país quiere diversificar su economía y necesita capital extranjero para desarrollar nuevos sectores de actividad.$$,
        'highlights', array[$$invitar a invertir$$, $$ventajas y garantías$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué un gobierno invita a inversionistas extranjeros?$$, 'solution', $$Para diversificar y desarrollar la economía del país, aprovechando el capital y la experiencia extranjeros.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la invitación con « a » y « para »$$,
        'body', $$Para expresar una invitación en español, el verbo « invitar » se construye normalmente con la preposición « a »: « invitar a los inversionistas ». La preposición « para » se utiliza, por su parte, para indicar la finalidad de la invitación: « el gobierno invita a los inversionistas PARA participar en el proceso de desarrollo ». Otras expresiones útiles para invitar formalmente son « sentirse honrado/a por » y « estar invitado/a ».$$,
        'highlights', array[$$invitar A$$, $$PARA + finalidad$$, $$sentirse honrado/a$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Invitar a$$, $$Se invitó a 40 delegaciones a China.$$),
            jsonb_build_array($$Para + infinitivo (finalidad)$$, $$El gobierno invita a los inversionistas para participar en el desarrollo.$$),
            jsonb_build_array($$Sentirse honrado/a por$$, $$Mi familia se sentirá honrada por tu presencia.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Completa: El gobierno invita……. los empresarios……. diversificar la economía.$$, 'solution', $$El gobierno invita A los empresarios PARA diversificar la economía.$$),
        'fixation', jsonb_build_object('question', $$¿Qué preposición se usa después del verbo « invitar » para introducir a la persona invitada?$$, 'solution', $$La preposición « a ».$$)
      ),
      jsonb_build_object(
        'heading', $$Redactar un mensaje de invitación$$,
        'body', $$Un mensaje de invitación oficial sigue generalmente una estructura clara: primero se anuncia el evento (fecha, lugar, tema); después se menciona a quién se invita y se explica brevemente el objetivo; finalmente, se expresa que la presencia del invitado sería un honor. Por ejemplo: « Señor, el 10 de septiembre, la televisión española organiza un concurso de promoción de las inversiones en África y nos sentiremos honrados por su presencia ».$$,
        'highlights', array[$$estructura de la invitación$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué se debe indicar al principio de un mensaje de invitación?$$, 'solution', $$El evento: la fecha, el lugar y el tema o la finalidad.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu país está preparando una Feria Agrícola Internacional. Una televisión española realiza un reportaje para promocionar la feria, y el comité de organización te designa para redactar un mensaje de invitación dirigido a posibles participantes hispanohablantes.$$,
      'questions', array[
        $$Cita al menos dos expresiones útiles para invitar a alguien en español.$$,
        $$Redacta una breve invitación mencionando el evento, la fecha y el objetivo.$$,
        $$Explica la diferencia de uso entre « invitar a » e « invitar para ».$$,
        $$Da tu opinión sobre el interés de invitar a inversionistas extranjeros para el desarrollo de un país.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué preposición sigue normalmente al verbo « invitar » para introducir a la persona invitada?$$,
      'hint', $$Es una preposición muy corta, de una sola letra.$$,
      'expected', $$La preposición « a » (invitar A alguien).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « una ventaja »?$$,
      'hint', $$Es lo contrario de un inconveniente.$$,
      'expected', $$Un aspecto positivo que favorece una decisión; lo contrario de una desventaja.$$
    ),
    jsonb_build_object(
      'question', $$Completa: « Mi familia se sentirá……. por tu presencia ».$$,
      'hint', $$Expresión que significa sentirse orgulloso/a de recibir a alguien.$$,
      'expected', $$Mi familia se sentirá HONRADA por tu presencia.$$
    ),
    jsonb_build_object(
      'question', $$¿Por qué un gobierno puede invitar a inversionistas extranjeros?$$,
      'hint', $$Piensa en el desarrollo económico del país.$$,
      'expected', $$Para diversificar y desarrollar la economía del país gracias al capital extranjero.$$
    )
  ),
  now()
);
