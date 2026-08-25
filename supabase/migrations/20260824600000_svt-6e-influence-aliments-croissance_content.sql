-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 6 : L'influence des aliments sur la croissance des
-- vertébrés" (id 2057). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une ferme scolaire, deux lots de poussins de même âge sont nourris différemment : le lot A exclusivement au son de riz, le lot B au maïs additionné de poudre de poisson sec et de coquillage broyé. Au bout de quelques semaines, le lot B a une meilleure croissance. Les élèves cherchent à comprendre l'influence des aliments sur la croissance des vertébrés (cas du poulet).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Influence de la composition des aliments$$,
        'body', $$Un sac d'aliment pour volaille indique, pour 1 kg : 160g de protéines végétales, 200g de protéines animales, 10g de calcium, 15g d'autres sels minéraux, 3g de vitamines. Ces éléments (protéines, sels minéraux, vitamines, mais aussi glucides, lipides et eau) sont des aliments simples, qui favorisent le bon développement des poulets. Les aliments composés (son de riz, son de maïs, tourteau de soja) contiennent ces aliments simples en différentes proportions.$$,
        'highlights', array[$$aliments simples : protéines, glucides, lipides, sels minéraux, vitamines, eau$$, $$aliments composés (son de riz, tourteau de soja...) = mélanges d'aliments simples$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite quatre aliments simples présents dans l'alimentation du poulet.$$, 'solution', $$Par exemple : protéines, glucides, lipides, sels minéraux, vitamines, eau (quatre parmi ceux-ci).$$)
      ),
      jsonb_build_object(
        'heading', $$Influence de la qualité des aliments$$,
        'body', $$Deux lots de poussins de même masse sont suivis 8 semaines : le lot A reçoit des aliments riches en protéines, le lot B des aliments pauvres en protéines. Le lot A montre une forte croissance, le lot B une croissance faible. Les protéines sont des aliments de construction qui favorisent la production de chair chez les poussins qui en consomment.$$,
        'highlights', array[$$protéines = aliments de construction → forte croissance si l'alimentation en est riche$$]::text[],
        'example', jsonb_build_object('statement', $$Un poussin passe d'une alimentation à base de maïs seul, à du maïs + haricot sec, puis à du maïs + poisson sec. Que se passe-t-il pour sa masse ?$$, 'solution', $$Sa masse augmente progressivement, car chaque étape enrichit l'alimentation en protéines (végétales puis animales).$$),
        'fixation', jsonb_build_object('question', $$Quel type d'aliment favorise particulièrement la production de chair chez le poulet ?$$, 'solution', $$Les protéines.$$)
      ),
      jsonb_build_object(
        'heading', $$Influence de la quantité des aliments$$,
        'body', $$Deux poussins de même âge et même masse initiale (42g) reçoivent des quantités différentes d'aliments pendant 7 jours. Celui recevant plus de nourriture (poussin B, jusqu'à 130g/jour) atteint 170g, contre 103g pour celui recevant moins (poussin A, jusqu'à 75g/jour). Une quantité insuffisante d'aliments ralentit la croissance, car elle ne couvre pas les besoins nutritionnels quotidiens.$$,
        'highlights', array[$$quantité insuffisante d'aliments = croissance ralentie (besoins nutritionnels non couverts)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la quantité d'aliments donnée à un poussin doit-elle augmenter avec son âge ?$$, 'solution', $$Parce que ses besoins nutritionnels augmentent à mesure que sa masse corporelle augmente.$$),
        'fixation', jsonb_build_object('question', $$Que se passe-t-il si un poussin ne reçoit pas assez d'aliments ?$$, 'solution', $$Sa croissance ralentit fortement, car ses besoins nutritionnels quotidiens ne sont pas couverts.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux coopératives scolaires élèvent des lapereaux de même âge. La coopérative A donne une alimentation composée à 70% de soja et tranches de manioc (30% d'herbes) ; la coopérative B donne 75% d'herbes et épluchures de tubercules (25% de soja/manioc). À la fin, les animaux de la coopérative A pèsent 900g contre 760g pour la coopérative B (tous deux partis de 300g).$$,
      'questions', array[
        $$Compare l'évolution de la masse des animaux des deux coopératives.$$,
        $$Explique cette différence de résultats.$$,
        $$Rédige une conclusion sur les conditions d'une bonne croissance.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Les protéines sont-elles des aliments simples ou composés ?$$,
      'hint', $$Elles font partie des éléments constitutifs de base.$$,
      'expected', $$Des aliments simples.$$
    ),
    jsonb_build_object(
      'question', $$Un poussin nourri avec des aliments riches en protéines aura-t-il une croissance plus forte ou plus faible qu'un poussin nourri pauvrement en protéines ?$$,
      'hint', $$Les protéines sont des aliments de construction.$$,
      'expected', $$Une croissance plus forte.$$
    ),
    jsonb_build_object(
      'question', $$Deux poussins de même âge reçoivent des quantités différentes de nourriture. Celui qui en reçoit le moins aura-t-il une croissance plus rapide ou plus lente ?$$,
      'hint', $$Pense aux besoins nutritionnels non couverts.$$,
      'expected', $$Une croissance plus lente.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois aspects des aliments qui influencent la croissance des vertébrés.$$,
      'hint', $$Ce sont les trois parties de la leçon.$$,
      'expected', $$La composition, la qualité, et la quantité des aliments.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-influence-aliments-croissance';
