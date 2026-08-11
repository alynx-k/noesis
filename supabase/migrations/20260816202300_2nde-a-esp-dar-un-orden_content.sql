-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 1056: "L25 Donner un ordre"
-- (https://lyc.ecole-ci.org/course/view.php?id=1056)
-- Contenu extrait de la même pluginfile que L13-L24 (pages 39-41 de la
-- section propre à cette leçon), correspondant à la fiche "Leçon 6 Fiche 3".
-- Support: article sur la corruption en Amérique latine (Mario Vargas
-- Llosa). Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion
-- linguistique), reformulés/paraphrasés. Aucune phrase copiée verbatim du
-- PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-dar-un-orden',
  '2nde',
  'A',
  'espagnol',
  $$Dar una orden$$,
  24,
  '2nde-a-esp-aconsejar',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El jefe de clase de un liceo marfileño nota que algunos alumnos no quieren participar en las actividades colectivas. Con el jefe adjunto, decide reaccionar poniendo por escrito nuevas reglas de conducta. En clase de español, con ayuda de la profesora, los alumnos identifican las expresiones de la orden y redactan las nuevas normas de la clase.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: dar una orden, el escritor, rueda de prensa$$,
        'body', $$« Dar una orden » significa mandar a alguien que haga algo con autoridad: un general da órdenes a sus soldados. « El escritor » es la persona que escribe obras literarias. « Una rueda de prensa » (o conferencia de prensa) es un encuentro organizado para comunicar información a los periodistas.$$,
        'highlights', array[$$dar una orden$$, $$el escritor$$, $$rueda de prensa$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Dar una orden = mandar con autoridad; escritor = quien escribe obras literarias; rueda de prensa = encuentro con periodistas.$$),
        'fixation', jsonb_build_object('question', $$¿Qué es « una rueda de prensa »?$$, 'solution', $$Un encuentro organizado para comunicar información a los periodistas.$$)
      ),
      jsonb_build_object(
        'heading', $$La corrupción, un mal de América Latina$$,
        'body', $$El texto de referencia trata de la corrupción que afecta a varios países de América Latina. Un escritor peruano considera que se deben mejorar los procesos electorales para evitar el fraude, y menciona los casos de países donde la corrupción es grave, contrastándolos con otros donde, según él, se puede hablar de una democracia más sólida.$$,
        'highlights', array[$$corrupción$$, $$procesos electorales$$]::text[],
        'fixation', jsonb_build_object('question', $$Según el escritor citado en el texto, ¿qué se debe mejorar para luchar contra la corrupción?$$, 'solution', $$Los procesos electorales, para evitar el fraude.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: dar una orden$$,
        'body', $$Para dar una orden en español se pueden usar: 1) verbos como « tener que », « deber », « haber de » o la forma impersonal « hay que », seguidos de infinitivo; 2) el modo imperativo, muy habitual; 3) los verbos « ordenar » y « mandar »; 4) el infinitivo solo, cuando la orden se dirige a un colectivo indeterminado (por ejemplo en carteles: « No fumar », « Lavarse las manos »).$$,
        'highlights', array[$$tener que / hay que + infinitivo$$, $$imperativo$$, $$infinitivo colectivo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Hay que + infinitivo$$, $$Hay que respetar las reglas.$$),
            jsonb_build_array($$Imperativo$$, $$¡Vengan aquí! / ¡Siéntate bien!$$),
            jsonb_build_array($$Infinitivo (cartel/colectivo)$$, $$No fumar. / Lavarse las manos.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en orden con imperativo (vosotros): « Debéis hacer el trabajo ».$$, 'solution', $$¡Haced el trabajo!$$),
        'fixation', jsonb_build_object('question', $$¿Qué forma verbal se usa en los carteles para dar una orden a un público indeterminado?$$, 'solution', $$El infinitivo (por ejemplo « No fumar »).$$)
      ),
      jsonb_build_object(
        'heading', $$Establecer reglas de conducta en un grupo$$,
        'body', $$Redactar reglas de conducta para una clase o un club implica combinar varias formas de dar órdenes: reglas generales con « hay que » o el infinitivo (« hay que llegar puntual », « respetar el turno de palabra »), y órdenes más directas con el imperativo cuando se dirige a personas concretas. Esto ayuda a mantener el orden y el buen funcionamiento del grupo.$$,
        'highlights', array[$$reglas de conducta$$]::text[],
        'fixation', jsonb_build_object('question', $$Da un ejemplo de regla de clase usando « hay que ».$$, 'solution', $$Por ejemplo « hay que llegar puntual a clase » (cualquier regla razonable es válida).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$A principio de curso, el director presenta a los candidatos a jefe de clase y da algunas instrucciones. Durante la sesión del club de español, decides dar algunos consejos y órdenes de votación a los miembros para que el proceso se desarrolle correctamente.$$,
      'questions', array[
        $$Cita al menos tres estructuras usadas para dar una orden en español.$$,
        $$Redacta tres órdenes o reglas para el buen desarrollo de una votación en clase.$$,
        $$Explica cuándo se usa el infinitivo (en vez del imperativo) para dar una orden.$$,
        $$Da tu opinión sobre la importancia de mejorar los procesos electorales para luchar contra la corrupción.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué expresión impersonal con « hay » se usa para dar una orden general?$$,
      'hint', $$Es una expresión de tres letras seguida de « que ».$$,
      'expected', $$« Hay que » (+ infinitivo).$$
    ),
    jsonb_build_object(
      'question', $$Da el imperativo de « venir » para « ustedes ».$$,
      'hint', $$Termina en « -an ».$$,
      'expected', $$« Vengan ».$$
    ),
    jsonb_build_object(
      'question', $$¿Qué mal social es el tema central del texto de esta lección?$$,
      'hint', $$Afecta a los procesos electorales de varios países.$$,
      'expected', $$La corrupción en América Latina.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué forma verbal se usa en un cartel dirigido a un público general, como « No fumar »?$$,
      'hint', $$No es el imperativo, es otra forma verbal no conjugada.$$,
      'expected', $$El infinitivo.$$
    )
  ),
  now()
);
