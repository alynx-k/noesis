-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 6: Angles inscrits"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. Diagram: a generic circle with an inscribed angle and
-- its associated central angle (own coordinates, not the source's médaille
-- figure). Uses the new CourseDiagram.circle field (added alongside this
-- lesson, since a circle-based lesson cannot be illustrated with segments
-- alone) — see lib/courses.ts and components/geometry-diagram.tsx.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un vitrailliste doit reproduire un vitrail circulaire orné de triangles inscrits dans le cercle. Pour tailler chaque pièce de verre avec précision, il a besoin de connaître les mesures des angles formés aux sommets de ces triangles, mais son rapporteur est trop petit pour le grand cercle du vitrail. Son apprenti se souvient d'une propriété reliant les angles inscrits dans un cercle aux angles mesurés depuis le centre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Angle inscrit dans un cercle$$,
        'body', $$Un angle inscrit dans un cercle est un angle dont le sommet est un point du cercle et dont les deux côtés recoupent le cercle en deux autres points. On dit qu'il intercepte l'arc compris entre ces deux points, celui qui ne contient pas le sommet.$$,
        'highlights', array[$$angle inscrit$$, $$intercepte$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un angle inscrit dans un cercle est un angle dont le sommet appartient au cercle et dont les côtés recoupent le cercle. Il intercepte l'arc compris entre les deux points d'intersection, situé du côté opposé au sommet.$$),
        'example', jsonb_build_object('statement', $$Sur un cercle, trois points P, Q et R sont placés. Quel est l'angle inscrit de sommet Q, et quel arc intercepte-t-il ?$$, 'solution', $$C'est l'angle PQR, dont le sommet Q est sur le cercle et dont les côtés recoupent le cercle en P et R : il intercepte l'arc PR qui ne contient pas Q.$$),
        'fixation', jsonb_build_object('question', $$Sur un cercle, les points G, H et K sont placés. Nomme l'angle inscrit de sommet H et précise l'arc qu'il intercepte.$$, 'solution', $$C'est l'angle GHK ; il intercepte l'arc GK qui ne contient pas H.$$)
      ),
      jsonb_build_object(
        'heading', $$Angle inscrit et angle au centre associé$$,
        'body', $$Un angle inscrit et un angle au centre d'un même cercle sont dits associés lorsqu'ils interceptent le même arc. Cette association est la clé de la propriété la plus utile de cette leçon.$$,
        'highlights', array[$$associés$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un angle inscrit et un angle au centre d'un même cercle sont associés lorsqu'ils interceptent le même arc.$$),
        'example', jsonb_build_object('statement', $$Dans un cercle de centre O, les points G, H et K sont sur le cercle. Quel angle au centre est associé à l'angle inscrit GHK ?$$, 'solution', $$L'angle au centre associé est GOK, car il intercepte le même arc GK que l'angle inscrit GHK.$$),
        'fixation', jsonb_build_object('question', $$Dans un cercle de centre O, les points L, M et N sont sur le cercle. Quel angle au centre est associé à l'angle inscrit LMN ?$$, 'solution', $$L'angle au centre associé est LON, car il intercepte le même arc LN.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 200),
          'circle', jsonb_build_object('cx', 100, 'cy', 100, 'r', 80),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 100, 'label', $$O$$),
            jsonb_build_object('x', 25, 'y', 73, 'label', $$A$$),
            jsonb_build_object('x', 175, 'y', 73, 'label', $$B$$),
            jsonb_build_object('x', 100, 'y', 180, 'label', $$M$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2), jsonb_build_array(3,1), jsonb_build_array(3,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Propriété : angle inscrit et angle au centre associé$$,
        'body', $$Voici la propriété la plus importante de la leçon : un angle inscrit et son angle au centre associé ne sont pas égaux, mais liés par un rapport très simple, toujours le même.$$,
        'highlights', array[$$propriété$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un angle inscrit dans un cercle a pour mesure la moitié de celle de l'angle au centre associé, qui intercepte le même arc.$$),
        'example', jsonb_build_object('statement', $$Dans un cercle de centre O, l'angle au centre AOB mesure 100°. Calcule la mesure de l'angle inscrit AMB associé.$$, 'solution', $$mes AMB = (1/2) × mes AOB = (1/2) × 100° = 50°.$$),
        'fixation', jsonb_build_object('question', $$Dans un cercle de centre O, l'angle inscrit CDE mesure 42°. Calcule la mesure de l'angle au centre COE associé.$$, 'solution', $$mes COE = 2 × mes CDE = 2 × 42° = 84°.$$)
      ),
      jsonb_build_object(
        'heading', $$Angles inscrits interceptant le même arc$$,
        'body', $$Quand deux angles inscrits interceptent le même arc dans un même cercle, ils ont toujours exactement la même mesure, même s'ils n'ont pas le même sommet.$$,
        'highlights', array[$$même arc$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si, dans un même cercle, deux angles inscrits interceptent le même arc, alors ils ont la même mesure.$$),
        'example', jsonb_build_object('statement', $$Dans un cercle, les angles inscrits BAC et BDC interceptent tous les deux l'arc BC. On donne mes BAC = 47°. Calcule mes BDC.$$, 'solution', $$Les deux angles interceptent le même arc BC, donc mes BDC = mes BAC = 47°.$$),
        'fixation', jsonb_build_object('question', $$Dans un cercle, les angles inscrits PQR et PSR interceptent tous les deux l'arc PR. On donne mes PSR = 63°. Calcule mes PQR.$$, 'solution', $$Les deux angles interceptent le même arc PR, donc mes PQR = mes PSR = 63°.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur une grande roue foraine, trois cabines A, B et C sont accrochées au cercle formé par la roue, de centre O. Un technicien mesure, depuis une quatrième cabine D, l'angle inscrit ADC et trouve 70°. Il mesure aussi, depuis le centre, l'angle BOC qui vaut 46°.$$,
      'questions', array[
        $$Calcule la mesure de l'angle au centre AOC associé à l'angle inscrit ADC.$$,
        $$Sachant que mes AOB = mes AOC − mes BOC, calcule mes AOB.$$,
        $$Le règlement de sécurité impose que l'angle entre deux cabines consécutives A et B ne dépasse pas 100°. La disposition est-elle conforme ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Sur un cercle, les points X, Y et Z sont placés. Nomme l'angle inscrit de sommet Y et l'arc qu'il intercepte.$$,
      'hint', $$Relis la définition : le sommet est sur le cercle, les côtés recoupent le cercle en deux points.$$,
      'expected', $$C'est l'angle XYZ ; il intercepte l'arc XZ qui ne contient pas Y.$$
    ),
    jsonb_build_object(
      'question', $$Dans un cercle de centre O, l'angle au centre EOF mesure 88°. Calcule la mesure de l'angle inscrit EGF associé.$$,
      'hint', $$Relis la propriété : l'angle inscrit vaut la moitié de l'angle au centre associé.$$,
      'expected', $$mes EGF = (1/2) × 88° = 44°.$$
    ),
    jsonb_build_object(
      'question', $$Dans un cercle, les angles inscrits MNP et MQP interceptent tous les deux l'arc MP. On donne mes MQP = 55°. Calcule mes MNP.$$,
      'hint', $$Relis la propriété des angles inscrits interceptant le même arc.$$,
      'expected', $$mes MNP = mes MQP = 55°.$$
    ),
    jsonb_build_object(
      'question', $$Dans un cercle de centre O, l'angle inscrit RST mesure 38°. Calcule la mesure de l'angle au centre ROT associé, puis déduis-en si ROT est un angle aigu, droit ou obtus.$$,
      'hint', $$Relis la propriété : angle au centre = 2 × angle inscrit associé.$$,
      'expected', $$mes ROT = 2 × 38° = 76°. Comme 76°<90°, ROT est un angle aigu.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-angles-inscrits';
