-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2025: "MATHS_1C L4: DENOMBREMENT"
-- (https://lyc.ecole-ci.org/course/view.php?id=2025), resource id 17762.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-denombrement',
  '1ere',
  'C',
  'mathematiques',
  $$Dénombrement$$,
  4,
  '1ere-c-maths-generalites-fonctions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur les 25 élèves de 1ère scientifique, 15 jouent au handball, 10 jouent au basketball et 5 pratiquent les deux sports. Le Chef d'établissement veut dénombrer les élèves qui ne pratiquent aucun sport, pour connaître le nombre exact de maillots restants.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Cardinal, réunion, intersection et complémentaire$$,
        'body', $$Le cardinal Card(E) d'un ensemble fini E est son nombre d'éléments. Pour deux ensembles finis : Card(A∪B) = Card(A) + Card(B) − Card(A∩B). Le complémentaire de A dans E (noté Ā ou CEA) est l'ensemble des éléments de E n'appartenant pas à A ; on a A∪Ā = E, A∩Ā = ∅, et Card(E) = Card(A) + Card(Ā).$$,
        'highlights', array[$$Card(A∪B) = Card(A) + Card(B) − Card(A∩B)$$, $$Card(E) = Card(A) + Card(Ā)$$]::text[],
        'example', jsonb_build_object('statement', $$Sur 25 élèves, 15 jouent au handball, 10 au basketball, 5 pratiquent les deux. Combien ne pratiquent aucun sport ?$$, 'solution', $$Card(Hand∪Basket) = 15+10−5 = 20. Les élèves ne pratiquant aucun sport : 25−20 = 5.$$),
        'fixation', jsonb_build_object('question', $$Card(E)=30, Card(F)=25, Card(E∩F)=15. Détermine Card(E∪F).$$, 'solution', $$Card(E∪F) = 30+25−15 = 40.$$)
      ),
      jsonb_build_object(
        'heading', $$Produit cartésien et p-uplets$$,
        'body', $$Le produit cartésien A×B est l'ensemble des couples (a;b) avec a∈A, b∈B ; Card(A×B) = Card(A)×Card(B). Un p-uplet d'un ensemble E à n éléments est un élément de Eᵖ ; leur nombre est nᵖ. Dans un p-uplet, la répétition est possible et l'ordre compte.$$,
        'highlights', array[$$Card(A×B) = Card(A)×Card(B)$$, $$nombre de p-uplets d'un ensemble à n éléments : nᵖ$$, $$répétition possible, ordre important$$]::text[],
        'example', jsonb_build_object('statement', $$On lance 3 fois un dé. Combien de résultats possibles ?$$, 'solution', $$Chaque résultat est un élément de E³ avec Card(E)=6, donc N = 6³ = 216.$$),
        'fixation', jsonb_build_object('question', $$Combien de codes à 4 chiffres (0 à 9, répétition autorisée) peut-on former ?$$, 'solution', $$N = 10⁴ = 10 000.$$)
      ),
      jsonb_build_object(
        'heading', $$Arrangements et permutations$$,
        'body', $$Un arrangement de p éléments (1≤p≤n) est un p-uplet d'éléments deux à deux distincts (répétition impossible, ordre important) ; leur nombre est Anp = n×(n−1)×...×(n−p+1) = n!/(n−p)!. Une permutation est un arrangement des n éléments de E ; leur nombre est Ann = n! (factorielle n).$$,
        'highlights', array[$$Anp = n×(n−1)×...×(n−p+1) = n!/(n−p)!$$, $$permutation : Ann = n! (arrangement de tous les éléments)$$, $$arrangement : répétition impossible, ordre important$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine le nombre de mots (avec ou sans sens) formés avec les 6 lettres du nom KENDAL.$$, 'solution', $$C'est une permutation de 6 éléments : A₆⁶ = 6! = 720.$$),
        'fixation', jsonb_build_object('question', $$Calcule A₁₀⁴.$$, 'solution', $$A₁₀⁴ = 10×9×8×7 = 5040.$$)
      ),
      jsonb_build_object(
        'heading', $$Combinaisons et tirages$$,
        'body', $$Une combinaison de p éléments de E (p≤n) est un sous-ensemble de E à p éléments (répétition impossible, ordre sans importance) ; leur nombre est Cnp = n!/[p!(n−p)!]. Propriétés : Cn^(n−p) = Cnp, et Cn-1^(p−1) + Cn-1^p = Cnp. Correspondance avec les tirages : tirage simultané de p parmi n → Cnp ; tirage successif sans remise de p parmi n → Anp ; tirage successif sans remise de n parmi n → n! ; tirage successif avec remise de p parmi n → nᵖ.$$,
        'highlights', array[$$Cnp = n!/[p!(n−p)!]$$, $$tirage simultané → Cnp ; sans remise → Anp ; avec remise → nᵖ$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule le nombre de combinaisons de 5 dans 11.$$, 'solution', $$C₁₁⁵ = 11!/(5!×6!) = (11×10×9×8×7)/(5×4×3×2×1) = 231.$$),
        'fixation', jsonb_build_object('question', $$Une urne contient 5 boules de couleurs différentes. On en tire 3 simultanément. Combien de tirages possibles ?$$, 'solution', $$C₅³ = 10.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour une kermesse, il faut tirer deux cartons dans une urne contenant 4 cartons numérotés de 1 à 4. Le nombre de résultats possibles correspond au nombre de tee-shirts gagnés. Trois formules sont proposées : tirage simultané, tirage successif sans remise, tirage successif avec remise.$$,
      'questions', array[
        $$Identifie le modèle mathématique (combinaison, arrangement, ou p-uplet) correspondant à chacune des trois formules de tirage.$$,
        $$Calcule le nombre de tee-shirts (résultats possibles) pour chacune des trois formules.$$,
        $$Détermine quelle formule est la plus avantageuse pour les élèves, et justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la formule de Card(A∪B) en fonction de Card(A), Card(B) et Card(A∩B) ?$$,
      'hint', $$Il faut éviter de compter deux fois l'intersection.$$,
      'expected', $$Card(A∪B) = Card(A) + Card(B) − Card(A∩B).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre un arrangement et une combinaison ?$$,
      'hint', $$L'une prend en compte l'ordre, l'autre non.$$,
      'expected', $$Dans un arrangement, l'ordre des éléments compte (deux arrangements avec les mêmes éléments dans un ordre différent sont distincts) ; dans une combinaison, l'ordre n'a pas d'importance (c'est un simple sous-ensemble).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule de Cnp ?$$,
      'hint', $$Elle utilise des factorielles.$$,
      'expected', $$Cnp = n! / [p! × (n−p)!]$$
    ),
    jsonb_build_object(
      'question', $$Quel modèle de dénombrement correspond à un tirage successif avec remise de p éléments parmi n ?$$,
      'hint', $$C'est le même que pour les p-uplets.$$,
      'expected', $$nᵖ (n élevé à la puissance p).$$
    )
  ),
  now()
);
