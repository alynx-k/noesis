-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1841: "L20 Exprimer une intention" (https://lyc.ecole-ci.org/course/view.php?id=1841),
-- resource id 15554. Support: "Los padres, debemos educar en valores",
-- in ¡Más allá! Espagnol 1ère p.79. Contenu et exercices ENTIÈREMENT EN
-- ESPAGNOL (immersion linguistique), reformulés/paraphrasés. Aucune
-- phrase copiée verbatim du PDF source ; reformulation 100% originale.
-- Dernière leçon de la séquence Espagnol de 1ère A (20/20 leçons
-- disponibles sur la plateforme).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-solicitacion-valores',
  '1ere',
  'A',
  'espagnol',
  $$Expresar la solicitación: educar en valores$$,
  20,
  '1ere-a-esp-consignas-medio-ambiente',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de tu instituto organiza un concurso de lectura y necesita solicitar ayuda a una ONG española para premiar a los mejores concursantes. Los alumnos se organizan para identificar los elementos lingüísticos de la solicitación antes de redactar la demanda.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: solicitar, una virtud, fortalecer$$,
        'body', $$« Solicitar » significa pedir formalmente algo: « Una persona que necesita ayuda, la solicita ». « Una virtud » (sinónimo: « un valor ») es una cualidad moral positiva: « El respeto es una virtud que debemos inculcar a los hijos ». « Fortalecer » significa hacer más fuerte algo: « Leer mucho fortalece la memoria ».$$,
        'highlights', array[$$solicitar$$, $$una virtud = un valor$$, $$fortalecer$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Cuál es el sinónimo de « una virtud »?$$, 'solution', $$Un valor.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: la expresión de la solicitación$$,
        'body', $$Para expresar la solicitación (una petición formal, una obligación suave), se usan: (1) deber + infinitivo: « Los padres deben animar a sus niños »; (2) haber de + infinitivo (construcción más formal): « Los padres han de animar a sus niños »; (3) el imperativo: « ¡Padres! Animad a vuestros niños ». También se pueden usar directamente los verbos solicitar, rogar, pedir, necesitar, conjugados según el contexto.$$,
        'highlights', array[$$deber + infinitivo$$, $$haber de + infinitivo (más formal)$$, $$imperativo$$, $$solicitar, rogar, pedir, necesitar$$]::text[],
        'example', jsonb_build_object('statement', $$Expresa la solicitación de tres maneras: « Los padres (educar) a sus hijos con paciencia. »$$, 'solution', $$1) Los padres deben educar a sus hijos con paciencia. 2) Los padres han de educar a sus hijos con paciencia. 3) ¡Padres! Educad a vuestros hijos con paciencia.$$),
        'fixation', jsonb_build_object('question', $$¿Cuáles son las tres construcciones principales para expresar la solicitación?$$, 'solution', $$Deber + infinitivo, haber de + infinitivo, y el imperativo.$$)
      ),
      jsonb_build_object(
        'heading', $$Educar en valores$$,
        'body', $$Los especialistas en educación infantil coinciden en que los padres desempeñan un papel esencial para inculcar valores a sus hijos y fortalecer su personalidad. Entre los valores fundamentales que forman a una persona íntegra y capaz de vivir en sociedad, se citan: saber distinguir el bien del mal, el respeto, y la honestidad. Los padres deben adoptar actitudes positivas y servir de modelo para sus hijos, ayudándolos a desarrollar una conciencia moral sólida.$$,
        'highlights', array[$$los padres deben inculcar valores y fortalecer la personalidad de los hijos$$, $$valores clave : distinguir el bien del mal, el respeto, la honestidad$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué papel deben desempeñar los padres, según la lección?$$, 'solution', $$Adoptar actitudes positivas y servir de modelo para sus hijos, ayudándolos a desarrollar una conciencia moral y a inculcarles valores como el respeto y la honestidad.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$El responsable de una ONG da una conferencia sobre el aumento del consumo de droga en las escuelas. Como miembro del club de español, decides publicar un artículo en la revista del club para sensibilizar a tus compañeros.$$,
      'questions', array[
        $$Enumera algunas expresiones de solicitación (con sus tres construcciones).$$,
        $$Redacta el artículo, usando al menos dos construcciones diferentes de solicitación para dar recomendaciones a tus compañeros.$$,
        $$Menciona un valor (de los vistos en la lección) que podría ayudar a los jóvenes a resistir esta presión negativa, y explica por qué.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Transforma con « deber + infinitivo »: « Los alumnos (respetar) las reglas del instituto. »$$,
      'hint', $$Deber + infinitivo.$$,
      'expected', $$Los alumnos deben respetar las reglas del instituto.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué construcción, más formal que « deber + infinitivo », se usa también para expresar la solicitación?$$,
      'hint', $$Empieza con « haber... ».$$,
      'expected', $$Haber de + infinitivo.$$
    ),
    jsonb_build_object(
      'question', $$Cita dos valores mencionados en la lección como esenciales para formar a una persona íntegra.$$,
      'hint', $$Uno es moral, el otro social.$$,
      'expected', $$Por ejemplo el respeto y la honestidad (también válido: saber distinguir el bien del mal).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué verbo, además de « deber », se puede usar directamente para expresar una solicitación formal?$$,
      'hint', $$Es el verbo del título de la lección.$$,
      'expected', $$Solicitar (también válidos: rogar, pedir, necesitar).$$
    )
  ),
  now()
);
