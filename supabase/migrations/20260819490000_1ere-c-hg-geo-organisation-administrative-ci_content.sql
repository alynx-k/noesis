-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 946: "1ère G5-L'organisation administrative de la Côte
-- d'Ivoire" (https://lyc.ecole-ci.org/course/view.php?id=946), resource
-- id 4989. Contenu réécrit à partir du PDF source (déconcentration,
-- décentralisation, structures administratives, insuffisances). Textes
-- légaux réels (décrets et lois ivoiriens, avec numéros et dates) et
-- chiffres administratifs officiels repris tels quels (données
-- factuelles, non protégées) ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-organisation-administrative-ci',
  '1ere',
  'C',
  'histoire-geographie',
  $$L'organisation administrative de la Côte d'Ivoire$$,
  5,
  '1ere-c-hg-geo-urbanisation-pays-developpes-france',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une discussion sur l'organisation de l'administration en Côte d'Ivoire, deux opinions s'opposent. Le groupe d'Aya soutient : « La politique de déconcentration administrative en Côte d'Ivoire a montré son efficacité et a été d'un apport important dans le développement économique et social du pays. » Le groupe de Silué affirme : « La déconcentration a montré ses limites et il faut évoluer vers une véritable décentralisation pour plus d'efficacité. » Pour vous départager, vous décidez de faire des recherches pour définir l'organisation administrative, comprendre son fonctionnement et apprécier la politique administrative en Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La déconcentration administrative$$,
        'body', $$La déconcentration administrative est une technique d'organisation du territoire qui transfère une partie du pouvoir central à des agents de l'État nommés et répartis sur le territoire, exerçant un pouvoir délégué. Selon le décret n° 2011-263 et la loi n°2014-451, l'administration territoriale déconcentrée s'organise en circonscriptions hiérarchisées : districts, régions, départements, sous-préfectures et villages. Ses objectifs sont de rapprocher l'administration des populations, d'alléger les tâches du pouvoir central, de diffuser ses décisions, de traiter équitablement les problèmes régionaux et de réaliser des infrastructures pour un développement équilibré du territoire.$$,
        'highlights', array[$$déconcentration = transfert de pouvoir à des agents nommés$$, $$5 échelons : district, région, département, sous-préfecture, village$$]::text[],
        'property', jsonb_build_object('label', $$Chiffres clés$$, 'text', $$La Côte d'Ivoire compte 12 districts (dont seuls Abidjan et Yamoussoukro sont autonomes et fonctionnels), 31 régions, 108 départements et 509 sous-préfectures.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les cinq échelons de la déconcentration administrative en Côte d'Ivoire, du plus grand au plus petit ?$$, 'solution', $$Le district, la région, le département, la sous-préfecture, le village.$$)
      ),
      jsonb_build_object(
        'heading', $$La décentralisation administrative$$,
        'body', $$La décentralisation est un processus qui transfère des compétences administratives de l'État vers des collectivités territoriales distinctes de lui, dotées de la personnalité juridique et d'organes de décision autonomes (élus), mais placées sous le contrôle du pouvoir central. Depuis la loi n°2012-1128 et la loi n°2014-451, les seules collectivités territoriales décentralisées sont la région et la commune. Ses objectifs : organiser la vie collective locale, faire participer les populations à la gestion des affaires locales, moderniser le monde rural, améliorer le cadre de vie et lutter contre les disparités régionales.$$,
        'highlights', array[$$décentralisation = transfert de compétences à des élus locaux autonomes$$, $$2 collectivités territoriales : région et commune (204 communes en Côte d'Ivoire)$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la différence essentielle entre une autorité déconcentrée (comme un préfet) et une autorité décentralisée (comme un maire) ?$$, 'solution', $$Le préfet est un agent de l'État nommé, qui exerce un pouvoir délégué par le pouvoir central. Le maire est un élu local, à la tête d'une collectivité territoriale dotée de personnalité juridique et d'autonomie financière, même si elle reste sous le contrôle de l'État.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les seules collectivités territoriales décentralisées en Côte d'Ivoire ?$$, 'solution', $$La région et la commune.$$)
      ),
      jsonb_build_object(
        'heading', $$Le fonctionnement des collectivités territoriales$$,
        'body', $$La commune est administrée par trois organes : le conseil municipal (organe de délibération, élu au suffrage indirect, adopte le budget), le maire (organe d'exécution, chargé de l'administration quotidienne et de l'état civil) et la municipalité (bureau formé du maire et de ses adjoints). Ses ressources sont propres (impôts fonciers, patentes, taxes) ou additionnelles (subventions de l'État, dons, prêts). La région dispose du conseil régional (organe délibérant), du bureau du conseil régional, du président du conseil régional (premier responsable, ordonnateur des recettes et dépenses) et d'un comité économique et social régional consultatif.$$,
        'highlights', array[$$commune : conseil municipal (délibère) + maire (exécute) + municipalité$$, $$région : conseil régional + bureau + président + comité économique et social (consultatif)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le rôle du maire dans la commune ?$$, 'solution', $$Il est l'organe d'exécution : il administre la commune au quotidien, exécute les délibérations du conseil municipal, ordonne les recettes et dépenses, et assure l'état civil.$$)
      ),
      jsonb_build_object(
        'heading', $$Les insuffisances de l'organisation administrative$$,
        'body', $$La déconcentration présente encore des insuffisances : persistance des disparités régionales, non-fonctionnalité de certaines sous-préfectures, déséquilibre du découpage administratif, faible présence de l'État sur le foncier et la sécurité. La décentralisation en connaît aussi : absence de limitation des mandats des élus locaux (immobilisme), cumul des postes (maire-député-ministre), lenteur du transfert effectif des compétences (conflits entre entités), faible participation des jeunes et des femmes, absence de contrôle citoyen, et difficultés de l'État à honorer ses engagements financiers envers les collectivités.$$,
        'highlights', array[$$insuffisances déconcentration : disparités régionales, sous-préfectures non fonctionnelles$$, $$insuffisances décentralisation : mandats illimités, cumul des postes, transfert lent des compétences$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le cumul des postes (être à la fois maire, député et ministre) est-il considéré comme une insuffisance de la décentralisation ?$$, 'solution', $$Parce qu'un élu cumulant plusieurs fonctions ne peut consacrer une disponibilité réelle à chacune, ce qui nuit à l'efficacité de la gestion locale.$$),
        'fixation', jsonb_build_object('question', $$Cite deux insuffisances de la déconcentration administrative en Côte d'Ivoire.$$, 'solution', $$Deux parmi : la persistance des disparités régionales, la non-fonctionnalité de certaines sous-préfectures, le déséquilibre du découpage administratif, la faible présence de l'État sur le foncier et la sécurité.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un conseil des ministres, le président ivoirien a annoncé la création de 12 nouveaux districts autonomes qui, selon lui, permettront d'assurer le développement local et de réduire les déséquilibres régionaux, en déclarant : « L'objectif est de renforcer le maillage territorial. Nous voulons aller plus loin pour que l'ensemble du territoire national puisse avoir des districts, des ressources affectées, transférées et que tous les projets soient suivis, exécutés. »$$,
      'questions', array[
        $$Dis de quoi il s'agit dans ce texte.$$,
        $$Explique le passage : « L'objectif est de renforcer le maillage territorial. »$$,
        $$Es-tu d'accord avec l'affirmation selon laquelle les districts permettront d'assurer le développement local et de réduire les déséquilibres régionaux ? Justifie ta réponse à partir des insuffisances de la déconcentration étudiées dans la leçon.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la déconcentration administrative ?$$,
      'hint', $$Elle concerne des agents nommés, pas des élus.$$,
      'expected', $$Une technique qui transfère une partie du pouvoir central à des agents de l'État nommés et répartis sur le territoire, exerçant un pouvoir délégué.$$
    ),
    jsonb_build_object(
      'question', $$Combien de régions et de départements compte la Côte d'Ivoire ?$$,
      'hint', $$Deux chiffres administratifs distincts.$$,
      'expected', $$31 régions et 108 départements.$$
    ),
    jsonb_build_object(
      'question', $$Qui administre le village en Côte d'Ivoire, et comment est-il désigné ?$$,
      'hint', $$Ce n'est pas une élection au sens strict.$$,
      'expected', $$Un chef de village, choisi par ses pairs puis nommé par arrêté préfectoral, assisté d'un conseil de village.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux ressources financières propres d'une commune.$$,
      'hint', $$Elles s'opposent aux ressources dites « additionnelles ».$$,
      'expected', $$Deux parmi : les impôts fonciers, les patentes, les diverses taxes (véhicules, stationnement), les timbres fiscaux, les locations de biens.$$
    )
  ),
  now()
);
