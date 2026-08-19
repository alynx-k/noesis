-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1813: "L17 Exprimer l'intention" (https://lyc.ecole-ci.org/course/view.php?id=1813),
-- resource id 15218. Support: "La guerra de los gigantes del cacao", in
-- ¡Más allá! Espagnol 1ère p.66. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Faits
-- économiques réels (Côte d'Ivoire et Ghana, principaux producteurs
-- mondiaux de cacao, négociations sur le prix du cacao) repris tels
-- quels ; aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-intencion-guerra-cacao',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir la intención: la guerra de los gigantes del cacao$$,
  17,
  '1ere-a-esp-elogios-dadie',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un grupo de alumnos de 1ère A quiere enviar un correo electrónico a sus amigos que estudian en Guinea Ecuatorial. Piden ayuda a su profesor de español para redactarlo, identificando las expresiones de intención que van a usar.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: la intención, dar un golpe sobre la mesa, hacer frente común$$,
        'body', $$« La intención » es el propósito con el que se hace algo: « La administración tiene la intención de organizar las elecciones la semana próxima ». « Dar un golpe sobre la mesa » significa imponer autoridad de forma firme: « Para imponer el silencio, el profesor da un golpe sobre la mesa ». « Hacer frente común » significa unirse para defender un mismo interés: « Los sindicatos hacen frente común para reivindicar un aumento del salario ».$$,
        'highlights', array[$$la intención$$, $$dar un golpe sobre la mesa$$, $$hacer frente común$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué significa « hacer frente común »?$$, 'solution', $$Unirse con otros para defender un mismo interés o reivindicación.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las intenciones comunicativas$$,
        'body', $$La intención comunicativa es el propósito o la finalidad de un discurso. Existen varios tipos: la intención informativa (transmitir datos y hechos objetivos); la intención persuasiva (convencer a alguien de algo); la intención apelativa (ordenar o pedir algo, apelar a la acción); la intención de advertencia (prevenir sobre un peligro o riesgo). Para expresar una intención personal, se usan fórmulas como: tener intención de, pretender + infinitivo, desear que + condicional, querer que + subjuntivo.$$,
        'highlights', array[$$4 tipos : informativa, persuasiva, apelativa, de advertencia$$, $$fórmulas personales : tener intención de, pretender + infinitivo, querer que + subjuntivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Tipo de intención', 'Definición']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$informativa$$, $$usa datos, hechos objetivos, sucesos$$),
            jsonb_build_array($$persuasiva$$, $$busca convencer a alguien de algo$$),
            jsonb_build_array($$apelativa$$, $$busca ordenar o pedir algo (apelar a la acción)$$),
            jsonb_build_array($$de advertencia$$, $$previene sobre un peligro o riesgo$$)
          )
        ),
        'example', jsonb_build_object('statement', $$« Un portavoz de la empresa responde que las discusiones han sido positivas y constructivas. » ¿Qué tipo de intención comunicativa expresa esta frase?$$, 'solution', $$Una intención informativa: usa datos y hechos objetivos (el resultado de las discusiones) sin buscar convencer ni ordenar nada.$$),
        'fixation', jsonb_build_object('question', $$¿Cuál es la diferencia entre la intención persuasiva y la intención apelativa?$$, 'solution', $$La intención persuasiva busca convencer a alguien de algo (cambiar su opinión), mientras que la intención apelativa busca directamente ordenar o pedir una acción concreta.$$)
      ),
      jsonb_build_object(
        'heading', $$Costa de Marfil y Ghana: la lucha por el precio del cacao$$,
        'body', $$Costa de Marfil y Ghana son los dos mayores productores mundiales de cacao. Ante la insatisfacción con el bajo precio internacional del producto, ambos países decidieron unirse y hacer frente común, anunciando un ultimátum con la intención de suspender la venta de cacao si no se mejoraban las condiciones. Ante esta amenaza, los principales actores del mercado internacional del chocolate iniciaron negociaciones con estos dos países. Otra intención de esta lucha era exigir que una mayor parte de los beneficios del mercado llegara directamente a las plantaciones y a los productores locales.$$,
        'highlights', array[$$Costa de Marfil + Ghana = principales productores mundiales de cacao$$, $$ultimátum : amenaza de suspender la venta para negociar mejores precios$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál era una de las intenciones de Costa de Marfil y Ghana en su lucha por el precio del cacao?$$, 'solution', $$Exigir que una mayor parte de los beneficios del mercado llegara a las plantaciones y a los productores locales (también válido: obtener un aumento del precio del cacao).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo de la celebración del Día Internacional del Medio Ambiente, los miembros del club de español quieren escribir un artículo apelativo titulado « Salvemos nuestro ecosistema ».$$,
      'questions', array[
        $$Identifica qué tipo de intención comunicativa (informativa, persuasiva, apelativa o de advertencia) corresponde mejor a este artículo, y justifica tu respuesta.$$,
        $$Redacta el artículo, expresando claramente tu intención de movilizar a los lectores (usa al menos una fórmula de intención personal).$$,
        $$Añade una frase de advertencia sobre las consecuencias de no actuar para proteger el ecosistema.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué tipo de intención comunicativa busca convencer a alguien de algo?$$,
      'hint', $$Es una de las cuatro intenciones vistas.$$,
      'expected', $$La intención persuasiva.$$
    ),
    jsonb_build_object(
      'question', $$Da una fórmula para expresar una intención personal.$$,
      'hint', $$Empieza con « tener... ».$$,
      'expected', $$Por ejemplo « tener intención de » (otras válidas: pretender + infinitivo, querer que + subjuntivo).$$
    ),
    jsonb_build_object(
      'question', $$¿Cuáles son los dos países mencionados como principales productores mundiales de cacao?$$,
      'hint', $$Ambos están en África occidental.$$,
      'expected', $$Costa de Marfil y Ghana.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué amenazaron con hacer Costa de Marfil y Ghana para presionar en las negociaciones sobre el precio del cacao?$$,
      'hint', $$Es una medida drástica de presión económica.$$,
      'expected', $$Suspender la venta de cacao.$$
    )
  ),
  now()
);
