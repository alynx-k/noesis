-- Espagnol 3ème, leçon 5/7 : L'expression des goûts et des préférences.
-- Même contexte que les leçons précédentes : ecole-ci.org redirige vers le
-- mur de connexion élève sans session accessible -- contenu de repli
-- rédigé à partir de connaissances générales sur un programme standard
-- d'espagnol LV2 débutant, cohérent avec le thème du titre officiel
-- ("L'expression des goûts et des préférences"). Formulations et exercices
-- 100% originaux, contenu pédagogique en espagnol (immersion), structure
-- de l'app en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tu nuevo amigo español te pregunta sobre tus gustos: la comida, la música, el deporte. Debes expresar lo que te gusta, lo que prefieres, y lo que no te gusta, usando el verbo "gustar".$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$El verbo GUSTAR$$,
        'body', $$El verbo "gustar" funciona de manera diferente a los verbos franceses: no se conjuga según la persona que gusta, sino según la cosa que gusta a alguien.$$,
        'highlights', array[$$me gusta$$, $$me gustan$$, $$te gusta$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$Gustar$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$(a mí)$$, $$me gusta / me gustan$$),
            jsonb_build_array($$(a ti)$$, $$te gusta / te gustan$$),
            jsonb_build_array($$(a él, ella, usted)$$, $$le gusta / le gustan$$),
            jsonb_build_array($$(a nosotros)$$, $$nos gusta / nos gustan$$),
            jsonb_build_array($$(a vosotros)$$, $$os gusta / os gustan$$),
            jsonb_build_array($$(a ellos, ellas, ustedes)$$, $$les gusta / les gustan$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Se usa "gusta" cuando lo que gusta es singular o un infinitivo (Me gusta el fútbol / Me gusta bailar), y "gustan" cuando es plural (Me gustan las frutas). Literalmente "me gusta" significa "ça me plaît", no "j'aime".$$),
        'example', jsonb_build_object('statement', $$Expresa que te gusta la música.$$, 'solution', $$Me gusta mucho la música.$$),
        'fixation', jsonb_build_object('question', $$Completa: A mi hermana ___ (gustar) los libros de aventuras.$$, 'solution', $$A mi hermana le gustan los libros de aventuras.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulario: la comida y las actividades$$,
        'body', $$Para hablar de tus gustos, necesitas vocabulario sobre la comida y las actividades de tiempo libre.$$,
        'highlights', array[$$el arroz$$, $$el fútbol$$, $$bailar$$, $$nadar$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$el arroz$$, $$le riz$$),
            jsonb_build_array($$la fruta$$, $$le fruit$$),
            jsonb_build_array($$el pescado$$, $$le poisson$$),
            jsonb_build_array($$el fútbol$$, $$le football$$),
            jsonb_build_array($$bailar$$, $$danser$$),
            jsonb_build_array($$nadar$$, $$nager$$),
            jsonb_build_array($$leer$$, $$lire$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Cuando lo que te gusta es una actividad (un verbo), este verbo va siempre en infinitivo y "gustar" se queda en singular: Me gusta bailar y cantar.$$),
        'example', jsonb_build_object('statement', $$Di dos actividades que te gustan.$$, 'solution', $$Me gusta nadar y también me gusta leer.$$),
        'fixation', jsonb_build_object('question', $$Completa: A nosotros ___ (gustar) jugar al fútbol los fines de semana.$$, 'solution', $$A nosotros nos gusta jugar al fútbol los fines de semana.$$)
      ),
      jsonb_build_object(
        'heading', $$PREFERIR y ENCANTAR: matizar tus gustos$$,
        'body', $$Además de "gustar", puedes usar "preferir" para comparar dos cosas, y "encantar" para expresar un gusto muy fuerte.$$,
        'highlights', array[$$preferir$$, $$encantar$$, $$prefiero$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$PREFERIR (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$prefiero$$),
            jsonb_build_array($$tú$$, $$prefieres$$),
            jsonb_build_array($$él / ella / usted$$, $$prefiere$$),
            jsonb_build_array($$nosotros / nosotras$$, $$preferimos$$),
            jsonb_build_array($$vosotros / vosotras$$, $$preferís$$),
            jsonb_build_array($$ellos / ellas / ustedes$$, $$prefieren$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Preferir" es un verbo irregular con diptongación e→ie en todas las personas excepto "nosotros" y "vosotros": prefiero, prefieres, prefiere... "Encantar" funciona como "gustar" pero expresa un gusto más intenso: Me encanta el chocolate equivale a "j'adore le chocolat".$$),
        'example', jsonb_build_object('statement', $$Compara: ¿prefieres el fútbol o el baloncesto?$$, 'solution', $$Prefiero el fútbol, pero también me gusta el baloncesto.$$),
        'fixation', jsonb_build_object('question', $$Completa con "encantar": A mí ___ las vacaciones.$$, 'solution', $$A mí me encantan las vacaciones.$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar que no te gusta algo$$,
        'body', $$También es útil saber decir que algo no te gusta, usando la negación "no" antes del pronombre, o la palabra "tampoco" para estar de acuerdo con una opinión negativa.$$,
        'highlights', array[$$no me gusta$$, $$no me gusta nada$$, $$tampoco$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$No me gusta...$$, $$Je n'aime pas...$$),
            jsonb_build_array($$No me gusta nada...$$, $$Je n'aime pas du tout...$$),
            jsonb_build_array($$A mí tampoco.$$, $$Moi non plus.$$),
            jsonb_build_array($$A mí también.$$, $$Moi aussi.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para reforzar una negación se añade "nada" después de "gusta": No me gusta nada el pescado. Para estar de acuerdo con alguien que dice algo negativo, se usa "tampoco", no "también".$$),
        'example', jsonb_build_object('statement', $$Tu amigo dice: "No me gusta el invierno." Estás de acuerdo.$$, 'solution', $$A mí tampoco me gusta el invierno.$$),
        'fixation', jsonb_build_object('question', $$Completa: A Kofi no le gustan las verduras y a mí ___.$$, 'solution', $$A Kofi no le gustan las verduras y a mí tampoco.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu amigo español te pregunta por correo sobre tus gustos: la comida, la música, el deporte, y quiere saber si estás de acuerdo con sus propias preferencias.$$,
      'questions', array[
        $$Di qué comida te gusta y qué comida no te gusta.$$,
        $$Usa "preferir" para comparar dos actividades.$$,
        $$Usa "encantar" para expresar un gusto muy fuerte.$$,
        $$Reacciona con "a mí también" o "a mí tampoco" a esta frase: "Me encanta el fútbol."$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con la forma correcta de "gustar": A mí ___ las manzanas.$$,
      'hint', $$"Manzanas" es plural, así que el verbo va en plural.$$,
      'expected', $$A mí me gustan las manzanas.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "preferir" con "ella": Ella ___ el té al café.$$,
      'hint', $$"Preferir" cambia la e en ie, excepto con nosotros/vosotros.$$,
      'expected', $$Ella prefiere el té al café.$$
    ),
    jsonb_build_object(
      'question', $$Completa con "encantar": A los niños ___ los dulces.$$,
      'hint', $$"Dulces" es plural.$$,
      'expected', $$A los niños les encantan los dulces.$$
    ),
    jsonb_build_object(
      'question', $$Reacciona con "tampoco" a esta frase: "No me gusta madrugar."$$,
      'hint', $$"Tampoco" se usa para estar de acuerdo con una negación.$$,
      'expected', $$A mí tampoco me gusta madrugar.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-expression-gouts-preferences';
