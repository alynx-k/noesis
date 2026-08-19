-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2401: "LEÇON 1: TRAVAIL ET PUISSANCE D'UNE FORCE DANS
-- LE CAS D'UN MOUVEMENT DE TRANSLATION"
-- (https://lyc.ecole-ci.org/course/view.php?id=2401), resource id 22170.
-- Contenu réécrit à partir du PDF source (travail d'une force constante,
-- travail du poids, puissance moyenne et instantanée, travail de la
-- tension d'un ressort). Tout le contenu est factuel (mécanique) :
-- formules, démonstrations et exercices numériques sont repris/adaptés
-- tels quels ; explications reformulées. Cette leçon ouvre le thème
-- « Mécanique » du programme de Physique de 1ère C.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-physique-travail-puissance-force-translation',
  '1ere',
  'C',
  'physique-chimie',
  $$Travail et puissance d'une force (mouvement de translation)$$,
  12,
  '1ere-c-pc-chimie-corrosion-protection-metaux',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur le chemin de l'école, deux élèves de 1ère C du Lycée Moderne Leboutou aperçoivent un tracteur qui doit tirer un camion tombé dans un ravin. L'un s'interroge : « Ce tracteur est-il assez puissant pour effectuer ce travail ? ». L'autre réplique : « Cela dépend de la force que le tracteur peut appliquer au camion et de la hauteur de la chute ! ». Sous la conduite de leur professeur, ils décident de s'informer sur le travail et la puissance d'une force.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Travail d'une force constante au cours d'un déplacement rectiligne$$,
        'body', $$Le travail d'une force constante F au cours d'un déplacement rectiligne AB est égal au produit scalaire du vecteur force par le vecteur déplacement : W(F) = F.AB = F × AB × cos α, où α est l'angle entre la force et le déplacement. L'unité S.I. du travail est le joule (J). Le travail est une grandeur algébrique : si α < 90°, cos α > 0 et le travail est moteur (positif) ; si α = 90°, le travail est nul ; si 90° < α < 180°, cos α < 0 et le travail est résistant (négatif).$$,
        'highlights', array[$$W(F) = F.AB = F × AB × cos α, unité : le joule (J)$$, $$α < 90° : travail moteur ; α = 90° : travail nul ; α > 90° : travail résistant$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la nature du travail d'une force perpendiculaire au déplacement de son point d'application ?$$, 'solution', $$Il est nul, car cos 90° = 0.$$)
      ),
      jsonb_build_object(
        'heading', $$Travail du poids au cours d'un déplacement quelconque$$,
        'body', $$Pour un solide se déplaçant d'un point A (altitude zA) à un point B (altitude zB), avec un axe des cotes ascendant, le travail du poids vaut WAB(P) = mg(zA − zB), soit encore WAB(P) = mg·Δz. Ce résultat montre que le travail du poids d'un corps ne dépend pas du chemin suivi, mais uniquement des positions de départ et d'arrivée de son point d'application — que le trajet soit rectiligne, courbe, ou décomposé en plusieurs étapes.$$,
        'highlights', array[$$WAB(P) = mg(zA − zB) = mg·Δz$$, $$le travail du poids ne dépend pas du chemin suivi, seulement des positions de départ et d'arrivée$$]::text[],
        'example', jsonb_build_object('statement', $$Une grue soulève verticalement une charge sur une hauteur Δz = 30 m, avec une force F = 1000 N pendant Δt = 50 s. Calcule le travail de cette force.$$, 'solution', $$W(F) = F × Δz = 1000 × 30 = 30 000 J.$$),
        'fixation', jsonb_build_object('question', $$Le travail du poids dépend-il de la trajectoire suivie entre A et B ?$$, 'solution', $$Non, il ne dépend que des altitudes de départ (zA) et d'arrivée (zB), pas du chemin parcouru.$$)
      ),
      jsonb_build_object(
        'heading', $$Puissance d'une force constante$$,
        'body', $$Une force F qui effectue un travail W(F) pendant une durée Δt développe une puissance moyenne Pm = W(F) / Δt, exprimée en watts (W) lorsque le travail est en joules et la durée en secondes. Lorsque l'intervalle de temps considéré est très bref, on parle de puissance instantanée : P = F.v, où v est la vitesse instantanée du point d'application de la force.$$,
        'highlights', array[$$puissance moyenne : Pm = W(F) / Δt (en watts)$$, $$puissance instantanée : P = F.v$$]::text[],
        'example', jsonb_build_object('statement', $$Reprends l'exemple de la grue (W = 30 000 J en Δt = 50 s) : calcule la puissance moyenne développée.$$, 'solution', $$Pmoy = W / Δt = 30 000 / 50 = 600 W.$$),
        'fixation', jsonb_build_object('question', $$Quelle est l'unité S.I. de la puissance, et à quoi correspond-elle en unités de base ?$$, 'solution', $$Le watt (W), qui correspond à un joule par seconde.$$)
      ),
      jsonb_build_object(
        'heading', $$Travail de la tension d'un ressort$$,
        'body', $$Lorsqu'un ressort de raideur k, initialement au repos, est étiré, la force de tension T qu'il exerce est proportionnelle à son allongement x : T = k·x. Contrairement à une force constante, cette force varie au cours du déplacement ; en sommant les travaux élémentaires sur tout le trajet (aire d'un triangle dans le diagramme force-allongement), on obtient le travail de la tension : W(T) = −½k·x². Plus généralement, si l'allongement passe progressivement de x1 à x2, le travail de la tension est : W(T) = −½k(x2² − x1²).$$,
        'highlights', array[$$T = k.x (loi de Hooke pour la tension du ressort)$$, $$W(T) = −½k(x2² − x1²)$$]::text[],
        'example', jsonb_build_object('statement', $$Un ressort de raideur k = 25 N/m, initialement au repos, est allongé de 8 cm. Calcule le travail de sa tension.$$, 'solution', $$W(T) = −½ × 25 × (0,08² − 0) = −8×10⁻² J.$$),
        'fixation', jsonb_build_object('question', $$Le travail de la tension d'un ressort qu'on étire est-il moteur ou résistant ? Pourquoi ?$$, 'solution', $$Il est résistant (négatif), car la tension du ressort s'oppose à l'étirement provoqué par l'opérateur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur un chantier de construction, une caisse de masse m = 60 kg, supposée ponctuelle, est posée sur un plan incliné d'un angle α = 20° par rapport à l'horizontale. Un ouvrier la tire sur une distance ℓ = AB = 11,5 m à l'aide d'une corde. Au cours de son déplacement, la caisse est soumise à la tension T de la corde (T = 500 N), à son poids P, et à la réaction du plan R = RN + RT, avec RT = f = 50 N (force de frottement). On prendra g = 10 N/kg.$$,
      'questions', array[
        $$Représente sur un schéma les forces qui s'exercent sur la caisse.$$,
        $$Indique la nature du travail de chaque force (moteur ou résistant), en justifiant.$$,
        $$Détermine le travail du poids, le travail de la tension de la corde, et le travail de la force de frottement.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris la formule générale du travail d'une force constante F au cours d'un déplacement rectiligne AB.$$,
      'hint', $$C'est un produit scalaire.$$,
      'expected', $$W(F) = F.AB = F × AB × cos α.$$
    ),
    jsonb_build_object(
      'question', $$Un solide descend d'une altitude zA = 10 m à une altitude zB = 4 m (m = 2 kg, g = 10 N/kg). Calcule le travail du poids.$$,
      'hint', $$Utilise W = mg(zA − zB).$$,
      'expected', $$W(P) = mg(zA − zB) = 2 × 10 × (10 − 4) = 120 J.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule de la puissance moyenne développée par une force ?$$,
      'hint', $$Elle relie travail et durée.$$,
      'expected', $$Pm = W(F) / Δt.$$
    ),
    jsonb_build_object(
      'question', $$Un ressort de raideur k = 40 N/m voit son allongement passer de x1 = 2 cm à x2 = 5 cm. Calcule le travail de sa tension.$$,
      'hint', $$W(T) = −½k(x2² − x1²).$$,
      'expected', $$W(T) = −½ × 40 × (0,05² − 0,02²) = −0,021 J.$$
    )
  ),
  now()
);
