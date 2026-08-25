-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Géométrie du plan).
-- Cours : "Leçon 8 : Cercle". Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés,
-- valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les pylônes de deux compagnies de téléphonie mobile (E et F) sont distants de 8 km. Le pylône E a un rayon de couverture de 6 km, celui de F de 4 km. Un gérant de cabine cellulaire veut installer sa cabine dans la zone couverte simultanément par les deux réseaux. Des élèves de 5ème cherchent à déterminer cette zone favorable.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Position d'un point par rapport à un cercle$$,
        'body', $$Pour un cercle (𝒞) de centre O et de rayon r, et un point M du plan : M est à l'intérieur du cercle si et seulement si OM < r ; M est sur le cercle si et seulement si OM = r ; M est à l'extérieur du cercle si et seulement si OM > r.$$,
        'highlights', array[$$OM < r → intérieur ; OM = r → sur le cercle ; OM > r → extérieur$$]::text[],
        'example', jsonb_build_object('statement', $$Un cercle de centre I a un rayon de 6 cm. Le point K est tel que IK = 6,1 cm. Où se situe K ?$$, 'solution', $$À l'extérieur du cercle, car IK (6,1) > r (6).$$),
        'fixation', jsonb_build_object('question', $$Un point M vérifie OM = r pour un cercle de centre O et rayon r. Où se situe M ?$$, 'solution', $$Sur le cercle.$$)
      ),
      jsonb_build_object(
        'heading', $$Cercle circonscrit à un triangle$$,
        'body', $$Le cercle circonscrit à un triangle est celui qui passe par ses trois sommets (le triangle est alors dit inscrit dans ce cercle). Son centre est le point de concours des trois médiatrices du triangle. Cas particulier important : si un triangle ABC est rectangle en A, alors le cercle de diamètre [BC] (son hypoténuse) est circonscrit à ce triangle ; réciproquement, un triangle inscrit dans un cercle de diamètre [BC] est rectangle au sommet opposé à ce diamètre.$$,
        'highlights', array[$$centre du cercle circonscrit = point de concours des 3 médiatrices$$, $$triangle rectangle en A ⟺ cercle circonscrit a pour diamètre l'hypoténuse [BC]$$]::text[],
        'example', jsonb_build_object('statement', $$Comment construire rapidement le cercle circonscrit à un triangle rectangle en A ?$$, 'solution', $$Il suffit de tracer le cercle dont le centre est le milieu de l'hypoténuse [BC] et le rayon la moitié de BC.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on un triangle dont les trois sommets appartiennent à un même cercle ?$$, 'solution', $$Un triangle inscrit dans ce cercle.$$)
      ),
      jsonb_build_object(
        'heading', $$Le disque$$,
        'body', $$Le disque de centre A et de rayon r, noté 𝒟(A,r), est l'ensemble des points M tels que AM < r ou AM = r. Autrement dit, un disque comprend à la fois l'intérieur du cercle et le cercle lui-même : tout point du cercle 𝒞(A,r) appartient donc au disque 𝒟(A,r).$$,
        'highlights', array[$$M ∈ 𝒟(A,r) ⟺ AM < r ou AM = r (intérieur + le cercle lui-même)$$]::text[],
        'fixation', jsonb_build_object('question', $$Un point du cercle appartient-il aussi au disque de même centre et rayon ?$$, 'solution', $$Oui, car le disque inclut le cercle (AM = r est une des deux conditions d'appartenance).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Trois villages (Assikoi=A, Bassazin=B, Nyan=N) veulent construire une maternité à égale distance des trois. AB=6km, BN=4km, NA=5km. Des élèves affirment que l'emplacement est le centre d'un cercle passant par les trois villages.$$,
      'questions', array[
        $$Explique comment construire le triangle ABN puis trouver le point I à égale distance des trois sommets.$$,
        $$Justifie que IA = IB = IN à partir des propriétés des médiatrices.$$,
        $$Les élèves ont-ils raison de dire que les trois villages appartiennent à un même cercle centré en I ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un cercle a pour centre O et rayon 5cm. Un point M vérifie OM=4,8cm. M est-il à l'intérieur, sur, ou à l'extérieur du cercle ?$$,
      'hint', $$Compare OM à r.$$,
      'expected', $$À l'intérieur, car OM (4,8) < r (5).$$
    ),
    jsonb_build_object(
      'question', $$Le centre du cercle circonscrit à un triangle est-il le point de concours des médianes ou des médiatrices ?$$,
      'hint', $$Ce sont les droites qui garantissent l'équidistance aux sommets.$$,
      'expected', $$Des médiatrices.$$
    ),
    jsonb_build_object(
      'question', $$ABC est un triangle rectangle en A. Quel est le diamètre du cercle circonscrit à ce triangle ?$$,
      'hint', $$C'est le côté opposé à l'angle droit.$$,
      'expected', $$L'hypoténuse [BC].$$
    ),
    jsonb_build_object(
      'question', $$Si AM = r pour un disque 𝒟(A,r), le point M appartient-il au disque ?$$,
      'hint', $$Le disque inclut le bord (le cercle).$$,
      'expected', $$Oui.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-cercles';
