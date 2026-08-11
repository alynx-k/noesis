-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3190: "L21 Exprimer l'admiration"
-- (https://lyc.ecole-ci.org/course/view.php?id=3190)
-- Contenu extrait de la même pluginfile que L13-L20 (pages 26-28 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 5 Fiche 4".
-- Support: nomination d'Ellen Ochoa à la NASA, astronautes hispaniques.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Aucune phrase copiée verbatim du PDF source ;
-- reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-admiracion',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la admiración$$,
  20,
  '2nde-a-esp-incredulidad-desconfianza',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En clase de historia, unos alumnos hablan con su profesor sobre grandes figuras que han marcado su país. Muy entusiasmados, deciden reunirse en el club de español para identificar las expresiones que permiten manifestar admiración por escrito, y las emplean para rendir homenaje a personas que admiran.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: admirar, nombramiento, carrera$$,
        'body', $$« Admirar » significa sentir una gran estima o respeto hacia alguien: muchos jóvenes admiran a sus artistas favoritos. « El nombramiento » es el acto de designar a alguien para un cargo: para formar el gobierno, el primer ministro procede al nombramiento de los ministros. « La carrera » es el conjunto de etapas profesionales de una persona: un deportista puede tener una carrera brillante.$$,
        'highlights', array[$$admirar$$, $$nombramiento$$, $$carrera$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Admirar = sentir gran estima; nombramiento = designación a un cargo; carrera = conjunto de etapas profesionales.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es « un nombramiento »?$$, 'solution', $$El acto de designar a alguien para un cargo.$$)
      ),
      jsonb_build_object(
        'heading', $$Astronautas hispanos, una carrera admirable$$,
        'body', $$El texto de referencia trata del nombramiento de Ellen Ochoa como directora del Centro Espacial Johnson de la NASA. Como única astronauta hispana en ese cargo, su carrera suscitó una gran admiración. La lección recuerda que solo tres astronautas de origen hispano han trabajado en la NASA: Franklin Chang Díaz (Costa Rica), José M. Hernández (México) y Ellen Ochoa.$$,
        'highlights', array[$$Ellen Ochoa$$, $$astronautas hispanos en la NASA$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita a uno de los tres astronautas hispanos mencionados en la lección.$$, 'solution', $$Por ejemplo Ellen Ochoa (también válido: Franklin Chang Díaz, José M. Hernández).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la admiración$$,
        'body', $$Para expresar admiración en español se usan exclamaciones como « ¡qué bien! », « ¡qué alegría! », « ¡qué maravilla! », « ¡enhorabuena! » y « ¡felicidades! ». Estas expresiones se usan típicamente para reaccionar ante un éxito, un logro o una noticia positiva relacionada con alguien que admiramos.$$,
        'highlights', array[$$¡qué bien!$$, $$¡enhorabuena!$$, $$¡qué maravilla!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Contexto de uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Enhorabuena!$$, $$Éxito o logro personal (examen, premio)$$),
            jsonb_build_array($$¡Qué bien! / ¡Qué maravilla!$$, $$Reacción general de alegría admirativa$$),
            jsonb_build_array($$¡Felicidades!$$, $$Celebración de un logro o evento positivo$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de admiración: « Mi hermano aprobó todos sus exámenes ».$$, 'solution', $$¡Enhorabuena a mi hermano! / ¡Qué bien que haya aprobado todos sus exámenes!$$),
        'fixation', jsonb_build_object('question', $$¿Qué expresión se usa típicamente para felicitar a alguien por un logro?$$, 'solution', $$« ¡Enhorabuena! » (también válido: ¡Felicidades!).$$)
      ),
      jsonb_build_object(
        'heading', $$Rendir homenaje por escrito$$,
        'body', $$Escribir un artículo o un mensaje de admiración implica describir el logro de la persona, explicar por qué inspira respeto o admiración, y terminar con una expresión de felicitación o de orgullo. Este tipo de texto es común, por ejemplo, cuando se celebra el nombramiento de una personalidad admirada o la victoria de un equipo deportivo.$$,
        'highlights', array[$$artículo de homenaje$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué elementos incluye un artículo que rinde homenaje a una persona admirada?$$, 'solution', $$La descripción de su logro, la razón de la admiración, y una expresión de felicitación.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu padre, funcionario, va a ser premiado por sus méritos profesionales. Presencias la ceremonia junto con otros compañeros del club de español y decides redactar un artículo para la revista del club expresando tu admiración.$$,
      'questions', array[
        $$Cita al menos tres expresiones que sirven para manifestar admiración en español.$$,
        $$Redacta un breve artículo expresando tu admiración por el logro de tu padre.$$,
        $$Explica por qué la carrera de Ellen Ochoa suscita admiración, según la lección.$$,
        $$Cita a los tres astronautas hispanos que trabajaron en la NASA mencionados en el texto.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da una expresión que se usa para felicitar a alguien por un examen aprobado.$$,
      'hint', $$Es una sola palabra, muy común en las felicitaciones.$$,
      'expected', $$« ¡Enhorabuena! » (también válido: ¡Felicidades!).$$
    ),
    jsonb_build_object(
      'question', $$¿Quién fue nombrada directora del Centro Espacial Johnson de la NASA, según la lección?$$,
      'hint', $$Es la única astronauta hispana mencionada con ese cargo.$$,
      'expected', $$Ellen Ochoa.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « admirar »?$$,
      'hint', $$Piensa en el sentimiento hacia un ídolo o modelo.$$,
      'expected', $$Sentir una gran estima o respeto hacia alguien.$$
    ),
    jsonb_build_object(
      'question', $$Da una expresión exclamativa general de admiración (no ligada a un examen).$$,
      'hint', $$Empieza con « ¡Qué... »$$,
      'expected', $$Por ejemplo « ¡qué maravilla! » (también válido: ¡qué bien!, ¡qué alegría!).$$
    )
  ),
  now()
);
