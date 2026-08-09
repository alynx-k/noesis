-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806390000_anglais_exode_rural_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered "because of/due to/since" and
-- "so/as a result"; this 4ème lesson steps up to the passive for causes
-- ("are attracted by") and gerund subject clauses ("Leaving the village
-- results in..."), a more analytical register for discussing migration.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A university student researching rural migration in Côte d'Ivoire visits your school to interview students about why young people leave villages for cities. Your English Club is preparing a short written analysis for her study.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: analysing migration$$,
        'body', $$An analytical piece about rural migration needs vocabulary for the forces that push people away and pull them toward cities.$$,
        'highlights', array[$$to be attracted by$$, $$scarcity$$, $$a push factor$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to be attracted by$$, $$to be drawn towards something appealing$$),
            jsonb_build_array($$scarcity$$, $$a shortage; not enough of something$$),
            jsonb_build_array($$a push factor$$, $$a reason that drives people away from a place$$),
            jsonb_build_array($$a pull factor$$, $$a reason that draws people towards a place$$),
            jsonb_build_array($$to deplete$$, $$to reduce something's supply seriously$$),
            jsonb_build_array($$a workforce$$, $$the group of people available to work$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The passive voice can describe what draws people to move: "be attracted by/to" focuses on the pull itself, not on the person deciding: Young people are attracted by the promise of better wages in the city.$$),
        'example', jsonb_build_object('statement', $$Explain what attracts young people to the city.$$, 'solution', $$Young people are attracted by the wider range of job opportunities in the city.$$),
        'fixation', jsonb_build_object('question', $$Complete: "Many farmers ___ (attract) by the possibility of higher wages in construction."$$, 'solution', $$Many farmers are attracted by the possibility of higher wages in construction.$$)
      ),
      jsonb_build_object(
        'heading', $$Gerund subject clauses: "Leaving the village results in..."$$,
        'body', $$An analytical text often needs to talk about an action itself, as a general idea, rather than about a specific person doing it -- English uses the gerund as a subject for this.$$,
        'highlights', array[$$leaving$$, $$results in$$, $$leads to$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$A gerund (verb + -ing) can act as the subject of a sentence, describing an action in general: Leaving the village results in a smaller workforce for farming. Migrating to the city leads to overcrowded housing.$$),
        'example', jsonb_build_object('statement', $$Describe the general result of young people leaving farms.$$, 'solution', $$Abandoning farm work leads to a decline in local food production.$$),
        'fixation', jsonb_build_object('question', $$Complete: "___ (move) to the city often results in a loss of traditional skills."$$, 'solution', $$Moving to the city often results in a loss of traditional skills.$$)
      ),
      jsonb_build_object(
        'heading', $$Building an analytical argument$$,
        'body', $$Combining passive cause-language with gerund-subject consequences allows a written analysis to sound objective rather than personal.$$,
        'highlights', array[$$a cause$$, $$a consequence$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "be attracted by / to" to explain what pulls people towards cities, and a gerund subject with "results in / leads to" to explain the wider consequence of that movement. Together they build a two-part cause-and-consequence argument.$$),
        'example', jsonb_build_object('statement', $$Combine a pull factor and its consequence about education.$$, 'solution', $$Students are attracted by better schools in the city. Leaving rural schools understaffed leads to a decline in the quality of village education.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct structure: "___ (Losing/Lost) young workers weakens the village economy."$$, 'solution', $$Losing young workers weakens the village economy, because the gerund acts as the subject of the sentence.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your written analysis for the university researcher must explain why young people leave villages and the wider consequences of that movement.$$,
      'questions', array[
        $$Explain one pull factor using "be attracted by/to".$$,
        $$Explain one consequence of rural migration using a gerund subject with "results in" or "leads to".$$,
        $$Give one push factor that drives people away from villages.$$,
        $$Suggest one solution to reduce rural migration.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "Young graduates ___ (attract) by the availability of office jobs in the capital."$$,
      'hint', $$Passive: be + attracted by.$$,
      'expected', $$Young graduates are attracted by the availability of office jobs in the capital.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "___ (Abandon) family farms often results in a shortage of local food."$$,
      'hint', $$Use the gerund (verb + -ing) as the subject of the sentence.$$,
      'expected', $$Abandoning family farms often results in a shortage of local food.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite in the passive: "Better hospitals attract many rural families to the city."$$,
      'hint', $$Focus on the families being attracted, not on the hospitals doing the attracting.$$,
      'expected', $$Many rural families are attracted to the city by better hospitals.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "___ (Leave) the countryside empty leads to a decline in agricultural production."$$,
      'hint', $$Gerund subject clause.$$,
      'expected', $$Leaving the countryside empty leads to a decline in agricultural production.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-exode-rural';
