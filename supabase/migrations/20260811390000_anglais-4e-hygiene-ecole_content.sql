-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806460000_anglais_hygiene_ecole_content.sql, the 3ème equivalent,
-- for the CourseContentV2 shape). 3ème covered should/shouldn't and the
-- first conditional; this 4ème lesson steps up to the second conditional
-- for hypothetical hygiene consequences and "unless" as an alternative
-- condition, a harder layer of the same cause-effect reasoning.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school's health prefect team is preparing a persuasive talk for assembly about hygiene at school. Instead of simple rules, they want to make students imagine what would happen -- good or bad -- depending on the choices they make.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: hygiene and its hypothetical effects$$,
        'body', $$Persuading students to imagine consequences requires vocabulary about cleanliness standards and the spread of illness.$$,
        'highlights', array[$$contagious$$, $$sanitation$$, $$to contaminate$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$contagious$$, $$able to spread from one person to another$$),
            jsonb_build_array($$sanitation$$, $$systems for keeping places clean and healthy$$),
            jsonb_build_array($$to contaminate$$, $$to make something dirty or unsafe$$),
            jsonb_build_array($$hand sanitiser$$, $$a liquid or gel used to clean hands without water$$),
            jsonb_build_array($$a breeding ground$$, $$a place where something harmful develops easily$$),
            jsonb_build_array($$to dispose of (waste)$$, $$to get rid of waste properly$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The second conditional imagines a hypothetical situation and its likely result: If + past simple, ... would + base verb. If students didn't wash their hands, illness would spread much faster.$$),
        'example', jsonb_build_object('statement', $$Imagine what would happen if the school had no clean toilets.$$, 'solution', $$If the school had no clean toilets, far more students would fall sick.$$),
        'fixation', jsonb_build_object('question', $$Complete: "If we ___ (not/clean) the classroom regularly, germs ___ (spread) more easily."$$, 'solution', $$If we didn't clean the classroom regularly, germs would spread more easily.$$)
      ),
      jsonb_build_object(
        'heading', $$"Unless": an alternative condition$$,
        'body', $$"Unless" offers another way to link a hygiene habit to its consequence, stating the one exception that would prevent a bad outcome.$$,
        'highlights', array[$$unless$$, $$an exception$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Unless" means "if not": Unless students wash their hands, illness will spread = If students don't wash their hands, illness will spread. It can be used with a real (first conditional) or hypothetical (second conditional) consequence.$$),
        'example', jsonb_build_object('statement', $$Rewrite "If we don't dispose of waste properly, it will attract insects" using "unless".$$, 'solution', $$Unless we dispose of waste properly, it will attract insects.$$),
        'fixation', jsonb_build_object('question', $$Complete with "unless": "___ everyone cleans up after break, the schoolyard will stay dirty."$$, 'solution', $$Unless everyone cleans up after break, the schoolyard will stay dirty.$$)
      ),
      jsonb_build_object(
        'heading', $$A real warning or a hypothetical one?$$,
        'body', $$Choosing between the first and second conditional with "unless" changes how likely or imaginary the warning sounds.$$,
        'highlights', array[$$a real warning$$, $$a hypothetical warning$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use the first conditional with "unless" for a real, likely warning about the near future (Unless you wash your hands, you will get sick). Use the second conditional for a more hypothetical, imagined scenario, often about an unlikely or extreme situation (Unless the school changed its habits completely, hygiene problems would never improve).$$),
        'example', jsonb_build_object('statement', $$Which fits an everyday warning: first or second conditional?$$, 'solution', $$The first conditional fits an everyday warning better, because it describes a real, likely outcome (Unless you wash your hands, you'll catch a cold).$$),
        'fixation', jsonb_build_object('question', $$Choose the correct tense: "Unless the whole school ___ (change) its habits, hygiene problems will continue."$$, 'solution', $$Unless the whole school changes its habits, hygiene problems will continue, because this is a real, likely warning.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your health prefect team's assembly talk must persuade students to imagine the consequences of good and bad hygiene habits.$$,
      'questions', array[
        $$Describe a hypothetical bad consequence using the second conditional.$$,
        $$Give a warning using "unless".$$,
        $$Describe one positive habit students should adopt.$$,
        $$Explain why hygiene at school matters for the whole community.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "If students ___ (not/wash) their hands before eating, they ___ (fall) sick more often."$$,
      'hint', $$Second conditional: if + past simple, ... would + base verb.$$,
      'expected', $$If students didn't wash their hands before eating, they would fall sick more often.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "unless": "If you don't cover your mouth when you cough, you will spread germs."$$,
      'hint', $$"Unless" replaces "if...not".$$,
      'expected', $$Unless you cover your mouth when you cough, you will spread germs.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Unless the school ___ (provide) enough bins, litter ___ (keep) piling up."$$,
      'hint', $$First conditional for a real, likely outcome.$$,
      'expected', $$Unless the school provides enough bins, litter will keep piling up.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If everyone ___ (use) hand sanitiser, the classroom ___ (be) far more hygienic."$$,
      'hint', $$Second conditional for a hypothetical result.$$,
      'expected', $$If everyone used hand sanitiser, the classroom would be far more hygienic.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-hygiene-ecole';
