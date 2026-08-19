-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2320: "EE 6: Dissert_littér_Elaborer_plan"
-- (https://lyc.ecole-ci.org/course/view.php?id=2320), resource id 21246.
-- Content is methodological (démarche d'élaboration du plan, plan
-- dialectique) illustrated by real published works and authors, cited only
-- by title/author/theme as factual literary references (standard
-- bibliographic/example use), not reproduced in their content.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-dissertation-elaborer-plan',
  '1ere',
  'C',
  'francais',
  $$La dissertation littéraire : élaborer le plan$$,
  6,
  '1ere-c-francais-dissertation-rechercher-idees',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir recherché les idées et les exemples pour le sujet « Toute littérature participe d'une civilisation... » (Roger Caillois), les élèves de 1ère doivent maintenant organiser cette matière en un plan structuré et détaillé, avant de rédiger le développement de leur dissertation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Principe d'élaboration du plan$$,
        'body', $$Le plan doit être adapté à la problématique du sujet, à laquelle il permet, dans son cheminement, de trouver une réponse. Il faut élaborer un plan détaillé qui classe les idées directrices, les arguments, et les exemples à utiliser. Au niveau des exemples, il ne suffit pas de citer une œuvre et son auteur : il faut aussi relever l'élément précis du texte qui illustre le propos (un personnage, une scène, un procédé).$$,
        'highlights', array[$$le plan doit répondre à la problématique du sujet$$, $$un exemple doit citer l'œuvre ET l'élément précis du texte qui illustre le propos, pas seulement le titre$$]::text[],
        'fixation', jsonb_build_object('question', $$Suffit-il de citer le titre d'une œuvre et son auteur pour illustrer un argument dans une dissertation littéraire ?$$, 'solution', $$Non, il faut aussi relever l'élément précis du texte (personnage, scène, procédé) qui illustre concrètement le propos.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ordre de présentation des parties$$,
        'body', $$Les grandes parties du plan obéissent à un ordre de présentation qui va du plus évident au moins évident, ou du moins important au plus important. L'organisation du plan dépend donc de ce que le candidat juge le plus important : elle peut varier d'un rédacteur à un autre, tant qu'elle demeure cohérente avec le cheminement vers la problématique.$$,
        'highlights', array[$$ordre : du plus évident au moins évident, ou du moins important au plus important$$, $$l'organisation du plan peut varier selon le jugement du rédacteur, tant qu'elle reste cohérente$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quel critère peut-on faire varier l'ordre de présentation des grandes parties d'un plan de dissertation ?$$, 'solution', $$Sur ce que le rédacteur juge le plus important ou le plus évident : l'ordre peut varier d'un candidat à un autre.$$)
      ),
      jsonb_build_object(
        'heading', $$Le plan dialectique (thèse / antithèse)$$,
        'body', $$Un plan dialectique (ou antithétique) confronte une thèse et une antithèse. Pour le sujet sur Roger Caillois, la 1ère partie (la thèse) est : « La littérature est le reflet de la société » (avec les arguments : sur le plan politique — dénonciation de la dictature dans Les soleils des indépendances d'Ahmadou Kourouma, ou des rivalités politiques dans On se chamaille pour un siège de Hyacinthe Kacou ; sur le plan culturel — dénonciation de coutumes dans Rebelle de Fatou Keïta, ou valorisation d'une culture dans « Prières aux masques », in Chants d'ombre de Léopold Sédar Senghor). La 2ème partie (l'antithèse) est : « La littérature a d'autres aspects » (expression des sentiments personnels dans Les contemplations de Victor Hugo ; recherche du beau dans Calligrammes de Guillaume Apollinaire ; évocation de la fiction dans La planète des singes de Pierre Boulle).$$,
        'highlights', array[$$plan dialectique : 1ère partie = thèse, 2ème partie = antithèse$$, $$chaque partie se subdivise en arguments, chacun illustré par un exemple précis$$]::text[],
        'example', jsonb_build_object('statement', $$Dans Rebelle de Fatou Keïta, quel élément précis du texte illustre la dénonciation d'une coutume ?$$, 'solution', $$La fuite de Malimouna dans la nuit de ses noces, qui constitue une dénonciation véhémente du mariage forcé.$$),
        'fixation', jsonb_build_object('question', $$Que confronte un plan dialectique ?$$, 'solution', $$Une thèse (première partie) et une antithèse (deuxième partie).$$)
      ),
      jsonb_build_object(
        'heading', $$Application : le plan du sujet sur la lecture$$,
        'body', $$Pour le sujet sur la lecture (« on se lit à travers les livres »), le plan dialectique est : 1ère partie — « La lecture permet la découverte et la formation de soi » (identification aux personnages, à leurs rêves comme Eugène de Rastignac dans Le père Goriot d'Honoré de Balzac, ou à leurs sentiments comme Fama dans Les soleils des indépendances d'Ahmadou Kourouma ; prise de conscience de ses propres travers, comme l'avarice dans L'avare de Molière). 2ème partie — « La lecture ouvre à d'autres découvertes en dehors de soi » (découverte d'autres cultures, comme la culture Ibo marquée par la méritocratie dans Le monde s'effondre de Chinua Achebe ; acquisition de connaissances historiques, comme dans Chaka ou l'épopée bantu de Thomas Mofolo, inspiré de la vie réelle du roi zoulou Chaka (1786-1828) ; divertissement, comme dans les romans d'aventure ou policiers).$$,
        'highlights', array[$$1ère partie : la lecture comme miroir de soi (identification, prise de conscience)$$, $$2ème partie : la lecture comme ouverture sur d'autres cultures, connaissances, divertissement$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans le plan du sujet sur la lecture, à quelle partie appartient l'argument de la « découverte d'autres cultures » ?$$, 'solution', $$À la deuxième partie (l'antithèse), consacrée aux découvertes que la lecture apporte en dehors de la connaissance de soi.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit élaborer le plan détaillé d'un sujet proche : « La littérature n'a-t-elle pour seule fonction que de dénoncer les travers de la société ? » Il dispose des mêmes idées et exemples vus en cours (dénonciation politique et culturelle d'une part ; expression des sentiments, du beau et de la fiction d'autre part).$$,
      'questions', array[
        $$Propose un plan dialectique en deux parties pour ce sujet, en formulant clairement la thèse et l'antithèse.$$,
        $$Pour la première partie, choisis deux arguments (avec un exemple précis d'œuvre et l'élément du texte qui l'illustre) illustrant la fonction dénonciatrice de la littérature.$$,
        $$Pour la seconde partie, choisis deux arguments (avec exemples précis) montrant que la littérature a d'autres fonctions que la dénonciation.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$À quoi le plan d'une dissertation littéraire doit-il être adapté ?$$,
      'hint', $$C'est la question centrale que le devoir doit résoudre.$$,
      'expected', $$À la problématique du sujet, à laquelle le plan doit permettre de trouver une réponse.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'ordre habituel de présentation des grandes parties d'un plan ?$$,
      'hint', $$Il y a deux formulations équivalentes de ce principe.$$,
      'expected', $$Du plus évident au moins évident, ou du moins important au plus important.$$
    ),
    jsonb_build_object(
      'question', $$Que doit contenir un exemple utilisé pour illustrer un argument, au-delà du titre de l'œuvre et de son auteur ?$$,
      'hint', $$C'est ce qui rend l'exemple concret et probant.$$,
      'expected', $$L'élément précis du texte (personnage, scène, procédé) qui illustre concrètement le propos.$$
    ),
    jsonb_build_object(
      'question', $$Dans un plan dialectique, que représentent la première et la deuxième partie ?$$,
      'hint', $$Ce sont deux positions qui se confrontent.$$,
      'expected', $$La première partie développe la thèse, la deuxième partie développe l'antithèse.$$
    )
  ),
  now()
);
