-- No PDF exists for this lesson on ecole-ci.org (see
-- 20260806470000_anglais_ordinateur_content.sql for why -- the platform's
-- Anglais 3ème catalog stops at Unit 7, before this ICT lesson). The
-- Chrome browser extension could not reach the site in this session
-- either (host permission error on ecole-ci.org). These exercises are
-- therefore original English sentences written to match the grammar
-- already taught in this lesson's content (can/could for ability, the
-- passive voice), at the same difficulty as the reachable Anglais 3ème
-- lessons, not copied from any specific source.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Complete with can or could: "This new smartphone ___ (take) pictures even in the dark."$$,
    'hint', $$can + base verb for a present ability.$$,
    'expected', $$This new smartphone can take pictures even in the dark.$$
  ),
  jsonb_build_object(
    'question', $$Complete with can or could: "My father's first mobile phone ___ (not/send) photos."$$,
    'hint', $$could + base verb for a past ability.$$,
    'expected', $$My father's first mobile phone couldn't send photos.$$
  ),
  jsonb_build_object(
    'question', $$Rewrite in the passive: "People send text messages instantly nowadays."$$,
    'hint', $$subject + is/are + past participle.$$,
    'expected', $$Text messages are sent instantly nowadays.$$
  ),
  jsonb_build_object(
    'question', $$Complete with the passive: "A missed call ___ (usually/return) as soon as possible."$$,
    'hint', $$is/are + past participle.$$,
    'expected', $$A missed call is usually returned as soon as possible.$$
  )
)
where id = 'anglais-telephone';
