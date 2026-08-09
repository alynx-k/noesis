-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806300000_anglais_jeune_fille_ecole_content.sql, the 3ème
-- equivalent, for the CourseContentV2 shape). 3ème covered "I think that" /
-- should vs must; this 4ème lesson steps up to the passive "it is believed
-- that" for reporting general opinion, and the correlative comparative "the
-- more... the more" for cause-and-effect arguments.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A national education campaign is collecting student essays on why girls' schooling matters for the whole community. Your English teacher wants your essay to sound more persuasive than a simple opinion -- using the way widely-held beliefs and cause-and-effect arguments are phrased in real editorials.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: the case for girls' education$$,
        'body', $$A persuasive essay about girls' schooling needs precise vocabulary about opportunity, community impact, and long-term change.$$,
        'highlights', array[$$empowerment$$, $$a ripple effect$$, $$to break the cycle$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$empowerment$$, $$giving someone more control over their own life$$),
            jsonb_build_array($$a ripple effect$$, $$a spreading effect, like a wave, from one action to many others$$),
            jsonb_build_array($$to break the cycle$$, $$to stop a pattern from repeating itself$$),
            jsonb_build_array($$literacy$$, $$the ability to read and write$$),
            jsonb_build_array($$to invest in$$, $$to devote time or money to something for future benefit$$),
            jsonb_build_array($$upward mobility$$, $$the ability to improve one's social or economic position$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The passive "it is believed / said / thought that + subject + verb" reports a widely-held opinion without naming who holds it, giving an essay a more objective, editorial tone than "I think that".$$),
        'example', jsonb_build_object('statement', $$Rewrite "I think that educated girls raise healthier families" more formally.$$, 'solution', $$It is widely believed that educated girls raise healthier families.$$),
        'fixation', jsonb_build_object('question', $$Complete: "It ___ (say) that a single educated girl can transform an entire community."$$, 'solution', $$It is said that a single educated girl can transform an entire community.$$)
      ),
      jsonb_build_object(
        'heading', $$"The more... the more": cause and effect$$,
        'body', $$To argue that one change leads directly to another, growing, change, English pairs two comparatives together in a single, forceful sentence.$$,
        'highlights', array[$$the more$$, $$the fewer$$, $$the sooner$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"The + comparative..., the + comparative..." links two changes that happen together: The more girls stay in school, the stronger the community becomes. Both halves use a comparative form, and the structure inverts normal word order.$$),
        'example', jsonb_build_object('statement', $$Link "more girls educated" and "fewer child marriages" using this structure.$$, 'solution', $$The more girls are educated, the fewer child marriages there are.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The ___ (early) girls start school, the ___ (great) their chances of success."$$, 'solution', $$The earlier girls start school, the greater their chances of success.$$)
      ),
      jsonb_build_object(
        'heading', $$Building a persuasive argument$$,
        'body', $$Combining a reported belief with a cause-and-effect comparative gives an essay both credibility and force.$$,
        'highlights', array[$$credibility$$, $$force$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Open a paragraph with "It is believed / widely accepted that..." to state the general idea, then support it with a "the more... the more" sentence that shows the mechanism of change. This mirrors how real editorials build an argument.$$),
        'example', jsonb_build_object('statement', $$Combine both structures in one short argument about school fees.$$, 'solution', $$It is widely accepted that school fees keep many girls at home. The lower the fees, the more girls can afford to stay in school.$$),
        'fixation', jsonb_build_object('question', $$Complete the second sentence to match the first: "It is believed that literacy changes lives. The ___ (high) the literacy rate, the ___ (strong) the economy."$$, 'solution', $$The higher the literacy rate, the stronger the economy.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your essay for the national education campaign must persuade readers that girls' schooling benefits the whole community.$$,
      'questions', array[
        $$State one widely-held belief about girls' education using "it is believed/said that".$$,
        $$Use "the more... the more" to link girls' schooling to a positive community outcome.$$,
        $$Give one obstacle that still prevents some girls from attending school.$$,
        $$Propose one solution to that obstacle.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Rewrite formally using "it is believed that": "I think that girls who finish school earn more money."$$,
      'hint', $$Use the passive reporting structure instead of "I think that".$$,
      'expected', $$It is believed that girls who finish school earn more money.$$
    ),
    jsonb_build_object(
      'question', $$Complete with "the more... the more": "___ (many) girls attend school, ___ (strong) the community becomes."$$,
      'hint', $$Both halves need a comparative form after "the".$$,
      'expected', $$The more girls attend school, the stronger the community becomes.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "It ___ (widely/accept) that education breaks the cycle of poverty."$$,
      'hint', $$Use the passive with "is widely accepted that".$$,
      'expected', $$It is widely accepted that education breaks the cycle of poverty.$$
    ),
    jsonb_build_object(
      'question', $$Complete with "the more... the fewer": "___ (educated) a girl becomes, the ___ (few) obstacles she faces later in life."$$,
      'hint', $$"Fewer" is the comparative used with countable nouns like "obstacles".$$,
      'expected', $$The more educated a girl becomes, the fewer obstacles she faces later in life.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-jeune-fille-ecole';
