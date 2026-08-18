-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 879: "1ère_HISTOIRE_T2_L1: LE MOUVEMENT IMPERIALISTE ET
-- LE CONGRES DE BERLIN" (https://lyc.ecole-ci.org/course/view.php?id=879),
-- resource id 4197. Contenu réécrit à partir du PDF source (causes de
-- l'impérialisme, genèse et résolutions du congrès de Berlin). La citation
-- de Jules Ferry (discours du 28 juillet 1885, domaine public, Ferry mort
-- en 1893) est reprise fidèlement. Faits, dates et noms réels (Bismarck,
-- Stanley, Brazza, dates du congrès) repris tels quels ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-imperialisme-congres-berlin',
  '1ere',
  'A',
  'histoire-geographie',
  $$Le mouvement impérialiste et le congrès de Berlin$$,
  11,
  '1ere-a-hg-h-revolutions-industrielles',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un débat télévisé sur l'Afrique, un invité affirme : « L'Afrique est le pré-carré de l'Europe, et cela depuis la fin du XIXe siècle, période de l'impérialisme européen en Afrique. » Des élèves de 1ère A, ayant suivi l'émission, décident de mener des recherches pour comprendre les mobiles de l'impérialisme européen en Afrique et apprécier son impact.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'impérialisme : définition et causes économiques$$,
        'body', $$L'impérialisme désigne la domination politique, économique, militaire et culturelle d'États puissants sur des peuples faibles. À partir de 1880, la crise de surproduction pousse les Européens à rechercher en Afrique de nouveaux débouchés pour écouler leur surplus de production, une source de matières premières pour leurs industries, et une zone d'investissement offrant des taux d'intérêt plus élevés qu'en Europe.$$,
        'highlights', array[$$impérialisme = domination politique, économique, militaire, culturelle$$, $$débouchés + matières premières + placements de capitaux$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les trois raisons économiques qui attirent les Européens vers l'Afrique ?$$, 'solution', $$Trouver des débouchés pour écouler le surplus de production, s'approvisionner en matières premières, et placer les capitaux excédentaires à des taux d'intérêt avantageux.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes politiques, stratégiques, démographiques et civilisatrices$$,
        'body', $$Au plan politique, posséder une colonie permet aux Européens d'affirmer leur puissance et leur prestige. Au plan militaire, ils cherchent à sécuriser les routes maritimes grâce à des bases navales (comme Madagascar pour surveiller l'océan Indien). L'explosion démographique en Europe (chômage, surpeuplement) pousse aussi à l'émigration vers des territoires au climat tempéré (Afrique du Sud, Algérie). Enfin, des raisons scientifiques (curiosité, esprit d'aventure) et « civilisatrices » (lutte contre les derniers négriers, évangélisation) sont invoquées pour justifier la conquête.$$,
        'highlights', array[$$politique : prestige$$, $$militaire : bases navales (ex. Madagascar)$$, $$démographique : émigration vers climats tempérés$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi Madagascar est-elle citée comme exemple de motivation militaire ?$$, 'solution', $$Parce qu'elle permettait aux Européens de contrôler et surveiller les activités de l'océan Indien grâce à une base navale.$$)
      ),
      jsonb_build_object(
        'heading', $$La genèse du congrès de Berlin$$,
        'body', $$Le bassin du fleuve Congo devient un espace de rivalités entre le Portugal (présent depuis le XVIe siècle), la Belgique (l'explorateur Stanley, envoyé par le roi Léopold II, y mène deux missions en 1875 et 1879-1882) et la France (Savorgnan de Brazza, qui signe des traités avec le roi des Batéké). Le Portugal, se sentant menacé, signe un traité de protection avec l'Angleterre le 26 février 1884. Pour prévenir un conflit entre puissances coloniales, permettre à l'Allemagne de s'engager dans la conquête africaine et réglementer le système de conquête, le chancelier allemand Otto von Bismarck convoque un congrès à Berlin, qui se tient du 15 novembre 1884 au 26 février 1885, réunissant 14 nations — sans qu'aucun État africain n'y soit convié.$$,
        'highlights', array[$$rivalités : Portugal, Belgique (Stanley), France (Brazza)$$, $$Bismarck convoque le congrès$$, $$15/11/1884 au 26/02/1885, 14 nations, aucun État africain$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui a convoqué le congrès de Berlin, et pour quelles raisons ?$$, 'solution', $$Le chancelier allemand Otto von Bismarck, pour prévenir un conflit entre puissances colonisatrices, permettre à l'Allemagne de s'engager dans la conquête de l'Afrique, et réglementer le système de conquête du continent.$$)
      ),
      jsonb_build_object(
        'heading', $$Les résolutions du congrès de Berlin$$,
        'body', $$L'Acte général du congrès (6 chapitres, 38 articles) contient des résolutions économiques (liberté de commerce sur les bassins du Congo et du Niger), politiques (la rive droite du Congo attribuée à la France, la rive gauche à Léopold II, l'enclave du Cabinda au Portugal ; désormais l'occupation côtière ne suffit plus, elle doit être notifiée et accompagnée d'une occupation effective de l'hinterland) et humanitaires (engagement à lutter contre la traite négrière et les sacrifices humains).$$,
        'highlights', array[$$économique : libre commerce Congo/Niger$$, $$politique : occupation effective de l'hinterland obligatoire$$, $$humanitaire : lutte contre la traite négrière$$]::text[],
        'fixation', jsonb_build_object('question', $$Que change le congrès de Berlin dans les règles de la conquête coloniale ?$$, 'solution', $$L'occupation du littoral ne suffit plus à revendiquer l'arrière-pays (hinterland) : cette occupation doit désormais être notifiée expressément aux autres puissances et accompagnée d'une présence effective.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences du congrès de Berlin$$,
        'body', $$Le congrès déclenche la « ruée coloniale » (ou « scramble »), une véritable course à l'occupation du continent. L'Afrique entière est alors morcelée entre les puissances européennes en de multiples territoires coloniaux, sans considération des frontières ethniques ou culturelles préexistantes : c'est la balkanisation de l'Afrique, dont les effets se font encore sentir aujourd'hui dans le tracé des frontières.$$,
        'highlights', array[$$ruée coloniale (« scramble »)$$, $$balkanisation de l'Afrique$$]::text[],
        'example', jsonb_build_object('statement', $$Que signifie le terme « balkanisation » appliqué à l'Afrique après le congrès de Berlin ?$$, 'solution', $$Le morcellement du continent africain en de multiples territoires coloniaux tracés par les puissances européennes, sans tenir compte des frontières ethniques, culturelles ou historiques des peuples africains.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la course à l'occupation territoriale déclenchée par le congrès de Berlin ?$$, 'solution', $$La ruée coloniale, aussi appelée « scramble » ou « course au clocher ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence sur l'impérialisme colonial, l'animateur cite Jules Ferry (discours à la Chambre des députés, 28 juillet 1885) : « Il y a une autre forme de colonisation qui s'adapte bien aux pays riches qui ont un superflu de capitaux ou un excédent de produits. [...] La fondation d'une colonie, c'est la création d'un débouché, or ce qui manque de plus en plus à notre grande industrie, ce sont des débouchés. » Il ajoute que c'est au congrès de Berlin que s'est fait le partage de l'Afrique.$$,
      'questions', array[
        $$Dégage l'idée générale de cette situation.$$,
        $$Explique le passage : « Il y a une autre forme de colonisation qui s'adapte bien aux pays riches qui ont un superflu de capitaux ou un excédent de produits. »$$,
        $$Es-tu d'accord quand l'animateur affirme que c'est au congrès de Berlin que s'est fait le partage de l'Afrique ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel chancelier allemand a convoqué le congrès de Berlin ?$$,
      'hint', $$C'est le chancelier de l'empire allemand à l'époque.$$,
      'expected', $$Otto von Bismarck.$$
    ),
    jsonb_build_object(
      'question', $$À quelles dates s'est tenu le congrès de Berlin ?$$,
      'hint', $$Il a duré environ 3 mois, entre fin 1884 et début 1885.$$,
      'expected', $$Du 15 novembre 1884 au 26 février 1885.$$
    ),
    jsonb_build_object(
      'question', $$Quel explorateur français a signé des traités avec le roi des Batéké dans le bassin du Congo ?$$,
      'hint', $$Il a devancé les prétentions du roi des Belges.$$,
      'expected', $$Savorgnan de Brazza.$$
    ),
    jsonb_build_object(
      'question', $$Un État ou royaume africain était-il présent au congrès de Berlin ?$$,
      'hint', $$Le congrès a décidé de l'avenir du continent sans consulter ses habitants.$$,
      'expected', $$Non, aucun État ni royaume africain n'a été convié au congrès.$$
    )
  ),
  now()
);
