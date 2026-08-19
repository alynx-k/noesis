-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1812: "L16 Faire des éloges" (https://lyc.ecole-ci.org/course/view.php?id=1812),
-- resource id 15206. Support: "Dadié: el padre de las letras africanas",
-- in ¡Más allá! Espagnol 1ère p.63. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Faits
-- biographiques réels sur Bernard Binlin Dadié (écrivain ivoirien,
-- militant indépendantiste, ancien ministre, ancien vice-président du
-- Conseil exécutif de l'UNESCO) repris tels quels ; aucune phrase copiée
-- verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-elogios-dadie',
  '1ere',
  'A',
  'espagnol',
  $$Hacer elogios: Dadié, el padre de las letras africanas$$,
  16,
  '1ere-a-esp-temor-miedo',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La Embajada de España acaba de ofrecer una sala informática a un liceo de Costa de Marfil. Para la inauguración, se pide al presidente del club de español que prepare un discurso de agradecimiento. Con entusiasmo, identifica los elementos para elogiar y los usa en su mensaje de homenaje.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: elogiar, un homenaje, el testigo$$,
        'body', $$« Elogiar » (sinónimo: « alabar ») significa expresar admiración por las cualidades de alguien: « El día del casamiento, el griot elogia a las familias de los novios a través de canciones ». « Un homenaje » es una manifestación de respeto o admiración hacia alguien: « Hoy se organiza una ceremonia para rendir un caluroso homenaje a uno de sus hijos ». « El testigo » es la persona que presenció un hecho: « La policía pide a los testigos que cuenten las circunstancias del accidente ».$$,
        'highlights', array[$$elogiar = alabar$$, $$un homenaje$$, $$el testigo$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el sinónimo de « elogiar »?$$, 'solution', $$Alabar.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: los tipos de adjetivos calificativos$$,
        'body', $$El adjetivo calificativo epíteto se coloca junto al sustantivo (a menudo antes) y embellece el mensaje resaltando una cualidad, sin necesidad de un verbo: « Un caluroso homenaje a Dadié ». El adjetivo calificativo atributo va ligado al sustantivo mediante un verbo copulativo (ser, estar, parecer): « El homenaje a Dadié es caluroso ». Ambos tipos sirven para embellecer un mensaje de elogio, resaltando las cualidades de la persona homenajeada.$$,
        'highlights', array[$$epíteto : junto al sustantivo, sin verbo — « un caluroso homenaje »$$, $$atributo : ligado por un verbo copulativo — « el homenaje es caluroso »$$]::text[],
        'example', jsonb_build_object('statement', $$Transforma el epíteto en atributo: « Un fervoroso aplauso. »$$, 'solution', $$El aplauso es fervoroso. (o: el aplauso fue fervoroso)$$),
        'fixation', jsonb_build_object('question', $$¿Cuál es la diferencia entre un adjetivo epíteto y un adjetivo atributo?$$, 'solution', $$El epíteto se coloca directamente junto al sustantivo, sin verbo (« un caluroso homenaje »), mientras que el atributo se une al sustantivo mediante un verbo copulativo como ser, estar o parecer (« el homenaje es caluroso »).$$)
      ),
      jsonb_build_object(
        'heading', $$Bernard Dadié, el padre de las letras africanas$$,
        'body', $$Bernard Binlin Dadié (1916-2019) fue una figura capital de las letras africanas y universales, testigo de casi todo un siglo de historia. Fue militante por la independencia de Costa de Marfil, autor de numerosas obras literarias (novelas, poesía, teatro), antiguo ministro del Gobierno marfileño, y antiguo miembro y vicepresidente del Consejo Ejecutivo de la UNESCO. El Estado de Costa de Marfil le rindió un caluroso homenaje en 2016, antes de su muerte, en reconocimiento de su contribución al desarrollo de las letras y al despertar de las conciencias africanas.$$,
        'highlights', array[$$Bernard Dadié (1916-2019) : escritor, militante independentista, ministro, ex vicepresidente de la UNESCO$$, $$homenaje del Estado marfileño en 2016$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué cargo ocupó Bernard Dadié dentro de la UNESCO?$$, 'solution', $$Fue miembro y vicepresidente del Consejo Ejecutivo de la UNESCO.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo de una celebración en tu instituto, se pide a los alumnos que estudian español que redacten un mensaje de homenaje a una persona de su elección (un profesor, un familiar, una figura pública).$$,
      'questions', array[
        $$Elige a la persona que quieres homenajear y menciona brevemente por qué merece este homenaje.$$,
        $$Escribe el mensaje de homenaje usando al menos dos adjetivos epítetos y dos adjetivos atributos.$$,
        $$Concluye tu mensaje con una expresión de agradecimiento o de admiración.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿En qué se diferencia un adjetivo epíteto de un adjetivo atributo?$$,
      'hint', $$Uno necesita un verbo copulativo, el otro no.$$,
      'expected', $$El epíteto se coloca directamente junto al sustantivo sin verbo; el atributo se une al sustantivo mediante un verbo copulativo (ser, estar, parecer).$$
    ),
    jsonb_build_object(
      'question', $$¿Cuál es el sinónimo de « un homenaje »?$$,
      'hint', $$Empieza con « tr... ».$$,
      'expected', $$Un tributo.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué cargo político ocupó Bernard Dadié en Costa de Marfil?$$,
      'hint', $$Formó parte del Gobierno.$$,
      'expected', $$Fue ministro del Gobierno marfileño.$$
    ),
    jsonb_build_object(
      'question', $$Da un verbo sinónimo de « rendir homenaje ».$$,
      'hint', $$Significa hacer más grande la reputación de alguien.$$,
      'expected', $$Por ejemplo « glorificar » o « engrandecer ».$$
    )
  ),
  now()
);
