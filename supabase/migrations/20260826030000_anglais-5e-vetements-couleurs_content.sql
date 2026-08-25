-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Anglais. Cours : "Unit 5: Clothes and Colours — Lesson 2: Colours".
-- Contenu réécrit à partir du PDF source ; vocabulaire, situations et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 5ème écoutent un débat d'adolescents sur les couleurs à la radio BBC, pour participer ensuite à une discussion sur les vêtements et les couleurs préférées des jeunes d'aujourd'hui.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: colours$$,
        'body', $$Key words: black, white, orange, green, blue, purple, yellow, red, pink. Dark and light colours are formed with "dark" and "light" before the colour: dark green, dark blue, light blue, light green.$$,
        'highlights', array[$$black, white, orange, green, blue, purple, yellow, red, pink$$, $$dark + colour ; light + colour$$]::text[],
        'fixation', jsonb_build_object('question', $$How do you say "vert clair" in English?$$, 'solution', $$Light green.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Asking and giving colours$$,
        'body', $$To ask about a colour: "What colour is it? — It's blue." / "Is it green? — Yes, it is. / No, it isn't, it's red."$$,
        'highlights', array[$$What colour is it? / It's...$$, $$Is it [colour]? / Yes, it is. — No, it isn't, it's...$$]::text[],
        'fixation', jsonb_build_object('question', $$Answer: "Is it purple?" (it's actually orange)$$, 'solution', $$No, it isn't, it's orange.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Expressing preferences$$,
        'body', $$To express a preference between two things, use "prefer/prefers ... to ...": "Awa prefers dark purple bazin to blue one." "I prefer dark colours to light ones."$$,
        'highlights', array[$$subject + prefer(s) + [chose A] + to + [chose B]$$]::text[],
        'example', jsonb_build_object('statement', $$Rewrite: "My sister likes light green tee-shirts more than dark green ones."$$, 'solution', $$My sister prefers light green tee-shirts to dark green ones.$$),
        'fixation', jsonb_build_object('question', $$Complete: "I ___ the light blue tee-shirt ___ the light purple one." (prefer/to)$$, 'solution', $$prefer... to.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English teacher presents a dialogue between Yeboah and Opokou, two Ghanaian teenagers talking about the clothes and colours they prefer.$$,
      'questions', array[
        $$What clothes and colours does Yeboah prefer?$$,
        $$What clothes and colours does Opokou prefer?$$,
        $$What are your own favourite colours? Use "prefer ... to ..." to explain your choice.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "Je préfère les couleurs foncées aux couleurs claires."$$,
      'hint', $$Use "prefer ... to ...".$$,
      'expected', $$I prefer dark colours to light ones.$$
    ),
    jsonb_build_object(
      'question', $$What colour do you get by mixing red and white light shades?$$,
      'hint', $$It's a light shade of red.$$,
      'expected', $$Pink.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "___ colour is your shirt? — It's yellow."$$,
      'hint', $$Question word for asking about colours.$$,
      'expected', $$What.$$
    ),
    jsonb_build_object(
      'question', $$Answer negatively: "Is your bag black?" (it's actually white)$$,
      'hint', $$Use "No, it isn't...".$$,
      'expected', $$No, it isn't, it's white.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-vetements-couleurs';
