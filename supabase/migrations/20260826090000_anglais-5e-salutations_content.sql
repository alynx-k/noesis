-- Contenu de secours (fallback) : aucun PDF source correspondant à cette
-- leçon n'a pu être retrouvé sur coll.ecole-ci.org (lien indisponible).
-- Contenu rédigé à partir du programme éducatif officiel DPFC de 5ème
-- (Anglais, compétence "Greetings"), dans le registre des leçons voisines.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le premier jour de la rentrée, un élève de 5ème rencontre un nouveau correspondant anglophone au collège. Ils doivent apprendre à se saluer et à se présenter correctement en anglais.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: greetings$$,
        'body', $$Key words: Good morning, Good afternoon, Good evening, Good night, Hello, Hi, Goodbye, See you later, Nice to meet you. These greetings change depending on the time of day.$$,
        'highlights', array[$$Good morning/afternoon/evening/night$$, $$Hello, Hi, Goodbye, See you later$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you say to greet someone at 8 p.m.?$$, 'solution', $$Good evening.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Introducing yourself and others$$,
        'body', $$To introduce yourself: "Hello, my name is Kouassi. What's your name? — My name is Ama." To introduce someone else: "This is my friend Ama." / "Nice to meet you."$$,
        'highlights', array[$$My name is.../ What's your name?$$, $$This is... / Nice to meet you.$$]::text[],
        'example', jsonb_build_object('statement', $$Introduce your classmate Yao to a new student.$$, 'solution', $$This is my friend Yao. — Nice to meet you, Yao.$$),
        'fixation', jsonb_build_object('question', $$How do you ask someone's name in English?$$, 'solution', $$What's your name?$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking how someone is$$,
        'body', $$To ask about someone's well-being: "How are you? — I'm fine, thank you. And you?" This is a common way to continue a conversation after greeting someone.$$,
        'highlights', array[$$How are you? / I'm fine, thank you. And you?$$]::text[],
        'fixation', jsonb_build_object('question', $$Answer: "How are you?" (you are well)$$, 'solution', $$I'm fine, thank you. And you?$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le premier jour de classe, tu rencontres un nouvel élève venu du Ghana dans ta cour de collège.$$,
      'questions', array[
        $$Salue-le en fonction de l'heure de la journée.$$,
        $$Demande-lui son nom et présente le tien.$$,
        $$Demande-lui comment il va et réponds à sa question.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Bonjour ! Comment t'appelles-tu ?"$$,
      'hint', $$Use "Hello" and "What's your name?"$$,
      'expected', $$Hello! What's your name?$$
    ),
    jsonb_build_object(
      'question', $$What do you say to greet someone in the morning?$$,
      'hint', $$Think of the time of day.$$,
      'expected', $$Good morning.$$
    ),
    jsonb_build_object(
      'question', $$How do you say goodbye informally?$$,
      'hint', $$It's a short, friendly way of leaving.$$,
      'expected', $$Bye! / See you later.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Enchanté de te rencontrer."$$,
      'hint', $$Used right after being introduced.$$,
      'expected', $$Nice to meet you.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-salutations';
