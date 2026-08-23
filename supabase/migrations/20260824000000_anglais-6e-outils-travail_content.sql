-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_Unit 4_JOBS AND OCCUPATIONS_Lesson 2_Writing (A farmer works
-- with a hoe)". Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$To exchange with their Liberian pen pals about jobs and professions, 6ème students at Lycée Gouverneur Abdoulaye Fadiga de Touba describe in writing the work tools used by their parents.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: work tools$$,
        'body', $$A hammer, a blood pressure (monitor), a weapon, a comb, a syringe, a hoe, a shovel. Also: a whistle, a stethoscope, a knife, a wood saw, an intravenous drip, a machete, restraints, a pair of scissors.$$,
        'highlights', array[$$hammer, weapon, comb, syringe, hoe, shovel$$, $$whistle, stethoscope, knife, wood saw, machete$$]::text[],
        'fixation', jsonb_build_object('question', $$What tool does a nurse use to give an injection?$$, 'solution', $$A syringe.$$)
      ),
      jsonb_build_object(
        'heading', $$Asking who works with a tool$$,
        'body', $$To ask who uses a tool, we say "Who works with a [tool]?" — answer: "A [job] does" or "[Jobs, plural] do." Example: "Who works with a hammer?" → "A carpenter does" / "Carpenters do." (Carpenters need hammers to do their job.)$$,
        'highlights', array[$$Who works with a [tool]? → A [job] does / [jobs] do$$]::text[],
        'example', jsonb_build_object('statement', $$Who works with a weapon?$$, 'solution', $$"A policeman does." / "Policemen do."$$),
        'fixation', jsonb_build_object('question', $$Who works with a comb?$$, 'solution', $$"A hairdresser does."$$)
      ),
      jsonb_build_object(
        'heading', $$Asking whose tool it is$$,
        'body', $$To ask which job owns a tool, we say "Whose tool is the [tool]?" — answer: "It's the [job]'s." Example: "Whose tool is the wood saw?" → "It's the carpenter's."$$,
        'highlights', array[$$Whose tool is the...? → It's the [job]'s$$]::text[],
        'example', jsonb_build_object('statement', $$Whose tool is the stethoscope? (doctor)$$, 'solution', $$"It's the doctor's."$$),
        'fixation', jsonb_build_object('question', $$Whose tool is the machete? (farmer)$$, 'solution', $$"It's the farmer's."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$As part of training its members about jobs, your school's English Club asks you to write a five-line paragraph naming five jobs you know and a tool linked to each one.$$,
      'questions', array[
        $$Name five jobs you know.$$,
        $$Name a tool linked to each of these jobs.$$,
        $$Write two full sentences using "Who works with...?" and "Whose tool is...?" about tools your own family members use for their work.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Whose tool is the whistle? (policeman)$$,
      'hint', $$Use "It's the [job]'s."$$,
      'expected', $$"It's the policeman's."$$
    ),
    jsonb_build_object(
      'question', $$Whose tool is the knife? (butcher)$$,
      'hint', $$Use "It's the [job]'s."$$,
      'expected', $$"It's the butcher's."$$
    ),
    jsonb_build_object(
      'question', $$Who works with a hoe?$$,
      'hint', $$Think of someone who works the land.$$,
      'expected', $$"A farmer does." / "Farmers do."$$
    ),
    jsonb_build_object(
      'question', $$A carpenter uses a wood saw to cut wood. Complete: "A carpenter works with ______ to cut wood."$$,
      'hint', $$Name the tool.$$,
      'expected', $$"A carpenter works with a wood saw to cut wood."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-outils-travail';
