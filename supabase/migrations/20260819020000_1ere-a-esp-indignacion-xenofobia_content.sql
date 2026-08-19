-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Espagnol, categoryid=120.
-- Moodle course id 1810: "L14 Exprimer l'indignation" (https://lyc.ecole-ci.org/course/view.php?id=1810),
-- resource id 15182. Support: "La violencia xenófoba", in ¡Más allá!
-- Espagnol 1ère p.57. Contenu et exercices ENTIÈREMENT EN ESPAGNOL
-- (immersion linguistique), reformulés/paraphrasés. Faits réels
-- (violences xénophobes de 2019 à Johannesburg, statistique UNICEF
-- d'août 2019 sur les enfants déscolarisés en Afrique de l'Ouest et
-- centrale) repris tels quels ; aucune phrase copiée verbatim du PDF
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-esp-indignacion-xenofobia',
  '1ere',
  'A',
  'espagnol',
  $$Exprimir la indignación: la violencia xenófoba$$,
  14,
  '1ere-a-esp-probabilidad-amazonia',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Durante la ausencia del presidente del club de español, un grupo de miembros tiene malas conductas. Los demás miembros, muy enfadados, deciden escribir un correo electrónico al presidente para informarle, usando las expresiones de indignación.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulario: la indignación, el desempleo, la pobreza$$,
        'body', $$« La indignación » es el sentimiento de cólera ante una injusticia: « Cuando se insulta a un hombre ante sus hijos, experimenta un sentimiento de indignación ». « El desempleo » es la falta de trabajo: « A causa del coronavirus, muchas personas sufren el desempleo ». « La pobreza » es la falta de recursos para vivir dignamente: « Las personas miserables viven en una situación de pobreza ».$$,
        'highlights', array[$$la indignación$$, $$el desempleo$$, $$la pobreza$$]::text[],
        'fixation', jsonb_build_object('question', $$¿Qué es « la indignación »?$$, 'solution', $$El sentimiento de cólera que se experimenta ante una injusticia.$$)
      ),
      jsonb_build_object(
        'heading', $$Gramática: las expresiones de indignación + subjuntivo$$,
        'body', $$Las expresiones de indignación siempre exigen el subjuntivo en la subordinada. Entre ellas: es horrible que, no me parece normal que, cuesta creer que, me parece increíble/incomprensible que, no es posible que, no se puede permitir/tolerar que, me parece imposible/incoherente que, es injusto que, parece mentira que. Ejemplo: « Es horrible que haya tantos actos de xenofobia hoy » (haya = subjuntivo de haber).$$,
        'highlights', array[$$expresiones de indignación + que + subjuntivo (siempre)$$, $$es horrible que, es injusto que, no se puede tolerar que, parece mentira que$$]::text[],
        'example', jsonb_build_object('statement', $$Transforma expresando indignación: « La situación es difícil. »$$, 'solution', $$No es posible que la situación sea difícil. (sea = subjuntivo de ser; también válido: es injusto que la situación sea difícil)$$),
        'fixation', jsonb_build_object('question', $$¿Qué modo verbal exigen siempre las expresiones de indignación?$$, 'solution', $$El subjuntivo.$$)
      ),
      jsonb_build_object(
        'heading', $$La violencia xenófoba en Sudáfrica$$,
        'body', $$En 2019, Sudáfrica, particularmente en Johannesburgo, vivió episodios de violencia xenófoba: algunos sudafricanos atacaron a extranjeros, a los que consideraban (erróneamente) responsables de su pobreza y desempleo. Esta violencia provocó muertos, heridos, incendios de vehículos y el saqueo de comercios, con repercusiones negativas fuera del país. Entre los gobiernos africanos, el de Nigeria fue de los pocos en manifestar formalmente su indignación ante estos hechos. Según UNICEF (agosto de 2019), más de 1,9 millones de niños se han visto obligados a abandonar la escuela en África occidental y central debido al recrudecimiento de los ataques y amenazas de violencia contra las escuelas públicas, los estudiantes y los maestros de la región.$$,
        'highlights', array[$$violencia xenófoba en Sudáfrica (2019, Johannesburgo)$$, $$UNICEF 2019 : +1,9 millones de niños fuera de la escuela en África occidental/central por la violencia$$]::text[],
        'fixation', jsonb_build_object('question', $$Según UNICEF, ¿cuántos niños se han visto obligados a abandonar la escuela en África occidental y central, y por qué?$$, 'solution', $$Más de 1,9 millones de niños, a causa del recrudecimiento de los ataques y las amenazas de violencia contra las escuelas, los estudiantes y los maestros.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lees esta publicación de UNICEF (23 de agosto de 2019): « La educación es la llave de las oportunidades. Pero más de 1,9 millón de niños se han visto obligados a abandonar la escuela en África occidental y central debido al recrudecimiento de los ataques y las amenazas de violencia contra las escuelas públicas, los estudiantes y los maestros en toda la región. » Esta publicación te choca.$$,
      'questions', array[
        $$Cita algunas expresiones de indignación (con subjuntivo).$$,
        $$Redacta un mensaje a un amigo expresando tu indignación ante esta situación, usando al menos tres expresiones diferentes.$$,
        $$Propón una acción concreta que tu club de español podría llevar a cabo para sensibilizar sobre este problema.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con el subjuntivo: « Es injusto que no (tener nosotros) dinero. »$$,
      'hint', $$Subjuntivo de tener.$$,
      'expected', $$Es injusto que no tengamos dinero.$$
    ),
    jsonb_build_object(
      'question', $$Da dos expresiones de indignación además de « es injusto que ».$$,
      'hint', $$Ambas van seguidas de subjuntivo.$$,
      'expected', $$Por ejemplo « no se puede tolerar que » y « me parece increíble que » (otras válidas: cuesta creer que, parece mentira que, no es posible que).$$
    ),
    jsonb_build_object(
      'question', $$¿En qué ciudad sudafricana ocurrieron los episodios de violencia xenófoba de 2019 mencionados en la lección?$$,
      'hint', $$Es la ciudad más grande de Sudáfrica.$$,
      'expected', $$Johannesburgo.$$
    ),
    jsonb_build_object(
      'question', $$Según UNICEF, ¿cuántos niños se vieron obligados a abandonar la escuela en África occidental y central por la violencia?$$,
      'hint', $$Es una cifra en millones.$$,
      'expected', $$Más de 1,9 millones de niños.$$
    )
  ),
  now()
);
