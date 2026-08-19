-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1809: "L13 Exprimer la probabilité" (https://lyc.ecole-ci.org/course/view.php?id=1809),
-- resource id 15170. Support: "Sí, es posible preservar la Amazonía",
-- in ¡Más allá! Espagnol 1ère p.52. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Faits
-- environnementaux réels (mesures de préservation de l'Amazonie) repris
-- tels quels ; aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-probabilidad-amazonia',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir la probabilidad: preservar la Amazonía$$,
  13,
  '1ere-a-esp-capacidad-trasplante',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un grupo de alumnos de 1ère A lee en la sección de meteorología de un periódico una previsión sobre el tiempo, usando expresiones de probabilidad. Al día siguiente, el profesor de español propone identificar y usar estas expresiones a partir de un texto sobre la Amazonía.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: la probabilidad, un bosque, el calentamiento global$$,
        'body', $$« La probabilidad » es la posibilidad de que algo ocurra: « Cuando el cielo está oscuro, hay una fuerte probabilidad de lluvia ». « Un bosque » es una extensión grande de árboles: « El bosque de Banco forma parte del patrimonio mundial de la UNESCO ». « El calentamiento global » es el aumento de la temperatura media del planeta: « La deforestación provoca el calentamiento global ».$$,
        'highlights', array[$$la probabilidad$$, $$un bosque$$, $$el calentamiento global$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué provoca la deforestación, según la lección?$$, 'solution', $$El calentamiento global.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la probabilidad$$,
        'body', $$Para expresar la probabilidad, la hipótesis o la duda, se usan expresiones como: es posible, es probable, puede ser, quizá/quizás, a lo mejor — seguidas de « que » + subjuntivo cuando hay un cambio de sujeto. Ejemplo: « Es probable que llueva esta tarde »; « Puede ser que mi amigo venga hoy ». También existe la forma « es posible » + infinitivo cuando no hay cambio de sujeto: « Es posible destruir la Amazonía en los años venideros ».$$,
        'highlights', array[$$es posible/es probable/puede ser/quizá(s) + que + subjuntivo$$, $$es posible + infinitivo (sin cambio de sujeto)$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Expresión', 'Construcción']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$es probable que$$, $$+ subjuntivo$$),
            jsonb_build_array($$puede ser que$$, $$+ subjuntivo$$),
            jsonb_build_array($$quizá(s)$$, $$+ subjuntivo$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma expresando probabilidad: « Los niños duermen en casa. »$$, 'solution', $$Es posible que los niños duerman en casa. (duerman = subjuntivo de dormir)$$),
        'fixation', jsonb_build_object('question', $$¿Cuándo se usa « es posible » + infinitivo, en vez de « es posible que » + subjuntivo?$$, 'solution', $$Cuando no hay cambio de sujeto entre la expresión de probabilidad y la acción expresada (por ejemplo « Es posible destruir la Amazonía », sin especificar quién).$$)
      ),
      jsonb_build_object(
        'heading', $$Preservar la Amazonía$$,
        'body', $$El bosque amazónico corre el riesgo de ser destruido por la deforestación, lo cual agravaría el calentamiento global. Entre las medidas propuestas para preservarlo, se citan: luchar contra la crisis climática, cambiar las políticas nacionales de uso de la tierra, integrar a los sectores productivos, promover actividades económicas sostenibles, restaurar las zonas degradadas, y crear un mercado dinámico para las actividades productivas sostenibles.$$,
        'highlights', array[$$riesgo : deforestación de la Amazonía → agrava el calentamiento global$$, $$medidas : políticas de uso de la tierra, actividades sostenibles, restauración de zonas degradadas$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita dos medidas propuestas para preservar la Amazonía.$$, 'solution', $$Por ejemplo luchar contra la crisis climática y promover actividades económicas sostenibles (otras válidas: cambiar las políticas de uso de la tierra, restaurar las zonas degradadas).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Una ONG que lucha contra el calentamiento climático propone la repoblación forestal como solución, afirmando: « Es muy probable que frenemos el calentamiento climático con la repoblación forestal. »$$,
      'questions', array[
        $$Enumera algunas expresiones de probabilidad usadas o que podrías usar en este contexto.$$,
        $$Explica a los miembros del club de español la propuesta de la ONG, usando al menos dos expresiones de probabilidad con subjuntivo.$$,
        $$Da tu propia opinión sobre la eficacia de esta medida, usando una expresión de probabilidad.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con el subjuntivo: « Es probable que (llover) esta tarde. »$$,
      'hint', $$Subjuntivo de llover.$$,
      'expected', $$Es probable que llueva esta tarde.$$
    ),
    jsonb_build_object(
      'question', $$Da dos expresiones de probabilidad además de « es posible ».$$,
      'hint', $$Una empieza con « puede... », otra es un adverbio.$$,
      'expected', $$Por ejemplo « es probable » y « puede ser » (también válidas: quizá/quizás, a lo mejor).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué provoca la deforestación de la Amazonía?$$,
      'hint', $$Es un fenómeno climático mundial.$$,
      'expected', $$Agrava el calentamiento global.$$
    ),
    jsonb_build_object(
      'question', $$Cita una medida propuesta para preservar la Amazonía.$$,
      'hint', $$Está relacionada con el uso de la tierra o las actividades económicas.$$,
      'expected', $$Por ejemplo promover actividades económicas sostenibles (otras válidas: cambiar las políticas de uso de la tierra, restaurar las zonas degradadas).$$
    )
  ),
  now()
);
