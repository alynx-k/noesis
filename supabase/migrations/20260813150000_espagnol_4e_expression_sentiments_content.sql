-- Espagnol 4ème, leçon 6/7 : L'expression des sentiments.
-- ecole-ci.org est maintenant accessible : ce contenu remplace le repli
-- précédent et s'appuie sur les fiches réelles du Collège Numérique
-- (coll.ecole-ci.org, catégorie Espagnol 4ème) pour la compétence "Traiter
-- une situation relative à l'expression des sentiments" -- Leçon 6 Fiche 1
-- (Exprimer la joie : ¡qué alegría!, estoy contento), Fiche 2 (Exprimer la
-- peine : ¡qué pena!, estoy triste), Fiche 3 (Demander et accepter des
-- excuses : discúlpame, perdón, lo siento / no pasa nada, no te preocupes)
-- et Fiche 4 (Exprimer le regret / l'indifférence : lo siento, deploro, me
-- arrepiento / me da igual, no importa). Le niveau réel de ces fiches reste
-- simple (expressions figées, sans subjonctif) ; ce contenu corrige donc le
-- repli précédent qui avait anticipé un point de grammaire trop avancé.
-- Formulations, exemples et exercices 100% originaux (paraphrase, jamais de
-- copie des phrases des fiches sources) ; contenu pédagogique en espagnol
-- (immersion linguistique), seule la structure de l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Escribes en la revista del club de español para contar la semana: una buena noticia que te dio alegría, un momento triste, una disculpa que tuviste que pedir o aceptar, y algo que lamentas o que, al contrario, te da igual.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Expresar la alegría$$,
        'body', $$Cuando algo te hace feliz, el español dispone de varias expresiones fijas para manifestar tu alegría, además del simple "estoy contento".$$,
        'highlights', array[$$¡qué alegría!$$, $$estoy contento/a$$, $$me alegro$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Qué alegría!$$, $$exclamación general$$),
            jsonb_build_array($$Estoy contento/a.$$, $$estado personal$$),
            jsonb_build_array($$Me alegro.$$, $$reacción a una noticia$$),
            jsonb_build_array($$¡Fenomenal! / ¡Fantástico!$$, $$entusiasmo$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Contento/a" concuerda en género con quien habla: un chico dice "estoy contento", una chica dice "estoy contenta". "¡Qué alegría!" es una exclamación invariable que se puede usar sola o seguida de una causa: ¡Qué alegría verte!$$),
        'example', jsonb_build_object('statement', $$Expresa tu alegría al ganar un concurso de español.$$, 'solution', $$¡Qué alegría! Estoy muy contento de haber ganado el concurso.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi hermana ___ (estar) muy ___ (contento) por su nueva nota.$$, 'solution', $$Mi hermana está muy contenta por su nueva nota.$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar la pena o la tristeza$$,
        'body', $$De la misma manera, existen expresiones fijas para manifestar tristeza o pena ante una situación difícil.$$,
        'highlights', array[$$¡qué pena!$$, $$¡qué lástima!$$, $$estoy triste$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expresión$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Qué pena!$$, $$exclamación general$$),
            jsonb_build_array($$¡Qué lástima!$$, $$lamentar algo$$),
            jsonb_build_array($$Estoy triste.$$, $$estado personal$$),
            jsonb_build_array($$Me da pena.$$, $$reacción a una noticia triste$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Triste" tiene una sola forma para masculino y femenino (estoy triste), a diferencia de "contento/a". "Me da pena" se construye como "gustar": me da pena, te da pena, le da pena + la causa.$$),
        'example', jsonb_build_object('statement', $$Expresa tu pena porque un amigo se muda a otra ciudad.$$, 'solution', $$¡Qué pena! Estoy triste porque mi amigo se muda a otra ciudad.$$),
        'fixation', jsonb_build_object('question', $$Completa: Mi equipo perdió el partido, ___.$$, 'solution', $$Mi equipo perdió el partido, ¡qué lástima!$$)
      ),
      jsonb_build_object(
        'heading', $$Pedir y aceptar disculpas$$,
        'body', $$Cuando has molestado a alguien, necesitas saber disculparte con las fórmulas adecuadas, y también saber aceptar las disculpas de otra persona.$$,
        'highlights', array[$$discúlpame$$, $$lo siento$$, $$no pasa nada$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Para disculparse$$, $$Para aceptar$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¡Discúlpame!$$, $$No pasa nada.$$),
            jsonb_build_array($$Perdón.$$, $$No te preocupes.$$),
            jsonb_build_array($$Lo siento / lo lamento.$$, $$De acuerdo, vale.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Discúlpame" es un imperativo con el pronombre pegado al final ("me"), dirigido directamente a la persona ofendida. "Lo siento" y "lo lamento" son sinónimos y siempre llevan el pronombre neutro "lo" antes del verbo.$$),
        'example', jsonb_build_object('statement', $$Discúlpate con un compañero por haber llegado tarde a la reunión del club.$$, 'solution', $$Lo siento, discúlpame por llegar tarde a la reunión.$$),
        'fixation', jsonb_build_object('question', $$Tu amigo se disculpa contigo diciendo "perdón, no quería molestarte". ¿Qué le respondes?$$, 'solution', $$No pasa nada, no te preocupes.$$)
      ),
      jsonb_build_object(
        'heading', $$Expresar el arrepentimiento o la indiferencia$$,
        'body', $$Por último, puedes expresar que lamentas algo que has hecho (arrepentimiento), o al contrario, que una situación no te importa (indiferencia).$$,
        'highlights', array[$$me arrepiento$$, $$deploro$$, $$me da igual$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Arrepentimiento$$, $$Indiferencia$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Me arrepiento.$$, $$Me da igual.$$),
            jsonb_build_array($$Lo lamento.$$, $$No importa.$$),
            jsonb_build_array($$Deploro lo que ha pasado.$$, $$¡Qué más da!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Arrepentirse" es un verbo pronominal: me arrepiento, te arrepientes, se arrepiente. "Deplorar" es más formal que "lamentar". "Me da igual" se construye como "gustar" (me da igual, te da igual, le da igual) y expresa que algo no te importa, sin necesariamente ser negativo.$$),
        'example', jsonb_build_object('statement', $$Expresa que te arrepientes de haber llegado tarde al club de español.$$, 'solution', $$Me arrepiento de haber llegado tarde al club de español.$$),
        'fixation', jsonb_build_object('question', $$Completa con una expresión de indiferencia: No sé qué película vamos a ver, la verdad es que ___.$$, 'solution', $$No sé qué película vamos a ver, la verdad es que me da igual.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En la revista del club de español, debes contar una buena noticia con alegría, un momento triste, una disculpa pedida o aceptada, y una situación que lamentas o que te da igual.$$,
      'questions', array[
        $$Expresa tu alegría por una buena noticia reciente.$$,
        $$Expresa tu tristeza o pena por una situación difícil.$$,
        $$Pide disculpas por algo, o acepta la disculpa de otra persona.$$,
        $$Expresa arrepentimiento o indiferencia frente a una situación.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: Ganamos el torneo del colegio, ___ (exclamación de alegría)!$$,
      'hint', $$Es la exclamación general para expresar la alegría.$$,
      'expected', $$Ganamos el torneo del colegio, ¡qué alegría!$$
    ),
    jsonb_build_object(
      'question', $$Completa: Mi amiga está muy ___ (triste) porque perdió su cuaderno de español.$$,
      'hint', $$"Triste" tiene una sola forma para masculino y femenino.$$,
      'expected', $$Mi amiga está muy triste porque perdió su cuaderno de español.$$
    ),
    jsonb_build_object(
      'question', $$Un compañero te dice "discúlpame por el retraso". ¿Qué le respondes para aceptar la disculpa?$$,
      'hint', $$Usa una de las fórmulas para aceptar disculpas.$$,
      'expected', $$No te preocupes, no pasa nada.$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de arrepentimiento: ___ no haber estudiado más para el examen.$$,
      'hint', $$Usa el verbo pronominal de arrepentimiento.$$,
      'expected', $$Me arrepiento de no haber estudiado más para el examen.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-sentiments';
