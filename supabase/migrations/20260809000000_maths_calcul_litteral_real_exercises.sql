-- Fallback exercises for 'maths-calcul-litteral': the real ecole-ci.org
-- "Exercices d'application" PDF could not be fetched this session. The site
-- requires a login (élève/visiteur) that only accepts a phone number for
-- verification, with no credentials available; /co/logineleve.php and
-- /co/loginvisiteur.php were both tried and blocked, and the site has no
-- content indexed outside that login wall (confirmed via web search). These
-- items are original exercises written from general knowledge of the
-- standard 3ème programme topic (calcul littéral: quotients égaux,
-- puissances, identités remarquables, factorisation), matching the
-- difficulty/structure of this lesson's own content sections. Entirely
-- original wording; exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Détermine le nombre b tel que 8/b = 20/15.$$,
    'hint', $$Relis l'égalité de deux quotients : a/b = c/d équivaut à a × d = b × c.$$,
    'expected', $$8/b = 20/15 équivaut à 8×15 = 20×b, donc 120 = 20b, donc b = 6.$$
  ),
  jsonb_build_object(
    'question', $$Écris sous la forme d'une seule puissance : 6² × 6⁻⁵.$$,
    'hint', $$Relis les propriétés des puissances à exposant négatif : aⁿ × aᵃ = aⁿ⁺ᵃ.$$,
    'expected', $$6² × 6⁻⁵ = 6⁻³ = 1/216.$$
  ),
  jsonb_build_object(
    'question', $$Développe et réduis : (2x−1)² + (x+3)(x−3).$$,
    'hint', $$Relis d'abord les identités remarquables, puis développe chaque terme séparément avant de réduire.$$,
    'expected', $$(2x−1)² = 4x² − 4x + 1, et (x+3)(x−3) = x² − 9. En additionnant : 4x²−4x+1+x²−9 = 5x² − 4x − 8.$$
  ),
  jsonb_build_object(
    'question', $$Factorise 9x² − 25.$$,
    'hint', $$Relis les identités remarquables à l'envers : reconnais une différence de deux carrés.$$,
    'expected', $$9x² − 25 = (3x)² − 5² = (3x−5)(3x+5).$$
  )
)
where id = 'maths-calcul-litteral';
