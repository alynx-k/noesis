-- No PDF exists for this lesson on ecole-ci.org (UNIT 2 WOMEN AT WORK,
-- Lesson 1 has only non-extractable H5P activities, as already noted in
-- 20260806280000_anglais_femme_rurale_content.sql) and the Chrome browser
-- extension could not reach the site in this session either (host
-- permission error on ecole-ci.org). These exercises are therefore
-- original English sentences written to match the grammar already taught
-- in this lesson's content (present simple routines, have to/must,
-- comparatives), at the same difficulty as the reachable Anglais 3ème
-- lessons, not copied from any specific source.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Fill the gap with the present simple: Every dry season, Adjoua ___ (carry) water from the well to her house twice a day.$$,
    'hint', $$Present simple, third person singular: add -s or -es.$$,
    'expected', $$Every dry season, Adjoua carries water from the well to her house twice a day.$$
  ),
  jsonb_build_object(
    'question', $$Rewrite using "have to": "It is necessary for Mariam to sell her cassava at the market before it spoils."$$,
    'hint', $$Subject + has to/have to + base verb.$$,
    'expected', $$Mariam has to sell her cassava at the market before it spoils.$$
  ),
  jsonb_build_object(
    'question', $$Complete the comparison: Fetching firewood in the dry season is ___ (tiring) than fetching it in the rainy season.$$,
    'hint', $$Short adjective ending in -y changes to -ier.$$,
    'expected', $$Fetching firewood in the dry season is more tiring than fetching it in the rainy season.$$
  ),
  jsonb_build_object(
    'question', $$Choose "don't have to" or "mustn't" to complete the sentence correctly: Rural women ___ let their harvest rot before selling it.$$,
    'hint', $$This sentence expresses a prohibition, not just an absence of obligation.$$,
    'expected', $$Rural women mustn't let their harvest rot before selling it.$$
  )
)
where id = 'anglais-femme-rurale';
