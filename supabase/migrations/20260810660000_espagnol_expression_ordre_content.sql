-- Espagnol 3ème, leçon 7/7 : L'expression de l'ordre.
-- Même contexte que les leçons précédentes : ecole-ci.org redirige vers le
-- mur de connexion élève sans session accessible -- contenu de repli
-- rédigé à partir de connaissances générales sur un programme standard
-- d'espagnol LV2 débutant, cohérent avec le thème du titre officiel
-- ("L'expression de l'ordre"). Formulations et exercices 100% originaux,
-- contenu pédagogique en espagnol (immersion), structure de l'app en
-- français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Como delegado de la clase, debes dar instrucciones a tus compañeros para organizar la fiesta de fin de curso: qué hacer, en qué orden, y cómo comportarse.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: instrucciones y órdenes$$,
        'body', $$Para dar órdenes en español, primero necesitas conocer verbos de acción comunes que se usan en instrucciones.$$,
        'highlights', array[$$abrir$$, $$cerrar$$, $$escuchar$$, $$callarse$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verbo (infinitivo)$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$abrir$$, $$ouvrir$$),
            jsonb_build_array($$cerrar$$, $$fermer$$),
            jsonb_build_array($$escuchar$$, $$écouter$$),
            jsonb_build_array($$escribir$$, $$écrire$$),
            jsonb_build_array($$levantarse$$, $$se lever$$),
            jsonb_build_array($$sentarse$$, $$s'asseoir$$),
            jsonb_build_array($$callarse$$, $$se taire$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Estos verbos servirán de base para formar el imperativo, el modo verbal que se usa para dar órdenes en español.$$),
        'example', jsonb_build_object('statement', $$Da una instrucción simple en el aula.$$, 'solution', $$Escuchen con atención, por favor.$$),
        'fixation', jsonb_build_object('question', $$¿Qué verbo usarías para pedir silencio a la clase?$$, 'solution', $$Callarse (¡Cállense! / ¡Cállate!).$$)
      ),
      jsonb_build_object(
        'heading', $$El imperativo afirmativo con TÚ$$,
        'body', $$El imperativo con "tú" se forma, en los verbos regulares, igual que la tercera persona del singular del presente de indicativo.$$,
        'highlights', array[$$imperativo$$, $$¡habla!$$, $$¡escribe!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Infinitivo$$, $$Imperativo (tú)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$hablar$$, $$¡habla!$$),
            jsonb_build_array($$comer$$, $$¡come!$$),
            jsonb_build_array($$escribir$$, $$¡escribe!$$),
            jsonb_build_array($$cerrar$$, $$¡cierra!$$),
            jsonb_build_array($$venir$$, $$¡ven!$$),
            jsonb_build_array($$hacer$$, $$¡haz!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para los verbos regulares en -ar, -er, -ir, el imperativo afirmativo con "tú" es igual a la forma de "él/ella" en presente: habla, come, escribe. Algunos verbos son irregulares y deben memorizarse: ven (venir), haz (hacer), ve (ir), pon (poner), sal (salir), di (decir).$$),
        'example', jsonb_build_object('statement', $$Da la orden a un amigo de cerrar la puerta.$$, 'solution', $$¡Cierra la puerta, por favor!$$),
        'fixation', jsonb_build_object('question', $$Da la orden con "tú": (venir) aquí ahora mismo.$$, 'solution', $$¡Ven aquí ahora mismo!$$)
      ),
      jsonb_build_object(
        'heading', $$El imperativo afirmativo con USTED$$,
        'body', $$Con "usted" (forma formal), el imperativo se forma de manera diferente: se usa la vocal opuesta a la del infinitivo.$$,
        'highlights', array[$$¡hable!$$, $$¡coma!$$, $$¡escriba!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Infinitivo$$, $$Imperativo (usted)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$hablar$$, $$¡hable!$$),
            jsonb_build_array($$comer$$, $$¡coma!$$),
            jsonb_build_array($$escribir$$, $$¡escriba!$$),
            jsonb_build_array($$venir$$, $$¡venga!$$),
            jsonb_build_array($$cerrar$$, $$¡cierre!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para "usted", los verbos en -ar terminan en -e (hable), y los verbos en -er/-ir terminan en -a (coma, escriba). Las vocales se invierten respecto a la terminación del infinitivo.$$),
        'example', jsonb_build_object('statement', $$Pide formalmente a un adulto que hable más despacio.$$, 'solution', $$Hable más despacio, por favor.$$),
        'fixation', jsonb_build_object('question', $$Da la orden formal (usted) con el verbo "escribir": ___ su nombre aquí.$$, 'solution', $$Escriba su nombre aquí.$$)
      ),
      jsonb_build_object(
        'heading', $$Dar instrucciones en orden$$,
        'body', $$Para organizar una serie de instrucciones, se usan palabras que indican el orden de las acciones.$$,
        'highlights', array[$$primero$$, $$después$$, $$por último$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra de orden$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$primero$$, $$la primera acción$$),
            jsonb_build_array($$después$$, $$la acción siguiente$$),
            jsonb_build_array($$luego$$, $$también significa "después"$$),
            jsonb_build_array($$por último$$, $$la última acción$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Estas palabras se colocan generalmente al principio de la frase, seguidas de una coma, antes del verbo en imperativo: Primero, abran el libro.$$),
        'example', jsonb_build_object('statement', $$Da tres instrucciones en orden para empezar la clase.$$, 'solution', $$Primero, siéntense. Después, saquen el cuaderno. Por último, escuchen a la profesora.$$),
        'fixation', jsonb_build_object('question', $$Pon en orden estas instrucciones con "primero", "después" y "por último": cerrar la puerta / sentarse / abrir el cuaderno.$$, 'solution', $$Primero, cierra la puerta. Después, siéntate. Por último, abre el cuaderno.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Como delegado de la clase, debes organizar la fiesta de fin de curso dando instrucciones claras a tus compañeros, en orden.$$,
      'questions', array[
        $$Da una orden con "tú" a un compañero para preparar la fiesta.$$,
        $$Da una orden formal (usted) a un profesor invitado.$$,
        $$Organiza tres instrucciones usando "primero", "después" y "por último".$$,
        $$Pide silencio a la clase usando el imperativo.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Da la orden con "tú": (abrir) la ventana, por favor.$$,
      'hint', $$El imperativo regular con "tú" es igual a la forma de "él/ella" en presente.$$,
      'expected', $$¡Abre la ventana, por favor!$$
    ),
    jsonb_build_object(
      'question', $$Da la orden formal (usted) con el verbo "venir": ___ conmigo, por favor.$$,
      'hint', $$"Venir" es irregular en el imperativo: venga.$$,
      'expected', $$Venga conmigo, por favor.$$
    ),
    jsonb_build_object(
      'question', $$Transforma en imperativo (usted): "hablar más alto".$$,
      'hint', $$Los verbos en -ar terminan en -e con "usted".$$,
      'expected', $$Hable más alto.$$
    ),
    jsonb_build_object(
      'question', $$Ordena estas tres instrucciones con "primero", "después" y "por último": lavarse las manos / sentarse a la mesa / comer.$$,
      'hint', $$Usa las tres palabras de orden, una para cada instrucción.$$,
      'expected', $$Primero, lávate las manos. Después, siéntate a la mesa. Por último, come.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-expression-ordre';
