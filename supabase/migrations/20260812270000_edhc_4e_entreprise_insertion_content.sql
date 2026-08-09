-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 8 : "L'ENTREPRISE ET L'INSERTION DANS LA VIE ACTIVE"
-- (course/view.php?id=1431, mod/resource id=9596, pluginfile 45170).
-- Rewritten entirely in original wording from the real lesson content
-- (definition and types of enterprise, micro-enterprises/AGR, benefits
-- of learning a trade, advantages of starting a business); no sentence
-- copied verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En raison de ses difficultés scolaires, le père d'un élève propose de l'aider à s'installer à son propre compte, mais celui-ci hésite, faute d'expérience en gestion. Ses camarades décident de s'informer sur ce qu'est une entreprise et sur l'insertion dans la vie active pour l'aider à décider.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une entreprise et quels en sont les types ?$$,
        'body', $$Une entreprise est une organisation économique autonome qui produit des biens ou fournit des services destinés à des clients ou des usagers. On classe les entreprises selon leur nombre de salariés et leur chiffre d'affaires : des micro-entreprises (moins de dix salariés) aux grandes entreprises (deux cents salariés et plus, avec un chiffre d'affaires dépassant un milliard de francs CFA).$$,
        'highlights', array[$$entreprise$$, $$micro-entreprise$$, $$grande entreprise$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une entreprise est une organisation autonome qui produit des biens ou des services ; sa taille (micro, petite, moyenne ou grande) dépend notamment de son nombre de salariés et de son chiffre d'affaires.$$),
        'example', jsonb_build_object('statement', $$Un jeune ouvre un petit commerce de fruits et légumes avec deux employés. À quelle catégorie appartient cette activité ?$$, 'solution', $$Il s'agit d'une micro-entreprise ou d'une activité génératrice de revenus (AGR), car elle emploie très peu de salariés et nécessite peu d'investissement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les activités génératrices de revenus et l'apprentissage d'un métier$$,
        'body', $$Les activités génératrices de revenus (AGR) sont de petites activités spontanées, adaptées aux besoins du milieu, qui demandent peu d'investissement et peu de qualifications, comme le lavage de véhicules ou le commerce de fruits et légumes. Apprendre un métier permet d'acquérir des compétences professionnelles ainsi que des valeurs comme le sens des responsabilités, le respect des engagements et la discipline.$$,
        'highlights', array[$$AGR$$, $$apprentissage d'un métier$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un bienfait de l'apprentissage d'un métier, en dehors des compétences techniques.$$, 'solution', $$Il permet d'acquérir des valeurs comme le sens des responsabilités, le respect des engagements ou la discipline.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la création d'une entreprise$$,
        'body', $$Créer une entreprise, quelle que soit sa taille, apporte des avantages à plusieurs niveaux : au niveau individuel, cela permet de sortir du chômage, de gagner en autonomie et en fierté ; au niveau de la communauté, cela crée des emplois et lutte contre la pauvreté et l'oisiveté ; au niveau de l'État, cela crée des richesses qui contribuent au développement du pays.$$,
        'highlights', array[$$autonomie$$, $$création d'emplois$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau$$, $$Avantage$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Individuel$$, $$Autonomie, insertion dans la vie active$$),
            jsonb_build_array($$Communautaire$$, $$Création d'emplois, lutte contre la pauvreté$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Un jeune, ne trouvant pas d'emploi salarié, crée sa propre petite entreprise de couture et embauche progressivement d'autres jeunes. Quel avantage communautaire cela illustre-t-il ?$$, 'solution', $$Cela illustre la création d'emplois, qui contribue à réduire le chômage et la pauvreté dans la communauté.$$)
      ),
      jsonb_build_object(
        'heading', $$L'entreprise comme moyen d'insertion dans la vie active$$,
        'body', $$L'insertion dans la vie active peut se faire soit par l'embauche dans une entreprise existante, soit par l'auto-emploi, c'est-à-dire en créant sa propre unité économique. Les entreprises restent ainsi un outil important d'intégration socio-économique des jeunes.$$,
        'highlights', array[$$insertion dans la vie active$$, $$auto-emploi$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux principales voies d'insertion dans la vie active ?$$, 'solution', $$L'embauche dans une entreprise existante, ou l'auto-emploi en créant sa propre entreprise.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un jeune titulaire d'un diplôme technique refuse une proposition de son oncle de l'initier à l'élevage de volailles pendant les vacances, jugeant ce métier peu valorisant, et conseille à son frère cadet de faire de même.$$,
      'questions', array[
        $$Identifie le problème posé par le refus de ce jeune.$$,
        $$Cite deux conséquences possibles de ce refus pour son insertion dans la vie active.$$,
        $$Explique en quoi accepter cette offre pourrait lui être bénéfique.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une entreprise ?$$,
      'hint', $$Pense à la production de biens ou de services.$$,
      'expected', $$Une organisation économique autonome qui produit des biens ou fournit des services destinés à des clients ou des usagers.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une activité génératrice de revenus (AGR) ?$$,
      'hint', $$Pense à une petite activité demandant peu d'investissement.$$,
      'expected', $$Une petite activité spontanée, adaptée aux besoins du milieu, qui demande peu d'investissement et peu de qualifications particulières.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux avantages de la création d'une entreprise au niveau individuel.$$,
      'hint', $$Pense à l'autonomie et à la sortie du chômage.$$,
      'expected', $$L'insertion dans la vie active (sortie du chômage) et l'autonomie financière et personnelle (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux principales voies d'insertion dans la vie active ?$$,
      'hint', $$Pense à l'embauche et à la création d'entreprise.$$,
      'expected', $$L'embauche dans une entreprise existante, ou l'auto-emploi en créant sa propre entreprise.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-entreprise-insertion';
