-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806520000_fr_debat_content.sql). ecole-ci.org (coll.ecole-ci.org)
-- IS reachable now (login fixed) — logged in and opened Français 4ème >
-- "Leçon 1: S1_S2_S3 Expression orale_Le débat_Participer au débat" (course
-- id 756): the course page's own counter reads "Activités : 0" — the shell
-- exists but no résumé PDF or exercise has been uploaded to it. Falling
-- back to original content, built from the lesson title/topic and the
-- standard Ivorian 4ème Français programme (compétence "communication
-- orale" — débat contradictoire).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la Journée de l'excellence, ta classe doit organiser un débat contradictoire sur un sujet d'actualité devant tout le collège. Il te faut construire une thèse solide, des arguments convaincants, et savoir répondre à la partie adverse.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Préparer une thèse et des arguments$$,
        'body', $$Avant de débattre, il faut choisir une thèse claire (l'opinion que l'on va défendre) et réunir plusieurs arguments qui la soutiennent, appuyés chacun par un exemple précis.$$,
        'highlights', array[$$une thèse$$, $$un argument$$, $$une objection$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une thèse est l'opinion générale que l'on défend dans un débat. Elle s'appuie sur plusieurs arguments, chacun illustré par un exemple, et doit anticiper les objections possibles de la partie adverse.$$),
        'example', jsonb_build_object('statement', $$Formule une thèse et un argument sur le sujet : « Faut-il rendre le sport obligatoire au collège ? »$$, 'solution', $$Thèse : le sport devrait être obligatoire au collège. Argument : il améliore la santé des élèves, car l'activité physique régulière réduit les risques de maladie.$$),
        'fixation', jsonb_build_object('question', $$Formule une thèse et un argument sur : « Faut-il limiter le temps d'écran des élèves ? »$$, 'solution', $$Thèse : il faut limiter le temps d'écran des élèves. Argument : cela améliore la concentration, car un usage excessif des écrans fatigue l'attention.$$)
      ),
      jsonb_build_object(
        'heading', $$Les procédés de persuasion$$,
        'body', $$Pour convaincre un auditoire, l'orateur utilise des procédés qui renforcent l'impact de son discours : question rhétorique, répétition, chiffre ou exemple concret.$$,
        'highlights', array[$$une question rhétorique$$, $$une répétition$$, $$un chiffre$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Procédé$$, $$Effet recherché$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Question rhétorique$$, $$Fait réfléchir sans attendre de réponse$$, $$« Qui accepterait de vivre sans école ? »$$),
            jsonb_build_array($$Répétition$$, $$Insiste sur une idée clé$$, $$« Il faut agir. Il faut agir maintenant. »$$),
            jsonb_build_array($$Chiffre ou statistique$$, $$Donne de la crédibilité$$, $$« 80 % des élèves interrogés sont d'accord. »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les procédés de persuasion (question rhétorique, répétition, chiffre) renforcent un argument sans le remplacer : ils doivent toujours s'ajouter à une justification claire.$$),
        'example', jsonb_build_object('statement', $$Transforme cette phrase en question rhétorique : « Il est évident que la lecture enrichit l'esprit. »$$, 'solution', $$Qui pourrait nier que la lecture enrichit l'esprit ?$$),
        'fixation', jsonb_build_object('question', $$Ajoute un chiffre ou une statistique pour renforcer cet argument : « Beaucoup d'élèves manquent de sommeil. »$$, 'solution', $$Beaucoup d'élèves manquent de sommeil : près d'un collégien sur deux se couche après 23 heures en semaine.$$)
      ),
      jsonb_build_object(
        'heading', $$Réfuter un argument adverse$$,
        'body', $$Réfuter, c'est démontrer qu'un argument adverse est faible ou incomplet, tout en restant courtois. On utilise souvent une concession suivie d'un connecteur d'opposition.$$,
        'highlights', array[$$réfuter$$, $$une concession$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Connecteur$$, $$Valeur$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$certes... mais$$, $$concède un point puis nuance$$),
            jsonb_build_array($$cependant, toutefois$$, $$introduit une opposition$$),
            jsonb_build_array($$néanmoins$$, $$introduit une restriction malgré ce qui précède$$),
            jsonb_build_array($$en revanche$$, $$oppose deux idées contraires$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour réfuter un argument avec courtoisie, on concède d'abord un point valable (« certes »), puis on introduit l'objection avec un connecteur d'opposition (« mais », « cependant », « toutefois »).$$),
        'example', jsonb_build_object('statement', $$Réfute avec courtoisie : « Les devoirs à la maison sont inutiles. »$$, 'solution', $$Certes, les devoirs peuvent parfois sembler répétitifs, mais ils permettent de consolider ce qui a été appris en classe.$$),
        'fixation', jsonb_build_object('question', $$Réfute avec courtoisie : « Les uniformes scolaires suppriment toute personnalité. »$$, 'solution', $$Certes, l'uniforme limite certains choix vestimentaires, mais il évite aussi les comparaisons entre élèves selon leur tenue.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ta classe organise un débat contradictoire sur le thème : « Faut-il rendre l'accès à internet gratuit dans tous les lycées ? »$$,
      'questions', array[
        $$Formule une thèse et un argument justifié pour l'un des deux camps.$$,
        $$Ajoute un procédé de persuasion (question rhétorique, répétition ou chiffre) à ton argument.$$,
        $$Rédige une réfutation courtoise d'un argument du camp adverse.$$,
        $$Utilise au moins deux connecteurs d'opposition dans ta prise de parole.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Formule une thèse et un argument justifié sur : « Faut-il interdire les sucreries à la cantine ? »$$,
      'hint', $$Commence par « Je pense que... » puis justifie avec « car ».$$,
      'expected', $$Je pense qu'il faut limiter les sucreries à la cantine, car une consommation excessive de sucre nuit à la santé des élèves.$$
    ),
    jsonb_build_object(
      'question', $$Transforme cette affirmation en question rhétorique : « Tout le monde sait que l'éducation est essentielle. »$$,
      'hint', $$Utilise « Qui pourrait nier que... ? »$$,
      'expected', $$Qui pourrait nier que l'éducation est essentielle ?$$
    ),
    jsonb_build_object(
      'question', $$Réfute avec courtoisie : « Les réseaux sociaux n'apportent rien de bon aux jeunes. »$$,
      'hint', $$Commence par « Certes... mais... ».$$,
      'expected', $$Certes, les réseaux sociaux comportent des risques, mais ils permettent aussi de rester en contact avec des amis éloignés et de s'informer rapidement.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi un débatteur doit-il anticiper les objections de la partie adverse avant le débat ?$$,
      'hint', $$Pense à ce qui se passe si l'on est pris au dépourvu.$$,
      'expected', $$Anticiper les objections permet de préparer une réponse solide et de ne pas être déstabilisé pendant le débat, ce qui rend l'argumentation plus convaincante.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-debat';
