-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 7 : "L'UTILISATION RATIONNELLE DES RESSOURCES ET LE
-- BIEN-ÊTRE DES MEMBRES DE LA FAMILLE" (course/view.php?id=1437,
-- mod/resource id=9656, pluginfile 45237). Rewritten entirely in
-- original wording from the real lesson content (definition and
-- identification of family resources, priority needs, rational
-- management, benefits); no sentence copied verbatim from the source
-- document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève confie à ses camarades que son grand frère, avec qui il partage un logement loué, utilise l'argent commun uniquement pour ses propres besoins. Pour l'aider à changer de comportement, ses camarades décident de s'informer sur la bonne gestion des ressources d'une famille.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que les ressources familiales ?$$,
        'body', $$Les ressources familiales sont l'ensemble des moyens qui permettent à une famille de satisfaire les besoins de ses membres : les revenus des parents, un éventuel héritage, les produits des champs, ou encore les revenus tirés d'activités génératrices de revenus menées par d'autres membres de la famille.$$,
        'highlights', array[$$ressources familiales$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les ressources familiales regroupent l'ensemble des moyens, financiers ou matériels, dont dispose une famille pour couvrir les besoins de tous ses membres.$$),
        'example', jsonb_build_object('statement', $$Une mère de famille vend une partie de la récolte de son champ pour couvrir les dépenses du mois. S'agit-il d'une ressource familiale ?$$, 'solution', $$Oui, les produits des champs font partie des ressources qui permettent à une famille de subvenir à ses besoins.$$)
      ),
      jsonb_build_object(
        'heading', $$Les besoins prioritaires d'une famille$$,
        'body', $$Une famille doit d'abord veiller à satisfaire ses besoins prioritaires : la nourriture, la santé, le logement, l'habillement, l'éducation, les loisirs, les factures et le transport. Ces besoins doivent être couverts avant toute dépense secondaire.$$,
        'highlights', array[$$besoins prioritaires$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Catégorie$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Besoin essentiel$$, $$Nourriture, santé, éducation$$),
            jsonb_build_array($$Besoin secondaire$$, $$Loisirs, biens non urgents$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi l'éducation est-elle considérée comme un besoin prioritaire de la famille ?$$, 'solution', $$Parce qu'elle conditionne l'avenir des enfants et fait partie des besoins essentiels à couvrir avant les dépenses secondaires.$$)
      ),
      jsonb_build_object(
        'heading', $$La gestion rationnelle des ressources$$,
        'body', $$Gérer rationnellement les ressources familiales, c'est planifier les dépenses en fonction des ressources disponibles, puis exécuter ce budget de manière rigoureuse, sans dépenser au fur et à mesure des rentrées d'argent sans réflexion préalable.$$,
        'highlights', array[$$gestion rationnelle$$, $$planification$$]::text[],
        'example', jsonb_build_object('statement', $$Le grand frère dépense l'argent du logement dès qu'il le reçoit, sans tenir compte des autres besoins du mois. Applique-t-il une gestion rationnelle des ressources ?$$, 'solution', $$Non, une gestion rationnelle suppose de planifier les dépenses selon les ressources disponibles, et non de dépenser sans réflexion dès qu'on reçoit de l'argent.$$)
      ),
      jsonb_build_object(
        'heading', $$Les bienfaits d'une gestion rationnelle$$,
        'body', $$Une gestion rigoureuse et planifiée des ressources permet d'assurer les besoins essentiels de tous les membres de la famille, d'améliorer leur qualité de vie, et de garantir leur avenir et leur bien-être sur le long terme.$$,
        'highlights', array[$$bien-être familial$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est l'un des principaux bienfaits d'une gestion rationnelle des ressources familiales ?$$, 'solution', $$Elle permet d'assurer les besoins essentiels de tous les membres de la famille et de garantir leur bien-être futur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le responsable des ressources d'une famille décide de dépenser une grosse somme pour son propre plaisir plutôt que de payer la scolarité d'un des enfants, ce qui provoque un mécontentement général dans la famille.$$,
      'questions', array[
        $$Identifie le problème posé par cette décision.$$,
        $$Cite deux besoins prioritaires que cette décision aurait dû respecter.$$,
        $$Propose une meilleure façon de gérer les ressources dans cette situation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'appelle-t-on les ressources familiales ?$$,
      'hint', $$Pense aux revenus des parents et à d'autres sources.$$,
      'expected', $$L'ensemble des moyens qui permettent à une famille de satisfaire les besoins de ses membres, comme les revenus des parents, un héritage ou les produits des champs.$$
    ),
    jsonb_build_object(
      'question', $$Cite trois besoins prioritaires d'une famille.$$,
      'hint', $$Pense à la nourriture, à la santé et à l'éducation.$$,
      'expected', $$La nourriture, la santé, le logement, l'habillement, l'éducation, les loisirs, les factures ou le transport (trois exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une gestion rationnelle des ressources ?$$,
      'hint', $$Pense à la planification des dépenses selon les ressources disponibles.$$,
      'expected', $$C'est planifier les dépenses en fonction des ressources disponibles et exécuter ce budget de manière rigoureuse.$$
    ),
    jsonb_build_object(
      'question', $$Cite un bienfait d'une bonne gestion des ressources familiales.$$,
      'hint', $$Pense au bien-être et à l'avenir de la famille.$$,
      'expected', $$Elle permet d'assurer les besoins essentiels des membres de la famille et de garantir leur avenir et leur bien-être.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-ressources-famille';
