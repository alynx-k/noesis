-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 4
-- LESSON 1: Modern and traditional clothes" PDF (giving reasons with
-- because, expressing purpose with in order to / so that), but every
-- sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is preparing a fashion segment for the school's cultural day, comparing modern and traditional clothing styles. Before writing your article, you need vocabulary about clothes and the grammar to explain your choices.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: describing clothes$$,
        'body', $$Talking about fashion means describing how clothes look and feel -- whether they're loose, small, old, or new.$$,
        'highlights', array[$$baggy$$, $$tiny$$, $$old-fashioned$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$baggy$$, $$loose and wide, not fitted to the body$$),
            jsonb_build_array($$tiny$$, $$very small$$),
            jsonb_build_array($$old-fashioned$$, $$no longer modern; out of style$$),
            jsonb_build_array($$underwear$$, $$clothes worn next to the skin, under other clothes$$),
            jsonb_build_array($$pants / trousers$$, $$clothing that covers the legs separately$$),
            jsonb_build_array($$handmade$$, $$made by hand, not by a machine$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To give a reason for an opinion, we use "because" followed by a full sentence (subject + verb): I like traditional clothes because they are original.$$),
        'example', jsonb_build_object('statement', $$Explain why you don't like baggy clothes, using "because".$$, 'solution', $$I don't like baggy clothes because they look old-fashioned to me.$$),
        'fixation', jsonb_build_object('question', $$Join the two ideas with "because": "Adjoua wears a kita for the ceremony." / "She wants to honour her culture."$$, 'solution', $$Adjoua wears a kita for the ceremony because she wants to honour her culture.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: more items of clothing$$,
        'body', $$A complete outfit includes more than just trousers and a shirt: this vocabulary covers accessories and other common clothing items.$$,
        'highlights', array[$$a sweater$$, $$a waistcoat$$, $$trainers$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a sweater$$, $$a warm piece of clothing worn over a shirt$$),
            jsonb_build_array($$a waistcoat$$, $$a sleeveless piece of clothing worn over a shirt, under a jacket$$),
            jsonb_build_array($$a belt$$, $$a strip of material worn around the waist to hold up trousers$$),
            jsonb_build_array($$trainers$$, $$comfortable shoes worn for sport or everyday wear$$),
            jsonb_build_array($$tights$$, $$a close-fitting garment covering the legs and feet$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To express purpose -- the reason WHY someone does something -- English uses "in order to + base verb" or "so that + subject + might/could + base verb".$$),
        'example', jsonb_build_object('statement', $$Say why a tailor makes traditional clothes, using "in order to" and "so that".$$, 'solution', $$The tailor makes traditional clothes in order to sell them at the market. He makes traditional clothes so that customers might celebrate their culture.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "in order to": "She is learning to sew because she wants to design her own clothes."$$, 'solution', $$She is learning to sew in order to design her own clothes.$$)
      ),
      jsonb_build_object(
        'heading', $$Because or in order to: which one fits?$$,
        'body', $$"Because" and "in order to" both answer a "why" question, but they answer two different kinds of "why": one gives a cause, the other gives a goal.$$,
        'highlights', array[$$a cause$$, $$a goal$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Because + subject + verb" explains a cause -- something that is already true (I wear a coat because it is cold). "In order to + base verb" explains a goal -- something the person wants to achieve (I wear a coat in order to stay warm).$$),
        'example', jsonb_build_object('statement', $$Which fits better: "She wore a kita because/in order to attend the wedding"?$$, 'solution', $$"She wore a kita in order to attend the wedding" fits better, because it expresses her goal (attending the wedding), not an existing cause.$$),
        'fixation', jsonb_build_object('question', $$Choose because or in order to: "He bought new trainers ___ play in the football match."$$, 'solution', $$He bought new trainers in order to play in the football match, because it expresses his goal.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club Magazine is publishing a feature comparing modern and traditional clothing styles among young people.$$,
      'questions', array[
        $$Describe one traditional item of clothing and one modern item.$$,
        $$Explain, using "because", why you prefer one style over the other.$$,
        $$Explain, using "in order to" or "so that", why some people choose to wear traditional clothes for special occasions.$$,
        $$Give your opinion on whether young people follow fashion trends too much.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: These trousers are too ___ (very small) for me now; I need a bigger size.$$,
      'hint', $$Use the adjective meaning "very small".$$,
      'expected', $$These trousers are too tiny for me now; I need a bigger size.$$
    ),
    jsonb_build_object(
      'question', $$Join with "because": "Kouadio prefers traditional clothes." / "He wants to honour his ancestors."$$,
      'hint', $$Because + subject + verb.$$,
      'expected', $$Kouadio prefers traditional clothes because he wants to honour his ancestors.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "so that ... might": "She wears a waistcoat to look elegant at the ceremony."$$,
      'hint', $$so that + subject + might + base verb.$$,
      'expected', $$She wears a waistcoat so that she might look elegant at the ceremony.$$
    ),
    jsonb_build_object(
      'question', $$Choose because or in order to: "He is saving money ___ buy new trainers."$$,
      'hint', $$This expresses a goal, not an existing cause.$$,
      'expected', $$He is saving money in order to buy new trainers.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-vetements';
