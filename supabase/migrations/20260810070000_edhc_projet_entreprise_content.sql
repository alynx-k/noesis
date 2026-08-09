-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- entrepreneurship projects and social integration, in 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sery, 15 ans, rêve d'ouvrir un petit atelier de couture après ses études. Il a une bonne idée, mais ne sait pas comment la transformer en véritable projet, ni comment cela pourrait l'aider à trouver sa place dans la société.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un projet d'entreprise ?$$,
        'body', $$Un projet d'entreprise est une idée d'activité économique, mûrement réfléchie et organisée, qu'une personne ou un groupe souhaite réaliser pour produire un bien ou un service et en tirer un revenu.$$,
        'highlights', array[$$projet d'entreprise$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un projet d'entreprise ne se limite pas à une idée : il devient un projet réel lorsqu'il est étudié, planifié et organisé de manière concrète.$$),
        'example', jsonb_build_object('statement', $$Sery a seulement l'idée d'un atelier de couture, sans plan ni étude. Peut-on déjà parler d'un projet d'entreprise ?$$, 'solution', $$Pas encore : ce n'est qu'une idée ; elle deviendra un projet d'entreprise une fois étudiée et organisée concrètement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les étapes de construction d'un projet$$,
        'body', $$Construire un projet d'entreprise suit plusieurs étapes : trouver une idée réaliste, étudier les besoins du marché, évaluer les ressources nécessaires (argent, matériel, compétences), puis élaborer un plan d'action.$$,
        'highlights', array[$$étapes du projet$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Contenu$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Idée$$, $$Choisir une activité réaliste et utile$$),
            jsonb_build_array($$Étude$$, $$Vérifier s'il y a une demande pour ce bien ou service$$),
            jsonb_build_array($$Ressources$$, $$Identifier l'argent, le matériel, les compétences nécessaires$$),
            jsonb_build_array($$Plan d'action$$, $$Organiser les étapes concrètes de mise en œuvre$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Avant de se lancer, que doit vérifier Sery concernant les clients potentiels de son atelier ?$$, 'solution', $$Il doit vérifier s'il existe une demande réelle pour des vêtements ou services de couture dans sa zone.$$)
      ),
      jsonb_build_object(
        'heading', $$Les qualités nécessaires pour entreprendre$$,
        'body', $$Réussir un projet d'entreprise demande de la persévérance, du sens de l'organisation, de la créativité pour résoudre les problèmes, et le courage de prendre des risques mesurés.$$,
        'highlights', array[$$persévérance$$, $$sens de l'organisation$$]::text[],
        'example', jsonb_build_object('statement', $$Les premiers mois, l'atelier de Sery n'attire que peu de clients. Quelle qualité lui permettra de continuer sans abandonner ?$$, 'solution', $$La persévérance : continuer ses efforts et ajuster son projet malgré les débuts difficiles.$$)
      ),
      jsonb_build_object(
        'heading', $$Le projet d'entreprise et l'insertion sociale$$,
        'body', $$En créant son entreprise, une personne devient autonome financièrement, peut créer des emplois pour d'autres, et prend une place active et reconnue dans la vie économique et sociale de sa communauté.$$,
        'highlights', array[$$insertion sociale$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi la réussite de l'atelier de Sery pourrait-elle aider d'autres jeunes de son quartier ?$$, 'solution', $$Si son atelier se développe, il pourrait employer d'autres jeunes, leur donnant ainsi un revenu et une place active dans la société.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une jeune fille de ton quartier a une bonne idée de petit commerce de jus de fruits naturels, mais elle hésite à se lancer, ne sachant pas par où commencer.$$,
      'questions', array[
        $$Explique les étapes qu'elle devrait suivre pour transformer son idée en véritable projet d'entreprise.$$,
        $$Cite deux qualités personnelles qui l'aideraient à réussir.$$,
        $$Explique comment ce projet pourrait favoriser son insertion sociale.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un projet d'entreprise ?$$,
      'hint', $$Pense à une idée réfléchie et organisée pour produire un bien ou un service.$$,
      'expected', $$Une idée d'activité économique, étudiée et organisée, qu'une personne ou un groupe souhaite réaliser pour produire un bien ou un service et en tirer un revenu.$$
    ),
    jsonb_build_object(
      'question', $$Cite trois étapes nécessaires pour construire un projet d'entreprise.$$,
      'hint', $$Pense à l'idée, l'étude du marché et les ressources.$$,
      'expected', $$Trouver une idée réaliste, étudier les besoins/le marché, évaluer les ressources nécessaires, et élaborer un plan d'action (trois éléments cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux qualités personnelles utiles pour réussir un projet d'entreprise.$$,
      'hint', $$Pense à la persévérance, l'organisation, la créativité.$$,
      'expected', $$Par exemple : la persévérance et le sens de l'organisation (ou la créativité, le courage face au risque).$$
    ),
    jsonb_build_object(
      'question', $$Explique en quoi un projet d'entreprise favorise l'insertion sociale de son porteur.$$,
      'hint', $$Pense à l'autonomie financière et à la place dans la communauté.$$,
      'expected', $$Il rend la personne autonome financièrement, peut créer des emplois pour d'autres, et lui donne une place active et reconnue dans la vie économique et sociale de sa communauté.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-projet-entreprise';
