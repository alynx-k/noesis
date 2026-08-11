-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3146: "MATH_2C L15: INEQUATIONS DANS ℝ×ℝ"
-- (https://lyc.ecole-ci.org/course/view.php?id=3146). NOTE: the "Je lis le
-- résumé de la leçon" tile on the course page has no anchor at all (broken
-- link, unlike every other lesson in this category); the underlying
-- resource was located by inferring the sequential mod_resource id pattern
-- from the other 14 lessons (id 31027), which correctly opened
-- "Maths 2C_L15_Inéquations dans IRxIR.pdf" (15 pages, title matching).
-- Rewritten/paraphrased from the source PDF: inéquation du premier degré
-- dans R×R (demi-plans délimités par une droite ax+by+c=0), résolution
-- graphique par la méthode du point test, système d'inéquations du premier
-- degré dans R×R et sa résolution graphique par superposition de
-- hachures, et problème conduisant à un système d'inéquations. La
-- situation complexe d'évaluation (achat de romans et de livres divers
-- sous contrainte budgétaire) est reformulée avec d'autres valeurs
-- numériques. 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-inequations-rxr',
  '2nde',
  'C',
  'mathematiques',
  $$Inéquations dans ℝ×ℝ$$,
  15,
  '2nde-c-maths-rotation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'oncle d'un camarade de classe exploite une portion de bas-fond qu'il a divisée en deux parcelles. La première année, il cultive sur la première parcelle de la tomate qui rapporte 3 tonnes à l'hectare, et sur la deuxième parcelle du gombo qui rapporte 2 tonnes à l'hectare, pour une récolte totale de 10 tonnes. L'année suivante, il cultive sur la première parcelle de la tomate qui rapporte cette fois 5 tonnes à l'hectare, et sur la deuxième du gombo qui rapporte 4 tonnes à l'hectare, pour une récolte totale de 16 tonnes. L'oncle veut avoir une idée de la superficie en hectares de chaque parcelle. Informés, les élèves de la classe décident de déterminer les superficies des différentes parcelles pour répondre à ses préoccupations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Inéquation du premier degré dans R×R$$,
        'body', $$Dans un plan muni d'un repère (O,I,J), soit la droite (D) d'équation ax+by+c=0. Cette droite partage le plan en trois parties : la droite (D) elle-même, dont les couples de coordonnées (x;y) vérifient ax+by+c=0, et deux demi-plans ouverts dont les couples de coordonnées vérifient respectivement ax+by+c<0 et ax+by+c>0. L'ensemble des solutions d'une inéquation du premier degré à deux inconnues est donc soit un demi-plan ouvert (inégalité stricte), soit la réunion de la droite (D) et d'un demi-plan ouvert, appelée demi-plan fermé (inégalité large).$$,
        'highlights', array[$$demi-plan ouvert$$, $$demi-plan fermé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La droite (D) d'équation ax+by+c=0 partage le plan en la droite (D) (ax+by+c=0) et deux demi-plans ouverts (ax+by+c<0 et ax+by+c>0). L'ensemble des solutions de ax+by+c≤0 est un demi-plan fermé.$$),
        'fixation', jsonb_build_object('question', $$Quel type d'ensemble représente les solutions d'une inéquation stricte comme ax+by+c<0 ?$$, 'solution', $$Un demi-plan ouvert, c'est-à-dire un demi-plan dont la frontière (la droite (D)) n'est pas incluse.$$)
      ),
      jsonb_build_object(
        'heading', $$Résolution graphique par la méthode du point test$$,
        'body', $$Pour résoudre graphiquement une inéquation du type ax+by+c>0 (ou avec un autre symbole d'inégalité), on trace d'abord la droite (D) d'équation ax+by+c=0, puis on choisit un point qui n'appartient pas à cette droite (souvent l'origine O si elle convient) : ce point est appelé point test. On remplace ses coordonnées dans l'expression ax+by+c ; si le résultat vérifie l'inégalité, alors l'ensemble des solutions est le demi-plan contenant le point test ; sinon, c'est l'autre demi-plan. On hachure alors le demi-plan solution pour représenter l'ensemble des solutions.$$,
        'highlights', array[$$point test$$, $$hachures$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine et représente graphiquement les solutions de l'inéquation 2x−y+5>0, à l'aide du point test A(−3;1).$$, 'solution', $$En remplaçant dans (D): 2×(−3)−1+5 = −2, et −2>0 est faux. Donc A n'est pas solution : l'ensemble des solutions est le demi-plan ouvert de frontière (D) ne contenant pas le point A(−3;1).$$),
        'fixation', jsonb_build_object('question', $$À quoi sert le « point test » dans la résolution graphique d'une inéquation du premier degré ?$$, 'solution', $$Il permet de déterminer lequel des deux demi-plans délimités par la droite (D) correspond bien à l'ensemble des solutions de l'inéquation.$$)
      ),
      jsonb_build_object(
        'heading', $$Système d'inéquations du premier degré dans R×R$$,
        'body', $$On appelle système d'inéquations du premier degré dans R×R un système constitué de plusieurs inéquations du premier degré à deux inconnues. Résoudre un tel système, c'est trouver tous les couples de nombres réels qui vérifient simultanément toutes les inéquations du système. Graphiquement, on trace chaque droite frontière, on hachure le demi-plan solution de chaque inéquation, puis l'ensemble des solutions du système est la partie du plan hachurée par toutes les inéquations à la fois (l'intersection des demi-plans solutions).$$,
        'highlights', array[$$système d'inéquations$$, $$intersection de demi-plans$$]::text[],
        'example', jsonb_build_object('statement', $$Le couple (0;4) vérifie-t-il le système (S) : {x−y+3<0 ; x+y−2>0} ?$$, 'solution', $$Pour x=0, y=4 : 0−4+3=−1<0 (vrai), et 0+4−2=2>0 (vrai). Le couple (0;4) vérifie chacune des deux inéquations, donc c'est bien une solution du système.$$),
        'fixation', jsonb_build_object('question', $$Que représente graphiquement l'ensemble des solutions d'un système de deux inéquations du premier degré ?$$, 'solution', $$C'est l'intersection des deux demi-plans solutions, c'est-à-dire la région du plan hachurée par les deux inéquations à la fois.$$)
      ),
      jsonb_build_object(
        'heading', $$Problème conduisant à un système d'inéquations$$,
        'body', $$Pour résoudre un problème concret à l'aide d'un système d'inéquations, on procède par étapes : on analyse l'énoncé pour identifier ce que l'on cherche et ce que l'on connaît ; on choisit des inconnues (souvent notées x et y) ; on traduit chaque contrainte de l'énoncé par une inéquation faisant intervenir ces inconnues ; on résout le système obtenu, généralement de façon graphique ; puis on conclut en tenant compte des contraintes propres au contexte (par exemple, si x et y représentent des quantités d'objets, on ne retient que les couples de coordonnées entières positives parmi les solutions).$$,
        'highlights', array[$$mise en système$$, $$contraintes du contexte$$]::text[],
        'example', jsonb_build_object('statement', $$Un collectionneur achète des tapis à 80 000 F CFA l'unité et des objets d'art à 60 000 F CFA l'unité. Il dépense moins de 600 000 F CFA au total, et achète plus d'objets d'art que de tapis. En notant x le nombre de tapis et y le nombre d'objets d'art, traduis ces contraintes par un système d'inéquations.$$, 'solution', $${80 000x + 60 000y < 600 000 ; x < y}, ce qui se simplifie en {4x+3y−30<0 ; x−y<0}.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi, dans un problème concret sur des quantités d'objets, ne retient-on souvent que certains couples parmi toutes les solutions mathématiques du système ?$$, 'solution', $$Parce que les quantités d'objets doivent être des entiers positifs, donc on ne retient que les couples de coordonnées entières positives parmi l'ensemble des solutions du système.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conseil de gestion scolaire souhaite acheter des romans à 2 000 F CFA l'unité et des livres divers à 3 000 F CFA l'unité pour la bibliothèque du lycée. Le conseil doit acheter au moins 50 romans et au moins 18 livres divers, et il doit acheter plus de romans que de livres divers. Le montant total de cet achat ne doit pas dépasser 300 000 F CFA. On note x le nombre de romans et y le nombre de livres divers achetés.$$,
      'questions', array[
        $$Traduis chacune des contraintes de l'énoncé (nombre minimum de romans, nombre minimum de livres divers, comparaison entre romans et livres divers, budget maximal) par une inéquation en x et y.$$,
        $$Représente graphiquement, dans un repère, l'ensemble des solutions du système d'inéquations obtenu.$$,
        $$Le conseil décide finalement d'acheter exactement 55 romans. Détermine, à partir du graphique ou du système, le nombre maximal de livres divers qu'il peut acheter en respectant toutes les contraintes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel type d'ensemble de solutions obtient-on pour l'inéquation x−2y+4≥0 ?$$,
      'hint', $$L'inégalité est large (≥), pas stricte.$$,
      'expected', $$Un demi-plan fermé (la réunion de la droite d'équation x−2y+4=0 et d'un demi-plan ouvert).$$
    ),
    jsonb_build_object(
      'question', $$Utilise le point test O(0;0) pour déterminer si l'origine appartient au demi-plan solution de l'inéquation 3x+2y−6>0.$$,
      'hint', $$Remplace x=0 et y=0 dans l'expression 3x+2y−6.$$,
      'expected', $$3×0+2×0−6 = −6, et −6>0 est faux, donc O n'est pas solution : l'origine appartient à l'autre demi-plan.$$
    ),
    jsonb_build_object(
      'question', $$Le couple (2;5) vérifie-t-il le système (S) : {x+y−4>0 ; 2x−y+1<0} ?$$,
      'hint', $$Teste chacune des deux inéquations séparément avec x=2 et y=5.$$,
      'expected', $$x+y−4 = 3 > 0 (vrai) ; 2x−y+1 = 0 < 0 est faux. Donc (2;5) ne vérifie pas la deuxième inéquation : ce n'est pas une solution du système.$$
    ),
    jsonb_build_object(
      'question', $$Un artisan doit fabriquer x chaises et y tables, avec x et y des entiers naturels non nuls, en respectant x≥3 et x+2y≤10. Cite deux couples (x;y) qui vérifient ces contraintes.$$,
      'hint', $$Essaie quelques valeurs de x à partir de 3 et calcule les valeurs de y possibles.$$,
      'expected', $$Par exemple (3;1) [3+2=5≤10] et (4;2) [4+4=8≤10] conviennent (plusieurs autres réponses sont possibles).$$
    )
  ),
  now()
);
