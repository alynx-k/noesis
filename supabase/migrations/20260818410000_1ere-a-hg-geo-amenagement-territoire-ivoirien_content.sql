-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 1997: "1ère_GEOGRAPHIE_T3_L2: L'AMENAGEMENT DU TERRITOIRE
-- IVOIRIEN" (https://lyc.ecole-ci.org/course/view.php?id=1997), resource id
-- 17426. Contenu réécrit à partir du PDF source (objectifs, phases
-- historiques ARSO/AVB/PSN, financement et impact de l'aménagement du
-- territoire ivoirien). Chiffres, dates, sigles et faits réels (taux
-- d'impôts, dates de création des sociétés d'État) repris tels quels
-- (données factuelles) ; explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-amenagement-territoire-ivoirien',
  '1ere',
  'A',
  'histoire-geographie',
  $$L'aménagement du territoire ivoirien$$,
  6,
  '1ere-a-hg-geo-organisation-administrative-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En suivant un documentaire à la télévision, des élèves de 1ère A apprennent que le port de San-Pedro a été créé dans le cadre du projet ARSO (Aménagement de la Région du Sud-Ouest). Intéressés par ce sujet, ils décident de mener des recherches pour connaître l'évolution de l'aménagement du territoire ivoirien, comprendre les différentes politiques mises en place et leurs impacts sur la population, et apprécier le rôle joué par l'impôt dans leur financement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les objectifs de l'aménagement du territoire$$,
        'body', $$Aménager le territoire consiste à transformer l'espace pour y réaliser des infrastructures économiques et sociales au bénéfice de la population. Au lendemain de l'indépendance, cette politique répond à trois types d'objectifs : économiques (mettre en valeur les ressources du pays, créer des richesses, équiper le territoire en infrastructures) ; politiques (asseoir la souveraineté de l'État, lutter contre l'instabilité politique) ; et sociaux (lutter contre la pauvreté, corriger les déséquilibres régionaux, améliorer les conditions de vie du monde rural et réaliser l'unité nationale).$$,
        'highlights', array[$$objectifs économiques, politiques et sociaux$$, $$correction des déséquilibres régionaux$$]::text[],
        'fixation', jsonb_build_object('question', $$À quel type d'objectif appartient la lutte contre l'instabilité politique dans la politique d'aménagement du territoire ?$$, 'solution', $$Un objectif politique.$$)
      ),
      jsonb_build_object(
        'heading', $$Les opérations agro-industrielles (1960-fin des années 80)$$,
        'body', $$Juste après l'indépendance (jusqu'en 1970), l'État crée de grandes sociétés qui développent des plantations géantes (hévéa, café, cacao, palmier à huile), concentrées surtout à Abidjan et dans les régions forestières. De 1970 à la fin des années 80, l'accent se déplace vers les régions de savane sans freiner le Sud : lancement du plan sucrier en 1971 (avec le PSN, Plan Sucrier du Nord, à partir de 1974), intensification de la culture du coton encadrée par la CIDT (Compagnie Ivoirienne pour le Développement du Textile), développement de la riziculture irriguée (centre pilote : Odienné) et du plan anacarde.$$,
        'highlights', array[$$1960-1970 : plantations géantes (Sud/forêt)$$, $$1970-1980 : plan sucrier (PSN), coton (CIDT)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel organisme a encadré l'intensification de la culture paysanne du coton en Côte d'Ivoire ?$$, 'solution', $$La Compagnie Ivoirienne pour le Développement du Textile (CIDT).$$)
      ),
      jsonb_build_object(
        'heading', $$Les opérations d'aménagement régional intégré$$,
        'body', $$Dès 1960, l'État lance une politique de fêtes nationales tournantes, organisées tous les deux ans dans les villes de l'intérieur pour les doter de nouvelles infrastructures ; cette politique est interrompue en 1981 avec la crise économique. Le 22 décembre 1969 est créée l'ARSO (Aménagement de la Région du Sud-Ouest), couvrant San-Pedro, Sassandra et les localités voisines, avec un double objectif de conception (plan d'aménagement) et d'exécution (logements, équipements, plantations agro-industrielles, voirie). Le 8 juillet 1969 est créée l'AVB (Aménagement de la Vallée du Bandama, dissoute au début des années 80), chargée d'aménager les eaux du Bandama (habitats, barrages hydroélectriques, déplacement de populations) et de développer l'agriculture, l'élevage, la pêche et l'urbanisation du Centre.$$,
        'highlights', array[$$fêtes tournantes : 1960-1981$$, $$ARSO (22/12/1969) : Sud-Ouest$$, $$AVB (08/07/1969) : Vallée du Bandama$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Projet$$, $$Région concernée$$, $$Principales réalisations$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array('ARSO (1969)', 'Région du Sud-Ouest', 'Aménagement urbain et portuaire de San-Pedro, plantations agro-industrielles'),
            jsonb_build_array('AVB (1969)', 'Vallée du Bandama (Centre)', 'Barrages hydroélectriques, recasement des populations'),
            jsonb_build_array('PSN (1974)', 'Région des Savanes (Nord)', 'Complexes sucriers')
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi la construction des barrages de l'AVB a-t-elle nécessité le déplacement de populations ?$$, 'solution', $$Parce que la mise en eau de la vallée du Bandama pour la construction des ouvrages hydroélectriques a submergé certaines zones habitées, obligeant l'État à recaser les populations concernées sur de nouveaux sites.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi la politique des fêtes tournantes a-t-elle été interrompue en 1981 ?$$, 'solution', $$À cause de la crise économique que traversait la Côte d'Ivoire à cette période.$$)
      ),
      jsonb_build_object(
        'heading', $$Le financement par l'impôt et l'impact sur la population$$,
        'body', $$Le financement de l'aménagement du territoire repose largement sur l'impôt : la TVA représente 12% des recettes, les impôts sur les revenus et salaires 15,2%, les impôts sur les entreprises 10,2%, auxquels s'ajoutent taxes intérieures, droits de douane et d'enregistrement. Les capitaux privés étrangers complètent ce financement. Cette politique a permis la construction de logements modernes, d'équipements collectifs (écoles, dispensaires, marchés, routes), la transformation de nombreuses localités du Nord autour des complexes sucriers et des centres de la CIDT, ainsi que la diversification des revenus des populations paysannes grâce aux nouvelles cultures.$$,
        'highlights', array[$$TVA 12%, impôts revenus/salaires 15,2%, entreprises 10,2%$$, $$+ capitaux privés étrangers$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux impacts positifs de l'aménagement du territoire sur la population ivoirienne.$$, 'solution', $$La construction d'équipements collectifs (écoles, dispensaires, routes) et la diversification des revenus des populations paysannes grâce aux nouvelles cultures — également valable : la transformation des localités du Nord.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un document du Ministère du Plan explique : « La prise de conscience des contrastes flagrants entre les différentes régions du pays a conduit les autorités à initier un ensemble de programmes de développement pour lutter contre les disparités régionales. Ainsi l'opération de l'aménagement de la Vallée du Bandama (AVB) a permis d'amorcer le développement du centre. Le projet ARSO, fondé sur l'aménagement urbain et portuaire de San Pedro, a créé une dynamique démographique et urbaine sans précédent dans le sud-ouest. » Plus loin : « l'approche publique des pratiques d'aménagement a exclu les forces sociales locales au profit de la seule intervention du pouvoir central, aussi bien dans la conception que dans la mise en œuvre des projets. »$$,
      'questions', array[
        $$Donne l'idée générale de cette situation.$$,
        $$Explique le passage : « le projet ARSO, fondé sur l'aménagement urbain et portuaire de San Pedro, a créé une dynamique démographique et urbaine sans précédent dans le sud-ouest ».$$,
        $$Partages-tu l'idée selon laquelle l'approche publique de l'aménagement a exclu les forces sociales locales au profit du seul pouvoir central ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$En quelle année l'ARSO a-t-elle été créée, et quelle région couvre-t-elle ?$$,
      'hint', $$C'est la société d'aménagement du Sud-Ouest.$$,
      'expected', $$Le 22 décembre 1969 ; elle couvre San-Pedro, Sassandra et les localités voisines (Taï, Guiglo, Grand-Béréby, Tabou, Fresco).$$
    ),
    jsonb_build_object(
      'question', $$Quel sigle désigne l'organisme chargé de l'aménagement de la Vallée du Bandama ?$$,
      'hint', $$Trois lettres.$$,
      'expected', $$L'AVB (Aménagement de la Vallée du Bandama).$$
    ),
    jsonb_build_object(
      'question', $$Quelle culture le Plan Sucrier du Nord (PSN, à partir de 1974) visait-il à développer ?$$,
      'hint', $$C'est une plante dont on extrait un produit sucré.$$,
      'expected', $$La canne à sucre.$$
    ),
    jsonb_build_object(
      'question', $$Quel impôt représente la plus grande part du financement de l'aménagement du territoire selon le cours : la TVA ou l'impôt sur les entreprises ?$$,
      'hint', $$Compare 12% et 10,2%.$$,
      'expected', $$La TVA (12%, contre 10,2% pour l'impôt sur les entreprises).$$
    )
  ),
  now()
);
