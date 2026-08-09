-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806340000_anglais_vetements_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered "because" and "in order to / so
-- that"; this 4ème lesson steps up to result clauses with "so... that" and
-- "such... that", a structure not yet used in the 3ème catalog.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club Magazine is reviewing this year's fashion trends for a special edition comparing modern and traditional clothing. The editor wants the article to describe the effects clothes have on people -- not just what clothes look like, but the result of wearing them.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: fashion and its effects$$,
        'body', $$Reviewing fashion trends means describing not only how clothes look, but the strong reactions and effects they cause.$$,
        'highlights', array[$$striking$$, $$to stand out$$, $$practical$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$striking$$, $$very noticeable and impressive$$),
            jsonb_build_array($$to stand out$$, $$to be easily noticed among others$$),
            jsonb_build_array($$practical$$, $$useful and suitable for everyday activities$$),
            jsonb_build_array($$elaborate$$, $$made with great detail and care$$),
            jsonb_build_array($$restrictive$$, $$limiting freedom of movement$$),
            jsonb_build_array($$versatile$$, $$able to be worn in many different situations$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"So + adjective + that + result" links a quality to its effect: The kita was so elaborate that it took weeks to make. "So" always comes directly before the adjective.$$),
        'example', jsonb_build_object('statement', $$Describe the effect of a very striking outfit.$$, 'solution', $$Her outfit was so striking that everyone at the ceremony turned to look.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The traditional dress was ___ (so/such) heavy that she could barely dance in it."$$, 'solution', $$The traditional dress was so heavy that she could barely dance in it.$$)
      ),
      jsonb_build_object(
        'heading', $$"Such... that": the same idea, a different pattern$$,
        'body', $$"Such" expresses the same kind of result as "so", but attaches to a noun phrase rather than to an adjective alone.$$,
        'highlights', array[$$such a$$, $$such$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Such (a/an) + adjective + noun + that + result" links a described noun to its effect: It was such an elaborate design that it won first prize. Use "such a/an" before a singular countable noun, and "such" alone before a plural or uncountable noun.$$),
        'example', jsonb_build_object('statement', $$Rewrite "The outfit was so striking that everyone noticed" using "such".$$, 'solution', $$It was such a striking outfit that everyone noticed.$$),
        'fixation', jsonb_build_object('question', $$Complete: "They were ___ (so/such) practical shoes that she wore them every day."$$, 'solution', $$They were such practical shoes that she wore them every day.$$)
      ),
      jsonb_build_object(
        'heading', $$"So" or "such": choosing the right one$$,
        'body', $$The two structures express the same result relationship, but the grammar decides which one to reach for depending on what follows.$$,
        'highlights', array[$$adjective alone$$, $$noun phrase$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "so" directly before an adjective with no noun (so heavy that...). Use "such (a/an)" before a noun, whether or not it has an adjective (such heat that... / such a heavy dress that...).$$),
        'example', jsonb_build_object('statement', $$Which fits: "so a beautiful dress" or "such a beautiful dress"?$$, 'solution', $$"Such a beautiful dress" is correct, because "such" is used before a noun phrase, while "so" is never followed directly by "a/an".$$),
        'fixation', jsonb_build_object('question', $$Choose the correct word: "It was ___ (so/such) modern that people mistook it for a foreign brand."$$, 'solution', $$It was so modern that people mistook it for a foreign brand, because "so" comes before the adjective alone.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club Magazine article must compare modern and traditional clothing and describe the effects each style has on people.$$,
      'questions', array[
        $$Describe one traditional item of clothing using "so... that".$$,
        $$Describe one modern item of clothing using "such (a)... that".$$,
        $$Explain which style you personally prefer, and why.$$,
        $$Give your opinion on whether traditional clothing will remain popular in the future.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "The fabric was ___ colourful that it attracted attention from across the market."$$,
      'hint', $$"So" comes directly before an adjective with no noun.$$,
      'expected', $$The fabric was so colourful that it attracted attention from across the market.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "It was ___ a versatile outfit that she wore it to school and to parties."$$,
      'hint', $$"Such a" comes before a singular countable noun.$$,
      'expected', $$It was such a versatile outfit that she wore it to school and to parties.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "so... that": "The shoes were very restrictive, so she couldn't walk fast."$$,
      'hint', $$So + adjective + that + result.$$,
      'expected', $$The shoes were so restrictive that she couldn't walk fast.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "such... that": "It was a very elaborate design. It took two months to finish."$$,
      'hint', $$Such (a/an) + adjective + noun + that + result.$$,
      'expected', $$It was such an elaborate design that it took two months to finish.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-vetements-modernes-traditionnels';
