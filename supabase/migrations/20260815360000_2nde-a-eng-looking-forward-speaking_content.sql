-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1438: "Unit 4_Looking forward_ Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=1438)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10754,
-- redirecting to pluginfile "Unit 4_Looking forward_ Speaking.pdf" (Far
-- Ahead, seconde). Read directly in the browser PDF viewer (page-by-page
-- screenshots, zoomed in where needed); no file was persisted to disk.
-- Rewritten/paraphrased from the source worksheet: the energy-source
-- vocabulary (firewood, oil, coal, greenhouse effect, wind, dam, natural
-- gas, biofuel, solar, nuclear, geothermal), the -able/-ible
-- suffix-formation language function, the "circle the correct word" and
-- "complete with -able/-ible" activity types, and the closing speaking
-- tasks (an oral survey report on local energy sources and a magazine
-- article about new forms of energy). 100% original wording; no sentence
-- copied from the source. Course content and exercises are entirely in
-- English by design: this is an English-immersion lesson, not a lesson
-- about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-looking-forward-speaking',
  '2nde',
  'A',
  'anglais',
  $$Unit 4 - Looking Forward: Speaking About Energy Sources$$,
  7,
  '2nde-a-eng-technology-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A picture shows several non-conventional sources of energy: wind turbines, solar panels and other renewable installations. Students discuss what they see and what people produce with such equipment. After attending a school conference on energy sources, they must now discuss, in English, the different types of energy and their impact on everyday life.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: sources of energy$$,
        'body', $$Firewood is wood that is cut and burned to make a fire. Oil is a thick, dark liquid found underground and used to produce petrol. Coal is a hard, black mineral that is burned to produce heat. The greenhouse effect is the gradual warming of the air caused by heat trapped due to pollution. Wind is simply moving air, which can be captured by turbines. A dam is a special construction built across a river to stop the water and use its force to produce electricity.$$,
        'highlights', array[$$firewood$$, $$greenhouse effect$$, $$dam$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Firewood$$, $$Wood cut and burned to make a fire$$),
            jsonb_build_array($$Oil$$, $$Thick, dark underground liquid used to produce petrol$$),
            jsonb_build_array($$Coal$$, $$Hard, black mineral burned to produce heat$$),
            jsonb_build_array($$Greenhouse effect$$, $$Gradual warming of the air caused by pollution$$),
            jsonb_build_array($$Wind$$, $$Moving air, captured by turbines for energy$$),
            jsonb_build_array($$Dam$$, $$Construction across a river used to produce electricity$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What natural resource does a dam use to produce electricity?$$, 'solution', $$The force of water blocked and released across a river.$$)
      ),
      jsonb_build_object(
        'heading', $$Forming words with -able and -ible$$,
        'body', $$English can turn many verbs into adjectives expressing possibility by adding the suffix -able or -ible, roughly meaning "that can be...". For example, "accept" becomes "acceptable" (that can be accepted), and "sustain" becomes "sustainable" (that can be sustained/kept going). Some words instead take -ible, like "combust" becoming "combustible" (that can burn). A resource that cannot be replaced is therefore "not replaceable".$$,
        'highlights', array[$$-able$$, $$-ible$$, $$sustainable$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$Adjective$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Accept$$, $$Acceptable$$),
            jsonb_build_array($$Sustain$$, $$Sustainable$$),
            jsonb_build_array($$Combust$$, $$Combustible$$),
            jsonb_build_array($$Renew$$, $$Renewable$$),
            jsonb_build_array($$Convert$$, $$Convertible$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Form an adjective from the verb "renew" that describes a resource that replaces itself naturally.$$, 'solution', $$Renewable.$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: recognising energy facts$$,
        'body', $$A common activity gives you two possible words and asks you to circle the one that correctly completes a true statement about energy. For example: "Natural gas / Firewood comes from underground and is mainly composed of methane" (the correct choice is "Natural gas"), or "The greatest part of electricity in Côte d'Ivoire comes from wind / dams" (the correct choice is "dams"). This kind of exercise checks that you both understand the vocabulary and know some real facts about energy sources.$$,
        'highlights', array[$$fact-checking$$, $$energy sources$$]::text[],
        'example', jsonb_build_object('statement', $$Choose the correct word: "Oil / Coal is a black rock which is extracted underground."$$, 'solution', $$"Coal" is the black rock extracted underground; oil is a liquid, not a rock.$$),
        'fixation', jsonb_build_object('question', $$Which word correctly completes: "Geothermal / Solar energy is heat from the Earth"?$$, 'solution', $$"Geothermal" energy is heat from the Earth; solar energy comes from the sun.$$)
      ),
      jsonb_build_object(
        'heading', $$Practice: completing sentences with -able / -ible words$$,
        'body', $$Once you can form -able/-ible adjectives, you can use them to complete real sentences about energy and other topics, changing the base verb given in brackets into its adjective form. For example: "Poaching some animal species is punishable by law" (from "punish"), or "A renewable energy source replaces itself naturally" (from "renew").$$,
        'highlights', array[$$suffix practice$$]::text[],
        'example', jsonb_build_object('statement', $$Complete: "Oil can be changed into gas. It is a __________ resource." (convert)$$, 'solution', $$"It is a convertible resource."$$),
        'fixation', jsonb_build_object('question', $$Complete: "Some viral diseases like Ebola are not __________ ." (cure)$$, 'solution', $$"...are not curable."$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: reporting a survey on local energy use$$,
        'body', $$To find out which types of energy are used most in your area, the English Club conducts a survey among families. As the spokesperson, you must report the findings orally: list the sources of energy most families use, explain which of them are clean and which are not, and suggest actions that could be taken to promote better sources of energy.$$,
        'highlights', array[$$oral report$$, $$clean energy$$]::text[],
        'fixation', jsonb_build_object('question', $$Give one action a community could take to promote better sources of energy.$$, 'solution', $$For example: encouraging the use of solar panels, or providing subsidies for cleaner cooking fuel instead of firewood.$$)
      ),
      jsonb_build_object(
        'heading', $$Writing task: an article about new forms of energy$$,
        'body', $$After a government decides to reduce the price of a fuel to help more families access it, an English Club magazine might ask you to write a short article about different forms of energy and their advantages: list some newer forms of energy, mention their advantages, and suggest ways to encourage more people to use them.$$,
        'highlights', array[$$magazine article$$, $$new forms of energy$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one newer form of energy you could mention in such an article, and one advantage of it.$$, 'solution', $$For example: solar energy, which is renewable and does not produce the greenhouse effect the way coal does.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$As spokesperson for your school's English Club, you must give an oral report on a survey of the types of energy your community uses, including which are clean and which are not.$$,
      'questions', array[
        $$List three sources of energy commonly used by families in your area.$$,
        $$Explain, for two of these sources, whether they are clean or not, and why.$$,
        $$Form the adjective from "renew" and use it in a sentence about one of these sources.$$,
        $$Suggest one action that could help promote cleaner sources of energy in your community.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What is coal?$$,
      'hint', $$Think of a hard, black mineral.$$,
      'expected', $$A hard, black mineral that is burned to produce heat.$$
    ),
    jsonb_build_object(
      'question', $$Form the adjective from the verb "accept" using the -able suffix.$$,
      'hint', $$Just add the suffix to the verb.$$,
      'expected', $$Acceptable.$$
    ),
    jsonb_build_object(
      'question', $$What does a dam use to produce electricity?$$,
      'hint', $$Think about rivers.$$,
      'expected', $$The force of water blocked across a river.$$
    ),
    jsonb_build_object(
      'question', $$What is the greenhouse effect?$$,
      'hint', $$It relates to global warming and pollution.$$,
      'expected', $$The gradual warming of the air caused by heat trapped due to pollution.$$
    )
  ),
  now()
);
