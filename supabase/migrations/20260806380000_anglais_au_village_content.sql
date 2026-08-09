-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 5
-- LESSON 2: Village life" PDF (superlatives, prefer x to y), but every
-- sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club visits a village for a cultural exchange and listens to a village elder describe traditional life. Afterwards, the class discusses what makes village life special.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: village life and traditions$$,
        'body', $$Traditional village life is organized around its own customs, leadership, and ways of solving problems. These words describe that community structure.$$,
        'highlights', array[$$a chieftain$$, $$the palaver tree$$, $$to stick together$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$the countryside$$, $$a rural area, away from cities$$),
            jsonb_build_array($$a tribe$$, $$an ethnic or family group sharing the same customs$$),
            jsonb_build_array($$a chieftain$$, $$the traditional leader of a community$$),
            jsonb_build_array($$a custom$$, $$a tradition passed down within a community$$),
            jsonb_build_array($$the palaver tree$$, $$the traditional place where villagers meet to solve problems$$),
            jsonb_build_array($$to stick together$$, $$to remain united and support one another$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The superlative compares one thing to all others in a group. Long adjectives use "the most/least + adjective": the most developed. Short adjectives add "-est": the biggest. Some adjectives are irregular: good→the best, bad→the worst, far→the farthest.$$),
        'example', jsonb_build_object('statement', $$Describe the palaver tree's importance using a superlative.$$, 'solution', $$The palaver tree is the most important place in the village, because it is where conflicts are solved.$$),
        'fixation', jsonb_build_object('question', $$Complete with the superlative: "The chieftain is ___ (respected) person in the village."$$, 'solution', $$The chieftain is the most respected person in the village.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: describing village surroundings$$,
        'body', $$A village has its own atmosphere, made of natural sights and everyday realities that both attract and challenge visitors.$$,
        'highlights', array[$$peaceful$$, $$hospitable$$, $$a dusty road$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a field$$, $$land used for growing crops$$),
            jsonb_build_array($$peaceful / restful$$, $$calm and quiet$$),
            jsonb_build_array($$hospitable$$, $$warm and welcoming to visitors$$),
            jsonb_build_array($$fresh air$$, $$clean air, free from pollution$$),
            jsonb_build_array($$a dusty road$$, $$an unpaved road covered in dust$$),
            jsonb_build_array($$dirty$$, $$not clean$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To compare two specific things, use "prefer + noun + to + noun" or "prefer + verb-ing + to + verb-ing".$$),
        'example', jsonb_build_object('statement', $$Say why someone prefers village life to city life.$$, 'solution', $$Aya prefers village life to city life because the air is fresher there.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "prefer ... to ...": "Kouamé likes working in the fields more than watching television."$$, 'solution', $$Kouamé prefers working in the fields to watching television.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparative or superlative: comparing two or comparing many?$$,
        'body', $$It's easy to confuse the comparative and the superlative, but the number of things being compared tells you which one to use.$$,
        'highlights', array[$$two things$$, $$three or more$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the comparative (-er / more) when comparing exactly two things: The village is quieter than the city. Use the superlative (-est / the most) when comparing three or more, or one thing against everyone/everything else: The village is the quietest place I know.$$),
        'example', jsonb_build_object('statement', $$Which is correct: "This is the more peaceful village in the region" or "This is the most peaceful village in the region"?$$, 'solution', $$"This is the most peaceful village in the region" is correct, because it compares this village to all the others in the region, not just to one.$$),
        'fixation', jsonb_build_object('question', $$Choose comparative or superlative: "Of all the villages I've visited, this one is ___ (friendly)."$$, 'solution', $$Of all the villages I've visited, this one is the friendliest -- superlative, because it compares to all the others.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is publishing a report comparing life in the village and life in the city, after your visit to a village elder.$$,
      'questions', array[
        $$Describe two customs or traditions you learned about.$$,
        $$Use a superlative to describe the most memorable thing about the village.$$,
        $$Use "prefer ... to ..." to express which lifestyle you personally prefer.$$,
        $$Suggest one way village life and city life could learn from each other.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete with the superlative: "Of all the elders in the village, the chieftain is ___ (wise)."$$,
      'hint', $$Short adjective: add -est.$$,
      'expected', $$Of all the elders in the village, the chieftain is the wisest.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the superlative (irregular adjective): "This is ___ (good) mango I have ever tasted."$$,
      'hint', $$"Good" is irregular: the best.$$,
      'expected', $$This is the best mango I have ever tasted.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "prefer ... to ...": "Villagers like eating fresh vegetables more than eating fast food."$$,
      'hint', $$prefer + noun/verb-ing + to + noun/verb-ing.$$,
      'expected', $$Villagers prefer eating fresh vegetables to eating fast food.$$
    ),
    jsonb_build_object(
      'question', $$Choose comparative or superlative: "This village is ___ (peaceful) than the noisy city." (comparing exactly two things)$$,
      'hint', $$Two things being compared need the comparative, not the superlative.$$,
      'expected', $$This village is more peaceful than the noisy city.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-au-village';
