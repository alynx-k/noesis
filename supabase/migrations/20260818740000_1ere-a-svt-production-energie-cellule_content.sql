-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 901: "SVT 1ère A_L8_LA PRODUCTION D'ENERGIE PAR LA
-- CELLULE" (https://lyc.ecole-ci.org/course/view.php?id=901), resource id
-- 4461. Contenu réécrit à partir du PDF source (expérience des levures,
-- respiration vs fermentation, glycolyse, cycle de Krebs). Faits
-- scientifiques réels (bilans énergétiques, équations chimiques) repris
-- tels quels ; explications reformulées, non copiées verbatim.
-- NOTE : la leçon 7 (id=900, "hétérochromosomes XY") n'a aucune ressource
-- déposée sur la plateforme à ce jour — leçon sautée, à vérifier plus tard.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-production-energie-cellule',
  '1ere',
  'A',
  'svt',
  $$La production d'énergie par la cellule$$,
  7,
  '1ere-a-svt-transmission-caractere-autosomes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un match de tournoi interclasses, des élèves de 1ère A sont débordants d'énergie et réalisent un très bon match. Le médecin du tournoi explique que cette énergie est produite par les cellules de leur organisme, correctement alimenté. Les élèves décident de s'informer sur l'origine de cette énergie et d'expliquer son mécanisme de production.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Deux voies de production d'énergie : l'expérience des levures$$,
        'body', $$Des levures de bière cultivées en milieu oxygéné produisent une grande quantité d'énergie (2815 KJ par gramme de glucose dégradé), consomment de l'oxygène et rejettent du CO2 : c'est la voie aérobie, la respiration. Les mêmes levures cultivées en milieu non oxygéné produisent beaucoup moins d'énergie (167 KJ par gramme de glucose), et le glucose n'est dégradé que partiellement, produisant de l'alcool éthylique (éthanol) et du CO2 : c'est la voie anaérobie, la fermentation (ici alcoolique).$$,
        'highlights', array[$$respiration (aérobie) : 2815 KJ/g glucose$$, $$fermentation (anaérobie) : 167 KJ/g glucose + éthanol$$]::text[],
        'property', jsonb_build_object('label', $$Sources d'énergie$$, 'text', $$1 g de glucide fournit 17 KJ (4 Kcal). 1 g de protide fournit 17 KJ (4 Kcal). 1 g de lipide fournit 38 KJ (9 Kcal). Cette énergie est stockée sous forme d'ATP (Adénosine Triphosphate).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi la production d'énergie est-elle beaucoup plus importante en milieu oxygéné qu'en milieu non oxygéné ?$$, 'solution', $$Parce qu'en présence d'oxygène (respiration), le glucose est dégradé totalement, libérant beaucoup plus d'énergie qu'en absence d'oxygène (fermentation), où le glucose n'est que partiellement dégradé en éthanol et CO2.$$)
      ),
      jsonb_build_object(
        'heading', $$Les zones de production d'énergie dans la cellule$$,
        'body', $$Le glucose issu de la digestion subit une première dégradation dans le cytoplasme (hyaloplasme), se transformant en acide pyruvique. Cet acide pyruvique pénètre ensuite dans la mitochondrie où il est dégradé. Les acides gras et les acides aminés, eux, sont directement dégradés dans la mitochondrie. Dans les deux cas, cette dégradation fournit de l'énergie sous forme d'ATP.$$,
        'highlights', array[$$hyaloplasme : glucose → acide pyruvique$$, $$mitochondrie : dégradation finale (acide pyruvique, acides gras, acides aminés)$$]::text[],
        'fixation', jsonb_build_object('question', $$Où débute la dégradation du glucose dans la cellule ?$$, 'solution', $$Dans le cytoplasme (hyaloplasme), où le glucose est transformé en acide pyruvique.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme de la respiration cellulaire$$,
        'body', $$La respiration débute par la glycolyse dans le hyaloplasme : le glucose (C6H12O6) est dégradé en deux molécules d'acide pyruvique, produisant 2 ATP. Dans la matrice mitochondriale, l'acide pyruvique subit une suite de décarboxylations oxydatives (le cycle de Krebs), libérant du CO2 et des composés réduits. Enfin, dans la membrane interne des mitochondries, ces composés réduits sont oxydés par le dioxygène (phosphorylation oxydative), produisant l'essentiel de l'ATP. Au total, la respiration cellulaire produit 38 molécules d'ATP par mole de glucose (2 issues de la glycolyse, 36 des oxydations respiratoires), selon le bilan : C6H12O6 + 6O2 → 6CO2 + 6H2O + 38 ATP.$$,
        'highlights', array[$$glycolyse (hyaloplasme) : 2 ATP$$, $$cycle de Krebs + phosphorylation oxydative (mitochondrie) : 36 ATP$$, $$bilan total : 38 ATP$$]::text[],
        'example', jsonb_build_object('statement', $$Quel est le bilan chimique complet de la respiration cellulaire à partir d'une mole de glucose ?$$, 'solution', $$C6H12O6 + 6O2 → 6CO2 + 6H2O + 38 ATP.$$),
        'fixation', jsonb_build_object('question', $$Combien de molécules d'ATP la glycolyse produit-elle, et combien les oxydations respiratoires dans la mitochondrie produisent-elles ?$$, 'solution', $$La glycolyse produit 2 ATP ; les oxydations respiratoires dans la mitochondrie en produisent 36, pour un total de 38 ATP.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme de la fermentation alcoolique$$,
        'body', $$La fermentation débute aussi par la glycolyse dans le hyaloplasme (glucose → acide pyruvique + 2 ATP), mais s'arrête là : en l'absence d'oxygène, l'acide pyruvique se transforme directement en éthanol (CH3CH2OH) et CO2, sans passer par la mitochondrie. Le bilan est donc : C6H12O6 → 2 C2H5OH + 2CO2 + 2 ATP — soit seulement 2 ATP par mole de glucose, bien moins que les 38 ATP de la respiration.$$,
        'highlights', array[$$fermentation : glycolyse seule (hyaloplasme) → 2 ATP$$, $$bilan : glucose → 2 éthanol + 2 CO2 + 2 ATP$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la fermentation produit-elle beaucoup moins d'ATP que la respiration ?$$, 'solution', $$Parce qu'elle se limite à la glycolyse dans le hyaloplasme (2 ATP), sans passer par le cycle de Krebs ni la phosphorylation oxydative dans la mitochondrie, qui produisent l'essentiel des 38 ATP de la respiration.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une suspension de cellules de levures est placée dans un milieu contenant du glucose et de l'oxygène à 30°C. On observe qu'entre 0 et 200 secondes, la concentration d'oxygène diminue progressivement jusqu'à s'annuler, le glucose diminue, le CO2 augmente légèrement et l'éthanol reste quasi nul. Entre 200 et 700 secondes, le glucose continue de diminuer tandis que l'éthanol et le CO2 augmentent progressivement.$$,
      'questions', array[
        $$Décris l'évolution des différentes composantes du milieu sur les deux périodes (0-200s et 200-700s).$$,
        $$Déduis ce que représente chacune de ces deux périodes (quel processus métabolique domine).$$,
        $$Compare, dans un tableau, la respiration cellulaire et la fermentation alcoolique (consommation d'O2, production de CO2 et d'éthanol, quantité d'ATP produite).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans quel compartiment cellulaire se déroule la glycolyse ?$$,
      'hint', $$C'est commun à la respiration et à la fermentation.$$,
      'expected', $$Dans le cytoplasme (hyaloplasme).$$
    ),
    jsonb_build_object(
      'question', $$Combien de molécules d'ATP la respiration cellulaire produit-elle par mole de glucose ?$$,
      'hint', $$C'est bien plus que la fermentation.$$,
      'expected', $$38 molécules d'ATP.$$
    ),
    jsonb_build_object(
      'question', $$Quel produit organique se forme lors de la fermentation alcoolique, en plus du CO2 ?$$,
      'hint', $$C'est le composé qui donne son nom à cette fermentation.$$,
      'expected', $$L'éthanol (alcool éthylique).$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'ensemble des réactions se déroulant dans la matrice mitochondriale, qui transforment l'acide pyruvique et libèrent du CO2 ?$$,
      'hint', $$C'est nommé d'après un scientifique.$$,
      'expected', $$Le cycle de Krebs.$$
    )
  ),
  now()
);
