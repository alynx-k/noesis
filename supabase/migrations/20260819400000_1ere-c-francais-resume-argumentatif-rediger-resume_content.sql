-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2338: "EE 16: Résumé_Texte_Argu_Rédiger_résumé"
-- (https://lyc.ecole-ci.org/course/view.php?id=2338), resource id 21462.
-- The pedagogical method (calcul du volume au 1/4 avec marge de tolérance
-- de 10%, rédaction d'un résumé fluide à partir des idées reformulées) is
-- reproduced from the source, which is methodological and not subject to
-- copyright concern. As in the four prior migrations, the source's
-- texte-support ("Foot africain : danger !", Alphonse Boolamou de Ligouri,
-- 2006) and its evaluation text (Michel Tournier, "Le vol du vampire",
-- 1981) were NOT reproduced — both are full copyrighted argumentative
-- essays. The original "Jeunes footballeurs africains" text composed for
-- the four previous migrations is reused here to complete the résumé
-- exercise, with an authentic word count (410 words) and a résumé (108
-- words) genuinely computed to respect the same 1/4-volume, ±10% rule
-- taught in the source lesson.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-resume-argumentatif-rediger-resume',
  '1ere',
  'C',
  'francais',
  $$Le résumé du texte argumentatif : rédiger le résumé$$,
  16,
  '1ere-c-francais-resume-argumentatif-reformuler-idees',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Voici de nouveau le texte « Jeunes footballeurs africains : la ruée dangereuse » (410 mots) : « Chaque année, des milliers de jeunes garçons africains rêvent de devenir footballeurs professionnels en Europe. Ce rêve, alimenté par les success-stories de quelques rares champions partis de rien, attire une multitude de familles convaincues que leur fils est le prochain grand talent qui changera leur destin. Des hommes se présentant comme des agents ou des recruteurs profitent de cet espoir : ils promettent un essai dans un grand club européen contre une somme d'argent, souvent l'équivalent de plusieurs années d'économies familiales.

Le prix à payer est lourd. De nombreuses familles vendent leur terrain, leur bétail ou empruntent auprès de proches pour financer le voyage de leur enfant. L'adolescent, parfois âgé de quinze ou seize ans, embarque seul, sans protection ni suivi véritable, vers un continent qu'il ne connaît pas. Une fois sur place, l'essai promis n'a souvent jamais lieu : le prétendu agent disparaît avec l'argent, laissant le jeune livré à lui-même, sans papiers, sans famille, et sans le moindre club prêt à l'accueillir.

Qui profite réellement de ce système ? Certainement pas les enfants ni leurs familles, qui perdent à la fois leurs économies et, bien souvent, tout contact avec leur fils exilé. Les véritables bénéficiaires sont ces réseaux informels d'intermédiaires sans scrupules, qui exploitent l'espoir légitime de familles entières pour s'enrichir rapidement, sans jamais avoir l'intention de tenir leurs promesses.

Le paradoxe est cruel : l'Afrique regorge d'un talent footballistique immense, reconnu dans le monde entier. Mais ce talent, au lieu d'être cultivé sur place, dans des centres de formation sérieux et encadrés, devient la matière première d'un trafic qui profite à des individus sans scrupules plutôt qu'au développement du football local. Le manque d'infrastructures et de structures de formation solides sur le continent alimente directement cet exode précoce et dangereux.

Les conséquences dépassent le seul drame individuel de chaque enfant exploité. Le football local, déjà fragilisé par le manque de moyens, perd chaque année une partie de sa relève la plus prometteuse, partie tenter sa chance dans des conditions périlleuses plutôt que de grandir au sein de championnats nationaux qui pourraient, avec plus d'investissement, devenir eux-mêmes compétitifs.

Il est urgent que les fédérations sportives, les gouvernements et les familles elles-mêmes prennent conscience de ce fléau. Réguler les intermédiaires, investir dans des centres de formation locaux crédibles, et informer les familles sur les risques de ces filières informelles : voilà les conditions pour que le talent africain grandisse chez lui, dans la dignité, avant de s'exporter, s'il le souhaite, dans de bonnes conditions. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Calculer le volume du résumé$$,
        'body', $$Avant de rédiger, il faut calculer le nombre de mots que doit comporter le résumé. On divise le nombre de mots du texte initial par 4 (résumé au quart) ; une marge de tolérance de plus ou moins 10% de ce résultat est généralement admise.$$,
        'highlights', array[$$volume cible = (nombre de mots du texte) / 4$$, $$marge de tolérance : ± 10% du volume cible$$]::text[],
        'example', jsonb_build_object('statement', $$Le texte « Jeunes footballeurs africains » compte 410 mots. Calcule le volume cible du résumé au quart, avec sa marge de tolérance de 10%.$$, 'solution', $$410 ÷ 4 = 102,5, soit environ 103 mots. La marge de tolérance est de 103 × 10/100 ≈ 10 mots. Le résumé doit donc compter entre 93 et 113 mots.$$),
        'fixation', jsonb_build_object('question', $$Comment calcule-t-on la marge de tolérance d'un résumé, une fois le volume cible déterminé ?$$, 'solution', $$On calcule 10% du volume cible (volume cible × 10/100), puis on l'ajoute et on le soustrait au volume cible pour obtenir l'intervalle acceptable.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger le résumé final$$,
        'body', $$Le résumé final assemble les idées essentielles reformulées en un texte suivi et cohérent, relié par des connecteurs logiques. Il ne doit contenir ni citation du texte original, ni commentaire personnel, ni exemple d'illustration : seulement l'essentiel du raisonnement, reformulé et enchaîné.$$,
        'highlights', array[$$le résumé = idées reformulées + connecteurs, sans citation ni commentaire ni exemple$$]::text[],
        'example', jsonb_build_object('statement', $$Voici le résumé rédigé du texte « Jeunes footballeurs africains » (108 mots, dans la marge [93-113]) : « De faux agents exploitent le rêve de gloire européenne de jeunes footballeurs africains, en promettant de faux essais contre de l'argent. Les familles se ruinent alors pour financer ce voyage, qui se solde souvent par l'abandon de l'enfant sur place, livré à lui-même. Seuls les intermédiaires malhonnêtes profitent réellement de ce système. Pourtant, le talent africain existe bel et bien : c'est le manque d'infrastructures locales qui alimente cet exode précoce et dangereux. En conséquence, le football local perd sa relève et s'affaiblit davantage. Il est donc urgent de réguler ces filières et d'investir dans la formation locale, pour que ce talent se développe chez lui, dans la dignité. » Vérifie que ce résumé respecte bien les six idées essentielles du texte.$$, 'solution', $$Les six idées sont bien présentes et enchaînées : (1) le rêve exploité par de faux agents, (2) le sacrifice des familles et l'abandon de l'enfant, (3) les seuls bénéficiaires (les intermédiaires), (4) le paradoxe du talent réel mais mal exploité, (5) l'affaiblissement du football local, (6) l'appel à la régulation et à l'investissement.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui ne doit jamais figurer dans un résumé de texte argumentatif ?$$, 'solution', $$Une citation directe du texte original, un commentaire personnel, ou un exemple d'illustration : le résumé se limite à l'essentiel du raisonnement de l'auteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Vérifier le résumé rédigé$$,
        'body', $$Une fois le résumé rédigé, il faut le relire pour vérifier trois points : le respect du volume calculé (avec sa marge de tolérance) ; la présence de toutes les idées essentielles, sans en oublier ni en ajouter ; et la qualité de l'enchaînement logique entre les idées (cohérence, connecteurs appropriés).$$,
        'highlights', array[$$vérifier : volume respecté + toutes les idées présentes + enchaînement cohérent$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois points à vérifier après avoir rédigé un résumé ?$$, 'solution', $$Le respect du volume calculé avec sa marge de tolérance, la présence de toutes les idées essentielles (sans oubli ni ajout), et la cohérence de l'enchaînement logique entre les idées.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte « Internet et lecture des jeunes : une révolution silencieuse » (160 mots), avec les quatre idées essentielles déjà reformulées dans les leçons précédentes : (1) Internet a transformé l'accès à la lecture pour les jeunes ; (2) cette révolution a démocratisé l'accès à des contenus gratuits et abondants ; (3) mais elle a aussi fragmenté la lecture, rendue moins concentrée ; (4) familles et enseignants doivent accompagner les jeunes pour que cette révolution soit une chance.$$,
      'questions', array[
        $$Calcule le volume cible du résumé de ce texte (au quart de son volume initial), ainsi que sa marge de tolérance de 10%, en donnant l'intervalle de mots acceptable.$$,
        $$Rédige le résumé complet de ce texte, en respectant le volume calculé, en assemblant les quatre idées essentielles reformulées et en les reliant par des connecteurs logiques appropriés.$$,
        $$Relis ton résumé et vérifie qu'il respecte les trois critères : volume dans la marge tolérée, présence des quatre idées essentielles, cohérence de l'enchaînement logique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment calcule-t-on le volume cible d'un résumé « au quart » du texte initial ?$$,
      'hint', $$C'est une simple division.$$,
      'expected', $$On divise le nombre de mots du texte initial par 4.$$
    ),
    jsonb_build_object(
      'question', $$Un texte de 300 mots doit être résumé au quart, avec une marge de tolérance de 10%. Quel est l'intervalle de mots acceptable pour le résumé ?$$,
      'hint', $$Calcule d'abord le volume cible, puis applique la marge.$$,
      'expected', $$Volume cible : 300÷4=75 mots. Marge : 75×10/100=7,5≈8 mots. Intervalle acceptable : entre 67 et 83 mots.$$
    ),
    jsonb_build_object(
      'question', $$Quels trois éléments un résumé de texte argumentatif ne doit-il jamais contenir ?$$,
      'hint', $$Ils reviendraient à ajouter ou à trahir le texte source.$$,
      'expected', $$Une citation directe du texte original, un commentaire personnel, et un exemple d'illustration.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les trois points à vérifier après avoir rédigé un résumé ?$$,
      'hint', $$Ils couvrent la longueur, le contenu et la forme.$$,
      'expected', $$Le respect du volume calculé (avec sa marge de tolérance), la présence de toutes les idées essentielles, et la cohérence de l'enchaînement logique entre les idées.$$
    )
  ),
  now()
);
