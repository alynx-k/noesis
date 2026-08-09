-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806400000_anglais_droits_citoyen_content.sql, the 3ème equivalent,
-- for the CourseContentV2 shape). 3ème covered opinion phrases and "have
-- the right to"; this 4ème lesson steps up to the passive "are guaranteed
-- the right to" combined with modal "should be allowed to", the formal
-- register of a constitutional text.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your civics class is preparing an English-language poster on citizens' rights for the school's Constitution Day display. The teacher wants the poster to sound like an official constitutional text, not a casual list of opinions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: constitutional rights$$,
        'body', $$A constitutional poster requires precise, formal vocabulary for the protections citizens are given by law.$$,
        'highlights', array[$$a citizen$$, $$to safeguard$$, $$freedom of expression$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a citizen$$, $$a legal member of a country, with rights and duties$$),
            jsonb_build_array($$to safeguard$$, $$to protect from harm or loss$$),
            jsonb_build_array($$freedom of expression$$, $$the right to express opinions freely$$),
            jsonb_build_array($$a fair trial$$, $$a legal process conducted justly and openly$$),
            jsonb_build_array($$to violate (a right)$$, $$to break or fail to respect a right$$),
            jsonb_build_array($$sovereignty$$, $$the authority of a state to govern itself$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The passive "are guaranteed the right to + base verb" states a constitutional right formally: Citizens are guaranteed the right to a fair trial. This sounds more official than "have the right to".$$),
        'example', jsonb_build_object('statement', $$Rewrite "Citizens have the right to vote" in a formal, constitutional style.$$, 'solution', $$Citizens are guaranteed the right to vote.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Every citizen ___ (guarantee) the right to freedom of expression."$$, 'solution', $$Every citizen is guaranteed the right to freedom of expression.$$)
      ),
      jsonb_build_object(
        'heading', $$"Should be allowed to": rights as permissions$$,
        'body', $$Some rights are best expressed not as guarantees, but as things a person should be permitted to do without interference.$$,
        'highlights', array[$$should be allowed to$$, $$permission$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Should be allowed to + base verb" (passive modal) expresses that a person deserves permission to do something: Every citizen should be allowed to practise their own religion.$$),
        'example', jsonb_build_object('statement', $$State a right about religion using this structure.$$, 'solution', $$Citizens should be allowed to practise the religion of their choice.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Journalists ___ (should/allow) to report freely on public matters."$$, 'solution', $$Journalists should be allowed to report freely on public matters.$$)
      ),
      jsonb_build_object(
        'heading', $$A guaranteed right or a deserved permission?$$,
        'body', $$Constitutional posters often mix both structures, depending on whether a right is already firmly established by law or is being argued for as something that should exist.$$,
        'highlights', array[$$an established right$$, $$an argued right$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "are guaranteed the right to" for rights already firmly established by law. Use "should be allowed to" when arguing that a permission ought to exist, even where it may still be contested.$$),
        'example', jsonb_build_object('statement', $$Which fits better for an established legal right: "guaranteed" or "should be allowed"?$$, 'solution', $$"Are guaranteed the right to" fits better for an established legal right, since it states a fact rather than an argument.$$),
        'fixation', jsonb_build_object('question', $$Choose the right structure: "All citizens ___ (are guaranteed/should be allowed) the right to education under the constitution."$$, 'solution', $$All citizens are guaranteed the right to education under the constitution, because this is an established legal right.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your civics class poster for Constitution Day must present citizens' rights in a formal, official style.$$,
      'questions', array[
        $$State one constitutional right using "are guaranteed the right to".$$,
        $$State one right using "should be allowed to".$$,
        $$Explain why one of these rights matters for a fair society.$$,
        $$Give an example of what happens when a right is violated.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Rewrite formally: "Every citizen has the right to a fair trial."$$,
      'hint', $$Use the passive "are guaranteed the right to".$$,
      'expected', $$Every citizen is guaranteed the right to a fair trial.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Citizens ___ (should/allow) to vote freely in every election."$$,
      'hint', $$Should be allowed to + base verb.$$,
      'expected', $$Citizens should be allowed to vote freely in every election.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Every child ___ (guarantee) the right to free primary education."$$,
      'hint', $$Passive: is guaranteed the right to.$$,
      'expected', $$Every child is guaranteed the right to free primary education.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "Minority groups ___ (should/allow) to preserve their own language and culture."$$,
      'hint', $$Should be allowed to + base verb.$$,
      'expected', $$Minority groups should be allowed to preserve their own language and culture.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-droits-citoyen';
