-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 1998: "1ère_GEOGRAPHIE_T3_L1: L'ORGANISATION
-- ADMINISTRATIVE DE LA CÔTE D'IVOIRE"
-- (https://lyc.ecole-ci.org/course/view.php?id=1998), resource id 17438.
-- Contenu réécrit à partir du PDF source (déconcentration, décentralisation,
-- insuffisances de l'organisation administrative ivoirienne). Chiffres et
-- textes juridiques réels (nombre de districts/régions/départements/
-- sous-préfectures/communes, décrets et ordonnances citées) repris tels
-- quels (données factuelles) ; explications reformulées, non copiées
-- verbatim. La citation de René Dégni-Ségui (Document 1 du PDF, ouvrage
-- sous droits d'auteur) n'est pas reprise ; son contenu factuel (rôle
-- protocolaire/politique/administratif du préfet) est reformulé dans le
-- corps du cours.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-organisation-administrative-ci',
  '1ere',
  'A',
  'histoire-geographie',
  $$L'organisation administrative de la Côte d'Ivoire$$,
  5,
  '1ere-a-hg-geo-urbanisation-pays-developpes-france',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une discussion sur l'organisation de l'administration en Côte d'Ivoire, deux opinions s'opposent. Le groupe d'Aya soutient que la politique de déconcentration administrative a montré son efficacité et a été un apport important au développement économique et social du pays. Le groupe de Silué affirme au contraire que la déconcentration a montré ses limites et qu'il faut évoluer vers une véritable décentralisation pour plus d'efficacité. Pour les départager, la classe décide de définir l'organisation administrative, d'en comprendre le fonctionnement et d'apprécier la politique administrative en Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La déconcentration administrative$$,
        'body', $$La déconcentration est une technique d'organisation du territoire qui transfère une partie du pouvoir central à des agents de l'État nommés et répartis sur tout le territoire ; ceux-ci exercent un pouvoir délégué. Depuis le décret n°2011-263 du 28 septembre 2011 et la loi n°2014-451 du 5 août 2014, l'administration territoriale déconcentrée s'organise en circonscriptions hiérarchisées : districts, régions, départements, sous-préfectures et villages. Cette politique vise à rapprocher l'administration des populations, alléger les tâches du pouvoir central, diffuser ses décisions, et impulser un développement équilibré du territoire.$$,
        'highlights', array[$$déconcentration = délégation de pouvoir à des agents nommés$$, $$district > région > département > sous-préfecture > village$$]::text[],
        'property', jsonb_build_object('label', $$Chiffres clés (déconcentration)$$, 'text', $$12 districts (dont seulement 2 autonomes fonctionnels : Abidjan et Yamoussoukro), 31 régions, 108 départements, 509 sous-préfectures.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les cinq échelons de la déconcentration administrative ivoirienne, du plus grand au plus petit ?$$, 'solution', $$Le district, la région, le département, la sous-préfecture et le village.$$)
      ),
      jsonb_build_object(
        'heading', $$Le fonctionnement des structures déconcentrées$$,
        'body', $$Le district regroupe plusieurs régions dont l'une est le chef-lieu. La région, dirigée par un préfet de région, est l'échelon de conception et de coordination des actions de développement, regroupant plusieurs départements. Le département, administré par un préfet, sert de relais entre la région et la sous-préfecture. La sous-préfecture, administrée par un sous-préfet sous l'autorité du préfet, supervise les chefs de village. Le village, cellule de base de l'administration, est dirigé par un chef assisté d'un conseil de village, investi par arrêté préfectoral qui en fait un auxiliaire de l'administration.$$,
        'highlights', array[$$région → préfet de région ; département → préfet$$, $$sous-préfecture → sous-préfet ; village → chef de village$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle autorité administre le département, et de quelle autorité relève-t-elle ?$$, 'solution', $$Le département est administré par un préfet, qui exerce sous l'autorité hiérarchique du pouvoir central (via le ministère de l'intérieur), le préfet étant lui-même le représentant direct du chef de l'État et des ministres dans sa circonscription.$$),
        'fixation', jsonb_build_object('question', $$Qui contrôle et supervise l'action des chefs de village au sein d'une sous-préfecture ?$$, 'solution', $$Le sous-préfet, qui agit lui-même sous l'autorité du préfet.$$)
      ),
      jsonb_build_object(
        'heading', $$La décentralisation administrative$$,
        'body', $$La décentralisation est un processus d'aménagement de l'État unitaire qui transfère des compétences administratives de l'État vers des collectivités locales distinctes de lui, dotées de la personnalité juridique et d'organes de décision autonomes, mais placées sous le contrôle du pouvoir central (tutelle du ministère en charge de la décentralisation). Depuis la loi n°2012-1128 du 13 décembre 2012 et la loi n°2014-451 du 5 août 2014, l'administration décentralisée s'organise en collectivités territoriales : les régions et les communes (204 communes), administrées par des élus. Ses objectifs sont l'organisation de la vie collective locale, la participation des populations à la gestion des affaires locales, et la lutte contre les disparités régionales.$$,
        'highlights', array[$$décentralisation = transfert de compétences à des élus$$, $$collectivités territoriales : région + commune (204)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence essentielle entre une circonscription déconcentrée et une collectivité territoriale décentralisée ?$$, 'solution', $$La circonscription déconcentrée est dirigée par un agent nommé exerçant un pouvoir délégué de l'État, tandis que la collectivité territoriale décentralisée est dirigée par des élus, dotée de personnalité juridique et d'autonomie financière propres.$$)
      ),
      jsonb_build_object(
        'heading', $$Les organes des collectivités territoriales$$,
        'body', $$La commune, regroupement de quartiers ou de villages, comprend un conseil municipal (organe de délibération, élu au suffrage indirect, qui adopte le budget), un maire (organe d'exécution, qui gère l'état civil et l'administration quotidienne) et une municipalité (bureau formé du maire et de ses adjoints). Ses ressources proviennent des recettes propres (impôts fonciers, patentes, taxes) et de ressources additionnelles (subventions et dons de l'État). La région dispose d'un conseil régional (organe délibérant), d'un bureau du conseil régional, d'un président (qui gère la région au quotidien) et d'un comité économique et social régional (organe consultatif).$$,
        'highlights', array[$$commune : conseil municipal, maire, municipalité$$, $$région : conseil régional, bureau, président, comité éco-social$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Collectivité$$, $$Organe délibérant$$, $$Organe exécutif$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array('Commune', 'Conseil municipal', 'Maire / municipalité'),
            jsonb_build_array('Région', 'Conseil régional', 'Président du conseil régional / bureau')
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux principales sources de financement d'une commune ivoirienne ?$$, 'solution', $$Les ressources propres (impôts, patentes, taxes, timbres fiscaux) et les ressources additionnelles (subventions de l'État, aides, dons, prêts bancaires).$$)
      ),
      jsonb_build_object(
        'heading', $$Les insuffisances de l'organisation administrative$$,
        'body', $$La déconcentration souffre de la persistance des disparités régionales, de la non-fonctionnalité de certaines sous-préfectures, d'un découpage administratif déséquilibré et d'une présence encore faible de l'État dans la gestion du foncier et de la sécurité. La décentralisation, elle, souffre de la non-limitation des mandats des élus locaux (freinant le renouvellement de la classe politique), du cumul des postes (un élu peut être à la fois député, maire et ministre), de la lenteur du transfert réel des compétences, et de la faible participation des jeunes, des femmes et des médias au développement local.$$,
        'highlights', array[$$déconcentration : disparités régionales persistantes$$, $$décentralisation : cumul de postes, lenteur des transferts$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite une insuffisance propre à la décentralisation administrative liée au comportement des élus locaux.$$, 'solution', $$Le cumul des postes (un même élu peut être député, maire, président de conseil régional et ministre à la fois), ce qui limite sa disponibilité réelle pour chaque fonction — également valable : la non-limitation du nombre de mandats.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un reportage sur la fête nationale du 7 août dans la ville de Man, un journaliste explique que le mode de désignation des autorités déconcentrées diffère de celui des autorités décentralisées, puis invite les populations à cultiver le civisme fiscal car l'impôt est la source essentielle de financement des collectivités territoriales.$$,
      'questions', array[
        $$Dégage l'idée générale de cette situation.$$,
        $$Explique le passage : « le mode de désignation des autorités déconcentrées diffère de celui des autorités décentralisées ».$$,
        $$Partages-tu le point de vue du journaliste selon lequel l'impôt est la source essentielle de financement des collectivités territoriales ? Justifie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de districts la Côte d'Ivoire compte-t-elle, et combien sont réellement fonctionnels ?$$,
      'hint', $$Un chiffre officiel et un chiffre « réel » sont donnés dans le cours.$$,
      'expected', $$12 districts au total, mais seulement 2 sont fonctionnels : Abidjan et Yamoussoukro.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux seules collectivités territoriales décentralisées en Côte d'Ivoire ?$$,
      'hint', $$Elles sont administrées par des élus.$$,
      'expected', $$La région et la commune.$$
    ),
    jsonb_build_object(
      'question', $$Qui dirige la municipalité au quotidien ?$$,
      'hint', $$C'est l'organe d'exécution de la commune.$$,
      'expected', $$Le maire, aidé de ses adjoints.$$
    ),
    jsonb_build_object(
      'question', $$Cite une insuffisance de la déconcentration administrative en Côte d'Ivoire.$$,
      'hint', $$Pense aux inégalités entre régions.$$,
      'expected', $$Par exemple la persistance des disparités régionales (également valables : la non-fonctionnalité de certaines sous-préfectures, le déséquilibre du découpage administratif).$$
    )
  ),
  now()
);
