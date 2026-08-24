-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 10 : L'ABSTINENCE SEXUELLE ET LA PRÉSERVATION DE LA
-- SANTÉ" (id 1708). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors de leur visite dans la classe, le Chef d'établissement et son adjoint ont affirmé que l'abstinence sexuelle est l'une des voies de la réussite scolaire. Pour mieux comprendre cette affirmation, les élèves décident de s'informer sur l'abstinence sexuelle et son importance.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et comportements favorisant l'abstinence$$,
        'body', $$L'abstinence sexuelle est la pratique qui consiste à se priver volontairement de rapports sexuels (pendant un moment, et non nécessairement pour toujours). Les comportements qui la favorisent : au niveau individuel — porter des tenues décentes, respecter son corps, s'occuper sainement ; au niveau familial — respecter les parents, se confier à eux ; au niveau social — avoir de bonnes fréquentations, visiter des lieux éducatifs.$$,
        'highlights', array[$$abstinence sexuelle = se priver volontairement de rapports sexuels$$, $$individuel : tenues décentes, respect du corps ; familial : confiance, respect ; social : bonnes fréquentations$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un comportement individuel qui favorise l'abstinence sexuelle.$$, 'solution', $$Par exemple : porter des tenues décentes, respecter son corps, ou s'occuper sainement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de l'abstinence sexuelle$$,
        'body', $$Au niveau individuel : préservation de la santé, réussite scolaire, épanouissement. Au niveau familial : réduction des frais médicaux, sauvegarde de l'honneur et de l'image de la famille. Au niveau communautaire : une jeunesse en bonne santé et épanouie, garante d'un avenir prometteur pour le pays.$$,
        'highlights', array[$$individuel : santé, réussite scolaire, épanouissement$$, $$familial : moins de frais médicaux, honneur préservé ; communautaire : jeunesse saine, avenir du pays$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi l'abstinence sexuelle contribue-t-elle à la réussite scolaire ?$$, 'solution', $$Elle évite les grossesses précoces et les infections qui interrompent la scolarité, permettant à l'élève de rester concentré sur ses études.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'avantage de l'abstinence sexuelle au niveau familial ?$$, 'solution', $$La réduction des frais médicaux et la sauvegarde de l'honneur et de l'image de la famille.$$)
      ),
      jsonb_build_object(
        'heading', $$La prise de décision$$,
        'body', $$La prise de décision est une démarche qui consiste à faire un choix responsable dont on accepte d'assumer les conséquences. Elle comprend cinq étapes : (1) identifier clairement le problème, (2) analyser le problème, (3) prendre conseil auprès de personnes de bonne moralité (parents, éducateurs), (4) prendre la décision en faisant un choix, (5) appliquer la décision et assumer ses conséquences. Pratiquer l'abstinence n'est pas toujours facile face à la pression du groupe — il faut donc s'occuper sainement et adopter des attitudes responsables.$$,
        'highlights', array[$$5 étapes : identifier → analyser → prendre conseil → décider → appliquer et assumer$$]::text[],
        'example', jsonb_build_object('statement', $$Avant de prendre une décision importante, à qui peut-on demander conseil ?$$, 'solution', $$À des personnes de bonne moralité : les parents, les éducateurs.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la dernière étape de la prise de décision ?$$, 'solution', $$Appliquer la décision et assumer ses conséquences.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$L'un de tes amis se moque de toi parce que tu n'as pas de petit(e) ami(e). Il t'encourage à en avoir un(e), affirmant que l'abstinence sexuelle peut rendre malade.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite deux conséquences des rapports sexuels précoces.$$,
        $$Donne les raisons de ton refus.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$L'abstinence sexuelle signifie-t-elle nécessairement "refuser les rapports sexuels pour toujours" ?$$,
      'hint', $$Relis la définition précise.$$,
      'expected', $$Non, c'est se priver volontairement de rapports sexuels, ce qui peut être pour un moment.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre : appliquer la décision / analyser le problème / prendre conseil / identifier le problème / prendre la décision.$$,
      'hint', $$Il y a 5 étapes précises dans la démarche.$$,
      'expected', $$1. Identifier le problème, 2. Analyser le problème, 3. Prendre conseil, 4. Prendre la décision, 5. Appliquer la décision.$$
    ),
    jsonb_build_object(
      'question', $$Cite un avantage de l'abstinence sexuelle au niveau communautaire.$$,
      'hint', $$Pense à l'avenir du pays.$$,
      'expected', $$Une jeunesse en bonne santé et épanouie, garante d'un avenir prometteur pour le pays.$$
    ),
    jsonb_build_object(
      'question', $$"Visiter les lieux éducatifs" favorise-t-il l'abstinence sexuelle au niveau individuel, familial ou social ?$$,
      'hint', $$Cela concerne les fréquentations extérieures.$$,
      'expected', $$Au niveau social.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-abstinence-sexuelle';
