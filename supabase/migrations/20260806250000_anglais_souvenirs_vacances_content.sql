-- Same CourseContentV2 shape as the Mathématiques 3ème migrations (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern),
-- first use for an Anglais lesson. Structure follows the official
-- ecole-ci.org "UNIT 1 LESSON 1: My first holiday in my village" PDF
-- (Learning Context -> vocabulary/grammar sessions -> communication
-- activity), but every sentence, name, and exercise is an original
-- rewrite. Unlike Mathématiques, lesson content itself (situation,
-- headings, vocabulary, grammar, examples, exercises) is written in
-- English -- matching the source's own immersive style -- while the app's
-- structural chrome (Exemple/Je m'exercice/Situation d'évaluation) stays
-- French. First use of the new CourseSection.table field for a vocabulary
-- list (see lib/courses.ts, components/data-table.tsx).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$School has just reopened after the long holidays. Your English teacher asks every student to stand up and share, in a few sentences, what they did during the break. You want to tell the class about your own trip -- but first, you need the right words and the right tense to talk about the past.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: holiday activities$$,
        'body', $$Before you can talk about your last holidays in English, you need the right words to describe what people do during a break: where they go, who they visit, and how they spend their time.$$,
        'highlights', array[$$a trip$$, $$to pay a visit$$, $$to have fun$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to travel$$, $$to move from one place to another, by car, bus, or plane$$),
            jsonb_build_array($$a trip$$, $$a short journey somewhere$$),
            jsonb_build_array($$to pay a visit$$, $$to go and see someone$$),
            jsonb_build_array($$to welcome$$, $$to receive someone with pleasure$$),
            jsonb_build_array($$to have fun$$, $$to enjoy oneself$$),
            jsonb_build_array($$to go hunting$$, $$to chase wild animals in the bush$$),
            jsonb_build_array($$to work on the farm$$, $$to do agricultural work in the fields$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$We use the past simple tense to talk about actions that are completely finished. Regular verbs end in -ed (visited, worked); irregular verbs change form (go→went, have→had). Questions and negatives use "did": Did you travel? / I didn't travel.$$),
        'example', jsonb_build_object('statement', $$Where did Aya go last holidays? Did she enjoy her stay?$$, 'solution', $$She went to her grandmother's village. Yes, she did. She had a lot of fun there.$$),
        'fixation', jsonb_build_object('question', $$Fill in the gaps: Last holidays, Yao ___ (go) to Man. He ___ (pay) a visit to his uncle and ___ (have) a great time.$$, 'solution', $$Last holidays, Yao went to Man. He paid a visit to his uncle and had a great time.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammar: adverbial phrases with the past tense$$,
        'body', $$To say exactly when something happened in the past, English uses small time expressions before or after the verb: "on", "in", "last", and "ago" each work with a different kind of date or duration.$$,
        'highlights', array[$$on$$, $$in$$, $$last$$, $$ago$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "on" with a precise date (on 5 May), "in" with a month or year (in 2022), "last" with a period just before now (last month, last year), and "ago" after a length of time counted back from today (two weeks ago).$$),
        'example', jsonb_build_object('statement', $$When did Fatou arrive? (three days / ago)$$, 'solution', $$Fatou arrived three days ago.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct word: Awa travelled (on/in/ago) 2021.$$, 'solution', $$Awa travelled in 2021, because "in" is used with a year.$$)
      ),
      jsonb_build_object(
        'heading', $$Sequencing a story: first, then, finally$$,
        'body', $$When you tell someone about your holidays from beginning to end, sequence words help your listener follow the order of events without getting lost.$$,
        'highlights', array[$$first$$, $$then$$, $$after that$$, $$finally$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Sequence word$$, $$Position in the story$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$first / first of all$$, $$the very first event$$),
            jsonb_build_array($$then / next$$, $$an event that follows$$),
            jsonb_build_array($$after that$$, $$a later step$$),
            jsonb_build_array($$finally / lastly$$, $$the last event$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Tell the story of a market day using sequence words.$$, 'solution', $$First, we walked to the market. Then, we bought vegetables. After that, we had lunch. Finally, we walked back home.$$),
        'fixation', jsonb_build_object('question', $$Put the sequence words in order to complete the story: ___, Kader packed his bag. ___, he took the bus. ___, he arrived at his aunt's house.$$, 'solution', $$First, Kader packed his bag. Then, he took the bus. Finally, he arrived at his aunt's house.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your pen friend from Ghana, Ama, wants to know about your last holidays. She asks you to tell her where you went, when you went there, and what you did from the beginning to the end of your stay.$$,
      'questions', array[
        $$Say where and when you went during your last holidays.$$,
        $$Explain how you travelled there.$$,
        $$Describe, using sequence words (first, then, after that, finally), what you did during your stay.$$,
        $$Say whether you enjoyed your holidays and why.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Put the verb in brackets into the past simple: Last year, Sika ___ (visit) her grandparents in Bouaké.$$,
      'hint', $$Regular verbs form the past simple by adding -ed.$$,
      'expected', $$Last year, Sika visited her grandparents in Bouaké.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct time expression: Boubacar came back home two weeks (in/ago/last).$$,
      'hint', $$"Ago" follows a length of time counted back from now.$$,
      'expected', $$Boubacar came back home two weeks ago.$$
    ),
    jsonb_build_object(
      'question', $$Answer the question in a full sentence: Did Rokia enjoy her holidays? (yes)$$,
      'hint', $$Use "Yes, she did" followed by a past simple sentence.$$,
      'expected', $$Yes, she did. She enjoyed her holidays very much.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite this sentence using sequence words: "We arrived. We unpacked our bags. We went to the market." (use First, Then, Finally)$$,
      'hint', $$Match each sequence word to the order of the three actions.$$,
      'expected', $$First, we arrived. Then, we unpacked our bags. Finally, we went to the market.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-souvenirs-vacances';
