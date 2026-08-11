-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3158: "L3 Connaitre les réalité de Guinée Ecuato[riale]"
-- (https://lyc.ecole-ci.org/course/view.php?id=3158)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31159, redirecting
-- to pluginfile "L3 Connaitre les réalité de Guinée Ecuato.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (groupes ethniques de
-- Guinée Équatoriale, vocabulaire ethnie/race/cohabitation, expression du
-- pourcentage). Aucune phrase copiée verbatim du PDF source ; reformulation
-- 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-etnias-guinea-ecuatorial',
  '2nde',
  'A',
  'espagnol',
  $$Las etnias de Guinea Ecuatorial$$,
  3,
  '2nde-a-esp-colonizacion-america',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante una conferencia de prensa organizada en un centro cultural de España, el secretario de la embajada de Guinea Ecuatorial afirma: « Guinea Ecuatorial ocupa una posición geográfica particular: somos el único país de todo el continente africano que tiene el español como lengua oficial ». Intrigados, unos alumnos de un liceo asisten a la conferencia y, al día siguiente, en clase de español, deciden investigar más sobre la historia y la sociedad de este país.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: etnia, raza y convivencia$$,
        'body', $$Para hablar de la diversidad de un país, se necesitan tres palabras clave. « Una etnia » (o « tribu ») es un grupo humano que comparte una lengua, una cultura y unas costumbres comunes: el ébété, por ejemplo, es una etnia de Costa de Marfil. « Una raza » designa un conjunto de características físicas compartidas por un grupo de personas: los europeos se identifican, por ejemplo, con la raza blanca. Por último, « convivir » significa vivir juntos en armonía, respetando las diferencias: para evitar los conflictos dentro de un país, es fundamental que los distintos grupos humanos convivan en paz.$$,
        'highlights', array[$$etnia$$, $$raza$$, $$convivir$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Etnia/tribu = grupo humano de lengua y cultura comunes; raza = conjunto de rasgos físicos compartidos; convivir = vivir juntos en paz pese a las diferencias.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa el verbo « convivir »?$$, 'solution', $$Vivir juntos en armonía, respetando las diferencias entre grupos.$$)
      ),
      jsonb_build_object(
        'heading', $$Los grandes grupos étnicos de Guinea Ecuatorial$$,
        'body', $$Guinea Ecuatorial reúne siete grandes grupos étnicos: los fang, los bubi, los pigmeos, los ndowé, los bisió, los fernandinos y los criollos (llamados también annoboneses). La gran mayoría de estos grupos son de origen bantú. Los dos grupos más numerosos son claramente los fang, que representan alrededor del ochenta por ciento de la población, y los bubi, que representan cerca del quince por ciento. A pesar de esta diversidad, los diferentes grupos conviven hoy en día en paz, sin conflictos étnicos importantes.$$,
        'highlights', array[$$siete grupos étnicos$$, $$fang (80%)$$, $$bubi (15%)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Grupo étnico$$, $$Proporción aproximada de la población$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Fang$$, $$80 %$$),
            jsonb_build_array($$Bubi$$, $$15 %$$),
            jsonb_build_array($$Pigmeos, ndowé, bisió, fernandinos, criollos$$, $$Minoría restante de la población$$)
          )
        ),
        'example', jsonb_build_object('statement', $$¿Cuáles son los dos grupos étnicos más numerosos de Guinea Ecuatorial?$$, 'solution', $$Los fang (mayoritarios) y los bubi.$$),
        'fixation', jsonb_build_object('question', $$¿Cuántos grandes grupos étnicos existen en Guinea Ecuatorial?$$, 'solution', $$Siete grandes grupos étnicos.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar el porcentaje$$,
        'body', $$El porcentaje permite expresar una proporción sobre un total de cien unidades. Cuando queremos referirnos a la totalidad de algo, decimos « el cien por cien », « el ciento por ciento » o « cien por ciento ». Por ejemplo, se puede afirmar que la población indígena representa el noventa por ciento (90 %) de la población guineoecuatoriana, que los fang constituyen un ochenta por ciento (80 %) de la población, o que acudió el cien por cien (100 %) de los invitados a un evento.$$,
        'highlights', array[$$el cien por cien$$, $$el X por ciento$$]::text[],
        'example', jsonb_build_object('statement', $$¿Cómo se escribe con letras el porcentaje 15 %?$$, 'solution', $$El quince por ciento.$$),
        'fixation', jsonb_build_object('question', $$¿Qué expresión se usa para decir que algo corresponde al total, sin excepción?$$, 'solution', $$« El cien por cien » (o « el ciento por ciento »).$$)
      ),
      jsonb_build_object(
        'heading', $$Identidad cultural y diversidad$$,
        'body', $$La identidad cultural de un pueblo se reconoce a través de varios elementos: la raza, la etnia a la que pertenece y también su forma de vestirse. Guinea Ecuatorial, como muchos países africanos, se compone de un mosaico de etnias diferentes que comparten, sin embargo, un mismo territorio y una misma lengua oficial, el español. Esta diversidad cultural, lejos de ser un problema, se presenta como una riqueza cuando los distintos grupos logran convivir en paz.$$,
        'highlights', array[$$identidad cultural$$, $$diversidad cultural$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita dos elementos que permiten reconocer la identidad cultural de un pueblo.$$, 'solution', $$Por ejemplo la raza y la etnia (también válido: el modo de vestirse).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo de un gran desfile de los grupos étnicos de Costa de Marfil durante un carnaval popular, asististe impresionado a la fiesta. Durante la sesión del club de español de tu liceo, decides informar a tus compañeros sobre la diversidad étnica, comparando lo que viste con lo que aprendiste sobre Guinea Ecuatorial.$$,
      'questions', array[
        $$Cita al menos tres de los siete grandes grupos étnicos de Guinea Ecuatorial.$$,
        $$Da el porcentaje aproximado de población que representan los fang y los bubi.$$,
        $$Explica con tus propias palabras qué significa « convivir en paz » para grupos étnicos diferentes.$$,
        $$Cita dos elementos que caracterizan la identidad cultural de un pueblo.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Cuántos grandes grupos étnicos existen en Guinea Ecuatorial?$$,
      'hint', $$Es el mismo número que los días de la semana.$$,
      'expected', $$Siete grandes grupos étnicos.$$
    ),
    jsonb_build_object(
      'question', $$¿Cuál es el grupo étnico mayoritario de Guinea Ecuatorial?$$,
      'hint', $$Representa alrededor del 80 % de la población.$$,
      'expected', $$Los fang.$$
    ),
    jsonb_build_object(
      'question', $$Escribe con letras el porcentaje 90 %.$$,
      'hint', $$Termina en « -enta », como cuarenta o cincuenta.$$,
      'expected', $$El noventa por ciento.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa la palabra « etnia »?$$,
      'hint', $$Es sinónimo de « tribu ».$$,
      'expected', $$Un grupo humano que comparte una lengua, una cultura y unas costumbres comunes.$$
    )
  ),
  now()
);
