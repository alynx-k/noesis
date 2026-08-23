-- FALLBACK CONTENT: this lesson ("L'eau et la santé", Unit 7 Lesson 3 in
-- the official catalog sequence) does not exist as a distinct real lesson
-- on coll.ecole-ci.org (Collège Numérique) — Unit 7 there only covers
-- "Body hygiene" and "Insalubrity and common diseases" (both already
-- sourced). Written from general knowledge of the standard Ivorian 6ème
-- Anglais programme (MENA), following the same vocabulary/must-should
-- register used in the neighbouring real lessons of this unit.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$As part of the English Club's "Water and Health" awareness day at Collège Municipal Koro, 6ème students learn about safe water and its link to health.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: water and health$$,
        'body', $$Clean water, dirty water, safe water, tap, well, river, to boil, to filter, mosquito net, disease.$$,
        'highlights', array[$$clean water, dirty water, safe water$$, $$tap, well, river, to boil, to filter$$]::text[],
        'fixation', jsonb_build_object('question', $$Where can you get safe water at home?$$, 'solution', $$"From a tap."$$)
      ),
      jsonb_build_object(
        'heading', $$Talking about what we must and mustn't do with water$$,
        'body', $$We must drink clean or safe water. We must filter or boil water from a well or a river before drinking it. We mustn't drink water directly from a river. We mustn't keep dirty water near the house.$$,
        'highlights', array[$$must drink clean/safe water ; must filter/boil river or well water$$, $$mustn't drink river water directly ; mustn't keep dirty water near the house$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "We ______ boil water from a well before drinking it."$$, 'solution', $$"We must boil water from a well before drinking it."$$),
        'fixation', jsonb_build_object('question', $$Complete: "People ______ drink dirty water."$$, 'solution', $$"People mustn't drink dirty water."$$)
      ),
      jsonb_build_object(
        'heading', $$Giving advice about water-related diseases$$,
        'body', $$Drinking dirty water can cause diseases such as diarrhea. To ask for advice: "What should I do?" — to give advice: "You should drink safe water." "You should filter your water." "You should keep water containers covered."$$,
        'highlights', array[$$dirty water → diseases like diarrhea$$, $$What should I do? → You should drink safe/filtered water$$]::text[],
        'example', jsonb_build_object('statement', $$I have diarrhea. What should I do?$$, 'solution', $$"You should drink safe water and see a doctor."$$),
        'fixation', jsonb_build_object('question', $$What should you do before drinking water from a well?$$, 'solution', $$"You should filter or boil it."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$For the English Club's "Water and Health" day, you are asked to explain to younger students why clean water matters for health.$$,
      'questions', array[
        $$Name two sources of water (safe and unsafe).$$,
        $$Say two things people must do, and two things people mustn't do, regarding water.$$,
        $$Give a piece of advice to someone who only has access to river water.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "We ______ drink clean water to stay healthy."$$,
      'hint', $$Use "must" for obligation.$$,
      'expected', $$"We must drink clean water to stay healthy."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "People ______ keep dirty water near the house."$$,
      'hint', $$Use "mustn't" for prohibition.$$,
      'expected', $$"People mustn't keep dirty water near the house."$$
    ),
    jsonb_build_object(
      'question', $$My brother has diarrhea from drinking river water. What should he do?$$,
      'hint', $$Use "should" to give advice.$$,
      'expected', $$"He should see a doctor and drink safe water."$$
    ),
    jsonb_build_object(
      'question', $$Name one way to make river water safer to drink.$$,
      'hint', $$Think of a cooking-related method.$$,
      'expected', $$"Boil it." (or "Filter it.")$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-eau-sante';
