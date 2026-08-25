-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais.
-- Cours : "Unit 1: At School — Lesson 1: Discovering my school" (Speaking).
-- Contenu réécrit à partir du PDF source ; vocabulaire, situations et
-- exercices reformulés. Note : le titre du catalogue local est "La
-- salle de classe (In the classroom)" ; le contenu réel couvre le
-- vocabulaire des lieux de l'école (staffroom, library, canteen...),
-- le sujet le plus proche disponible sur la plateforme source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves d'une classe de 5ème du Collège Moderne de Dimbokro reçoivent des correspondants anglophones. Ils leur font visiter les différents bâtiments pour leur faire découvrir leur école.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: places in the school$$,
        'body', $$Key words: a school, a staffroom (salle des professeurs), a library (bibliothèque), a science laboratory, the headmaster's office (bureau du directeur), a canteen (cantine), a school yard, an infirmary, a playground, a gate, a conference room.$$,
        'highlights', array[$$staffroom, library, science laboratory, headmaster's office, canteen$$, $$school yard, infirmary, playground, gate, conference room$$]::text[],
        'fixation', jsonb_build_object('question', $$Where do teachers meet to prepare their lessons?$$, 'solution', $$In the staffroom.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking and giving directions$$,
        'body', $$To ask for a location: "Can you tell me where the library is?" To answer using prepositions of place: "It is behind the canteen." / "It is next to the canteen." / "It is in front of / on the left of / on the right of / between..."$$,
        'highlights', array[$$Can you tell me where the ... is? → It is behind / in front of / next to / between / on the left (right) of ...$$]::text[],
        'example', jsonb_build_object('statement', $$Ask where the science lab is, knowing it's behind the library.$$, 'solution', $$Can you tell me where the science lab is? — It is behind the library.$$),
        'fixation', jsonb_build_object('question', $$Ask where the toilets are, knowing they are next to the classrooms.$$, 'solution', $$Can you tell me where the toilets are? — They are next to the classrooms.$$)
      ),
      jsonb_build_object(
        'heading', $$Matching places with their function$$,
        'body', $$Each place at school has a function: students urinate in the restrooms; teachers meet in the staffroom; you have lunch at the canteen; you can see the nurse at the infirmary; the headmaster receives people at his office; pupils read books in the library.$$,
        'highlights', array[$$restrooms=toilettes, staffroom=salle des profs, canteen=cantine, infirmary=infirmerie, office=bureau, library=bibliothèque$$]::text[],
        'fixation', jsonb_build_object('question', $$Where can you see the nurse?$$, 'solution', $$At the infirmary.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your Liberian friend Weha is visiting you. He asks you to take him round your school.$$,
      'questions', array[
        $$Show him where the office, the library, and the canteen are located, using prepositions of place.$$,
        $$Explain what people do in each of these places.$$,
        $$Answer his question: "Is there a canteen in your school?"$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Pouvez-vous me dire où se trouve la bibliothèque ?"$$,
      'hint', $$Use "Can you tell me where...".$$,
      'expected', $$Can you tell me where the library is?$$
    ),
    jsonb_build_object(
      'question', $$Complete: "At school, teachers meet in the ___."$$,
      'hint', $$It's the room reserved for teachers.$$,
      'expected', $$staffroom.$$
    ),
    jsonb_build_object(
      'question', $$Where do students have lunch at school?$$,
      'hint', $$It's the eating place.$$,
      'expected', $$At the canteen.$$
    ),
    jsonb_build_object(
      'question', $$Give the opposite location word: if the canteen is "in front of" the football ground, what would you say if it were on the other side?$$,
      'hint', $$Think of the opposite of "in front of".$$,
      'expected', $$Behind.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-salle-de-classe';
