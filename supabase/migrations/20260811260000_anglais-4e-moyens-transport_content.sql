-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806310000_anglais_moyens_transport_content.sql, the 3ème
-- equivalent, for the CourseContentV2 shape). 3ème covered simple
-- comparatives, as...as, prefer/would rather; this 4ème lesson steps up to
-- the superlative for comparing three or more options and the correlative
-- comparative "the faster..., the more..." for transport trade-offs.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your town council is considering which forms of public transport to invest in next year. Your English Club has been asked to prepare a short comparative report ranking the available options, not just comparing two at a time but showing which is best overall.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: evaluating transport$$,
        'body', $$Ranking transport options fairly requires vocabulary about cost, reliability, and environmental impact, not just speed.$$,
        'highlights', array[$$reliable$$, $$affordable$$, $$eco-friendly$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$reliable$$, $$able to be trusted to work well$$),
            jsonb_build_array($$affordable$$, $$reasonably priced$$),
            jsonb_build_array($$eco-friendly$$, $$not harmful to the environment$$),
            jsonb_build_array($$congestion$$, $$traffic that is too heavy to move freely$$),
            jsonb_build_array($$to commute$$, $$to travel regularly between home and work or school$$),
            jsonb_build_array($$a fare$$, $$the price paid to travel on public transport$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The superlative compares one option to all others in a group of three or more: the fastest, the most reliable, the least expensive. Short adjectives add "-est"; longer adjectives use "the most/least + adjective".$$),
        'example', jsonb_build_object('statement', $$Compare the bus, the taxi, and the motorbike-taxi for cost.$$, 'solution', $$The bus is the cheapest, the taxi is the most expensive, and the motorbike-taxi falls in between.$$),
        'fixation', jsonb_build_object('question', $$Complete with the superlative: "Of all the options, the train is ___ (reliable)."$$, 'solution', $$Of all the options, the train is the most reliable.$$)
      ),
      jsonb_build_object(
        'heading', $$"The faster..., the more...": transport trade-offs$$,
        'body', $$Choosing transport always involves a trade-off: gaining speed often costs something else, like money or safety. English expresses this link with two comparatives together.$$,
        'highlights', array[$$a trade-off$$, $$the faster$$, $$the safer$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"The + comparative..., the + comparative..." shows that as one thing increases or decreases, another changes with it: The faster a vehicle goes, the more dangerous it becomes. The cheaper the fare, the more crowded the bus gets.$$),
        'example', jsonb_build_object('statement', $$Link speed and safety for a motorbike-taxi.$$, 'solution', $$The faster the motorbike-taxi goes, the less safe the ride becomes.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The ___ (cheap) the fare, the ___ (crowd) the vehicle."$$, 'solution', $$The cheaper the fare, the more crowded the vehicle.$$)
      ),
      jsonb_build_object(
        'heading', $$Superlative or "the more... the more": which to choose?$$,
        'body', $$A superlative ranks one clear winner among several options; the correlative comparative shows a relationship between two changing qualities, not a ranking.$$,
        'highlights', array[$$a ranking$$, $$a relationship$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the superlative when naming a single best or worst option among three or more (The train is the most reliable). Use "the more... the more" when describing how two qualities rise or fall together, without naming a winner (The more reliable a service is, the more passengers it attracts).$$),
        'example', jsonb_build_object('statement', $$Which structure fits: naming the cheapest option, or linking price to comfort?$$, 'solution', $$Naming the cheapest option needs the superlative ("the bus is the cheapest"); linking price to comfort needs "the more... the more" ("the cheaper the fare, the less comfortable the journey").$$),
        'fixation', jsonb_build_object('question', $$Choose the right structure: "Among all options, the bicycle is ___ (eco-friendly)."$$, 'solution', $$Among all options, the bicycle is the most eco-friendly, because this names one clear winner.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your report to the town council must rank the town's transport options and explain the trade-offs between them.$$,
      'questions', array[
        $$Use a superlative to name the most reliable transport option.$$,
        $$Use a superlative to name the least expensive transport option.$$,
        $$Use "the more... the more" to describe one trade-off (speed, safety, cost, or comfort).$$,
        $$Recommend one option for the council to invest in, and explain why.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete with the superlative: "Of the bus, the taxi, and the train, the train is ___ (comfortable)."$$,
      'hint', $$Comparing three or more options needs the superlative form.$$,
      'expected', $$Of the bus, the taxi, and the train, the train is the most comfortable.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The ___ (busy) the road, the ___ (long) the journey takes."$$,
      'hint', $$Both halves of this structure need a comparative.$$,
      'expected', $$The busier the road, the longer the journey takes.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the superlative: "Among all vehicles in town, the motorbike-taxi is ___ (fast)."$$,
      'hint', $$Short adjectives add "-est" after "the".$$,
      'expected', $$Among all vehicles in town, the motorbike-taxi is the fastest.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The ___ (early) you leave home, the ___ (likely) you are to arrive on time."$$,
      'hint', $$Use two comparative forms linked by "the".$$,
      'expected', $$The earlier you leave home, the more likely you are to arrive on time.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-moyens-transport';
