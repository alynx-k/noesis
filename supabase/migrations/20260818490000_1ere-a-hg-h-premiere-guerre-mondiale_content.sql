-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 883: "1ère_HISTOIRE_T3_L1: LA PREMIERE GUERRE MONDIALE:
-- Causes et Conséquences" (https://lyc.ecole-ci.org/course/view.php?id=883),
-- resource id 4245. Contenu réécrit à partir du PDF source (causes
-- lointaines/immédiates, conséquences humaines/économiques/politiques,
-- traité de Versailles, SDN). Faits, dates et chiffres réels (attentat de
-- Sarajevo, alliances, chiffres de pertes, clauses du traité) repris tels
-- quels ; explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-premiere-guerre-mondiale',
  '1ere',
  'A',
  'histoire-geographie',
  $$La Première Guerre mondiale : causes et conséquences$$,
  14,
  '1ere-a-hg-h-colonisation-resistances-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En triant les affaires de son défunt grand-père, un élève de 1ère A découvre une photo de celui-ci, joyeux parmi des soldats blancs. Sa grand-mère lui explique qu'il a participé à la guerre de 1914. Curieux d'en savoir davantage, la classe décide de mener des recherches pour connaître les causes de cette guerre et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes lointaines : rivalités politiques et économiques$$,
        'body', $$Entre 1905 et 1911, la France et l'Allemagne s'opposent pour le contrôle du Maroc. En 1909, une tension oppose la Russie et l'Autriche-Hongrie autour des Balkans, où la Serbie (alliée de la Russie) bloque les ambitions austro-hongroises. La France revendique l'Alsace-Lorraine, perdue face à l'Allemagne à Sedan en 1870, tandis que l'Italie réclame à l'Autriche-Hongrie les « terres irrédentes » (Istrie, Trentin, Dalmatie). Sur le plan économique, l'Allemagne ravit à l'Angleterre le monopole industriel européen à partir de 1906, menant une politique expansionniste (la « weltpolitik ») qui exacerbe la concurrence entre les deux puissances dès 1907.$$,
        'highlights', array[$$Maroc (1905-1911) : France vs Allemagne$$, $$Alsace-Lorraine perdue en 1870$$, $$weltpolitik allemande dès 1906$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels territoires la France revendiquait-elle à l'Allemagne avant 1914 ?$$, 'solution', $$L'Alsace et la Lorraine, perdues lors de la bataille de Sedan en 1870.$$)
      ),
      jsonb_build_object(
        'heading', $$Les systèmes d'alliances et la course aux armements$$,
        'body', $$Deux blocs se forment : la Triple Alliance (Allemagne, Autriche-Hongrie, Italie, 1879-1882) et la Triple Entente (France, Russie, Royaume-Uni, 1892-1907). Ces alliances défensives visent à intervenir en cas d'attaque contre l'un de leurs membres. Elles déclenchent une course aux armements : en 1914, la Russie aligne 1 200 000 soldats, la Grande-Bretagne 64 bateaux cuirassés contre 40 pour l'Allemagne, la France consacre 34% de son budget à l'armement, et l'Autriche-Hongrie dispose de la meilleure artillerie d'Europe. L'Europe devient une véritable « poudrière ».$$,
        'highlights', array[$$Triple Alliance : Allemagne, Autriche-Hongrie, Italie$$, $$Triple Entente : France, Russie, Royaume-Uni$$, $$course aux armements$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Triple Alliance (1879-1882)$$, $$Triple Entente (1892-1907)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array('Allemagne, Autriche-Hongrie, Italie', 'France, Russie, Royaume-Uni')
          )
        ),
        'fixation', jsonb_build_object('question', $$Quels sont les trois pays membres de la Triple Entente ?$$, 'solution', $$La France, la Russie et le Royaume-Uni.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes immédiates : nationalismes et attentat de Sarajevo$$,
        'body', $$La fusion de l'Autriche-Hongrie en 1867 rassemble des peuples divers (Allemands, Hongrois, Tchèques, Serbes, Croates...), suscitant des mécontentements nationalistes, notamment chez les Serbes qui veulent unir les peuples slaves des Balkans. Le 28 juin 1914, l'archiduc François-Ferdinand, prince héritier d'Autriche-Hongrie, et son épouse sont assassinés à Sarajevo par Gavrilo Princip, étudiant bosniaque membre de l'organisation nationaliste serbe « la Main noire ». Face au refus serbe d'un ultimatum, l'Autriche-Hongrie déclare la guerre à la Serbie. Par le jeu des alliances, la Russie déclare la guerre à l'Autriche-Hongrie (1er août), puis l'Allemagne à la France (3 août) et au Royaume-Uni (4 août, après avoir violé la neutralité belge) : le conflit se généralise.$$,
        'highlights', array[$$assassinat de François-Ferdinand : 28 juin 1914, Sarajevo$$, $$auteur : Gavrilo Princip, « la Main noire »$$, $$généralisation par le jeu des alliances (1er-4 août 1914)$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui a assassiné l'archiduc François-Ferdinand à Sarajevo, et à quelle date ?$$, 'solution', $$Gavrilo Princip, étudiant bosniaque membre de l'organisation « la Main noire », le 28 juin 1914.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences humaines et économiques$$,
        'body', $$La guerre fait 8,5 millions de morts (militaires et civils confondus) et 20 millions de mutilés et blessés en Europe, touchant particulièrement la population active masculine : la France perd 20% de sa population active, dont 14% d'hommes, laissant de nombreuses veuves et orphelins. Sur le plan économique, l'Europe, ruinée, endettée et confrontée à une crise de sous-production, perd sa place de première puissance mondiale au profit des États-Unis et du Japon.$$,
        'highlights', array[$$8,5 millions de morts, 20 millions de blessés$$, $$France : -20% de population active$$, $$Europe supplantée par USA et Japon$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle proportion de sa population active la France a-t-elle perdue pendant la guerre ?$$, 'solution', $$20% de sa population active, dont 14% d'hommes.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences politiques : traité de Versailles et SDN$$,
        'body', $$L'Autriche-Hongrie éclate, donnant naissance à de nouveaux États (Autriche, Hongrie, Tchécoslovaquie, Yougoslavie, Pologne, Finlande, Estonie, Lettonie, Lituanie). Le traité de Versailles, signé le 28 juin 1919, désigne l'Allemagne comme responsable de la guerre : elle doit verser 132 milliards de marks-or de réparations, est désarmée et démilitarisée (armée limitée à 100 000 hommes, chars et aviation interdits), et perd ses colonies africaines (Togo, Cameroun, Rwanda, Burundi, Tanzanie, Namibie) au profit de la France, du Royaume-Uni et de la Belgique. L'Allemagne considère ce traité comme un « Diktat ». En 1920, à l'initiative du président américain Wilson, les Alliés créent la Société des Nations (SDN) pour maintenir la paix — mais sans armée propre et sans les États-Unis comme membres, elle reste impuissante à faire respecter ses décisions.$$,
        'highlights', array[$$traité de Versailles : 28 juin 1919$$, $$132 milliards de marks-or de réparations$$, $$SDN créée en 1920 (initiative de Wilson)$$]::text[],
        'property', jsonb_build_object('label', $$Clauses du traité de Versailles$$, 'text', $$Armée allemande limitée à 100 000 hommes ; fabrication de tanks interdite ; aucune aviation militaire autorisée ; occupation alliée de la rive gauche du Rhin pendant 15 ans.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi la SDN, créée en 1920, n'a-t-elle pas pu faire respecter efficacement ses décisions ?$$, 'solution', $$Parce qu'elle ne disposait d'aucune armée propre, et que les États-Unis, pourtant à l'initiative de sa création, n'en étaient pas membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un présentateur de documentaire affirme : « On a souvent dit de l'Europe qu'elle était une poudrière prête à exploser au cours des années précédant la Première Guerre mondiale. Cette explosion se produisit finalement à Sarajevo, en Bosnie, à l'été 1914. » Il conclut : « La responsabilité de la guerre incombe en grande partie aux empires centraux mais les futurs vainqueurs ne peuvent pas être exonérés de responsabilités car, comme le dit le philosophe Alain, "la guerre naît des passions". »$$,
      'questions', array[
        $$Donne l'idée générale de cette situation.$$,
        $$Identifie, à travers la situation, la cause immédiate de la Première Guerre mondiale.$$,
        $$Explique la phrase : « On a souvent dit de l'Europe qu'elle était une poudrière prête à exploser au cours des années précédant la Première Guerre mondiale. »$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois pays membres de la Triple Alliance ?$$,
      'hint', $$Elle a été formée entre 1879 et 1882.$$,
      'expected', $$L'Allemagne, l'Autriche-Hongrie et l'Italie.$$
    ),
    jsonb_build_object(
      'question', $$Quel événement précis a déclenché l'entrée en guerre de l'Autriche-Hongrie contre la Serbie ?$$,
      'hint', $$C'est un assassinat survenu à Sarajevo.$$,
      'expected', $$L'assassinat de l'archiduc François-Ferdinand, le 28 juin 1914.$$
    ),
    jsonb_build_object(
      'question', $$Combien de marks-or l'Allemagne devait-elle verser en réparations selon le traité de Versailles ?$$,
      'hint', $$C'est un chiffre très élevé, en milliards.$$,
      'expected', $$132 milliards de marks-or.$$
    ),
    jsonb_build_object(
      'question', $$Sur l'initiative de quel président américain la SDN a-t-elle été créée en 1920 ?$$,
      'hint', $$Son pays, pourtant à l'origine de l'idée, n'en deviendra pas membre.$$,
      'expected', $$Le président Woodrow Wilson.$$
    )
  ),
  now()
);
