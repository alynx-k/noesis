-- Espagnol 4ème, leçon 4/7 : L'expression d'opinion.
-- ecole-ci.org est maintenant accessible : ce contenu remplace le repli
-- précédent et s'appuie sur les fiches réelles du Collège Numérique
-- (coll.ecole-ci.org, catégorie Espagnol 4ème) pour la compétence "Traiter
-- une situation relative à l'expression d'opinion" -- Leçon 4 Fiche 1
-- (Demander une opinion : ¿qué piensas?, ¿qué te parece?), Fiche 2
-- (Exprimer une opinion : según yo, pienso que, a mi parecer, opino que),
-- Fiche 3 (Approuver / désapprouver : estoy de acuerdo, no estoy de
-- acuerdo) et Fiche 4 (Convaincre quelqu'un : tener que + infinitif). Le
-- niveau réel de ces fiches reste à l'indicatif (sans subjonctif) ; ce
-- contenu corrige donc le repli précédent qui avait anticipé un point de
-- grammaire trop avancé pour cette leçon. Formulations, exemples et
-- exercices 100% originaux (paraphrase, jamais de copie des phrases des
-- fiches sources) ; contenu pédagogique en espagnol (immersion
-- linguistique), seule la structure de l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tu colegio organiza un debate sobre el uso de las redes sociales entre los adolescentes. Debes pedir la opinión de tus compañeros, dar la tuya, mostrar tu acuerdo o desacuerdo, y convencer a alguien de moderar su uso de las pantallas.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pedir la opinión de alguien$$,
        'body', $$Antes de dar tu propia opinión, un buen debate empieza por preguntar la de los demás. Existen varias fórmulas para pedir la opinión de una persona, según el grado de formalidad.$$,
        'highlights', array[$$¿qué piensas de...?$$, $$¿qué te parece...?$$, $$¿cuál es tu opinión?$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fórmula$$, $$Registro$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Qué piensas de...?$$, $$informal (un amigo)$$),
            jsonb_build_array($$¿Qué piensa usted de...?$$, $$formal (un adulto)$$),
            jsonb_build_array($$¿Qué te parece...?$$, $$informal$$),
            jsonb_build_array($$¿Cuál es tu opinión sobre...?$$, $$neutro$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Con "usted" se usa la tercera persona del singular: ¿qué piensa usted?, mientras que con "tú" se usa la segunda: ¿qué piensas tú? "¿Qué te parece?" siempre lleva el pronombre de complemento indirecto (me, te, le) antes del verbo "parecer".$$),
        'example', jsonb_build_object('statement', $$Pide la opinión de un compañero sobre las redes sociales.$$, 'solution', $$¿Qué piensas de las redes sociales?$$),
        'fixation', jsonb_build_object('question', $$Transforma en pregunta formal (con "usted"): "¿Qué piensas del debate?"$$, 'solution', $$¿Qué piensa usted del debate?$$)
      ),
      jsonb_build_object(
        'heading', $$Dar su opinión$$,
        'body', $$Para responder a una pregunta de opinión, el español usa varias expresiones equivalentes, todas seguidas del indicativo, que puedes variar para no repetir siempre la misma.$$,
        'highlights', array[$$según yo$$, $$pienso que$$, $$a mi parecer$$, $$para mí$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Según yo,...$$, $$Según yo, las redes sociales conectan a la gente.$$),
            jsonb_build_array($$A mi parecer,...$$, $$A mi parecer, hay que usarlas con moderación.$$),
            jsonb_build_array($$Opino que...$$, $$Opino que son útiles para estudiar.$$),
            jsonb_build_array($$Para mí,...$$, $$Para mí, el tiempo de pantalla es importante.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Todas estas expresiones de opinión van seguidas del indicativo (el modo normal): pienso que son útiles, opino que ayudan. No confundas "según yo" (mi punto de vista) con "según él/ella" (el punto de vista de otra persona).$$),
        'example', jsonb_build_object('statement', $$Da tu opinión sobre el tiempo que pasan los jóvenes en las redes sociales.$$, 'solution', $$A mi parecer, muchos jóvenes pasan demasiado tiempo en las redes sociales.$$),
        'fixation', jsonb_build_object('question', $$Completa con una expresión de opinión: ___ las redes sociales ayudan a mantener el contacto con la familia lejana.$$, 'solution', $$Según yo, las redes sociales ayudan a mantener el contacto con la familia lejana.$$)
      ),
      jsonb_build_object(
        'heading', $$Aprobar o desaprobar una opinión$$,
        'body', $$Durante un debate, también debes reaccionar a la opinión de otra persona: mostrar que estás de acuerdo, o al contrario, expresar tu desacuerdo con cortesía.$$,
        'highlights', array[$$estoy de acuerdo$$, $$tienes razón$$, $$no estoy de acuerdo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Aprobar$$, $$Desaprobar$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Estoy de acuerdo.$$, $$No estoy de acuerdo.$$),
            jsonb_build_array($$¡Claro! / Tienes razón.$$, $$No acepto lo que dices.$$),
            jsonb_build_array($$Apruebo tu idea.$$, $$Pienso lo contrario.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Estar de acuerdo" siempre se construye con "con": estoy de acuerdo con tu idea, estoy de acuerdo contigo. Para desaprobar con cortesía, se puede matizar en vez de decir un "no" brusco: "no estoy totalmente de acuerdo" es más suave que "no estoy de acuerdo".$$),
        'example', jsonb_build_object('statement', $$Expresa tu desacuerdo con la idea de prohibir totalmente las redes sociales.$$, 'solution', $$No estoy de acuerdo con prohibir totalmente las redes sociales.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi amigo piensa que las redes sociales son peligrosas, y yo ___ (estar de acuerdo) con él.$$, 'solution', $$Mi amigo piensa que las redes sociales son peligrosas, y yo estoy de acuerdo con él.$$)
      ),
      jsonb_build_object(
        'heading', $$Convencer a alguien: TENER QUE + infinitivo$$,
        'body', $$Después del debate, quizás quieras convencer a un compañero de cambiar de comportamiento. La estructura más usada para esto es "tener que" seguido de un infinitivo.$$,
        'highlights', array[$$tienes que$$, $$tenemos que$$, $$tenéis que$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tener que + infinitivo$$, $$Tienes que limitar el tiempo de pantalla.$$),
            jsonb_build_array($$tener que + infinitivo$$, $$Tenemos que hablar de esto con los padres.$$),
            jsonb_build_array($$tener que + infinitivo$$, $$Tenéis que usar las redes con moderación.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Tener que" es un verbo irregular (tengo, tienes, tiene, tenemos, tenéis, tienen) seguido siempre de un infinitivo, sin preposición: tienes que estudiar (no "tienes que a estudiar"). Es la forma más directa de convencer o dar una obligación fuerte.$$),
        'example', jsonb_build_object('statement', $$Convence a un amigo de dejar el móvil durante las comidas.$$, 'solution', $$Tienes que dejar el móvil durante las comidas.$$),
        'fixation', jsonb_build_object('question', $$Completa con "tener que": Vosotros ___ (tener que, descansar) la vista después de tanto tiempo en pantalla.$$, 'solution', $$Vosotros tenéis que descansar la vista después de tanto tiempo en pantalla.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En el debate sobre las redes sociales, debes pedir la opinión de un compañero, dar la tuya, reaccionar con acuerdo o desacuerdo, y convencer a alguien de moderar su uso de las pantallas.$$,
      'questions', array[
        $$Pide la opinión de un compañero sobre un tema del debate.$$,
        $$Da tu opinión usando una expresión como "pienso que" o "a mi parecer".$$,
        $$Reacciona con acuerdo o desacuerdo a una opinión.$$,
        $$Convence a alguien usando "tener que" + infinitivo.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Transforma en pregunta formal: "¿Qué piensas de las redes sociales?" (dirigido a un adulto)$$,
      'hint', $$Con "usted" se usa la tercera persona del verbo.$$,
      'expected', $$¿Qué piensa usted de las redes sociales?$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de opinión: ___ es importante hablar cara a cara, no solo por mensaje.$$,
      'hint', $$Usa "a mi parecer", "según yo" o "opino que".$$,
      'expected', $$A mi parecer, es importante hablar cara a cara, no solo por mensaje.$$
    ),
    jsonb_build_object(
      'question', $$Completa: Nuestro profesor piensa que hay que limitar el móvil en clase, y nosotros ___ (estar de acuerdo).$$,
      'hint', $$"Estar de acuerdo" se construye con "con".$$,
      'expected', $$Nuestro profesor piensa que hay que limitar el móvil en clase, y nosotros estamos de acuerdo con él.$$
    ),
    jsonb_build_object(
      'question', $$Convence a un amigo con "tener que": (él necesita dormir más)$$,
      'hint', $$Usa "tener que" + infinitivo con "tú".$$,
      'expected', $$Tienes que dormir más.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-opinion';
