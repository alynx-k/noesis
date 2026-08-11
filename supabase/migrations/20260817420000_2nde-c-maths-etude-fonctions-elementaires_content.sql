-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3143: "MATH_2C L13: ETUDE DE FONCTIONS ELELENTAIRES"
-- (https://lyc.ecole-ci.org/course/view.php?id=3143)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30991, redirecting
-- to pluginfile "Maths 2C_L13_Etude de fonctions élémentaires.pdf" (10
-- pages).
-- Rewritten/paraphrased from the source PDF: fonction affine par
-- intervalles, fonction partie entière, et étude complète (ensemble de
-- définition, sens de variation, tableau de variation, courbe) des
-- fonctions élémentaires x↦x², x↦|x| et x↦x³. La situation complexe
-- d'évaluation (comparaison de deux formules d'abonnement téléphonique) est
-- reformulée avec d'autres valeurs numériques. 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-etude-fonctions-elementaires',
  '2nde',
  'C',
  'mathematiques',
  $$Étude de fonctions élémentaires$$,
  13,
  '2nde-c-maths-homothetie',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un projectile est lancé à partir d'un point du sol, au sommet d'une montagne, par un dispositif construit à cet effet. Le professeur de mathématiques qui a assisté à l'expérience informe la classe que l'altitude du projectile, en mètres, repérée par rapport au niveau de l'eau en bas de la montagne, est exprimée en fonction du temps écoulé, en secondes, depuis son départ. Un élève curieux veut connaître la hauteur de la montagne, l'altitude maximale atteinte par le projectile, et le temps au bout duquel il atteindra l'eau. Les élèves décident alors d'étudier cette fonction et de la représenter.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Fonction affine par intervalles$$,
        'body', $$Une fonction est dite affine par intervalles lorsqu'elle est définie sur un ou plusieurs intervalles disjoints, par des restrictions de fonctions affines à chacun de ces intervalles. Autrement dit, sa courbe représentative est constituée de plusieurs segments ou demi-droites raccordés bout à bout, chacun ayant l'allure d'une droite (fonction affine) sur son propre intervalle de définition.$$,
        'highlights', array[$$fonction affine par intervalles$$]::text[],
        'example', jsonb_build_object('statement', $$La fonction m est définie par m(x)=x+8 si x≤−5, m(x)=3 si −5≤x≤5, et m(x)=2x−7 si x>5. Est-ce une fonction affine par intervalles ?$$, 'solution', $$Oui : sur chacun des trois intervalles ]−∞;−5], [−5;5] et ]5;+∞[, m coïncide avec une fonction affine (ou constante, qui est un cas particulier de fonction affine).$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire qu'une fonction est affine par intervalles ?$$, 'solution', $$Cela signifie qu'elle est définie sur plusieurs intervalles, et que sur chacun d'eux, elle coïncide avec une fonction affine.$$)
      ),
      jsonb_build_object(
        'heading', $$La fonction partie entière$$,
        'body', $$Quel que soit le nombre réel x, il existe un unique entier relatif z tel que z ≤ x < z+1. Cet entier z est appelé partie entière de x, et on note z = E(x). La fonction partie entière, E : R → R, x ↦ E(x), est un exemple particulier de fonction affine par intervalles : sa courbe représentative est en forme d'escalier, avec des segments horizontaux dont l'extrémité gauche est incluse (point plein) et l'extrémité droite exclue (point creux).$$,
        'highlights', array[$$partie entière$$, $$E(x)$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine la partie entière des nombres suivants : 7,8 ; −4,02 ; 9 et 31,365.$$, 'solution', $$E(7,8)=7 (car 7≤7,8<8) ; E(−4,02)=−5 (car −5≤−4,02<−4) ; E(9)=9 (car 9≤9<10) ; E(31,365)=31 (car 31≤31,365<32).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la partie entière de −0,5 ?$$, 'solution', $$E(−0,5) = −1, car −1 ≤ −0,5 < 0.$$)
      ),
      jsonb_build_object(
        'heading', $$Étude de la fonction x ↦ x²$$,
        'body', $$La fonction f définie par f(x)=x² a pour ensemble de définition R tout entier. Elle est strictement décroissante sur l'intervalle ]−∞ ; 0] et strictement croissante sur l'intervalle [0 ; +∞[, avec un minimum de 0 atteint en x=0. Sa courbe représentative, appelée parabole, a la forme caractéristique d'un « U », symétrique par rapport à l'axe des ordonnées.$$,
        'highlights', array[$$fonction carré$$, $$parabole$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Intervalle$$, $$Variation de x↦x²$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$]−∞ ; 0]$$, $$Strictement décroissante$$),
            jsonb_build_array($$[0 ; +∞[$$, $$Strictement croissante$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Sur quel intervalle la fonction x↦x² est-elle strictement croissante ?$$, 'solution', $$Sur l'intervalle [0 ; +∞[.$$)
      ),
      jsonb_build_object(
        'heading', $$Étude des fonctions x ↦ |x| et x ↦ x³$$,
        'body', $$La fonction valeur absolue x↦|x| a pour ensemble de définition R ; elle est strictement décroissante sur ]−∞ ; 0] et strictement croissante sur [0 ; +∞[, sa courbe ayant la forme d'un « V ». La fonction cube x↦x³ a elle aussi pour ensemble de définition R, mais elle est strictement croissante sur R tout entier (sans changement de sens de variation), sa courbe passant par l'origine et présentant une symétrie par rapport à ce point.$$,
        'highlights', array[$$fonction valeur absolue$$, $$fonction cube$$]::text[],
        'example', jsonb_build_object('statement', $$La fonction x↦x³ est-elle croissante ou décroissante sur l'intervalle [−2 ; 2] ?$$, 'solution', $$Elle est strictement croissante sur R tout entier, donc en particulier sur [−2 ; 2].$$),
        'fixation', jsonb_build_object('question', $$Quelle est la forme caractéristique de la courbe représentative de la fonction x↦|x| ?$$, 'solution', $$Elle a la forme d'un « V », avec un minimum de 0 atteint en x=0.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Mlle Moya, élève en classe de seconde, veut choisir un abonnement pour son téléphone portable. Deux formules lui sont proposées. La formule 1 coûte 300 F CFA pour un forfait de deux heures de connexion, avec un supplément de 25 F CFA par minute de dépassement. La formule 2 coûte 150 F CFA pour le même forfait de deux heures, mais avec un supplément de 75 F CFA par minute de dépassement. Sachant qu'elle sait déjà qu'elle va dépasser les deux heures de connexion, et qu'elle prévoit d'utiliser son téléphone pendant 2 heures et 33 minutes ce mois-ci, elle voudrait savoir quelle formule est la plus économique pour elle.$$,
      'questions', array[
        $$Exprime, pour chaque formule, le prix total en fonction du nombre x de minutes de dépassement au-delà des deux heures.$$,
        $$Calcule le nombre de minutes de dépassement correspondant à une utilisation de 2 heures et 33 minutes.$$,
        $$Calcule le prix total de chaque formule pour ce nombre de minutes de dépassement, puis indique quelle formule est la plus avantageuse pour Mlle Moya.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Détermine la partie entière du nombre 12,7.$$,
      'hint', $$Cherche l'entier z tel que z ≤ 12,7 < z+1.$$,
      'expected', $$E(12,7) = 12.$$
    ),
    jsonb_build_object(
      'question', $$Sur quel intervalle la fonction x↦x² est-elle strictement décroissante ?$$,
      'hint', $$Pense à la forme de la parabole avant son minimum.$$,
      'expected', $$Sur l'intervalle ]−∞ ; 0].$$
    ),
    jsonb_build_object(
      'question', $$La fonction x↦x³ change-t-elle de sens de variation sur R ? Justifie.$$,
      'hint', $$Compare avec le comportement de x↦x².$$,
      'expected', $$Non, elle est strictement croissante sur R tout entier, sans jamais changer de sens de variation.$$
    ),
    jsonb_build_object(
      'question', $$Une fonction g est définie par g(x) = 2x+1 si x<0 et g(x) = −x+3 si x≥0. Est-ce une fonction affine par intervalles ? Calcule g(−2) et g(4).$$,
      'hint', $$Regarde si chaque morceau de la définition est une fonction affine.$$,
      'expected', $$Oui, c'est une fonction affine par intervalles. g(−2) = 2×(−2)+1 = −3 (car −2<0). g(4) = −4+3 = −1 (car 4≥0).$$
    )
  ),
  now()
);
