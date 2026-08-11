-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3133: "MATH_2C L3: UTILISATION DES SYMETRIES ET TRANSLATIONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=3133)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30871, redirecting
-- to pluginfile "Maths 2C_L3_UTILISATION DES SYMETRIES TRANSLATIONS
-- (consolidé).pdf" (17 pages; filename says "consolidé" but the content
-- covers a single lesson: no separate lesson was merged in).
-- Rewritten/paraphrased from the source PDF: applications du plan (image,
-- antécédent, point invariant), translation (propriété caractéristique
-- MN=M'N' vue comme un cas particulier), symétrie centrale et symétrie
-- orthogonale, tableau récapitulatif des propriétés conservées (alignement,
-- longueur, milieu, droites), et démarche de construction/démonstration en
-- utilisant ces transformations (parallélogramme, droites concourantes,
-- tracé d'une route). 100% original wording; no sentence copied from the
-- source; figures and numeric values changed.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-symetries-translations',
  '2nde',
  'C',
  'mathematiques',
  $$Utilisation des symétries et translations$$,
  3,
  '2nde-c-maths-ensemble-nombres-reels',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un artisan tisserand ivoirien montre à ses apprentis deux motifs qu'il vient de réaliser sur des pagnes : le premier motif se répète par glissement régulier le long du tissu, tandis que le second semble se refléter autour d'un point central pour former une étoile parfaitement équilibrée. Un apprenti demande comment le tisserand parvient à reproduire ces motifs avec une telle précision, sans jamais mesurer deux fois la même distance. Le tisserand répond qu'il applique, sans le savoir formellement, des transformations du plan bien connues en mathématiques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Applications du plan : vocabulaire de base$$,
        'body', $$On appelle application du plan toute correspondance f qui, à chaque point M du plan, associe un unique point M'. On dit que M' est l'image de M par f, et que M est un antécédent de M' par f. Lorsque M' = M, on dit que le point M est invariant par f. La symétrie par rapport à un point, la symétrie par rapport à une droite et la translation sont trois exemples classiques d'applications du plan, déjà rencontrées dans les classes antérieures et que l'on va maintenant réutiliser pour construire des figures et démontrer des propriétés.$$,
        'highlights', array[$$application du plan$$, $$image, antécédent$$, $$point invariant$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une application du plan associe à chaque point M un unique point M', appelé image de M. M est un antécédent de M'. Si M' = M, le point M est dit invariant par cette application.$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire qu'un point M est invariant par une application f ?$$, 'solution', $$Cela signifie que l'image de M par f est M lui-même, c'est-à-dire que f(M) = M.$$)
      ),
      jsonb_build_object(
        'heading', $$La translation et sa propriété caractéristique$$,
        'body', $$Une application f du plan est une translation si et seulement si, pour tous points distincts M et N d'images respectives M' et N', on a l'égalité vectorielle M'N' = MN : autrement dit, la translation déplace tous les points du plan dans une même direction, un même sens et sur une même distance, sans jamais déformer les figures. Les points invariants d'une translation de vecteur non nul sont... inexistants, puisque tout point est bel et bien déplacé (seule la translation de vecteur nul laisse tous les points invariants).$$,
        'highlights', array[$$translation$$, $$propriété caractéristique$$]::text[],
        'example', jsonb_build_object('statement', $$ABC est un triangle quelconque et D est l'image de B par la translation de vecteur AC. Justifie que DC = BA.$$, 'solution', $$C est l'image de A par cette translation (car AC est justement le vecteur de la translation), et D est l'image de B. D'après la propriété caractéristique de la translation, DC = BA.$$),
        'fixation', jsonb_build_object('question', $$Quelle égalité vectorielle caractérise une translation qui envoie M sur M' et N sur N' ?$$, 'solution', $$M'N' = MN.$$)
      ),
      jsonb_build_object(
        'heading', $$Symétrie centrale et symétrie orthogonale$$,
        'body', $$La symétrie de centre I associe à tout point M le point M' tel que I soit le milieu du segment [MM'] ; son seul point invariant est le centre I lui-même. La symétrie orthogonale d'axe (D) associe à tout point M le point M' tel que (D) soit la médiatrice du segment [MM'] (lorsque M n'appartient pas à (D)) ; ses points invariants sont exactement tous les points de la droite (D), qui est ainsi dite invariante point par point.$$,
        'highlights', array[$$symétrie de centre I$$, $$symétrie orthogonale d'axe (D)$$]::text[],
        'example', jsonb_build_object('statement', $$Quels sont les points invariants d'une symétrie orthogonale d'axe (D) ?$$, 'solution', $$Ce sont tous les points situés sur la droite (D) elle-même : chacun est sa propre image.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'unique point invariant d'une symétrie de centre I ?$$, 'solution', $$C'est le centre I lui-même.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés conservées par ces transformations$$,
        'body', $$Ces trois transformations partagent des propriétés communes très utiles pour construire des figures : elles envoient des points alignés sur des points alignés, transforment un segment en un segment de même longueur, envoient le milieu d'un segment sur le milieu de son image, et transforment toute droite en une droite. Elles se distinguent cependant sur d'autres points : une translation transforme une droite (D) en une droite (D') qui lui est parallèle, alors qu'une symétrie orthogonale d'axe (D) laisse invariante toute droite perpendiculaire à (D), et qu'une symétrie de centre I laisse invariante toute droite passant par I.$$,
        'highlights', array[$$conservation des longueurs$$, $$conservation de l'alignement$$, $$droites invariantes$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Transformation$$, $$Droite invariante particulière$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Symétrie orthogonale d'axe (D)$$, $$Toute droite perpendiculaire à (D)$$),
            jsonb_build_array($$Symétrie de centre I$$, $$Toute droite passant par I$$),
            jsonb_build_array($$Translation de vecteur AB$$, $$Toute droite de vecteur directeur AB$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Une translation peut-elle laisser une droite invariante point par point ?$$, 'solution', $$Non (sauf pour la translation de vecteur nul) : une translation de vecteur non nul déplace toujours les points, même si certaines droites restent globalement invariantes (celles de même direction que le vecteur).$$)
      ),
      jsonb_build_object(
        'heading', $$Utiliser ces transformations pour construire ou démontrer$$,
        'body', $$Pour résoudre un problème de construction géométrique, on procède en deux grandes étapes : d'abord la recherche d'une démarche, qui consiste à esquisser la figure recherchée, à l'analyser pour repérer une transformation utile (translation, symétrie), puis à en déduire une méthode ; ensuite la réalisation, qui consiste à rédiger un programme de construction, à réaliser effectivement la figure, puis à justifier que la construction respecte bien les contraintes de l'énoncé. Cette même démarche sert aussi à démontrer qu'un point appartient à une droite, que des droites sont parallèles ou concourantes, en s'appuyant sur les propriétés conservées par ces transformations.$$,
        'highlights', array[$$démarche de construction$$, $$programme de construction$$]::text[],
        'example', jsonb_build_object('statement', $$BCDE est un rectangle. En utilisant la translation de vecteur CD, comment démontrer que les trois hauteurs (AH), (BH) et (CH) d'un triangle ABC sont concourantes ?$$, 'solution', $$On montre que les images des trois hauteurs par cette translation sont trois droites parallèles aux côtés du triangle passant par un même point : comme les hauteurs se recoupent en un seul point (l'orthocentre), leurs images se recoupent aussi en un seul point, ce qui confirme qu'elles étaient bien concourantes au départ.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux grandes étapes d'une démarche de construction géométrique ?$$, 'solution', $$La recherche d'une démarche (esquisse, analyse, choix d'une méthode) puis la réalisation de la construction (programme de construction, tracé, justification).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un géomètre doit tracer une troisième voie sur le plan d'un lotissement, sachant que deux routes (D) et (D') existent déjà et se rejoignent en un point O situé hors du plan disponible (impossible à atteindre sur le terrain). Un point A, repérant l'îlot 326, est donné sur le plan. Le géomètre veut tracer, sans jamais placer le point O, la droite qui passe par A et qui aurait la même direction que la droite (OA) si O était accessible.$$,
      'questions', array[
        $$Explique pourquoi une symétrie de centre bien choisi permet de transformer les droites (D) et (D') en deux nouvelles droites dont l'intersection est un point accessible sur le plan.$$,
        $$Décris comment obtenir, à partir de ce nouveau point d'intersection, une droite parallèle à la direction recherchée passant par A.$$,
        $$Pourquoi cette construction évite-t-elle d'avoir à placer le point O, inaccessible sur le plan ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'appelle-t-on l'image d'un point M par une application f du plan ?$$,
      'hint', $$C'est le point que f associe à M.$$,
      'expected', $$C'est l'unique point M' que l'application f associe à M.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les points invariants d'une symétrie de centre I ?$$,
      'hint', $$Il n'y en a qu'un seul.$$,
      'expected', $$Le seul point invariant est le centre I lui-même.$$
    ),
    jsonb_build_object(
      'question', $$Une translation de vecteur AB transforme une droite (D) en une droite (D'). Que peut-on dire de (D) et (D') ?$$,
      'hint', $$Pense à la conservation des directions par une translation.$$,
      'expected', $$Les droites (D) et (D') sont parallèles (ou confondues si (D) a pour vecteur directeur AB).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux propriétés conservées à la fois par la translation, la symétrie centrale et la symétrie orthogonale.$$,
      'hint', $$Pense à l'alignement, aux longueurs, aux milieux, aux droites.$$,
      'expected', $$Par exemple : la conservation de l'alignement des points et la conservation des longueurs (un segment a pour image un segment de même longueur).$$
    )
  ),
  now()
);
