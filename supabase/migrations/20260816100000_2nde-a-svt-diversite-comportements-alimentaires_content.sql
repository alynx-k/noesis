-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3701: "SVT 2nd A_L1_La diversité des comportements
-- alimentaires de l'homme" (https://lyc.ecole-ci.org/course/view.php?id=3701)
-- Resource "Je lis le résumé de la leçon", mod_resource id 37652, redirecting
-- to pluginfile "SVT 2nd A_L1_La diversité des comportements alimentaires de
-- lhomme.pdf" (14 pages; internally labelled "Leçon 8" under the theme "La
-- nutrition et la santé de l'homme", Moodle numbering used for order_index).
-- Rewritten/paraphrased from the source PDF: the notion of comportement /
-- habitude alimentaire, the regional food habits of Côte d'Ivoire (Nord,
-- Sud, Centre, Est, Ouest), the sociological factor (four grand ethnic
-- groups, taboos, religious beliefs, prejudices) and the physical factors
-- (climate, vegetation, soils) that together explain this diversity. 100%
-- original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-diversite-comportements-alimentaires',
  '2nde',
  'A',
  'svt',
  $$La diversité des comportements alimentaires de l'homme$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Invité à une fête de génération à Dabou, un élève de seconde A du Lycée Moderne de Sassandra remarque que les plats servis sont à base de manioc (attiéké) accompagné d'une sauce n'tro, alors que dans sa propre région on mange plutôt du riz et du foutou de banane avec de la sauce graine. De retour en classe, il raconte cette observation à ses camarades, qui décident de chercher pourquoi les habitudes alimentaires changent ainsi d'une région à l'autre de la Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Comportement alimentaire et habitude alimentaire$$,
        'body', $$On appelle comportement alimentaire l'ensemble des attitudes qu'un individu ou un groupe humain adopte vis-à-vis de la consommation des aliments. Lorsqu'un choix alimentaire se répète régulièrement dans le temps au sein d'une population, on parle d'habitude alimentaire. En Côte d'Ivoire, ces habitudes varient sensiblement d'une région à l'autre : le riz accompagné de sauce graine domine par exemple chez les Baoulé, alors que l'attiéké servi avec une sauce claire au poisson caractérise plutôt l'alimentation des Adjoukrou du littoral. Cette diversité observable pose la question de ses causes.$$,
        'highlights', array[$$comportement alimentaire$$, $$habitude alimentaire$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une habitude alimentaire est un choix alimentaire récurrent qu'une personne ou une population adopte parmi les aliments disponibles dans son milieu de vie.$$),
        'fixation', jsonb_build_object('question', $$Que devient un choix alimentaire lorsqu'il se répète régulièrement au sein d'une population ?$$, 'solution', $$Il devient une habitude alimentaire.$$)
      ),
      jsonb_build_object(
        'heading', $$Les habitudes alimentaires selon les régions de Côte d'Ivoire$$,
        'body', $$L'observation des pratiques alimentaires montre que chaque grande région ivoirienne privilégie certains mets. Au nord, on consomme surtout le kabato (pâte de maïs), des bouillies de céréales (maïs, mil, fonio, riz) accompagnées de sauce arachide ou de sauce da, ainsi que des feuilles d'épinard, de patate ou de manioc. Au sud, dominent le foutou de manioc ou de banane, l'attiéké, et des sauces comme le biécosseu ou le n'tro. Au centre, on retrouve le foutou d'igname, le n'gbô (ragoût d'igname) et la sauce gnangan. À l'est, les habitudes tournent autour du foutou de taro, de banane ou d'igname, de la sauce tosrodum et de la boisson koutoukou. À l'ouest enfin, le riz, le foutou de manioc pur et le loco soukoué (foutou de banane trop mûre) s'accompagnent des sauces tikriti et klébâ.$$,
        'highlights', array[$$diversité régionale$$, $$habitudes alimentaires$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Région$$, $$Aliments caractéristiques$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nord$$, $$Kabato, bouillies de céréales, sauce arachide/da, feuilles d'épinard ou de manioc$$),
            jsonb_build_array($$Sud$$, $$Foutou manioc/banane, attiéké, sauce biécosseu ou n'tro$$),
            jsonb_build_array($$Centre$$, $$Foutou d'igname, n'gbô (ragoût d'igname), sauce gnangan$$),
            jsonb_build_array($$Est$$, $$Foutou taro/banane/igname, sauce tosrodum, boisson koutoukou$$),
            jsonb_build_array($$Ouest$$, $$Riz, foutou manioc, loco soukoué, sauces tikriti et klébâ$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Une camarade affirme que « le riz à la sauce graine est la principale nourriture des Baoulé ». Cette affirmation est-elle exacte ?$$, 'solution', $$Non : chez les Baoulé, c'est plutôt l'igname et ses dérivés qui dominent ; le riz à la sauce graine est davantage associé à d'autres peuples comme les Bété.$$),
        'fixation', jsonb_build_object('question', $$Dans quelle région retrouve-t-on typiquement le n'gbô (ragoût d'igname) ?$$, 'solution', $$Au centre de la Côte d'Ivoire.$$)
      ),
      jsonb_build_object(
        'heading', $$Le facteur sociologique : une mosaïque de peuples$$,
        'body', $$La Côte d'Ivoire regroupe quatre grands ensembles ethniques aux traditions culinaires distinctes : le groupe voltaïque (Sénoufo, Lobi, Koulango) au nord, le groupe mandé (Malinké, Yacouba) au nord-ouest, le groupe krou (Bété, Dida, Guéré, Bakwé) au sud-ouest, et le groupe akan (Baoulé, Agni, Abron, Abé) au centre et à l'est. Chaque peuple privilégie certains aliments : la banane plantain chez les Agni et les Attié, le manioc chez les Adjoukrou, les Ebrié et les Yacouba, le riz chez les Bété et les Dida, le maïs et le mil chez les Sénoufo, les Malinké et les Kouyaka, l'igname chez les Abron et les Baoulé. À ces différences ethniques s'ajoutent des causes proprement culturelles : certains préjugés sur les aliments, des tabous alimentaires propres à chaque groupe, et des croyances religieuses qui interdisent ou recommandent certains mets.$$,
        'highlights', array[$$groupes ethniques$$, $$tabous alimentaires$$, $$croyances religieuses$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Groupes ethniques$$, $$Aliment de base privilégié$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Agni, Attié$$, $$Banane plantain$$),
            jsonb_build_array($$Adjoukrou, Ebrié, Yacouba$$, $$Manioc$$),
            jsonb_build_array($$Bété, Dida$$, $$Riz$$),
            jsonb_build_array($$Sénoufo, Malinké, Kouyaka$$, $$Maïs, mil$$),
            jsonb_build_array($$Abron, Baoulé$$, $$Igname$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite deux causes culturelles, autres que l'appartenance ethnique, qui influencent le choix des aliments.$$, 'solution', $$Les tabous alimentaires et les croyances religieuses (on peut aussi citer les préjugés).$$)
      ),
      jsonb_build_object(
        'heading', $$Les facteurs physiques : climat, végétation et sols$$,
        'body', $$Au-delà des causes humaines, la diversité alimentaire s'explique aussi par la géographie physique du pays. Le climat varie du nord au sud : climat soudanien au nord, climat baouléen au centre, climat attiéen au sud, et climat de montagne à l'ouest ; chacun favorise des cultures différentes. La végétation suit une logique voisine : la savane herbeuse du nord convient aux céréales, la savane arborée du centre à l'igname, la forêt claire de l'est et de l'ouest à des cultures variées, et la forêt dense du sud et du littoral au palmier à huile et aux tubercules. Les sols renforcent ces contrastes : les sols ferrugineux du centre et du nord conviennent aux céréales, les ferrisols de l'ouest au riz et au palmier à huile, les sols ferralitiques du sud-ouest et du sud-est aux tubercules, et les sols hydromorphes du littoral au riz et à la noix de coco.$$,
        'highlights', array[$$climat$$, $$végétation$$, $$sols$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Facteur physique$$, $$Répartition et culture associée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Climat$$, $$Soudanien (nord), baouléen (centre), attiéen (sud), de montagne (ouest)$$),
            jsonb_build_array($$Végétation$$, $$Savane herbeuse (nord, céréales), savane arborée (centre, igname), forêt claire (est/ouest), forêt dense (sud/littoral, palmier à huile)$$),
            jsonb_build_array($$Sols$$, $$Sols ferrugineux (centre/nord, céréales), ferrisols (ouest), sols ferralitiques (sud-ouest/sud-est, tubercules), sols hydromorphes (littoral, riz et noix de coco)$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi le riz et la noix de coco sont-ils particulièrement présents sur le littoral ivoirien ?$$, 'solution', $$Parce que les sols hydromorphes du littoral, associés à la forêt dense et au climat attiéen, sont favorables à ces cultures.$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : une diversité multifactorielle$$,
        'body', $$La diversité des comportements alimentaires en Côte d'Ivoire ne résulte donc pas d'une cause unique. Elle s'explique par la combinaison de facteurs sociologiques, liés à l'appartenance ethnique, aux tabous et aux croyances religieuses, et de facteurs physiques, liés au climat, à la végétation et aux sols de chaque région. Comprendre cette diversité permet de mieux saisir pourquoi deux Ivoiriens de régions différentes peuvent avoir des habitudes alimentaires très différentes tout en partageant la même nationalité.$$,
        'highlights', array[$$facteurs sociologiques$$, $$facteurs physiques$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux grandes catégories de facteurs qui expliquent la diversité des comportements alimentaires ?$$, 'solution', $$Les facteurs sociologiques (ethnies, tabous, croyances) et les facteurs physiques (climat, végétation, sols).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit expliquer à des camarades pourquoi deux familles ivoiriennes, l'une du nord et l'autre du sud, n'ont pas les mêmes habitudes alimentaires, en s'appuyant sur les facteurs sociologiques et physiques étudiés.$$,
      'questions', array[
        $$Donne la définition d'une habitude alimentaire.$$,
        $$Cite les aliments caractéristiques de trois régions différentes de Côte d'Ivoire.$$,
        $$Explique en quoi l'appartenance ethnique influence les habitudes alimentaires.$$,
        $$Montre comment le climat, la végétation et les sols contribuent à expliquer la diversité alimentaire.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on un choix alimentaire qui se répète régulièrement au sein d'une population ?$$,
      'hint', $$C'est la notion centrale de la leçon, à ne pas confondre avec « comportement alimentaire ».$$,
      'expected', $$Une habitude alimentaire.$$
    ),
    jsonb_build_object(
      'question', $$Quel aliment de base est privilégié par les Abron et les Baoulé ?$$,
      'hint', $$C'est un tubercule très cultivé au centre du pays.$$,
      'expected', $$L'igname.$$
    ),
    jsonb_build_object(
      'question', $$Cite un facteur sociologique, autre que l'ethnie, qui peut expliquer un interdit alimentaire.$$,
      'hint', $$Pense à la religion ou aux traditions.$$,
      'expected', $$Une croyance religieuse (ou un tabou alimentaire, ou un préjugé).$$
    ),
    jsonb_build_object(
      'question', $$Quel type de sol, présent sur le littoral, favorise la culture du riz et de la noix de coco ?$$,
      'hint', $$Ce sol est lié à la présence d'eau proche de la surface.$$,
      'expected', $$Les sols hydromorphes.$$
    )
  ),
  now()
);
