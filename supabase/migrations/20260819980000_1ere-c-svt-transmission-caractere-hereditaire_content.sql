-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 934: "SVT 1ère C_L7_La transmission d'un caractère
-- héréditaire" (https://lyc.ecole-ci.org/course/view.php?id=934), resource
-- id 4857. Contenu réécrit à partir du PDF source (gène, allèle, locus,
-- monohybridisme à dominance complète chez la souris, monohybridisme à
-- codominance chez la belle de nuit). Tout le contenu est factuel
-- (génétique mendélienne) : données de croisements, calculs de
-- proportions et échiquiers de croisement sont repris/adaptés tels quels ;
-- explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-transmission-caractere-hereditaire',
  '1ere',
  'C',
  'svt',
  $$La transmission d'un caractère héréditaire$$,
  6,
  '1ere-c-svt-synthese-proteines',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves en visite dans une ferme agropastorale observent des lapereaux et des poussins. Ils constatent que ces jeunes animaux ressemblent à leurs géniteurs par les poils ou par la couleur des yeux. Pour comprendre la transmission de ces caractères, ils décident de s'informer sur ces caractères et d'expliquer la transmission d'un caractère de l'ascendant au descendant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le gène, l'allèle et le locus$$,
        'body', $$Le chromosome est la structure responsable de la transmission des caractères. Chaque portion du chromosome responsable de l'expression d'un caractère est appelée gène ; son emplacement sur le chromosome est le locus. Un gène peut se présenter sous plusieurs formes appelées allèles. Par exemple, le gène responsable des groupes sanguins ABO existe sous trois allèles : l'allèle A (responsable de l'agglutinogène A), l'allèle B (agglutinogène B), et l'allèle O (qui ne produit aucun agglutinogène). C'est la présence ou l'absence de ces protéines à la surface des hématies qui détermine le groupe sanguin d'un individu.$$,
        'highlights', array[$$gène = portion de chromosome responsable d'un caractère ; locus = son emplacement$$, $$allèle = une des formes possibles d'un gène$$, $$exemple : système ABO — allèles A, B, O$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un gène et un allèle ?$$, 'solution', $$Le gène est la portion de chromosome responsable d'un caractère ; l'allèle est l'une des formes possibles que peut prendre ce gène.$$)
      ),
      jsonb_build_object(
        'heading', $$Monohybridisme avec dominance complète (couleur du pelage chez la souris)$$,
        'body', $$Le croisement d'une souris blanche (race pure) avec une souris grise (race pure) donne une descendance F1 homogène, entièrement grise : le phénotype gris est donc dominant, le phénotype blanc récessif (symboles : B pour l'allèle gris, b pour l'allèle blanc ; phénotypes [B] et [b]). Le croisement de deux souris grises hybrides F1 donne en F2 une descendance hétérogène avec une ségrégation de 3/4 grises et 1/4 blanches, typique d'un gène autosomal à dominance complète porté par des parents hétérozygotes (génotype B/b). Un troisième croisement, entre une souris blanche (homozygote récessive) et une souris grise hybride, appelé test-cross, donne une ségrégation 1/2, 1/2 — reflétant directement les proportions des gamètes de l'individu hétérozygote testé.$$,
        'highlights', array[$$F1 homogène + parents de phénotypes différents → race pure, dominance complète$$, $$F2 en 3/4, 1/4 → parents hybrides (hétérozygotes), un couple d'allèles$$, $$test-cross (hybride × homozygote récessif) → ségrégation 1/2, 1/2$$]::text[],
        'example', jsonb_build_object('statement', $$Un croisement de deux souris hybrides grises donne 198 souriceaux gris et 72 blancs. Calcule les proportions phénotypiques et confirme la ségrégation attendue.$$, 'solution', $$Gris : 198/270 ≈ 73,3% ≈ 75% (3/4). Blanc : 72/270 ≈ 26,7% ≈ 25% (1/4). Cette ségrégation 3/4, 1/4 confirme un gène autosomal à dominance complète, parents hybrides.$$),
        'fixation', jsonb_build_object('question', $$Que révèle une descendance F1 homogène quand les parents croisés ont des phénotypes différents ?$$, 'solution', $$Que les parents sont de race pure (homozygotes) pour ce caractère, et que le phénotype qui apparaît seul en F1 est dominant.$$)
      ),
      jsonb_build_object(
        'heading', $$Monohybridisme avec codominance (couleur des fleurs chez la belle de nuit)$$,
        'body', $$Le croisement d'une belle de nuit à fleurs rouges (race pure) avec une belle de nuit à fleurs blanches (race pure) donne une descendance F1 homogène, mais avec un phénotype intermédiaire : toutes les fleurs sont roses. Cela s'explique par une codominance : aucun des deux allèles (R pour rouge, B pour blanc) ne domine l'autre ; l'hétérozygote R/B s'exprime par le phénotype intermédiaire [RB] (rose). Le croisement de deux belles de nuit roses (F1) donne en F2 une ségrégation 1/4 rouge, 1/2 rose, 1/4 blanc — caractéristique d'un gène autosomal à codominance.$$,
        'highlights', array[$$codominance : aucun des deux allèles ne domine, phénotype intermédiaire chez l'hétérozygote$$, $$F1 : rouge × blanc → 100% rose (intermédiaire)$$, $$F2 : rose × rose → 1/4 rouge, 1/2 rose, 1/4 blanc$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on la codominance, par opposition à la dominance complète, à partir des résultats d'un croisement F1 ?$$, 'solution', $$En codominance, la F1 issue de deux parents de race pure présente un phénotype intermédiaire (ni l'un ni l'autre des phénotypes parentaux), alors qu'en dominance complète, la F1 présente exactement l'un des deux phénotypes parentaux.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulaire essentiel de la génétique$$,
        'body', $$Le caractère est l'ensemble des phénotypes observables chez un individu (ex. la couleur du pelage). Le phénotype est l'une des formes sous lesquelles ce caractère s'exprime (ex. gris ou blanc). Le génotype est l'ensemble des allèles que possède un individu pour un gène donné. Un individu est homozygote lorsqu'il possède deux allèles identiques du gène étudié, et hétérozygote lorsqu'il en possède deux différents.$$,
        'highlights', array[$$caractère : catégorie observable (ex. couleur du pelage)$$, $$phénotype : forme d'expression du caractère (ex. gris, blanc)$$, $$homozygote : 2 allèles identiques ; hétérozygote : 2 allèles différents$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre le phénotype et le génotype d'un individu ?$$, 'solution', $$Le phénotype est l'expression observable d'un caractère (ex. la couleur grise du pelage), tandis que le génotype est l'ensemble des allèles portés par l'individu pour le gène correspondant (ex. B/b).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève découvre dans un manuel de biologie les résultats d'une expérience réalisée chez les belles de nuit : le croisement d'une plante à fleurs rouges avec une plante à fleurs blanches donne, en F1, uniquement des plantes à fleurs roses.$$,
      'questions', array[
        $$Définis la notion de monohybridisme.$$,
        $$Décris le croisement réalisé et analyse le résultat obtenu en F1.$$,
        $$Interprète ce résultat (nature des parents, notion de codominance, choix des symboles pour les allèles et les phénotypes).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'appelle-t-on le locus d'un gène ?$$,
      'hint', $$C'est une position, pas une forme.$$,
      'expected', $$L'emplacement précis qu'occupe un gène sur le chromosome.$$
    ),
    jsonb_build_object(
      'question', $$Dans un croisement à dominance complète, quelle est la ségrégation phénotypique typique observée en F2 lorsque les parents F1 sont hétérozygotes ?$$,
      'hint', $$C'est la célèbre proportion 3 pour 1.$$,
      'expected', $$3/4 pour le phénotype dominant, 1/4 pour le phénotype récessif.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un test-cross, et quel type de ségrégation phénotypique produit-il ?$$,
      'hint', $$Il sert à révéler le contenu génétique d'un individu de phénotype dominant.$$,
      'expected', $$C'est le croisement entre un individu hybride (hétérozygote) et un individu homozygote récessif ; il produit une ségrégation 1/2, 1/2 qui reflète directement les gamètes de l'individu testé.$$
    ),
    jsonb_build_object(
      'question', $$Chez la belle de nuit, quel phénotype obtient-on lorsqu'on croise deux plantes hétérozygotes à fleurs roses (codominance) ?$$,
      'hint', $$Il y a trois phénotypes possibles chez la descendance.$$,
      'expected', $$Une ségrégation de 1/4 fleurs rouges, 1/2 fleurs roses et 1/4 fleurs blanches.$$
    )
  ),
  now()
);
