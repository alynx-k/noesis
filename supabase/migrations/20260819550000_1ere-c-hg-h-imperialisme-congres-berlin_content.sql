-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 2442: "1ère H3 - le mouvement impérialiste et le
-- congrès de Berlin" (https://lyc.ecole-ci.org/course/view.php?id=2442),
-- resource id 22650. Contenu réécrit à partir du PDF source (causes de
-- l'impérialisme, genèse et résolutions du congrès de Berlin). La
-- citation de Jules Ferry (discours à la Chambre des députés, 28 juillet
-- 1885 — Ferry décédé en 1893, texte du domaine public) est reproduite
-- telle quelle, comme dans le PDF source ; dates, noms et faits
-- historiques réels repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-imperialisme-congres-berlin',
  '1ere',
  'C',
  'histoire-geographie',
  $$Le mouvement impérialiste et le congrès de Berlin$$,
  11,
  '1ere-c-hg-h-revolutions-industrielles',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un débat sur une chaîne de télévision panafricaniste, relatif au continent africain, un des invités affirme : « L'Afrique est le pré-carré de l'Europe, et cela depuis la fin du XIXe siècle, période de l'impérialisme européen en Afrique. » Un groupe d'élèves de 1ère, ayant suivi l'émission, en fait le compte-rendu à leur professeur d'histoire-géographie. Celui-ci met à leur disposition des documents pour effectuer des recherches sur les mobiles de l'impérialisme européen en Afrique et en apprécier l'impact.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes économiques de l'impérialisme$$,
        'body', $$À partir de 1880, la crise de surproduction pousse les Européens à rechercher de nouveaux marchés pour écouler leur surplus. L'Afrique représente un débouché pour les produits européens, une source d'approvisionnement en matières premières, et une zone de placement pour les capitaux excédentaires, les taux d'intérêt y étant plus élevés qu'en Europe.$$,
        'highlights', array[$$3 attraits économiques : débouché commercial, matières premières, placement de capitaux$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi l'Afrique représentait-elle une zone de placement attractive pour les capitaux européens ?$$, 'solution', $$Parce que les taux d'intérêt y étaient plus élevés qu'en Europe.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes politiques, stratégiques et démographiques$$,
        'body', $$Sur le plan politique, les Européens veulent affirmer leur puissance et leur prestige par la possession de colonies. Sur le plan militaire, ils cherchent à sécuriser les routes maritimes par des bases navales (exemple : Madagascar pour contrôler l'océan Indien). L'explosion démographique européenne, provoquant chômage et manque de terres, pousse aussi à l'émigration vers des territoires au climat tempéré comme l'Afrique australe ou l'Algérie.$$,
        'highlights', array[$$politique/militaire : prestige + bases navales stratégiques$$, $$démographique : explosion démographique européenne → émigration vers l'Afrique tempérée$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi Madagascar était-elle stratégiquement importante pour une puissance coloniale ?$$, 'solution', $$Parce qu'elle permettait de contrôler les activités et les routes maritimes de l'océan Indien, en servant de base navale de ravitaillement et de surveillance.$$),
        'fixation', jsonb_build_object('question', $$Vers quelles régions d'Afrique l'émigration européenne s'est-elle dirigée en priorité, et pourquoi ?$$, 'solution', $$Vers l'Afrique australe (Afrique du Sud, Rhodésie du Sud) et l'Afrique du Nord (Algérie), en raison de leur climat tempéré.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes scientifiques, civilisatrices et la genèse du congrès de Berlin$$,
        'body', $$La curiosité scientifique et l'esprit d'aventure poussent les Européens à explorer l'intérieur du continent, encore méconnu. Les raisons civilisatrices invoquées incluent la lutte contre les derniers négriers, la fin des guerres tribales et la diffusion de la foi chrétienne. Le bassin du Congo devient un espace de rivalités entre Portugal, Belgique (roi Léopold II, missions de l'explorateur Stanley, 1875 et 1879-1882) et France (Savorgnan de Brazza). Face à ces tensions, le chancelier allemand Otto von Bismarck convoque un congrès à Berlin, du 15 novembre 1884 au 26 février 1885, réunissant 14 nations — mais aucun État africain.$$,
        'highlights', array[$$rivalités du bassin du Congo : Portugal, Belgique (Stanley), France (Brazza)$$, $$congrès de Berlin : 15/11/1884 - 26/02/1885, 14 nations, 0 État africain$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui a convoqué le congrès de Berlin, et combien de nations y ont participé ?$$, 'solution', $$Le chancelier allemand Otto von Bismarck ; 14 nations ont participé, mais aucun État africain.$$)
      ),
      jsonb_build_object(
        'heading', $$Les résolutions et conséquences du congrès de Berlin$$,
        'body', $$L'Acte général du congrès (6 chapitres, 38 articles) fixe des résolutions économiques (liberté de commerce sur les bassins du Congo et du Niger), politiques (Congo partagé entre la France et Léopold II, Cabinda au Portugal ; l'occupation côtière ne suffit plus, elle doit s'étendre à l'hinterland et être notifiée aux autres puissances) et humanitaires (lutte contre la traite négrière). Ses conséquences sont considérables : la « ruée coloniale » (scramble) s'accélère, et l'Afrique est entièrement morcelée entre puissances européennes (balkanisation).$$,
        'highlights', array[$$résolutions : liberté de commerce (Congo/Niger) + partage territorial + lutte anti-esclavagiste$$, $$conséquences : ruée coloniale (scramble) + balkanisation de l'Afrique$$]::text[],
        'example', jsonb_build_object('statement', $$Qu'a changé le congrès de Berlin dans les règles de conquête coloniale ?$$, 'solution', $$Il a établi que la simple occupation du littoral ne suffisait plus à revendiquer un territoire : il fallait désormais s'implanter effectivement dans l'hinterland et notifier cette occupation aux autres puissances européennes.$$),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on la « balkanisation » de l'Afrique, conséquence du congrès de Berlin ?$$, 'solution', $$Le morcellement de l'Afrique entière en plusieurs territoires coloniaux, répartis entre les puissances européennes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence sur l'impérialisme colonial, l'animateur cite Jules Ferry (discours à la Chambre des députés, 28 juillet 1885) : « Il y a une autre forme de colonisation qui s'adapte bien aux pays riches qui ont un superflu de capitaux ou un excédent de produits. Les colonies sont un placement de capitaux des plus avantageux. La fondation d'une colonie, c'est la création d'un débouché, or ce qui manque de plus en plus à notre grande industrie, ce sont des débouchés. » Il ajoute que c'est au congrès de Berlin que s'est fait le partage de l'Afrique.$$,
      'questions', array[
        $$Dégage l'idée générale de cette situation.$$,
        $$Explique le passage : « Il y a une autre forme de colonisation qui s'adapte bien aux pays riches qui ont un superflu de capitaux ou un excédent de produits. »$$,
        $$Es-tu d'accord quand l'animateur affirme que c'est au congrès de Berlin que s'est fait le partage de l'Afrique ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux causes économiques de l'impérialisme européen en Afrique.$$,
      'hint', $$Elles concernent le commerce, les matières premières ou l'argent.$$,
      'expected', $$Deux parmi : rechercher de nouveaux débouchés commerciaux, s'approvisionner en matières premières, placer les capitaux excédentaires.$$
    ),
    jsonb_build_object(
      'question', $$Quel explorateur a été chargé par le roi des Belges Léopold II d'explorer et de prendre possession des régions du fleuve Congo ?$$,
      'hint', $$Il a réalisé deux missions, en 1875 puis 1879-1882.$$,
      'expected', $$Stanley.$$
    ),
    jsonb_build_object(
      'question', $$À quelles dates s'est tenu le congrès de Berlin ?$$,
      'hint', $$Il s'étend de novembre 1884 à février 1885.$$,
      'expected', $$Du 15 novembre 1884 au 26 février 1885.$$
    ),
    jsonb_build_object(
      'question', $$Quelle résolution humanitaire les puissances européennes ont-elles adoptée au congrès de Berlin ?$$,
      'hint', $$Elle concerne un engagement contre une pratique inhumaine.$$,
      'expected', $$L'engagement à lutter contre la traite négrière et les sacrifices humains sur le continent africain.$$
    )
  ),
  now()
);
