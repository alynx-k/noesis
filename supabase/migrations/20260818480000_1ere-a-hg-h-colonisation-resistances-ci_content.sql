-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 882: "1ère_HISTOIRE_T2_L3: LA COLONISATION ET LES
-- RESISTANCES EN CÔTE D'IVOIRE"
-- (https://lyc.ecole-ci.org/course/view.php?id=882), resource id 4233.
-- Contenu réécrit à partir du PDF source (systèmes d'administration
-- coloniale, exploitation de la colonie, résistances et conséquences).
-- Faits, dates et noms réels (Lugard, système direct/indirect, sociétés
-- SCOA/CFAO, dates des cultures) repris tels quels ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-colonisation-resistances-ci',
  '1ere',
  'A',
  'histoire-geographie',
  $$La colonisation et les résistances en Côte d'Ivoire$$,
  13,
  '1ere-a-hg-h-resistances-conquetes-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En suivant un documentaire sur la colonisation française en Côte d'Ivoire, des élèves de 1ère A apprennent, à travers des témoignages, que les populations ont vécu des moments extrêmement difficiles pendant l'occupation française. Ils décident de mener des recherches pour décrire le système d'administration coloniale, expliquer le processus d'exploitation de la colonie, et apprécier les résistances et les conséquences de la colonisation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les systèmes d'administration coloniale$$,
        'body', $$Deux systèmes coexistent en Afrique de l'Ouest. Le système indirect anglais (« indirect rule »), inventé par Lord Frederick Lugard, gère la colonie en s'appuyant sur les autorités traditionnelles, associées aux décisions (exemple : la Gold Coast). Le système direct français (« direct rule »), appliqué en Côte d'Ivoire, est une administration pyramidale centralisée où les fonctionnaires français détiennent l'autorité exclusive, les auxiliaires africains (chef de village, chef de canton) se contentant d'exécuter les ordres. Ce système débouche sur l'assimilation, qui vise à faire du colonisé un citoyen français soumis au code civil français.$$,
        'highlights', array[$$anglais : indirect rule (Lugard) — s'appuie sur les chefs$$, $$français : direct rule — administration centralisée$$, $$direct rule → assimilation$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Échelon$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array('Gouverneur général (AOF)', 'Chef des forces armées, ordonnateur du budget fédéral'),
            jsonb_build_array('Commandant de cercle', 'Homme clé du système, dirige les forces militaires locales'),
            jsonb_build_array('Chef de canton / village', $$Agent d'exécution, chargé des impôts et réquisitions$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle est la différence essentielle entre l'« indirect rule » anglais et le « direct rule » français ?$$, 'solution', $$L'indirect rule associe les autorités traditionnelles africaines à la gestion de la colonie, alors que le direct rule confie l'autorité exclusivement aux fonctionnaires français, les auxiliaires africains n'étant que de simples exécutants sans pouvoir propre.$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens d'exploitation de la colonie$$,
        'body', $$La mise en valeur de la colonie s'appuie sur des infrastructures (routes, chemins de fer, wharfs, écoles formant interprètes et auxiliaires), un financement par autofinancement des colonies (impôt de capitation, taxes douanières, emprunts, la métropole n'intervenant qu'en cas de nécessité), et une main-d'œuvre constituée d'autochtones et d'étrangers africains, mobilisée notamment par les travaux forcés (jusqu'à 12 jours de travail gratuit et obligatoire par an et par colonisé) et les corvées.$$,
        'highlights', array[$$autofinancement : impôt de capitation, taxes, emprunts$$, $$travaux forcés : jusqu'à 12 jours/an$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce que l'autofinancement des colonies ?$$, 'solution', $$Une stratégie qui consiste à utiliser les ressources propres de la colonie (impôts, taxes) pour assurer son propre financement, la métropole n'intervenant qu'en cas de nécessité.$$)
      ),
      jsonb_build_object(
        'heading', $$Les domaines d'exploitation$$,
        'body', $$Dans le domaine agricole, l'économie de traite initiale (caoutchouc sauvage, palmier à huile, bois) laisse place à une économie de plantation avec l'introduction de cultures d'exportation : café (1881), cacao (1882), banane douce (1930). Dans le domaine commercial, de grandes sociétés européennes s'installent (SCOA, CFAO, CICA), collectant les produits locaux et vendant les produits importés. Dans le domaine industriel, une industrie artisanale se développe (savonneries, huileries, textile), avec des entreprises comme les Établissements Robert Gonfreville (ERG) ou Blohorn.$$,
        'highlights', array[$$café (1881), cacao (1882), banane douce (1930)$$, $$sociétés commerciales : SCOA, CFAO, CICA$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle culture d'exportation a été introduite en Côte d'Ivoire en 1882 ?$$, 'solution', $$Le cacao.$$)
      ),
      jsonb_build_object(
        'heading', $$Les résistances à la colonisation$$,
        'body', $$Les abus coloniaux (travaux forcés, corvées, injustices de traitement, disparités de prix entre colons et populations, exploitation abusive des richesses) provoquent des actions de désobéissance : boycott des produits européens, refus de vendre les produits agricoles aux colons ou d'utiliser leur monnaie, grèves sur les chantiers, marches de protestation, destruction de voies ferrées, voire assassinats de colons.$$,
        'highlights', array[$$abus : travaux forcés, corvées, injustices$$, $$réactions : boycott, grèves, destruction de voies ferrées$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux formes de désobéissance des populations ivoiriennes face aux abus coloniaux.$$, 'solution', $$Par exemple le boycott des produits européens et les grèves sur les chantiers de grands travaux (également valables : le refus de vendre aux colons, la destruction de voies ferrées).$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la colonisation$$,
        'body', $$La colonisation entraîne la perte de pouvoir et d'indépendance des chefs traditionnels, l'introduction de nouvelles cultures (café, cacao, coton), l'apparition d'une bourgeoisie agricole, le développement de l'urbanisation, la construction d'infrastructures socioéducatives et routières, ainsi que la naissance de nouvelles classes sociales (blancs, métis, indigènes, intellectuels, leaders politiques, interprètes, « évolués »).$$,
        'highlights', array[$$perte du pouvoir des chefs traditionnels$$, $$urbanisation, infrastructures$$, $$nouvelles classes sociales$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux nouvelles classes sociales apparues avec la colonisation.$$, 'solution', $$Par exemple les intellectuels et les interprètes (également valables : les métis, les « évolués », les leaders politiques).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de la commémoration de l'indépendance, le préfet affirme que ce jour rappelle la fin d'une ère de souffrance débutée avec la création de la colonie de Côte d'Ivoire le 10 mars 1893. Un voisin dans la foule murmure : « Ce sont ces mêmes ancêtres qui ont facilité la colonisation. » Tu réponds que « des populations ivoiriennes ont cependant opposé à la colonisation une résistance multiforme ».$$,
      'questions', array[
        $$Dis de quoi il est question dans cette situation.$$,
        $$Explique le passage : « des populations ivoiriennes ont cependant opposé à la colonisation une résistance multiforme ».$$,
        $$Partages-tu l'avis de celui qui affirme : « ce sont ces mêmes ancêtres qui ont facilité la colonisation » ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qui a inventé le système de l'« indirect rule » anglais ?$$,
      'hint', $$Il commandait le Nigeria du Nord en 1900.$$,
      'expected', $$Lord Frederick Lugard.$$
    ),
    jsonb_build_object(
      'question', $$Quel système d'administration, direct ou indirect, la France a-t-elle appliqué en Côte d'Ivoire ?$$,
      'hint', $$Les fonctionnaires métropolitains y détenaient l'autorité exclusive.$$,
      'expected', $$Le système direct (« direct rule »).$$
    ),
    jsonb_build_object(
      'question', $$Combien de jours de travaux forcés un colonisé pouvait-il être contraint d'effectuer, gratuitement, par an ?$$,
      'hint', $$C'est une fourchette allant jusqu'à un maximum donné dans le cours.$$,
      'expected', $$Jusqu'à 12 jours par an.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux grandes sociétés commerciales européennes actives en Côte d'Ivoire coloniale.$$,
      'hint', $$Leurs sigles apparaissent dans le cours.$$,
      'expected', $$Par exemple la SCOA (Société Commerciale d'Afrique de l'Ouest) et la CFAO (Compagnie Française de l'Afrique de l'Ouest).$$
    )
  ),
  now()
);
