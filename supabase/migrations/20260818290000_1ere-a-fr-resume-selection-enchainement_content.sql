-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1862: "EE 14: Résumé_Texte_Argu_Sélection_ench_logique"
-- (https://lyc.ecole-ci.org/course/view.php?id=1862), resource id 15806 —
-- "Séance 3 : sélectionner les idées essentielles et établir un
-- enchaînement logique" (Leçon 3 : le résumé du texte argumentatif).
-- Méthodologie réécrite à partir du PDF source (repérer, dans chaque
-- paragraphe, les phrases qui portent une idée et écarter les exemples,
-- anecdotes et reformulations ; relier ensuite les idées essentielles
-- retenues par des connecteurs logiques). Comme pour les deux séances
-- précédentes, le texte support est le même texte original sur
-- l'orpaillage clandestin (EE 12/13), pour garder la continuité
-- pédagogique tout en restant 100% original.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-resume-selection-enchainement',
  '1ere',
  'A',
  'francais',
  $$Le résumé du texte argumentatif : sélectionner les idées et les enchaîner$$,
  14,
  '1ere-a-fr-resume-situation-argumentation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir identifié la situation d'argumentation du texte sur l'orpaillage clandestin, les élèves de 1ère A doivent maintenant, paragraphe par paragraphe, repérer les idées vraiment essentielles (en écartant les exemples et les développements secondaires), puis les relier entre elles par des connecteurs logiques, avant de pouvoir rédiger le résumé final.

Texte support (rappel) : « Depuis plusieurs années, l'orpaillage clandestin gagne du terrain dans certaines régions de la Côte d'Ivoire. Des jeunes désertent les salles de classe pour se ruer vers des sites d'extraction improvisés, creusés à la hâte au cœur des forêts. L'espoir d'un enrichissement rapide agit comme un aimant sur une jeunesse en quête d'avenir, dans des zones où le chômage frappe durement.

Pourtant, derrière la promesse d'un gain facile se cache une réalité bien plus sombre. Les galeries creusées sans aucune norme de sécurité s'effondrent régulièrement, ensevelissant des travailleurs sous des tonnes de terre. Le mercure utilisé pour séparer l'or du minerai empoisonne les cours d'eau environnants, rendant impropres à la consommation des rivières entières dont dépendent des villages voisins pour l'agriculture et la pêche.

Au-delà des dégâts environnementaux, c'est tout un tissu social qui se délite : des villages voient leur jeunesse déserter les champs familiaux, préférant le mirage de l'or à la lente construction d'un avenir par l'école. Les autorités multiplient les campagnes de sensibilisation et les opérations de démantèlement des sites illégaux. Mais tant que la pauvreté persistera dans ces zones rurales, l'orpaillage clandestin renaîtra, tel un mal chronique : aussitôt un site fermé, un autre s'ouvre non loin.

Il devient donc urgent de s'attaquer aux racines du problème plutôt qu'à ses seules manifestations : sans perspectives économiques réelles pour la jeunesse rurale, aucune répression, aussi sévère soit-elle, ne suffira à endiguer durablement ce fléau. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Distinguer idée essentielle et idée secondaire$$,
        'body', $$Dans chaque paragraphe, il faut repérer les phrases qui portent une idée nouvelle et véritablement nécessaire à la compréhension du raisonnement (idées essentielles), et écarter celles qui se contentent d'illustrer, de répéter autrement ou de développer par un exemple une idée déjà énoncée (idées secondaires). Une bonne façon de vérifier : si on retire la phrase et que le raisonnement reste compréhensible, elle était probablement secondaire.$$,
        'highlights', array[$$idée essentielle : nouvelle et nécessaire$$, $$idée secondaire : illustration, exemple, répétition$$]::text[],
        'property', jsonb_build_object('label', $$Test$$, 'text', $$Si retirer une phrase ne nuit pas à la compréhension du raisonnement, elle était secondaire.$$),
        'fixation', jsonb_build_object('question', $$Comment vérifier qu'une phrase est bien une idée secondaire et non essentielle ?$$, 'solution', $$En vérifiant que, si on la retire, le raisonnement du paragraphe reste compréhensible.$$)
      ),
      jsonb_build_object(
        'heading', $$Sélectionner les idées essentielles du texte support$$,
        'body', $$Pour le premier paragraphe du texte support, l'idée essentielle est que des jeunes abandonnent l'école pour l'orpaillage clandestin, attirés par l'espoir d'un gain rapide dans des zones touchées par le chômage — la description détaillée des sites improvisés est secondaire. Pour le deuxième paragraphe, l'idée essentielle est que cette activité comporte des dangers graves (effondrements, pollution au mercure) — les détails sur la contamination des rivières précisent mais n'ajoutent pas d'idée nouvelle.$$,
        'highlights', array[$$une idée essentielle par paragraphe (au moins)$$],
        'example', jsonb_build_object('statement', $$Sélectionne l'idée essentielle du troisième paragraphe du texte support (sur l'échec de la répression).$$, 'solution', $$Malgré les campagnes de sensibilisation et les opérations de démantèlement menées par les autorités, l'orpaillage clandestin persiste tant que la pauvreté n'est pas réglée dans ces zones rurales.$$),
        'fixation', jsonb_build_object('question', $$Dans le texte support, l'expression « tel un mal chronique » est-elle une idée essentielle ou une image qui illustre une idée déjà énoncée ?$$, 'solution', $$C'est une image qui illustre l'idée déjà énoncée (la persistance du phénomène malgré la répression) ; elle ne doit donc pas être reprise telle quelle dans le résumé.$$)
      ),
      jsonb_build_object(
        'heading', $$Relier les idées essentielles par des connecteurs logiques$$,
        'body', $$Une fois les idées essentielles sélectionnées, il ne faut pas les juxtaposer sans lien : on les relie par des connecteurs logiques adaptés à la relation qui les unit (cause : parce que, car ; conséquence : donc, ainsi ; opposition : mais, cependant, pourtant ; addition : de plus, par ailleurs). Le choix du connecteur doit refléter fidèlement le rapport logique voulu par l'auteur, pas seulement enchaîner les phrases au hasard.$$,
        'highlights', array[$$connecteurs adaptés au rapport logique$$, $$cause, conséquence, opposition, addition$$]::text[],
        'example', jsonb_build_object('statement', $$Relie par un connecteur logique les deux idées essentielles suivantes : « Des jeunes désertent l'école pour l'orpaillage clandestin, attirés par l'espoir d'un gain rapide » et « Cette activité comporte des dangers graves ».$$, 'solution', $$Des jeunes désertent l'école pour l'orpaillage clandestin, attirés par l'espoir d'un gain rapide ; pourtant, cette activité comporte des dangers graves.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le choix du connecteur logique ne doit-il pas être arbitraire ?$$, 'solution', $$Parce qu'il doit refléter fidèlement le rapport logique (cause, conséquence, opposition...) réellement établi par l'auteur entre les deux idées, sous peine de trahir son raisonnement.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple complet : du texte support aux idées enchaînées$$,
        'body', $$En appliquant cette démarche aux quatre paragraphes du texte support, on obtient une chaîne d'idées essentielles reliées logiquement, qui constitue l'ossature du futur résumé, avant même sa rédaction définitive au style condensé.$$,
        'highlights', array[$$chaîne d'idées = ossature du résumé$$],
        'example', jsonb_build_object('statement', $$Relie les quatre idées essentielles du texte support en une chaîne logique complète.$$, 'solution', $$Des jeunes désertent l'école pour l'orpaillage clandestin, attirés par l'espoir d'un gain rapide dans des zones touchées par le chômage. Pourtant, cette activité comporte des dangers graves : effondrements de galeries et pollution des rivières au mercure. De plus, malgré les campagnes de sensibilisation et de démantèlement, le phénomène persiste tant que la pauvreté n'est pas réglée. C'est pourquoi il devient urgent de s'attaquer aux causes économiques du problème plutôt qu'à ses seules manifestations.$$),
        'fixation', jsonb_build_object('question', $$Que représente la chaîne d'idées essentielles reliées logiquement, une fois obtenue ?$$, 'solution', $$L'ossature du futur résumé, sur laquelle s'appuiera la rédaction finale au style condensé.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte support sur l'orpaillage clandestin donné en début de cours.$$,
      'questions', array[
        $$Sélectionne l'idée essentielle du quatrième paragraphe (l'appel à s'attaquer aux causes économiques).$$,
        $$Explique pourquoi la phrase « aussitôt un site fermé, un autre s'ouvre non loin » est secondaire par rapport à l'idée « l'orpaillage persiste malgré la répression ».$$,
        $$Propose un connecteur logique adapté pour relier l'idée « les autorités multiplient les opérations de démantèlement » à l'idée « le phénomène persiste ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment reconnaît-on qu'une phrase porte une idée secondaire plutôt qu'essentielle ?$$,
      'hint', $$Fais le test du retrait.$$,
      'expected', $$Si on peut la retirer sans nuire à la compréhension du raisonnement du paragraphe, c'est une idée secondaire.$$
    ),
    jsonb_build_object(
      'question', $$Quel type de connecteur logique utilise-t-on pour marquer une opposition entre deux idées ?$$,
      'hint', $$Donne un exemple parmi « mais, cependant, pourtant... ».$$,
      'expected', $$Un connecteur d'opposition, par exemple « mais », « cependant » ou « pourtant ».$$
    ),
    jsonb_build_object(
      'question', $$Peut-on juxtaposer les idées essentielles sans aucun connecteur dans un résumé ?$$,
      'hint', $$Pense à la lisibilité et à la fidélité au raisonnement.$$,
      'expected', $$Non : il faut les relier par des connecteurs logiques adaptés pour respecter le raisonnement de l'auteur et rendre le résumé lisible.$$
    ),
    jsonb_build_object(
      'question', $$À quoi sert la chaîne d'idées essentielles reliées logiquement, une fois construite ?$$,
      'hint', $$Ce n'est pas encore le résumé final.$$,
      'expected', $$Elle sert d'ossature pour la rédaction définitive du résumé, au style condensé.$$
    )
  ),
  now()
);
