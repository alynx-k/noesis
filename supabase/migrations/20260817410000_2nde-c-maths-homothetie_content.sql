-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Mathématiques, categoryid=110.
-- Moodle course id 3142: "MATH_L12: HOMOTHETIE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3142)
-- Resource "Je lis le résumé de la leçon", mod_resource id 30979, redirecting
-- to pluginfile "Maths 2C_L12_Homothétie.pdf" (14 pages).
-- Rewritten/paraphrased from the source PDF: définition et notation de
-- l'homothétie, cas particuliers (k=1, k=−1), propriété fondamentale
-- (M'N'=kMN), alignement du centre avec un point et son image, images de
-- figures simples (droite, demi-droite, segment, cercle), propriétés
-- générales conservées (alignement, milieu, parallélisme,
-- perpendicularité, angle orienté), et caractérisation d'une homothétie par
-- deux points distincts et leurs images. La situation complexe d'évaluation
-- (reproduction agrandie/réduite d'une figure en étoile sur une feuille
-- carrée) est reformulée avec d'autres valeurs numériques. 100% original
-- wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-maths-homothetie',
  '2nde',
  'C',
  'mathematiques',
  $$Homothétie$$,
  12,
  '2nde-c-maths-equations-inequations-reels',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant un cours d'arts plastiques, un professeur demande à ses élèves d'une classe de seconde C d'agrandir une image en respectant scrupuleusement les proportions, c'est-à-dire sans déformer aucune partie du dessin. Ne sachant pas comment procéder avec précision, les élèves sollicitent leurs aînés de première C, qui leur conseillent de faire des recherches sur les homothéties.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et cas particuliers$$,
        'body', $$Soit Ω un point du plan et k un nombre réel non nul. On appelle homothétie de centre Ω et de rapport k l'application du plan dans lui-même qui, à tout point M du plan, associe le point M' tel que ΩM' = kΩM. On la note h(Ω,k). Deux cas particuliers méritent d'être retenus : lorsque k=1, l'homothétie est l'application identique du plan (chaque point est sa propre image) ; lorsque k=−1, l'homothétie coïncide exactement avec la symétrie de centre Ω.$$,
        'highlights', array[$$homothétie$$, $$centre, rapport$$, $$cas particuliers k=1 et k=−1$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$h(Ω,k)(M) = M' ⟺ ΩM' = kΩM. Si k=1, h est l'identité. Si k=−1, h est la symétrie de centre Ω.$$),
        'example', jsonb_build_object('statement', $$Sur une droite graduée, F, A, B, C sont alignés avec FB=4FA. Que peut-on dire de l'homothétie de centre F et de rapport 4 appliquée à A ?$$, 'solution', $$Comme FB = 4FA, l'homothétie de centre F et de rapport 4 transforme A en B : h(F;4)(A) = B.$$),
        'fixation', jsonb_build_object('question', $$À quelle transformation classique correspond l'homothétie de rapport −1 ?$$, 'solution', $$Elle correspond exactement à la symétrie de centre Ω (le centre de l'homothétie).$$)
      ),
      jsonb_build_object(
        'heading', $$Propriété fondamentale et alignement$$,
        'body', $$Si M et N sont deux points distincts d'images respectives M' et N' par une homothétie de rapport k, alors M'N' = kMN (relation vectorielle) et donc M'N' = |k|×MN pour les longueurs. Par ailleurs, comme le centre Ω vérifie ΩA' = kΩA pour tout point A d'image A', le centre Ω est toujours aligné avec un point et son image : cette propriété permet, à partir de deux couples de points et de leurs images, de retrouver le centre d'une homothétie comme intersection de deux droites.$$,
        'highlights', array[$$M'N'=kMN$$, $$centre aligné avec un point et son image$$]::text[],
        'example', jsonb_build_object('statement', $$Une homothétie h de rapport k transforme A en A' et B en B'. Comment retrouver son centre O à partir de la figure ?$$, 'solution', $$Le centre O appartient à la fois à la droite (AA') et à la droite (BB'), car il est aligné avec chaque point et son image. O est donc le point d'intersection de (AA') et (BB').$$),
        'fixation', jsonb_build_object('question', $$Si M et N ont pour images M' et N' par une homothétie de rapport k=3 et que MN=5, quelle est la longueur M'N' ?$$, 'solution', $$M'N' = |k|×MN = 3×5 = 15.$$)
      ),
      jsonb_build_object(
        'heading', $$Images de figures simples$$,
        'body', $$Par une homothétie de rapport k, l'image d'une droite (D) est une droite parallèle à (D) (ou (D) elle-même si le centre Ω appartient à (D), auquel cas on dit que (D) est globalement invariante). L'image d'une demi-droite est une demi-droite. L'image d'un segment [AB] est un segment [A'B'] avec A'B' = |k|×AB. Enfin, l'image d'un cercle de centre O et de rayon r est le cercle de centre h(O) (l'image du centre) et de rayon |k|×r.$$,
        'highlights', array[$$image d'une droite$$, $$image d'un segment$$, $$image d'un cercle$$]::text[],
        'example', jsonb_build_object('statement', $$Une homothétie de rapport −2 transforme A en A', B en B' et C en C', avec AC=5 et BC=7. Calcule A'C' et B'C'.$$, 'solution', $$A'C' = |−2|×AC = 2×5 = 10 et B'C' = |−2|×BC = 2×7 = 14.$$),
        'fixation', jsonb_build_object('question', $$Quel est le rayon de l'image d'un cercle de rayon 4 par une homothétie de rapport −5/4 ?$$, 'solution', $$Le rayon de l'image est |−5/4|×4 = 5.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés générales conservées par une homothétie$$,
        'body', $$Par une homothétie, des points alignés ont pour images des points alignés ; le milieu d'un segment a pour image le milieu de l'image de ce segment ; deux droites parallèles ont pour images deux droites parallèles ; deux droites perpendiculaires ont pour images deux droites perpendiculaires ; et un angle orienté a pour image un angle orienté de même mesure. En revanche, contrairement aux symétries et aux translations, une homothétie de rapport k différent de 1 ou −1 ne conserve pas les longueurs : elle les multiplie par |k|.$$,
        'highlights', array[$$conservation de l'alignement$$, $$conservation des angles orientés$$, $$longueurs multipliées par |k|$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD est un parallélogramme de centre O tel que AB = 2AD. E est le symétrique de A par rapport à D, et F celui de A par rapport à B. On considère l'homothétie h de centre A et de rapport 2. Que peut-on dire des images de D et de B par h ?$$, 'solution', $$h(A;2)(D) = E (car AE=2AD) et h(A;2)(B) = F (car AF=2AB). Comme D, B et O sont alignés (diagonale du parallélogramme) et que l'homothétie conserve l'alignement, les images E, F et h(O) sont aussi alignées.$$),
        'fixation', jsonb_build_object('question', $$Une homothétie conserve-t-elle toujours les longueurs des segments ?$$, 'solution', $$Non, sauf si son rapport vaut 1 ou −1 ; en général elle multiplie chaque longueur par la valeur absolue du rapport |k|.$$)
      ),
      jsonb_build_object(
        'heading', $$Homothétie caractérisée par deux points et leurs images$$,
        'body', $$Soient M, N, M' et N' quatre points deux à deux distincts, tels que la droite (M'N') soit parallèle à (MN) et que M'N' soit différent (comme vecteur) de MN. Il existe alors une unique homothétie qui transforme M en M' et N en N'. Cette propriété est très utile pour justifier l'existence d'une homothétie reliant deux figures semblables et parallèles, et pour en déterminer le centre et le rapport à partir de deux couples de points correspondants.$$,
        'highlights', array[$$homothétie caractérisée par deux points$$, $$existence et unicité$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD et A'B'C'D' sont deux carrés tels qu'une homothétie h transforme A en A', B en B', C en C' et D en D'. Comment déterminer le centre de h ?$$, 'solution', $$Le centre appartient à la fois à (AA') et à (BB') (ou à toute autre droite reliant un point à son image), donc c'est le point d'intersection de (AA') et de (BB').$$),
        'fixation', jsonb_build_object('question', $$Quelle condition sur (MN) et (M'N') garantit l'existence d'une unique homothétie transformant M en M' et N en N' ?$$, 'solution', $$Il faut que (M'N') soit parallèle à (MN), avec M'N' différent de MN en tant que vecteurs.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sékou a dessiné une figure en forme d'étoile à six branches, obtenue en superposant deux triangles équilatéraux inscrits dans un même cercle. Impressionné par cette figure, il désire la reproduire, mais il ne dispose que d'une feuille de forme carrée de côté 4 cm. Sa feuille n'étant pas très grande, il souhaite obtenir la plus grande reproduction possible de son étoile sur cette feuille carrée. Il te sollicite pour l'aider, en utilisant les notions d'homothétie étudiées en classe.$$,
      'questions', array[
        $$Explique comment déterminer la longueur du plus grand segment de la figure en étoile de Sékou (par exemple une diagonale reliant deux sommets opposés).$$,
        $$Sachant que la feuille carrée a un côté de 4 cm, explique comment déterminer le rapport de l'homothétie à appliquer pour que la reproduction tienne le plus grand possible sur la feuille.$$,
        $$Décris les étapes de construction de la reproduction agrandie ou réduite de la figure sur la feuille, à l'aide de l'homothétie de rapport que tu as déterminé.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Une homothétie a pour rapport k=1. Que peut-on dire de l'image de n'importe quel point M ?$$,
      'hint', $$Rappelle le cas particulier k=1.$$,
      'expected', $$L'image de M est M lui-même : l'homothétie de rapport 1 est l'application identique du plan.$$
    ),
    jsonb_build_object(
      'question', $$Une homothétie de rapport k=−3 transforme un segment [AB] de longueur 4 cm en un segment [A'B']. Quelle est la longueur de [A'B'] ?$$,
      'hint', $$A'B' = |k|×AB.$$,
      'expected', $$A'B' = |−3|×4 = 12 cm.$$
    ),
    jsonb_build_object(
      'question', $$Le centre d'une homothétie est-il toujours aligné avec un point et son image ? Justifie.$$,
      'hint', $$Repense à la définition vectorielle ΩM' = kΩM.$$,
      'expected', $$Oui, car ΩM' = kΩM signifie que les vecteurs ΩM' et ΩM sont colinéaires, donc Ω, M et M' sont alignés.$$
    ),
    jsonb_build_object(
      'question', $$Une homothétie de centre O et de rapport 2 transforme un cercle de rayon 3 cm en un autre cercle. Quel est le rayon de ce nouveau cercle ?$$,
      'hint', $$Le rayon de l'image est |k| fois le rayon initial.$$,
      'expected', $$Le rayon de l'image est |2|×3 = 6 cm.$$
    )
  ),
  now()
);
