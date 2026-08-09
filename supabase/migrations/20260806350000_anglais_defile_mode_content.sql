-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 4
-- LESSON 2: Fashion show" PDF (persuading/dissuading with should/must/ought
-- to, expressing likes/dislikes), but every sentence, name, and exercise is
-- an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school's English Club attended a fashion show at the local cultural centre, and now you're helping write the report for the club magazine.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: at a fashion show$$,
        'body', $$A fashion show has its own special vocabulary, from the people who make the clothes to the stage where they're presented.$$,
        'highlights', array[$$a catwalk$$, $$a seamstress$$, $$ready-to-wear$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$an advertisement$$, $$a public announcement made to promote a product$$),
            jsonb_build_array($$a catwalk$$, $$the stage on which models parade during a fashion show$$),
            jsonb_build_array($$ready-to-wear$$, $$clothes made in standard sizes, ready to buy and wear$$),
            jsonb_build_array($$a seamstress$$, $$a woman whose job is to make or repair clothes$$),
            jsonb_build_array($$to plait$$, $$to braid hair by interweaving several strands$$),
            jsonb_build_array($$a wig$$, $$a covering of false hair worn on the head$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To persuade someone, we use "should / must / ought to + base verb". To dissuade someone, we use the negative: "shouldn't / mustn't + base verb".$$),
        'example', jsonb_build_object('statement', $$Persuade a friend to buy a dress, then dissuade them from buying a wig.$$, 'solution', $$You should buy this dress -- it really suits you. You shouldn't buy that wig -- it doesn't look natural.$$),
        'fixation', jsonb_build_object('question', $$Is this persuading or dissuading: "You mustn't wear those old sandals to the ceremony."?$$, 'solution', $$This is dissuading, because "mustn't" tells someone not to do something.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: people and places of fashion$$,
        'body', $$Behind every fashion show are people with specific jobs, and places where fashion is bought, sold, and celebrated.$$,
        'highlights', array[$$a model$$, $$a fashion designer$$, $$trendy$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a model$$, $$a person whose job is to wear and present clothes at fashion shows$$),
            jsonb_build_array($$a fashion designer$$, $$someone whose job is to create new clothing styles$$),
            jsonb_build_array($$a fashion shop$$, $$a shop where fashionable clothes are sold$$),
            jsonb_build_array($$trendy$$, $$fashionable; currently popular$$),
            jsonb_build_array($$to be fond of$$, $$to like someone or something$$),
            jsonb_build_array($$to be crazy about$$, $$to like someone or something very much$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To express strong likes, use "to be fond of" or "to be crazy about" + noun/verb-ing. To express dislikes, use "to dislike" or "to hate" + noun/verb-ing.$$),
        'example', jsonb_build_object('statement', $$Express a strong like and a strong dislike about fashion.$$, 'solution', $$I am crazy about wearing traditional prints. I hate wearing uncomfortable shoes.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "to be fond of": "My aunt really likes wearing colourful wrappers."$$, 'solution', $$My aunt is fond of wearing colourful wrappers.$$)
      ),
      jsonb_build_object(
        'heading', $$Should, must, or ought to: how strong is the advice?$$,
        'body', $$"Should", "must", and "ought to" can all give advice, but they don't all sound equally strong.$$,
        'highlights', array[$$should$$, $$must$$, $$ought to$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Should" and "ought to" give gentle advice or a recommendation, and mean almost the same thing. "Must" is much stronger: it sounds like an order or a strict rule, not just a suggestion.$$),
        'example', jsonb_build_object('statement', $$Compare the strength of "You should wear a coat" and "You must wear a coat".$$, 'solution', $$"You should wear a coat" is a friendly suggestion. "You must wear a coat" sounds like a strict order, as if there is no other choice.$$),
        'fixation', jsonb_build_object('question', $$Choose the stronger option: "You ___ (should/must) respect the dress code; it's a strict school rule."$$, 'solution', $$You must respect the dress code; it's a strict school rule -- "must" fits a strict rule better than "should".$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club magazine is publishing your report on a fashion show you attended.$$,
      'questions', array[
        $$Say how many people attended and what kind of clothes were shown.$$,
        $$Express one thing about the show you were fond of, and one thing you disliked.$$,
        $$Persuade your readers to come to the next fashion show, using should/must/ought to.$$,
        $$Say what you personally gained from attending the show.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Is this persuading or dissuading: "You should try wearing local prints; they look great on you."$$,
      'hint', $$"Should" gives a positive recommendation.$$,
      'expected', $$This is persuading, because it encourages the person to do something.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "to be crazy about": "Fatou really loves designing her own dresses."$$,
      'hint', $$to be crazy about + verb-ing.$$,
      'expected', $$Fatou is crazy about designing her own dresses.$$
    ),
    jsonb_build_object(
      'question', $$Fill the gap with the strongest option: "Models ___ (should/must) arrive on time; the show cannot start without them."$$,
      'hint', $$This is a strict requirement, not just advice.$$,
      'expected', $$Models must arrive on time; the show cannot start without them.$$
    ),
    jsonb_build_object(
      'question', $$What is "a catwalk"?$$,
      'hint', $$Re-read the vocabulary definition.$$,
      'expected', $$A catwalk is the stage on which models parade during a fashion show.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-defile-mode';
