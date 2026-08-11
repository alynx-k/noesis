-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100 (no sub-categories found under this
-- category: all 10 lessons for 2nde A Physique-Chimie -- 8 de chimie et 2 de
-- mécanique -- are listed directly on the category page).
-- Moodle course id 3278: "LEÇON 1: L'ÉLÉMENT CHIMIQUE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3278)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32575, redirecting
-- to pluginfile "2nd AC - C1 Lélément chimique.pdf" (a document shared
-- between séries A and C, as shown by the "2nde AC" header on the PDF).
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 1): the
-- experimental evidence that copper the simple substance, copper(II) oxide
-- and the copper ion all share the same chemical element (combustion of
-- copper, reduction of copper oxide by carbon, reaction between iron and
-- copper ions), the definition of a chemical element, the distinction
-- between simple and compound substances, and the convention for element
-- symbols (including a few historical/foreign-derived symbols). 100%
-- original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-element-chimique',
  '2nde',
  'A',
  'physique-chimie',
  $$L'élément chimique$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En cherchant des informations sur internet, Akissi apprend que le sang contient « l'élément fer ». Elle ne comprend pas ce que signifie cette expression : le sang ne contient pourtant pas de clous ni de limaille de fer ! Elle en parle à ses camarades de classe et, ensemble, ils décident de mener quelques expériences simples avec le cuivre pour comprendre ce qu'est réellement un élément chimique, comment on le symbolise, et comment le reconnaître derrière des substances qui n'ont pourtant pas le même aspect.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Un même élément derrière trois substances différentes$$,
        'body', $$Trois expériences successives permettent de suivre le cuivre à travers plusieurs transformations. D'abord, un fil de cuivre métallique chauffé à l'air se recouvre d'une couche noire : le cuivre a réagi avec le dioxygène de l'air pour former de l'oxyde de cuivre (II), selon l'équation 2 Cu + O2 → 2 CuO. Ensuite, si l'on chauffe ce même oxyde de cuivre noir en présence de carbone, il redevient du cuivre métallique rougeâtre tandis que du dioxyde de carbone se dégage (il trouble l'eau de chaux) : 2 CuO + C → 2 Cu + CO2. Enfin, en plongeant un clou de fer dans une solution bleue de sulfate de cuivre (II), un dépôt rougeâtre de cuivre métal se forme sur le fer pendant que la solution devient verte, signe de l'apparition d'ions fer (II) : Cu2+ + Fe → Cu + Fe2+. Dans ces trois transformations, le cuivre métal, l'oxyde de cuivre et l'ion cuivre (II) n'ont pourtant pas le même aspect ni les mêmes propriétés.$$,
        'highlights', array[$$conservation du cuivre$$, $$combustion$$, $$réduction par le carbone$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Transformation$$, $$Équation-bilan$$, $$Observation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Combustion du cuivre dans l'air$$, $$2 Cu + O2 → 2 CuO$$, $$Le fil de cuivre se couvre d'une couche noire$$),
            jsonb_build_array($$Réduction de l'oxyde de cuivre par le carbone$$, $$2 CuO + C → 2 Cu + CO2$$, $$Retour au cuivre rougeâtre, dégagement d'un gaz qui trouble l'eau de chaux$$),
            jsonb_build_array($$Action du fer sur les ions cuivre (II)$$, $$Cu2+ + Fe → Cu + Fe2+$$, $$Dépôt de cuivre sur le clou, la solution passe du bleu au vert$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans les trois transformations décrites, quelle est la substance de départ qui contient déjà l'élément cuivre avant même la première réaction ?$$, 'solution', $$Le cuivre métallique (Cu) du fil que l'on chauffe à l'air : c'est lui qui, en se combinant au dioxygène, donne l'oxyde de cuivre, puis, une fois redonné par réduction, retrouve sa forme métallique.$$),
        'fixation', jsonb_build_object('question', $$Écris l'équation-bilan de la réduction de l'oxyde de cuivre (II) par le carbone.$$, 'solution', $$2 CuO + C → 2 Cu + CO2.$$)
      ),
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un élément chimique ?$$,
        'body', $$Le cuivre métal, l'oxyde de cuivre et l'ion cuivre (II) présentent des propriétés physiques très différentes : couleur, état, réactivité. Pourtant, une transformation chimique permet toujours de passer de l'un à l'autre sans jamais perdre ce « point commun » qui fait qu'ils contiennent tous du cuivre. Ce point commun, invisible à l'œil mais retrouvé dans le corps simple comme dans tous ses composés, s'appelle l'élément chimique. On le définit ainsi : l'élément chimique est ce qui est commun à un corps simple et à tous les corps composés qui en dérivent ; il se conserve au cours des transformations chimiques, contrairement aux corps purs (simples ou composés) qui, eux, peuvent apparaître ou disparaître.$$,
        'highlights', array[$$élément chimique$$, $$conservation au cours d'une réaction$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'élément chimique est ce qui est commun à un corps simple et à l'ensemble des corps composés qui en sont issus ; il se conserve au cours de toute transformation chimique.$$),
        'fixation', jsonb_build_object('question', $$Le sang humain contient « l'élément fer ». Que peut-on en déduire, sans qu'il y ait le moindre clou de fer dans le sang ?$$, 'solution', $$Que le fer, sous une autre forme chimique (par exemple dans une molécule complexe comme l'hémoglobine), est présent dans le sang : l'élément fer se retrouve aussi bien dans le métal fer que dans des composés qui en contiennent.$$)
      ),
      jsonb_build_object(
        'heading', $$Corps simple et corps composé$$,
        'body', $$Un corps pur est constitué d'une seule espèce chimique. On distingue deux catégories de corps purs selon le nombre d'éléments chimiques qu'ils renferment. Un corps simple est formé d'un seul élément chimique : c'est le cas du dihydrogène H2, du dioxygène O2 ou de l'ozone O3, qui ne contiennent respectivement que l'élément hydrogène ou que l'élément oxygène. Un corps composé, en revanche, est formé de plusieurs éléments chimiques différents combinés entre eux : l'eau H2O associe hydrogène et oxygène, l'ammoniac NH3 associe azote et hydrogène, le méthane CH4 associe carbone et hydrogène.$$,
        'highlights', array[$$corps simple$$, $$corps composé$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Catégorie$$, $$Définition$$, $$Exemples$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Corps simple$$, $$Formé d'un seul élément chimique$$, $$H2, O3, Cu$$),
            jsonb_build_array($$Corps composé$$, $$Formé de plusieurs éléments chimiques combinés$$, $$H2O, NH3, CH4$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Le méthane CH4 est-il un corps simple ou un corps composé ? Justifie.$$, 'solution', $$C'est un corps composé, car il renferme deux éléments chimiques différents : le carbone et l'hydrogène.$$)
      ),
      jsonb_build_object(
        'heading', $$Les symboles des éléments chimiques$$,
        'body', $$On recense aujourd'hui 118 éléments chimiques, dont 93 sont naturels, 25 artificiels et 3 encore en attente de confirmation. Chaque élément est désigné par un symbole formé d'une lettre majuscule, parfois suivie d'une seconde lettre minuscule lorsque plusieurs éléments commencent par la même lettre. Ce symbole provient le plus souvent de la première lettre du nom français ou latin de l'élément : C pour le carbone, N pour l'azote, O pour l'oxygène, S pour le soufre, Ca pour le calcium. Il faut toutefois rester vigilant, car certains symboles usuels dérivent d'un nom ancien ou étranger et ne correspondent pas à l'initiale du nom français actuel : Na pour le sodium (du latin natrium), K pour le potassium (kalium), Fe pour le fer (ferrum), Hg pour le mercure (hydrargyrum), Au pour l'or (aurum), Sn pour l'étain (stannum) ou encore W pour le tungstène (wolfram).$$,
        'highlights', array[$$symbole chimique$$, $$118 éléments$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Élément$$, $$Symbole$$, $$Origine du symbole$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Sodium$$, $$Na$$, $$Latin natrium$$),
            jsonb_build_array($$Potassium$$, $$K$$, $$Latin kalium$$),
            jsonb_build_array($$Fer$$, $$Fe$$, $$Latin ferrum$$),
            jsonb_build_array($$Mercure$$, $$Hg$$, $$Latin hydrargyrum$$),
            jsonb_build_array($$Or$$, $$Au$$, $$Latin aurum$$),
            jsonb_build_array($$Étain$$, $$Sn$$, $$Latin stannum$$),
            jsonb_build_array($$Tungstène$$, $$W$$, $$Allemand wolfram$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Une formule chimique fait apparaître les symboles Cl, N, H, O, C, S et Al. Cite les éléments chimiques correspondants.$$, 'solution', $$Le chlore (Cl), l'azote (N), l'hydrogène (H), l'oxygène (O), le carbone (C), le soufre (S) et l'aluminium (Al).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le symbole du sodium est-il Na et non So ?$$, 'solution', $$Parce que ce symbole vient du nom latin de l'élément, natrium, et non de son nom français.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un club de chimie de l'établissement présente au public plusieurs espèces chimiques : Cl2, NH3, CO3(2-), C8H10N4O2, Al2(SO4)3, HCl, C12H22O11 et O2. On te demande d'identifier les éléments chimiques présents et de repérer ceux que plusieurs espèces ont en commun.$$,
      'questions', array[
        $$Définis ce qu'est un élément chimique et explique en quoi il se distingue d'un corps pur.$$,
        $$Distingue un corps simple d'un corps composé et donne un exemple de chacun parmi les espèces citées.$$,
        $$Identifie les espèces chimiques qui ont en commun l'élément oxygène.$$,
        $$Explique, à l'aide des trois réactions du cuivre étudiées en classe, pourquoi on dit que l'élément chimique se conserve au cours d'une transformation chimique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle équation-bilan traduit la combustion du cuivre dans le dioxygène de l'air ?$$,
      'hint', $$Le cuivre métal réagit avec O2 pour donner un oxyde noir.$$,
      'expected', $$2 Cu + O2 → 2 CuO.$$
    ),
    jsonb_build_object(
      'question', $$Donne la définition de l'élément chimique.$$,
      'hint', $$C'est ce qui reste identique malgré le changement d'aspect du corps.$$,
      'expected', $$L'élément chimique est ce qui est commun à un corps simple et à tous les corps composés qui en dérivent ; il se conserve au cours des transformations chimiques.$$
    ),
    jsonb_build_object(
      'question', $$Le dioxygène O2 est-il un corps simple ou un corps composé ?$$,
      'hint', $$Compte le nombre d'éléments chimiques différents dans sa formule.$$,
      'expected', $$C'est un corps simple, car il n'est formé que d'un seul élément chimique : l'oxygène.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le symbole chimique du fer est-il Fe et non F ?$$,
      'hint', $$Pense à l'origine latine de certains symboles.$$,
      'expected', $$Parce que son symbole dérive du mot latin ferrum ; par ailleurs F désigne déjà un autre élément, le fluor.$$
    )
  ),
  now()
);
