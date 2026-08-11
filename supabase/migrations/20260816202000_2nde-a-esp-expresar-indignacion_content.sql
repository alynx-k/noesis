-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3195: "L22 Exprimer l'indignation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3195)
-- Contenu extrait de la même pluginfile que L13-L21 (pages 29-32 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 5 Fiche 5".
-- Support: article sur l'exploitation sexuelle infantile (Unicef / ECPAT).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Aucune phrase copiée verbatim du PDF source ;
-- reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresar-indignacion',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la indignación$$,
  21,
  '2nde-a-esp-expresar-admiracion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante una sesión del club de español, los alumnos ven un reportaje sobre actos de violencia ocurridos en algunos centros escolares. Estas imágenes les chocan profundamente, y deciden escribir un artículo para la revista del club expresando su indignación. En clase, identifican las expresiones adecuadas y las utilizan.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: indignar, explotar, una lacra$$,
        'body', $$« Indignar(se) » significa provocar (o sentir) una fuerte cólera moral frente a una injusticia: la violencia contra personas vulnerables indigna al mundo entero. « Explotar », en este contexto, significa abusar de alguien, aprovecharse de su vulnerabilidad. « Una lacra » es un mal social grave y persistente, como la violencia escolar, que amenaza el futuro de los jóvenes.$$,
        'highlights', array[$$indignar(se)$$, $$explotar = abusar$$, $$una lacra$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Indignar(se) = provocar/sentir cólera moral; explotar = abusar; lacra = mal social grave y persistente.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es « una lacra »?$$, 'solution', $$Un mal social grave y persistente, como la violencia escolar.$$)
      ),
      jsonb_build_object(
        'heading', $$La lucha contra la explotación sexual infantil$$,
        'body', $$El texto de referencia relata cómo dos organizaciones dedicadas a la defensa de los derechos de los niños expresan su indignación frente a la explotación sexual que afecta a millones de menores en el mundo. La lucha es especialmente difícil porque algunos países ocultan el fenómeno, faltan datos fiables, y la pobreza empuja a algunas familias a tolerar esta práctica a cambio de dinero o de bienes básicos.$$,
        'highlights', array[$$explotación sexual infantil$$, $$lucha difícil$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué es difícil luchar contra la explotación sexual infantil, según el texto?$$, 'solution', $$Porque algunos países ocultan el fenómeno, faltan datos fiables y la pobreza empuja a tolerar la práctica.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la indignación$$,
        'body', $$Para expresar indignación en español se usan expresiones como « ¡qué vergüenza! », « me indigna que » y « me apena que », generalmente seguidas de subjuntivo, así como verbos reflexivos como « indignarse » y « apenarse ». Estas fórmulas permiten manifestar una fuerte desaprobación moral frente a una injusticia o un comportamiento inaceptable.$$,
        'highlights', array[$$me indigna que + subjuntivo$$, $$¡qué vergüenza!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Me indigna que + subjuntivo$$, $$Me indigna que se maltrate a los niños.$$),
            jsonb_build_array($$Me apena que + subjuntivo$$, $$Me apena que tantos niños sufran esta situación.$$),
            jsonb_build_array($$¡Qué vergüenza!$$, $$¡Qué vergüenza esta injusticia!$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de indignación: « Nadie ayuda a estos niños ».$$, 'solution', $$Me indigna que nadie ayude a estos niños.$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal sigue a « me indigna que »?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$Denunciar una injusticia por escrito$$,
        'body', $$Un artículo de indignación suele describir primero el hecho chocante, explicar por qué es inaceptable, y proponer -aunque sea brevemente- una posible solución o un llamado a la acción. Este tipo de escritura sirve para sensibilizar a otros lectores y para movilizar a la comunidad frente a una injusticia, como la violencia o el desinterés colectivo ante una causa importante.$$,
        'highlights', array[$$denunciar$$, $$sensibilizar$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué estructura sigue un buen artículo de indignación?$$, 'solution', $$Describir el hecho chocante, explicar por qué es inaceptable, y proponer una posible solución o llamado a la acción.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Muchos niños piden limosna en las calles de tu ciudad. Esta situación te preocupa mucho. Decides escribir un artículo para la revista del club de español denunciando esta injusticia y expresando tu indignación ante la falta de acción de las autoridades.$$,
      'questions', array[
        $$Cita al menos tres expresiones que sirven para manifestar indignación en español.$$,
        $$Redacta un breve artículo expresando tu indignación sobre los niños que piden limosna.$$,
        $$Explica por qué la lucha contra la explotación sexual infantil es tan difícil, según la lección.$$,
        $$Propón una posible solución para mejorar la situación de los niños en dificultad.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué modo verbal sigue a « me indigna que »?$$,
      'hint', $$Es el mismo modo que sigue a « me apena que ».$$,
      'expected', $$El subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « una lacra »?$$,
      'hint', $$Piensa en un problema social grave y duradero.$$,
      'expected', $$Un mal social grave y persistente.$$
    ),
    jsonb_build_object(
      'question', $$Da una expresión exclamativa de indignación.$$,
      'hint', $$Empieza con « ¡Qué... »$$,
      'expected', $$« ¡Qué vergüenza! ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué dos organizaciones se mencionan en el texto luchando contra la explotación sexual infantil?$$,
      'hint', $$Una de ellas es una agencia de la ONU dedicada a la infancia.$$,
      'expected', $$Unicef y una organización llamada ECPAT (Espat).$$
    )
  ),
  now()
);
