-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 856: "L4 Décrire" (https://lyc.ecole-ci.org/course/view.php?id=856),
-- resource id 3921. Support: "Castilla", in ¡Más allá! Espagnol 1ère p.23.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés. Une seule phrase courte du texte source
-- (citation d'analyse littéraire standard, une ligne) est citée à des
-- fins d'analyse du sentiment de l'auteur ; le reste (règle grammaticale,
-- vocabulaire, description factuelle du paysage castillan) est composé
-- originalement, non copié verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-describir-castilla',
  '1ere',
  'A',
  'espagnol',
  $$Describir: el paisaje de Castilla$$,
  4,
  '1ere-a-esp-guinea-ecuatorial',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Los alumnos de un colegio de Madrid quieren colaborar con un colegio de Costa de Marfil e intercambiar informaciones sobre la arquitectura de cada colegio. El profesor de español pide a los alumnos de 1ère A que aprendan a describir con precisión, usando adjetivos calificativos.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: describir, paisaje, ancho$$,
        'body', $$« Describir » (sinónimo: « hacer la descripción ») significa dar detalles precisos sobre algo o alguien. « Un paisaje » es la vista de un territorio, considerada en su aspecto general: « El bosque de Banco presenta un paisaje maravilloso ». « Ancho(a) » significa que tiene una gran extensión de un lado a otro: « El mar es más ancho que el río ».$$,
        'highlights', array[$$describir = dar detalles precisos$$, $$un paisaje$$, $$ancho(a)$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué significa « describir un acontecimiento »?$$, 'solution', $$Pintar, delinear, especificar o trazar el acontecimiento — es decir, dar de él una imagen precisa y detallada (no significa denegarlo, ni reclamarlo).$$)
      ),
      jsonb_build_object(
        'heading', $$El paisaje de Castilla$$,
        'body', $$Castilla es una vasta región del centro de España, conocida por su paisaje árido, uniforme y a menudo descrito como monótono: una tierra agrietada, de horizontes extensos, sin grandes contrastes de relieve. Este paisaje inspira frecuentemente en los escritores españoles un sentimiento de tristeza contemplativa, como lo ilustra esta breve frase de un texto clásico sobre Castilla: « ¡Qué hermosa la tristeza reposada de ese mar petrificado y lleno de cielo! » — una imagen que compara la llanura castellana con un mar inmóvil.$$,
        'highlights', array[$$Castilla : tierra árida, uniforme, paisaje monótono$$, $$inspira a menudo un sentimiento de tristeza contemplativa$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué sentimiento suele inspirar la descripción del paisaje de Castilla en los textos literarios?$$, 'solution', $$Un sentimiento de tristeza, de amargura o de melancolía contemplativa, ligado a la monotonía y a la aridez del paisaje.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: el adjetivo calificativo$$,
        'body', $$El adjetivo calificativo es una palabra que indica una cualidad del sustantivo al que se refiere, y con el cual concuerda en género y número. Ejemplos: « Es un paisaje monótono »; « Ancha es Castilla »; « Faltan suaves transiciones ». El adjetivo puede situarse delante o detrás del sustantivo, y este orden a veces cambia el significado de la expresión: « Tengo un amigo viejo » (un amigo de edad avanzada) no significa lo mismo que « Tengo un viejo amigo » (un amigo de hace mucho tiempo).$$,
        'highlights', array[$$el adjetivo concuerda en género y número con el sustantivo$$, $$posición delante/detrás del sustantivo → puede cambiar el sentido$$]::text[],
        'example', jsonb_build_object('statement', $$Explica la diferencia entre « un amigo viejo » y « un viejo amigo ».$$, 'solution', $$« Un amigo viejo » describe a un amigo que tiene una edad avanzada (cualidad física/objetiva). « Un viejo amigo » describe a un amigo que se conoce desde hace mucho tiempo (relación antigua), sin indicar necesariamente su edad.$$),
        'fixation', jsonb_build_object('question', $$¿Con qué debe concordar el adjetivo calificativo en español?$$, 'solution', $$Con el género y el número del sustantivo al que se refiere.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$El club de español de tu colegio organiza un concurso cuyo tema es la descripción. Representas tu clase en este concurso.$$,
      'questions', array[
        $$Identifica cuatro adjetivos calificativos que podrías usar para describir tu barrio o tu colegio.$$,
        $$Describe tu barrio o tu colegio en varias frases, usando esos adjetivos y cuidando la concordancia de género y número.$$,
        $$Explica, con un ejemplo propio, cómo la posición de un adjetivo (delante o detrás del sustantivo) puede cambiar el sentido de una frase.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué significa « describir »?$$,
      'hint', $$Es sinónimo de « hacer la descripción ».$$,
      'expected', $$Dar detalles precisos sobre algo o alguien.$$
    ),
    jsonb_build_object(
      'question', $$¿Cómo se describe generalmente el paisaje de Castilla?$$,
      'hint', $$No es un paisaje muy variado.$$,
      'expected', $$Como un paisaje árido, uniforme y monótono.$$
    ),
    jsonb_build_object(
      'question', $$¿Con qué concuerda el adjetivo calificativo en español?$$,
      'hint', $$Dos categorías gramaticales.$$,
      'expected', $$Con el género y el número del sustantivo al que se refiere.$$
    ),
    jsonb_build_object(
      'question', $$Da un ejemplo de adjetivo calificativo que describa un rasgo de carácter (por ejemplo, alguien que se acuerda de los favores recibidos).$$,
      'hint', $$Es lo opuesto de « ingrato ».$$,
      'expected', $$Agradecido.$$
    )
  ),
  now()
);
