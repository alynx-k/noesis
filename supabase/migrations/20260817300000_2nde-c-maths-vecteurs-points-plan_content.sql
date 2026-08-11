-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3131: "MATH_2C L1: VECTEURS ET POINTS DU PLAN"
-- (https://lyc.ecole-ci.org/course/view.php?id=3131)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30847, redirecting
-- to pluginfile "Maths 2C_L1_VECTEURS ET POINTS DU PLAN.pdf" (22 pages).
-- Rewritten/paraphrased from the source PDF: notion de vecteur et
-- représentants, norme d'un vecteur, opérations vectorielles (somme,
-- multiplication par un réel, combinaison linéaire), colinéarité, vecteur
-- directeur et déterminant de deux vecteurs, bases et repères. 100% original
-- wording; no sentence copied from the source; numeric examples changed.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-vecteurs-points-plan',
  '2nde',
  'C',
  'mathematiques',
  $$Vecteurs et points du plan$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'un cours de mathématiques, le professeur forme des binômes d'élèves. Dans chaque binôme, l'un des deux dispose d'une figure sur laquelle sont tracés deux vecteurs, l'autre doit reproduire les mêmes points sur une figure vierge en suivant uniquement les indications orales de son camarade, sans jamais voir la figure de départ. Un binôme réussit l'exercice sans la moindre erreur alors qu'un autre place ses points au mauvais endroit. Le professeur en profite pour interroger la classe : qu'est-ce qui permet de transmettre aussi précisément la position d'un point à partir d'un autre ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Notion de vecteur et représentants$$,
        'body', $$Un vecteur est un objet géométrique caractérisé par trois éléments : une direction, un sens et une longueur. À partir de deux points A et B, on définit le vecteur AB : sa direction est celle de la droite (AB), son sens va de A vers B et sa longueur est la distance AB. Un même vecteur peut être « porté » par une infinité de couples de points : on dit que ces couples sont des représentants du vecteur dès lors qu'ils ont la même direction, le même sens et la même longueur. Ainsi, AB, MN et PQ peuvent tous représenter un seul et même vecteur u.$$,
        'highlights', array[$$vecteur$$, $$représentant$$, $$direction, sens, longueur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété fondamentale$$, 'text', $$Pour tout point O et tout vecteur u du plan vectoriel, il existe un unique point M tel que OM = u.$$),
        'fixation', jsonb_build_object('question', $$Que signifie dire que deux couples de points sont des représentants du même vecteur ?$$, 'solution', $$Cela signifie qu'ils ont la même direction, le même sens et la même longueur : ils représentent donc exactement le même vecteur.$$)
      ),
      jsonb_build_object(
        'heading', $$La norme d'un vecteur$$,
        'body', $$La norme d'un vecteur u = AB, notée ‖u‖, est la longueur du segment [AB], c'est-à-dire la distance AB. Elle vérifie plusieurs propriétés : elle est toujours positive ou nulle ; elle est nulle uniquement si le vecteur est le vecteur nul ; un vecteur et son opposé ont la même norme (‖u‖ = ‖−u‖) ; et pour deux vecteurs quelconques, la norme de leur somme ne dépasse jamais la somme de leurs normes (inégalité triangulaire). Lorsque le plan est muni d'une base orthonormée et que u a pour coordonnées (x ; y), on calcule sa norme grâce au théorème de Pythagore : ‖u‖ = √(x² + y²).$$,
        'highlights', array[$$norme$$, $$inégalité triangulaire$$, $$base orthonormée$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un repère orthonormé, un vecteur w a pour coordonnées (3 ; 4). Calcule sa norme.$$, 'solution', $$‖w‖ = √(3² + 4²) = √(9+16) = √25 = 5.$$),
        'table', jsonb_build_object(
          'headers', array[$$Propriété$$, $$Énoncé$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Positivité$$, $$‖u‖ ≥ 0 pour tout vecteur u$$),
            jsonb_build_array($$Cas nul$$, $$‖u‖ = 0 ⟺ u = 0$$),
            jsonb_build_array($$Symétrie$$, $$‖u‖ = ‖−u‖$$),
            jsonb_build_array($$Inégalité triangulaire$$, $$‖u+v‖ ≤ ‖u‖ + ‖v‖$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Un vecteur non nul peut-il avoir une norme négative ?$$, 'solution', $$Non, la norme d'un vecteur est toujours un nombre positif ou nul, jamais négatif.$$)
      ),
      jsonb_build_object(
        'heading', $$Opérations sur les vecteurs$$,
        'body', $$On additionne deux vecteurs grâce à la relation de Chasles : si AB = u et BC = v, alors u + v = AC. Multiplier un vecteur non nul u par un réel non nul k donne un nouveau vecteur k·u de même direction, de norme égale à |k| fois celle de u, et de même sens que u si k>0 ou de sens contraire si k<0. En combinant ces deux opérations, on définit la combinaison linéaire de deux vecteurs u et v : c'est tout vecteur de la forme λu + μv, où λ et μ sont des réels appelés coefficients.$$,
        'highlights', array[$$relation de Chasles$$, $$multiplication par un réel$$, $$combinaison linéaire$$]::text[],
        'example', jsonb_build_object('statement', $$Écris 2u − 5v comme combinaison linéaire de u et w, sachant que v = u + w.$$, 'solution', $$2u − 5(u+w) = 2u − 5u − 5w = −3u − 5w.$$),
        'fixation', jsonb_build_object('question', $$Si AB = u et BC = v, à quel vecteur est égal u + v ?$$, 'solution', $$D'après la relation de Chasles, u + v = AC.$$)
      ),
      jsonb_build_object(
        'heading', $$Vecteurs colinéaires, vecteur directeur et déterminant$$,
        'body', $$Deux vecteurs u et v sont colinéaires s'il existe un réel λ tel que v = λu (avec u non nul), ce qui revient à dire qu'il existe une combinaison linéaire nulle de ces deux vecteurs dont les coefficients ne sont pas tous nuls. On appelle vecteur directeur d'une droite (D) tout vecteur non nul ayant la même direction que (D) : deux vecteurs directeurs d'une même droite sont donc toujours colinéaires. Cette notion permet de démontrer qu'un point appartient à une droite ou que trois points sont alignés. Dans une base, si u(x;y) et v(x′;y′), on définit leur déterminant par det(u;v) = xy′ − x′y ; deux vecteurs sont colinéaires si et seulement si leur déterminant est nul, et un couple de vecteurs forme une base du plan si et seulement si leur déterminant est non nul.$$,
        'highlights', array[$$colinéarité$$, $$vecteur directeur$$, $$déterminant$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Notion$$, $$Condition$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Vecteurs colinéaires$$, $$det(u;v) = 0$$),
            jsonb_build_array($$Base du plan$$, $$det(u;v) ≠ 0$$),
            jsonb_build_array($$Points A, B, C alignés$$, $$AB et AC colinéaires$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans une base, u(2;1) et v(6;3). Ces vecteurs sont-ils colinéaires ?$$, 'solution', $$det(u;v) = 2×3 − 6×1 = 6−6 = 0, donc u et v sont colinéaires (on remarque d'ailleurs que v = 3u).$$),
        'fixation', jsonb_build_object('question', $$Comment démontrer que trois points A, B et C sont alignés à l'aide des vecteurs ?$$, 'solution', $$Il suffit de montrer que les vecteurs AB et AC sont colinéaires, par exemple en calculant leur déterminant et en vérifiant qu'il est nul.$$)
      ),
      jsonb_build_object(
        'heading', $$Bases, repères et coordonnées$$,
        'body', $$Un couple de vecteurs non colinéaires (i;j) constitue une base du plan vectoriel : tout vecteur u du plan s'écrit alors de façon unique sous la forme u = xi + yj, où (x ; y) sont les coordonnées de u dans cette base. En choisissant en plus un point origine O, le triplet (O;i;j) forme un repère du plan, et les coordonnées d'un point M dans ce repère sont celles du vecteur OM dans la base (i;j). Sur une droite graduée orientée par un vecteur unitaire i, la mesure algébrique AB d'un couple de points est le réel k tel que AB = k·i ; elle peut être positive, négative ou nulle selon la position relative de A et B.$$,
        'highlights', array[$$base$$, $$repère$$, $$mesure algébrique$$]::text[],
        'fixation', jsonb_build_object('question', $$Que représentent les coordonnées (x ; y) d'un vecteur u dans une base (i;j) ?$$, 'solution', $$Ce sont les coefficients de la décomposition u = xi + yj, uniques dès lors que (i;j) est bien une base.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le logo d'un club de mathématiques, ABCD est un carré et AIB, BVC sont des triangles équilatéraux construits à l'extérieur du carré. Un élève affirme que les points D, I et V sont alignés. Il propose de le vérifier en plaçant le repère au point A, en calculant les coordonnées de D, I et V, puis en étudiant la colinéarité de deux vecteurs bien choisis.$$,
      'questions', array[
        $$Rappelle la propriété fondamentale reliant un point O, un vecteur u et l'existence d'un point M.$$,
        $$Explique comment calculer la norme d'un vecteur donné par ses coordonnées dans une base orthonormée.$$,
        $$Donne la relation de Chasles et explique à quoi elle sert pour additionner deux vecteurs.$$,
        $$Explique comment le déterminant de deux vecteurs permet de démontrer que trois points sont alignés.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois éléments qui caractérisent un vecteur ?$$,
      'hint', $$Pense à ce qui distingue un simple segment d'un vecteur.$$,
      'expected', $$Sa direction, son sens et sa longueur (norme).$$
    ),
    jsonb_build_object(
      'question', $$Dans un repère orthonormé, un vecteur a pour coordonnées (6 ; 8). Calcule sa norme.$$,
      'hint', $$Utilise la formule √(x²+y²).$$,
      'expected', $$√(6²+8²) = √(36+64) = √100 = 10.$$
    ),
    jsonb_build_object(
      'question', $$À quelle condition deux vecteurs u(x;y) et v(x′;y′) sont-ils colinéaires ?$$,
      'hint', $$Calcule une expression avec les quatre coordonnées.$$,
      'expected', $$Si et seulement si leur déterminant est nul, c'est-à-dire xy′ − x′y = 0.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on un vecteur directeur d'une droite (D) ?$$,
      'hint', $$Il doit être non nul et respecter une certaine direction.$$,
      'expected', $$Tout vecteur non nul ayant la même direction que la droite (D).$$
    )
  ),
  now()
);
