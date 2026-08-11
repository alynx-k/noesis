-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3160: "L23 Donner des instructions"
-- (https://lyc.ecole-ci.org/course/view.php?id=3160)
-- Contenu extrait de la même pluginfile que L13-L22 (pages 33-34 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 6 Fiche 1".
-- Support: instructions données par des parents avant une visite chez les
-- grands-parents. Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Aucune phrase copiée verbatim du
-- PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-dar-instrucciones',
  '2nde',
  'A',
  'espagnol',
  $$Dar instrucciones$$,
  22,
  '2nde-a-esp-expresar-indignacion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tras participar en una campaña de sensibilización sobre enfermedades transmisibles, unos alumnos quieren compartir lo aprendido con sus compañeros mediante un artículo. En clase de español, identifican los elementos que permiten dar instrucciones claras, los utilizan y redactan sus propias instrucciones.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: dar instrucciones, despedida, portarse$$,
        'body', $$« Dar instrucciones » significa indicar a alguien qué debe hacer: al principio del año escolar, los profesores dan instrucciones a los alumnos. « Una despedida » es una fórmula o un momento de separación, como decir « adiós ». « Portarse » significa comportarse de cierta manera: un niño que escucha los consejos de sus padres se porta bien en sociedad.$$,
        'highlights', array[$$dar instrucciones$$, $$despedida$$, $$portarse$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Dar instrucciones = indicar qué hacer; despedida = fórmula de separación; portarse = comportarse de cierta manera.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « portarse »?$$, 'solution', $$Comportarse de cierta manera (bien o mal).$$)
      ),
      jsonb_build_object(
        'heading', $$Instrucciones antes de una despedida$$,
        'body', $$El texto de referencia relata cómo unos padres, antes de despedirse de su hijo, le dan una serie de instrucciones para que se porte bien en casa de sus abuelos: tener cuidado con las bebidas frías, no exponerse demasiado tiempo al sol, y no acostarse muy tarde. Estas instrucciones buscan garantizar tanto su buen comportamiento como su salud.$$,
        'highlights', array[$$instrucciones de los padres$$, $$buen comportamiento$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita una de las instrucciones que dan los padres a su hijo en el texto.$$, 'solution', $$Por ejemplo tener cuidado con las bebidas frías (también válido: no estar mucho tiempo al sol, no acostarse muy tarde).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: dar instrucciones$$,
        'body', $$Para dar instrucciones en español se puede usar: a) verbos como « aconsejar » + infinitivo, o « aconsejar que » + subjuntivo; b) verbos como « rogar » y « pedir », a menudo seguidos de « que » + subjuntivo; c) el imperativo positivo, directamente: « Espera tu turno », « Ten cuidado ».$$,
        'highlights', array[$$aconsejar que + subjuntivo$$, $$pedir/rogar$$, $$imperativo positivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Aconsejar + infinitivo$$, $$Te aconsejo escoger un cepillo nuevo.$$),
            jsonb_build_array($$Pedir que + subjuntivo$$, $$Te pido que respetes a los mayores.$$),
            jsonb_build_array($$Imperativo positivo$$, $$Ten cuidado con las bebidas frías.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en instrucción con imperativo: « Debes esperar tu turno ».$$, 'solution', $$Espera tu turno.$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal se usa directamente para dar una instrucción breve?$$, 'solution', $$El imperativo (positivo).$$)
      ),
      jsonb_build_object(
        'heading', $$Redactar instrucciones de seguridad$$,
        'body', $$Dar instrucciones es especialmente útil en situaciones de seguridad, por ejemplo durante un viaje en coche: se puede aconsejar mantener la cabeza y los brazos dentro del vehículo, pedir que no se perturbe al conductor, y recordar la obligación de llevar puesto el cinturón de seguridad. Combinar varias estructuras (aconsejar, pedir, imperativo) hace que las instrucciones sean más completas y persuasivas.$$,
        'highlights', array[$$instrucciones de seguridad$$]::text[],
        'fixation', jsonb_build_object('question', $$Da un ejemplo de instrucción de seguridad para un viaje en coche.$$, 'solution', $$Por ejemplo « os pido que llevéis puesto el cinturón de seguridad » (u otra instrucción similar).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Viajas en coche con tu familia. Unos primos juegan en el asiento trasero sin tomar precauciones, lo que te parece peligroso. Decides escribir un artículo para la revista del club de español dando instrucciones claras sobre cómo comportarse con seguridad en el coche.$$,
      'questions', array[
        $$Cita al menos tres estructuras usadas para dar instrucciones en español.$$,
        $$Redacta tres instrucciones de seguridad para pasajeros de un coche.$$,
        $$Explica la diferencia entre « aconsejar que » y el uso directo del imperativo para dar una instrucción.$$,
        $$Da un ejemplo de instrucción que unos padres podrían dar a su hijo antes de un viaje.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué modo verbal se usa para dar una instrucción de forma directa y breve?$$,
      'hint', $$Es el modo de « ¡espera!», «¡ten cuidado!».$$,
      'expected', $$El imperativo (positivo).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « una despedida »?$$,
      'hint', $$Piensa en la palabra « adiós ».$$,
      'expected', $$Una fórmula o un momento de separación.$$
    ),
    jsonb_build_object(
      'question', $$Completa: « Te………. (aconsejar) que escojas un cepillo nuevo ».$$,
      'hint', $$Es la primera persona del presente de indicativo del verbo aconsejar.$$,
      'expected', $$Te ACONSEJO que escojas un cepillo nuevo.$$
    ),
    jsonb_build_object(
      'question', $$Cita una instrucción que los padres del texto dan a su hijo.$$,
      'hint', $$Piensa en las bebidas, el sol o la hora de acostarse.$$,
      'expected', $$Por ejemplo « ten cuidado con las bebidas frías » (también válido: no estar mucho al sol, no acostarse tarde).$$
    )
  ),
  now()
);
