-- Espagnol 3ème, leçon 4/7 : L'expression d'opinion.
-- Même contexte que les leçons précédentes : ecole-ci.org redirige vers le
-- mur de connexion élève sans session accessible -- contenu de repli
-- rédigé à partir de connaissances générales sur un programme standard
-- d'espagnol LV2 débutant, cohérent avec le thème du titre officiel
-- ("L'expression d'opinion"). Formulations et exercices 100% originaux,
-- contenu pédagogique en espagnol (immersion), structure de l'app en
-- français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En la clase de español, tu profesora organiza un debate sobre el uso del teléfono móvil en el colegio. Debes dar tu opinión, estar de acuerdo o en desacuerdo, y justificarla.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: dar tu opinión$$,
        'body', $$Para expresar lo que piensas en español, existen varias fórmulas útiles que se usan al principio de la frase.$$,
        'highlights', array[$$creo que$$, $$pienso que$$, $$en mi opinión$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Creo que...$$, $$Je crois que...$$),
            jsonb_build_array($$Pienso que...$$, $$Je pense que...$$),
            jsonb_build_array($$En mi opinión...$$, $$À mon avis...$$),
            jsonb_build_array($$Para mí...$$, $$Pour moi...$$),
            jsonb_build_array($$Me parece que...$$, $$Il me semble que...$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Después de "creo que" y "pienso que", el verbo va normalmente en indicativo en la frase afirmativa: Creo que es importante. En la forma negativa ("no creo que"), el verbo va en subjuntivo.$$),
        'example', jsonb_build_object('statement', $$Da tu opinión sobre el deporte en el colegio.$$, 'solution', $$Creo que el deporte es muy importante para la salud.$$),
        'fixation', jsonb_build_object('question', $$Completa con una expresión de opinión: ___ el español es una lengua útil.$$, 'solution', $$En mi opinión, el español es una lengua útil.$$)
      ),
      jsonb_build_object(
        'heading', $$Estar de acuerdo o en desacuerdo$$,
        'body', $$En un debate, también necesitas decir si estás de acuerdo o no con la opinión de otra persona.$$,
        'highlights', array[$$estoy de acuerdo$$, $$no estoy de acuerdo$$, $$tienes razón$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Significado$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Estoy de acuerdo.$$, $$Je suis d'accord.$$),
            jsonb_build_array($$No estoy de acuerdo.$$, $$Je ne suis pas d'accord.$$),
            jsonb_build_array($$Tienes razón.$$, $$Tu as raison.$$),
            jsonb_build_array($$Al contrario...$$, $$Au contraire...$$),
            jsonb_build_array($$Depende.$$, $$Ça dépend.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Estar de acuerdo" se construye así: estoy de acuerdo con + persona/idea. Ejemplo: Estoy de acuerdo con mi profesora.$$),
        'example', jsonb_build_object('statement', $$Tu compañero dice: "El móvil es peligroso en el colegio." Da tu opinión, de acuerdo o en desacuerdo.$$, 'solution', $$No estoy de acuerdo. Creo que el móvil puede ser útil si se usa con moderación.$$),
        'fixation', jsonb_build_object('question', $$Responde con "estoy de acuerdo" a esta afirmación: "Es importante estudiar todos los días."$$, 'solution', $$Estoy de acuerdo, es importante estudiar todos los días.$$)
      ),
      jsonb_build_object(
        'heading', $$Los adjetivos calificativos y su concordancia$$,
        'body', $$Para justificar tu opinión, necesitas adjetivos. En español, los adjetivos concuerdan en género y número con el sustantivo que describen.$$,
        'highlights', array[$$importante$$, $$útil$$, $$peligroso$$, $$interesante$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Masculino$$, $$Femenino$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$importante$$, $$importante$$),
            jsonb_build_array($$útil$$, $$útil$$),
            jsonb_build_array($$peligroso$$, $$peligrosa$$),
            jsonb_build_array($$interesante$$, $$interesante$$),
            jsonb_build_array($$bueno$$, $$buena$$),
            jsonb_build_array($$malo$$, $$mala$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Los adjetivos que terminan en -o cambian a -a en femenino (peligroso/peligrosa). Los que terminan en -e o en consonante (como "importante" o "útil") no cambian según el género; solo añaden -s o -es para el plural.$$),
        'example', jsonb_build_object('statement', $$Describe la lengua española con un adjetivo.$$, 'solution', $$La lengua española es muy interesante.$$),
        'fixation', jsonb_build_object('question', $$Completa con el adjetivo correcto: Esta película es muy (bueno) ___.$$, 'solution', $$Esta película es muy buena.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En el debate sobre el móvil en el colegio, debes dar tu opinión personal, reaccionar a la opinión de un compañero, y justificarla con un adjetivo.$$,
      'questions', array[
        $$Da tu opinión sobre el uso del móvil en el colegio.$$,
        $$Reacciona a esta opinión: "El móvil ayuda a estudiar." (de acuerdo o en desacuerdo)$$,
        $$Justifica tu opinión usando un adjetivo calificativo.$$,
        $$Pregunta la opinión de un compañero sobre el mismo tema.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con una expresión de opinión: ___ el deporte es bueno para la salud.$$,
      'hint', $$Usa "Creo que" o "En mi opinión".$$,
      'expected', $$Creo que el deporte es bueno para la salud.$$
    ),
    jsonb_build_object(
      'question', $$Responde en desacuerdo a esta frase: "Los deberes son inútiles."$$,
      'hint', $$Usa "No estoy de acuerdo" y justifica tu respuesta.$$,
      'expected', $$No estoy de acuerdo, los deberes son útiles para aprender.$$
    ),
    jsonb_build_object(
      'question', $$Da el femenino singular del adjetivo "peligroso".$$,
      'hint', $$Los adjetivos en -o cambian a -a en femenino.$$,
      'expected', $$Peligrosa.$$
    ),
    jsonb_build_object(
      'question', $$Completa con el adjetivo correcto (concordancia): Estas actividades son muy (interesante) ___.$$,
      'hint', $$"Interesante" no cambia según el género, pero sí en plural.$$,
      'expected', $$Estas actividades son muy interesantes.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-expression-opinion';
