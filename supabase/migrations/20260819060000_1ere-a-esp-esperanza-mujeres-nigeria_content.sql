-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1814: "L18 Exprimer l'espoir" (https://lyc.ecole-ci.org/course/view.php?id=1814),
-- resource id 15230. Support: "Los hombres han fallado; intentémoslo con
-- las mujeres", in ¡Más allá! Espagnol 1ère p.69. Contenu et exercices
-- ENTIÈREMENT EN ESPAGNOL (immersion linguistique), reformulés/
-- paraphrasés. Faits réels (activisme climatique de Bahijjatu Abubakar
-- au Nigeria, pollution de l'air et changement climatique) repris tels
-- quels ; aucune phrase copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-esperanza-mujeres-nigeria',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir la esperanza: "los hombres han fallado; intentémoslo con las mujeres"$$,
  18,
  '1ere-a-esp-intencion-guerra-cacao',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La Embajada de España prometió libros y materiales didácticos a los alumnos de español de un liceo, pero desde hace dos años los documentos no llegan. Los miembros del club de español, impacientes, deciden escribir una carta al Embajador, expresando su esperanza de recibir pronto el material.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: tener esperanza, fallar, lograr$$,
        'body', $$« Tener esperanza » significa confiar en que algo bueno va a ocurrir: « Como los hombres han fracasado, la gente tiene mucha esperanza en las mujeres ». « Fallar » significa no tener éxito: « Los bandidos han fallado en su intento de robo del banco ». « Lograr » significa conseguir un objetivo: « Los alumnos que estudian sus lecciones logran fácilmente en sus estudios ».$$,
        'highlights', array[$$tener esperanza$$, $$fallar$$, $$lograr$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el antónimo de « lograr »?$$, 'solution', $$Fallar (o fracasar).$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las fórmulas para expresar la esperanza$$,
        'body', $$Para expresar la esperanza, se usan: (1) el futuro simple de indicativo, que proyecta una situación positiva hacia el futuro: « Esta lluvia traerá buena cosecha »; (2) « cuando » + presente de subjuntivo, para expresar una condición futura esperada: « Cuando tenga dinero, saldré de viaje »; (3) las expresiones « tener esperanza de » o « esperar »: « Tengo esperanza de aprobar mi examen ».$$,
        'highlights', array[$$futuro simple de indicativo$$, $$cuando + presente de subjuntivo$$, $$tener esperanza de / esperar$$]::text[],
        'example', jsonb_build_object('statement', $$Pasa al futuro esta frase cargada de esperanza: « El sol sale también para ti, solo tienes que abrir tu ventana. »$$, 'solution', $$El sol saldrá también para ti, solo tendrás que abrir tu ventana.$$),
        'fixation', jsonb_build_object('question', $$¿Qué estructura se usa con « cuando » para expresar una esperanza futura?$$, 'solution', $$« Cuando » + presente de subjuntivo (por ejemplo « cuando tenga dinero »).$$)
      ),
      jsonb_build_object(
        'heading', $$El activismo de las mujeres jóvenes contra el cambio climático$$,
        'body', $$En Nigeria, jóvenes activistas como Bahijjatu Abubakar luchan contra los efectos de la deforestación y la contaminación del aire, dando esperanza a toda una generación. Su mensaje pone el acento en la relación directa entre el cambio climático y la salud: « el cambio climático no está en la televisión, sino en nuestros pulmones ». Estas iniciativas, lideradas mayoritariamente por mujeres y niñas, inspiran esperanza porque muestran que es posible tomar conciencia colectiva del riesgo climático y actuar concretamente frente a él.$$,
        'highlights', array[$$Bahijjatu Abubakar : activista climática en Nigeria$$, $$« el cambio climático no está en la televisión, sino en nuestros pulmones »$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué relación pone de relieve la frase « el cambio climático no está en la televisión, sino en nuestros pulmones »?$$, 'solution', $$La relación directa entre el cambio climático (y la contaminación del aire) y sus consecuencias concretas sobre la salud humana.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un compañero de clase, que vive situaciones difíciles, parece escéptico en cuanto a un porvenir mejor. Decides animarlo con un mensaje escrito, inspirándote en el ejemplo de los jóvenes activistas climáticos.$$,
      'questions', array[
        $$Lista algunas expresiones de esperanza (con sus tres construcciones gramaticales).$$,
        $$Redacta un mensaje de ánimo para tu compañero, usando al menos dos construcciones diferentes de esperanza.$$,
        $$Menciona un ejemplo (real o inventado) de una persona joven cuyas acciones inspiran esperanza para el futuro.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con el futuro simple: « Esta lluvia (traer) buena cosecha. »$$,
      'hint', $$Futuro de traer.$$,
      'expected', $$Esta lluvia traerá buena cosecha.$$
    ),
    jsonb_build_object(
      'question', $$Completa con el subjuntivo: « Cuando (tener yo) dinero, saldré de viaje. »$$,
      'hint', $$Presente de subjuntivo de tener.$$,
      'expected', $$Cuando tenga dinero, saldré de viaje.$$
    ),
    jsonb_build_object(
      'question', $$¿En qué país africano se menciona el activismo climático de Bahijjatu Abubakar?$$,
      'hint', $$Es el país más poblado de África.$$,
      'expected', $$Nigeria.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué dos problemas ambientales combate el activismo mencionado en la lección?$$,
      'hint', $$Uno afecta los árboles, el otro el aire.$$,
      'expected', $$La deforestación y la contaminación del aire.$$
    )
  ),
  now()
);
