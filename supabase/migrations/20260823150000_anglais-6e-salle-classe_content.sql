-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle course id 1389: "6è_Unit 1_AT SCHOOL_Lesson 2_Speaking (In the
-- classroom)" (https://coll.ecole-ci.org/course/view.php?id=1389), resource
-- id 9104. Contenu réécrit à partir du PDF source (Learn it, do it 6è,
-- programme officiel MENA) ; situation d'apprentissage, vocabulaire,
-- dialogues et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During an English class at Collège Moderne de Koonan, the 6ème students identify classroom objects and their location through a question-and-answer game.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: classroom objects$$,
        'body', $$Classroom, board, pen, duster, table, window, door, chair, book, schoolbag. These are the everyday objects and places a student can name in class.$$,
        'highlights', array[$$classroom, board, pen, duster, table$$, $$window, door, chair, book, schoolbag$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you use to erase the board?$$, 'solution', $$A duster.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: asking and giving information about objects$$,
        'body', $$To ask about something near you, we say "What is this?" — the answer is "This is a..." or "It is a..." (short form: "It's a..."). To ask about something farther away, we say "What is that?" — the answer is "That is a..." or "It is a...".$$,
        'highlights', array[$$this (near) → What is this? This is/It is a...$$, $$that (far) → What is that? That is/It is a...$$]::text[],
        'example', jsonb_build_object('statement', $$Someone points at a duster nearby and asks "What is this?" How do you answer?$$, 'solution', $$"This is a duster." (or "It is a duster" / "It's a duster.")$$),
        'fixation', jsonb_build_object('question', $$Complete: "What is that? ______ a chair."$$, 'solution', $$"That is a chair." (or "It is a chair.")$$)
      ),
      jsonb_build_object(
        'heading', $$More vocabulary and answering yes/no questions$$,
        'body', $$Additional words: school, piece of chalk, box of chalk, desk, teacher, pupils, girl, boy. To answer a yes/no question about an object: "Is it a chair?" → "Yes, it is" / "No, it isn't." To answer about a person: "Are you a boy?" → "Yes, I am" / "No, I'm not." For a third person: "Is she a girl?" → "Yes, she is" / "No, she isn't."$$,
        'highlights', array[$$Is it a...? → Yes, it is / No, it isn't$$, $$Are you a...? → Yes, I am / No, I'm not$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "Is this a table?" (pointing at a chair)$$, 'solution', $$"No, it isn't. It's a chair."$$),
        'fixation', jsonb_build_object('question', $$How do you answer "Is she a girl?" if the answer is negative?$$, 'solution', $$"No, she isn't." (or "No, she is not.")$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$At the end of your first week of English classes, you meet a 6ème student from Collège Moderne Alassane Ouattara de Ouaninou. Through a dialogue, talk to them about your English teacher and your classroom.$$,
      'questions', array[
        $$Introduce yourself to the student you just met.$$,
        $$Ask for their name and their English teacher's name.$$,
        $$Name objects found in your classroom and say where they are located.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Unscramble the letters to find a classroom object: DROAB$$,
      'hint', $$It's something the teacher writes on.$$,
      'expected', $$BOARD.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "A: Is this a table? B: No, it ______."$$,
      'hint', $$Use the contracted negative form of "is not".$$,
      'expected', $$"No, it isn't."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Teacher: Are you a teacher? Ali: No, I'm not; I am a ______."$$,
      'hint', $$Ali is a student.$$,
      'expected', $$"I am a pupil."$$
    ),
    jsonb_build_object(
      'question', $$What is the difference between "What is this?" and "What is that?"$$,
      'hint', $$It depends on distance from the speaker.$$,
      'expected', $$"This" is used for something close to the speaker, "that" for something farther away.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-salle-classe';
