-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1860: "EE 13: Résumé_Texte_Argu_Identifier_Situat_argumentation"
-- (https://lyc.ecole-ci.org/course/view.php?id=1860), resource id 15782 —
-- "Séance 2 : identifier la situation d'argumentation" (Leçon 3 : le
-- résumé du texte argumentatif). Méthodologie réécrite à partir du PDF
-- source (situation d'argumentation = thème + thèse de l'auteur +
-- structure détaillée du texte, un titre par paragraphe + visée
-- argumentative). Comme pour la séance précédente, les deux textes
-- intégraux réels du PDF (article signé, extrait de Michel Tournier) sont
-- remplacés par le même texte original sur l'orpaillage clandestin déjà
-- utilisé (EE 12), pour garder la continuité pédagogique tout en restant
-- 100% original.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-resume-situation-argumentation',
  '1ere',
  'A',
  'francais',
  $$Le résumé du texte argumentatif : identifier la situation d'argumentation$$,
  13,
  '1ere-a-fr-resume-repondre-questions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour résumer efficacement un texte argumentatif, il ne suffit pas de dégager isolément le thème ou une expression : il faut construire une vue d'ensemble, appelée « situation d'argumentation », qui articule le thème, la thèse de l'auteur, la structure paragraphe par paragraphe et la visée argumentative. On reprend le texte support sur l'orpaillage clandestin déjà étudié.

Texte support (rappel) : « Depuis plusieurs années, l'orpaillage clandestin gagne du terrain dans certaines régions de la Côte d'Ivoire. Des jeunes désertent les salles de classe pour se ruer vers des sites d'extraction improvisés, creusés à la hâte au cœur des forêts. L'espoir d'un enrichissement rapide agit comme un aimant sur une jeunesse en quête d'avenir, dans des zones où le chômage frappe durement.

Pourtant, derrière la promesse d'un gain facile se cache une réalité bien plus sombre. Les galeries creusées sans aucune norme de sécurité s'effondrent régulièrement, ensevelissant des travailleurs sous des tonnes de terre. Le mercure utilisé pour séparer l'or du minerai empoisonne les cours d'eau environnants, rendant impropres à la consommation des rivières entières dont dépendent des villages voisins pour l'agriculture et la pêche.

Au-delà des dégâts environnementaux, c'est tout un tissu social qui se délite : des villages voient leur jeunesse déserter les champs familiaux, préférant le mirage de l'or à la lente construction d'un avenir par l'école. Les autorités multiplient les campagnes de sensibilisation et les opérations de démantèlement des sites illégaux. Mais tant que la pauvreté persistera dans ces zones rurales, l'orpaillage clandestin renaîtra, tel un mal chronique : aussitôt un site fermé, un autre s'ouvre non loin.

Il devient donc urgent de s'attaquer aux racines du problème plutôt qu'à ses seules manifestations : sans perspectives économiques réelles pour la jeunesse rurale, aucune répression, aussi sévère soit-elle, ne suffira à endiguer durablement ce fléau. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la « situation d'argumentation » ?$$,
        'body', $$La situation d'argumentation regroupe quatre éléments à identifier ensemble pour bien comprendre un texte argumentatif : le thème (de quoi parle le texte), la thèse de l'auteur (son point de vue précis sur ce thème), la structure du texte (les grandes étapes de son raisonnement, souvent un titre par paragraphe) et la visée argumentative (ce que l'auteur veut obtenir du lecteur). Réunis, ces quatre éléments donnent une vue d'ensemble du texte avant de le résumer.$$,
        'highlights', array[$$thème$$, $$thèse$$, $$structure$$, $$visée argumentative$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les quatre éléments à identifier pour dégager la situation d'argumentation d'un texte ?$$, 'solution', $$Le thème, la thèse de l'auteur, la structure du texte et la visée argumentative.$$)
      ),
      jsonb_build_object(
        'heading', $$Distinguer le thème et la thèse$$,
        'body', $$Le thème est le sujet général du texte (souvent formulé en groupe nominal). La thèse est le point de vue précis que l'auteur défend sur ce thème (formulée en phrase complète). Ne pas confondre les deux est essentiel : deux auteurs peuvent traiter le même thème avec des thèses opposées.$$,
        'highlights', array[$$thème = groupe nominal$$, $$thèse = phrase, point de vue précis$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le texte support sur l'orpaillage clandestin, dégage le thème puis la thèse de l'auteur.$$, 'solution', $$Thème : les causes et les dangers de l'orpaillage clandestin en Côte d'Ivoire. Thèse : l'auteur soutient que seule une action sur les causes économiques profondes (la pauvreté, le manque de perspectives) permettra de venir à bout durablement du phénomène, la répression seule étant insuffisante.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi deux auteurs traitant du même thème peuvent-ils défendre des thèses différentes ?$$, 'solution', $$Parce que le thème est seulement le sujet abordé, alors que la thèse est le point de vue personnel de chaque auteur sur ce sujet — deux points de vue opposés peuvent porter sur le même thème.$$)
      ),
      jsonb_build_object(
        'heading', $$Donner un titre à chaque paragraphe$$,
        'body', $$Pour dégager la structure détaillée du texte, on résume chaque paragraphe en un titre court qui capture son idée essentielle. Cette liste de titres, mise bout à bout, doit permettre de suivre le fil du raisonnement de l'auteur sans relire le texte en entier.$$,
        'highlights', array[$$un titre court par paragraphe$$, $$suivre le raisonnement sans relire le texte$$]::text[],
        'example', jsonb_build_object('statement', $$Donne un titre à chacun des quatre paragraphes du texte support sur l'orpaillage clandestin.$$, 'solution', $$Paragraphe 1 : L'attrait de l'orpaillage clandestin pour une jeunesse rurale sans perspectives. Paragraphe 2 : Les dangers réels cachés derrière la promesse d'un gain facile (effondrements, pollution au mercure). Paragraphe 3 : L'échec de la seule répression face à un phénomène qui se régénère sans cesse. Paragraphe 4 : L'appel à s'attaquer aux causes économiques profondes du problème.$$),
        'fixation', jsonb_build_object('question', $$À quoi doit servir la liste des titres de paragraphes, une fois réunie ?$$, 'solution', $$Elle doit permettre de suivre le fil du raisonnement de l'auteur sans avoir à relire le texte en entier.$$)
      ),
      jsonb_build_object(
        'heading', $$Formuler la visée argumentative à partir de la situation complète$$,
        'body', $$Une fois le thème, la thèse et la structure identifiés, la visée argumentative se dégage naturellement : elle synthétise ce que l'auteur cherche à obtenir du lecteur, en s'appuyant sur l'ensemble du raisonnement suivi de paragraphe en paragraphe.$$,
        'highlights', array[$$synthèse finale de la situation d'argumentation$$]::text[],
        'example', jsonb_build_object('statement', $$Formule la visée argumentative du texte support, en t'appuyant sur la thèse et la structure dégagées plus haut.$$, 'solution', $$L'auteur cherche à convaincre le lecteur (et les autorités) que la lutte contre l'orpaillage clandestin ne peut se limiter à la répression des sites illégaux : elle doit s'attaquer aux causes économiques profondes du phénomène, sous peine de le voir renaître indéfiniment.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dégage-t-on la visée argumentative en dernier, après le thème, la thèse et la structure ?$$, 'solution', $$Parce qu'elle synthétise l'ensemble de ces éléments : elle ne peut être formulée avec précision qu'une fois le raisonnement complet du texte bien compris.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte support sur l'orpaillage clandestin donné en début de cours.$$,
      'questions', array[
        $$Dégage le thème et la thèse de l'auteur pour ce texte.$$,
        $$Propose un titre pour chacun des quatre paragraphes du texte.$$,
        $$Formule la visée argumentative de l'auteur en une phrase.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les quatre éléments de la situation d'argumentation d'un texte ?$$,
      'hint', $$C'est un ensemble de quatre éléments complémentaires.$$,
      'expected', $$Le thème, la thèse de l'auteur, la structure du texte, et la visée argumentative.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre le thème et la thèse d'un texte argumentatif ?$$,
      'hint', $$L'un est général, l'autre est un point de vue précis.$$,
      'expected', $$Le thème est le sujet général du texte ; la thèse est le point de vue précis que l'auteur défend sur ce sujet.$$
    ),
    jsonb_build_object(
      'question', $$À quoi sert de donner un titre à chaque paragraphe d'un texte argumentatif ?$$,
      'hint', $$Pense à la structure du texte.$$,
      'expected', $$Cela permet de dégager la structure détaillée du texte et de suivre le fil du raisonnement de l'auteur sans le relire en entier.$$
    ),
    jsonb_build_object(
      'question', $$La visée argumentative se dégage-t-elle avant ou après avoir identifié le thème, la thèse et la structure ?$$,
      'hint', $$Elle synthétise les autres éléments.$$,
      'expected', $$Après, car elle synthétise l'ensemble de ces éléments une fois le raisonnement complet du texte bien compris.$$
    )
  ),
  now()
);
