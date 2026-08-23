-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle course id 1384: "6è_Unit 2: AT HOME_Lesson 1_Speaking (Armel's
-- family)" (https://coll.ecole-ci.org/course/view.php?id=1384). Contenu
-- réécrit à partir du PDF source (Learn it, do it 6è, programme officiel
-- MENA) ; situation d'apprentissage, vocabulaire, dialogues et exercices
-- reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$During an English Club meeting at Lycée Gouverneur Abdoulaye Fadiga de Touba, 6ème students talk about the members of their families to get to know each other better.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Family vocabulary$$,
        'body', $$Family, family tree, parents, children, father, mother, sister, brother, son, daughter. In a family tree: parents are the father and mother; children are their sons and daughters. A wife is a married woman, a husband is a married man.$$,
        'highlights', array[$$parents = father + mother ; children = sons + daughters$$, $$wife (married woman) ; husband (married man)$$]::text[],
        'fixation', jsonb_build_object('question', $$If Marc is the son of Jean and Lucie, and Armel is their daughter, what is Marc to Armel?$$, 'solution', $$Marc is Armel's brother.$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about family with "have got"$$,
        'body', $$To ask how many siblings someone has, we say "How many brothers have you got?" — the answer uses "have got" (short form "'ve got"): "I have got one brother" / "I've got one brother."$$,
        'highlights', array[$$How many...have you got? → I have got.../I've got...$$]::text[],
        'example', jsonb_build_object('statement', $$Answer the question "How many brothers has Armel got?" knowing Armel has one brother, Marc.$$, 'solution', $$"Armel has got one brother." / "He has got one brother." / "He's got one brother."$$),
        'fixation', jsonb_build_object('question', $$What is the short form of "I have got"?$$, 'solution', $$"I've got".$$)
      ),
      jsonb_build_object(
        'heading', $$Extended family and asking about age$$,
        'body', $$Extended family words: woman, man, grandparents, grandfather, grandmother, aunt (your mother's or father's sister), uncle (your mother's or father's brother), cousin (the child of your aunt or uncle), nephew (the child of your brother or sister). Numbers from 21 to 100: twenty-one, thirty, thirty-two, forty, fifty, sixty, seventy, eighty, ninety, one hundred. To ask someone's age: "How old are you?" — answer: "I am twelve years old" / "I'm twelve."$$,
        'highlights', array[$$aunt = sœur du père/mère ; uncle = frère du père/mère$$, $$cousin = enfant de l'oncle/tante ; nephew = enfant du frère/sœur$$, $$How old are you? → I am [number] years old$$]::text[],
        'example', jsonb_build_object('statement', $$Kofi is 22 years old. Answer: "How old is Kofi?"$$, 'solution', $$"He is twenty-two years old." / "He is twenty-two."$$),
        'fixation', jsonb_build_object('question', $$What do we call the child of your aunt or uncle?$$, 'solution', $$A cousin.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$During an English Club meeting, the Club president asks 6ème students to talk about the members of their respective families.$$,
      'questions', array[
        $$Draw your family tree.$$,
        $$Give the age of the members of your family.$$,
        $$Describe to the other Club members the relationships between you and the other members of your family.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fatim, Seydou and Bakary are the children of Issa and Rokia. What are Issa and Rokia to them?$$,
      'hint', $$Think of the general word for mother and father together.$$,
      'expected', $$They are their parents.$$
    ),
    jsonb_build_object(
      'question', $$How do you ask someone how many sisters they have, and answer if you have two?$$,
      'hint', $$Use "have got".$$,
      'expected', $$"How many sisters have you got?" — "I have got two sisters." / "I've got two sisters."$$
    ),
    jsonb_build_object(
      'question', $$What is the child of your brother or sister called?$$,
      'hint', $$It's not "cousin" — that's a different relation.$$,
      'expected', $$A nephew (or niece for a girl).$$
    ),
    jsonb_build_object(
      'question', $$Write the number 85 in letters.$$,
      'hint', $$Combine "eighty" and the unit.$$,
      'expected', $$Eighty-five.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-famille';
