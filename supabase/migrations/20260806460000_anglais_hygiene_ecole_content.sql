-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Unlike the other Anglais lessons, this course's
-- ecole-ci.org page (UNIT 7 HYGIENE AND HEALTH, Lesson 2) has no uploaded
-- PDF -- only Lesson 1 and Lesson 3 of this unit are available -- so this
-- content is written from the lesson's own title/topic and the standard
-- 3ème English-programme scope, same fallback used for
-- anglais-femme-rurale. Grammar chosen (should/shouldn't for advice, first
-- conditional for consequences) bridges Lesson 1's vocabulary about
-- diseases and Lesson 3's must/mustn't advice, without repeating either.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your school is launching a "Clean School" campaign for International Hygiene Day. Your English Club prepares posters in English to remind students of good hygiene habits.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: hygiene at school$$,
        'body', $$Keeping a school clean and healthy depends on simple daily habits and the objects that make them possible.$$,
        'highlights', array[$$germs$$, $$litter$$, $$a rubbish bin$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$germs$$, $$tiny living things that can cause disease$$),
            jsonb_build_array($$litter$$, $$rubbish left in a public place instead of a bin$$),
            jsonb_build_array($$a rubbish bin$$, $$a container used to throw away waste$$),
            jsonb_build_array($$soap$$, $$a substance used with water to clean the body or hands$$),
            jsonb_build_array($$contagious$$, $$able to spread easily from person to person$$),
            jsonb_build_array($$to sweep$$, $$to clean a floor using a broom$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To give friendly hygiene advice, use "should + base verb" for a recommendation, and "shouldn't + base verb" for something to avoid: You should wash your hands before eating. You shouldn't drop litter in the schoolyard.$$),
        'example', jsonb_build_object('statement', $$Give hygiene advice using "should" and "shouldn't".$$, 'solution', $$You should wash your hands after using the toilet. You shouldn't share your cup with classmates.$$),
        'fixation', jsonb_build_object('question', $$Rewrite as advice using "should": "It's a good idea to sweep the classroom every morning."$$, 'solution', $$You should sweep the classroom every morning.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: staying healthy at school$$,
        'body', $$Beyond cleaning, good hygiene also means taking care of your own body and noticing when something isn't right.$$,
        'highlights', array[$$to fall ill$$, $$to spread$$, $$clean water$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to fall ill$$, $$to become sick$$),
            jsonb_build_array($$to spread$$, $$to pass from one person or place to another$$),
            jsonb_build_array($$clean water$$, $$water that is safe to drink or wash with$$),
            jsonb_build_array($$a toilet$$, $$a place used to relieve oneself, which must be kept clean$$),
            jsonb_build_array($$to trim your nails$$, $$to cut your nails short and neat$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To describe a real hygiene consequence, use the first conditional: If + present simple, ... will + base verb. It links a hygiene habit to its likely result.$$),
        'example', jsonb_build_object('statement', $$Describe the consequence of not washing your hands, using the first conditional.$$, 'solution', $$If you don't wash your hands before eating, germs will spread and you will risk falling ill.$$),
        'fixation', jsonb_build_object('question', $$Complete with the first conditional: "If the toilets ___ (not/be) clean, diseases ___ (spread) faster."$$, 'solution', $$If the toilets aren't clean, diseases will spread faster.$$)
      ),
      jsonb_build_object(
        'heading', $$Should or if: two ways to encourage good hygiene$$,
        'body', $$You can encourage good hygiene either by giving direct advice, or by explaining the real consequence of an action -- both are useful, but for different situations.$$,
        'highlights', array[$$direct advice$$, $$a real consequence$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "should/shouldn't" when you simply want to recommend or discourage a habit. Use the first conditional (if + present, ... will) when you want to explain exactly what will happen as a result.$$),
        'example', jsonb_build_object('statement', $$Turn this advice into a conditional consequence: "You should throw litter in the bin."$$, 'solution', $$If you throw litter in the bin, the schoolyard will stay clean.$$),
        'fixation', jsonb_build_object('question', $$Turn this conditional into simple advice using "should": "If you drink clean water, you will stay healthy."$$, 'solution', $$You should drink clean water.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is designing a poster for the school's "Clean School" campaign.$$,
      'questions', array[
        $$Give two pieces of hygiene advice using "should" and "shouldn't".$$,
        $$Explain one consequence of poor hygiene, using the first conditional.$$,
        $$Suggest one hygiene habit the whole school could adopt.$$,
        $$Explain why hygiene at school matters for everyone's health.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Give advice using "should": (wash your hands before eating)$$,
      'hint', $$You should + base verb.$$,
      'expected', $$You should wash your hands before eating.$$
    ),
    jsonb_build_object(
      'question', $$Give advice using "shouldn't": (drop litter in the schoolyard)$$,
      'hint', $$You shouldn't + base verb.$$,
      'expected', $$You shouldn't drop litter in the schoolyard.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the first conditional: "If students ___ (not/clean) the classroom, germs ___ (spread) quickly."$$,
      'hint', $$if + present simple, ... will + base verb.$$,
      'expected', $$If students don't clean the classroom, germs will spread quickly.$$
    ),
    jsonb_build_object(
      'question', $$Turn this advice into a first-conditional consequence: "You should drink clean water."$$,
      'hint', $$If you + present simple, you will + base verb.$$,
      'expected', $$If you drink clean water, you will stay healthy.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-hygiene-ecole';
