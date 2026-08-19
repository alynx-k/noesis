-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1815: "L19 Donner une consigne" (https://lyc.ecole-ci.org/course/view.php?id=1815),
-- resource id 15242. Support: "Acciones para cuidar el medio ambiente",
-- in ¡Más Allá! Espagnol 1ère p.76. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Aucune
-- phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-consignas-medio-ambiente',
  '1ere',
  'A',
  'espagnol',
  $$Dar una consigna: acciones para cuidar el medio ambiente$$,
  19,
  '1ere-a-esp-esperanza-mujeres-nigeria',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En tu instituto hay basura y agua sucia por todas partes. El club de español decide llevar a cabo acciones para luchar contra esta insalubridad, y la junta directiva quiere redactar carteles de sensibilización con consignas claras.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: dar consignas, cuidar de, el medio ambiente$$,
        'body', $$« Dar consignas » significa dar instrucciones u órdenes: « Antes de leer el texto, el profesor da consignas de escucha a los alumnos ». « Cuidar de » significa ocuparse del bienestar de algo o alguien: « En el hospital, los médicos cuidan de los enfermos ». « El medio ambiente » es el conjunto de elementos naturales que nos rodean: « Los ecologistas luchan a favor de la protección del medio ambiente ».$$,
        'highlights', array[$$dar consignas$$, $$cuidar de$$, $$el medio ambiente$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué significa « dar consignas »?$$, 'solution', $$Dar instrucciones u órdenes precisas.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la consigna$$,
        'body', $$Para dar una consigna, se usa principalmente el imperativo: « Evita dejar los aparatos enchufados ». También se usa la obligación personal (con tener que) o impersonal (con hay que): « Tenemos que preservar el medio ambiente »; « Hay que salvar a los animales ». En imperativo negativo, el verbo se conjuga en subjuntivo: « No juegues aquí » (tú); « No se meta en mis asuntos » (usted).$$,
        'highlights', array[$$imperativo afirmativo (consigna directa)$$, $$imperativo negativo → subjuntivo$$, $$obligación : tener que / hay que$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Forma', 'Construcción', 'Ejemplo']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Imperativo afirmativo$$, $$verbo conjugado$$, $$Cierra el grifo.$$),
            jsonb_build_array($$Imperativo negativo$$, $$no + subjuntivo$$, $$No dejes el grifo abierto.$$),
            jsonb_build_array($$Obligación$$, $$hay que / tener que + infinitivo$$, $$Hay que ahorrar agua.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pon en imperativo negativo (tú): « (Tirarse) al suelo. »$$, 'solution', $$No te tires al suelo.$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal se usa para conjugar el imperativo negativo?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$Acciones cotidianas para cuidar el medio ambiente$$,
        'body', $$Cuidar el medio ambiente no requiere grandes acciones: pequeños gestos cotidianos contribuyen significativamente a su protección. Entre ellos: usar el transporte público para evitar la contaminación de las ciudades, aprovechar la luz natural, apagar las luces para reducir el consumo de energía, cerrar los grifos cuando no se utiliza el agua, y plantar árboles para producir oxígeno. Cuidar el medio ambiente es importante porque de él dependen nuestra salud y nuestra vida, y porque permite evitar el calentamiento climático, fuente de catástrofes naturales.$$,
        'highlights', array[$$gestos cotidianos : transporte público, apagar luces, cerrar grifos, plantar árboles$$, $$importancia : salud, vida, evitar el calentamiento climático$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué debemos cuidar el medio ambiente, según la lección?$$, 'solution', $$Porque de él dependen nuestra salud y nuestra vida, y porque permite evitar el calentamiento climático, fuente de catástrofes naturales.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Los espacios verdes de tu instituto van desapareciendo. El club de español organiza un concurso del mejor anuncio para sensibilizar a los alumnos contra la destrucción del medio ambiente.$$,
      'questions', array[
        $$Apunta las reglas para dar consignas (imperativo, obligación personal/impersonal).$$,
        $$Redacta un anuncio con al menos tres consignas (usando el imperativo afirmativo y negativo).$$,
        $$Añade una frase con « hay que » o « tener que » para reforzar el mensaje.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Pon en imperativo negativo (usted): « (Meterse) en mis asuntos. »$$,
      'hint', $$Subjuntivo de meterse.$$,
      'expected', $$No se meta en mis asuntos.$$
    ),
    jsonb_build_object(
      'question', $$Da una consigna con « hay que » para proteger el medio ambiente.$$,
      'hint', $$hay que + infinitivo.$$,
      'expected', $$Por ejemplo « hay que ahorrar agua » o « hay que plantar árboles » (otras respuestas válidas).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué acción cotidiana ayuda a producir oxígeno, según la lección?$$,
      'hint', $$Está relacionada con la naturaleza.$$,
      'expected', $$Plantar árboles.$$
    ),
    jsonb_build_object(
      'question', $$¿Por qué cerrar los grifos ayuda al medio ambiente?$$,
      'hint', $$Es una cuestión de recursos naturales.$$,
      'expected', $$Porque evita el desperdicio de agua cuando no se está utilizando.$$
    )
  ),
  now()
);
