-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1806: "L10 Approuver-Désapprouver" (https://lyc.ecole-ci.org/course/view.php?id=1806),
-- resource id 15134. Support: "Corrupción: ¿Cómo eliminarla?", in ¡Más
-- allá! Espagnol 1ère p.43. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. NOTE: l'exemple du
-- PDF source sur l'hydroxychloroquine contre la COVID-19 (efficacité
-- scientifiquement contestée/réfutée) a été délibérément écarté et
-- remplacé par le sujet, sans controverse, de la scolarisation des
-- filles ; aucune autre phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-aprobar-desaprobar-corrupcion',
  '1ere',
  'A',
  'espagnol',
  $$Aprobar/Desaprobar: la corrupción$$,
  10,
  '1ere-a-esp-opinion-migracion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El profesor de español propone un texto en el que dos personas expresan opiniones opuestas sobre el papel de la escuela. Los alumnos de la clase quieren discutir entre ellos, y por eso deciden identificar las expresiones de aprobación y desaprobación para usarlas correctamente.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: aprobar/desaprobar, corromper, honesto/a$$,
        'body', $$« Aprobar » (opuesto: « desaprobar ») significa estar de acuerdo con algo: « Cuando el profesor está de acuerdo con una respuesta, la aprueba diciendo "bien" ». « Corromper » significa incitar a alguien a actuar de forma deshonesta, generalmente mediante dinero: « En las fronteras, los traficantes corrompen a los aduaneros ». « Honesto/a » significa que actúa con integridad: « El taxista honesto devuelve el teléfono móvil que el cliente olvidó en su taxi ».$$,
        'highlights', array[$$aprobar ≠ desaprobar$$, $$corromper$$, $$honesto/a$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el antónimo de « honesto »?$$, 'solution', $$Corrupto (o deshonesto).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las expresiones de aprobación y desaprobación$$,
        'body', $$Para expresar la aprobación, se usan expresiones como: por supuesto que sí, estoy de acuerdo, ¡muy bien!, perfectamente, estupendo, ¡buena idea! Para expresar la desaprobación, se usan expresiones como: ¡muy mal!, no está bien, yo no lo veo así, no estoy de acuerdo con, ¡de ninguna manera!, estoy en contra de, lo que me parece mal es que.$$,
        'highlights', array[$$aprobación : por supuesto que sí, estoy de acuerdo, ¡muy bien!, estupendo$$, $$desaprobación : no estoy de acuerdo con, estoy en contra de, ¡de ninguna manera!$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Aprobación', 'Desaprobación']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$por supuesto que sí$$, $$¡de ninguna manera!$$),
            jsonb_build_array($$estoy de acuerdo$$, $$no estoy de acuerdo con$$),
            jsonb_build_array($$¡buena idea!$$, $$estoy en contra de$$)
          )
        ),
        'example', jsonb_build_object('statement', $$« El gobierno está a favor de la preservación de los elefantes mientras que las comunidades rurales no lo ven así. » Identifica la expresión de aprobación y la de desaprobación.$$, 'solution', $$« Está a favor de » expresa la aprobación (del gobierno); « no lo ven así » expresa la desaprobación (de las comunidades rurales).$$),
        'fixation', jsonb_build_object('question', $$Da dos expresiones para desaprobar algo.$$, 'solution', $$Por ejemplo « no estoy de acuerdo con » y « estoy en contra de » (otras válidas: ¡muy mal!, ¡de ninguna manera!, yo no lo veo así).$$)
      ),
      jsonb_build_object(
        'heading', $$La corrupción y sus formas$$,
        'body', $$La corrupción en la Función Pública puede tomar varias formas: el clientelismo, las extorsiones, los fraudes y la malversación de fondos. Para luchar contra ella, algunos gobiernos crean comisiones internas encargadas de detectar anomalías en la actuación de los funcionarios y de limitar los perjuicios para la Administración. Sobre la posibilidad de eliminar completamente la corrupción, existen opiniones diferentes: unos piensan que es un fenómeno demasiado extendido para desaparecer del todo, y proponen reducir sus efectos valorando mejor los sueldos públicos; otros creen que una vigilancia estricta puede eliminarla eficazmente.$$,
        'highlights', array[$$formas de corrupción : clientelismo, extorsiones, fraudes, malversación$$, $$soluciones propuestas : comisiones de vigilancia, mejora de los sueldos públicos$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita dos formas de corrupción mencionadas en la lección.$$, 'solution', $$Por ejemplo el clientelismo y las extorsiones (otras válidas: los fraudes, la malversación de fondos).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Durante una reunión del club de español, lees con los miembros un artículo sobre « la escolarización de las chicas en África ». El artículo defiende que la educación de las chicas beneficia a toda la sociedad.$$,
      'questions', array[
        $$Enumera algunas expresiones de aprobación que podrías usar para apoyar esta idea.$$,
        $$Expresa tu aprobación (o desaprobación, si prefieres) sobre la escolarización de las chicas, con al menos dos argumentos.$$,
        $$Imagina la reacción de alguien que desaprueba esta idea, y responde a sus argumentos.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Cuál es el antónimo de « aprobar »?$$,
      'hint', $$Empieza con « des- ».$$,
      'expected', $$Desaprobar.$$
    ),
    jsonb_build_object(
      'question', $$Da una expresión para aprobar algo con entusiasmo.$$,
      'hint', $$Puede ser una sola palabra.$$,
      'expected', $$Por ejemplo « ¡estupendo! » o « ¡buena idea! » (otras válidas: perfectamente, por supuesto que sí).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « corromper » a alguien?$$,
      'hint', $$Suele implicar dinero.$$,
      'expected', $$Incitar a esa persona a actuar de forma deshonesta, generalmente a cambio de dinero.$$
    ),
    jsonb_build_object(
      'question', $$Cita una solución propuesta en la lección para luchar contra la corrupción.$$,
      'hint', $$Implica supervisar a los funcionarios.$$,
      'expected', $$Por ejemplo crear una comisión de vigilancia de las acciones de los funcionarios (también válido: mejorar los sueldos públicos).$$
    )
  ),
  now()
);
