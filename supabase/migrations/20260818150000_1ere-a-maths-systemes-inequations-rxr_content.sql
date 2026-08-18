-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 871: "MATHS_1A L7: SYSTEMES D'INEQUATIONS LINEAIRES
-- DANS ℝ × ℝ" (https://lyc.ecole-ci.org/course/view.php?id=871), resource
-- id 4101. Contenu réécrit à partir du PDF source (inéquation du premier
-- degré dans ℝ×ℝ, système de deux inéquations, résolution graphique par
-- intersection de demi-plans, traduction d'un problème concret en
-- système). Propriétés reprises telles quelles ; explications, exemples
-- et situation d'apprentissage/complexe (achat de riz/haricots, puis
-- confection de vêtements) reformulés avec d'autres valeurs numériques
-- que la source. Aucune phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-systemes-inequations-rxr',
  '1ere',
  'A',
  'mathematiques',
  $$Systèmes d'inéquations linéaires dans ℝ × ℝ$$,
  7,
  '1ere-a-maths-statistique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour préparer une fête de fin d'année, un père de famille achète du riz et des haricots dont la masse totale est inférieure à 50 kg, en dépensant au maximum 30 000 F CFA (le kilogramme de riz coûte 500 F CFA et celui de haricots 700 F CFA). Sa fille, en 1ère A, veut connaître les quantités possibles de chaque article et se rend compte qu'elle a besoin des systèmes d'inéquations dans ℝ×ℝ pour répondre à la question.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Inéquation du premier degré dans ℝ×ℝ$$,
        'body', $$Pour a, b, c réels non tous nuls, une inéquation du premier degré dans ℝ×ℝ s'écrit ax+by+c<0, >0, ≤0 ou ≥0. Un couple (x0;y0) est solution s'il vérifie l'inégalité une fois substitué. Graphiquement, l'ensemble des solutions est un demi-plan de frontière la droite (D) d'équation ax+by+c=0 : ce demi-plan ne contient pas (D) si l'inégalité est stricte, et la contient si elle est large.$$,
        'highlights', array[$$ax+by+c < 0 : demi-plan$$, $$frontière : (D) ax+by+c=0$$]::text[],
        'example', jsonb_build_object('statement', $$Le couple (1;−2) est-il solution de l'inéquation x+3y+4>0 ?$$, 'solution', $$1+3×(−2)+4=1−6+4=−1, et −1>0 est faux. Donc (1;−2) n'est pas solution.$$),
        'fixation', jsonb_build_object('question', $$Qu'obtient-on graphiquement comme ensemble de solutions d'une inéquation ax+by+c≥0 ?$$, 'solution', $$Un demi-plan fermé (contenant la droite frontière (D): ax+by+c=0), car l'inégalité est large.$$)
      ),
      jsonb_build_object(
        'heading', $$Système d'inéquations du premier degré dans ℝ×ℝ$$,
        'body', $$Un système d'inéquations du premier degré dans ℝ×ℝ regroupe au moins deux inéquations à deux mêmes inconnues. Un couple (x0;y0) est solution du système s'il vérifie chacune des inéquations à la fois. Graphiquement, l'ensemble des solutions est l'intersection des demi-plans associés à chaque inéquation du système.$$,
        'highlights', array[$$vérifie chaque inéquation à la fois$$, $$intersection des demi-plans$$]::text[],
        'example', jsonb_build_object('statement', $$Le couple (0;0) est-il solution du système {x+y−1<0 ; x−y+3>0} ?$$, 'solution', $$0+0−1=−1<0 (vrai) et 0−0+3=3>0 (vrai). Les deux inéquations sont vérifiées, donc (0;0) est bien solution du système.$$),
        'fixation', jsonb_build_object('question', $$Que représente graphiquement l'ensemble des solutions d'un système de deux inéquations du premier degré dans ℝ×ℝ ?$$, 'solution', $$L'intersection des deux demi-plans solutions de chacune des deux inéquations.$$)
      ),
      jsonb_build_object(
        'heading', $$Méthode de résolution graphique$$,
        'body', $$Pour résoudre graphiquement une inéquation ax+by+c<0, on trace d'abord la droite frontière (D): ax+by+c=0, puis on teste un point n'appartenant pas à (D) (souvent l'origine si elle convient) : si ses coordonnées vérifient l'inégalité, le demi-plan solution est celui qui contient ce point ; sinon, c'est l'autre demi-plan. Pour un système, on répète cette méthode pour chaque inéquation puis on prend l'intersection des demi-plans obtenus.$$,
        'highlights', array[$$tracer (D)$$, $$tester un point$$, $$intersection pour un système$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine le demi-plan solution de x−2y+2>0, en testant le point O(0;0).$$, 'solution', $$0−2×0+2=2, et 2>0 est vrai. Donc O est solution : le demi-plan solution est celui qui contient l'origine.$$),
        'fixation', jsonb_build_object('question', $$Que fait-on si le point testé ne vérifie pas l'inégalité de l'inéquation ?$$, 'solution', $$On retient l'autre demi-plan, celui qui ne contient pas le point testé.$$)
      ),
      jsonb_build_object(
        'heading', $$Traduire un problème concret en système d'inéquations$$,
        'body', $$Pour traduire une situation concrète, on choisit des inconnues x et y (souvent des quantités), on traduit chaque contrainte de l'énoncé par une inéquation, puis on résout le système obtenu, en général graphiquement. On conclut ensuite en ne retenant que les couples cohérents avec le contexte (par exemple des entiers naturels si x et y représentent des quantités d'objets).$$,
        'highlights', array[$$choisir les inconnues$$, $$traduire chaque contrainte$$, $$ne retenir que les couples cohérents$$]::text[],
        'example', jsonb_build_object('statement', $$Un artisan achète x tissus à 2000F et y boutons à 500F, pour une dépense d'au plus 20000F. Traduis cette contrainte par une inéquation.$$, 'solution', $$2000x+500y≤20000, soit après simplification 4x+y≤40.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi ne retient-on parfois que certains couples parmi toutes les solutions mathématiques du système ?$$, 'solution', $$Parce que le contexte impose des contraintes supplémentaires (par exemple des quantités entières et positives) que le système seul ne traduit pas.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le père de famille veut acheter x kg de riz à 500 F CFA et y kg de haricots à 700 F CFA, avec une masse totale inférieure à 50 kg et une dépense d'au plus 30 000 F CFA.$$,
      'questions', array[
        $$Traduis chacune des deux contraintes (masse totale, budget maximal) par une inéquation en x et y.$$,
        $$Le couple (20;15) vérifie-t-il les deux inéquations du système ? Justifie.$$,
        $$Propose un couple (x;y) d'entiers naturels qui vérifie les deux contraintes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Le couple (3;1) est-il solution de l'inéquation 2x−y−4>0 ?$$,
      'hint', $$Remplace x par 3 et y par 1 dans l'expression.$$,
      'expected', $$2×3−1−4=1, et 1>0 est vrai, donc (3;1) est solution.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la frontière graphique de l'ensemble des solutions de l'inéquation x+y−5≤0 ?$$,
      'hint', $$C'est la droite obtenue en remplaçant l'inégalité par une égalité.$$,
      'expected', $$La droite (D) d'équation x+y−5=0, incluse dans l'ensemble des solutions car l'inégalité est large.$$
    ),
    jsonb_build_object(
      'question', $$Le couple (2;2) vérifie-t-il le système {x+y<5 ; x−y>0} ?$$,
      'hint', $$Teste chacune des deux inéquations séparément.$$,
      'expected', $$x+y=4<5 (vrai) mais x−y=0>0 est faux. Donc (2;2) ne vérifie pas le système.$$
    ),
    jsonb_build_object(
      'question', $$Un client achète x stylos à 150F et y cahiers à 300F, avec un budget maximal de 3000F. Écris l'inéquation correspondante.$$,
      'hint', $$Le coût total doit rester inférieur ou égal au budget.$$,
      'expected', $$150x+300y≤3000, soit x+2y≤20 après simplification.$$
    )
  ),
  now()
);
