-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2034: "MATHS_1C L13: SYSTÈMES D'ÉQUATIONS LINÉAIRES
-- DANS R2 ET R3" (https://lyc.ecole-ci.org/course/view.php?id=2034),
-- resource id 17870. Contenu mathématique factuel (définitions, théorèmes,
-- formules, exercices), non soumis au droit d'auteur ; reformulé pour la
-- structure CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-systemes-equations-lineaires',
  '1ere',
  'C',
  'mathematiques',
  $$Systèmes d'équations linéaires dans ℝ² et dans ℝ³$$,
  13,
  '1ere-c-maths-orthogonalite-espace',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Trois élèves de 1ère C font des recherches sur les hydrocarbures. Ils découvrent qu'un mélange de méthane, d'acétylène et d'oxygène, introduit dans un eudiomètre, occupe un volume initial de 70 cm³. Après une réaction déclenchée par une étincelle, il reste 30 cm³ de dioxyde de carbone et 10 cm³ d'oxygène. Ils veulent déterminer les volumes respectifs des gaz du mélange initial, ce qui nécessite de résoudre un système d'équations dans ℝ³.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Déterminant d'un système de deux équations$$,
        'body', $$Un système (S): {ax+by=c ; a'x+b'y=c'} a pour déterminant le réel ab'−a'b, noté |a b; a' b'|. Si (a,b)≠(0,0) et (a',b')≠(0,0), le système admet une unique solution si et seulement si son déterminant est non nul. Si le déterminant est nul, le système n'admet aucune solution ou une infinité de solutions.$$,
        'highlights', array[$$déterminant D = |a b; a' b'| = ab'−a'b$$, $$D≠0 ⟺ solution unique ; D=0 ⟺ 0 ou une infinité de solutions$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule le déterminant du système {2x+3y=1 ; 5x+y=0} et détermine le nombre de solutions.$$, 'solution', $$D = |2 3; 5 1| = 2×1−5×3 = −13 ≠ 0, donc le système admet une unique solution.$$),
        'fixation', jsonb_build_object('question', $$Le système {3x+15y+2=0 ; 2x+10y−6=0} a un déterminant nul. Que peut-on en conclure sans calcul supplémentaire ?$$, 'solution', $$Le système n'admet aucune solution, ou en admet une infinité (il faut vérifier si un couple solution de la première équation vérifie la seconde).$$)
      ),
      jsonb_build_object(
        'heading', $$Résolution d'un système de deux équations$$,
        'body', $$Un système linéaire dans ℝ² peut se résoudre par substitution, combinaison, déterminant (méthode de Cramer), ou graphiquement. Méthode de Cramer, si D≠0 : on calcule Dx=|c b; c' b'| et Dy=|a c; a' c'|, puis x=Dx/D et y=Dy/D. Graphiquement, chaque équation représente une droite ; les coordonnées du point d'intersection (s'il existe) donnent la solution.$$,
        'highlights', array[$$méthode de Cramer : x = Dx/D, y = Dy/D (si D≠0)$$, $$résolution graphique : intersection des deux droites$$]::text[],
        'example', jsonb_build_object('statement', $$Résous {x+2y−5=0 ; 3x−y+2=0} par le déterminant.$$, 'solution', $$D=|1 2; 3 −1|=−7. Dx=|5 2; −2 −1|=−1, donc x=−1/−7=1/7. Dy=|1 5; 3 −2|=−17, donc y=−17/−7=17/7. Solution : (1/7 ; 17/7).$$),
        'fixation', jsonb_build_object('question', $$Comment interprète-t-on graphiquement la solution unique d'un système de deux équations linéaires à deux inconnues ?$$, 'solution', $$C'est le point d'intersection des deux droites représentant chacune des deux équations.$$)
      ),
      jsonb_build_object(
        'heading', $$Systèmes de trois équations linéaires dans ℝ³$$,
        'body', $$Un système linéaire de trois équations à trois inconnues (x,y,z) est du type {ax+by+cz=m ; a'x+b'y+c'z=m' ; a''x+b''y+c''z=m''}. Un système triangulaire est de la forme {ax+by+cz=m ; b'y+c'z=m' ; c''z=m''} : la dernière équation donne directement une inconnue, permettant une résolution en cascade (par remontée).$$,
        'highlights', array[$$système triangulaire : la 3e équation donne z directement, puis on remonte$$]::text[],
        'example', jsonb_build_object('statement', $$Résous le système triangulaire {x+2y+z=8 ; −3y−2z=−12 ; −22z=−66}.$$, 'solution', $$La 3e équation donne z=3. En remplaçant dans la 2e : −3y−6=−12, donc y=2. En remplaçant dans la 1re : x+4+3=8, donc x=1. Solution : (1;2;3).$$),
        'fixation', jsonb_build_object('question', $$Quel est l'avantage d'un système triangulaire par rapport à un système linéaire quelconque ?$$, 'solution', $$La dernière équation donne directement la valeur d'une inconnue, ce qui permet de résoudre le système par remontées successives, sans calcul supplémentaire complexe.$$)
      ),
      jsonb_build_object(
        'heading', $$Résolution par substitution et par le pivot de Gauss$$,
        'body', $$Substitution : on exprime une inconnue en fonction des autres à partir d'une équation, puis on remplace dans les autres équations pour réduire le nombre d'inconnues, jusqu'à obtenir une équation à une seule inconnue. Pivot de Gauss : on combine les lignes (L2−k·L1, L3−k'·L1, puis L3−k''·L2) pour éliminer progressivement les inconnues et obtenir un système triangulaire équivalent, que l'on résout ensuite par remontée.$$,
        'highlights', array[$$substitution : exprimer une inconnue, remplacer, réduire$$, $$pivot de Gauss : combinaisons de lignes pour obtenir un système triangulaire équivalent$$]::text[],
        'example', jsonb_build_object('statement', $$Résous par le pivot de Gauss : {x−5y−7z=3 ; 5x+3y+z=3 ; 3x+y−2z=−1}.$$, 'solution', $$En éliminant x : {x−5y−7z=3 ; 14y+18z=−6 ; 16y+19z=−10}. En éliminant y de la 3e ligne : −22z=−44, donc z=2 ; puis y=−3 ; puis x=2. Solution : (2;−3;2).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la première étape de la méthode de substitution pour un système de 3 équations ?$$, 'solution', $$Exprimer une inconnue en fonction des deux autres à partir d'une des équations, puis remplacer cette expression dans les deux autres équations.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un fermier élève des canards, des lapins et des dromadaires. Le total des pattes de canards et lapins et des bosses de dromadaires vaut 130. Le nombre total de têtes vaut 46. Le nombre d'oreilles des lapins et des dromadaires vaut 38. Le fermier affirme avoir au moins 16 lapins.$$,
      'questions', array[
        $$En notant x le nombre de canards, y le nombre de lapins et z le nombre de dromadaires, traduis les informations en un système de trois équations (sachant qu'un canard a 2 pattes, un lapin 4 pattes et 2 oreilles, un dromadaire 1 bosse et 2 oreilles).$$,
        $$Résous ce système (par substitution ou pivot de Gauss) pour déterminer x, y et z.$$,
        $$Vérifie que la solution trouvée est cohérente avec la contrainte y≥16, et conclus sur le nombre de canards, lapins et dromadaires.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la formule du déterminant d'un système {ax+by=c ; a'x+b'y=c'} ?$$,
      'hint', $$C'est une combinaison des quatre coefficients a, b, a', b'.$$,
      'expected', $$D = ab' − a'b.$$
    ),
    jsonb_build_object(
      'question', $$Si le déterminant d'un système de deux équations à deux inconnues est nul, que peut-on dire du nombre de solutions ?$$,
      'hint', $$Il y a deux cas possibles, pas un seul.$$,
      'expected', $$Le système n'admet aucune solution, ou en admet une infinité.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un système triangulaire dans ℝ³ ?$$,
      'hint', $$Sa forme facilite grandement la résolution.$$,
      'expected', $$Un système de la forme {ax+by+cz=m ; b'y+c'z=m' ; c''z=m''}, où la dernière équation ne comporte qu'une seule inconnue.$$
    ),
    jsonb_build_object(
      'question', $$Résous par substitution : {x+y=5 ; y+z=1 ; x+z=−8}.$$,
      'hint', $$Exprime x et z en fonction de y à partir des deux premières équations.$$,
      'expected', $$x=5−y, z=1−y ; en remplaçant dans la 3e équation : 5−y+1−y=−8, donc y=7, x=−2, z=−6. Solution : (−2;7;−6).$$
    )
  ),
  now()
);
