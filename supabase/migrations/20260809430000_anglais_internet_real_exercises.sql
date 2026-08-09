-- No PDF exists for this lesson on ecole-ci.org (see
-- 20260806470000_anglais_ordinateur_content.sql for why -- the platform's
-- Anglais 3ème catalog stops at Unit 7, before this ICT lesson). The
-- Chrome browser extension could not reach the site in this session
-- either (host permission error on ecole-ci.org). These exercises are
-- therefore original English sentences written to match the grammar
-- already taught in this lesson's content (relative clauses with
-- who/which/that), at the same difficulty as the reachable Anglais 3ème
-- lessons, not copied from any specific source.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Define "a website" using a relative clause.$$,
    'hint', $$A website is a page which/that...$$,
    'expected', $$A website is a page which you can visit on the internet to find information.$$
  ),
  jsonb_build_object(
    'question', $$Complete with who or which: "A hacker is a person ___ tries to break into other people's accounts without permission."$$,
    'hint', $$"who" is used for people.$$,
    'expected', $$A hacker is a person who tries to break into other people's accounts without permission.$$
  ),
  jsonb_build_object(
    'question', $$Complete with which or that: "Wi-Fi is a connection ___ lets devices reach the internet without cables."$$,
    'hint', $$"which"/"that" is used for things.$$,
    'expected', $$Wi-Fi is a connection that lets devices reach the internet without cables.$$
  ),
  jsonb_build_object(
    'question', $$Give one piece of online-safety advice, using "shouldn't".$$,
    'hint', $$You shouldn't + base verb.$$,
    'expected', $$You shouldn't share your password with strangers online.$$
  )
)
where id = 'anglais-internet';
