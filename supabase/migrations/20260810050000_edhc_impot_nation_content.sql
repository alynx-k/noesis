-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- taxation and national development, in 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le père de Yves tient une boutique. Chaque mois, il se plaint de devoir verser une partie de ses revenus à l'État sous forme d'impôt. Yves se demande à quoi sert vraiment cet argent, et pourquoi tout le monde doit contribuer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'impôt ?$$,
        'body', $$L'impôt est une contribution obligatoire versée par les citoyens et les entreprises à l'État, sans contrepartie directe et immédiate, pour financer les dépenses publiques et le fonctionnement de la Nation.$$,
        'highlights', array[$$impôt$$, $$contribution obligatoire$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'impôt est obligatoire et ne donne pas droit à un service précis en échange immédiat : c'est l'ensemble des recettes fiscales qui finance les services publics dont bénéficie toute la population.$$),
        'example', jsonb_build_object('statement', $$Le père de Yves paie l'impôt sur son commerce, mais ne reçoit aucun bien en échange direct. Pourquoi continue-t-il de le payer ?$$, 'solution', $$Parce que l'impôt est une obligation légale qui finance collectivement les services publics dont tous les citoyens profitent, comme les routes ou les écoles.$$)
      ),
      jsonb_build_object(
        'heading', $$Les différents types d'impôts$$,
        'body', $$Il existe des impôts directs, prélevés directement sur les revenus ou les biens (comme l'impôt sur les bénéfices), et des impôts indirects, inclus dans le prix des biens et services achetés par tous, comme la taxe sur la valeur ajoutée.$$,
        'highlights', array[$$impôt direct$$, $$impôt indirect$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Impôt direct$$, $$Impôt sur les bénéfices d'une entreprise$$),
            jsonb_build_array($$Impôt indirect$$, $$Taxe payée en achetant un produit au marché$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Le père de Yves paie une taxe incluse dans le prix des marchandises qu'il achète pour sa boutique. De quel type d'impôt s'agit-il ?$$, 'solution', $$Un impôt indirect, car il est inclus dans le prix payé lors de l'achat.$$)
      ),
      jsonb_build_object(
        'heading', $$À quoi sert l'impôt ?$$,
        'body', $$Les recettes fiscales permettent à l'État de construire et d'entretenir les routes, les écoles et les hôpitaux, de payer les fonctionnaires, de garantir la sécurité, et de financer le développement économique et social du pays.$$,
        'highlights', array[$$développement de la nation$$]::text[],
        'example', jsonb_build_object('statement', $$Une nouvelle école publique est construite dans le village de Yves. D'où vient principalement l'argent utilisé pour ce projet ?$$, 'solution', $$Il provient majoritairement des recettes fiscales, c'est-à-dire des impôts collectés par l'État.$$)
      ),
      jsonb_build_object(
        'heading', $$Le civisme fiscal, un devoir citoyen$$,
        'body', $$Payer ses impôts de manière honnête, sans fraude ni corruption, est un devoir civique. La fraude fiscale prive l'État de ressources nécessaires au développement et pénalise l'ensemble de la population.$$,
        'highlights', array[$$civisme fiscal$$, $$fraude fiscale$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la fraude fiscale nuit-elle à toute la population et pas seulement à l'État ?$$, 'solution', $$Parce qu'elle réduit les ressources disponibles pour financer les écoles, les hôpitaux et les infrastructures dont bénéficie l'ensemble des citoyens.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un commerçant du marché de ton quartier dissimule une partie de ses revenus pour ne pas payer tous ses impôts, tout en profitant chaque jour des routes et de l'éclairage public financés par l'État.$$,
      'questions', array[
        $$Explique en quoi le comportement de ce commerçant est contradictoire.$$,
        $$Cite deux services publics que les impôts permettent de financer.$$,
        $$Propose un argument pour convaincre ce commerçant de payer honnêtement ses impôts.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Définis l'impôt.$$,
      'hint', $$Pense à qui le paie, à qui il est versé, et à quoi il sert.$$,
      'expected', $$L'impôt est une contribution obligatoire versée par les citoyens et les entreprises à l'État pour financer les dépenses publiques et le développement de la Nation.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre un impôt direct et un impôt indirect ?$$,
      'hint', $$Pense à comment chacun est prélevé.$$,
      'expected', $$L'impôt direct est prélevé directement sur les revenus ou les biens (ex : impôt sur les bénéfices), tandis que l'impôt indirect est inclus dans le prix des biens et services achetés (ex : taxe sur la valeur ajoutée).$$
    ),
    jsonb_build_object(
      'question', $$Cite trois domaines financés grâce aux recettes fiscales de l'État.$$,
      'hint', $$Pense aux infrastructures et aux services publics.$$,
      'expected', $$Par exemple : les routes, les écoles, les hôpitaux, la sécurité, ou les salaires des fonctionnaires (trois éléments cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi payer ses impôts honnêtement est-il considéré comme un devoir civique ?$$,
      'hint', $$Pense au lien entre impôt et développement collectif.$$,
      'expected', $$Parce que l'impôt finance des services dont bénéficie toute la population ; le payer honnêtement contribue au développement du pays, alors que la fraude prive l'État de ressources nécessaires.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-impot-nation';
