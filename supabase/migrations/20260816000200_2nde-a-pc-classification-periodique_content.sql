-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3285: "LEÇON 3: CLASSIFICATION PÉRIODIQUE DES ÉLÉMENTS
-- CHIMIQUES" (https://lyc.ecole-ci.org/course/view.php?id=3285)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32659, redirecting
-- to pluginfile "2nd AC - C3 Classification Périodique des éléments
-- chimiques.pdf" (shared A/C document, "2nde A-C" header, 9 pages).
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 3): the
-- simplified periodic table (4 periods x 8 groups, Z from 1 to 20), the
-- construction rules (classification by increasing Z, a row = filling of one
-- electronic shell, a column = same number of valence electrons = a
-- chemical family), and four chemical families (alkali metals, alkaline
-- earth metals, halogens, noble gases) with their valence-electron count and
-- typical reactivity. Note: the source PDF contains an evident numbering
-- slip for helium/neon (it lists "Hélium Z=10" and "Néon Z=40"); this has
-- been corrected here to the standard values (He: Z=2, K²; Ne: Z=10, K²L⁸)
-- since the task requires equivalent technical accuracy, not verbatim
-- reproduction of the source. 100% original wording; no sentence copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-classification-periodique',
  '2nde',
  'A',
  'physique-chimie',
  $$La classification périodique des éléments chimiques$$,
  3,
  '2nde-a-pc-structure-atome',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En feuilletant son manuel, un élève de seconde découvre un grand tableau qui range tous les éléments chimiques connus, et qui permettrait même, dit le manuel, de prévoir à l'avance le comportement chimique d'un élément avant même de l'avoir expérimenté. Curieux, il partage sa découverte avec ses camarades : comment ce tableau est-il construit, que signifient ses lignes et ses colonnes, et comment repérer les familles d'éléments qui se ressemblent ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Présentation du tableau de classification$$,
        'body', $$Le tableau de classification périodique des éléments chimiques est un tableau à double entrée : une entrée horizontale, appelée période ou ligne, et une entrée verticale, appelée groupe ou colonne. Le tableau complet compte 7 lignes et 18 colonnes, mais le programme de seconde se limite à une version simplifiée de 4 périodes et 8 groupes, qui couvre les éléments de numéro atomique Z = 1 (hydrogène) à Z = 20 (calcium). Dans chaque case du tableau figurent le symbole de l'élément, son numéro atomique, son nom et sa masse molaire.$$,
        'highlights', array[$$période (ligne)$$, $$groupe (colonne)$$, $$tableau simplifié$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on une entrée verticale et une entrée horizontale du tableau de classification périodique ?$$, 'solution', $$Une entrée verticale est un groupe (ou colonne), une entrée horizontale est une période (ou ligne).$$)
      ),
      jsonb_build_object(
        'heading', $$Les règles de construction du tableau$$,
        'body', $$Le tableau obéit à trois règles principales. D'abord, les éléments y sont rangés par numéro atomique Z croissant : à chaque valeur de Z correspond une case unique. Ensuite, chaque ligne (période) correspond au remplissage d'une même couche électronique : la première période remplit la couche K (hydrogène, hélium), la deuxième remplit la couche L (du lithium Z=3 au néon Z=10), la troisième remplit la couche M (du sodium Z=11 à l'argon Z=18) -- le numéro de la ligne indique donc directement le nombre de couches électroniques occupées par l'atome. Enfin, chaque colonne (groupe) rassemble des éléments dont les atomes ont le même nombre d'électrons sur leur couche externe (couche de valence) : ces éléments constituent une famille chimique aux propriétés voisines. On notera que tous les isotopes d'un même élément occupent une seule et même case, et qu'à partir de la 4e période des anomalies de remplissage apparaissent : par exemple, chez le potassium (Z=19, K²L⁸M⁸N¹), le remplissage de la couche N commence alors que la couche M, qui pourrait encore accueillir des électrons, est laissée à 8.$$,
        'highlights', array[$$Z croissant$$, $$ligne = couche électronique$$, $$colonne = famille chimique$$]::text[],
        'example', jsonb_build_object('statement', $$Situe l'atome de soufre S (Z=16, formule K²L⁸M⁶) dans le tableau simplifié.$$, 'solution', $$Sa couche de valence est M (n=3), donc le soufre appartient à la 3e ligne ; cette couche de valence compte 6 électrons, donc le soufre appartient à la 6e colonne.$$),
        'fixation', jsonb_build_object('question', $$Un atome a pour formule électronique K²L⁸M⁷. Dans quelle ligne et quelle colonne du tableau se trouve-t-il ?$$, 'solution', $$Sa couche de valence M correspond à n=3 donc à la 3e ligne, et elle compte 7 électrons donc il appartient à la 7e colonne (c'est le chlore, Z=17).$$)
      ),
      jsonb_build_object(
        'heading', $$Quatre grandes familles chimiques$$,
        'body', $$Les familles correspondent aux colonnes du tableau ; à l'intérieur d'une même famille, les éléments partagent le même nombre d'électrons de valence, d'où des propriétés chimiques analogues. La famille des métaux alcalins regroupe les éléments de la première colonne, à l'exception de l'hydrogène (lithium, sodium, potassium...) : ils n'ont qu'un seul électron externe, sont des métaux mous et peu denses, s'oxydent facilement à l'air et réagissent violemment avec l'eau en formant une base forte et du dihydrogène. La famille des métaux alcalino-terreux regroupe les éléments de la deuxième colonne (béryllium, magnésium, calcium...) : ils ont deux électrons externes, sont très réactifs, et s'oxydent en donnant des oxydes réfractaires (résistant aux hautes températures). La famille des halogènes regroupe les éléments de l'avant-dernière colonne, la 7e (fluor, chlore, brome, iode) : ils ont sept électrons externes, existent à l'état de corps simples diatomiques (F2, Cl2...), possèdent un fort caractère oxydant et réagissent facilement avec les métaux et l'hydrogène pour former des halogénures, comme le chlorure de sodium NaCl. Enfin, la famille des gaz rares (ou gaz nobles) regroupe les éléments de la dernière colonne, la 8e (hélium, néon, argon...) : ils ont huit électrons externes -- sauf l'hélium qui n'en a que deux -- existent sous forme de corps simples monoatomiques gazeux, et sont caractérisés par une quasi-absence de réactivité chimique, appelée inertie chimique.$$,
        'highlights', array[$$alcalins$$, $$alcalino-terreux$$, $$halogènes$$, $$gaz rares$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Famille$$, $$Colonne$$, $$Électrons de valence$$, $$Exemples$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Métaux alcalins$$, $$1re (sauf H)$$, $$1$$, $$Lithium, sodium, potassium$$),
            jsonb_build_array($$Métaux alcalino-terreux$$, $$2e$$, $$2$$, $$Béryllium, magnésium, calcium$$),
            jsonb_build_array($$Halogènes$$, $$7e$$, $$7$$, $$Fluor, chlore, brome, iode$$),
            jsonb_build_array($$Gaz rares (nobles)$$, $$8e (dernière)$$, $$8 (2 pour l'hélium)$$, $$Hélium, néon, argon$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi les gaz rares sont-ils qualifiés de chimiquement inertes ?$$, 'solution', $$Parce que leur couche externe est déjà saturée (8 électrons, sauf l'hélium avec 2), ce qui les rend très peu réactifs chimiquement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur donne trois éléments à situer et à classer : le potassium K (Z=19), le fluor F (Z=9) et le magnésium Mg (Z=12). Les élèves doivent utiliser le tableau de classification périodique simplifié pour répondre.$$,
      'questions', array[
        $$Donne la formule électronique de chacun de ces trois éléments.$$,
        $$Indique la ligne et la colonne du tableau simplifié correspondant à chacun d'eux.$$,
        $$Identifie la famille chimique à laquelle appartient chacun de ces trois éléments.$$,
        $$Cite deux propriétés chimiques caractéristiques de la famille des halogènes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on une colonne du tableau de classification périodique ?$$,
      'hint', $$C'est aussi le nom donné à un ensemble d'éléments aux propriétés voisines.$$,
      'expected', $$Un groupe, ou une famille chimique.$$
    ),
    jsonb_build_object(
      'question', $$À quelle famille chimique appartient un élément de la première colonne, autre que l'hydrogène ?$$,
      'hint', $$Cette famille regroupe le lithium, le sodium, le potassium...$$,
      'expected', $$La famille des métaux alcalins.$$
    ),
    jsonb_build_object(
      'question', $$Combien d'électrons de valence possède un élément de la famille des halogènes ?$$,
      'hint', $$Les halogènes occupent la 7e colonne.$$,
      'expected', $$Sept électrons de valence.$$
    ),
    jsonb_build_object(
      'question', $$Un atome a pour formule électronique K²L⁸M². Dans quelle ligne et quelle colonne se situe-t-il ?$$,
      'hint', $$La couche de valence est M ; compte ses électrons.$$,
      'expected', $$3e ligne (couche M) et 2e colonne (2 électrons de valence) : c'est le magnésium.$$
    )
  ),
  now()
);
