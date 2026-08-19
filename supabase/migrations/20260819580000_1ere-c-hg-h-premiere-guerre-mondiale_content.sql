-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 2445: "1ère H6-La première guerre mondiale Causes et
-- Conséquences" (https://lyc.ecole-ci.org/course/view.php?id=2445),
-- resource id 22686. Contenu réécrit à partir du PDF source (causes
-- lointaines et immédiates, conséquences humaines, économiques et
-- politiques de la Première Guerre mondiale). Dates, chiffres et faits
-- historiques réels repris tels quels (données factuelles) ; brève
-- citation du philosophe Alain (mort en 1951, domaine public) reproduite
-- telle quelle, comme dans le PDF source, à titre de commentaire critique
-- bref.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-premiere-guerre-mondiale',
  '1ere',
  'C',
  'histoire-geographie',
  $$La Première Guerre mondiale : causes et conséquences$$,
  14,
  '1ere-c-hg-h-colonisation-resistances-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En rangeant la chambre de son défunt grand-père, un élève découvre une photo de celui-ci, joyeux parmi des soldats blancs. Sa grand-mère lui explique que son grand-père a participé à la guerre de 1914. Curieux d'en savoir davantage sur cette guerre, il en parle avec ses camarades de classe et, ensemble, ils décident de faire des recherches pour connaître les causes de cette guerre et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes lointaines : rivalités politiques, territoriales et économiques$$,
        'body', $$Entre 1905 et 1911, France et Allemagne s'affrontent pour le Maroc. En 1909, une tension oppose la Russie et l'Autriche-Hongrie autour des Balkans, la Serbie (soutenue par la Russie) s'opposant à l'expansion austro-hongroise. La France revendique l'Alsace-Lorraine, perdue en 1870 ; l'Italie réclame à l'Autriche-Hongrie les « terres irrédentes » (Istrie, Trentin, Dalmatie). Sur le plan économique, l'Allemagne ravit à l'Angleterre, à partir de 1906, le monopole du marché mondial grâce à sa politique expansionniste (« weltpolitik »), créant une vive concurrence dès 1907.$$,
        'highlights', array[$$rivalités territoriales : Maroc (France/Allemagne), Balkans (Russie/Autriche-Hongrie), Alsace-Lorraine$$, $$rivalité économique : weltpolitik allemande vs monopole commercial britannique (dès 1906-1907)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels deux territoires la France revendiquait-elle à l'Allemagne, perdus en 1870 ?$$, 'solution', $$L'Alsace et la Lorraine.$$)
      ),
      jsonb_build_object(
        'heading', $$La formation des alliances et la course aux armements$$,
        'body', $$Deux systèmes d'alliances défensives se forment : la Triple Alliance (Allemagne, Autriche-Hongrie, Italie, 1879-1882) et la Triple Entente (France, Russie, Royaume-Uni, 1892-1907). Chaque bloc s'engage à intervenir si l'un de ses membres est attaqué. S'ensuit une course aux armements : la Russie aligne 1,2 million de soldats, la Grande-Bretagne 64 bateaux cuirassés (contre 40 pour l'Allemagne), la France consacre 34% de son budget à l'armement. L'Europe devient une véritable « poudrière ».$$,
        'highlights', array[$$Triple Alliance (1879-1882) : Allemagne, Autriche-Hongrie, Italie$$, $$Triple Entente (1892-1907) : France, Russie, Royaume-Uni$$],
        'example', jsonb_build_object('statement', $$Quel était l'objectif déclaré des systèmes d'alliances (Triple Alliance et Triple Entente) ?$$, 'solution', $$Un objectif défensif : intervenir immédiatement si l'un des membres de l'alliance était attaqué par une puissance extérieure.$$),
        'fixation', jsonb_build_object('question', $$Quels trois pays composaient la Triple Entente ?$$, 'solution', $$La France, la Russie et le Royaume-Uni.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes immédiates : nationalismes et attentat de Sarajevo$$,
        'body', $$La fusion de l'Autriche-Hongrie (1867) rassemble des peuples divers (Allemands, Hongrois, Tchèques, Polonais, Serbes...), suscitant des tensions nationalistes, notamment le désir serbe de créer un État slave unifié dans les Balkans. Le 28 juin 1914, l'archiduc François-Ferdinand, héritier d'Autriche-Hongrie, est assassiné à Sarajevo par Gavrilo Princip, étudiant bosniaque membre de la « Main noire ». L'Autriche-Hongrie déclare la guerre à la Serbie ; par le jeu des alliances, la Russie entre en guerre le 1er août, l'Allemagne déclare la guerre à la France le 3 août, puis au Royaume-Uni le 4 août après avoir violé la neutralité belge. Le conflit se généralise.$$,
        'highlights', array[$$28 juin 1914 : assassinat de François-Ferdinand à Sarajevo par Gavrilo Princip (« Main noire »)$$, $$jeu des alliances → généralisation du conflit en août 1914$$]::text[],
        'example', jsonb_build_object('statement', $$Explique en une phrase comment l'attentat de Sarajevo a entraîné une guerre généralisée en Europe.$$, 'solution', $$L'Autriche-Hongrie a déclaré la guerre à la Serbie après l'attentat, ce qui a activé le jeu des alliances : la Russie est intervenue pour la Serbie, l'Allemagne pour l'Autriche-Hongrie contre la France, entraînant à son tour le Royaume-Uni, membre de la Triple Entente.$$),
        'fixation', jsonb_build_object('question', $$Qui a assassiné l'archiduc François-Ferdinand, et de quelle organisation faisait-il partie ?$$, 'solution', $$Gavrilo Princip, étudiant bosniaque de 19 ans, membre de l'organisation nationaliste serbe « la Main noire ».$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la Première Guerre mondiale$$,
        'body', $$La guerre fait 8,5 millions de morts (militaires et civils) et 20 millions de blessés/mutilés en Europe (la France perd 20% de sa population active). Économiquement, l'Europe ruinée et endettée cède sa place de première puissance mondiale aux États-Unis et au Japon. Politiquement, la carte de l'Europe est redessinée : éclatement de l'Autriche-Hongrie, création de nouveaux États (Pologne, Tchécoslovaquie, Yougoslavie...). Le traité de Versailles (28 juin 1919) impose à l'Allemagne, jugée responsable, de lourdes réparations (132 milliards de mark-or), le désarmement et la perte de ses colonies africaines (Togo, Cameroun...). En 1920, sur l'initiative du président américain Wilson, la SDN (Société des Nations) est créée pour maintenir la paix, mais elle ne dispose ni d'armée ni de l'adhésion des États-Unis.$$,
        'highlights', array[$$8,5 millions de morts + 20 millions de blessés$$, $$traité de Versailles (28/06/1919) : réparations, désarmement allemand, perte des colonies$$, $$SDN créée en 1920 (sans armée, sans les USA)$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la SDN, créée en 1920, a-t-elle eu du mal à faire respecter ses décisions ?$$, 'solution', $$Parce qu'elle ne disposait d'aucune armée pour les faire appliquer, et que les États-Unis, pourtant à l'initiative de sa création, n'en étaient pas membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un présentateur de documentaire affirme : « On a souvent dit de l'Europe qu'elle était une poudrière prête à exploser au cours des années précédant la Première Guerre mondiale. Cette explosion se produisit finalement à Sarajevo, en Bosnie, à l'été 1914. » Il conclut : « La responsabilité de la guerre incombe en grande partie aux empires centraux, mais les futurs vainqueurs ne peuvent pas être exonérés de responsabilités, car comme le dit le philosophe Alain, « la guerre naît des passions ». »$$,
      'questions', array[
        $$Donne l'idée générale de cette situation.$$,
        $$Identifie, à travers la situation, la cause immédiate de la Première Guerre mondiale.$$,
        $$Explique la phrase : « On a souvent dit de l'Europe qu'elle était une poudrière prête à exploser au cours des années précédant la Première Guerre mondiale. »$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels deux blocs d'alliances se sont formés en Europe avant 1914 ?$$,
      'hint', $$L'un regroupe l'Allemagne, l'autre la France.$$,
      'expected', $$La Triple Alliance (Allemagne, Autriche-Hongrie, Italie) et la Triple Entente (France, Russie, Royaume-Uni).$$
    ),
    jsonb_build_object(
      'question', $$Quel événement précis a déclenché la Première Guerre mondiale, et à quelle date ?$$,
      'hint', $$C'est un assassinat, à Sarajevo.$$,
      'expected', $$L'assassinat de l'archiduc François-Ferdinand à Sarajevo, le 28 juin 1914.$$
    ),
    jsonb_build_object(
      'question', $$Combien de morts (militaires et civils) la Première Guerre mondiale a-t-elle causés en Europe ?$$,
      'hint', $$C'est un chiffre proche de 8,5 millions.$$,
      'expected', $$Environ 8,5 millions de morts.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sanctions le traité de Versailles a-t-il imposées à l'Allemagne ?$$,
      'hint', $$Elles touchent le territoire, l'armée et l'argent.$$,
      'expected', $$Le versement de 132 milliards de mark-or de réparations, le désarmement/démilitarisation, et la perte de ses colonies africaines.$$
    )
  ),
  now()
);
