-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3348: "2nde_HISTOIRE_T1_L2: LES METHODES D'ETUDE DE
-- L'HISTOIRE" (https://lyc.ecole-ci.org/course/view.php?id=3348)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33415, redirecting
-- to pluginfile "2nde H2-Les méthodes dEtude de lhistoire.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 1, Leçon 2): the four
-- families of historical sources (written, oral, archaeological, audiovisual/
-- digital), the historian's scientific method in five steps (choice of
-- theme, data collection, external/internal criticism, interpretation,
-- historical synthesis), and the specific importance of oral tradition for
-- reconstructing African history. 100% original wording; no sentence copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-hist-methodes-etude-histoire',
  '2nde',
  'A',
  'histoire',
  $$Les méthodes d'étude de l'histoire$$,
  2,
  '2nde-a-hg-hist-histoire-formation-citoyen',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club d'Histoire-Géographie d'un établissement organise une conférence sur le peuplement de sa région. Impressionnés par la précision des dates et des événements présentés par l'historien invité, des élèves de seconde veulent comprendre d'où proviennent toutes ces informations et comment l'historien procède pour restituer fidèlement le passé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les quatre grandes familles de sources historiques$$,
        'body', $$Une source, en histoire, est tout support qui atteste d'un fait ou d'un événement du passé. Les sources écrites (manuscrits, traités, lois, mémoires) sont propres aux sociétés qui ont connu tôt l'écriture, comme l'Égypte antique ou la Chine. Les sources orales, transmises de génération en génération (contes, légendes, épopées, chants), constituent la principale source d'histoire pour les peuples qui n'ont pas connu tôt l'expansion de l'écriture, notamment dans certaines régions d'Afrique. Les sources archéologiques (ossements, monnaies, gravures rupestres) sont mises au jour par des fouilles et servent surtout à l'étude de la préhistoire. Enfin, les sources audiovisuelles et numériques (photographies, films, internet), plus récentes, offrent un accès instantané mais posent des problèmes de conservation et de fiabilité (fausses informations, mauvaises manipulations).$$,
        'highlights', array[$$sources écrites$$, $$sources orales$$, $$sources archéologiques$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type de source$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Écrite$$, $$Traité, loi, mémoire, autobiographie$$),
            jsonb_build_array($$Orale$$, $$Récit de griot, légende, chant$$),
            jsonb_build_array($$Archéologique$$, $$Ossement, monnaie ancienne, gravure rupestre$$),
            jsonb_build_array($$Audiovisuelle/numérique$$, $$Photographie, film documentaire, internet$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi la source orale est-elle particulièrement importante pour l'histoire de certaines régions d'Afrique ?$$, 'solution', $$Parce que ces sociétés n'ont pas connu tôt l'expansion de l'écriture, si bien que la tradition orale y constitue la principale source disponible pour reconstituer le passé.$$)
      ),
      jsonb_build_object(
        'heading', $$Le choix du thème et la collecte des données$$,
        'body', $$La démarche de l'historien commence par le choix d'un thème de recherche précis et digne d'intérêt. Vient ensuite la collecte des données : l'historien rassemble le plus grand nombre possible de documents et d'informations sur son sujet, sans négliger aucune source disponible, qu'elle soit écrite, orale, archéologique ou audiovisuelle.$$,
        'highlights', array[$$choix du thème$$, $$collecte des données$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la toute première étape de la démarche de l'historien ?$$, 'solution', $$Le choix d'un thème de recherche précis.$$)
      ),
      jsonb_build_object(
        'heading', $$Le traitement des données : la double critique du document$$,
        'body', $$Une fois les documents rassemblés, l'historien doit apprécier leur qualité par une double critique. La critique externe porte sur la nature, la forme et la crédibilité du document : qui en est l'auteur, dans quel contexte a-t-il été produit, à quelle date (pour éviter tout anachronisme) ? La critique interne, elle, porte sur le contenu même du document : elle consiste à comparer plusieurs sources entre elles pour vérifier l'authenticité des informations et la sincérité de leurs auteurs. Cette double critique permet à l'historien de faire ressortir la véracité des faits.$$,
        'highlights', array[$$critique externe$$, $$critique interne$$]::text[],
        'example', jsonb_build_object('statement', $$Un historien découvre un texte non daté qui prétend rapporter un événement. Quelle critique doit-il appliquer en priorité pour vérifier de quand provient réellement ce texte, avant même d'en analyser le contenu ?$$, 'solution', $$La critique externe, qui porte sur la nature, la forme et le contexte de production du document (dont sa date).$$),
        'fixation', jsonb_build_object('question', $$Sur quoi porte la critique interne d'un document historique ?$$, 'solution', $$Sur le fond du document : l'authenticité des informations et la sincérité de son auteur, vérifiées en comparant plusieurs sources.$$)
      ),
      jsonb_build_object(
        'heading', $$L'interprétation et la synthèse historique$$,
        'body', $$L'interprétation consiste à tirer toutes les informations utiles de chaque document critiqué, en leur donnant un sens : une statuette découverte peut ainsi représenter une divinité ou un simple objet décoratif, selon le contexte. La synthèse historique, dernière étape, reconstitue les faits en les classant selon l'ordre chronologique (pour établir les dates) et selon l'ordre logique (pour comprendre l'enchaînement et les conséquences des événements). C'est le résultat final, certifié, de toute la démarche de l'historien : il devient à son tour une vérité historique de référence.$$,
        'highlights', array[$$interprétation$$, $$synthèse historique$$]::text[],
        'fixation', jsonb_build_object('question', $$Selon quels deux ordres l'historien classe-t-il les informations lors de la synthèse historique ?$$, 'solution', $$L'ordre chronologique (pour établir les dates) et l'ordre logique (pour relier les faits entre eux).$$)
      ),
      jsonb_build_object(
        'heading', $$Le cas particulier de l'histoire africaine$$,
        'body', $$En Afrique, les sources écrites restent rares et ne couvrent ni toutes les régions ni toutes les époques ; l'archéologie, quant à elle, souffre souvent d'un manque de moyens financiers. Dans ce contexte, la tradition orale — transmise par les griots et les traditionnistes — joue un rôle majeur, même si elle doit, comme toute autre source, être soumise à la critique historique : problèmes de datation précise, risque de déformation au fil des transmissions. Des sciences auxiliaires comme la linguistique (étude des parentés entre langues) ou l'anthropologie (comparaison des traits culturels) viennent compléter ces sources pour mieux reconstituer l'histoire du continent.$$,
        'highlights', array[$$tradition orale$$, $$sciences auxiliaires$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi ne peut-on pas dire que l'Afrique est « sans histoire » du simple fait que les sources écrites y sont rares ?$$, 'solution', $$Parce que d'autres sources (tradition orale, archéologie, linguistique, sciences auxiliaires) permettent tout aussi bien de reconstituer son passé, une fois soumises à la critique historique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conférencier affirme que les sources écrites sont les sources par excellence de l'histoire, mais qu'elles sont rares en Afrique, et que l'archéologie et les traditions orales présentent de nombreuses insuffisances. Un élève de seconde doit discuter cette affirmation en s'appuyant sur ce qu'il sait des sources et de la démarche historique.$$,
      'questions', array[
        $$Cite les quatre grandes familles de sources utilisées par l'historien.$$,
        $$Explique la différence entre la critique externe et la critique interne d'un document.$$,
        $$Décris les étapes de la démarche de l'historien, de la collecte des données à la synthèse historique.$$,
        $$Explique pourquoi la tradition orale occupe une place particulière dans l'étude de l'histoire africaine.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel type de source est le plus utilisé pour l'étude de la préhistoire ?$$,
      'hint', $$Ce sont des vestiges matériels mis au jour par des fouilles.$$,
      'expected', $$Les sources archéologiques.$$
    ),
    jsonb_build_object(
      'question', $$Quelle critique d'un document historique porte sur sa nature, sa forme et son contexte de production ?$$,
      'hint', $$Elle s'oppose à la critique « interne ».$$,
      'expected', $$La critique externe.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'étape finale de la démarche de l'historien, qui reconstitue les faits selon l'ordre chronologique et logique ?$$,
      'hint', $$C'est le résultat certifié de toute la démarche.$$,
      'expected', $$La synthèse historique.$$
    ),
    jsonb_build_object(
      'question', $$Quelles personnes transmettent traditionnellement la tradition orale dans de nombreuses sociétés africaines ?$$,
      'hint', $$Ce sont des spécialistes de la mémoire collective.$$,
      'expected', $$Les griots (et les traditionnistes).$$
    )
  ),
  now()
);
