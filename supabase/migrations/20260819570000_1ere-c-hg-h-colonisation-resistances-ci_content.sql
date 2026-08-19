-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 2444: "1ère H5 - La colonisation et les résistances en
-- Côte d'Ivoire" (https://lyc.ecole-ci.org/course/view.php?id=2444),
-- resource id 22674. Contenu réécrit à partir du PDF source (systèmes
-- d'administration coloniale, exploitation économique, résistances et
-- conséquences de la colonisation). Noms de sociétés (SCOA, CFAO), dates
-- et faits historiques réels repris tels quels (données factuelles).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-colonisation-resistances-ci',
  '1ere',
  'C',
  'histoire-geographie',
  $$La colonisation et les résistances en Côte d'Ivoire$$,
  13,
  '1ere-c-hg-h-resistances-conquetes-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En suivant un documentaire sur la colonisation française en Côte d'Ivoire, des élèves de 1ère découvrent, à travers des témoignages, que les populations ont vécu des moments extrêmement difficiles pendant l'occupation française. Voulant en savoir davantage, ils décident de mener des recherches pour décrire le système d'administration coloniale en Côte d'Ivoire, expliquer le processus colonial, et apprécier les résistances et les conséquences de la colonisation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les systèmes d'administration coloniale$$,
        'body', $$Deux systèmes coexistent en Afrique de l'Ouest. Les Anglais appliquent l'administration indirecte (« indirect rule », inventée par Lord Frederick Lugard) : les autorités traditionnelles africaines participent, aux côtés des Britanniques, à la gestion de la colonie (exemple : la Gold Coast). Les Français appliquent en Côte d'Ivoire l'administration directe (« direct rule ») : une structure pyramidale centralisée où l'autorité appartient exclusivement aux fonctionnaires français, du ministère des Colonies au gouverneur général, au gouverneur de la colonie, au commandant de cercle (l'homme clé du système), jusqu'au chef de subdivision, de canton et de village (simples auxiliaires d'exécution). Ce système débouche sur l'assimilation, qui vise à faire du colonisé un citoyen français soumis au code civil.$$,
        'highlights', array[$$anglais : administration indirecte (indirect rule) → autorités traditionnelles associées$$, $$français : administration directe (direct rule) → structure pyramidale centralisée + assimilation$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel rôle jouait le commandant de cercle dans l'administration coloniale française ?$$, 'solution', $$C'était l'« homme clé » du système : il dirigeait les forces militaires locales et exerçait l'autorité réelle dans son cercle, au-dessus des chefs de subdivision, de canton et de village.$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens d'exploitation de la colonie$$,
        'body', $$L'exploitation nécessite des infrastructures (routes, chemins de fer, wharfs pour l'embarquement, écoles pour former interprètes et auxiliaires), des moyens financiers (autofinancement des colonies via l'impôt de capitation, les taxes douanières et les emprunts — la métropole n'intervenant qu'en cas de nécessité) et de la main-d'œuvre (autochtones et étrangers africains, obtenue notamment par les travaux forcés : jusqu'à 12 jours de travail obligatoire et gratuit par an et par colonisé).$$,
        'highlights', array[$$infrastructures (routes, chemins de fer, wharfs, écoles) + financement (impôt de capitation) + main-d'œuvre (travaux forcés, jusqu'à 12 j/an)$$]::text[],
        'example', jsonb_build_object('statement', $$Qu'est-ce que l'impôt de capitation, et quel rôle jouait-il dans le financement de la colonie ?$$, 'solution', $$C'était une contribution obligatoire versée par les peuples colonisés au colonisateur ; il constituait, avec les taxes douanières et les emprunts, l'une des principales ressources permettant l'autofinancement de la colonie, sans intervention systématique de la métropole.$$),
        'fixation', jsonb_build_object('question', $$Combien de jours de travaux forcés un colonisé pouvait-il être obligé de fournir par an, selon la leçon ?$$, 'solution', $$Jusqu'à 12 jours de travail obligatoire et gratuit par an.$$)
      ),
      jsonb_build_object(
        'heading', $$Les domaines d'exploitation$$,
        'body', $$Dans le domaine agricole, une économie de traite initiale (caoutchouc sauvage, palmier à huile, bois) évolue vers une économie de plantation avec l'introduction du café (1881), du cacao (1882) et de la banane douce (1930), cultures d'exportation imposées vers la métropole. Dans le domaine commercial, de grandes sociétés européennes s'installent pour le commerce import-export : SCOA (Société Commerciale d'Afrique de l'Ouest), CFAO (Compagnie Française de l'Afrique de l'Ouest), CICA, SCA. Dans le domaine industriel, une industrie de type artisanal se développe (savonneries, huileries, textile), comme les Établissements Robert Gonfreville ou Blohorn.$$,
        'highlights', array[$$agricole : café (1881), cacao (1882), banane douce (1930)$$, $$commercial : SCOA, CFAO (import-export)$$, $$industriel : savonneries, huileries, textile (artisanal)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles trois cultures d'exportation ont été introduites par les Français en Côte d'Ivoire, et à quelles dates ?$$, 'solution', $$Le café (1881), le cacao (1882) et la banane douce (1930).$$)
      ),
      jsonb_build_object(
        'heading', $$Les résistances et les conséquences de la colonisation$$,
        'body', $$Les abus coloniaux (travaux forcés, injustices, prix inégaux, exploitation abusive) provoquent des résistances : boycott des produits européens, refus de vendre aux Européens, refus d'utiliser la monnaie coloniale, grèves sur les grands chantiers, journées de marche, destruction de voies ferroviaires, voire assassinats de colons. La colonisation entraîne d'importantes conséquences : perte du pouvoir des chefs traditionnels et de l'indépendance politique, introduction de nouvelles cultures, apparition d'une bourgeoisie agricole, développement de l'urbanisation et des infrastructures socioéducatives, et naissance de nouvelles classes sociales (blancs, métis, indigènes, intellectuels, « évolués », interprètes, leaders politiques).$$,
        'highlights', array[$$résistances : boycott, grèves, marches, sabotage de voies ferrées$$, $$conséquences : perte de souveraineté des chefs + nouvelles cultures + urbanisation + nouvelles classes sociales$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux formes de résistance pacifique des populations face aux abus coloniaux.$$, 'solution', $$Deux parmi : le boycott des produits européens, le refus de vendre les produits agricoles aux Européens, le refus d'utiliser la monnaie coloniale, les grèves, les journées de marche contre les pratiques coloniales.$$),
        'fixation', jsonb_build_object('question', $$Cite deux nouvelles classes sociales apparues avec la colonisation en Côte d'Ivoire.$$, 'solution', $$Deux parmi : les blancs, les métis, les indigènes, les intellectuels, les leaders politiques, les « évolués », les interprètes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Accompagné de camarades de classe, tu assistes aux festivités de la commémoration de l'indépendance ivoirienne, le 7 août, à la préfecture. Le préfet affirme que ce jour rappelle la fin d'une ère de souffrance débutée avec la création de la colonie de Côte d'Ivoire, le 10 mars 1893. Un voisin dans la foule murmure : « Ce sont ces mêmes ancêtres qui ont facilité la colonisation. » Tu réponds que « des populations ivoiriennes ont cependant opposé à la colonisation une résistance multiforme ».$$,
      'questions', array[
        $$Dis de quoi il est question dans cette situation.$$,
        $$Explique le passage : « des populations ivoiriennes ont cependant opposé à la colonisation une résistance multiforme ».$$,
        $$Partages-tu l'avis de celui qui affirme : « ce sont ces mêmes ancêtres qui ont facilité la colonisation » ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la différence entre l'« indirect rule » anglaise et le « direct rule » français ?$$,
      'hint', $$L'une associe les chefs traditionnels, l'autre centralise l'autorité française.$$,
      'expected', $$L'indirect rule associe les autorités traditionnelles africaines à la gestion de la colonie aux côtés des Britanniques ; le direct rule concentre toute l'autorité entre les mains des fonctionnaires français, les auxiliaires africains n'étant chargés que d'exécuter les ordres.$$
    ),
    jsonb_build_object(
      'question', $$Quelles étaient les trois principales sources de financement de la colonie ivoirienne ?$$,
      'hint', $$L'une est un impôt direct sur les personnes.$$,
      'expected', $$L'impôt de capitation, les taxes douanières et les emprunts.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux grandes sociétés commerciales européennes installées en Côte d'Ivoire pendant la colonisation.$$,
      'hint', $$Elles pratiquaient l'import-export.$$,
      'expected', $$Deux parmi : la SCOA, la CFAO, la CICA, la SCA.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conséquences sociales de la colonisation sur la société ivoirienne.$$,
      'hint', $$Elles concernent le pouvoir des chefs ou la structure sociale.$$,
      'expected', $$Deux parmi : la perte du pouvoir des chefs traditionnels, la naissance de nouvelles classes sociales, le développement de l'urbanisation, l'apparition d'une bourgeoisie agricole.$$
    )
  ),
  now()
);
