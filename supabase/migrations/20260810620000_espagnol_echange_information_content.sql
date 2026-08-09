-- Espagnol 3ème, leçon 3/7 : L'échange d'information.
-- Même contexte que les leçons 1-2 : ecole-ci.org redirige vers le mur de
-- connexion élève sans session accessible -- contenu de repli rédigé à
-- partir de connaissances générales sur un programme standard d'espagnol
-- LV2 débutant, cohérent avec le thème du titre officiel ("L'échange
-- d'information"). Formulations et exercices 100% originaux, contenu
-- pédagogique en espagnol (immersion), structure de l'app en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un turista español, perdido en tu barrio, te pregunta cómo llegar a la biblioteca y quiere saber información sobre tu colegio. Debes responder usando las palabras interrogativas y el vocabulario adecuado.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: las palabras interrogativas$$,
        'body', $$Para pedir información en español, usas palabras interrogativas. Todas llevan tilde (acento escrito) cuando se usan en preguntas.$$,
        'highlights', array[$$qué$$, $$dónde$$, $$cuándo$$, $$por qué$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué?$$, $$quoi ?$$),
            jsonb_build_array($$¿Dónde?$$, $$où ?$$),
            jsonb_build_array($$¿Cuándo?$$, $$quand ?$$),
            jsonb_build_array($$¿Cómo?$$, $$comment ?$$),
            jsonb_build_array($$¿Por qué?$$, $$pourquoi ?$$),
            jsonb_build_array($$¿Quién?$$, $$qui ?$$),
            jsonb_build_array($$¿Cuánto/a?$$, $$combien ?$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Las palabras interrogativas siempre llevan tilde en las preguntas, y la pregunta se escribe entre dos signos de interrogación: uno al principio (¿) y otro al final (?).$$),
        'example', jsonb_build_object('statement', $$Pregunta por el lugar de la biblioteca.$$, 'solution', $$¿Dónde está la biblioteca?$$),
        'fixation', jsonb_build_object('question', $$Escribe la pregunta que corresponde a esta respuesta: "La clase empieza a las ocho."$$, 'solution', $$¿Cuándo empieza la clase?$$)
      ),
      jsonb_build_object(
        'heading', $$El verbo ESTAR y la ubicación$$,
        'body', $$Para decir dónde se encuentra algo o alguien, usas el verbo "estar", otro verbo irregular distinto de "ser".$$,
        'highlights', array[$$estar$$, $$está$$, $$están$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$ESTAR (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$estoy$$),
            jsonb_build_array($$tú$$, $$estás$$),
            jsonb_build_array($$él / ella / usted$$, $$está$$),
            jsonb_build_array($$nosotros / nosotras$$, $$estamos$$),
            jsonb_build_array($$vosotros / vosotras$$, $$estáis$$),
            jsonb_build_array($$ellos / ellas / ustedes$$, $$están$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Estar" se usa para la ubicación (dónde está algo) y para los estados temporales. No confundas con "ser", que se usa para el origen y las características permanentes.$$),
        'example', jsonb_build_object('statement', $$¿Dónde está tu colegio?$$, 'solution', $$Mi colegio está en el centro de la ciudad.$$),
        'fixation', jsonb_build_object('question', $$Completa: La biblioteca ___ (estar) cerca del mercado.$$, 'solution', $$La biblioteca está cerca del mercado.$$)
      ),
      jsonb_build_object(
        'heading', $$Dar información: HAY y los lugares$$,
        'body', $$La expresión "hay" significa "il y a" en francés y sirve para decir que algo existe en un lugar. Es invariable: se usa igual en singular y en plural.$$,
        'highlights', array[$$hay$$, $$cerca de$$, $$lejos de$$, $$al lado de$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión de lugar$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$cerca de$$, $$près de$$),
            jsonb_build_array($$lejos de$$, $$loin de$$),
            jsonb_build_array($$al lado de$$, $$à côté de$$),
            jsonb_build_array($$enfrente de$$, $$en face de$$),
            jsonb_build_array($$a la derecha$$, $$à droite$$),
            jsonb_build_array($$a la izquierda$$, $$à gauche$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Hay" viene del verbo "haber" y no cambia nunca de forma: "Hay un mercado" (il y a un marché) y "Hay dos mercados" (il y a deux marchés).$$),
        'example', jsonb_build_object('statement', $$Da información sobre tu barrio: ¿qué hay cerca de tu casa?$$, 'solution', $$Cerca de mi casa hay un mercado y una farmacia.$$),
        'fixation', jsonb_build_object('question', $$Completa con "hay": En mi colegio ___ una biblioteca y dos patios.$$, 'solution', $$En mi colegio hay una biblioteca y dos patios.$$)
      ),
      jsonb_build_object(
        'heading', $$Los verbos en -AR en presente$$,
        'body', $$Muchos verbos españoles terminan en -ar en infinitivo. En presente, siguen un patrón regular que debes memorizar para dar información sobre las actividades diarias.$$,
        'highlights', array[$$hablar$$, $$estudiar$$, $$preguntar$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$HABLAR (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$hablo$$),
            jsonb_build_array($$tú$$, $$hablas$$),
            jsonb_build_array($$él / ella / usted$$, $$habla$$),
            jsonb_build_array($$nosotros / nosotras$$, $$hablamos$$),
            jsonb_build_array($$vosotros / vosotras$$, $$habláis$$),
            jsonb_build_array($$ellos / ellas / ustedes$$, $$hablan$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Los verbos regulares en -ar quitan la terminación "-ar" y añaden: -o, -as, -a, -amos, -áis, -an. Ejemplo con "estudiar": estudio, estudias, estudia, estudiamos, estudiáis, estudian.$$),
        'example', jsonb_build_object('statement', $$Pregunta a un compañero qué idioma habla.$$, 'solution', $$¿Qué idioma hablas? -- Hablo francés y un poco de español.$$),
        'fixation', jsonb_build_object('question', $$Conjuga "estudiar" con "nosotros": Nosotros ___ español en el colegio.$$, 'solution', $$Nosotros estudiamos español en el colegio.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un turista español, perdido en tu barrio, te pregunta cómo llegar a la biblioteca y qué actividades se pueden hacer en tu colegio.$$,
      'questions', array[
        $$Responde a la pregunta: ¿Dónde está la biblioteca?$$,
        $$Usa "hay" para decir qué lugares hay cerca de tu colegio.$$,
        $$Explica, con un verbo en -ar, qué estudias en el colegio.$$,
        $$Hazle al turista una pregunta con "¿Cómo?" o "¿Por qué?".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Escribe la pregunta correspondiente a esta respuesta: "Vivo en Abiyán."$$,
      'hint', $$La pregunta pide el lugar donde vives.$$,
      'expected', $$¿Dónde vives?$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "estar" con "ellos" y completa: Mis amigos ___ en el patio.$$,
      'hint', $$"Estar" con "ellos/ellas" termina en -án.$$,
      'expected', $$Mis amigos están en el patio.$$
    ),
    jsonb_build_object(
      'question', $$Completa con "hay": En el mercado ___ muchas frutas.$$,
      'hint', $$"Hay" no cambia nunca, sea singular o plural.$$,
      'expected', $$En el mercado hay muchas frutas.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga el verbo "hablar" con "tú": ¿Qué idiomas ___ (hablar) tú?$$,
      'hint', $$Los verbos en -ar con "tú" terminan en -as.$$,
      'expected', $$¿Qué idiomas hablas tú?$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-echange-information';
