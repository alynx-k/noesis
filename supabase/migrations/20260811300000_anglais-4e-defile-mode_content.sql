-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806350000_anglais_defile_mode_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered should/must/ought to and fond
-- of/crazy about; this 4ème lesson steps up to "had better" for urgent
-- advice and the causative "make someone do something", both new
-- structures for a fashion-show commentary register.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school is organising its first fashion show, and you have been chosen to write the English commentary read out as models walk the runway. The organiser wants commentary that gives urgent backstage advice and describes the emotional effect each outfit has on the audience.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: behind the runway$$,
        'body', $$Fashion-show commentary needs words for the event itself -- the people, the movement, and the atmosphere backstage and on the runway.$$,
        'highlights', array[$$a runway$$, $$a designer$$, $$to strut$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a runway$$, $$the long platform models walk along$$),
            jsonb_build_array($$a designer$$, $$a person who creates clothing designs$$),
            jsonb_build_array($$to strut$$, $$to walk in a proud, confident way$$),
            jsonb_build_array($$backstage$$, $$the area behind the stage, out of the audience's view$$),
            jsonb_build_array($$a collection$$, $$a set of clothes designed together for one season or theme$$),
            jsonb_build_array($$to steal the show$$, $$to attract the most attention or praise$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Had better + base verb" gives urgent advice, with a stronger sense of consequence than "should": You had better hurry, or you'll miss your cue! The negative is "had better not + base verb".$$),
        'example', jsonb_build_object('statement', $$Give urgent backstage advice to a model who is running late.$$, 'solution', $$You had better get dressed quickly, or you'll miss your turn on the runway.$$),
        'fixation', jsonb_build_object('question', $$Complete: "You ___ (had better) check your outfit before you walk out, or the designer will be furious."$$, 'solution', $$You had better check your outfit before you walk out, or the designer will be furious.$$)
      ),
      jsonb_build_object(
        'heading', $$The causative: "make someone do something"$$,
        'body', $$A striking outfit does not just look good -- it causes a reaction in the audience. English has a special structure for describing one person or thing causing another to act.$$,
        'highlights', array[$$make$$, $$causative$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Make + person + base verb" (no "to") describes causing someone to do or feel something: This dress makes her look elegant. The music made the audience clap.$$),
        'example', jsonb_build_object('statement', $$Describe the effect of a bold outfit on the audience.$$, 'solution', $$The bold colours made the audience gasp with admiration.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The designer's final piece ___ (make) everyone stand up and applaud."$$, 'solution', $$The designer's final piece made everyone stand up and applaud.$$)
      ),
      jsonb_build_object(
        'heading', $$Combining urgency and effect$$,
        'body', $$Great live commentary moves quickly between urgent backstage advice and vivid descriptions of the effect each look has on the crowd.$$,
        'highlights', array[$$urgency$$, $$effect$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "had better" for urgent instructions to the people involved in the show, and "make + person + base verb" for describing the emotional impact of what the audience sees. Combining both keeps a live commentary lively and varied.$$),
        'example', jsonb_build_object('statement', $$Combine an urgent instruction and an effect in one commentary line.$$, 'solution', $$Models had better keep their pace steady -- this collection makes the whole crowd hold its breath!$$),
        'fixation', jsonb_build_object('question', $$Choose the right structure: "This look ___ (had better/make) the audience believe traditional fashion is back in style."$$, 'solution', $$This look makes the audience believe traditional fashion is back in style, because this describes an effect, not an instruction.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You must write a short live commentary for your school's first fashion show, mixing backstage instructions with descriptions of the outfits' effect on the audience.$$,
      'questions', array[
        $$Give one urgent piece of backstage advice using "had better".$$,
        $$Describe one outfit's effect on the audience using "make + person + base verb".$$,
        $$Describe the outfit itself using vocabulary from the lesson.$$,
        $$End your commentary with your opinion on the show's overall theme.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "You ___ (had better) fix your headscarf before you go on the runway."$$,
      'hint', $$Had better + base verb, no "to".$$,
      'expected', $$You had better fix your headscarf before you go on the runway.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The designer's bold prints ___ (make) the whole audience smile."$$,
      'hint', $$Make + person + base verb, no "to".$$,
      'expected', $$The designer's bold prints made the whole audience smile.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite as urgent advice with "had better": "You should hurry, or you'll miss your turn."$$,
      'hint', $$Replace "should" with the stronger "had better".$$,
      'expected', $$You had better hurry, or you'll miss your turn.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The final collection ___ (make) the audience believe this designer has a great future."$$,
      'hint', $$Make + object + base verb.$$,
      'expected', $$The final collection made the audience believe this designer has a great future.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-defile-mode';
