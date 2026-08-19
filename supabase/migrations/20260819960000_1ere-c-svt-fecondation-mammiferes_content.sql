-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 936: "SVT 1ère C_L5_La fécondation chez les
-- mammifères" (https://lyc.ecole-ci.org/course/view.php?id=936), resource
-- id 4881. Contenu réécrit à partir du PDF source (migration et rencontre
-- des gamètes, pénétration du spermatozoïde, formation et fusion des
-- pronucléi, importance de la fécondation, lien avec la transmission du
-- VIH). Tout le contenu est factuel (biologie de la reproduction) :
-- étapes, schémas légendés et exercices sont repris/adaptés tels quels ;
-- explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-fecondation-mammiferes',
  '1ere',
  'C',
  'svt',
  $$La fécondation chez les mammifères$$,
  4,
  '1ere-c-svt-gametogenese-mammiferes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre d'un exposé sur la fécondation chez les mammifères, des élèves de 1ère C découvrent dans des manuels le processus par lequel l'ovule est fécondé par un spermatozoïde dans la voie génitale femelle, puis aboutit à la formation d'un nouvel individu qui, parfois, peut être séropositif. Intéressés, ils entreprennent d'identifier et de décrire les étapes de la fécondation, de déterminer son importance, et d'établir la relation qui existe entre la fécondation et la transmission du VIH.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La migration et la rencontre des gamètes$$,
        'body', $$L'ovocyte II, expulsé de l'ovaire lors de l'ovulation, est capté par le pavillon de la trompe puis poussé par les cils vibratiles jusqu'à l'ampoule, où il attendra un éventuel spermatozoïde : c'est la migration du gamète femelle. Les spermatozoïdes, éjaculés dans le vagin lors de l'accouplement, remontent grâce à leur flagelle à travers le vagin, le col de l'utérus, l'utérus, puis les trompes, jusqu'à l'ampoule : c'est la migration du gamète mâle. Au cours de ce trajet, leur nombre diminue fortement, mais les survivants acquièrent leur pouvoir fécondant : c'est la capacitation. Lorsqu'un nombre réduit de spermatozoïdes arrive au contact de l'ovocyte II dans l'ampoule, on parle de rencontre des gamètes.$$,
        'highlights', array[$$ovocyte II : migration vers l'ampoule (cils vibratiles)$$, $$spermatozoïdes : migration à travers vagin → col → utérus → trompes$$, $$capacitation : acquisition du pouvoir fécondant en cours de migration$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on la capacitation des spermatozoïdes ?$$, 'solution', $$L'acquisition, par les spermatozoïdes survivants, de leur pouvoir fécondant au cours de leur migration dans les voies génitales femelles.$$)
      ),
      jsonb_build_object(
        'heading', $$La pénétration du spermatozoïde et l'activation de l'ovocyte II$$,
        'body', $$Après reconnaissance des gamètes, les cellules folliculaires de la corona radiata se rétractent, un spermatozoïde perfore la zone pellucide grâce aux enzymes de son acrosome, puis pénètre dans l'ovocyte II, ce qui l'active. Cette activation déclenche deux phénomènes : la libération du contenu des granules corticaux, formant une membrane de fécondation imperméable aux autres spermatozoïdes, ce qui empêche la polyspermie (entrée de plusieurs spermatozoïdes) ; et l'expulsion d'un deuxième globule polaire, achevant la méiose bloquée depuis la métaphase II — l'ovocyte II devient alors un ovule.$$,
        'highlights', array[$$pénétration d'un spermatozoïde → activation de l'ovocyte II$$, $$granules corticaux → membrane de fécondation → empêche la polyspermie$$, $$expulsion du 2ème globule polaire → achèvement de la méiose → ovocyte II devient ovule$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel mécanisme empêche l'entrée de plusieurs spermatozoïdes dans l'ovocyte II (polyspermie) ?$$, 'solution', $$La formation de la membrane de fécondation, issue de la libération du contenu des granules corticaux, imperméable aux autres spermatozoïdes.$$)
      ),
      jsonb_build_object(
        'heading', $$Formation des pronucléi et fécondation proprement dite$$,
        'body', $$Le noyau de l'ovule gonfle et devient le pronucléus femelle haploïde ; celui du spermatozoïde gonfle également et devient le pronucléus mâle haploïde. Ces deux pronucléi se rapprochent puis fusionnent : c'est la caryogamie. De cette fusion naît une cellule œuf (ou zygote) diploïde, ce qui rétablit le nombre diploïde de chromosomes caractéristique de l'espèce. Cette cellule œuf débute ensuite ses divisions par le stade 2 cellules, pour aboutir, quelque temps plus tard, à un nouvel individu. La fécondation est donc le processus, en plusieurs étapes, par lequel un gamète mâle haploïde et un gamète femelle haploïde s'unissent pour former une cellule œuf diploïde (2n).$$,
        'highlights', array[$$pronucléus mâle + pronucléus femelle → caryogamie (fusion des noyaux)$$, $$résultat : cellule œuf (zygote) diploïde$$, $$fécondation = union de 2 gamètes haploïdes → 1 cellule œuf diploïde$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la fusion des deux pronucléi ?$$, 'solution', $$La caryogamie.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de la fécondation et le risque de transmission du VIH$$,
        'body', $$La fécondation joue plusieurs rôles essentiels : elle permet l'obtention d'un nouvel individu, le rétablissement du nombre diploïde de chromosomes caractéristique de l'espèce, la conservation et la permanence du caryotype de génération en génération, la détermination chromosomique du sexe de l'individu, le polymorphisme des individus (chacun étant différent de ses parents et des autres), et donc la pérennité de l'espèce avec ses caractéristiques génétiques. Cependant, en l'absence de précautions, la fécondation et la grossesse qui en résulte peuvent aussi être l'occasion d'une transmission du VIH de la mère à l'enfant, par voie sanguine, pendant la grossesse, au cours du travail, de l'accouchement, ou de l'allaitement.$$,
        'highlights', array[$$importance : nouvel individu, rétablissement diploïdie, permanence du caryotype, polymorphisme, pérennité de l'espèce$$, $$transmission mère-enfant du VIH possible : grossesse, accouchement, allaitement$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux moments au cours desquels le VIH peut être transmis de la mère à l'enfant.$$, 'solution', $$Deux parmi : pendant la grossesse, au cours du travail, de l'accouchement, ou de l'allaitement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton cousin découvre un document représentant deux structures observables au cours de deux étapes de la fécondation chez l'espèce humaine. Sur la première structure (étape 1), on observe des spermatozoïdes autour de la cellule, un seul globule polaire, un noyau en division et des granules corticaux visibles. Sur la seconde structure (étape 2), on observe la même cellule mais avec deux globules polaires visibles, sans spermatozoïdes autour.$$,
      'questions', array[
        $$Identifie les éléments visibles sur chacune des deux structures (globule polaire, spermatozoïde, noyau en division, granules corticaux, cellules folliculaires).$$,
        $$Identifie les cellules A (étape 1) et B (étape 2), et justifie ta réponse à partir du nombre de globules polaires observés.$$,
        $$Décris les transformations que subit la structure de l'étape 1 pour donner la structure de l'étape 2.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Par où l'ovocyte II est-il capté après l'ovulation, avant d'être poussé vers l'ampoule de la trompe ?$$,
      'hint', $$C'est une structure en entonnoir à l'extrémité de la trompe.$$,
      'expected', $$Par le pavillon de la trompe.$$
    ),
    jsonb_build_object(
      'question', $$Grâce à quelle structure les spermatozoïdes perforent-ils la zone pellucide de l'ovocyte II ?$$,
      'hint', $$C'est une structure enzymatique située à la tête du spermatozoïde.$$,
      'expected', $$Grâce aux enzymes de l'acrosome.$$
    ),
    jsonb_build_object(
      'question', $$Quel événement marque l'achèvement de la méiose de l'ovocyte II, transformant celui-ci en ovule ?$$,
      'hint', $$Cela concerne le devenir d'une petite cellule.$$,
      'expected', $$L'expulsion du deuxième globule polaire.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux importances de la fécondation pour l'espèce.$$,
      'hint', $$Pense au nombre de chromosomes et à la diversité entre individus.$$,
      'expected', $$Deux parmi : rétablissement du nombre diploïde de chromosomes, obtention d'un nouvel individu, polymorphisme des individus, pérennité de l'espèce, détermination chromosomique du sexe.$$
    )
  ),
  now()
);
