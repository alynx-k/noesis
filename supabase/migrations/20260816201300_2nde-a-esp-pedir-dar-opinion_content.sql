-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Espagnol, categoryid=97.
-- Moodle course id 3177: "L15 Demander ou donner une opinion"
-- (https://lyc.ecole-ci.org/course/view.php?id=3177)
-- Contenu extrait de la même pluginfile que L13/L14 (pages 4 à 6 de la
-- section propre à cette leçon, dans le fichier consolidé du serveur),
-- correspondant à la fiche "Leçon 4 Fiche 3" du support pédagogique.
-- Contenu et exercices ENTIÈREMENT EN ESPAGNOL (immersion linguistique),
-- reformulés/paraphrasés à partir du support source (impact de la mode sur
-- l'identité des jeunes, expressions pour demander/donner une opinion).
-- Aucune phrase copiée verbatim du PDF source ; reformulation 100% originale.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-esp-pedir-dar-opinion',
  '2nde',
  'A',
  'espagnol',
  $$Pedir y dar una opinión$$,
  14,
  '2nde-a-esp-aprobar-desaprobar',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Con motivo del Día Mundial de los Migrantes, un ayuntamiento organiza actividades de sensibilización contra la emigración clandestina. En una pared se lee: « La emigración clandestina es una muerte programada ». Conmovidos por esta frase, unos alumnos deciden reaccionar y, en clase de español, aprenden a identificar y usar las expresiones para pedir y dar una opinión.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: pedir una opinión, la juventud$$,
        'body', $$« Pedir una opinión » consiste en solicitar el punto de vista de alguien sobre un tema: un responsable, por ejemplo, pide la opinión de sus colaboradores antes de tomar una decisión. « La juventud » designa el conjunto de los jóvenes, o bien el periodo de la vida correspondiente: cierto tipo de música es muy apreciado por la juventud.$$,
        'highlights', array[$$pedir una opinión$$, $$la juventud$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulario$$, 'text', $$Pedir una opinión = solicitar el punto de vista de alguien; la juventud = el conjunto de los jóvenes.$$),
        'fixation', jsonb_build_object('question', $$¿Qué significa « pedir una opinión »?$$, 'solution', $$Solicitar el punto de vista de alguien sobre un tema.$$)
      ),
      jsonb_build_object(
        'heading', $$El impacto de la moda en la identidad de los jóvenes$$,
        'body', $$El texto de referencia trata del impacto de la moda sobre la juventud. Una psicóloga afirma que, en su búsqueda de identidad, muchos jóvenes se dejan influenciar en exceso por ciertas publicidades. Según ella, es importante que los jóvenes conserven su propia personalidad y no permitan que la moda, pasajera por naturaleza, determine completamente su identidad.$$,
        'highlights', array[$$moda$$, $$identidad de los jóvenes$$]::text[],
        'fixation', jsonb_build_object('question', $$Según la psicóloga del texto, ¿qué deben evitar los jóvenes respecto a la moda?$$, 'solution', $$Dejarse impactar completamente por la moda, en lugar de conservar su propia personalidad e identidad.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: pedir y dar una opinión$$,
        'body', $$Para pedir una opinión, se usan verbos como opinar, pensar o creer dentro de una oración interrogativa: « ¿Piensas que la moda afecta la identidad de los jóvenes? ». Para dar una opinión, los mismos verbos (y otros como afirmar, declarar, explicar, insistir en, reiterar) se usan en una frase declarativa: « Pienso que... », « Yo reitero mi punto de vista ».$$,
        'highlights', array[$$¿Piensas que...?$$, $$Pienso que...$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Función$$, $$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Pedir opinión$$, $$Verbo + oración interrogativa$$, $$¿Crees que la moda importa tanto?$$),
            jsonb_build_array($$Dar opinión$$, $$Verbo + frase declarativa$$, $$Pienso que cada uno debe ser fiel a sí mismo.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Transforma en pregunta de opinión: « Los jóvenes mexicanos son maravillosos ».$$, 'solution', $$¿Qué opinas de los jóvenes mexicanos?$$),
        'fixation', jsonb_build_object('question', $$Da dos verbos usados para dar una opinión en una frase declarativa.$$, 'solution', $$Por ejemplo « pensar » y « afirmar » (también válido: opinar, creer, declarar, explicar, insistir en, reiterar).$$)
      ),
      jsonb_build_object(
        'heading', $$La moda y la identidad cultural$$,
        'body', $$Un ejemplo interesante es el debate sobre las trenzas africanas: algunas personas las consideran una simple moda pasajera, mientras que otras subrayan que son ante todo un elemento cultural heredado, cargado de significado, y que debe mantenerse por respeto a la propia cultura, y no solo por el deseo de parecerse a otra persona.$$,
        'highlights', array[$$identidad cultural$$, $$elemento cultural$$]::text[],
        'fixation', jsonb_build_object('question', $$Según el texto sobre las trenzas africanas, ¿por qué se deben mantener?$$, 'solution', $$Porque reflejan la propia cultura, y no se deben cambiar solo por parecerse a otra persona.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Con motivo del Día Mundial del Vestido, un periódico organiza un debate en el club de español sobre el tema: « ¿Piensas que la manera de vestir de una persona dice algo de su carácter? ». Debes participar dando tu opinión y justificándola.$$,
      'questions', array[
        $$Cita al menos tres verbos usados para pedir o dar una opinión en español.$$,
        $$Formula una pregunta para pedir la opinión de un compañero sobre la moda.$$,
        $$Da tu propia opinión sobre la pregunta del debate, justificándola con un argumento.$$,
        $$Explica, según la lección, por qué las trenzas africanas no deben considerarse una simple moda.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$¿Qué tipo de oración se usa para pedir una opinión?$$,
      'hint', $$Termina con signos de interrogación.$$,
      'expected', $$Una oración interrogativa.$$
    ),
    jsonb_build_object(
      'question', $$Da un verbo usado para dar una opinión en una frase declarativa.$$,
      'hint', $$Es un verbo muy común, sinónimo de « creer ».$$,
      'expected', $$Por ejemplo « pensar » u « opinar » (también válido: afirmar, declarar, creer).$$
    ),
    jsonb_build_object(
      'question', $$¿Qué advierte la psicóloga del texto sobre la moda y los jóvenes?$$,
      'hint', $$Piensa en la identidad personal.$$,
      'expected', $$Que los jóvenes no deben dejar que la moda afecte o sustituya su propia identidad.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué significa « la juventud »?$$,
      'hint', $$Piensa en un sinónimo de « los jóvenes ».$$,
      'expected', $$El conjunto de los jóvenes (o el periodo de la vida correspondiente).$$
    )
  ),
  now()
);
