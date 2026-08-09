-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on the
-- benefits of HIV testing and life management, in 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un centre de santé organise une campagne gratuite de dépistage du VIH près du lycée d'Aminata. Certains élèves refusent d'y participer, par peur de connaître le résultat. Aminata se demande pourquoi il est important de se faire dépister, même sans symptôme apparent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que le dépistage du VIH ?$$,
        'body', $$Le dépistage du VIH est un test simple, rapide et souvent gratuit qui permet de savoir si une personne est porteuse du virus responsable du sida. Il peut être réalisé volontairement dans un centre de santé, de façon confidentielle.$$,
        'highlights', array[$$dépistage du VIH$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une personne porteuse du VIH peut ne présenter aucun symptôme pendant longtemps ; seul un test de dépistage permet de connaître son statut avec certitude.$$),
        'example', jsonb_build_object('statement', $$Un jeune homme se sent en parfaite santé et pense donc ne pas avoir besoin de se faire dépister. Pourquoi ce raisonnement est-il risqué ?$$, 'solution', $$Parce que le VIH peut être présent dans l'organisme sans provoquer de symptômes visibles pendant des années ; seul le test permet de connaître son statut réel.$$)
      ),
      jsonb_build_object(
        'heading', $$Les bienfaits du dépistage$$,
        'body', $$Se faire dépister permet de connaître son statut sérologique, d'accéder rapidement à un traitement efficace en cas de résultat positif, de protéger son ou sa partenaire, et de vivre plus sereinement en levant le doute.$$,
        'highlights', array[$$bienfaits du dépistage$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Bienfait$$, $$Explication$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Connaître son statut$$, $$Permet d'agir en connaissance de cause$$),
            jsonb_build_array($$Traitement précoce$$, $$Un traitement commencé tôt est plus efficace$$),
            jsonb_build_array($$Protection du partenaire$$, $$Permet d'adopter des comportements de prévention adaptés$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi un dépistage précoce améliore-t-il l'efficacité du traitement en cas de résultat positif ?$$, 'solution', $$Parce que commencer le traitement tôt permet de mieux contrôler le virus et de préserver la santé de la personne sur le long terme.$$)
      ),
      jsonb_build_object(
        'heading', $$Vivre et gérer sa vie après un dépistage$$,
        'body', $$Un résultat négatif encourage à maintenir des comportements de prévention. Un résultat positif n'est pas une fin en soi : grâce au suivi médical et au traitement antirétroviral, une personne séropositive peut mener une vie longue, active et épanouie.$$,
        'highlights', array[$$gestion de la vie$$, $$traitement antirétroviral$$]::text[],
        'example', jsonb_build_object('statement', $$Une personne apprend qu'elle est séropositive. Sa vie est-elle terminée pour autant ?$$, 'solution', $$Non : avec un suivi médical régulier et un traitement antirétroviral bien suivi, elle peut continuer à vivre une vie longue et active.$$)
      ),
      jsonb_build_object(
        'heading', $$Lutter contre la stigmatisation$$,
        'body', $$La peur du jugement des autres pousse parfois à éviter le dépistage ou à cacher son statut. Il est essentiel de respecter et de ne pas exclure les personnes vivant avec le VIH, car la discrimination freine la prévention et l'accès aux soins.$$,
        'highlights', array[$$stigmatisation$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la peur d'être jugé peut-elle décourager quelqu'un de se faire dépister ?$$, 'solution', $$Parce qu'elle craint le rejet ou la discrimination si le résultat est positif, ce qui la pousse parfois à éviter le test par peur, au détriment de sa santé.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de la classe d'Aminata refuse catégoriquement de participer à la campagne de dépistage, affirmant qu'il n'est « pas malade » et que « ça porte malheur » de se faire tester.$$,
      'questions', array[
        $$Explique pourquoi son raisonnement n'est pas fondé.$$,
        $$Cite deux bienfaits du dépistage que tu pourrais lui présenter.$$,
        $$Explique comment une personne séropositive peut continuer à mener une vie active grâce au suivi médical.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que le dépistage du VIH ?$$,
      'hint', $$Pense à un test simple réalisé dans un centre de santé.$$,
      'expected', $$Un test simple et souvent gratuit, réalisé dans un centre de santé, qui permet de savoir si une personne est porteuse du VIH.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux bienfaits du dépistage du VIH.$$,
      'hint', $$Pense à la connaissance du statut et à l'accès au traitement.$$,
      'expected', $$Par exemple : connaître son statut sérologique pour agir en conséquence, et accéder rapidement à un traitement efficace en cas de résultat positif (ou protéger son/sa partenaire).$$
    ),
    jsonb_build_object(
      'question', $$Une personne séropositive peut-elle encore mener une vie active ? Explique.$$,
      'hint', $$Pense au traitement antirétroviral et au suivi médical.$$,
      'expected', $$Oui : grâce à un suivi médical régulier et à un traitement antirétroviral bien suivi, une personne séropositive peut vivre longtemps et mener une vie active.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi faut-il éviter de stigmatiser les personnes vivant avec le VIH ?$$,
      'hint', $$Pense à l'effet de la peur du jugement sur le dépistage.$$,
      'expected', $$Parce que la stigmatisation décourage les gens de se faire dépister ou de rechercher des soins par peur du rejet, ce qui nuit à la prévention et à la santé de tous.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-depistage-vih';
