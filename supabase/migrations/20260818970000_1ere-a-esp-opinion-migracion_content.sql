-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1805: "L9 Donner une opinion" (https://lyc.ecole-ci.org/course/view.php?id=1805),
-- resource id 15122. Support: "Pobreza y bajos salarios incitan a la
-- migración", in ¡Más allá! Espagnol 1ère p.40. Contenu et exercices
-- ENTIÈREMENT EN ESPAGNOL (immersion linguistique), reformulés/
-- paraphrasés. Faits socio-économiques réels (causes de la migration)
-- repris tels quels ; aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-opinion-migracion',
  '1ere',
  'A',
  'espagnol',
  $$Dar una opinión: pobreza y migración$$,
  9,
  '1ere-a-esp-preguntar-fertilidad',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El profesor propone a la clase un texto titulado « Opinión » sobre las causas de la migración. Con tus compañeros, decides identificar las expresiones de opinión usadas en el texto, para poder dar también tu propio punto de vista.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: opinar que, ingreso, desigualdad$$,
        'body', $$« Opinar que » significa expresar un juicio o un punto de vista: « Mi madre opina que papá debe ahorrar dinero ». « Un ingreso » es el dinero que se recibe por un trabajo: « Los trabajadores piden al patrono que aumente sus ingresos ». « La desigualdad » es la falta de igualdad entre personas o grupos: « Se nota la desigualdad entre Europa y África a través del desarrollo de las infraestructuras ».$$,
        'highlights', array[$$opinar que = expresar un juicio$$, $$un ingreso = dinero recibido por un trabajo$$, $$la desigualdad$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué es « un ingreso »?$$, 'solution', $$El dinero que una persona recibe por su trabajo.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la opinión$$,
        'body', $$Para pedir una opinión, se usan fórmulas como: ¿qué piensas/opinas?, ¿qué te parece a ti?, ¿cuál es tu opinión/tu punto de vista? Para expresar una opinión, se usan fórmulas como: para mí, en mi opinión, pienso que, opino que, creo que, considero que, según yo, a mi entender, a mi parecer, a mi juicio, según mi modo de ver.$$,
        'highlights', array[$$pedir opinión : ¿qué piensas?, ¿qué te parece?, ¿cuál es tu opinión?$$, $$dar opinión : pienso que, opino que, creo que, según yo, a mi entender$$]::text[],
        'fixation', jsonb_build_object('question', $$Da tres fórmulas para expresar una opinión.$$, 'solution', $$Por ejemplo: « pienso que », « en mi opinión », « según yo » (otras válidas: opino que, creo que, considero que, a mi entender, a mi parecer, a mi juicio).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: el subjuntivo con los verbos de opinión negados$$,
        'body', $$Después de los verbos de opinión (creer, pensar, opinar, suponer, sospechar, imaginar, considerar) seguidos de « que », se usa normalmente el indicativo cuando la frase es afirmativa. Sin embargo, cuando la frase es negativa (no creo que, no pienso que...), se emplea el subjuntivo. Ejemplo: « No creo que sea verdad lo que dice » (sea = subjuntivo del verbo ser).$$,
        'highlights', array[$$verbo de opinión afirmativo + que → indicativo$$, $$verbo de opinión negado (no creo que...) + que → subjuntivo$$]::text[],
        'example', jsonb_build_object('statement', $$Completa con el modo correcto: « No pienso que la migración (ser) la única solución. »$$, 'solution', $$No pienso que la migración sea la única solución. (subjuntivo, porque el verbo de opinión está negado)$$),
        'fixation', jsonb_build_object('question', $$¿Por qué se usa el subjuntivo en « No creo que sea verdad »?$$, 'solution', $$Porque el verbo de opinión « creer » está en forma negativa (« no creo »), lo cual exige el uso del subjuntivo en la oración subordinada introducida por « que ».$$)
      ),
      jsonb_build_object(
        'heading', $$Las causas de la migración$$,
        'body', $$Entre las causas de la migración de la población hacia países como Estados Unidos, se citan frecuentemente: la extrema pobreza, la desigualdad social, laboral y salarial, los bajos ingresos, las deudas, y también factores demográficos. Además, algunos habitantes de los países receptores expresan opiniones contrarias a la migración, temiendo que los migrantes ocupen sus empleos y bajen los sueldos locales.$$,
        'highlights', array[$$causas : pobreza extrema, desigualdad, bajos ingresos, deudas$$, $$argumento en contra de la migración : temor por el empleo y los sueldos locales$$]::text[],
        'fixation', jsonb_build_object('question', $$Cita dos causas de la migración mencionadas en la lección.$$, 'solution', $$Por ejemplo la extrema pobreza y la desigualdad social/laboral (otras válidas: bajos ingresos, deudas, factores demográficos).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lees un artículo en el que el director de la Organización Mundial de la Salud (OMS) opina que el COVID-19 es una pandemia y que los países deben unir sus fuerzas para combatirla eficazmente, en vez de luchar de manera aislada.$$,
      'questions', array[
        $$Cita algunas expresiones de opinión que usarías para compartir tu punto de vista.$$,
        $$Da tu opinión sobre lo que dice el director, usando al menos dos fórmulas diferentes de opinión.$$,
        $$Formula una frase con un verbo de opinión negado (por ejemplo « no pienso que... ») y el subjuntivo correspondiente.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da una fórmula para pedir la opinión de alguien.$$,
      'hint', $$Empieza con « ¿qué... »$$,
      'expected', $$Por ejemplo « ¿qué piensas? » o « ¿qué te parece? » (otras válidas: ¿cuál es tu opinión/tu punto de vista?).$$
    ),
    jsonb_build_object(
      'question', $$Completa con el modo correcto: « No opino que eso (ser) buena idea. »$$,
      'hint', $$El verbo de opinión está negado.$$,
      'expected', $$No opino que eso sea buena idea. (subjuntivo)$$
    ),
    jsonb_build_object(
      'question', $$Cita una causa de la migración mencionada en la lección.$$,
      'hint', $$Es una causa económica.$$,
      'expected', $$Por ejemplo la extrema pobreza (otras válidas: desigualdad social, bajos ingresos, deudas).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué verbo se deriva del sustantivo « la creencia »?$$,
      'hint', $$Es un verbo muy común.$$,
      'expected', $$Creer.$$
    )
  ),
  now()
);
