-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1811: "L15 Exprimer la peur" (https://lyc.ecole-ci.org/course/view.php?id=1811),
-- resource id 15194. Support: "Érase, una vez Loubassa...", in ¡Más Allá!
-- Espagnol 1ère p.60. Le conte "Loubassa" du manuel source étant un récit
-- narratif propre au manuel (non fourni intégralement, potentiellement
-- protégé), il a été REMPLACÉ par un scénario original ("Kwame et le
-- secret") illustrant les mêmes points de grammaire (dar miedo, temer +
-- infinitif/subjonctif). Le vocabulaire et les règles grammaticales,
-- ainsi que les faits réels évoqués dans les exercices d'évaluation
-- (crainte liée à la pandémie de COVID-19 en Afrique), sont repris tels
-- quels ; aucune phrase narrative copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-temor-miedo',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir el temor$$,
  15,
  '1ere-a-esp-indignacion-xenofobia',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de tu instituto organiza una excursión al zoológico de Abidjan. Durante la visita, muchos alumnos tuvieron miedo de las serpientes y de los leones. Al día siguiente, los redactores del periódico del club deciden escribir un artículo sobre la excursión, usando las expresiones de temor.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: el temor, un daño, fracasar$$,
        'body', $$« El temor » (sinónimo: « el miedo ») es el sentimiento que se experimenta ante un peligro: « La población expresa el temor cuando reina el bandidismo en el barrio ». « Un daño » es un perjuicio causado a alguien o algo: « Los incendios causan muchos daños a la población ». « Fracasar » significa no lograr un objetivo: « Cuando un alumno no estudia sus lecciones, fracasa al final del año escolar ».$$,
        'highlights', array[$$el temor = el miedo$$, $$un daño$$, $$fracasar$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el sinónimo de « el temor »?$$, 'solution', $$El miedo.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las expresiones de temor$$,
        'body', $$Para expresar el temor, se usan varias construcciones: (1) dar miedo + sustantivo, como en « Me da miedo la pandemia del coronavirus »; (2) temer + infinitivo, cuando el sujeto es el mismo, como en « Teme perder a su familia »; (3) temer que + subjuntivo, cuando hay un cambio de sujeto, como en « Teme que su amigo se entere »; (4) otras expresiones: tener miedo, estar inquieto, inquietarse por, estar preocupado, preocuparse por, estar ansioso.$$,
        'highlights', array[$$dar miedo + sustantivo$$, $$temer + infinitivo (mismo sujeto)$$, $$temer que + subjuntivo (cambio de sujeto)$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Construcción', 'Uso', 'Ejemplo']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$dar miedo + sustantivo$$, $$objeto del miedo$$, $$Me da miedo la oscuridad.$$),
            jsonb_build_array($$temer + infinitivo$$, $$mismo sujeto$$, $$Teme perder su trabajo.$$),
            jsonb_build_array($$temer que + subjuntivo$$, $$cambio de sujeto$$, $$Teme que su hijo se enferme.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Kwame guardaba un secreto importante a su mejor amigo Yao: había decidido mudarse de ciudad sin avisarle. Kwame temía que Yao (enterarse) de la verdad demasiado tarde. Completa la frase con el subjuntivo correcto.$$, 'solution', $$Kwame temía que Yao se enterara de la verdad demasiado tarde. (se enterara = subjuntivo imperfecto de enterarse, ya que el verbo principal está en pasado)$$),
        'fixation', jsonb_build_object('question', $$¿Cuándo se usa « temer que » + subjuntivo, en vez de « temer » + infinitivo?$$, 'solution', $$Cuando hay un cambio de sujeto entre quien teme y la acción temida (por ejemplo, « Loubassa teme que su mujer se entere », donde el sujeto de « enterarse » es distinto del sujeto de « temer »).$$)
      ),
      jsonb_build_object(
        'heading', $$El temor ante la pandemia de COVID-19 en África$$,
        'body', $$Durante la pandemia de COVID-19, muchas autoridades y expertos expresaron temor ante la posibilidad de que el virus se propagara rápidamente en los barrios precarios de África, donde las condiciones sanitarias son más difíciles. La preocupación se centraba también en los niños que no podían asistir a la escuela durante los confinamientos, y en las personas que no podían salir a trabajar.$$,
        'highlights', array[$$temor ante la propagación del COVID-19 en barrios precarios$$, $$preocupación por los niños sin escuela durante el confinamiento$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué las autoridades temían especialmente la propagación del COVID-19 en los barrios precarios de África?$$, 'solution', $$Porque las condiciones sanitarias y de vida en esos barrios son más difíciles, lo que podía agravar la propagación y el impacto de la pandemia.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Los miembros del club de español leen una noticia sobre la llegada del coronavirus a África, que advierte que la situación podría convertirse en un desastre si no se toman medidas urgentes. Como responsable del club, te toca escribir un artículo para sensibilizar al alumnado.$$,
      'questions', array[
        $$Lista algunas expresiones de temor (con sus tres construcciones: dar miedo, temer + infinitivo, temer que + subjuntivo).$$,
        $$Escribe un artículo breve expresando el temor de la comunidad ante esta situación, usando al menos tres construcciones diferentes.$$,
        $$Propón una medida concreta para tranquilizar a tus compañeros y reducir el temor.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: « Me ___ miedo la oscuridad. »$$,
      'hint', $$Verbo « dar ».$$,
      'expected', $$da$$
    ),
    jsonb_build_object(
      'question', $$¿Qué construcción se usa cuando hay un cambio de sujeto: « temer + infinitivo » o « temer que + subjuntivo »?$$,
      'hint', $$Piensa en dos personas diferentes.$$,
      'expected', $$Temer que + subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$Da un sinónimo de « el temor ».$$,
      'hint', $$Es la palabra más común.$$,
      'expected', $$El miedo.$$
    ),
    jsonb_build_object(
      'question', $$Transforma con « temer que »: « Su hijo está enfermo » (sujeto: la madre teme).$$,
      'hint', $$Subjuntivo de estar.$$,
      'expected', $$Teme que su hijo esté enfermo.$$
    )
  ),
  now()
);
