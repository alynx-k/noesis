-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 866: "MATHS_1A L2: DENOMBREMENT"
-- (https://lyc.ecole-ci.org/course/view.php?id=866), resource id 4041.
-- Contenu réécrit à partir du PDF source (cardinal, complémentaire,
-- produit cartésien, p-listes, arrangements, permutations/factorielle,
-- combinaisons). Formules et propriétés reprises telles quelles ; les
-- explications, exemples et la situation d'apprentissage/complexe sont
-- reformulés avec d'autres valeurs. Aucune phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-denombrement',
  '1ere',
  'A',
  'mathematiques',
  $$Dénombrement$$,
  2,
  '1ere-a-maths-equations-inequations-r',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la cérémonie de remise des diplômes d'un lycée, des élèves sont chargés d'installer les cinq membres du jury sur cinq fauteuils réservés. En s'entraînant, ils se demandent combien de façons différentes existent pour les installer. L'un d'eux affirme qu'il y a 120 possibilités, mais ses camarades ne sont pas convaincus. Ils décident d'étudier le dénombrement pour trancher.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Cardinal et complémentaire d'un ensemble$$,
        'body', $$Le cardinal d'un ensemble fini E, noté Card(E), est son nombre d'éléments. Si A est une partie non vide d'un ensemble E, le complémentaire de A dans E (noté A-barre) est l'ensemble des éléments de E qui n'appartiennent pas à A. On a la propriété : Card(A-barre) = Card(E) − Card(A).$$,
        'highlights', array[$$Card(E)$$, $$complémentaire$$, $$Card(Ā) = Card(E) − Card(A)$$]::text[],
        'example', jsonb_build_object('statement', $$Soit E={1;2;3;4;5;6;7;8;9;10} et A l'ensemble des multiples de 3 dans E. Calcule Card(Ā).$$, 'solution', $$A={3;6;9}, donc Card(A)=3. Card(Ā)=Card(E)−Card(A)=10−3=7.$$),
        'fixation', jsonb_build_object('question', $$Que représente Card(E) pour un ensemble fini E ?$$, 'solution', $$Le nombre d'éléments de l'ensemble E.$$)
      ),
      jsonb_build_object(
        'heading', $$Produit cartésien et p-listes$$,
        'body', $$Pour deux ensembles finis non vides A et B, le produit cartésien A×B est l'ensemble des couples (a,b) avec a∈A et b∈B ; on a Card(A×B)=Card(A)×Card(B). Plus généralement, pour un ensemble E et un entier p non nul, une p-liste (ou p-uplet) de E est un élément du produit cartésien de p copies de E ; le nombre de p-listes d'un ensemble à n éléments est n^p.$$,
        'highlights', array[$$A×B$$, $$Card(A×B) = Card(A) × Card(B)$$, $$p-liste : n^p$$]::text[],
        'example', jsonb_build_object('statement', $$Combien de codes à 2 chiffres peut-on former avec les chiffres de l'ensemble {1;2;3;4} (répétitions autorisées) ?$$, 'solution', $$C'est une 2-liste d'un ensemble à 4 éléments : 4²=16 codes possibles.$$),
        'fixation', jsonb_build_object('question', $$Si Card(A)=5 et Card(B)=3, que vaut Card(A×B) ?$$, 'solution', $$Card(A×B)=Card(A)×Card(B)=5×3=15.$$)
      ),
      jsonb_build_object(
        'heading', $$Arrangements et permutations$$,
        'body', $$Un arrangement de p éléments d'un ensemble E à n éléments (p≤n) est un p-uplet d'éléments de E deux à deux distincts. Leur nombre est noté A(n,p) = n×(n−1)×...×(n−p+1) = n!/(n−p)!, où n! (factorielle n) désigne le produit n×(n−1)×...×2×1, avec 0!=1. Une permutation des n éléments de E est un arrangement des n éléments (p=n) ; leur nombre est A(n,n) = n!.$$,
        'highlights', array[$$arrangement : n!/(n−p)!$$, $$factorielle$$, $$permutation : n!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Notion$$, $$Formule$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Arrangement de p dans n$$, $$A(n,p) = n!/(n−p)!$$),
            jsonb_build_array($$Permutation de n éléments$$, $$n!$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Calcule le nombre d'arrangements de 2 éléments pris parmi 4.$$, 'solution', $$A(4,2)=4!/(4−2)!=4×3=12.$$),
        'fixation', jsonb_build_object('question', $$Que vaut 5! ?$$, 'solution', $$5!=5×4×3×2×1=120.$$)
      ),
      jsonb_build_object(
        'heading', $$Combinaisons$$,
        'body', $$Une combinaison de p éléments d'un ensemble E à n éléments (p≤n) est un sous-ensemble de E ayant p éléments, sans tenir compte de l'ordre. Leur nombre, noté C(n,p), vaut A(n,p)/p! = n!/(p!(n−p)!). On retient que C(n,n)=1, C(n,1)=n et C(n,0)=1. Contrairement à l'arrangement, l'ordre des éléments n'a pas d'importance dans une combinaison.$$,
        'highlights', array[$$combinaison : n!/(p!(n−p)!)$$, $$l'ordre ne compte pas$$]::text[],
        'example', jsonb_build_object('statement', $$Une classe de 10 élèves doit désigner un binôme (2 élèves) pour représenter la classe. Combien de binômes possibles ?$$, 'solution', $$L'ordre n'a pas d'importance : C(10,2)=10!/(2!×8!)=45 binômes possibles.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi utilise-t-on une combinaison plutôt qu'un arrangement pour compter un tirage simultané de boules dans une urne ?$$, 'solution', $$Parce que dans un tirage simultané, l'ordre dans lequel les boules sortent n'a pas d'importance ; seul l'ensemble des boules tirées compte.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour la cérémonie de remise des diplômes, les élèves doivent installer les cinq membres du jury, tous différents, sur cinq fauteuils numérotés. L'un des élèves affirme qu'il y a 120 façons de les installer ; d'autres en doutent et te demandent de trancher à l'aide du dénombrement.$$,
      'questions', array[
        $$Explique pourquoi installer 5 personnes distinctes sur 5 fauteuils correspond à une permutation de 5 éléments.$$,
        $$Calcule le nombre de façons d'installer ces 5 personnes.$$,
        $$L'affirmation selon laquelle il y a 120 possibilités est-elle correcte ? Justifie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Soit E={a;b;c;d;e;f} et A={a;c;e} une partie de E. Calcule Card(Ā).$$,
      'hint', $$Card(Ā) = Card(E) − Card(A).$$,
      'expected', $$Card(Ā)=6−3=3.$$
    ),
    jsonb_build_object(
      'question', $$Si Card(A)=4 et Card(B)=6, calcule Card(A×B).$$,
      'hint', $$Card(A×B)=Card(A)×Card(B).$$,
      'expected', $$4×6=24.$$
    ),
    jsonb_build_object(
      'question', $$Calcule A(5,3) (l'arrangement de 3 éléments pris parmi 5).$$,
      'hint', $$A(n,p)=n×(n−1)×...×(n−p+1), soit 3 facteurs ici.$$,
      'expected', $$A(5,3)=5×4×3=60.$$
    ),
    jsonb_build_object(
      'question', $$Calcule C(6,2) (le nombre de combinaisons de 2 éléments pris parmi 6).$$,
      'hint', $$C(n,p) = n!/(p!(n−p)!).$$,
      'expected', $$C(6,2)=6!/(2!×4!)=15.$$
    )
  ),
  now()
);
