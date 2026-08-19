-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 940: "SVT 1ère C_L3_les échanges d'ions au niveau du
-- sol" (https://lyc.ecole-ci.org/course/view.php?id=940), resource id 4917.
-- Contenu réécrit à partir du PDF source (formation du complexe
-- argilo-humique, pouvoir absorbant, mécanisme d'échange d'ions entre le
-- complexe et la solution du sol, expérience de Way). Tout le contenu est
-- factuel (pédologie) : observations expérimentales, données et exercices
-- sont repris/adaptés tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-echanges-ions-sol',
  '1ere',
  'C',
  'svt',
  $$Les échanges d'ions au niveau du sol$$,
  2,
  '1ere-c-svt-structure-interne-globe-terrestre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre des activités de la coopérative scolaire de leur établissement, un groupe d'élèves effectue une sortie d'étude sur une parcelle expérimentale de culture de maïs réalisée par un service de l'ANADER. L'agent de l'ANADER leur fournit des informations sur les échanges d'ions au niveau du sol, notamment sur l'importance du complexe argilo-humique, qui peut favoriser l'obtention d'un bon rendement au niveau du jardin potager de leur établissement. Pour comprendre ces échanges, les élèves décident d'expliquer la formation du complexe argilo-humique et le mécanisme d'échanges d'ions au niveau du sol.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La formation du complexe argilo-humique$$,
        'body', $$En présence d'eau, l'argile et l'humus restent dispersés sous forme de colloïdes (particules de très petite taille, entre 0,001 et 0,3 micron). En présence d'ions calcium (Ca²⁺), ces particules électronégatives s'associent pour former des flocons : les ions Ca²⁺ forment un « pont calcique » entre les micelles d'argile et d'humus, qui ne peuvent pas se fixer directement l'une à l'autre puisqu'elles portent toutes deux des charges négatives. Cette association forme le complexe argilo-humique, qui donne au sol une structure grumeleuse favorisant une bonne circulation de l'eau et de l'air, propice au développement des plantes.$$,
        'highlights', array[$$argile et humus = colloïdes électronégatifs, dispersés dans l'eau$$, $$Ca²⁺ forme un « pont calcique » entre argile et humus$$, $$complexe argilo-humique → structure grumeleuse du sol$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les particules d'argile et d'humus ne peuvent-elles pas se fixer directement l'une à l'autre ?$$, 'solution', $$Parce qu'elles portent toutes deux des charges électronégatives, qui se repoussent ; leur association nécessite un intermédiaire, comme l'ion Ca²⁺.$$)
      ),
      jsonb_build_object(
        'heading', $$Mise en évidence expérimentale de la floculation$$,
        'body', $$Une expérience en trois étapes confirme ce mécanisme : lorsqu'on ajoute du chlorure de calcium (CaCl2) à un filtrat de terre argileuse, on observe une floculation (alors que sans CaCl2, l'argile reste en suspension) ; de même, ajouter du CaCl2 à un surnageant riche en humus provoque une floculation (alors que sans CaCl2, l'humus reste en solution colloïdale) ; enfin, en mélangeant les deux filtrats puis en ajoutant du CaCl2, on obtient une floculation importante, montrant que les particules d'argile et d'humus s'associent bien par l'intermédiaire des ions Ca²⁺. Grâce à ses charges négatives, le complexe argilo-humique peut fixer de nombreux sels minéraux : c'est son pouvoir absorbant.$$,
        'highlights', array[$$CaCl2 ajouté à l'argile seule ou à l'humus seul → floculation$$, $$argile + humus + CaCl2 → floculation importante (association confirmée)$$, $$pouvoir absorbant : capacité du complexe à fixer des sels minéraux$$]::text[],
        'fixation', jsonb_build_object('question', $$Que se passe-t-il quand on ajoute du chlorure de calcium à un filtrat de terre argileuse ?$$, 'solution', $$On observe une floculation (les particules d'argile s'associent), alors qu'en l'absence de CaCl2, l'argile reste dispersée en suspension.$$)
      ),
      jsonb_build_object(
        'heading', $$Le complexe adsorbant$$,
        'body', $$Le complexe argilo-humique fixe à sa surface des cations (Ca²⁺, K⁺, etc.) provenant de la solution du sol : c'est pourquoi on l'appelle aussi complexe adsorbant — l'ensemble des colloïdes (argileux et humiques) dotés de charges négatives, capables de retenir les cations. Les charges négatives des colloïdes fixent d'abord les cations, puis les anions de la solution du sol.$$,
        'highlights', array[$$complexe adsorbant = complexe argilo-humique, retient les cations à sa surface$$, $$fixation : cations d'abord, anions ensuite$$]::text[],
        'fixation', jsonb_build_object('question', $$Que désigne-t-on par « complexe adsorbant » ?$$, 'solution', $$L'ensemble des colloïdes du sol (argileux et humiques), dotés de charges négatives, susceptibles de retenir les cations.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme d'échange d'ions entre le complexe et la solution du sol$$,
        'body', $$Il existe un équilibre permanent entre les ions libres de la solution du sol et ceux fixés sur le complexe argilo-humique, un équilibre qui peut se déplacer dans les deux sens. Lorsque les plantes absorbent des ions de la solution du sol (ou lorsqu'ils sont entraînés par lessivage), il se crée un déficit : le complexe argilo-humique libère alors des ions pour le combler. Inversement, lorsqu'on apporte des ions à la solution du sol (engrais, amendements), il se crée un excès : le complexe argilo-humique fixe alors ces ions pour rétablir l'équilibre. Ce mécanisme met ainsi les ions minéraux à la disposition des plantes de façon continue.$$,
        'highlights', array[$$équilibre permanent entre ions libres (solution) et ions fixés (complexe)$$, $$déficit d'ions (absorption par les plantes, lessivage) → le complexe libère des ions$$, $$excès d'ions (engrais, amendements) → le complexe fixe des ions$$]::text[],
        'example', jsonb_build_object('statement', $$Après un apport d'engrais riche en potassium, les ions K⁺ deviennent en excès dans la solution du sol. Que fait le complexe argilo-humique ?$$, 'solution', $$Il fixe une partie des ions K⁺ excédentaires, rétablissant ainsi l'équilibre ionique de la solution du sol.$$),
        'fixation', jsonb_build_object('question', $$Que fait le complexe argilo-humique lorsque les racines des plantes absorbent massivement les ions de la solution du sol ?$$, 'solution', $$Il libère des ions pour combler le déficit créé dans la solution du sol.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves découvre, dans un manuel de SVT, l'expérience de Way : de la terre sableuse et de la terre argileuse sont placées dans des entonnoirs, et on y verse goutte à goutte une solution de chlorure de potassium (KCl). Les concentrations (en unités arbitraires) mesurées sont : solution initiale [K⁺] = 10, [Cl⁻] = 10, [Ca²⁺] = 0 ; solution finale du sol sableux [K⁺] = 8, [Cl⁻] = 10, [Ca²⁺] = 2 ; solution finale du sol argileux [K⁺] = 2, [Cl⁻] = 10, [Ca²⁺] = 8.$$,
      'questions', array[
        $$Analyse les résultats obtenus (évolution des concentrations en K⁺, Cl⁻ et Ca²⁺ pour chaque type de sol).$$,
        $$Interprète ces résultats.$$,
        $$Déduis-en le rôle du complexe argilo-humique dans le sol.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois éléments constitutifs du complexe argilo-humique ?$$,
      'hint', $$Deux colloïdes et un intermédiaire ionique.$$,
      'expected', $$L'argile, l'humus, et des ions positifs (cations, comme le Ca²⁺) qui les relient.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que le « pont calcique » dans le complexe argilo-humique ?$$,
      'hint', $$Il permet à deux particules chargées négativement de s'associer.$$,
      'expected', $$C'est la liaison formée par un ion calcium (Ca²⁺) entre une micelle d'argile et une micelle d'humus, toutes deux électronégatives.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on le « pouvoir absorbant » du complexe argilo-humique ?$$,
      'hint', $$C'est sa capacité à retenir certains éléments chimiques.$$,
      'expected', $$Sa capacité à fixer de nombreux sels minéraux (cations puis anions) grâce à ses charges négatives.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel cas le complexe argilo-humique fixe-t-il des ions de la solution du sol, plutôt que d'en libérer ?$$,
      'hint', $$C'est l'opposé de l'absorption par les plantes.$$,
      'expected', $$Lorsqu'il y a un excès d'ions dans la solution du sol, par exemple après un apport d'engrais ou d'amendements.$$
    )
  ),
  now()
);
