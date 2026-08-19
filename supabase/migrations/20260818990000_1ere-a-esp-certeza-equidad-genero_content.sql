-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1807: "L11 Exprimer la certitude" (https://lyc.ecole-ci.org/course/view.php?id=1807),
-- resource id 15146. Support: "La equidad de género", in ¡Más allá!
-- Espagnol 1ère p.46. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Aucune phrase copiée
-- verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-certeza-equidad-genero',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir la certeza: la equidad de género$$,
  11,
  '1ere-a-esp-aprobar-desaprobar-corrupcion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El presidente del club de español leyó en internet un artículo deportivo que afirmaba con certeza un hecho importante. Al día siguiente, quiere compartir esta información con los miembros del club, identificando y usando las expresiones de certeza.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: una certeza, cumplir con, la equidad$$,
        'body', $$« Una certeza » es un conocimiento seguro, sin duda posible: « Vamos a morir un día: es una certeza ». « Cumplir con » significa respetar una obligación: « Los alumnos deben cumplir con las reglas del colegio ». « La equidad » es el trato justo e imparcial entre personas: « Los padres deben mantener la equidad entre sus hijos ».$$,
        'highlights', array[$$una certeza = conocimiento seguro, sin duda$$, $$cumplir con = respetar una obligación$$, $$la equidad$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué significa « cumplir con las reglas »?$$, 'solution', $$Respetar esas reglas, actuar conforme a lo que exigen.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la certidumbre$$,
        'body', $$La certeza es el conocimiento seguro y claro de algo, sin temor de error. Para expresarla, se usan expresiones como: sin lugar a dudas, no se puede negar, es indudable, es cierto/evidente/obvio/indiscutible, está claro, en realidad, no hay duda, es evidente, no cabe duda, estar seguro de, creer que, no negar. Ejemplo: « Sin lugar a dudas, tuvimos una diversidad para desarrollar gustos y preferencias »; « Es indudable que cada uno es único ».$$,
        'highlights', array[$$sin lugar a dudas, es indudable, es cierto/evidente/obvio$$, $$está claro, no cabe duda, no se puede negar$$]::text[],
        'example', jsonb_build_object('statement', $$¿Cuál de estas frases expresa certeza? « Guiar a la nueva generación fue un error entre tantos » o « Es indiscutible que la generación pasada se ocupó bien de la nueva »?$$, 'solution', $$« Es indiscutible que la generación pasada se ocupó bien de la nueva » — el marcador « es indiscutible » expresa claramente una certeza; la otra frase es una simple afirmación de opinión sin marcador de certeza.$$),
        'fixation', jsonb_build_object('question', $$Da tres expresiones para afirmar una certeza.$$, 'solution', $$Por ejemplo: « sin lugar a dudas », « es indudable », « está claro » (otras válidas: es cierto, es evidente, no cabe duda, no se puede negar).$$)
      ),
      jsonb_build_object(
        'heading', $$La equidad de género$$,
        'body', $$La equidad de género implica que todos los hombres y las mujeres son iguales ante la ley, con los mismos derechos, beneficios e igualdad de oportunidades, y deben ser tratados con el mismo respeto en todos los aspectos de la vida cotidiana: el trabajo, la salud y la educación. Este principio es un elemento importante en el proceso formativo de una sociedad, ya que cada generación transmite a la siguiente los valores que ha recibido.$$,
        'highlights', array[$$equidad de género : mismos derechos, oportunidades y respeto para hombres y mujeres$$, $$se aplica en el trabajo, la salud y la educación$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué implica la equidad de género, según la lección?$$, 'solution', $$Que hombres y mujeres son iguales ante la ley, con los mismos derechos, beneficios, oportunidades y el mismo respeto en la vida cotidiana (trabajo, salud, educación).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lees este texto: « La igualdad de género implica que hombres y mujeres tienen los mismos derechos, beneficios, igualdad de oportunidades y ser tratados con el mismo respeto en todos los aspectos de la vida cotidiana: trabajo, salud y educación. » El texto te inspira muchas ideas.$$,
      'questions', array[
        $$Enumera algunas expresiones de certeza que podrías usar para compartir esta idea con tus compañeros.$$,
        $$Redacta un breve mensaje para el club de español, expresando con certeza tu adhesión a esta idea (usa al menos tres expresiones de certeza diferentes).$$,
        $$Da un ejemplo concreto (de tu entorno o inventado) que ilustre la importancia de la equidad de género en la educación.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué es « una certeza »?$$,
      'hint', $$Es lo contrario de la duda.$$,
      'expected', $$Un conocimiento seguro y claro de algo, sin temor de error.$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de certeza: « ___ que cada uno es único. »$$,
      'hint', $$Empieza con « Es... ».$$,
      'expected', $$Por ejemplo « Es indudable » (otras válidas: es cierto, es evidente, es obvio).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué implica la equidad de género en el trabajo?$$,
      'hint', $$Piensa en la igualdad de trato.$$,
      'expected', $$Que hombres y mujeres tienen los mismos derechos, oportunidades y son tratados con el mismo respeto.$$
    ),
    jsonb_build_object(
      'question', $$Da un sinónimo de « no se puede negar ».$$,
      'hint', $$Otra expresión de certeza equivalente.$$,
      'expected', $$Por ejemplo « es indiscutible » o « no cabe duda ».$$
    )
  ),
  now()
);
