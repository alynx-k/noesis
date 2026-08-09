-- Espagnol 3ème, leçon 1/7 : La découverte du monde hispanique.
-- Tentative de récupération sur ecole-ci.org : la navigation vers le site a
-- de nouveau abouti au mur de connexion déjà rencontré lors des sessions
-- précédentes (redirection automatique vers /co/logineleve.php, un
-- formulaire de connexion élève exigeant matricule/téléphone, sans session
-- accessible). Conformément à la consigne, on ne s'acharne pas : le contenu
-- ci-dessous est donc rédigé à partir de connaissances générales sur un
-- programme standard d'espagnol LV2 débutant en 3ème, correspondant au
-- thème du titre officiel du catalogue ("La découverte du monde
-- hispanique"). Formulations et exercices 100% originaux. Comme pour
-- Anglais, le contenu pédagogique lui-même est rédigé en espagnol
-- (immersion linguistique), seule la structure de l'app reste française.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tu profesor de español te pide preparar una breve presentación sobre el mundo hispánico: qué países hablan español, dónde están, y algunas curiosidades culturales. Antes de empezar, necesitas conocer el vocabulario básico y algunas reglas de pronunciación.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: países hispanohablantes$$,
        'body', $$El español (o castellano) se habla en más de veinte países, en varios continentes: Europa, América y África. Antes de hablar de ellos, conoce sus nombres y sus gentilicios (las palabras que indican la nacionalidad).$$,
        'highlights', array[$$hispanohablante$$, $$el país$$, $$el gentilicio$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$País$$, $$Gentilicio (masc./fem.)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$España$$, $$español / española$$),
            jsonb_build_array($$México$$, $$mexicano / mexicana$$),
            jsonb_build_array($$Argentina$$, $$argentino / argentina$$),
            jsonb_build_array($$Colombia$$, $$colombiano / colombiana$$),
            jsonb_build_array($$Cuba$$, $$cubano / cubana$$),
            jsonb_build_array($$Guinea Ecuatorial$$, $$ecuatoguineano / ecuatoguineana$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Los gentilicios son adjetivos y concuerdan en género y número con la persona: un chico español, una chica española, unos chicos españoles, unas chicas españolas. Los que terminan en -o cambian a -a en femenino; los que terminan en consonante añaden -a.$$),
        'example', jsonb_build_object('statement', $$¿De dónde es Pedro, si vive en Bogotá?$$, 'solution', $$Pedro es de Colombia. Es colombiano.$$),
        'fixation', jsonb_build_object('question', $$Completa: María vive en Buenos Aires. Es ___ (nacionalidad femenina de Argentina).$$, 'solution', $$María es argentina.$$)
      ),
      jsonb_build_object(
        'heading', $$El alfabeto español y sonidos especiales$$,
        'body', $$El alfabeto español tiene una letra que no existe en francés: la ñ. Además, algunas combinaciones de letras tienen un sonido particular que debes aprender para pronunciar bien.$$,
        'highlights', array[$$la ñ$$, $$la doble ele (ll)$$, $$la erre doble (rr)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Letra o grupo$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$ñ$$, $$España, niño$$),
            jsonb_build_array($$ll$$, $$lluvia, llamar$$),
            jsonb_build_array($$rr$$, $$perro, guitarra$$),
            jsonb_build_array($$j$$, $$jugar, joven (sonido fuerte)$$),
            jsonb_build_array($$h$$, $$hola (nunca se pronuncia)$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$La ñ se pronuncia como el grupo "gn" del francés (como en "montagne"). La h en español es muda: no se pronuncia nunca. La j se pronuncia con un sonido fuerte, gutural, distinto de la j francesa.$$),
        'example', jsonb_build_object('statement', $$¿Por qué "hola" empieza con una letra que no se oye?$$, 'solution', $$Porque la h es muda en español; "hola" se pronuncia sin el sonido de la h, casi como "ola".$$),
        'fixation', jsonb_build_object('question', $$¿Cómo se pronuncia la ñ en la palabra "España"? Compárala con una palabra francesa parecida.$$, 'solution', $$La ñ de "España" se pronuncia como el grupo "gn" de la palabra francesa "montagne".$$)
      ),
      jsonb_build_object(
        'heading', $$El verbo SER y el origen$$,
        'body', $$Para decir de dónde eres, usas el verbo "ser" seguido de la preposición "de". Este verbo es irregular y debes memorizar su conjugación en presente.$$,
        'highlights', array[$$ser$$, $$soy de$$, $$eres de$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$SER (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$soy$$),
            jsonb_build_array($$tú$$, $$eres$$),
            jsonb_build_array($$él / ella / usted$$, $$es$$),
            jsonb_build_array($$nosotros / nosotras$$, $$somos$$),
            jsonb_build_array($$vosotros / vosotras$$, $$sois$$),
            jsonb_build_array($$ellos / ellas / ustedes$$, $$son$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$El verbo "ser" es irregular y se usa para el origen (ser de + país/ciudad), la nacionalidad, y las características permanentes. "Yo soy de Costa de Marfil" equivale a "I am from Côte d'Ivoire".$$),
        'example', jsonb_build_object('statement', $$Presenta tu origen: ¿De dónde eres tú?$$, 'solution', $$Yo soy de Costa de Marfil, de la ciudad de Abiyán.$$),
        'fixation', jsonb_build_object('question', $$Conjuga "ser" con "nosotros" y completa: Nosotros ___ de África.$$, 'solution', $$Nosotros somos de África.$$)
      ),
      jsonb_build_object(
        'heading', $$Los números del 0 al 20$$,
        'body', $$Los números son esenciales para hablar de la edad, la fecha o la cantidad de países. Aprende los números básicos antes de seguir explorando el mundo hispánico.$$,
        'highlights', array[$$cero$$, $$diez$$, $$veinte$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Número$$, $$Español$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$0$$, $$cero$$),
            jsonb_build_array($$1$$, $$uno$$),
            jsonb_build_array($$5$$, $$cinco$$),
            jsonb_build_array($$10$$, $$diez$$),
            jsonb_build_array($$15$$, $$quince$$),
            jsonb_build_array($$16$$, $$dieciséis$$),
            jsonb_build_array($$20$$, $$veinte$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Los números del 16 al 19 se forman con el prefijo "dieci-" más la unidad (dieciséis, diecisiete, dieciocho, diecinueve). Presta atención al acento escrito en "dieciséis".$$),
        'example', jsonb_build_object('statement', $$Escribe en letras: 14 países hispanohablantes en América.$$, 'solution', $$Catorce países hispanohablantes en América.$$),
        'fixation', jsonb_build_object('question', $$Escribe en letras el número 17.$$, 'solution', $$Diecisiete.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Para el Día de la Hispanidad en tu colegio, debes presentar oralmente el mundo hispánico a tus compañeros.$$,
      'questions', array[
        $$Cita tres países hispanohablantes y sus gentilicios.$$,
        $$Pronuncia y explica el sonido de la ñ y de la h en español.$$,
        $$Preséntate usando el verbo "ser" y di de dónde eres.$$,
        $$Da la edad de tu colegio en números, en español.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con el gentilicio correcto: Juan vive en Madrid. Es ___.$$,
      'hint', $$Madrid está en España; el gentilicio de España termina en -ol.$$,
      'expected', $$Juan es español.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga el verbo "ser" con "ellos": Ellos ___ de México.$$,
      'hint', $$La forma de "ser" con "ellos" es la misma que con "ustedes".$$,
      'expected', $$Ellos son de México.$$
    ),
    jsonb_build_object(
      'question', $$Escribe en letras el número 12.$$,
      'hint', $$Los números del 11 al 15 no siguen el patrón "dieci-".$$,
      'expected', $$Doce.$$
    ),
    jsonb_build_object(
      'question', $$Explica por qué la palabra "hola" no pronuncia su primera letra.$$,
      'hint', $$Piensa en la regla sobre la h en español.$$,
      'expected', $$Porque la h es muda en español, nunca se pronuncia.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-decouverte-monde-hispanique';
