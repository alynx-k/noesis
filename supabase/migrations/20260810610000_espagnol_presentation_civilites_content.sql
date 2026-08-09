-- Espagnol 3ème, leçon 2/7 : La présentation des civilités.
-- Même contexte que la leçon 1 : ecole-ci.org a redirigé vers le mur de
-- connexion élève (/co/logineleve.php) dès la navigation, sans session
-- accessible -- contenu de repli rédigé à partir de connaissances
-- générales sur un programme standard d'espagnol LV2 débutant, cohérent
-- avec le thème du titre officiel ("La présentation des civilités").
-- Formulations et exercices 100% originaux, contenu pédagogique en
-- espagnol (immersion), structure de l'app en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Es tu primer día en un intercambio escolar con un colegio de España. Debes saludar a tus nuevos compañeros y profesores, presentarte, y usar las fórmulas de cortesía adecuadas según el momento del día.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: los saludos$$,
        'body', $$En español, el saludo cambia según la hora del día. Aprende las fórmulas más comunes para saludar y para despedirte.$$,
        'highlights', array[$$buenos días$$, $$buenas tardes$$, $$buenas noches$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Hola$$, $$saludo informal, a cualquier hora$$),
            jsonb_build_array($$Buenos días$$, $$por la mañana, hasta el mediodía$$),
            jsonb_build_array($$Buenas tardes$$, $$desde el mediodía hasta el anochecer$$),
            jsonb_build_array($$Buenas noches$$, $$por la noche; también para despedirse$$),
            jsonb_build_array($$Adiós$$, $$para despedirse$$),
            jsonb_build_array($$Hasta luego$$, $$despedida: nos vemos pronto$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Buenos días, buenas tardes y buenas noches siempre se dicen en plural. "Buenas noches" sirve tanto para saludar como para despedirse por la noche.$$),
        'example', jsonb_build_object('statement', $$Son las nueve de la mañana. Saluda a tu profesor.$$, 'solution', $$Buenos días, profesor.$$),
        'fixation', jsonb_build_object('question', $$Son las ocho de la noche. ¿Qué saludo usas?$$, 'solution', $$Buenas noches.$$)
      ),
      jsonb_build_object(
        'heading', $$Presentarse: el nombre y la edad$$,
        'body', $$Para presentarte, usas el verbo "llamarse" para decir tu nombre, y el verbo "tener" para dar tu edad. Ambos son verbos especiales que debes conocer bien.$$,
        'highlights', array[$$me llamo$$, $$tengo$$, $$¿cómo te llamas?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pregunta$$, $$Respuesta$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Cómo te llamas?$$, $$Me llamo + nombre$$),
            jsonb_build_array($$¿Cuántos años tienes?$$, $$Tengo + número + años$$),
            jsonb_build_array($$¿Cómo estás?$$, $$Estoy bien, gracias$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Llamarse" es un verbo reflexivo: me llamo, te llamas, se llama, nos llamamos, os llamáis, se llaman. Para la edad, no se usa "ser" sino "tener": "tengo catorce años" (littéralement "j'ai quatorze ans").$$),
        'example', jsonb_build_object('statement', $$Preséntate: di tu nombre y tu edad.$$, 'solution', $$Me llamo Aya y tengo catorce años.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi amigo ___ (llamarse) Kofi y ___ (tener) quince años.$$, 'solution', $$Mi amigo se llama Kofi y tiene quince años.$$)
      ),
      jsonb_build_object(
        'heading', $$Fórmulas de cortesía$$,
        'body', $$La cortesía es muy importante en la cultura hispánica. Aprende a pedir las cosas con educación, a agradecer, y a responder a un agradecimiento.$$,
        'highlights', array[$$por favor$$, $$gracias$$, $$de nada$$, $$mucho gusto$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Por favor$$, $$s'il te plaît$$),
            jsonb_build_array($$Gracias$$, $$merci$$),
            jsonb_build_array($$De nada$$, $$de rien$$),
            jsonb_build_array($$Perdón$$, $$pardon, excuse-moi$$),
            jsonb_build_array($$Mucho gusto$$, $$enchanté(e), à la présentation$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Mucho gusto" se usa cuando conoces a alguien por primera vez. Se puede responder "Igualmente" (de même) o "El gusto es mío" (le plaisir est pour moi).$$),
        'example', jsonb_build_object('statement', $$Te presentan a un nuevo compañero. ¿Qué dices?$$, 'solution', $$Mucho gusto, me llamo Yao. -- Igualmente.$$),
        'fixation', jsonb_build_object('question', $$Alguien te da las gracias. ¿Qué respondes?$$, 'solution', $$De nada.$$)
      ),
      jsonb_build_object(
        'heading', $$Tú y usted: el registro formal e informal$$,
        'body', $$En español existen dos formas de decir "tú": una informal ("tú") y una formal de respeto ("usted"), que se usa con profesores, adultos desconocidos o personas mayores.$$,
        'highlights', array[$$tú$$, $$usted$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Situación$$, $$Forma$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Con un compañero de clase$$, $$tú$$),
            jsonb_build_array($$Con un profesor$$, $$usted$$),
            jsonb_build_array($$Con un adulto desconocido$$, $$usted$$),
            jsonb_build_array($$Con un amigo o familiar$$, $$tú$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Con "usted", el verbo se conjuga como con "él/ella": ¿Cómo está usted? (formal) frente a ¿Cómo estás tú? (informal).$$),
        'example', jsonb_build_object('statement', $$Saluda a tu director de colegio, de forma formal.$$, 'solution', $$Buenos días, ¿cómo está usted?$$),
        'fixation', jsonb_build_object('question', $$Transforma en formal: "¿Cómo te llamas?"$$, 'solution', $$¿Cómo se llama usted?$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$El primer día en tu colegio de intercambio en España, debes saludar a tu profesora, presentarte a un nuevo compañero, y agradecer a alguien que te ayuda.$$,
      'questions', array[
        $$Saluda a tu profesora por la mañana, de forma formal.$$,
        $$Preséntate a un nuevo compañero: di tu nombre y tu edad.$$,
        $$Usa "mucho gusto" y responde a esta fórmula.$$,
        $$Agradece a un compañero que te ayuda, y responde si él te da las gracias.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Son las tres de la tarde. Saluda formalmente a tu profesor.$$,
      'hint', $$Usa la fórmula de saludo que corresponde a la tarde.$$,
      'expected', $$Buenas tardes, profesor.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga "llamarse" con "yo" y completa: ___ Fatou.$$,
      'hint', $$"Llamarse" es reflexivo: me + llamo.$$,
      'expected', $$Me llamo Fatou.$$
    ),
    jsonb_build_object(
      'question', $$Transforma en formal (usted): "¿Cómo estás?"$$,
      'hint', $$Con "usted" el verbo se conjuga como con "él/ella".$$,
      'expected', $$¿Cómo está usted?$$
    ),
    jsonb_build_object(
      'question', $$Alguien te dice "Mucho gusto". ¿Qué respondes?$$,
      'hint', $$Existen dos respuestas posibles a esta fórmula.$$,
      'expected', $$Igualmente. (o: El gusto es mío.)$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-presentation-civilites';
