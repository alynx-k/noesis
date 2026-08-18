-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1858: "EE 12: Résumé_Texte_Argu_Répondre_questions"
-- (https://lyc.ecole-ci.org/course/view.php?id=1858), resource id 15758 —
-- "Séance 1 : répondre aux consignes-questions" (Leçon 3 : le résumé du
-- texte argumentatif). Méthodologie réécrite à partir du PDF source
-- (dégager le thème, expliquer une expression en contexte, dégager la
-- structure/les séquences, dégager la visée argumentative). Le PDF
-- source utilise deux textes intégraux réels et longs (un article
-- signé, un extrait de Michel Tournier, Le vol du vampire, 1981), sous
-- droits d'auteur : plutôt que de les reproduire, la méthode est
-- illustrée ici par un texte argumentatif COURT et ENTIÈREMENT ORIGINAL
-- (rédigé pour ce cours, sur l'orpaillage clandestin), pour rester
-- fidèle à la politique « 100% contenu original » de l'application tout
-- en couvrant exactement les mêmes savoir-faire méthodologiques.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-resume-repondre-questions',
  '1ere',
  'A',
  'francais',
  $$Le résumé du texte argumentatif : répondre aux questions$$,
  12,
  '1ere-a-fr-production-ecrite-introduction-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Avant de résumer un texte argumentatif, il faut d'abord le comprendre en profondeur. Des élèves de 1ère A découvrent un texte sur l'orpaillage clandestin et s'organisent pour répondre aux questions de compréhension habituelles : dégager le thème, expliquer une expression en contexte, dégager la structure du texte et sa visée argumentative.

Texte support : « Depuis plusieurs années, l'orpaillage clandestin gagne du terrain dans certaines régions de la Côte d'Ivoire. Des jeunes désertent les salles de classe pour se ruer vers des sites d'extraction improvisés, creusés à la hâte au cœur des forêts. L'espoir d'un enrichissement rapide agit comme un aimant sur une jeunesse en quête d'avenir, dans des zones où le chômage frappe durement. Pourtant, derrière la promesse d'un gain facile se cache une réalité bien plus sombre. Les galeries creusées sans aucune norme de sécurité s'effondrent régulièrement, ensevelissant des travailleurs sous des tonnes de terre. Le mercure utilisé pour séparer l'or du minerai empoisonne les cours d'eau environnants, rendant impropres à la consommation des rivières entières dont dépendent des villages voisins pour l'agriculture et la pêche. Au-delà des dégâts environnementaux, c'est tout un tissu social qui se délite : des villages voient leur jeunesse déserter les champs familiaux, préférant le mirage de l'or à la lente construction d'un avenir par l'école. Les autorités multiplient les campagnes de sensibilisation et les opérations de démantèlement des sites illégaux. Mais tant que la pauvreté persistera dans ces zones rurales, l'orpaillage clandestin renaîtra, tel un mal chronique : aussitôt un site fermé, un autre s'ouvre non loin. Il devient donc urgent de s'attaquer aux racines du problème plutôt qu'à ses seules manifestations : sans perspectives économiques réelles pour la jeunesse rurale, aucune répression, aussi sévère soit-elle, ne suffira à endiguer durablement ce fléau. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Dégager le thème du texte$$,
        'body', $$Le thème est la notion générale sur laquelle porte le texte. On le dégage en identifiant les termes récurrents ou le champ lexical dominant, puis en formulant une réponse courte (un groupe nominal, pas une phrase complète).$$,
        'highlights', array[$$thème = notion générale$$, $$formulé en groupe nominal$$]::text[],
        'example', jsonb_build_object('statement', $$Dégage le thème du texte support sur l'orpaillage clandestin.$$, 'solution', $$Le thème : les dangers et les causes de l'orpaillage clandestin en Côte d'Ivoire.$$),
        'fixation', jsonb_build_object('question', $$Sous quelle forme formule-t-on généralement la réponse à la question « Dégagez le thème » ?$$, 'solution', $$Un groupe nominal court, pas une phrase complète.$$)
      ),
      jsonb_build_object(
        'heading', $$Expliquer une expression en contexte$$,
        'body', $$Expliquer une expression « en contexte » signifie donner son sens précis tel qu'il fonctionne dans le texte, et non sa définition générale de dictionnaire. On s'appuie sur les phrases qui entourent l'expression pour en dégager le sens exact voulu par l'auteur, souvent en reformulant avec des mots plus simples.$$,
        'highlights', array[$$sens précis dans le texte, pas le sens général$$]::text[],
        'example', jsonb_build_object('statement', $$Explique en contexte l'expression « tel un mal chronique » dans le texte support.$$, 'solution', $$Cette expression compare l'orpaillage clandestin à une maladie qui ne guérit jamais complètement : même quand un site est fermé par les autorités, le problème réapparaît ailleurs, car ses causes profondes (la pauvreté) ne sont pas traitées.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi ne suffit-il pas de donner le sens général d'une expression, indépendamment du texte ?$$, 'solution', $$Parce que le sens en contexte peut être plus précis ou légèrement différent du sens général, et c'est ce sens précis, voulu par l'auteur à cet endroit du texte, qui est attendu.$$)
      ),
      jsonb_build_object(
        'heading', $$Dégager la structure (les séquences) du texte$$,
        'body', $$Un texte argumentatif est souvent organisé en deux ou trois séquences (parties logiques), qu'il faut identifier en repérant les changements de sujet ou d'orientation de l'argumentation. Pour chaque séquence, on précise les paragraphes concernés et on résume en une phrase ce qu'elle démontre.$$,
        'highlights', array[$$séquences = parties logiques$$, $$une phrase par séquence$$]::text[],
        'example', jsonb_build_object('statement', $$Dégage la structure du texte support en deux séquences.$$, 'solution', $$Première séquence (les deux premiers paragraphes) : elle présente l'attrait de l'orpaillage clandestin pour la jeunesse et les dangers réels qu'il cache (effondrements, pollution au mercure). Seconde séquence (les deux derniers paragraphes) : elle montre l'échec des mesures de répression seules et appelle à s'attaquer aux causes économiques profondes du problème.$$),
        'fixation', jsonb_build_object('question', $$Sur quoi s'appuie-t-on pour repérer le passage d'une séquence à une autre dans un texte argumentatif ?$$, 'solution', $$Sur les changements de sujet ou d'orientation de l'argumentation (par exemple le passage de la description d'un problème à l'appel à une solution).$$)
      ),
      jsonb_build_object(
        'heading', $$Dégager la visée argumentative$$,
        'body', $$La visée argumentative est l'intention de l'auteur : que veut-il faire penser, croire ou faire au lecteur ? Elle se formule en une phrase claire qui va au-delà du simple thème, en précisant le but (informer, dénoncer, convaincre, appeler à agir...).$$,
        'highlights', array[$$intention de l'auteur$$, $$au-delà du thème$$]::text[],
        'example', jsonb_build_object('statement', $$Dégage la visée argumentative du texte support.$$, 'solution', $$L'auteur cherche à alerter sur les dangers réels de l'orpaillage clandestin et à convaincre que seule une action sur les causes économiques (pauvreté, manque de perspectives) permettra de résoudre durablement le problème, au-delà de la simple répression.$$),
        'fixation', jsonb_build_object('question', $$En quoi la visée argumentative est-elle différente du thème d'un texte ?$$, 'solution', $$Le thème indique de quoi parle le texte ; la visée argumentative précise ce que l'auteur veut obtenir du lecteur (le convaincre, l'alerter, le faire agir...).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte support sur l'orpaillage clandestin donné en début de cours.$$,
      'questions', array[
        $$Dégage le thème du texte en un groupe nominal court.$$,
        $$Explique en contexte l'expression « le mirage de l'or ».$$,
        $$Dégage la visée argumentative de l'auteur en une phrase.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Sous quelle forme formule-t-on la réponse à « Dégagez le thème d'un texte » ?$$,
      'hint', $$Ce n'est pas une phrase complète.$$,
      'expected', $$Un groupe nominal court.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie « expliquer une expression en contexte » ?$$,
      'hint', $$Ce n'est pas donner sa définition de dictionnaire.$$,
      'expected', $$Donner son sens précis tel qu'il fonctionne dans ce texte précis, en s'appuyant sur les phrases qui l'entourent.$$
    ),
    jsonb_build_object(
      'question', $$Comment repère-t-on les séquences (parties logiques) d'un texte argumentatif ?$$,
      'hint', $$Ce sont des ruptures dans le raisonnement.$$,
      'expected', $$En repérant les changements de sujet ou d'orientation de l'argumentation d'un paragraphe à l'autre.$$
    ),
    jsonb_build_object(
      'question', $$Que désigne la « visée argumentative » d'un texte ?$$,
      'hint', $$Ce n'est pas simplement de quoi parle le texte.$$,
      'expected', $$L'intention de l'auteur, ce qu'il veut faire penser, croire ou faire au lecteur.$$
    )
  ),
  now()
);
