-- Espagnol 4ème, leçon 2/7 : La présentation des civilités.
-- ecole-ci.org est maintenant accessible : ce contenu remplace le repli
-- précédent et s'appuie sur les fiches réelles du Collège Numérique
-- (coll.ecole-ci.org, catégorie Espagnol 4ème) pour la compétence "Traiter
-- une situation relative à l'échange de civilités" -- Leçon 2 Fiche 1
-- (Saluer : formules selon le moment de la journée), Fiche 2 (Se présenter
-- / présenter quelqu'un : llamarse/ser, encantado/a, despedirse), Fiche 3
-- (Inviter quelqu'un : invitar/rehusar) et Fiche 4 (Féliciter/Remercier :
-- felicitar, agradecer). Formulations, exemples et exercices 100%
-- originaux (paraphrase, jamais de copie des phrases des fiches sources) ;
-- contenu pédagogique en espagnol (immersion linguistique), seule la
-- structure de l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Una delegación de estudiantes españoles visita tu colegio durante una semana. Como responsable de la bienvenida, debes saludarles según el momento del día, presentarles a otros compañeros, invitarles a actividades y felicitarles o agradecerles cuando corresponda.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Saludar según el momento del día$$,
        'body', $$El primer gesto de cortesía es saludar correctamente. En español, la fórmula de saludo cambia según la hora, salvo "hola", que sirve en cualquier momento entre personas conocidas.$$,
        'highlights', array[$$buenos días$$, $$buenas tardes$$, $$buenas noches$$, $$hola$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Momento del día$$, $$Fórmula$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$por la mañana$$, $$¡Buenos días!$$),
            jsonb_build_array($$por la tarde$$, $$¡Buenas tardes!$$),
            jsonb_build_array($$por la noche$$, $$¡Buenas noches!$$),
            jsonb_build_array($$en cualquier momento (informal)$$, $$¡Hola!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Buenos días", "buenas tardes" y "buenas noches" van siempre en plural, aunque saludes a una sola persona. "Hola" se puede combinar con las otras fórmulas: "¡Hola, buenos días!". Para preguntar cómo está alguien, se añade "¿Qué tal estás?" o, con cortesía, "¿Qué tal está usted?".$$),
        'example', jsonb_build_object('statement', $$Saluda a tu director a las tres de la tarde.$$, 'solution', $$¡Buenas tardes, señor director!$$),
        'fixation', jsonb_build_object('question', $$Completa: Son las ocho de la mañana, saludas a tu profesor diciendo ___.$$, 'solution', $$Son las ocho de la mañana, saludas a tu profesor diciendo "¡Buenos días!".$$)
      ),
      jsonb_build_object(
        'heading', $$Presentarse y presentar a otra persona$$,
        'body', $$Para presentarte a ti mismo usas "llamarse", pero para presentar a un tercero necesitas otras fórmulas con "ser", y saber responder con cortesía a una presentación.$$,
        'highlights', array[$$me llamo$$, $$éste es / ésta es$$, $$encantado / encantada$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fórmula$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Me llamo...$$, $$presentarse uno mismo$$),
            jsonb_build_array($$Éste es mi amigo Kofi.$$, $$presentar a un chico$$),
            jsonb_build_array($$Ésta es mi amiga Aya.$$, $$presentar a una chica$$),
            jsonb_build_array($$Encantado / Encantada$$, $$responder a una presentación$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para presentarse y presentar a alguien se usan sobre todo los verbos "llamarse" y "ser": me llamo Aya / éste es mi amigo. "Encantado" concuerda en género con quien habla: un chico dice "encantado", una chica dice "encantada". Al final de un encuentro, se usa "despedirse": nos despedimos diciendo adiós.$$),
        'example', jsonb_build_object('statement', $$Presenta a tu amiga Fatou a un compañero español.$$, 'solution', $$Ésta es mi amiga Fatou.$$),
        'fixation', jsonb_build_object('question', $$Completa el diálogo: A: Éste es mi hermano Yao. B: ___.$$, 'solution', $$A: Éste es mi hermano Yao. B: Encantado.$$)
      ),
      jsonb_build_object(
        'heading', $$Invitar a alguien y responder a una invitación$$,
        'body', $$Recibir a invitados también significa saber invitarles a actividades, y entender cómo aceptar o rehusar una invitación con cortesía.$$,
        'highlights', array[$$te invito$$, $$¿quieres venir?$$, $$no puedo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Para invitar$$, $$Para responder$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Te invito a...$$, $$Sí, gracias, ¡vale!$$),
            jsonb_build_array($$¿Puedes venir?$$, $$Claro que sí.$$),
            jsonb_build_array($$¿Quieres ver la tele conmigo?$$, $$Lo siento, no puedo, estoy ocupado.$$),
            jsonb_build_array($$¿Venís a la fiesta?$$, $$Ahora no, gracias.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para invitar se usa sobre todo el verbo "invitar" (te invito a...) o una pregunta con "poder" o "querer" (¿puedes venir?, ¿quieres...?). Para rehusar una invitación con cortesía, se explica el motivo: "no puedo, estoy ocupado" es más educado que un simple "no".$$),
        'example', jsonb_build_object('statement', $$Invita a un compañero español a tu casa el sábado.$$, 'solution', $$Te invito a mi casa el sábado, ¿puedes venir?$$),
        'fixation', jsonb_build_object('question', $$Rehúsa cortésmente esta invitación: "¿Vienes al cine esta tarde?"$$, 'solution', $$Lo siento, no puedo, esta tarde estoy ocupado.$$)
      ),
      jsonb_build_object(
        'heading', $$Felicitar y dar las gracias$$,
        'body', $$Para cerrar bien la semana de intercambio, necesitas felicitar a alguien por un logro y dar las gracias correctamente, incluyendo la conjugación irregular de "agradecer".$$,
        'highlights', array[$$te felicito$$, $$felicidades$$, $$te agradezco$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronombre$$, $$AGRADECER (presente)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$yo$$, $$agradezco$$),
            jsonb_build_array($$tú$$, $$agradeces$$),
            jsonb_build_array($$nosotros$$, $$agradecemos$$),
            jsonb_build_array($$vosotros$$, $$agradecéis$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para felicitar se usa "felicidades", "te felicito" o, para un cumpleaños, "feliz cumpleaños". Para dar las gracias se usa "gracias", "muchas gracias" o el verbo "agradecer", irregular en la primera persona del singular (yo agradezco, con "zc" como "conocer").$$),
        'example', jsonb_build_object('statement', $$Felicita a un compañero por su buena nota en español.$$, 'solution', $$¡Te felicito por tu buena nota en español!$$),
        'fixation', jsonb_build_object('question', $$Conjuga "agradecer" con "yo": ___ a mis profesores por su ayuda.$$, 'solution', $$Agradezco a mis profesores por su ayuda.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Durante la visita de los estudiantes españoles, debes saludarles según la hora, presentar a un compañero, invitarles a una actividad del colegio, y felicitar o agradecer a alguien del grupo.$$,
      'questions', array[
        $$Saluda a un invitado según el momento del día indicado.$$,
        $$Presenta a un compañero usando "éste es" o "ésta es".$$,
        $$Invita a un estudiante español a una actividad y da una respuesta.$$,
        $$Felicita o da las gracias a alguien del grupo.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: Son las nueve de la noche, saludas a un invitado diciendo ___.$$,
      'hint', $$Usa la fórmula de saludo correspondiente a la noche.$$,
      'expected', $$Son las nueve de la noche, saludas a un invitado diciendo "¡Buenas noches!".$$
    ),
    jsonb_build_object(
      'question', $$Completa: ___ (llamarse, yo) Kouadio, y ___ (ser) mi hermana Adjoba.$$,
      'hint', $$Usa "llamarse" para presentarte y "ser" para presentar a otra persona.$$,
      'expected', $$Me llamo Kouadio, y ésta es mi hermana Adjoba.$$
    ),
    jsonb_build_object(
      'question', $$Responde cortésmente a esta invitación: "¿Puedes venir a mi cumpleaños?" (no puedes ir)$$,
      'hint', $$Da una excusa educada en vez de decir simplemente "no".$$,
      'expected', $$Lo siento, no puedo venir, estoy ocupado ese día.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "agradecer" con "nosotros": ___ a la profesora por su paciencia.$$,
      'hint', $$"Agradecer" con "nosotros" es regular en esta persona.$$,
      'expected', $$Agradecemos a la profesora por su paciencia.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-presentation-civilites';
