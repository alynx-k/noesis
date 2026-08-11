-- Physique-Chimie 4ème — Traitement de l'eau.
-- REAL CONTENT sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2007 "Lecon12_Traitement de l'eau", resource
-- id 16380 ("Je lis le résumé de la leçon"), PDF "PC 4ème_L12_Traitement de
-- leau.pdf" (6 pages, thème "Eau potable"). Rewritten in original wording —
-- paraphrased, not copied from the source PDF — keeping the same technical
-- content: nécessité de traiter l'eau et agents de pollution, étapes du
-- traitement physico-chimique (floculation au sulfate d'alumine,
-- décantation, filtration, désinfection à l'hypochlorite de calcium/à
-- l'ozone/au dichlore, neutralisation du pH), interprétation d'une facture
-- d'eau (ancien index/nouvel index/cubage consommé) contextualisée avec la
-- SODECI, et bons comportements pour économiser l'eau.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'eau distribuée par la SODECI dans une ville de Côte d'Ivoire provient d'un lac qui reçoit des eaux de ruissellement, chargées d'impuretés. Pourtant, l'eau qui arrive au robinet des habitations est consommée sans aucun risque. Des élèves de 4ème, avec l'aide de leur professeur de Physique-Chimie, décident de comprendre par quelles étapes cette eau doit passer pour devenir potable.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Nécessité de traiter l'eau et agents de pollution$$,
        'body', $$L'eau est indispensable à la vie, mais elle peut aussi en présenter un danger lorsqu'elle est polluée. C'est pourquoi elle doit être traitée avant toute consommation : en Côte d'Ivoire, c'est notamment le rôle de la SODECI, société de distribution d'eau. Parmi les agents responsables de la pollution de l'eau figurent les bactéries, les déchets organiques et les produits phytosanitaires (utilisés en agriculture).$$,
        'highlights', array[$$SODECI$$, $$agents de pollution$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'eau doit être traitée avant consommation à cause de plusieurs agents de pollution : bactéries, déchets organiques, produits phytosanitaires.$$),
        'example', jsonb_build_object('statement', $$Pourquoi une eau prélevée directement dans un lac ne peut-elle pas être bue sans traitement préalable ?$$, 'solution', $$Parce qu'elle peut contenir des agents de pollution comme des bactéries, des déchets organiques ou des produits phytosanitaires, dangereux pour la santé.$$),
        'fixation', jsonb_build_object('question', $$Cite trois agents responsables de la pollution de l'eau.$$, 'solution', $$Les bactéries, les déchets organiques et les produits phytosanitaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Les étapes du traitement physico-chimique de l'eau$$,
        'body', $$Le traitement de l'eau brute suit plusieurs étapes successives. La floculation consiste à injecter dans l'eau un réactif, le sulfate d'alumine, qui provoque la formation de flocons regroupant la matière organique en suspension. Vient ensuite la décantation, durant laquelle l'eau est laissée au repos pour que ces flocons se déposent. La filtration fait ensuite passer l'eau à travers un filtre qui ne laisse passer que les particules les plus légères. La désinfection (ou stérilisation), réalisée à l'aide d'hypochlorite de calcium, d'ozone ou de dichlore gazeux, détruit les micro-organismes susceptibles de transmettre des maladies. Enfin, la neutralisation ajuste le pH de l'eau pour le rendre neutre (pH = 7).$$,
        'highlights', array[$$floculation$$, $$décantation$$, $$filtration$$, $$désinfection$$, $$neutralisation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les étapes du traitement physico-chimique de l'eau se déroulent toujours dans le même ordre : floculation, décantation, filtration, désinfection, puis neutralisation.$$),
        'example', jsonb_build_object('statement', $$Pourquoi ajoute-t-on du sulfate d'alumine à l'eau avant l'étape de décantation ?$$, 'solution', $$Le sulfate d'alumine provoque la floculation : il regroupe les particules organiques en suspension en flocons plus gros, qui pourront ensuite se déposer lors de la décantation.$$),
        'fixation', jsonb_build_object('question', $$Range dans l'ordre les cinq étapes du traitement physico-chimique de l'eau.$$, 'solution', $$Floculation, décantation, filtration, désinfection, neutralisation.$$),
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Floculation$$, $$Regrouper les particules en flocons grâce au sulfate d'alumine$$),
            jsonb_build_array($$Décantation$$, $$Laisser les flocons se déposer au repos$$),
            jsonb_build_array($$Filtration$$, $$Ne laisser passer que les particules légères$$),
            jsonb_build_array($$Désinfection$$, $$Détruire les micro-organismes pathogènes$$),
            jsonb_build_array($$Neutralisation$$, $$Ramener le pH de l'eau à une valeur neutre (pH = 7)$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Interprétation d'une facture d'eau$$,
        'body', $$Une facture d'eau, comme celle de la SODECI, se base sur des relevés appelés index. L'ancien index correspond à l'index relevé lors de la facture précédente, tandis que le nouvel index correspond au relevé actuel du compteur. Le cubage consommé, exprimé en mètres cubes, s'obtient en calculant la différence entre le nouvel index et l'ancien index.$$,
        'highlights', array[$$ancien index$$, $$nouvel index$$, $$cubage consommé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Cubage consommé = Nouvel index − Ancien index.$$),
        'example', jsonb_build_object('statement', $$Sur une facture, l'ancien index est de 1 210 m3 et le nouvel index de 1 305 m3. Calcule le cubage consommé.$$, 'solution', $$Cubage consommé = 1 305 − 1 210 = 95 m3.$$),
        'fixation', jsonb_build_object('question', $$Que représente le cubage consommé indiqué sur une facture d'eau ?$$, 'solution', $$Il représente la quantité d'eau, en mètres cubes, consommée depuis le relevé précédent ; il s'obtient en soustrayant l'ancien index du nouvel index.$$)
      ),
      jsonb_build_object(
        'heading', $$Bons comportements pour économiser l'eau$$,
        'body', $$La préservation de l'eau est l'affaire de tous : quelques gestes simples permettent de réduire de 20 à 30 % la consommation d'eau d'un foyer. On peut par exemple préférer les douches aux bains, ne pas laisser couler l'eau en se brossant les dents, utiliser une chasse d'eau à double commande, laver une voiture à l'éponge plutôt qu'au jet, arroser le jardin le soir pour limiter l'évaporation, et être économe en eau lors du lavage des légumes ou des vêtements.$$,
        'highlights', array[$$économie d'eau$$, $$gestes éco-citoyens$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Des gestes éco-citoyens simples (douches plutôt que bains, chasse d'eau à double commande, arrosage du soir...) peuvent réduire de 20 à 30 % la consommation d'eau d'un foyer.$$),
        'example', jsonb_build_object('statement', $$Pourquoi conseille-t-on d'arroser un jardin le soir plutôt qu'en pleine journée ?$$, 'solution', $$Parce que la chaleur du jour favorise l'évaporation de l'eau ; arroser le soir limite cette évaporation et permet à l'eau de mieux profiter aux plantes.$$),
        'fixation', jsonb_build_object('question', $$Cite deux gestes simples permettant de réduire la consommation d'eau d'un foyer.$$, 'solution', $$Par exemple : préférer les douches aux bains, et ne pas laisser couler l'eau en se brossant les dents.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un village situé loin d'une usine de traitement, les habitants sont obligés d'utiliser l'eau d'un marigot. L'infirmier du village sensibilise la population sur les risques de maladies liés à la consommation de cette eau non traitée.$$,
      'questions', array[
        $$Cite deux agents responsables de la pollution de l'eau du marigot.$$,
        $$Énumère, dans l'ordre, les étapes du traitement physico-chimique qui permettraient de rendre cette eau potable.$$,
        $$Propose une méthode simple, adaptée à un village sans usine de traitement, pour rendre l'eau du marigot plus sûre à consommer.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel réactif utilise-t-on lors de l'étape de floculation du traitement de l'eau ?$$,
      'hint', $$C'est un sel d'aluminium.$$,
      'expected', $$Le sulfate d'alumine.$$
    ),
    jsonb_build_object(
      'question', $$Quelle étape du traitement de l'eau permet de détruire les micro-organismes susceptibles de transmettre des maladies ?$$,
      'hint', $$Elle peut être réalisée à l'ozone, au chlore ou à l'hypochlorite de calcium.$$,
      'expected', $$La désinfection (ou stérilisation).$$
    ),
    jsonb_build_object(
      'question', $$Sur une facture d'eau, l'ancien index est de 980 m3 et le nouvel index de 1 040 m3. Calcule le cubage consommé.$$,
      'hint', $$Cubage consommé = Nouvel index − Ancien index.$$,
      'expected', $$Cubage consommé = 1 040 − 980 = 60 m3.$$
    ),
    jsonb_build_object(
      'question', $$Cite un geste simple permettant de réduire la consommation d'eau d'un foyer.$$,
      'hint', $$Pense à la douche, à la chasse d'eau ou à l'arrosage du jardin.$$,
      'expected', $$Par exemple : préférer les douches aux bains, utiliser une chasse d'eau à double commande, ou arroser le jardin le soir.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-traitement-eau';
