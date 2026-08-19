-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 945: "1ère G6-L'Aménagement du territoire Ivoirien"
-- (https://lyc.ecole-ci.org/course/view.php?id=945), resource id 4977.
-- Contenu réécrit à partir du PDF source (objectifs, opérations
-- agro-industrielles, aménagement régional intégré ARSO/AVB/PSN,
-- financement par l'impôt, impact sur la population). Dates et chiffres
-- réels (créations de sociétés d'État, taux d'imposition) repris tels
-- quels (données factuelles, non protégées) ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-amenagement-territoire-ivoirien',
  '1ere',
  'C',
  'histoire-geographie',
  $$L'aménagement du territoire ivoirien$$,
  6,
  '1ere-c-hg-geo-organisation-administrative-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En suivant un documentaire à la télé, tes camarades de classe et toi apprenez que le port de San-Pedro a été créé dans le cadre du projet ARSO (Aménagement de la Région du Sud-Ouest). Intéressés, vous entreprenez des recherches pour connaître l'évolution de l'aménagement du territoire ivoirien, comprendre les différentes politiques mises en place et leurs impacts sur la population, et apprécier le rôle joué par l'impôt.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les objectifs de l'aménagement du territoire$$,
        'body', $$Aménager le territoire consiste à le transformer en vue de réaliser des infrastructures économiques et sociales au bénéfice de la population. Cette politique répond à trois types d'objectifs : économiques (mettre en valeur les ressources du pays, créer des richesses, équiper le territoire en infrastructures) ; politiques (asseoir la souveraineté de l'État, lutter contre l'instabilité politique) ; et sociaux (lutter contre la pauvreté, corriger les déséquilibres régionaux, améliorer les conditions de vie du monde rural et réaliser l'unité nationale).$$,
        'highlights', array[$$aménagement du territoire = transformation du territoire pour des infrastructures économiques et sociales$$, $$3 objectifs : économiques, politiques, sociaux$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un objectif économique et un objectif social de l'aménagement du territoire.$$, 'solution', $$Objectif économique : mettre en valeur les ressources du pays / créer des richesses / équiper le territoire en infrastructures (un au choix). Objectif social : lutter contre la pauvreté / corriger les déséquilibres régionaux / améliorer les conditions de vie du monde rural (un au choix).$$)
      ),
      jsonb_build_object(
        'heading', $$Les opérations agro-industrielles$$,
        'body', $$De l'indépendance à 1970, l'État valorise les produits agricoles disponibles via de grandes sociétés publiques créant des plantations géantes (hévéa, coco, ananas, banane douce, palmier à huile) associées à des usines de traitement, concentrées à Abidjan et dans les régions forestières ; les plantations paysannes de café et de cacao bénéficient d'une aide technique et sociale. De 1970 à la fin des années 1980, l'accent se déplace vers les régions de savane, sans pour autant freiner le développement du Sud : lancement du Plan Sucrier du Nord (PSN, 1974) pour la canne à sucre, intensification du coton paysan grâce à la Compagnie Ivoirienne pour le Développement du Textile (CIDT), développement de la riziculture irriguée (centre pilote : Odienné) et du plan anacarde.$$,
        'highlights', array[$$1960-1970 : plantations géantes (hévéa, palmier, ananas...) concentrées au Sud$$, $$1970-1980s : PSN (canne à sucre), CIDT (coton), riziculture irriguée, plan anacarde → régions de savane$$]::text[],
        'example', jsonb_build_object('statement', $$Quel organisme a assuré l'encadrement technique et commercial de la culture paysanne du coton en Côte d'Ivoire ?$$, 'solution', $$La Compagnie Ivoirienne pour le Développement du Textile (CIDT).$$),
        'fixation', jsonb_build_object('question', $$Que signifie le sigle PSN et quand a-t-il été lancé ?$$, 'solution', $$Le Plan Sucrier du Nord, lancé à partir de 1974 (le plan sucrier global dès 1971), pour développer les plantations de canne à sucre et construire des complexes sucriers.$$)
      ),
      jsonb_build_object(
        'heading', $$Les opérations d'aménagement régional intégré$$,
        'body', $$Dès 1960, la politique des fêtes tournantes (une fois tous les deux ans, dans une ville de l'intérieur) visait à doter certaines agglomérations de nouvelles infrastructures ; elle a été interrompue en 1981 par la crise économique. Le 22 décembre 1969, l'État crée l'ARSO (Aménagement de la Région du Sud-Ouest, couvrant San-Pedro, Sassandra, Taï, Guiglo, Grand-Béréby, Tabou, Fresco) avec un double objectif de conception (plan d'aménagement) et d'exécution (opérations immobilières, plantations agro-industrielles, voirie). Le 8 juillet 1969, l'AVB (Aménagement de la Vallée du Bandama), dissoute au début des années 1980, aménage les eaux du Bandama (habitats, ouvrages hydroélectriques, déplacement de populations vers des sites de recasement) et développe l'agriculture, l'élevage, la pêche et l'urbanisation de la région.$$,
        'highlights', array[$$fêtes tournantes (dès 1960, interrompues en 1981) : infrastructures dans les villes de l'intérieur$$, $$ARSO (22/12/1969) : Sud-Ouest, port de San-Pedro$$, $$AVB (08/07/1969) : Vallée du Bandama, barrages hydroélectriques$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel double objectif poursuivait l'ARSO dans le Sud-Ouest ivoirien ?$$, 'solution', $$Un objectif de conception (étudier un plan d'aménagement et un programme de développement de la région) et un objectif d'exécution (opérations immobilières, équipements de terrain, plantations agro-industrielles, développement de la voirie).$$)
      ),
      jsonb_build_object(
        'heading', $$Le financement par l'impôt et l'impact sur la population$$,
        'body', $$Le financement de l'aménagement du territoire repose principalement sur l'impôt : la TVA (12% des recettes fiscales), les impôts sur les revenus et salaires (15,2%), les impôts sur les entreprises (10,2%) et d'autres taxes (droits d'importation, d'enregistrement, de timbres), auxquels s'ajoutent les capitaux privés étrangers. Cette politique a permis la construction d'habitats modernes, d'équipements collectifs (écoles, dispensaires, marchés, routes), la transformation de nombreux villages et villes du Nord autour des complexes sucriers et des centres CIDT, ainsi que la diversification des revenus des populations paysannes grâce aux nouvelles cultures.$$,
        'highlights', array[$$financement : impôts (TVA 12%, revenus/salaires 15,2%, entreprises 10,2%) + capitaux privés étrangers$$, $$impact : habitats modernes, équipements collectifs, revenus paysans diversifiés$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle part des recettes fiscales représente la TVA en Côte d'Ivoire ?$$, 'solution', $$12%.$$),
        'fixation', jsonb_build_object('question', $$Outre l'impôt, quelle autre source de financement participe à l'aménagement du territoire ivoirien ?$$, 'solution', $$Les capitaux privés étrangers, qui accompagnent l'État dans le financement des projets.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En suivant la RTI1, tu apprends à travers un reportage que l'aménagement du territoire constitue une préoccupation permanente pour le gouvernement ivoirien. Le journaliste explique que la politique mise en place pour réaliser cet aménagement s'est adaptée à la conjoncture, en prenant en compte les grandes régions du pays, et que son coût est très élevé. Cette politique d'aménagement s'est faite progressivement et selon les priorités du moment.$$,
      'questions', array[
        $$Définis l'aménagement du territoire.$$,
        $$Cite les grandes phases de l'aménagement du territoire ivoirien, de l'indépendance aux années 1980.$$,
        $$Montre, avec des détails, la manière dont l'État procède au financement des projets d'aménagement du territoire ivoirien.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois types d'objectifs de la politique d'aménagement du territoire ?$$,
      'hint', $$Ils couvrent l'économie, la politique et la société.$$,
      'expected', $$Les objectifs économiques, politiques et sociaux.$$
    ),
    jsonb_build_object(
      'question', $$Quelle société d'État a été créée le 22 décembre 1969 pour aménager le Sud-Ouest ivoirien ?$$,
      'hint', $$Son sigle est lié au nom de la région concernée.$$,
      'expected', $$L'ARSO (Aménagement de la Région du Sud-Ouest).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la politique des fêtes tournantes a-t-elle été interrompue en 1981 ?$$,
      'hint', $$C'est lié à un contexte économique difficile.$$,
      'expected', $$À cause de la crise économique que la Côte d'Ivoire a connue en 1980.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux types d'impôts qui financent l'aménagement du territoire ivoirien.$$,
      'hint', $$Ils touchent la consommation, les revenus ou les entreprises.$$,
      'expected', $$Deux parmi : la TVA, les impôts sur les revenus et salaires, les impôts sur les entreprises, les droits et taxes à l'importation, les droits d'enregistrement et de timbres.$$
    )
  ),
  now()
);
