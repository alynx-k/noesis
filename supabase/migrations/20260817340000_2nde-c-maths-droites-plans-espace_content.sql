-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3135: "LEÇON 5 : DROITES ET PLANS DE L'ESPACE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3135)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30895, redirecting
-- to pluginfile "Maths 2C_L5_Droites et plans dans lespace ..pdf" (15 pages).
-- Rewritten/paraphrased from the source PDF: positions relatives de deux
-- droites (coplanaires/non coplanaires, sécantes, parallèles), détermination
-- d'un plan, positions relatives d'une droite et d'un plan, positions
-- relatives de deux plans, section plane d'un solide, parallélisme (droites,
-- droite-plan, deux plans) et méthodes usuelles de démonstration en
-- géométrie de l'espace. La situation complexe d'évaluation (tétraèdre ABCD,
-- position de (BD) par rapport au plan (AIJ)) est reformulée avec d'autres
-- noms de points. 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-droites-plans-espace',
  '2nde',
  'C',
  'mathematiques',
  $$Droites et plans de l'espace$$,
  5,
  '2nde-c-maths-generalites-fonctions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un exercice au lycée moderne de Sinfra, la figure d'un cube ABCDEFGH a été réalisée au tableau. I est un point de l'arête [EH], J un point de l'arête [AB] et K un point de l'arête [FG]. En observant la figure, un élève affirme que la droite (IK) est commune aux plans (IJK) et (EFG). Les autres élèves, curieux, veulent connaître l'intersection du plan (IJK) avec les différentes faces du cube, et décident de construire la section du plan (IJK) avec le cube pour vérifier cette affirmation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Positions relatives de deux droites de l'espace$$,
        'body', $$Dans l'espace, deux droites peuvent être coplanaires (il existe un plan qui les contient toutes les deux) ou non coplanaires. Lorsqu'elles sont coplanaires, elles sont soit sécantes (elles ont un unique point commun), soit parallèles (strictement parallèles si elles n'ont aucun point commun, ou confondues si elles sont identiques). Deux droites non coplanaires n'ont, quant à elles, aucun point commun : on dit alors qu'elles sont disjointes, mais attention, deux droites disjointes ne sont pas nécessairement parallèles, elles peuvent tout simplement ne pas être coplanaires.$$,
        'highlights', array[$$droites coplanaires$$, $$droites non coplanaires$$, $$sécantes, parallèles$$]::text[],
        'example', jsonb_build_object('statement', $$ABCDEFGH est un cube. Montre que les droites (GF) et (CD) sont disjointes.$$, 'solution', $$G, F et C ne sont pas alignés, donc (GFC) est un plan. Or D n'appartient pas à ce plan, donc G, F, C et D ne sont pas coplanaires. Si (GF) et (CD) étaient coplanaires, ces quatre points le seraient aussi, ce qui est absurde : (GF) et (CD) sont donc non coplanaires, donc disjointes.$$),
        'fixation', jsonb_build_object('question', $$Deux droites disjointes sont-elles nécessairement parallèles ?$$, 'solution', $$Non : elles peuvent être non coplanaires, c'est-à-dire ne pas appartenir à un même plan, sans pour autant être parallèles.$$)
      ),
      jsonb_build_object(
        'heading', $$Déterminer un plan et positions relatives droite/plan$$,
        'body', $$Un plan de l'espace peut être déterminé de quatre façons : par trois points non alignés, par une droite et un point n'appartenant pas à cette droite, par deux droites sécantes, ou par deux droites strictement parallèles. Une fois un plan (P) fixé, une droite (D) de l'espace se trouve dans l'une de ces trois positions par rapport à (P) : (D) et (P) sont disjoints (droite et plan strictement parallèles), (D) est incluse dans (P), ou (D) et (P) sont sécants (leur intersection est réduite à un seul point).$$,
        'highlights', array[$$déterminer un plan$$, $$droite et plan sécants$$, $$droite parallèle à un plan$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Façon de déterminer un plan$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Trois points non alignés$$),
            jsonb_build_array($$Une droite et un point extérieur à cette droite$$),
            jsonb_build_array($$Deux droites sécantes$$),
            jsonb_build_array($$Deux droites strictement parallèles$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois positions relatives possibles entre une droite (D) et un plan (P) ?$$, 'solution', $$(D) et (P) disjoints, (D) incluse dans (P), ou (D) et (P) sécants en un point.$$)
      ),
      jsonb_build_object(
        'heading', $$Positions relatives de deux plans et section plane$$,
        'body', $$Deux plans de l'espace peuvent être disjoints (strictement parallèles), confondus, ou sécants suivant une droite. Par un point donné de l'espace, il passe un et un seul plan parallèle à un plan donné. Lorsque deux plans sont parallèles, tout plan sécant à l'un est sécant à l'autre et leurs droites d'intersection sont parallèles ; toute droite parallèle à l'un est parallèle à l'autre ; et toute droite sécante à l'un est sécante à l'autre. La section d'un solide par un plan est l'ensemble des points communs au solide et à ce plan ; pour la construire, on détermine l'intersection du plan avec chacune des faces du solide.$$,
        'highlights', array[$$plans sécants$$, $$plans parallèles$$, $$section plane$$]::text[],
        'example', jsonb_build_object('statement', $$SMNPQ est une pyramide de sommet S. On place I sur [SQ], J sur [SP], K sur [NP] et L sur [MQ]. Que représente le quadrilatère IJKL ?$$, 'solution', $$IJKL représente la section plane de la pyramide SMNPQ par le plan (IJK) : c'est la trace laissée par ce plan sur les différentes faces du solide.$$),
        'fixation', jsonb_build_object('question', $$Que peut-on dire des droites d'intersection lorsqu'un plan sécant coupe deux plans parallèles ?$$, 'solution', $$Ces deux droites d'intersection sont parallèles entre elles.$$)
      ),
      jsonb_build_object(
        'heading', $$Parallélisme dans l'espace$$,
        'body', $$Une droite (D) est parallèle à un plan (P) si et seulement s'il existe, dans (P), une droite parallèle à (D). Si une droite (D) est parallèle à un plan (P), alors toute droite parallèle à (D) est aussi parallèle à (P). Une droite parallèle à deux plans sécants est parallèle à leur droite d'intersection. Ces propriétés, combinées à celles déjà connues sur le parallélisme dans le plan (comme la droite des milieux d'un triangle), permettent de démontrer des parallélismes dans l'espace sans avoir à tout mesurer.$$,
        'highlights', array[$$droite parallèle à un plan$$, $$droite parallèle à deux plans sécants$$]::text[],
        'example', jsonb_build_object('statement', $$ABCDE est une pyramide de sommet E, F le milieu de [EA] et G le milieu de [EC]. Justifie que (FG) est parallèle au plan (ABC).$$, 'solution', $$Dans le triangle EAC, F et G sont les milieux respectifs de [EA] et [EC], donc d'après la propriété de la droite des milieux, (FG) est parallèle à (AC). Or (AC) est une droite du plan (ABC), donc (FG) est parallèle au plan (ABC).$$),
        'fixation', jsonb_build_object('question', $$À quelle condition une droite (D) est-elle parallèle à un plan (P) ?$$, 'solution', $$À condition qu'il existe, dans le plan (P), au moins une droite parallèle à (D).$$)
      ),
      jsonb_build_object(
        'heading', $$Méthodes pratiques pour démontrer$$,
        'body', $$Certaines habiletés reviennent souvent en géométrie de l'espace et méritent une méthode systématique. Pour démontrer qu'un point appartient à un plan, il suffit de montrer qu'il appartient à une droite incluse dans ce plan. Pour démontrer que deux droites sont parallèles alors qu'on ne sait pas encore si elles sont coplanaires, on peut montrer qu'elles sont chacune parallèles à une même troisième droite. Pour démontrer que trois points sont alignés, il suffit de montrer qu'ils appartiennent tous les trois à une même droite, souvent obtenue comme l'intersection de deux plans contenant chacun ces points.$$,
        'highlights', array[$$méthodes de démonstration$$, $$appartenance à un plan$$, $$alignement de points$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle méthode permet souvent de démontrer que trois points sont alignés dans l'espace ?$$, 'solution', $$Montrer que ces trois points appartiennent à une même droite, obtenue par exemple comme l'intersection de deux plans qui les contiennent tous.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une séance d'exercices dirigée par le chef de classe en l'absence du professeur, une figure a été réalisée au tableau : ABCD est un tétraèdre, I est un point de la médiane du triangle ABC issue de A, et J un point de la médiane du triangle ACD issue de A. Il s'agit de trouver la position relative de la droite (BD) et du plan (AIJ). Certains élèves affirment que (BD) est parallèle au plan (AIJ), tandis que d'autres soutiennent que (BD) est sécante au plan (AIJ). Une discussion éclate entre les deux groupes.$$,
      'questions', array[
        $$En notant K le milieu de [BC] et R le milieu de [DC], montre que la droite (AI) coupe [BC] en K et que la droite (AJ) coupe [DC] en R.$$,
        $$Dans le triangle BCD, justifie que la droite (KR) est parallèle à la droite (BD).$$,
        $$Explique pourquoi cela permet de trancher le débat entre les deux groupes d'élèves sur la position relative de (BD) et du plan (AIJ).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie dire que deux droites de l'espace sont non coplanaires ?$$,
      'hint', $$Pense à l'existence (ou non) d'un plan commun.$$,
      'expected', $$Cela signifie qu'il n'existe aucun plan contenant à la fois les deux droites.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux façons de déterminer un plan dans l'espace.$$,
      'hint', $$Pense aux points, aux droites sécantes ou parallèles.$$,
      'expected', $$Par exemple : par trois points non alignés, ou par deux droites sécantes (on pouvait aussi citer une droite et un point extérieur, ou deux droites strictement parallèles).$$
    ),
    jsonb_build_object(
      'question', $$Un plan sécant coupe deux plans parallèles (P1) et (P2) selon deux droites (d1) et (d2). Que peut-on dire de (d1) et (d2) ?$$,
      'hint', $$Rappelle la propriété du parallélisme de deux plans.$$,
      'expected', $$Les droites (d1) et (d2) sont parallèles entre elles.$$
    ),
    jsonb_build_object(
      'question', $$Dans un tétraèdre ABCD, M et N sont les milieux respectifs de [AB] et [AC]. Justifie que (MN) est parallèle au plan (BCD).$$,
      'hint', $$Utilise la propriété de la droite des milieux dans le triangle ABC.$$,
      'expected', $$Dans le triangle ABC, M et N sont les milieux de [AB] et [AC], donc (MN) est parallèle à (BC) (droite des milieux). Comme (BC) est une droite du plan (BCD), (MN) est parallèle au plan (BCD).$$
    )
  ),
  now()
);
