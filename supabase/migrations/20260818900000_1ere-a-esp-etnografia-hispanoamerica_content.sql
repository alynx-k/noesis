-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 858: "L2 Connaitre les réalités de l'Amérique
-- hispanique" (https://lyc.ecole-ci.org/course/view.php?id=858), resource
-- id 3945. Support: "Etnografía en Hispanoamérica", in ¡Más allá! Espagnol
-- 1ère p.15. Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Faits ethnographiques et
-- statistiques réels repris tels quels ; aucune phrase copiée verbatim du
-- PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-etnografia-hispanoamerica',
  '1ere',
  'A',
  'espagnol',
  $$Etnografía en Hispanoamérica$$,
  2,
  '1ere-a-esp-retos-socioeconomicos-espana',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un alumno de 1ère A acaba de ganar el concurso nacional de español y recibe una beca de viaje para visitar un país hispanoamericano. Sus compañeros de clase deciden ayudarle a elegir, identificando y analizando juntos las realidades socioculturales de Hispanoamérica.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: etnografía, conquistador, indígena$$,
        'body', $$« La etnografía » es el estudio descriptivo de los pueblos y sus costumbres: al estudiar las diferentes etnias de un territorio, se hace su etnografía. « Un conquistador » es la persona que llegó a un territorio para dominarlo militarmente: los primeros europeos que llegaron a América eran conquistadores. « Un indígena » (sinónimo: « un autóctono ») es un miembro de un pueblo originario de un territorio, presente antes de la llegada de los colonizadores.$$,
        'highlights', array[$$la etnografía$$, $$un conquistador$$, $$un indígena / autóctono$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Etnografía = estudio de los pueblos y sus costumbres; conquistador = quien llega para dominar un territorio; indígena/autóctono = miembro de un pueblo originario.$$),
        'fixation', jsonb_build_object('question', $$¿Qué diferencia hay entre un indígena y un conquistador?$$, 'solution', $$El indígena es originario del territorio, presente antes de la colonización; el conquistador es quien llega desde fuera para dominarlo.$$)
      ),
      jsonb_build_object(
        'heading', $$La diversidad étnica de Hispanoamérica$$,
        'body', $$La población hispanoamericana está compuesta de diferentes etnias: los indígenas (pueblos originarios), los europeos (principalmente españoles), los criollos (descendientes de europeos nacidos en América) y los mestizos (nacidos del cruce entre indígenas y europeos). Esta diversidad varía mucho de un país a otro: por ejemplo, Bolivia tiene el mayor porcentaje de población indígena, mientras que la población mestiza predomina en países como Paraguay u Honduras. Esta situación de mezcla étnica ha sido, históricamente, objeto de discriminación racial en el continente.$$,
        'highlights', array[$$4 grupos principales : indígenas, europeos, criollos, mestizos$$, $$la proporción varía mucho según el país$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Grupo étnico', 'Porcentaje en Hispanoamérica']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Diversas mezclas (mestizos, mulatos...)$$, $$43,38%$$),
            jsonb_build_array($$Blancos (de origen europeo)$$, $$35,08%$$),
            jsonb_build_array($$Amerindios (indígenas)$$, $$12,53%$$),
            jsonb_build_array($$Negros (de origen africano)$$, $$9,01%$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$¿Cuál es el grupo étnico predominante en Hispanoamérica, según las estadísticas?$$, 'solution', $$Las diversas mezclas (mestizos, mulatos, etc.), con un 43,38% de la población.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: el uso del pretérito imperfecto de indicativo$$,
        'body', $$El pretérito imperfecto se usa para expresar: (1) acciones paralelas o simultáneas en el pasado (« Las bombas caían mientras la gente corría »); (2) una acción constante o habitual en el pasado (« Los criollos eran descendientes de europeos »); (3) una acción del pasado interrumpida por otra (« Cuando me iba, sonó el teléfono »); (4) una acción del pasado cuyo final no se señala (« Ayer Ignacio llevaba unos pantalones a cuadros »); (5) la cortesía (« Quería un café, por favor »).$$,
        'highlights', array[$$acciones simultáneas/paralelas en el pasado$$, $$acción habitual o constante en el pasado$$, $$acción interrumpida por otra ; cortesía$$]::text[],
        'example', jsonb_build_object('statement', $$Pon en pretérito imperfecto: « Existen significativas comunidades indígenas en México. »$$, 'solution', $$Existían significativas comunidades indígenas en México.$$),
        'fixation', jsonb_build_object('question', $$¿Para qué se usa el pretérito imperfecto al describir la composición étnica de un país en el pasado?$$, 'solution', $$Para expresar una situación o un estado constante del pasado (por ejemplo « los criollos eran descendientes de europeos »), sin marcar un momento preciso de inicio o de fin.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conferenciante de la embajada de Bolivia da una conferencia sobre la diversidad étnica en Hispanoamérica, presentando estas cifras: diversas mezclas 43,38%, blancos 35,08%, amerindios 12,53%, negros 9,01%. Representas el club de español de tu colegio y decides informar a tus compañeros.$$,
      'questions', array[
        $$Enumera los grupos étnicos que componen la población hispanoamericana.$$,
        $$Explica, usando el pretérito imperfecto, cómo se formó esta diversidad étnica.$$,
        $$Informa a tus compañeros del club de español, citando al menos dos de las cifras presentadas por el conferenciante.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué significa la palabra « etnografía »?$$,
      'hint', $$Es el estudio de algo.$$,
      'expected', $$El estudio descriptivo de los pueblos y sus costumbres.$$
    ),
    jsonb_build_object(
      'question', $$¿Quiénes son los « criollos »?$$,
      'hint', $$Nacieron en América.$$,
      'expected', $$Los descendientes de europeos nacidos en América.$$
    ),
    jsonb_build_object(
      'question', $$¿Cuál es el país hispanoamericano citado como teniendo el mayor porcentaje de población indígena?$$,
      'hint', $$Está en Sudamérica.$$,
      'expected', $$Bolivia.$$
    ),
    jsonb_build_object(
      'question', $$Pon en pretérito imperfecto: « Hay minorías en Venezuela. »$$,
      'hint', $$« Hay » viene de « haber ».$$,
      'expected', $$Había minorías en Venezuela.$$
    )
  ),
  now()
);
