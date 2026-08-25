-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais.
-- Cours : "Unit 2: At Home — Lesson 1: My family tree" (Speaking).
-- Contenu réécrit à partir du PDF source ; vocabulaire, situations et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans la cour du Collège Moderne de Bocanda, des élèves de 5ème discutent des membres de leur famille pour mieux se connaître.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: family members$$,
        'body', $$Key words: grandmother, grandfather, father, mother, brother, sister, uncle, aunt, relative, family tree, cousin, nephew.$$,
        'highlights', array[$$grandmother, grandfather, father, mother, brother, sister, uncle, aunt, cousin$$]::text[],
        'fixation', jsonb_build_object('question', $$What do you call your father's brother?$$, 'solution', $$Uncle.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Identifying people & talking about age$$,
        'body', $$To identify someone: "Who's this? — This is my father." / "What's your father's name? — My father's name's Yao." To talk about age: "How old is your father? — He's forty-eight years old." Numbers 21-100 always need a hyphen when written out (twenty-one, forty-eight, ninety-nine).$$,
        'highlights', array[$$Who's this? / This is my...$$, $$How old is...? / He's/She's ... years old$$, $$numbers 21-99 always hyphenated (twenty-one, forty-eight)$$]::text[],
        'example', jsonb_build_object('statement', $$Ask and answer about "uncle / Charles / 43 years old".$$, 'solution', $$Who's this? — This is my uncle. What's your uncle's name? — My uncle's name's Charles. How old is your uncle? — He's forty-three.$$),
        'fixation', jsonb_build_object('question', $$Write 78 in letters.$$, 'solution', $$Seventy-eight.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Talking about the number of family members$$,
        'body', $$To ask how many relatives someone has: "How many brothers do you have? — I have six brothers." This structure works with any family member in the plural (sisters, uncles, grandmothers...).$$,
        'highlights', array[$$How many [family members] do you have? / I have [number] [family members]$$]::text[],
        'fixation', jsonb_build_object('question', $$Ask how many sisters someone has, knowing the answer is "two".$$, 'solution', $$How many sisters do you have? — I have two sisters.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your American friend wants to know about your family. You decide to write him a short e-mail introducing your family members.$$,
      'questions', array[
        $$Mention your name and your age.$$,
        $$Tell him the names of your father and mother, and the number of brothers and sisters you have.$$,
        $$Give the names and ages of your brothers and sisters.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$What is "the daughter of my father's brother" called?$$,
      'hint', $$Think of your uncle's children.$$,
      'expected', $$My cousin.$$
    ),
    jsonb_build_object(
      'question', $$Translate: "Ma mère a quarante-six ans."$$,
      'hint', $$Use "years old" and the hyphenated number.$$,
      'expected', $$My mother is forty-six years old.$$
    ),
    jsonb_build_object(
      'question', $$Ask "Comment s'appelle ton grand-père ?" in English.$$,
      'hint', $$Use the possessive "'s".$$,
      'expected', $$What's your grandfather's name?$$
    ),
    jsonb_build_object(
      'question', $$How do you write 85 in letters?$$,
      'hint', $$Use a hyphen.$$,
      'expected', $$Eighty-five.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-famille';
