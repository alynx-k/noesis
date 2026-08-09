-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths lecon 4 Distance"
-- (Collège Numérique, Thème "Géométrie du plan", Leçon 4, course id 1992,
-- resource id 16200, downloaded from coll.ecole-ci.org and read directly).
-- The real lesson covers only three sub-topics — distance d'un point à
-- une droite, distance de deux droites parallèles, and caractérisation de
-- la bissectrice (direct property + converse) — narrower than the earlier
-- fallback, which had also folded in tangente-au-cercle and inégalité
-- triangulaire (neither of which appears in this real "Distances" PDF;
-- tangente belongs to the Cercles-et-triangles lesson instead). Every
-- sentence, example and exercise below is an original composition in our
-- own wording — no sentence is copied verbatim from the source PDF.
-- Diagram: a generic point-to-line perpendicular (rightAngleAt the foot),
-- own coordinates.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un planteur de la région de Bonon veut faire tracer le chemin le plus court reliant son champ à la route principale, bitumée et rectiligne à cet endroit, pour réduire ses frais de transport. Il confie ce tracé à son fils, élève de 4ème, qui doit trouver, sur la carte, le segment le plus court joignant le champ à la route — c'est-à-dire la distance du point représentant le champ à la droite représentant la route.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Distance d'un point à une droite$$,
        'body', $$Parmi tous les segments reliant un point K, extérieur à une droite (D), à un point quelconque de (D), un seul est le plus court : celui qui rejoint (D) perpendiculairement. Cette longueur minimale s'appelle la distance du point K à la droite (D).$$,
        'highlights', array[$$distance d'un point à une droite$$, $$perpendiculaire$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Si M est le pied de la perpendiculaire à (D) passant par K, alors KM est la distance de K à la droite (D). Pour tout autre point G de (D) distinct de M, on a KM < KG.$$),
        'example', jsonb_build_object('statement', $$La droite (SH) est perpendiculaire à la droite (L) au point H. Que représente la longueur SH ?$$, 'solution', $$Comme (SH) est perpendiculaire à (L) en H, SH est la distance du point S à la droite (L).$$),
        'fixation', jsonb_build_object('question', $$Un point A est relié perpendiculairement à une droite (D) par un segment [AH]. Un autre point G de (D), distinct de H, est tel que AG = 9 cm et AH = 6 cm. Explique pourquoi c'est bien AH, et non AG, qui est la distance de A à (D).$$, 'solution', $$AH est la distance de A à (D) car [AH] est le segment perpendiculaire à (D) ; pour tout autre point G de (D), on a AH < AG, ce que confirment les 6 cm et 9 cm donnés.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(220, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 110, 'y', 30, 'label', $$K$$),
            jsonb_build_object('x', 110, 'y', 120, 'label', $$M$$),
            jsonb_build_object('x', 20, 'y', 120, 'label', $$$$),
            jsonb_build_object('x', 200, 'y', 120, 'label', $$G$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(2,3)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,3)),
          'rightAngleAt', jsonb_build_array(1)
        )
      ),
      jsonb_build_object(
        'heading', $$Distance de deux droites parallèles$$,
        'body', $$Pour deux droites parallèles (L) et (D), on choisit un point A sur (L) et un point B sur (D) tels que la droite (AB) soit perpendiculaire à (L) ; la longueur AB, appelée distance des deux droites parallèles, est alors la même quel que soit l'endroit où l'on a choisi de la mesurer.$$,
        'highlights', array[$$droites parallèles$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$(L) et (D) étant parallèles, A un point de (L) et B un point de (D) tels que (AB) soit perpendiculaire à (L), la distance AB est appelée distance des droites parallèles (L) et (D).$$),
        'example', jsonb_build_object('statement', $$(D) et (Δ) sont deux droites parallèles ; A appartient à (D), B appartient à (Δ), (AB) est perpendiculaire à (Δ) et AB = 2,6 cm. Que représente cette longueur ?$$, 'solution', $$AB est la distance des deux droites parallèles (D) et (Δ), soit 2,6 cm.$$),
        'fixation', jsonb_build_object('question', $$Deux murs parallèles d'un couloir sont espacés de 1,8 m à l'entrée. Quelle est la distance entre ces mêmes murs à 15 m plus loin ?$$, 'solution', $$Les murs sont parallèles, donc leur distance est constante quel que soit l'endroit mesuré : elle reste 1,8 m.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractérisation de la bissectrice — propriété directe$$,
        'body', $$La bissectrice d'un angle possède une propriété de distance remarquable : tout point qui se trouve sur elle est automatiquement à la même distance des deux côtés (ou de leurs supports) de cet angle, sans qu'il soit nécessaire de le mesurer.$$,
        'highlights', array[$$bissectrice$$, $$équidistant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si un point appartient à la bissectrice d'un angle, alors il est équidistant des supports des côtés de cet angle.$$),
        'example', jsonb_build_object('statement', $$M est un point de la bissectrice (D) de l'angle AOB. Que peut-on dire des distances de M aux droites (OA) et (OB) ?$$, 'solution', $$Comme M appartient à la bissectrice de l'angle AOB, il est équidistant des supports (OA) et (OB) : distance de M à (OA) = distance de M à (OB).$$),
        'fixation', jsonb_build_object('question', $$La droite (OM) est la bissectrice de l'angle AOB, et M appartient à cette droite. Justifie que M est équidistant des droites (OA) et (OB).$$, 'solution', $$M appartient à la bissectrice (OM) de l'angle AOB, donc d'après la propriété, M est équidistant des supports des côtés (OA) et (OB) de cet angle.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractérisation de la bissectrice — réciproque$$,
        'body', $$La réciproque permet de repérer une bissectrice sans la construire directement : si un point se révèle équidistant des deux côtés d'un angle, on peut affirmer avec certitude qu'il se trouve sur la bissectrice de cet angle.$$,
        'highlights', array[$$réciproque$$]::text[],
        'property', jsonb_build_object('label', $$Propriété (réciproque)$$, 'text', $$Si un point est équidistant des supports des côtés d'un angle, alors ce point appartient à la bissectrice de cet angle.$$),
        'example', jsonb_build_object('statement', $$(C) est un cercle de centre M ; A et B sont deux points de (C) situés respectivement sur les côtés d'un angle AOB, avec donc MA = MB. Que peut-on en déduire sur M ?$$, 'solution', $$MA = MB, donc M est équidistant des supports des côtés de l'angle AOB. D'après la réciproque, M appartient à la bissectrice de cet angle.$$),
        'fixation', jsonb_build_object('question', $$Un point S est à égale distance des droites (PQ) et (QR), côtés de l'angle PQR. Que peut-on affirmer sur S ?$$, 'solution', $$S étant équidistant des supports (PQ) et (QR), il appartient, d'après la réciproque, à la bissectrice de l'angle PQR.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un nouveau collège, le mât du drapeau doit être planté au centre d'une dalle circulaire, elle-même installée dans un espace triangulaire ABC, de sorte que le mât soit à égale distance des trois côtés du triangle. On donne AB = 24 m, AC = 20 m et BC = 16 m.$$,
      'questions', array[
        $$Justifie que le centre O de la dalle circulaire appartient à la bissectrice de l'angle ABC et à la bissectrice de l'angle ACB.$$,
        $$Décris un programme de construction du point O à partir de cette propriété.$$,
        $$Sachant que le rayon de la dalle est r, exprime en fonction de r l'aire de chacun des triangles AOB, AOC et BOC, puis déduis-en l'aire totale du triangle ABC en fonction de r.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un point A est relié perpendiculairement à une route (D) par un segment [AH] de 28 m. Un autre point P de la route est tel que AP = 41 m. Donne la distance de A à la route (D), et justifie.$$,
      'hint', $$Relis la définition : la distance d'un point à une droite est la longueur du segment perpendiculaire à cette droite.$$,
      'expected', $$La distance de A à (D) est AH = 28 m, car [AH] est le segment perpendiculaire à la route ; c'est nécessairement le plus court, donc AH < AP.$$
    ),
    jsonb_build_object(
      'question', $$Deux rails de chemin de fer parallèles sont espacés de 1,435 m à un endroit donné. Quelle est leur distance à 300 m de là ?$$,
      'hint', $$Relis la propriété : la distance entre deux droites parallèles est constante, où qu'on la mesure.$$,
      'expected', $$Les rails restent parallèles, donc leur distance reste 1,435 m, quel que soit l'endroit choisi.$$
    ),
    jsonb_build_object(
      'question', $$Un point M appartient à la bissectrice de l'angle XOY. Que peut-on affirmer sur les distances de M aux droites (OX) et (OY) ? Justifie avec la propriété directe.$$,
      'hint', $$Applique directement la propriété : appartenir à la bissectrice entraîne l'équidistance.$$,
      'expected', $$M appartenant à la bissectrice de l'angle XOY, il est équidistant des supports (OX) et (OY) : distance de M à (OX) = distance de M à (OY).$$
    ),
    jsonb_build_object(
      'question', $$Un point T est équidistant des droites (RS) et (RU), côtés de l'angle SRU. Que peut-on affirmer sur T ? Justifie avec la réciproque.$$,
      'hint', $$Applique la réciproque de la caractérisation de la bissectrice.$$,
      'expected', $$T étant équidistant des supports (RS) et (RU), il appartient, d'après la réciproque, à la bissectrice de l'angle SRU.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-distances';
