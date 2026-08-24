-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 7 : LES RÈGLES DE LA CIRCULATION ROUTIÈRE ET LA
-- SÉCURITÉ DES USAGERS" (id 1717). Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Depuis le début de l'année scolaire, des élèves de ton établissement ont été victimes d'accidents de la circulation routière. Inquiets, les élèves de ta classe décident de s'informer sur les règles de la circulation routière, de comprendre leur importance et de les appliquer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Marques, panneaux et feux tricolores$$,
        'body', $$Les traits continus sur la route interdisent de dépasser ; les traits discontinus autorisent le dépassement ; les bandes blanches (passage clouté) sont réservées à la traversée des piétons. Les panneaux de danger (triangulaires, fond rouge) avertissent d'un danger ; les panneaux d'interdiction (ronds, fond rouge) limitent certains accès ou manœuvres ; les panneaux d'obligation (ronds, fond bleu) imposent une direction ; les panneaux de localisation (carrés/rectangulaires) donnent des informations utiles. Les feux tricolores indiquent : rouge = interdiction de traverser pour le piéton, vert = autorisation de circuler pour les véhicules, orange = interdiction de traverser.$$,
        'highlights', array[$$traits continus = dépassement interdit ; discontinus = dépassement autorisé ; bandes blanches = passage piétons$$, $$danger (triangle rouge) ; interdiction (rond rouge) ; obligation (rond bleu) ; localisation (carré/rectangle)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle forme et quelle couleur ont les panneaux d'interdiction ?$$, 'solution', $$Ils sont ronds, à fond rouge.$$)
      ),
      jsonb_build_object(
        'heading', $$Les règles de la circulation routière$$,
        'body', $$Les règles de la circulation routière sont des attitudes et comportements que doivent observer piétons, automobilistes et conducteurs d'engins à deux roues. Elles comprennent : le respect de la signalisation routière (marques et panneaux) ; le respect de la priorité à droite (céder le passage à tout véhicule venant de la droite en l'absence de signalisation) et la conduite à droite pour les cyclistes ; la visibilité (se rendre visible, surtout la nuit) et le port obligatoire du casque pour les motocyclistes. Quand un agent de circulation est présent, ses indications sont prioritaires : face à lui, il est interdit de passer ; de profil, le passage est autorisé.$$,
        'highlights', array[$$respect de la signalisation + priorité à droite + visibilité/port du casque$$, $$agent de circulation : face = interdit de passer ; profil = autorisé à passer$$]::text[],
        'example', jsonb_build_object('statement', $$Un agent de circulation te fait face au carrefour. Peux-tu passer ?$$, 'solution', $$Non, quand l'agent fait face, il est interdit de passer.$$),
        'fixation', jsonb_build_object('question', $$Que doit obligatoirement porter un motocycliste ?$$, 'solution', $$Un casque.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du respect des règles de la circulation routière$$,
        'body', $$Au niveau individuel, leur respect permet d'éviter les accidents, de préserver les vies humaines et les biens, et d'éviter poursuites judiciaires et amendes. Au niveau familial, il rassure les familles quant à la sécurité de leurs membres. Au niveau de l'État, il permet d'éviter les coûts liés à la prise en charge des accidents et de disposer d'une population bien portante qui contribue au développement.$$,
        'highlights', array[$$individuel : évite accidents, pertes en vies humaines, amendes$$, $$État : évite les coûts des accidents, population bien portante = développement$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le respect des règles routières profite-t-il aussi à l'État ?$$, 'solution', $$Parce qu'il évite les coûts liés à la prise en charge des accidents et garantit une population bien portante, utile au développement.$$),
        'fixation', jsonb_build_object('question', $$Que risque un conducteur qui ne respecte pas les règles de la circulation ?$$, 'solution', $$Des accidents, des poursuites judiciaires et des amendes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après les cours, tes camarades et toi devez traverser la route pour rejoindre l'arrêt de bus. Vous n'êtes pas encore arrivés au passage clouté quand vous voyez le bus commencer à charger. L'un d'entre vous propose de traverser en courant, hors du passage clouté, pour ne pas le manquer.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Énumère trois règles de la circulation routière.$$,
        $$Justifie ton refus de la proposition de ton camarade.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie un trait discontinu sur la chaussée ?$$,
      'hint', $$C'est le contraire de "interdit de dépasser".$$,
      'expected', $$Le dépassement est autorisé.$$
    ),
    jsonb_build_object(
      'question', $$Un panneau rond à fond bleu appartient à quelle catégorie ?$$,
      'hint', $$Ce n'est ni le danger, ni l'interdiction.$$,
      'expected', $$Un panneau d'obligation.$$
    ),
    jsonb_build_object(
      'question', $$En l'absence de signalisation à un croisement, qui a la priorité ?$$,
      'hint', $$C'est la règle de la priorité à droite.$$,
      'expected', $$Le véhicule venant de la droite.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie la couleur orange du feu tricolore pour un piéton ?$$,
      'hint', $$Ce n'est pas une autorisation.$$,
      'expected', $$Interdiction pour le piéton de traverser.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-circulation-routiere';
