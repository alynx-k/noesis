-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1808: "L12 Exprimer la capacité" (https://lyc.ecole-ci.org/course/view.php?id=1808),
-- resource id 15158. Support: "Las vidas que 'regala' un donante", in
-- ¡Más allá! Espagnol 1ère p.49. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Fait réel
-- (Journée mondiale de la canne blanche, 15 octobre, proclamée par
-- l'Union mondiale des aveugles en 1980) repris tel quel ; aucune phrase
-- copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-capacidad-trasplante',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir la capacidad: las vidas que "regala" un donante$$,
  12,
  '1ere-a-esp-certeza-equidad-genero',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dos clubes de español de institutos vecinos organizan una fiesta de fin de año juntos. Uno de los clubes escribe una carta explicando lo que es capaz de aportar; el otro club se reúne para responder, usando las expresiones de capacidad.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: la capacidad, el donante, un trasplante$$,
        'body', $$« La capacidad » es la aptitud para hacer algo: « Para ser intérprete, el candidato debe mostrar su capacidad para hablar varias lenguas ». « Un/a donante » es la persona que dona algo (sangre, un órgano) para ayudar a otra: « El banco de sangre necesita mucha sangre por parte de los donantes ». « Un trasplante » es la operación mediante la cual se implanta un órgano de una persona a otra: « El enfermo de insuficiencia renal necesita un trasplante de riñón ».$$,
        'highlights', array[$$la capacidad = aptitud para hacer algo$$, $$el donante$$, $$un trasplante (de riñón)$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué es « un donante »?$$, 'solution', $$La persona que dona algo, como sangre o un órgano, para ayudar a otra.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: expresar la capacidad o la incapacidad$$,
        'body', $$Para expresar la capacidad, se usan las fórmulas: poder + infinitivo; ser capaz de; estar capacitado para. Ejemplo: « Puedo donar mi sangre ». Para expresar la incapacidad, se usan las fórmulas negativas correspondientes: no poder + infinitivo; no ser capaz de; no estar capacitado para. Ejemplo: « No estoy capacitado para resolver el problema ».$$,
        'highlights', array[$$capacidad : poder + infinitivo, ser capaz de, estar capacitado para$$, $$incapacidad : no poder + infinitivo, no ser capaz de, no estar capacitado para$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Concepto', 'Antónimo']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$la capacidad$$, $$la incapacidad$$),
            jsonb_build_array($$la posibilidad$$, $$la imposibilidad$$),
            jsonb_build_array($$el valiente$$, $$el perezoso$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en frase de incapacidad: « Vosotras podéis cocinar para mil convidados. »$$, 'solution', $$Vosotras no podéis cocinar para mil convidados. (o: no sois capaces de cocinar para mil convidados)$$),
        'fixation', jsonb_build_object('question', $$Da tres fórmulas para expresar la capacidad.$$, 'solution', $$Por ejemplo: « poder + infinitivo », « ser capaz de », « estar capacitado para ».$$)
      ),
      jsonb_build_object(
        'heading', $$El don de órganos y la solidaridad$$,
        'body', $$El trasplante de órganos, como el trasplante de riñón, permite salvar la vida de personas afectadas por enfermedades graves, gracias a la generosidad de un donante compatible. Cada 15 de octubre se celebra el Día Mundial del Bastón Blanco, proclamado en 1980 por la Unión Mundial de Ciegos para conmemorar el uso del bastón blanco como instrumento de inclusión e igualdad de oportunidades para las personas con discapacidad visual.$$,
        'highlights', array[$$trasplante de riñón : puede salvar la vida gracias a un donante compatible$$, $$15 de octubre : Día Mundial del Bastón Blanco (desde 1980)$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué se conmemora cada 15 de octubre, y desde cuándo?$$, 'solution', $$El Día Mundial del Bastón Blanco, proclamado en 1980 por la Unión Mundial de Ciegos.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lees esta información: « Cada 15 de octubre, se celebra el Día Mundial del Bastón Blanco. La Unión Mundial de Ciegos proclamó este día en el año 1980 para conmemorar el uso del bastón blanco como instrumento de inclusión y de igualdad de oportunidades para personas con discapacidad visual. » Decides compartir tus reflexiones con el club de español.$$,
      'questions', array[
        $$Cita algunas expresiones de capacidad y de incapacidad.$$,
        $$Redacta un breve artículo explicando lo que tu club de español es capaz de hacer para apoyar a las personas con discapacidad visual.$$,
        $$Usa al menos una expresión de incapacidad para describir un límite realista de esta acción (por ejemplo, lo que el club no puede hacer solo).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué fórmula se usa para expresar la capacidad con un verbo?$$,
      'hint', $$Es la más simple de las tres.$$,
      'expected', $$Poder + infinitivo (también válidas: ser capaz de, estar capacitado para).$$
    ),
    jsonb_build_object(
      'question', $$Transforma en frase de capacidad: « No puedo estudiar tres lenguas en cinco meses. »$$,
      'hint', $$Quita la negación.$$,
      'expected', $$Puedo estudiar tres lenguas en cinco meses. (o: soy capaz de estudiar tres lenguas en cinco meses)$$
    ),
    jsonb_build_object(
      'question', $$¿Qué órgano se menciona en el texto como objeto de trasplante?$$,
      'hint', $$Es un órgano relacionado con la insuficiencia renal.$$,
      'expected', $$El riñón.$$
    ),
    jsonb_build_object(
      'question', $$¿Cuál es el antónimo de « la capacidad »?$$,
      'hint', $$Empieza con « in- ».$$,
      'expected', $$La incapacidad.$$
    )
  ),
  now()
);
