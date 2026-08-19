-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2336: "EE 14: Résumé_Texte_Argu_Sélection_ench_logique"
-- (https://lyc.ecole-ci.org/course/view.php?id=2336), resource id 21438.
-- The pedagogical method (sélection des idées essentielles par paragraphe,
-- enchaînement logique par connecteurs) is reproduced from the source,
-- which is methodological and not subject to copyright concern. As in the
-- two prior migrations, the source's texte-support ("Foot africain :
-- danger !", Alphonse Boolamou de Ligouri, 2006) and its evaluation text
-- (Michel Tournier, "Le vol du vampire", 1981) were NOT reproduced — both
-- are full copyrighted argumentative essays. The original "Jeunes
-- footballeurs africains" text composed for the two previous migrations
-- (1ere-c-francais-resume-argumentatif-repondre-questions and
-- ...-situation-argumentation) is reused here for continuity.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-resume-argumentatif-selection-enchainement',
  '1ere',
  'C',
  'francais',
  $$Le résumé du texte argumentatif : sélectionner les idées et les enchaîner$$,
  14,
  '1ere-c-francais-resume-argumentatif-situation-argumentation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Voici de nouveau le texte « Jeunes footballeurs africains : la ruée dangereuse » : « Chaque année, des milliers de jeunes garçons africains rêvent de devenir footballeurs professionnels en Europe. Ce rêve, alimenté par les success-stories de quelques rares champions partis de rien, attire une multitude de familles convaincues que leur fils est le prochain grand talent qui changera leur destin. Des hommes se présentant comme des agents ou des recruteurs profitent de cet espoir : ils promettent un essai dans un grand club européen contre une somme d'argent, souvent l'équivalent de plusieurs années d'économies familiales.

Le prix à payer est lourd. De nombreuses familles vendent leur terrain, leur bétail ou empruntent auprès de proches pour financer le voyage de leur enfant. L'adolescent, parfois âgé de quinze ou seize ans, embarque seul, sans protection ni suivi véritable, vers un continent qu'il ne connaît pas. Une fois sur place, l'essai promis n'a souvent jamais lieu : le prétendu agent disparaît avec l'argent, laissant le jeune livré à lui-même, sans papiers, sans famille, et sans le moindre club prêt à l'accueillir.

Qui profite réellement de ce système ? Certainement pas les enfants ni leurs familles, qui perdent à la fois leurs économies et, bien souvent, tout contact avec leur fils exilé. Les véritables bénéficiaires sont ces réseaux informels d'intermédiaires sans scrupules, qui exploitent l'espoir légitime de familles entières pour s'enrichir rapidement, sans jamais avoir l'intention de tenir leurs promesses.

Le paradoxe est cruel : l'Afrique regorge d'un talent footballistique immense, reconnu dans le monde entier. Mais ce talent, au lieu d'être cultivé sur place, dans des centres de formation sérieux et encadrés, devient la matière première d'un trafic qui profite à des individus sans scrupules plutôt qu'au développement du football local. Le manque d'infrastructures et de structures de formation solides sur le continent alimente directement cet exode précoce et dangereux.

Les conséquences dépassent le seul drame individuel de chaque enfant exploité. Le football local, déjà fragilisé par le manque de moyens, perd chaque année une partie de sa relève la plus prometteuse, partie tenter sa chance dans des conditions périlleuses plutôt que de grandir au sein de championnats nationaux qui pourraient, avec plus d'investissement, devenir eux-mêmes compétitifs.

Il est urgent que les fédérations sportives, les gouvernements et les familles elles-mêmes prennent conscience de ce fléau. Réguler les intermédiaires, investir dans des centres de formation locaux crédibles, et informer les familles sur les risques de ces filières informelles : voilà les conditions pour que le talent africain grandisse chez lui, dans la dignité, avant de s'exporter, s'il le souhaite, dans de bonnes conditions. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Sélectionner les idées essentielles$$,
        'body', $$Pour chaque paragraphe, il s'agit de repérer les phrases ou propositions qui portent l'idée directrice et les arguments principaux, en écartant les exemples, les illustrations détaillées, les répétitions et les développements secondaires. On retient l'essentiel du raisonnement, pas son habillage.$$,
        'highlights', array[$$sélectionner = garder l'idée directrice et les arguments ; écarter exemples, illustrations, répétitions$$]::text[],
        'example', jsonb_build_object('statement', $$Sélectionne les idées essentielles du premier paragraphe du texte.$$, 'solution', $$Idées essentielles : chaque année, des milliers de jeunes Africains rêvent de devenir footballeurs professionnels en Europe ; des faux agents profitent de cet espoir en promettant un essai contre de l'argent.$$),
        'fixation', jsonb_build_object('question', $$Que doit-on écarter lorsqu'on sélectionne les idées essentielles d'un paragraphe ?$$, 'solution', $$Les exemples, les illustrations détaillées, les répétitions et les développements secondaires qui n'apportent pas d'idée nouvelle.$$)
      ),
      jsonb_build_object(
        'heading', $$Sélection appliquée à l'ensemble du texte$$,
        'body', $$Paragraphe 2 : les familles se ruinent pour financer le voyage ; l'adolescent, parti seul, se retrouve abandonné sans protection. Paragraphe 3 : les vrais bénéficiaires du système sont les réseaux d'intermédiaires sans scrupules, non les familles. Paragraphe 4 : le talent africain existe réellement, mais il est mal exploité faute d'infrastructures locales. Paragraphe 5 : le football local perd sa relève, ce qui affaiblit les championnats nationaux. Paragraphe 6 : il est urgent de réguler les intermédiaires et d'investir dans des centres de formation locaux.$$,
        'highlights', array[$$une idée essentielle par paragraphe, formulée de façon concise$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est l'idée essentielle du paragraphe 4 du texte ?$$, 'solution', $$Le talent footballistique africain est réel, mais il est mal exploité, faute d'infrastructures et de structures de formation locales solides.$$)
      ),
      jsonb_build_object(
        'heading', $$Établir un enchaînement logique$$,
        'body', $$Une fois les idées essentielles sélectionnées, il faut les relier entre elles par des connecteurs logiques qui traduisent la relation exacte entre elles : addition (de plus, par ailleurs), cause (en effet, car, parce que), conséquence (ainsi, par conséquent, de ce fait), opposition (mais, cependant, toutefois), ou conclusion (en somme, en définitive). Le choix du connecteur doit refléter fidèlement le rapport logique voulu par l'auteur.$$,
        'highlights', array[$$connecteurs : addition, cause, conséquence, opposition, conclusion — chacun selon le rapport logique exact entre les idées$$]::text[],
        'example', jsonb_build_object('statement', $$Relie par un connecteur logique approprié les idées essentielles des paragraphes 1 et 2 : « des faux agents profitent de l'espoir des familles » et « les familles se ruinent pour financer le voyage de leur enfant ».$$, 'solution', $$« En conséquence, de nombreuses familles se ruinent pour financer le voyage de leur enfant. » (le connecteur « en conséquence » traduit le lien de cause à effet entre l'exploitation par les faux agents et le sacrifice financier des familles.)$$),
        'fixation', jsonb_build_object('question', $$Quel type de connecteur logique faut-il utiliser pour relier deux idées lorsque la seconde contredit ou nuance la première ?$$, 'solution', $$Un connecteur d'opposition, comme « mais », « cependant » ou « toutefois ».$$)
      ),
      jsonb_build_object(
        'heading', $$Enchaînement complet des idées essentielles$$,
        'body', $$Voici un enchaînement possible des six idées essentielles : « Chaque année, des milliers de jeunes Africains rêvent d'une carrière en Europe, un espoir exploité par de faux agents. En conséquence, des familles entières se ruinent pour financer un voyage qui se solde souvent par l'abandon de l'enfant. Or, les seuls bénéficiaires de ce système sont ces réseaux d'intermédiaires malhonnêtes. Pourtant, le talent africain est bien réel : c'est le manque d'infrastructures locales qui alimente cet exode. Par conséquent, le football local perd sa relève et s'affaiblit. Il est donc urgent de réguler ces filières et d'investir dans la formation locale. »$$,
        'highlights', array[$$un enchaînement logique transforme une liste d'idées en un texte suivi et cohérent$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi l'enchaînement logique est-il une étape indispensable avant de rédiger le résumé final ?$$, 'solution', $$Parce qu'une simple juxtaposition d'idées essentielles ne constitue pas un texte cohérent ; les connecteurs logiques restituent les liens de sens (cause, conséquence, opposition...) qui existaient dans le texte original.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte « Internet et lecture des jeunes : une révolution silencieuse » étudié dans la leçon précédente, composé de quatre paragraphes : (1) Internet a transformé l'accès à la lecture pour les jeunes ; (2) cette révolution a démocratisé l'accès à la lecture (contenus gratuits et abondants) ; (3) mais elle a aussi rendu la lecture plus fragmentée, moins concentrée ; (4) il revient aux familles et aux enseignants d'accompagner les jeunes pour que cette révolution soit une chance plutôt qu'une perte.$$,
      'questions', array[
        $$Formule en une phrase concise l'idée essentielle de chacun des quatre paragraphes.$$,
        $$Identifie le type de rapport logique (cause, conséquence, opposition, addition...) entre l'idée essentielle du paragraphe 2 et celle du paragraphe 3.$$,
        $$Rédige l'enchaînement logique complet des quatre idées essentielles, en utilisant des connecteurs appropriés à chaque transition.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que faut-il faire pour sélectionner l'idée essentielle d'un paragraphe ?$$,
      'hint', $$Il s'agit de distinguer l'essentiel de l'accessoire.$$,
      'expected', $$Repérer l'idée directrice et les arguments principaux, en écartant les exemples, illustrations, répétitions et développements secondaires.$$
    ),
    jsonb_build_object(
      'question', $$Cite un connecteur logique exprimant la cause, et un autre exprimant la conséquence.$$,
      'hint', $$L'un explique le pourquoi, l'autre annonce le résultat.$$,
      'expected', $$Cause : « en effet », « car », « parce que ». Conséquence : « ainsi », « par conséquent », « de ce fait ».$$
    ),
    jsonb_build_object(
      'question', $$Que doit refléter fidèlement le choix d'un connecteur logique entre deux idées essentielles ?$$,
      'hint', $$Ce n'est pas un choix arbitraire de style.$$,
      'expected', $$Le rapport logique exact voulu par l'auteur entre ces deux idées (cause, conséquence, opposition, addition...).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi ne suffit-il pas de juxtaposer les idées essentielles sélectionnées pour obtenir un bon résumé ?$$,
      'hint', $$Cela concerne la cohérence du texte final.$$,
      'expected', $$Parce qu'une simple liste d'idées juxtaposées ne restitue pas les liens logiques (cause, conséquence, opposition) qui structuraient le texte original ; il faut les enchaîner avec des connecteurs appropriés.$$
    )
  ),
  now()
);
