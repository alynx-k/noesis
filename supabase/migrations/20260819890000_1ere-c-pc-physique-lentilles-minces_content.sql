-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2406: "LEÇON 3: LES LENTILLES MINCES"
-- (https://lyc.ecole-ci.org/course/view.php?id=2406), resource id 22218.
-- Contenu réécrit à partir du PDF source (lentilles convergentes/
-- divergentes, foyers, distance focale, vergence, formule de conjugaison,
-- grandissement, théorème des vergences). Tout le contenu est factuel
-- (optique géométrique) : définitions, formules et exercices numériques
-- sont repris/adaptés tels quels ; explications reformulées.
-- NB : la leçon 2 « TRAVAIL ET PUISSANCE D'UNE FORCE DANS LE CAS D'UN
-- MOUVEMENT DE ROTATION AUTOUR D'UN AXE FIXE » (Moodle course id=2407) a
-- été vérifiée et confirmée comme une coquille de cours vide (page de
-- cours de 474 lignes chargée correctement, mais 0 lien resource/mod
-- détecté) : cette leçon n'a donc pas été migrée.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-physique-lentilles-minces',
  '1ere',
  'C',
  'physique-chimie',
  $$Les lentilles minces$$,
  13,
  '1ere-c-pc-physique-travail-puissance-force-translation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le professeur de physique-chimie de 1ère C du Lycée Moderne de Bouaflé dit à ses élèves que les lunettes (verres correcteurs) sont des lentilles minces. Pour les aider à comprendre leur fonctionnement, il décide d'étudier avec eux les caractéristiques d'une lentille mince, de construire l'image d'un objet à travers une lentille mince, puis d'appliquer le théorème des vergences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et types de lentilles$$,
        'body', $$Une lentille est un milieu transparent limité par deux calottes sphériques, ou une calotte sphérique et un plan ; elle est dite mince si son épaisseur est négligeable devant les rayons de courbure de ses faces. Il existe deux types de lentilles minces : les lentilles convergentes, à bords minces (leur épaisseur est plus grande au centre que sur les bords) ; et les lentilles divergentes, à bords épais (leur épaisseur est plus grande sur les bords qu'au centre). Le centre optique O d'une lentille est le point où l'axe optique principal la traverse ; tout rayon incident passant par le centre optique n'est pas dévié.$$,
        'highlights', array[$$lentille convergente : bords minces, plus épaisse au centre$$, $$lentille divergente : bords épais, plus épaisse aux bords$$, $$un rayon passant par le centre optique n'est jamais dévié$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on une lentille convergente à sa forme ?$$, 'solution', $$Elle a des bords minces : son épaisseur est plus grande au centre que sur les bords.$$)
      ),
      jsonb_build_object(
        'heading', $$Les foyers principaux$$,
        'body', $$Pour une lentille convergente : tous les rayons incidents parallèles à l'axe optique convergent, après la lentille, en un point F' appelé foyer principal image ; il existe un point F tel que tout rayon incident passant par F émerge parallèlement à l'axe optique — c'est le foyer principal objet. Les foyers objet et image d'une lentille convergente sont réels, et les distances OF et OF' sont égales. Pour une lentille divergente, les rayons émergents parallèles à l'axe semblent provenir, par prolongement, d'un point F' (foyer principal image) ; les foyers d'une lentille divergente sont virtuels, mais on a toujours OF = OF'.$$,
        'highlights', array[$$lentille convergente : foyers F et F' réels, OF = OF'$$, $$lentille divergente : foyers F et F' virtuels$$, $$F' : tous les rayons parallèles à l'axe s'y rejoignent (ou semblent en provenir)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle propriété caractérise un rayon incident passant par le foyer principal objet F d'une lentille convergente ?$$, 'solution', $$Il émerge de la lentille parallèlement à l'axe optique.$$)
      ),
      jsonb_build_object(
        'heading', $$Distance focale et vergence$$,
        'body', $$La distance focale f d'une lentille est la distance entre le centre optique O et le foyer principal (f = OF = OF'). La vergence C d'une lentille est donnée par C = 1/OF' = 1/f, exprimée en dioptries (symbole δ). En orientant l'axe principal dans le sens de propagation de la lumière, OF' est positive pour une lentille convergente et négative pour une lentille divergente : la vergence d'une lentille convergente est donc positive, celle d'une lentille divergente est négative.$$,
        'highlights', array[$$C = 1/f, en dioptries (δ)$$, $$lentille convergente : C > 0 ; lentille divergente : C < 0$$]::text[],
        'example', jsonb_build_object('statement', $$Une lentille a une distance focale f = 0,25 m. Calcule sa vergence.$$, 'solution', $$C = 1/f = 1/0,25 = 4 δ (elle est convergente, car C > 0).$$),
        'fixation', jsonb_build_object('question', $$Le signe de la vergence permet-il de distinguer une lentille convergente d'une lentille divergente ?$$, 'solution', $$Oui : une vergence positive correspond à une lentille convergente, une vergence négative à une lentille divergente.$$)
      ),
      jsonb_build_object(
        'heading', $$Formation de l'image, grandissement et théorème des vergences$$,
        'body', $$Pour construire l'image d'un point objet, il suffit de tracer deux rayons particuliers issus de ce point (parallèle à l'axe, passant par le centre optique, ou passant par un foyer) et de repérer leur point d'intersection. Le grandissement γ = A'B'/AB = OA'/OA est sans unité : si γ > 0, l'image est droite ; si γ < 0, elle est renversée ; si |γ| > 1, l'image est plus grande que l'objet ; si |γ| < 1, elle est plus petite. La formule de conjugaison relie les positions de l'objet et de l'image : 1/OA' − 1/OA = 1/OF'. Enfin, deux lentilles minces de vergences C1 et C2 accolées se comportent comme une lentille unique de vergence C = C1 + C2 : c'est le théorème des vergences.$$,
        'highlights', array[$$grandissement : γ = A'B'/AB = OA'/OA$$, $$formule de conjugaison : 1/OA' − 1/OA = 1/OF'$$, $$théorème des vergences : lentilles accolées → C = C1 + C2$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie un grandissement négatif (γ < 0) pour l'image obtenue ?$$, 'solution', $$L'image est renversée par rapport à l'objet.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves doit réaliser des expériences à l'aide d'une lentille mince convergente. On met à sa disposition un objet réel AB, de 10 cm de hauteur, perpendiculaire à l'axe principal d'une lentille mince convergente de 20 cm de distance focale, et placé à 50 cm de la lentille.$$,
      'questions', array[
        $$Rappelle la formule de conjugaison et l'expression du grandissement.$$,
        $$Détermine la position de l'image A'B' en appliquant la formule de conjugaison.$$,
        $$Détermine la nature, le sens et la grandeur de l'image obtenue.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle propriété caractérise un rayon incident passant par le centre optique d'une lentille mince ?$$,
      'hint', $$C'est valable pour tout type de lentille.$$,
      'expected', $$Il traverse la lentille sans être dévié.$$
    ),
    jsonb_build_object(
      'question', $$Une lentille a pour vergence C = 5 δ. Calcule sa distance focale.$$,
      'hint', $$f = 1/C.$$,
      'expected', $$f = 1/C = 1/5 = 0,2 m (soit 20 cm).$$
    ),
    jsonb_build_object(
      'question', $$Écris la formule de conjugaison d'une lentille mince.$$,
      'hint', $$Elle relie OA, OA' et OF'.$$,
      'expected', $$1/OA' − 1/OA = 1/OF'.$$
    ),
    jsonb_build_object(
      'question', $$Deux lentilles minces de vergences C1 = 3 δ et C2 = -1 δ sont accolées. Quelle est la vergence de l'ensemble ?$$,
      'hint', $$Applique le théorème des vergences.$$,
      'expected', $$C = C1 + C2 = 3 + (-1) = 2 δ.$$
    )
  ),
  now()
);
