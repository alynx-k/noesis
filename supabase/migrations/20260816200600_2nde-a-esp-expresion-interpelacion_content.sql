-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3163: "L7 Expression de l'interpellation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3163)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31219, redirecting
-- to pluginfile "L7 Expression de linterpellation.pdf" (3 pages).
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (enfants boliviens
-- interpellant leur gouvernement contre le travail infantile, expression de
-- l'interpellation à l'indicatif/subjonctif). Aucune phrase copiée verbatim
-- du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-expresion-interpelacion',
  '2nde',
  'A',
  'espagnol',
  $$La expresión de la interpelación$$,
  7,
  '2nde-a-esp-pedir-ayuda-socorro',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Una ONG española que lucha contra el trabajo infantil organiza una conferencia en la embajada de España en Costa de Marfil sobre el trabajo de los niños en los campos de café y cacao. Impresionados, unos alumnos de un liceo asisten a la conferencia y, en clase de español, quieren compartir lo que aprendieron con sus compañeros, usando correctamente las expresiones de la interpelación.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: interpelar y pedir$$,
        'body', $$« Interpelar » (sinónimo de « exhortar ») significa incitar a alguien, con palabras firmes, a que haga o deje de hacer algo: es una forma de reclamar una acción concreta a una persona o a una institución. « Pedir », por su parte, es solicitar algo de manera más general, como cuando un niño pide dinero a sus padres para el desayuno. La interpelación es, en cierto modo, un « pedir » más enérgico y dirigido, a menudo hacia una autoridad.$$,
        'highlights', array[$$interpelar / exhortar$$, $$pedir$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Interpelar/exhortar = incitar firmemente a alguien a actuar; pedir = solicitar algo de manera general.$$),
        'fixation', jsonb_build_object('question', $$Da un sinónimo del verbo « interpelar ».$$, 'solution', $$« Exhortar ».$$)
      ),
      jsonb_build_object(
        'heading', $$Un caso concreto: los niños bolivianos y el trabajo infantil$$,
        'body', $$El texto de referencia relata cómo unos niños bolivianos interpelan a su gobierno sobre su situación de trabajo infantil, pidiendo el fin de esta práctica mediante la aplicación de una ley específica. Frente a esta interpelación, el presidente promete resolver el problema, comprometiéndose a garantizar a los niños el acceso a la educación y a los servicios de salud, en lugar de obligarlos a trabajar desde temprana edad.$$,
        'highlights', array[$$trabajo infantil$$, $$interpelación al gobierno$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué piden los niños bolivianos a su gobierno?$$, 'solution', $$Que se ponga fin al trabajo infantil mediante una ley que garantice su acceso a la educación y a la salud.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la interpelación con indicativo o subjuntivo$$,
        'body', $$La expresión de la interpelación sigue una regla precisa según el momento de la acción pedida. Cuando la acción ya está realizada, se usa el indicativo: « los niños piden una ley que IMPIDE el trabajo infantil » (la ley ya existe y produce ese efecto). Cuando la acción se sitúa en el futuro, todavía no realizada, se usa el subjuntivo: « los niños piden una ley que IMPIDA el trabajo infantil » (se espera que la ley se apruebe). Los verbos típicos de la interpelación son pedir, solicitar, requerir y exhortar.$$,
        'highlights', array[$$indicativo = acción realizada$$, $$subjuntivo = acción futura$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Situación$$, $$Modo verbal$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Acción ya realizada$$, $$Indicativo$$, $$Piden una ley que IMPIDE el trabajo infantil.$$),
            jsonb_build_array($$Acción futura, deseada$$, $$Subjuntivo$$, $$Piden una ley que IMPIDA el trabajo infantil.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Los alumnos del instituto piden que la administración …….. (construir) servicios.$$, 'solution', $$Los alumnos piden que la administración CONSTRUYA servicios (subjuntivo, acción futura deseada).$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal se usa cuando la acción pedida todavía no se ha realizado?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$Interpelar en una petición pública$$,
        'body', $$La interpelación también puede tomar la forma de una petición o de un discurso público dirigido a una organización o a una autoridad, por ejemplo durante una ceremonia de sensibilización contra el trabajo infantil. En este tipo de discurso, se describe primero el problema, luego se denuncia la responsabilidad de quienes se aprovechan de la situación, y finalmente se formula una petición clara para que la situación cambie.$$,
        'highlights', array[$$petición pública$$, $$discurso de sensibilización$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué elementos suele incluir un discurso de interpelación pública?$$, 'solution', $$La descripción del problema, la denuncia de sus responsables y una petición clara de cambio.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Las autoridades municipales de tu ciudad deciden luchar contra el trabajo infantil y organizan una campaña, con el apoyo de una ONG española, para denunciar a los autores de la explotación de menores. Te solicitan para servir de intérprete y leer un discurso de interpelación ante los invitados.$$,
      'questions', array[
        $$Enumera al menos tres verbos que se usan para expresar la interpelación.$$,
        $$Explica la diferencia entre « piden una ley que impide » y « piden una ley que impida ».$$,
        $$Redacta una breve petición dirigida a una ONG pidiendo el fin del trabajo infantil.$$,
        $$Da tu opinión sobre la importancia de proteger a los niños contra la explotación económica.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da tres verbos usados para expresar la interpelación.$$,
      'hint', $$Piensa en pedir, solicitar, requerir, exhortar.$$,
      'expected', $$Por ejemplo pedir, solicitar y exhortar (también válido: requerir).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué modo verbal se usa cuando la acción pedida ya está realizada?$$,
      'hint', $$Es el modo que se usa para hechos reales y concretos.$$,
      'expected', $$El indicativo.$$
    ),
    jsonb_build_object(
      'question', $$Completa con el subjuntivo: « Los niños piden una ley que……. (proteger) sus derechos ».$$,
      'hint', $$La acción todavía no se ha realizado, es un deseo para el futuro.$$,
      'expected', $$Los niños piden una ley que PROTEJA sus derechos.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué prometió el presidente boliviano frente a la interpelación de los niños?$$,
      'hint', $$Piensa en la educación y la salud.$$,
      'expected', $$Resolver el problema garantizando a los niños el acceso a la educación y a los servicios de salud.$$
    )
  ),
  now()
);
