-- No PDF exists for this lesson on ecole-ci.org: the platform's Anglais
-- 3ème catalog stops at Unit 7 (Hygiene and Health), so this ICT lesson has
-- no matching source page at all, as already noted in
-- 20260806470000_anglais_ordinateur_content.sql. The Chrome browser
-- extension could not reach the site in this session either (host
-- permission error on ecole-ci.org). These exercises are therefore
-- original English sentences written to match the grammar already taught
-- in this lesson's content (present perfect, relative clauses), at the
-- same difficulty as the reachable Anglais 3ème lessons, not copied from
-- any specific source.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Complete with the present perfect: "My little sister ___ (never/switch) on a computer by herself before today."$$,
    'hint', $$have/has + never + past participle.$$,
    'expected', $$My little sister has never switched on a computer by herself before today.$$
  ),
  jsonb_build_object(
    'question', $$Ask a question with the present perfect: (your classmates / ever / install / a program on a computer)$$,
    'hint', $$Have + subject + ever + past participle...?$$,
    'expected', $$Have your classmates ever installed a program on a computer?$$
  ),
  jsonb_build_object(
    'question', $$Define "a screen" using a relative clause.$$,
    'hint', $$A screen is the part of a computer that/which...$$,
    'expected', $$A screen is the part of a computer that displays the text and images.$$
  ),
  jsonb_build_object(
    'question', $$Complete with a relative clause: "A file is a document ___ (save) on a computer so it can be opened later."$$,
    'hint', $$that/which + is + past participle.$$,
    'expected', $$A file is a document that is saved on a computer so it can be opened later.$$
  )
)
where id = 'anglais-ordinateur';
