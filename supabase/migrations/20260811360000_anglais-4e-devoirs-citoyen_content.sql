-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806410000_anglais_devoirs_citoyen_content.sql, the 3ème equivalent,
-- for the CourseContentV2 shape). 3ème covered have to/must/needn't for
-- necessity; this 4ème lesson steps up to modal perfect "should have + past
-- participle" for missed civic obligations and the passive "must be
-- obeyed" for laws in general.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A local radio debate is discussing why some citizens fail to fulfil basic civic duties, such as paying taxes or voting. Your English Club has been invited to submit written comments, both about laws in general and about specific missed obligations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: civic duty and failure to act$$,
        'body', $$Discussing missed civic duties requires vocabulary about neglect, consequence, and responsibility.$$,
        'highlights', array[$$to neglect$$, $$accountable$$, $$to comply with$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to neglect$$, $$to fail to do something that should be done$$),
            jsonb_build_array($$accountable$$, $$responsible and required to explain one's actions$$),
            jsonb_build_array($$to comply with$$, $$to act according to a rule or law$$),
            jsonb_build_array($$a penalty$$, $$a punishment for breaking a rule$$),
            jsonb_build_array($$civic-minded$$, $$caring about and acting for the good of the community$$),
            jsonb_build_array($$to enforce (a law)$$, $$to make sure a law is obeyed$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Should have + past participle" describes a past duty that was not fulfilled, and expresses regret or criticism: He should have paid his taxes on time. She shouldn't have ignored the summons.$$),
        'example', jsonb_build_object('statement', $$Criticise someone who didn't vote.$$, 'solution', $$He should have voted in the last election, but he stayed at home instead.$$),
        'fixation', jsonb_build_object('question', $$Complete: "The shop owner ___ (should) register his business, but he never did."$$, 'solution', $$The shop owner should have registered his business, but he never did.$$)
      ),
      jsonb_build_object(
        'heading', $$Laws in the passive: "must be obeyed"$$,
        'body', $$Speaking about laws in general -- not one person's duty, but a rule that applies to everyone -- calls for the passive voice.$$,
        'highlights', array[$$must be obeyed$$, $$must be respected$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Must + be + past participle" states a general legal necessity, focusing on the rule rather than on any one person: Traffic laws must be obeyed by everyone. Public property must be respected.$$),
        'example', jsonb_build_object('statement', $$State a general rule about tax laws.$$, 'solution', $$Tax laws must be respected by every citizen, regardless of income.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Election rules ___ (must/obey) during every vote."$$, 'solution', $$Election rules must be obeyed during every vote.$$)
      ),
      jsonb_build_object(
        'heading', $$General rule or specific missed duty?$$,
        'body', $$A civic-minded comment often states the general rule first, then criticises a specific failure to follow it.$$,
        'highlights', array[$$a general rule$$, $$a specific failure$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "must be + past participle" to state a rule that applies to everyone. Use "should have + past participle" to criticise a specific person's past failure to follow that rule.$$),
        'example', jsonb_build_object('statement', $$Combine a general rule about voting with a criticism of one person's failure.$$, 'solution', $$Every citizen's vote must be respected. He should have exercised that right instead of staying home.$$),
        'fixation', jsonb_build_object('question', $$Choose the right structure: "Traffic signals ___ (must be obeyed/should have obeyed) at every junction."$$, 'solution', $$Traffic signals must be obeyed at every junction, because this states a general rule, not a criticism of one person.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your written comment for the radio debate must discuss civic duties, both as a general rule and by criticising a specific failure to fulfil one.$$,
      'questions', array[
        $$State one general civic rule using the passive "must be + past participle".$$,
        $$Criticise a specific missed civic duty using "should have + past participle".$$,
        $$Explain the consequence when citizens neglect their duties.$$,
        $$Suggest one way to encourage citizens to be more civic-minded.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "Public regulations ___ (must/respect) by all residents."$$,
      'hint', $$Passive: must be + past participle.$$,
      'expected', $$Public regulations must be respected by all residents.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "He ___ (should) his taxes last year, but he forgot to."$$,
      'hint', $$Should have + past participle, for a past duty that was not fulfilled.$$,
      'expected', $$He should have paid his taxes last year, but he forgot to.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite in the passive: "Everyone must follow the community's waste-disposal rules."$$,
      'hint', $$Focus on the rules being followed, not on the people.$$,
      'expected', $$The community's waste-disposal rules must be followed by everyone.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "She ___ (should/not) ignored the jury summons; she ___ (should) attended."$$,
      'hint', $$Should have + past participle for both the criticism and the missed duty.$$,
      'expected', $$She shouldn't have ignored the jury summons; she should have attended.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-devoirs-citoyen';
