-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2103: "Leçon3: Nombres decimaux relatifs"
-- (https://coll.ecole-ci.org/course/view.php?id=2103), resource id 17521.
-- Contenu réécrit à partir du PDF source (thème "Calcul algébrique",
-- programme officiel MENA) ; situation d'apprentissage, définitions et
-- exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Yao et Louis, deux élèves de 6ème, jouent au jeu de billes lors de la journée culturelle du lycée moderne de Tiédio. À chaque partie, chacun mise une bille et le gagnant obtient la bille du perdant. Après cinq parties, Yao (qui avait 10 billes) en a gagné 1 et perdu 4 ; Louis (qui avait 5 billes) en a gagné 4 et perdu 1. Les élèves de la classe veulent savoir combien de billes il reste à chacun, et décident de faire des calculs.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Nombres entiers relatifs$$,
        'body', $$Les nombres (+10), (-4), (+4), (+5) et (-1) sont des nombres entiers relatifs. (-4) et (-1) sont des entiers relatifs négatifs ; (+10), (+5) et (+4) sont des entiers relatifs positifs. 0 est un entier relatif à la fois positif et négatif. Tous les entiers relatifs positifs sont des entiers naturels. Un entier relatif peut s'écrire de plusieurs façons : (+10) s'écrit aussi +10 ou 10 ; (-4) s'écrit aussi -4. L'ensemble des entiers relatifs se note ℤ.$$,
        'highlights', array[$$ℤ = ensemble des entiers relatifs$$, $$0 est à la fois positif et négatif$$]::text[],
        'example', jsonb_build_object('statement', $$(-7,8) appartient-il à ℤ ? Et (+14,00) ?$$, 'solution', $$(-7,8) ∉ ℤ (ce n'est pas un entier). (+14,00) ∈ ℤ (car (+14,00) = 14, un entier).$$),
        'fixation', jsonb_build_object('question', $$Comment note-t-on l'ensemble des nombres entiers relatifs ?$$, 'solution', $$ℤ.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres décimaux relatifs, droite graduée et abscisse$$,
        'body', $$Les nombres (+0,5), (+3,2), (-5), (-2,5), 2, 3 sont des nombres décimaux relatifs ; tous les entiers relatifs sont aussi des décimaux relatifs. Leur ensemble se note 𝔻. Une droite graduée comporte une origine et une graduation ; tout point marqué sur elle est repéré par un nombre décimal relatif appelé son abscisse.$$,
        'highlights', array[$$𝔻 = ensemble des nombres décimaux relatifs ; ℤ ⊂ 𝔻$$, $$abscisse = nombre qui repère un point sur une droite graduée$$]::text[],
        'fixation', jsonb_build_object('question', $$Tous les nombres entiers relatifs sont-ils des nombres décimaux relatifs ?$$, 'solution', $$Oui : tous les entiers relatifs sont des décimaux relatifs (l'inverse n'est pas vrai, ex. 3,2).$$)
      ),
      jsonb_build_object(
        'heading', $$Distance à zéro et opposé$$,
        'body', $$La distance à zéro d'un nombre décimal relatif est la distance entre le point dont il est l'abscisse et l'origine de la graduation : la distance à zéro de (-2) est 2, celle de (+5) est 5. Deux nombres décimaux relatifs sont opposés lorsqu'ils ont la même distance à zéro et des signes contraires (ex. (+0,5) et (-0,5)). Le nombre 0 est son propre opposé.$$,
        'highlights', array[$$distance à zéro : toujours positive ou nulle$$, $$opposés = même distance à zéro, signes contraires$$]::text[],
        'example', jsonb_build_object('statement', $$Trouve l'opposé de -11 et de +0,97.$$, 'solution', $$L'opposé de -11 est +11. L'opposé de +0,97 est -0,97.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'opposé de 0 ?$$, 'solution', $$0 lui-même : 0 est son propre opposé.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparaison et somme de deux nombres décimaux relatifs$$,
        'body', $$Un nombre décimal positif est toujours plus grand qu'un négatif (ex. (+2) > (-5)). Entre deux positifs, le plus grand a la plus grande distance à zéro. Entre deux négatifs, le plus grand a la plus petite distance à zéro (ex. (-2) > (-20)). Pour additionner deux nombres de même signe, on additionne leurs distances à zéro et on garde le signe commun (ex. (-1)+(-22)=-23). Pour additionner deux nombres de signes contraires, on soustrait la plus petite distance à zéro de la plus grande, et on garde le signe de celui qui a la plus grande distance à zéro (ex. (-30)+(+8)=-22). La somme de deux nombres opposés est toujours égale à zéro.$$,
        'highlights', array[$$négatifs : le plus grand = plus petite distance à zéro$$, $$même signe → on additionne les distances à zéro$$, $$signes contraires → on soustrait la plus petite distance à zéro de la plus grande$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Calcul', 'Résultat']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$(+10) + (+3)$$, $$+13$$),
            jsonb_build_array($$(-1) + (-22)$$, $$-23$$),
            jsonb_build_array($$(-30) + (+8)$$, $$-22$$),
            jsonb_build_array($$(+40) + (-6)$$, $$+36$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Calcule (-6) + (+4).$$, 'solution', $$Signes contraires : distance à zéro de -6 (soit 6) moins celle de +4 (soit 4) = 2, avec le signe du plus grand en distance (-6) → résultat (-2).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La mère d'une élève de 6ème, vivant en Europe, veut fêter l'anniversaire de sa fille dans la ville la plus froide parmi : Acapulco (30,8°C), Bangkok (32,3°C), Helsinki (-2,8°C), Moscou (-9,7°C), Prague (0,5°C) et Sibérie (-23,7°C).$$,
      'questions', array[
        $$Compare -23,7 et -9,7, puis -9,7 et -2,8.$$,
        $$Déduis-en que -23,7 est le plus petit des nombres décimaux relatifs du tableau.$$,
        $$Précise le nom de la ville où la mère fêtera l'anniversaire.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule (+12) + (-7).$$,
      'hint', $$Signes contraires : soustrais la plus petite distance à zéro de la plus grande.$$,
      'expected', $$(+5).$$
    ),
    jsonb_build_object(
      'question', $$Compare (-5,25) et (-7,41).$$,
      'hint', $$Entre deux négatifs, le plus grand a la plus petite distance à zéro.$$,
      'expected', $$(-5,25) > (-7,41), car -5,25 a une distance à zéro (5,25) plus petite que celle de -7,41 (7,41).$$
    ),
    jsonb_build_object(
      'question', $$Donne l'opposé de (+100) et de (-4).$$,
      'hint', $$Même distance à zéro, signe contraire.$$,
      'expected', $$L'opposé de (+100) est (-100) ; l'opposé de (-4) est (+4).$$
    ),
    jsonb_build_object(
      'question', $$Calcule (-5,25) + (-3,26).$$,
      'hint', $$Même signe : additionne les distances à zéro et garde le signe commun.$$,
      'expected', $$(-8,51).$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-nombres-decimaux-relatifs';
