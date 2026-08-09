-- Fallback exercises for 'maths-equations-rxr': same unreachable-source
-- situation as 20260809000000_maths_calcul_litteral_real_exercises.sql.
-- Original exercises from general knowledge of the standard 3ème programme
-- topic (équations et inéquations du premier degré dans ℝ×ℝ: couples
-- solutions, substitution, combinaison, problèmes), matching the
-- difficulty/structure of this lesson's own content sections. Entirely
-- original wording; exercise_questions only, content untouched.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Vérifie si le couple (4;−1) est solution de l'équation 3x+2y=10.$$,
    'hint', $$Relis la définition d'un couple solution : remplace x et y puis vérifie l'égalité.$$,
    'expected', $$3×4+2×(−1) = 12−2 = 10. Le couple (4;−1) est bien solution.$$
  ),
  jsonb_build_object(
    'question', $$Résous par substitution le système {2x+y=11 ; x−y=1}.$$,
    'hint', $$Relis la méthode de substitution : isole x dans la deuxième équation, remplace dans la première.$$,
    'expected', $$De la deuxième équation, x=1+y. En remplaçant dans la première : 2(1+y)+y=11, donc 2+3y=11, donc y=3. Alors x=1+3=4. Solution : (4;3).$$
  ),
  jsonb_build_object(
    'question', $$Résous par combinaison le système {5x+2y=19 ; 3x−2y=5}.$$,
    'hint', $$Relis la méthode de combinaison : additionne les deux équations pour éliminer y.$$,
    'expected', $$En additionnant : 8x=24, donc x=3. En remplaçant dans la première : 15+2y=19, donc y=2. Solution : (3;2).$$
  ),
  jsonb_build_object(
    'question', $$Un atelier de couture vend des nappes brodées à 3000 F et des sets de table à 1000 F. Un jour, il vend 25 articles en tout pour une recette de 51000 F. Combien de nappes et de sets a-t-il vendus ?$$,
    'hint', $$Relis la méthode pour un problème conduisant à un système : nomme les inconnues, traduis, résous.$$,
    'expected', $$Notons x le nombre de nappes et y celui des sets. On résout {x+y=25 ; 3000x+1000y=51000}, soit {x+y=25 ; 3x+y=51}. En soustrayant : 2x=26, donc x=13. Alors y=12. Il a vendu 13 nappes et 12 sets.$$
  )
)
where id = 'maths-equations-rxr';
