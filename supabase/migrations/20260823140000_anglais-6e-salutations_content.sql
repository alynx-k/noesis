-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle course id 1412: "6è_Unit 1_AT SCHOOL_Lesson 1_Speaking (Greetings)"
-- (https://coll.ecole-ci.org/course/view.php?id=1412), resource id 9368.
-- Contenu réécrit à partir du PDF source (Learn it, do it 6è, programme
-- officiel MENA) ; situation d'apprentissage, vocabulaire, dialogues et
-- exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$We are in the schoolyard of Collège Moderne Konan. After their first English class, the 6ème students greet each other and introduce themselves to get to know one another better.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: greetings for each time of day$$,
        'body', $$Good morning (00:00–12:00), Good afternoon (13:00–17:00), Good evening (18:00–21:00), Good night (22:00–00:00). We also use Hello / Hi to greet someone, and Good bye / Bye bye to say goodbye, at any time of day.$$,
        'highlights', array[$$Good morning / afternoon / evening / night — tied to the time of day$$, $$Hello, Hi (anytime) ; Good bye, Bye bye (anytime)$$]::text[],
        'fixation', jsonb_build_object('question', $$Which greeting do you use at 15:00?$$, 'solution', $$Good afternoon.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: introducing oneself$$,
        'body', $$To ask someone's name, we say "What's your name?" — the answer can be "My name is Bamba" or simply "I am Bamba." To react politely when meeting someone, we say "Nice to meet you!", and the other person answers "Nice to meet you too."$$,
        'highlights', array[$$What's your name? → My name is... / I am...$$, $$Nice to meet you! → Nice to meet you too.$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: Teacher: "Good morning! What's your name?" Student: "..."$$, 'solution', $$"Good morning sir. My name is Adjoumani."$$),
        'fixation', jsonb_build_object('question', $$How do you answer "Nice to meet you!"?$$, 'solution', $$"Nice to meet you too."$$)
      ),
      jsonb_build_object(
        'heading', $$Introducing someone else and asking how they are$$,
        'body', $$To introduce a third person, we say "This is Yannis" (or "This is Malika"). To ask about a boy/man's name we say "What is his name?" — answer: "His name is Yannis" or "He is Yannis." For a girl/woman: "What is her name?" — answer: "Her name is Malika" or "She is Malika." To ask how someone is doing: "How are you?" — answer: "I am fine, thanks" or "I am very well, thanks."$$,
        'highlights', array[$$his = for a boy/man ; her = for a girl/woman$$, $$How are you? → I am fine / very well, thanks$$]::text[],
        'example', jsonb_build_object('statement', $$Edi asks Traoré where he is from. Traoré is from Tingrela. How does Traoré answer?$$, 'solution', $$"I am from Tingrela."$$),
        'fixation', jsonb_build_object('question', $$This is Malika. What is her name, and how do you say it with "She"?$$, 'solution', $$Her name is Malika. / She is Malika.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$We are in the schoolyard of Collège Moderne de Koonan. After the first class, 6ème students greet each other and introduce themselves in English to get to know one another.$$,
      'questions', array[
        $$Greet your classmates in English.$$,
        $$Introduce yourself to one another.$$,
        $$Introduce someone you already know to the others (use "This is...", "His/Her name is...").$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What greeting do you use at 21:16?$$,
      'hint', $$It is evening.$$,
      'expected', $$Good evening.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "A: My name is Mr. Kamagaté, what is ______ name? B: My name ______ Silué."$$,
      'hint', $$Think of "your" and "is".$$,
      'expected', $$"what is your name?" / "my name is Silué."$$
    ),
    jsonb_build_object(
      'question', $$Match: "What's your name?" with the correct answer.$$,
      'hint', $$It's a direct answer giving a name.$$,
      'expected', $$"My name is X."$$
    ),
    jsonb_build_object(
      'question', $$Complete with his/her: "This is Felix. ______ name is Felix."$$,
      'hint', $$Felix is a boy's name.$$,
      'expected', $$His name is Felix.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-salutations';
