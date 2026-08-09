-- Espagnol 4ème, leçon 5/7 : L'expression des goûts et des préférences.
-- ecole-ci.org est maintenant accessible : ce contenu remplace le repli
-- précédent et s'appuie sur les fiches réelles du Collège Numérique
-- (coll.ecole-ci.org, catégorie Espagnol 4ème) pour la compétence "Traiter
-- une situation relative à l'expression des goûts et des préférences" --
-- Leçon 5 Fiche 1 (Demander les goûts et préférences : ¿qué te gusta?,
-- ¿te interesa...?), Fiche 2 (Exprimer ses goûts : gustar, encantar,
-- interesar, agradar, apetecer), Fiche 3 (Demander à quelqu'un ses
-- préférences : ¿qué prefieres?, ¿cuál es tu favorito?) et Fiche 4
-- (Exprimer ses préférences : preferir, optar por, escoger). Formulations,
-- exemples et exercices 100% originaux (paraphrase, jamais de copie des
-- phrases des fiches sources) ; contenu pédagogique en espagnol (immersion
-- linguistique), seule la structure de l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un canal de YouTube hispanohablante te invita a grabar un vídeo con tus compañeros: debes preguntarles sus gustos, expresar los tuyos con varios verbos, preguntarles su preferencia entre varias opciones, y decir cuál es la tuya.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Preguntar por los gustos de alguien$$,
        'body', $$Antes de expresar tus propios gustos, es útil saber preguntar por los de otra persona, usando distintos verbos según lo que quieres saber.$$,
        'highlights', array[$$¿qué te gusta?$$, $$¿qué te encanta?$$, $$¿te interesa...?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pregunta$$, $$Verbo usado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué te gusta?$$, $$gustar$$),
            jsonb_build_array($$¿Qué te encanta?$$, $$encantar$$),
            jsonb_build_array($$¿Te interesan las lenguas?$$, $$interesar$$),
            jsonb_build_array($$¿Cuál es tu gusto sobre la música?$$, $$el gusto (sustantivo)$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Estas preguntas usan el mismo tipo de construcción que "gustar": pronombre (te, le) + verbo + sujeto real. Con "usted" se dice "¿qué le gusta?" en vez de "¿qué te gusta?". "El gusto" también existe como sustantivo: ¿cuál es tu gusto en la música?$$),
        'example', jsonb_build_object('statement', $$Pregunta a un invitado si le interesan los deportes.$$, 'solution', $$¿Te interesan los deportes?$$),
        'fixation', jsonb_build_object('question', $$Transforma en pregunta formal: "¿Qué te encanta hacer los fines de semana?"$$, 'solution', $$¿Qué le encanta hacer los fines de semana?$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar los gustos: verbos como GUSTAR$$,
        'body', $$Existen varios verbos que se construyen igual que "gustar" (pronombre + verbo en singular o plural según lo que sigue), y que te permiten variar la manera de hablar de tus gustos.$$,
        'highlights', array[$$gustar$$, $$encantar$$, $$interesar$$, $$agradar$$, $$apetecer$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verbo$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$gustar$$, $$Me gusta la música latina.$$),
            jsonb_build_array($$encantar$$, $$Le encanta el fútbol.$$),
            jsonb_build_array($$interesar$$, $$Nos interesan los idiomas.$$),
            jsonb_build_array($$apetecer$$, $$Hoy no me apetece salir.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Todos estos verbos concuerdan con lo que sigue, no con la persona: me gusta el cine (singular), me gustan las películas (plural). "Apetecer" se usa a menudo con un infinitivo: me apetece descansar. "Agradar" es un sinónimo más formal de "gustar".$$),
        'example', jsonb_build_object('statement', $$Expresa que te interesan mucho las culturas hispánicas.$$, 'solution', $$Me interesan mucho las culturas hispánicas.$$),
        'fixation', jsonb_build_object('question', $$Completa: A mi amiga no ___ (apetecer) grabar el vídeo hoy, prefiere hacerlo mañana.$$, 'solution', $$A mi amiga no le apetece grabar el vídeo hoy, prefiere hacerlo mañana.$$)
      ),
      jsonb_build_object(
        'heading', $$Preguntar por las preferencias de alguien$$,
        'body', $$Cuando hay varias opciones posibles, ya no basta con preguntar por un gusto general: necesitas preguntar cuál es la preferida entre varias.$$,
        'highlights', array[$$¿qué prefieres?$$, $$¿cuál es tu favorito?$$, $$¿qué eliges?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pregunta$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué prefieres?$$, $$elegir entre dos o más opciones$$),
            jsonb_build_array($$¿Cuál es tu favorito/a?$$, $$identificar el elemento preferido$$),
            jsonb_build_array($$¿Qué te gusta más?$$, $$comparar dos gustos$$),
            jsonb_build_array($$¿Qué eliges?$$, $$pedir una decisión$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Favorito/a" concuerda en género con el sustantivo al que se refiere: mi color favorito, mi canción favorita. "¿Cuál?" se usa para elegir dentro de un conjunto ya conocido, mientras que "¿qué?" es más general.$$),
        'example', jsonb_build_object('statement', $$Pregunta a un compañero cuál es su plato favorito.$$, 'solution', $$¿Cuál es tu plato favorito?$$),
        'fixation', jsonb_build_object('question', $$Completa: Entre el fútbol y el baloncesto, ¿qué deporte ___ (preferir, tú)?$$, 'solution', $$Entre el fútbol y el baloncesto, ¿qué deporte prefieres?$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar las preferencias: PREFERIR, optar por, escoger$$,
        'body', $$Para responder y expresar tu preferencia con precisión, dispones del verbo "preferir" y de otras expresiones equivalentes que enriquecen tu vídeo.$$,
        'highlights', array[$$prefiero$$, $$opto por$$, $$escojo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$PREFERIR (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$prefiero$$),
            jsonb_build_array($$tú$$, $$prefieres$$),
            jsonb_build_array($$nosotros$$, $$preferimos$$),
            jsonb_build_array($$ellos$$, $$prefieren$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Preferir" es irregular: la "e" de la raíz cambia en "ie" en todas las personas excepto "nosotros" y "vosotros" (prefiero, prefieres, preferimos). "Optar por" siempre lleva la preposición "por": opto por el español. "Escoger" y "elegir" son sinónimos regulares de "preferir" en este contexto.$$),
        'example', jsonb_build_object('statement', $$Expresa tu preferencia entre el cine y la música.$$, 'solution', $$Entre el cine y la música, prefiero la música.$$),
        'fixation', jsonb_build_object('question', $$Completa: Nosotros ___ (optar por) grabar el vídeo el sábado en vez del domingo.$$, 'solution', $$Nosotros optamos por grabar el vídeo el sábado en vez del domingo.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En tu vídeo para el canal de YouTube, debes preguntar a un compañero sus gustos, expresar los tuyos con un verbo variado, preguntar su preferencia entre dos opciones, y expresar la tuya con "preferir" u otra expresión equivalente.$$,
      'questions', array[
        $$Pregunta a alguien qué le gusta o qué le interesa.$$,
        $$Expresa un gusto tuyo usando un verbo como "encantar" o "apetecer".$$,
        $$Pregunta a alguien cuál es su favorito/a entre varias opciones.$$,
        $$Expresa tu preferencia usando "preferir" u "optar por".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: A mi hermano ___ (interesar) mucho la cultura hispánica.$$,
      'hint', $$"Interesar" se construye como "gustar".$$,
      'expected', $$A mi hermano le interesa mucho la cultura hispánica.$$
    ),
    jsonb_build_object(
      'question', $$Completa: A nosotros nos ___ (encantar) grabar vídeos para el canal.$$,
      'hint', $$"Encantar" concuerda con lo que sigue: aquí es un infinitivo, singular.$$,
      'expected', $$A nosotros nos encanta grabar vídeos para el canal.$$
    ),
    jsonb_build_object(
      'question', $$Transforma en pregunta de preferencia: "¿Te gusta el chocolate?" (entre chocolate y vainilla)$$,
      'hint', $$Usa "preferir" o "gustar más" para comparar dos opciones.$$,
      'expected', $$Entre el chocolate y la vainilla, ¿qué prefieres?$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "preferir" con "ella": Entre el español y el inglés, ella ___ el español.$$,
      'hint', $$"Preferir" cambia la e en ie, excepto con "nosotros/vosotros".$$,
      'expected', $$Entre el español y el inglés, ella prefiere el español.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-gouts-preferences';
