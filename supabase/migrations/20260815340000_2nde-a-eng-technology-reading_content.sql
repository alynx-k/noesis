-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1435: "Unit 3_Technology_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1435)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10718,
-- redirecting to pluginfile "Unit 3_Technology_Reading.pdf" (FAR AHEAD
-- 2nde, page 34). Read directly in the browser PDF viewer (page-by-page
-- screenshots, zoomed in where needed); no file was persisted to disk.
-- The worksheet's own reading passage ("The Mobile Community - Africa's
-- mobile revolution") is a magazine-style article, so it is NOT
-- reproduced or closely paraphrased here: the reading text below is
-- original writing conveying the same general, non-copyrightable facts
-- (the spread of mobile phones across Africa, their role in banking,
-- farming and civic life) in different wording and a different framing.
-- The present-perfect-with-already/just/still/yet language point, the
-- vocabulary set (exploded, dwellers, rely on, forecasts, uprisings,
-- post), and the activity types (main idea, vocabulary matching,
-- comprehension questions, presentation and paragraph-writing tasks about
-- modern technology) are paraphrased from the worksheet's instructions.
-- Course content and exercises are entirely in English by design: this is
-- an English-immersion lesson, not a lesson about English taught in
-- French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-technology-reading',
  '2nde',
  'A',
  'anglais',
  $$Unit 3 - Technology: Reading About Africa's Mobile Revolution$$,
  5,
  '2nde-a-eng-health-lifestyle-writing',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A picture of a desktop computer is shown to the class. Students are asked what they see, what such a device is used for, and what their own opinion is about modern technology in general. To prepare an oral presentation for their English class, they must then read a short text about how mobile phone technology has spread across Africa.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Grammar: the present perfect with already, just, still and yet$$,
        'body', $$To describe a past action that still has an effect on the present, English often uses the present perfect together with time words like already, just, still, and yet. Already emphasises that something happened sooner than expected: "Technology has already inspired progress in manufacturing." Just shows something happened a very short time ago: "Jane has just borrowed a mobile phone." Still, used with a negative, shows that a situation continues unexpectedly: "People still haven't begun using the internet in my village." Yet, also used with a negative or in a question, asks about something expected but not yet done: "John has not bought a new computer yet."$$,
        'highlights', array[$$already$$, $$just$$, $$still ... not$$, $$not ... yet$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Use$$, $$Example$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Already$$, $$Something happened sooner than expected$$, $$Technology has already inspired development in manufacturing.$$),
            jsonb_build_array($$Just$$, $$Something happened a very short time ago$$, $$Jane has just borrowed a mobile phone.$$),
            jsonb_build_array($$Still (+ not)$$, $$A situation unexpectedly continues$$, $$People still haven't begun using internet in my village.$$),
            jsonb_build_array($$Yet (+ not / question)$$, $$Something expected but not yet done$$, $$John has not bought a new computer yet.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Complete with "just", "already" or "yet": "I ______ finished my homework, so I can help you now."$$, 'solution', $$"I have just finished my homework, so I can help you now." (or "already", depending on the intended nuance)$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: talking about the spread of technology$$,
        'body', $$This unit's vocabulary describes rapid change and communication. Something that has exploded has increased very much and very fast. Dwellers are people who live in a particular place (for example, "city dwellers"). To rely on something means to depend on it. Forecasts are predictions, especially about weather or prices. Uprisings are rebellions or popular revolts. To post something (online) means to send or publish it for others to see.$$,
        'highlights', array[$$exploded$$, $$dwellers$$, $$rely on$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Exploded$$, $$Increased very much and very fast$$),
            jsonb_build_array($$Dwellers$$, $$People who live in a particular place$$),
            jsonb_build_array($$Rely on$$, $$Depend on$$),
            jsonb_build_array($$Forecasts$$, $$Predictions (for example, about weather or prices)$$),
            jsonb_build_array($$Uprisings$$, $$Rebellions, popular revolts$$),
            jsonb_build_array($$Post$$, $$Send or publish something, especially online$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Which word means "people who live in a particular place"?$$, 'solution', $$Dwellers.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading text: How Mobile Phones Changed a Continent$$,
        'body', $$Not long ago, owning a mobile phone in many African countries was mostly something city dwellers could afford. That has changed dramatically: network coverage has spread far into rural areas, and the number of mobile users has exploded, thanks partly to cheaper handsets imported from abroad. For many communities that never had landline telephones, the mobile phone has simply become the main way to communicate. Farmers now rely on their phones to get market prices and weather forecasts without travelling into town, saving time and money. Small business owners use phones to manage stock and deliveries and to stay in touch with customers. Mobile banking services let people send and receive money without visiting a bank branch. Social networks, accessed increasingly through phones, have also played an important role in recent political uprisings, helping people organise and share information quickly. Young people in particular have benefited from falling prices, and the mobile phone is now a central part of youth culture across the continent.$$,
        'highlights', array[$$mobile revolution$$, $$rural areas$$, $$mobile banking$$]::text[]
      ),
      jsonb_build_object(
        'heading', $$Finding the main idea: technology as a "necessary evil"$$,
        'body', $$A reading comprehension activity might ask why a text's author describes modern technology as a "necessary evil", meaning something with real drawbacks that people cannot easily do without. To answer, a reader must choose the option that best reflects the whole text's balance of benefits and costs, rather than a detail that only covers one side.$$,
        'highlights', array[$$necessary evil$$, $$main idea$$]::text[],
        'example', jsonb_build_object('statement', $$Why might modern technology be called a "necessary evil"? (a) It has many benefits. (b) It revolutionised modes of communication. (c) It brings real benefits but also real problems that societies must now live with.$$, 'solution', $$Option (c): a "necessary evil" is something that has both important benefits and real drawbacks, which is the balanced idea the phrase communicates.$$),
        'fixation', jsonb_build_object('question', $$Why do options (a) and (b) alone not fully justify calling technology a "necessary evil"?$$, 'solution', $$Because they mention only benefits, while "necessary evil" implies the presence of both benefits and drawbacks.$$)
      ),
      jsonb_build_object(
        'heading', $$Comprehension: benefits, weaknesses and the future$$,
        'body', $$Comprehension questions on a text like this typically ask: what developing countries hope to gain from modern technology, what benefits it brings in the health sector, when mass media and telecommunication have shown clear improvement, and what its weaknesses are. These questions prepare a wider discussion and a presentation task, for example acting as an English Club chairperson presenting on the impact of modern technologies on people's lives: naming the different kinds of modern technology that exist, their negative impacts, and their benefits.$$,
        'highlights', array[$$benefits$$, $$weaknesses$$, $$presentation$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one benefit modern technology can bring to the health sector.$$, 'solution', $$For example: faster diagnosis, remote medical advice, or better tracking of health information.$$)
      ),
      jsonb_build_object(
        'heading', $$Writing task: technology that made the world "smaller"$$,
        'body', $$People often say the world has gotten "smaller," meaning that distances now matter less because communication and travel are easier and people feel closer, not that the planet has physically shrunk. A follow-up writing task asks you to identify specific pieces of technology that contributed to this change, explain how each one changed the world, and make predictions about technology's impact on the world in the future, in a short paragraph suitable for publication in an English Club magazine.$$,
        'highlights', array[$$"smaller world"$$, $$predictions$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one invention you would mention as having made the world feel "smaller", and briefly say why.$$, 'solution', $$For example, the mobile phone, because it lets people in distant places communicate instantly and cheaply.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$As chairperson of your school's English Club, you are asked to give a short presentation on the impact of modern technologies on people's lives.$$,
      'questions', array[
        $$Cite three different kinds of modern technology that exist.$$,
        $$Name two negative impacts modern technologies can have on people's lives.$$,
        $$Mention two benefits modern technologies bring to people's lives.$$,
        $$Using the present perfect with "already" or "just", describe one way technology has recently changed your own daily life.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete using the present perfect: "Technology __________ (already/inspire) major changes in manufacturing."$$,
      'hint', $$Use "has already" plus the past participle.$$,
      'expected', $$"Technology has already inspired major changes in manufacturing."$$
    ),
    jsonb_build_object(
      'question', $$What word from the vocabulary list means "increased very much and very fast"?$$,
      'hint', $$It describes how mobile phone ownership spread in Africa.$$,
      'expected', $$Exploded.$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, how do farmers use mobile phones without travelling into town?$$,
      'hint', $$Think about market prices and weather.$$,
      'expected', $$They rely on their phones to get market prices and weather forecasts.$$
    ),
    jsonb_build_object(
      'question', $$What does it mean to say the world has gotten "smaller" thanks to technology?$$,
      'hint', $$It is not about the planet's physical size.$$,
      'expected', $$It means communication and travel across distances have become easier, so people feel closer to each other, even though the planet itself has not physically shrunk.$$
    )
  ),
  now()
);
