-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2033: "MATHS_1C L12: ORTHOGONALITÉ DANS L'ESPACE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2033), resource id 17858.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-orthogonalite-espace',
  '1ere',
  'C',
  'mathematiques',
  $$Orthogonalité dans l'espace$$,
  12,
  '1ere-c-maths-etude-representation-graphique-fonction',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Hermann, élève en 1ère C, ne comprend pas pourquoi son frère aîné affirme que dans le cube ABCDEFGH, les droites (HG) et (IJ) sont orthogonales, avec I et J milieux respectifs de [FB] et [FG]. Il doit faire des recherches sur les propriétés de l'orthogonalité dans l'espace pour comprendre cette affirmation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Droites orthogonales de l'espace$$,
        'body', $$Deux droites (D1) et (D2) de l'espace sont orthogonales s'il existe deux droites perpendiculaires (L1) et (L2) telles que (D1)//(L1) et (D2)//(L2). Le terme « perpendiculaire » ne s'utilise que pour des droites orthogonales et sécantes : deux droites orthogonales ne sont pas nécessairement sécantes. Propriété 1 : si deux droites sont orthogonales, toute droite parallèle à l'une est orthogonale à l'autre. Propriété 2 : si deux droites sont parallèles, toute droite orthogonale à l'une est orthogonale à l'autre.$$,
        'highlights', array[$$(D1)⊥(D2) : il existe (L1)⊥(L2) avec (D1)//(L1), (D2)//(L2)$$, $$orthogonales ≠ nécessairement sécantes ; perpendiculaires = orthogonales + sécantes$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un cube ABCDEFGH, I milieu de [DG], J milieu de [BG]. Démontre que (IJ) et (AC) sont orthogonales.$$, 'solution', $$Dans le triangle BDG, (IJ) est la droite des milieux, donc (IJ)//(BD). Or ABCD est un carré, donc (AC)⊥(BD). Comme (IJ)//(BD) et (AC)⊥(BD), alors (AC)⊥(IJ).$$),
        'fixation', jsonb_build_object('question', $$Deux droites orthogonales à une même troisième droite sont-elles nécessairement parallèles entre elles ?$$, 'solution', $$Non, dans l'espace ce n'est pas nécessairement le cas.$$)
      ),
      jsonb_build_object(
        'heading', $$Droites et plans orthogonaux$$,
        'body', $$Une droite (D) est perpendiculaire à un plan (P) si (D) est orthogonale à deux droites sécantes de (P). Propriété fondamentale : si une droite est perpendiculaire à un plan, elle est orthogonale à toute droite incluse dans ce plan. Autres propriétés : il existe une unique droite passant par un point donné et perpendiculaire à un plan donné ; un unique plan passant par un point donné et perpendiculaire à une droite donnée ; si deux droites sont parallèles, tout plan perpendiculaire à l'une est perpendiculaire à l'autre ; si deux droites sont perpendiculaires à un même plan, elles sont parallèles ; si deux plans sont parallèles, toute droite perpendiculaire à l'un est perpendiculaire à l'autre ; si deux plans sont perpendiculaires à une même droite, ils sont parallèles.$$,
        'highlights', array[$$(D)⊥(P) ⟺ (D) orthogonale à 2 droites sécantes de (P)$$, $$(D)⊥(P) ⟹ (D) orthogonale à toute droite incluse dans (P) (propriété fondamentale)$$, $$2 droites ⊥ au même plan ⟹ parallèles entre elles$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le cube ABCDEFGH, (DH)⊥(HE) et (DH)⊥(HG). Que peut-on en déduire pour (DH) et (EG) ?$$, 'solution', $$(DH) est orthogonale à deux droites sécantes (HE) et (HG) du plan (EGH), donc (DH)⊥(EGH). Comme (EG)⊂(EGH), la propriété fondamentale donne (DH)⊥(EG).$$),
        'fixation', jsonb_build_object('question', $$Combien existe-t-il de droites passant par un point donné et perpendiculaires à un plan donné ?$$, 'solution', $$Une seule (unique).$$)
      ),
      jsonb_build_object(
        'heading', $$Plans perpendiculaires de l'espace$$,
        'body', $$Deux plans (P) et (Q) sont perpendiculaires lorsque l'un contient une droite orthogonale à l'autre plan : si (d)⊂(P) et (Q)⊥(d), alors (P)⊥(Q). Propriété 1 : si deux plans sont perpendiculaires, tout plan parallèle à l'un est perpendiculaire à l'autre. Propriété 2 : un plan est perpendiculaire à deux plans sécants si et seulement s'il est perpendiculaire à leur droite d'intersection. Conséquences : si (D)⊥(P), tout plan parallèle à (D) est perpendiculaire à (P) ; si deux plans sont perpendiculaires, toute droite perpendiculaire à l'un est parallèle à l'autre.$$,
        'highlights', array[$$(P)⊥(Q) ⟺ (P) contient une droite (d) telle que (Q)⊥(d)$$, $$plan ⊥ à 2 plans sécants ⟺ plan ⊥ à leur droite d'intersection$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le cube ABCDEFGH, démontre que les plans (ACE) et (DEH) sont perpendiculaires au plan (ABC).$$, 'solution', $$(ACE) et (DEH) sont sécants selon (AE). (AE)⊥(AD) et (AE)⊥(AB), deux droites sécantes incluses dans (ABC), donc (AE)⊥(ABC). Comme (AE)⊂(ACE) et (AE)⊂(DEH), les deux plans sont perpendiculaires à (ABC).$$),
        'fixation', jsonb_build_object('question', $$Si une droite (D) est perpendiculaire à un plan (P), que peut-on dire de tout plan parallèle à (D) ?$$, 'solution', $$Il est perpendiculaire à (P).$$)
      ),
      jsonb_build_object(
        'heading', $$Projections orthogonales sur un plan, sur une droite$$,
        'body', $$Le projeté orthogonal d'un point A sur un plan (P) est le point H tel que la droite (AH) soit perpendiculaire à (P) ; AH est la distance de A au plan. Le projeté orthogonal de B sur une droite (Δ) est le point K tel que le plan passant par B perpendiculaire à (Δ) coupe (Δ) en K ; BK est la distance de B à la droite. Par une projection orthogonale sur un plan (P) : l'image d'une droite (D) est un singleton si (D)⊥(P), une droite sinon ; l'image d'un segment [AB] est un singleton si (AB)⊥(P), un segment sinon ; l'image du milieu de [AB] est le milieu de l'image de [AB], si (AB) n'est pas perpendiculaire à (P).$$,
        'highlights', array[$$projeté orthogonal de A sur (P) : point H tel que (AH)⊥(P)$$, $$image du milieu d'un segment = milieu de l'image (si segment non perpendiculaire au plan)$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un cube ABCDEFGH, J centre du carré ABCD, I centre du carré EFGH. Détermine le projeté orthogonal de I sur le plan (ABC).$$, 'solution', $$I est le milieu de [HF]. Le projeté orthogonal de [HF] sur (ABC) est le segment [DB]. Donc le projeté orthogonal de I est le milieu de [DB], c'est-à-dire le point J.$$),
        'fixation', jsonb_build_object('question', $$Quelle est l'image d'une droite (D) par projection orthogonale sur un plan (P), lorsque (D) est perpendiculaire à (P) ?$$, 'solution', $$Un singleton (un seul point).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Soit ABCDEFGH un cube. I et J sont les milieux respectifs des arêtes [BC] et [CD]. P et Q sont les centres respectifs des faces AEHD et CDHG. Le professeur affirme que les droites (PQ) et (IJ) sont orthogonales et non sécantes.$$,
      'questions', array[
        $$Justifie que (IJ) et (PQ) sont non sécantes, en observant que (IJ) est incluse dans le plan (ABC) et (PQ) dans un plan (Π) parallèle à (ABC) (le plan médiateur de [AE]).$$,
        $$En notant J le projeté orthogonal de Q sur (ABC) et S le projeté orthogonal de P sur (ABC), justifie que (SJ) et (PQ) sont parallèles, puis que (SJ)⊥(BD) en utilisant le théorème des milieux dans les triangles BCD et ACD.$$,
        $$Déduis-en, à partir de (SJ)⊥(BD), (SJ)//(PQ) et (BD)//(IJ), que (PQ)⊥(IJ).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition de deux droites orthogonales dans l'espace ?$$,
      'hint', $$Elle fait intervenir deux droites perpendiculaires auxiliaires.$$,
      'expected', $$Il existe deux droites perpendiculaires (L1) et (L2) telles que (D1) soit parallèle à (L1) et (D2) parallèle à (L2).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la propriété fondamentale reliant une droite perpendiculaire à un plan et les droites de ce plan ?$$,
      'hint', $$Elle concerne toutes les droites incluses dans le plan, pas seulement deux.$$,
      'expected', $$Si une droite est perpendiculaire à un plan, alors elle est orthogonale à toute droite incluse dans ce plan.$$
    ),
    jsonb_build_object(
      'question', $$Si deux droites sont perpendiculaires à un même plan, que peut-on en conclure ?$$,
      'hint', $$C'est une conséquence directe de l'unicité de la perpendiculaire.$$,
      'expected', $$Elles sont parallèles entre elles.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'image d'un segment [AB] par projection orthogonale sur un plan (P) lorsque (AB) n'est pas perpendiculaire à (P) ?$$,
      'hint', $$C'est différent du cas où (AB) est perpendiculaire au plan.$$,
      'expected', $$C'est un segment.$$
    )
  ),
  now()
);
