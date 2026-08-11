-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3187: "L20 Exprimer l'incrédulité ou la méfiance"
-- (https://lyc.ecole-ci.org/course/view.php?id=3187)
-- Contenu extrait de la même pluginfile que L13-L19 (pages 23-25 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 5 Fiche 3".
-- Support: réactions d'incrédulité face à l'attentat de Madrid (2004) et aux
-- fake news. Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Aucune phrase copiée verbatim du
-- PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-incredulidad-desconfianza',
  '2nde',
  'A',
  'espagnol',
  $$Expresar la incredulidad y la desconfianza$$,
  19,
  '2nde-a-esp-expresar-pena',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante una conferencia sobre las « fake news » (noticias falsas), unos alumnos representan a su club de español. Tras la conferencia, deciden escribir un artículo para informar a sus compañeros. En clase de español, identifican las expresiones de la incredulidad y la desconfianza, las usan y las emplean para comentar noticias sorprendentes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: desconfiar, una noticia, un recuerdo$$,
        'body', $$« Desconfiar(se) » significa no tener confianza, dudar de algo o de alguien. « Una noticia » es una información difundida, por ejemplo por los periodistas, sobre un acontecimiento del mundo. « Un recuerdo » es lo que queda en la memoria de un momento vivido, como las fotos que se toman durante un evento importante.$$,
        'highlights', array[$$desconfiar$$, $$una noticia$$, $$un recuerdo$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Desconfiar = no tener confianza, dudar; noticia = información difundida; recuerdo = lo que queda en la memoria.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « desconfiar »?$$, 'solution', $$No tener confianza, dudar de algo o de alguien.$$)
      ),
      jsonb_build_object(
        'heading', $$La incredulidad ante un atentado$$,
        'body', $$El texto de referencia relata cómo la población española, tras el atentado terrorista de Madrid en marzo de 2004, expresó una gran incredulidad frente a las imágenes difundidas por los medios. Esta incredulidad se explica por el carácter inesperado del ataque -en un país democrático, en plena capital y días antes de unas elecciones- así como por su carácter sorpresivo, con un número de víctimas muy elevado.$$,
        'highlights', array[$$incredulidad$$, $$atentado de Madrid$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué la población española sintió tanta incredulidad tras el atentado, según el texto?$$, 'solution', $$Por el carácter inesperado (país democrático, plena capital, en periodo electoral) y sorpresivo del ataque, con muchas víctimas.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar incredulidad o desconfianza$$,
        'body', $$Para expresar incredulidad, se usan expresiones como « no me lo creo », « no me lo puedo creer », « ¿de verdad? », « ¿estás de broma? », « no me digas », « es increíble que » (+ subjuntivo). Para expresar desconfianza, se pueden usar « desconfío de », « soy muy incrédulo/a », o verbos como « dudar que » seguidos de subjuntivo.$$,
        'highlights', array[$$no me lo creo$$, $$¿de verdad?$$, $$es increíble que$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿De verdad? / ¿Estás de broma?$$, $$Pedir confirmación con sorpresa$$),
            jsonb_build_array($$No me lo puedo creer$$, $$Expresar incredulidad fuerte$$),
            jsonb_build_array($$Es increíble que + subjuntivo$$, $$Formular la incredulidad de forma más formal$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de incredulidad: « Ganaron la lotería ».$$, 'solution', $$¿De verdad? / No me lo puedo creer que hayan ganado la lotería.$$),
        'fixation', jsonb_build_object('question', $$Da una expresión informal para reaccionar con sorpresa e incredulidad a una noticia.$$, 'solution', $$Por ejemplo « ¡no me digas!» (también válido: ¿de verdad?, ¿estás de broma?).$$)
      ),
      jsonb_build_object(
        'heading', $$Desconfiar de las noticias falsas$$,
        'body', $$En la era de las redes sociales, es importante desconfiar de las noticias no verificadas antes de compartirlas. Frente a un rumor sorprendente, conviene expresar la propia incredulidad, verificar la fuente de la información y evitar difundir noticias falsas que puedan dañar la reputación de otras personas.$$,
        'highlights', array[$$verificar la fuente$$, $$evitar difundir noticias falsas$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué se debe hacer antes de compartir una noticia sorprendente en las redes sociales?$$, 'solution', $$Verificar la fuente de la información y desconfiar de lo no confirmado, para evitar difundir noticias falsas.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Según una fuente internacional, la OMS declara el estado de emergencia sanitaria frente a una nueva pandemia. La noticia te parece difícil de creer por su gravedad. Decides escribir un correo electrónico a tu corresponsal guineoecuatoriano expresando tu incredulidad y tu preocupación.$$,
      'questions', array[
        $$Cita al menos tres expresiones de incredulidad o desconfianza en español.$$,
        $$Redacta un breve correo expresando tu incredulidad frente a la noticia de la pandemia.$$,
        $$Explica por qué la incredulidad de la población española tras el atentado de Madrid era comprensible.$$,
        $$Da un consejo para evitar difundir noticias falsas en las redes sociales.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Da una expresión que sirve para pedir confirmación con sorpresa.$$,
      'hint', $$Es una pregunta muy corta, de dos palabras.$$,
      'expected', $$« ¿De verdad? » (también válido: ¿Estás de broma?).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « una noticia »?$$,
      'hint', $$Piensa en lo que publican los periodistas.$$,
      'expected', $$Una información difundida sobre un acontecimiento del mundo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué modo verbal sigue a « es increíble que »?$$,
      'hint', $$Es el mismo modo que sigue a « dudo que ».$$,
      'expected', $$El subjuntivo.$$
    ),
    jsonb_build_object(
      'question', $$¿En qué ciudad y año ocurrió el atentado mencionado en la lección?$$,
      'hint', $$Ya se mencionó en una lección anterior sobre la duda.$$,
      'expected', $$En Madrid, en 2004.$$
    )
  ),
  now()
);
