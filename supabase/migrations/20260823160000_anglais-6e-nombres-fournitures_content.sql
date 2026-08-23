-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle course id 1387: "6è_Unit 1_AT SCHOOL_lesson 3_Speaking (There is
-- one pencil on the table)"
-- (https://coll.ecole-ci.org/course/view.php?id=1387), resource id 9080.
-- Contenu réécrit à partir du PDF source (Learn it, do it 6è, programme
-- officiel MENA) ; situation d'apprentissage, vocabulaire, dialogues et
-- exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During English class at Collège Moderne de Koonan, to show their knowledge of classroom object locations, 6ème students locate them through a game.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Numbers 0 to 20$$,
        'body', $$0 zero, 1 one, 2 two, 3 three, 4 four, 5 five, 6 six, 7 seven, 8 eight, 9 nine, 10 ten, 11 eleven, 12 twelve, 13 thirteen, 14 fourteen, 15 fifteen, 16 sixteen, 17 seventeen, 18 eighteen, 19 nineteen, 20 twenty.$$,
        'highlights', array[$$0-10: zero to ten$$, $$11-20: eleven to twenty$$]::text[],
        'fixation', jsonb_build_object('question', $$How do you write 16 in letters?$$, 'solution', $$Sixteen.$$)
      ),
      jsonb_build_object(
        'heading', $$Asking and giving the number$$,
        'body', $$To ask how many of something there are, we say "How many [objects] are there?" — the answer uses "There are..." for more than one, or "There is..." for exactly one. If there are none, we say "There are no [objects]."$$,
        'highlights', array[$$How many...are there? → There are... (plural) / There is... (singular)$$, $$none → There are no...$$]::text[],
        'example', jsonb_build_object('statement', $$Someone asks "How many boards are there?" and there is only one. How do you answer?$$, 'solution', $$"There is one board."$$),
        'fixation', jsonb_build_object('question', $$How do you answer "How many chairs are there?" if there are none?$$, 'solution', $$"There are no chairs."$$)
      ),
      jsonb_build_object(
        'heading', $$Locating objects: prepositions of place$$,
        'body', $$To ask where something is, we say "Where is the [object]?" — answers use prepositions: "It is on the table" (on top of), "It is in the schoolbag" (inside), "It is under the table" (beneath), "It is in front of the table" (facing it), "It is behind the table" (at the back), or "It is between the table and the chair" (in the middle of two things).$$,
        'highlights', array[$$on = sur ; in = dans ; under = sous$$, $$in front of = devant ; behind = derrière ; between = entre$$]::text[],
        'example', jsonb_build_object('statement', $$A ruler is inside the schoolbag. How do you answer "Where is the ruler?"$$, 'solution', $$"It is in the schoolbag."$$),
        'fixation', jsonb_build_object('question', $$Which preposition do you use when an object is placed between two other things?$$, 'solution', $$"Between" (e.g., "It is between the table and the chair.")$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The English Club of Collège Moderne de Koonan organizes a competition for 6ème students about identifying and locating school supplies donated by an American NGO to the school.$$,
      'questions', array[
        $$Name a few school supplies.$$,
        $$Identify some of the items provided to the school.$$,
        $$Build a dialogue in which you ask and answer questions about the location of the items the school just received.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Write the number 13 in letters.$$,
      'hint', $$It comes right after "twelve".$$,
      'expected', $$Thirteen.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "A: How many chalks are there? B: ______ three chalks."$$,
      'hint', $$Use the plural form.$$,
      'expected', $$"There are three chalks."$$
    ),
    jsonb_build_object(
      'question', $$A book is under the table. Answer: "Where is the book?"$$,
      'hint', $$Use the preposition for "beneath".$$,
      'expected', $$"It is under the table."$$
    ),
    jsonb_build_object(
      'question', $$A dog is facing the table (on the near side). Which preposition describes its position?$$,
      'hint', $$It is the opposite of "behind".$$,
      'expected', $$"In front of" — "It is in front of the table."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-nombres-fournitures';
