-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 857: "L3 Connaitre les réalités de la Guinée
-- Equatoriale" (https://lyc.ecole-ci.org/course/view.php?id=857),
-- resource id 3933. Support: "El Español es innegociable", in ¡Más allá!
-- Espagnol 1ère p.18. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Faits linguistiques
-- et statistiques réels (langues officielles/vernaculaires de la Guinée
-- Équatoriale) repris tels quels ; aucune phrase copiée verbatim du PDF
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-guinea-ecuatorial',
  '1ere',
  'A',
  'espagnol',
  $$El español es innegociable: Guinea Ecuatorial$$,
  3,
  '1ere-a-esp-etnografia-hispanoamerica',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un alumno de la clase asistió con su padre a la Copa Africana de Fútbol 2015 en Guinea Ecuatorial y regresó con un video. Muy entusiasmados al verlo, sus compañeros deciden identificar y analizar las realidades sociolingüísticas de este país.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: idioma, lengua vernácula, bilingüismo$$,
        'body', $$« El idioma » (sinónimo: « la lengua ») es el sistema de comunicación de un pueblo: el español es el idioma oficial de Guinea Ecuatorial. « Una lengua vernácula » es una lengua regional o local, propia de una comunidad étnica dentro de un país: el baulé y el guéré son lenguas vernáculas de Costa de Marfil. « El bilingüismo » consiste en hablar y usar dos lenguas.$$,
        'highlights', array[$$el idioma / la lengua$$, $$una lengua vernácula$$, $$el bilingüismo$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Idioma = lengua; lengua vernácula = lengua regional/local de una etnia; bilingüismo = práctica de hablar dos lenguas.$$),
        'fixation', jsonb_build_object('question', $$¿Qué diferencia hay entre un idioma oficial y una lengua vernácula?$$, 'solution', $$El idioma oficial es la lengua reconocida por la constitución del país y usada en la administración y la enseñanza; la lengua vernácula es una lengua regional, propia de una comunidad étnica particular.$$)
      ),
      jsonb_build_object(
        'heading', $$La situación lingüística de Guinea Ecuatorial$$,
        'body', $$Guinea Ecuatorial es un caso único en África: es el único país del continente donde el español es idioma oficial. El país reconoce varios idiomas oficiales (el español y el francés, y según la constitución también el portugués), que cohabitan con numerosas lenguas vernáculas locales como el fang, el bubi y el ndowé. El español es hablado por una proporción muy alta de la población (alrededor del 87,7% de los habitantes) y es la lengua principal de la enseñanza. Por esta importancia central, el país ha creado una Academia Ecuatoguineana de la Lengua Española, encargada de reforzar la enseñanza del español, incluso para extranjeros.$$,
        'highlights', array[$$único país africano con el español como idioma oficial$$, $$español hablado por ~87,7% de la población$$, $$lenguas vernáculas : fang, bubi, ndowé$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Por qué se dice que Guinea Ecuatorial es un caso único en el continente africano?$$, 'solution', $$Porque es el único país africano donde el español tiene estatus de idioma oficial.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la frecuencia$$,
        'body', $$Para expresar la frecuencia de una acción en español, se usan expresiones como: siempre, generalmente, a menudo, en contadas ocasiones, una vez a la semana, todos los días, casi siempre, a veces, alguna vez, de vez en cuando, cada vez más. Ejemplos: « Todos los días escucho la radio »; « En ocasiones vamos al cine los días festivos »; « Es un mundo cada vez más globalizado ».$$,
        'highlights', array[$$siempre, generalmente, a menudo, casi siempre$$, $$a veces, alguna vez, de vez en cuando, en contadas ocasiones$$]::text[],
        'example', jsonb_build_object('statement', $$Identifica la expresión de frecuencia: « Cada noche, sigo el telediario después de la cena. »$$, 'solution', $$« Cada noche » expresa la frecuencia (equivalente a « todas las noches »).$$),
        'fixation', jsonb_build_object('question', $$¿Qué expresión de frecuencia usarías para decir que algo pasa muy raramente?$$, 'solution', $$Por ejemplo « en contadas ocasiones » o « alguna vez ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ves en la tele un documental que explica: « Guinea Ecuatorial es una nación cuyos idiomas oficiales son el francés, el español y el portugués. Cohabitan con lenguas locales. El español es hablado por un 87,7% de los habitantes, situándose como la primera lengua. » Decides informar a tus compañeros del club de español.$$,
      'questions', array[
        $$Cita algunas lenguas vernáculas de Guinea Ecuatorial.$$,
        $$Informa a tus compañeros sobre la situación lingüística del país, usando al menos una expresión de frecuencia.$$,
        $$Explica por qué es importante, hoy en día, hablar varias lenguas (usa el vocabulario del bilingüismo).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Cuál es el idioma oficial principal de Guinea Ecuatorial, hablado por la mayoría de la población?$$,
      'hint', $$Es el único país africano donde tiene ese estatus.$$,
      'expected', $$El español.$$
    ),
    jsonb_build_object(
      'question', $$Cita una lengua vernácula de Guinea Ecuatorial.$$,
      'hint', $$Por ejemplo, una lengua hablada solo por una comunidad étnica.$$,
      'expected', $$Por ejemplo el fang, el bubi o el ndowé (una respuesta basta).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué institución se creó en Guinea Ecuatorial para reforzar la enseñanza del español?$$,
      'hint', $$Su nombre contiene « Academia ».$$,
      'expected', $$La Academia Ecuatoguineana de la Lengua Española.$$
    ),
    jsonb_build_object(
      'question', $$Da un ejemplo de expresión de frecuencia que signifique « todos los días ».$$,
      'hint', $$Es una expresión sinónima directa.$$,
      'expected', $$« Todos los días » (o « siempre », « generalmente », según el contexto).$$
    )
  ),
  now()
);
