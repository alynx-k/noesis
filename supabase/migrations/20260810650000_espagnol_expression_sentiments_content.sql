-- Espagnol 3ème, leçon 6/7 : L'expression des sentiments.
-- Même contexte que les leçons précédentes : ecole-ci.org redirige vers le
-- mur de connexion élève sans session accessible -- contenu de repli
-- rédigé à partir de connaissances générales sur un programme standard
-- d'espagnol LV2 débutant, cohérent avec le thème du titre officiel
-- ("L'expression des sentiments"). Formulations et exercices 100%
-- originaux, contenu pédagogique en espagnol (immersion), structure de
-- l'app en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Después de los exámenes, tu profesora pregunta a la clase cómo se siente cada uno. Debes expresar tus sentimientos y reaccionar a los sentimientos de tus compañeros.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: los sentimientos y ESTAR$$,
        'body', $$Para expresar cómo te sientes en un momento dado, usas el verbo "estar" seguido de un adjetivo de sentimiento.$$,
        'highlights', array[$$contento$$, $$triste$$, $$cansado$$, $$nervioso$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Masculino$$, $$Femenino$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$contento$$, $$contenta$$),
            jsonb_build_array($$triste$$, $$triste$$),
            jsonb_build_array($$cansado$$, $$cansada$$),
            jsonb_build_array($$nervioso$$, $$nerviosa$$),
            jsonb_build_array($$enfadado$$, $$enfadada$$),
            jsonb_build_array($$sorprendido$$, $$sorprendida$$),
            jsonb_build_array($$feliz$$, $$feliz$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Con "estar", el adjetivo concuerda en género y número con la persona: Estoy contento (chico) / Estoy contenta (chica). Los adjetivos en -e o -z, como "triste" o "feliz", no cambian según el género.$$),
        'example', jsonb_build_object('statement', $$Expresa cómo te sientes después de un examen difícil.$$, 'solution', $$Estoy un poco nervioso, pero también estoy contento porque ya terminé.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mis amigas ___ (estar) muy ___ (contento) porque ganaron el partido.$$, 'solution', $$Mis amigas están muy contentas porque ganaron el partido.$$)
      ),
      jsonb_build_object(
        'heading', $$Las expresiones con TENER$$,
        'body', $$Algunos sentimientos y sensaciones físicas se expresan con el verbo "tener" seguido de un sustantivo, no con "estar".$$,
        'highlights', array[$$tener miedo$$, $$tener hambre$$, $$tener sed$$, $$tener sueño$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tener miedo$$, $$avoir peur$$),
            jsonb_build_array($$tener hambre$$, $$avoir faim$$),
            jsonb_build_array($$tener sed$$, $$avoir soif$$),
            jsonb_build_array($$tener sueño$$, $$avoir sommeil$$),
            jsonb_build_array($$tener frío$$, $$avoir froid$$),
            jsonb_build_array($$tener calor$$, $$avoir chaud$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Estas expresiones usan "tener" + sustantivo, nunca "estar" ni "ser". Para intensificar, se usa "mucho/mucha" y no "muy": tengo mucho miedo (y no "muy miedo").$$),
        'example', jsonb_build_object('statement', $$Explica por qué quieres beber agua.$$, 'solution', $$Tengo mucha sed.$$),
        'fixation', jsonb_build_object('question', $$Completa con la expresión adecuada: Son las once de la noche y Kofi ___ (tener).$$, 'solution', $$Son las once de la noche y Kofi tiene sueño.$$)
      ),
      jsonb_build_object(
        'heading', $$Reaccionar a los sentimientos de otros$$,
        'body', $$Cuando un amigo te cuenta cómo se siente, es importante saber reaccionar con empatía, preguntando el motivo o mostrando comprensión.$$,
        'highlights', array[$$¿qué te pasa?$$, $$lo siento$$, $$¡ánimo!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué te pasa?$$, $$Qu'est-ce qui t'arrive ?$$),
            jsonb_build_array($$¿Por qué estás triste?$$, $$Pourquoi es-tu triste ?$$),
            jsonb_build_array($$Lo siento.$$, $$Je suis désolé(e).$$),
            jsonb_build_array($$¡Qué bien!$$, $$Quelle bonne nouvelle !$$),
            jsonb_build_array($$¡Ánimo!$$, $$Courage !$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Lo siento" se usa para expresar compasión o para disculparse; no lo confundas con la forma "siento" del verbo "sentir" (yo siento un dolor).$$),
        'example', jsonb_build_object('statement', $$Tu amigo dice: "Estoy triste, perdí mi cuaderno." Reacciona.$$, 'solution', $$Lo siento mucho. ¿Por qué no buscas en tu mochila?$$),
        'fixation', jsonb_build_object('question', $$Tu amiga te dice: "Tengo mucho miedo del examen." ¿Qué le dices para animarla?$$, 'solution', $$¡Ánimo! Vas a aprobar el examen.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu profesora pide a cada estudiante que exprese cómo se siente hoy y por qué, y que reaccione al sentimiento de un compañero.$$,
      'questions', array[
        $$Expresa cómo te sientes hoy, usando "estar" + adjetivo.$$,
        $$Usa una expresión con "tener" para describir una sensación física.$$,
        $$Explica por qué te sientes así.$$,
        $$Reacciona al sentimiento de un compañero que dice: "Estoy muy cansado."$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con el adjetivo en la forma correcta: Ana ___ (estar) muy (nervioso) ___ antes del examen.$$,
      'hint', $$"Nervioso" concuerda en femenino con Ana.$$,
      'expected', $$Ana está muy nerviosa antes del examen.$$
    ),
    jsonb_build_object(
      'question', $$Completa con la expresión adecuada con "tener": Después de correr diez kilómetros, Yao ___.$$,
      'hint', $$Piensa en una sensación física después de un esfuerzo, con "tener".$$,
      'expected', $$Después de correr diez kilómetros, Yao tiene mucha sed. (o: tiene mucho calor.)$$
    ),
    jsonb_build_object(
      'question', $$Traduce y usa en una frase: "avoir peur".$$,
      'hint', $$Se construye con "tener", no con "estar".$$,
      'expected', $$Tener miedo. Ejemplo: Tengo miedo de las arañas.$$
    ),
    jsonb_build_object(
      'question', $$Un amigo te dice: "Estoy triste porque perdí el partido." Reacciona con empatía.$$,
      'hint', $$Usa "Lo siento" o "¡Ánimo!".$$,
      'expected', $$Lo siento mucho. ¡Ánimo, ganarás el próximo partido!$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-expression-sentiments';
