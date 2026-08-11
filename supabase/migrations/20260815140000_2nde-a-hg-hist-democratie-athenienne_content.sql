-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3354: "2nde_HISTOIRE_T2_L3: LA DEMOCRATIE ATHENIENNE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3354)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33475, redirecting
-- to pluginfile "2nde H6-La démocratie athénienne.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 2, Leçon 3): Athens as a
-- prosperous but unequal city, the founding reforms of Athenian democracy
-- (Draco, Solon, Cleisthenes, Pericles), its institutions (Ecclesia, Boule,
-- courts, magistrates), its egalitarian mechanisms (sortition, majority
-- vote), and its real limits (rule by a 10% minority, inequality among
-- citizens, unlimited terms, no appeal). 100% original wording; no sentence
-- copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-hist-democratie-athenienne',
  '2nde',
  'A',
  'histoire',
  $$La démocratie athénienne$$,
  6,
  '2nde-a-hg-hist-civilisation-egypte-ancienne',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant un débat télévisé sur la démocratie en Côte d'Ivoire, un invité affirme qu'on ne peut parler de démocratie sans évoquer Athènes, berceau de ce système politique. Surpris par cette affirmation, des élèves de seconde décident de mener des recherches pour comprendre les grands traits de la démocratie athénienne et son fonctionnement réel.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Athènes, une cité prospère mais profondément inégalitaire$$,
        'body', $$Fondée vers 800 avant J.-C. dans la plaine de l'Attique, Athènes tire sa prospérité du commerce maritime, de tributs versés par des cités vassales et de son sous-sol riche en minerai d'argent. Mais cette richesse profite surtout aux grandes familles aristocratiques. La société athénienne est très inégalitaire : sur une population totale d'environ 400 000 habitants, seuls 40 000 sont des citoyens ; les esclaves (environ 200 000) et les étrangers appelés métèques (80 000) sont bien plus nombreux, et les femmes, reléguées au rang de mineures, n'ont accès ni aux fonctions publiques ni à l'héritage. Au Ve siècle avant J.-C., avant les réformes démocratiques, la cité connaît même des périodes de tyrannie.$$,
        'highlights', array[$$citoyens$$, $$métèques$$, $$esclaves$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle proportion de la population d'Athènes était constituée de citoyens à part entière ?$$, 'solution', $$Environ 10 % (40 000 citoyens sur environ 400 000 habitants).$$)
      ),
      jsonb_build_object(
        'heading', $$Les réformes fondatrices de la démocratie$$,
        'body', $$Quatre grandes figures ont bâti progressivement la démocratie athénienne. En 621 avant J.-C., Dracon introduit un premier code pénal. En 594, le législateur Solon libère les pauvres de la tutelle des riches aristocrates, supprime l'esclavage pour dettes et crée l'Héliée (tribunal populaire), donnant à Athènes sa première constitution. En 507, Clisthène approfondit ces réformes en divisant l'Attique en cent dèmes répartis en dix tribus, où tous les citoyens sont égaux devant la loi, et introduit le tirage au sort pour désigner certains responsables. Enfin, au Ve siècle, le stratège Périclès instaure le mysthos, une indemnité qui permet même aux citoyens les plus pauvres de participer à la vie politique sans perdre de revenu.$$,
        'highlights', array[$$Solon$$, $$Clisthène$$, $$Périclès$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Réformateur$$, $$Date$$, $$Apport principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Dracon$$, $$-621$$, $$Premier code pénal$$),
            jsonb_build_array($$Solon$$, $$-594$$, $$Suppression de l'esclavage pour dettes, création de l'Héliée$$),
            jsonb_build_array($$Clisthène$$, $$-507$$, $$Division en dèmes et tribus, tirage au sort$$),
            jsonb_build_array($$Périclès$$, $$Ve siècle$$, $$Le mysthos, indemnité pour les citoyens pauvres$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle réforme de Périclès a permis aux citoyens les plus pauvres de participer à la vie politique ?$$, 'solution', $$L'instauration du mysthos, une indemnité compensant leur journée de travail perdue.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes institutions de la démocratie athénienne$$,
        'body', $$La démocratie athénienne repose sur plusieurs institutions complémentaires. L'Ecclésia, l'assemblée de tous les citoyens réunie sur la colline de la Pnyx, détient le pouvoir suprême : elle vote les lois, décide de la guerre et de la paix, et élit les stratèges. La Boulè, conseil permanent de 500 citoyens tirés au sort, prépare le travail de l'Ecclésia et contrôle les magistrats. La justice est rendue par deux tribunaux, l'Aréopage (qui juge les meurtres) et l'Héliée (qui juge les autres affaires) ; ses décisions, une fois rendues, sont sans appel. Enfin, des magistrats, dont dix stratèges élus chaque année, sont chargés de faire appliquer les lois.$$,
        'highlights', array[$$Ecclésia$$, $$Boulè$$, $$Héliée$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle institution athénienne prépare les textes qui seront ensuite débattus et votés par l'ensemble des citoyens réunis ?$$, 'solution', $$La Boulè, le conseil permanent de 500 citoyens.$$),
        'fixation', jsonb_build_object('question', $$Quelle assemblée détient le pouvoir suprême dans la démocratie athénienne ?$$, 'solution', $$L'Ecclésia, l'assemblée de tous les citoyens.$$)
      ),
      jsonb_build_object(
        'heading', $$Un système fondé sur l'égalité, mais avec de réelles limites$$,
        'body', $$Le tirage au sort et le vote à main levée à la majorité incarnent l'idéal d'égalité entre citoyens. Mais cette démocratie reste, dans les faits, très limitée. D'abord, seuls les citoyens (environ 10 % de la population) participent aux décisions, laissant femmes, métèques et esclaves totalement à l'écart. Ensuite, même parmi les citoyens, les plus riches et les plus instruits dominent largement la vie politique, les plus pauvres ayant plus de mal à prendre la parole en public — ce qui explique par exemple que Périclès ait été réélu stratège quatorze fois de suite. Enfin, l'absence de limitation des mandats et le caractère sans appel des jugements de l'Héliée constituent d'autres failles importantes de ce système.$$,
        'highlights', array[$$démocratie limitée$$, $$absence de limitation des mandats$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi peut-on dire que la démocratie athénienne était en réalité une « démocratie sélective » ?$$, 'solution', $$Parce que seuls les citoyens, environ 10 % de la population totale, participaient aux décisions politiques ; les femmes, les métèques et les esclaves, qui formaient la grande majorité, en étaient exclus.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un débat sur la démocratie en Afrique, un premier intervenant affirme qu'Athènes a mis en place de véritables structures de séparation des pouvoirs. Un second nuance en rappelant que la démocratie athénienne a montré ses limites malgré son impact durable sur le monde. Un élève de seconde doit trancher ce débat à l'aide de ce qu'il sait du fonctionnement réel d'Athènes.$$,
      'questions', array[
        $$Cite les quatre grands réformateurs qui ont construit la démocratie athénienne, avec leur apport principal.$$,
        $$Présente le rôle de l'Ecclésia et de la Boulè dans le fonctionnement de la démocratie athénienne.$$,
        $$Explique en quoi la démocratie athénienne était réservée à une minorité de la population.$$,
        $$Cite deux limites concrètes du système politique athénien.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel réformateur athénien a supprimé l'esclavage pour dettes et créé l'Héliée en -594 ?$$,
      'hint', $$C'est le premier des grands législateurs cités dans la leçon.$$,
      'expected', $$Solon.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'assemblée qui réunit tous les citoyens athéniens et détient le pouvoir suprême ?$$,
      'hint', $$Elle se réunit sur la colline de la Pnyx.$$,
      'expected', $$L'Ecclésia.$$
    ),
    jsonb_build_object(
      'question', $$Combien de fois Périclès a-t-il été réélu stratège, illustrant l'absence de limitation des mandats ?$$,
      'hint', $$C'est un nombre à deux chiffres.$$,
      'expected', $$Quatorze fois.$$
    ),
    jsonb_build_object(
      'question', $$Quelle proportion de la population d'Athènes avait le statut de citoyen ?$$,
      'hint', $$C'est une petite minorité.$$,
      'expected', $$Environ 10 % de la population.$$
    )
  ),
  now()
);
