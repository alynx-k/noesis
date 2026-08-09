-- No PDF exists for this lesson on ecole-ci.org (UNIT 7 HYGIENE AND
-- HEALTH, Lesson 2 -- only Lesson 1 and Lesson 3 of this unit have
-- uploaded PDFs, as already noted in
-- 20260806460000_anglais_hygiene_ecole_content.sql) and the Chrome browser
-- extension could not reach the site in this session either (host
-- permission error on ecole-ci.org). These exercises are therefore
-- original English sentences written to match the grammar already taught
-- in this lesson's content (should/shouldn't for advice, first
-- conditional for consequences), at the same difficulty as the reachable
-- Anglais 3ème lessons, not copied from any specific source.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Give hygiene advice using "should": (sweep the classroom floor every morning)$$,
    'hint', $$You should + base verb.$$,
    'expected', $$You should sweep the classroom floor every morning.$$
  ),
  jsonb_build_object(
    'question', $$Give hygiene advice using "shouldn't": (share your cup with your classmates)$$,
    'hint', $$You shouldn't + base verb.$$,
    'expected', $$You shouldn't share your cup with your classmates.$$
  ),
  jsonb_build_object(
    'question', $$Complete with the first conditional: "If pupils ___ (not/wash) their hands before eating, germs ___ (spread) quickly among them."$$,
    'hint', $$if + present simple, ... will + base verb.$$,
    'expected', $$If pupils don't wash their hands before eating, germs will spread quickly among them.$$
  ),
  jsonb_build_object(
    'question', $$Turn this piece of advice into a first-conditional consequence: "You should trim your nails regularly."$$,
    'hint', $$If you + present simple, you will + base verb.$$,
    'expected', $$If you trim your nails regularly, you will avoid carrying germs under them.$$
  )
)
where id = 'anglais-hygiene-ecole';
