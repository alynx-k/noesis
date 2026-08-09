-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 5 : "L'IMPÔT ET LES RESPONSABILITÉS FISCALES DU CITOYEN"
-- (course/view.php?id=1443, mod/resource id=9728, pluginfile 45314).
-- Rewritten entirely in original wording from the real lesson content
-- (definition and types of tax, collecting bodies, importance, fiscal
-- responsibilities); no sentence copied verbatim from the source
-- document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La seule librairie proposant des fournitures à prix abordable dans une localité vient de fermer pour non-paiement d'impôt. Des élèves, gênés dans leurs achats scolaires, envisagent de manifester devant le service des impôts. D'autres préfèrent d'abord comprendre ce qu'est vraiment l'impôt.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'impôt et quels sont ses types ?$$,
        'body', $$L'impôt est une somme d'argent que chaque citoyen verse à l'État selon ce qu'il gagne ou possède ; on l'appelle aussi taxe, contribution ou droit. On distingue l'impôt sur le revenu (prélevé sur les salaires ou les bénéfices), l'impôt sur la consommation (comme la TVA, prélevée sur les achats), et l'impôt sur le capital (prélevé sur les biens comme les véhicules ou les patentes commerciales).$$,
        'highlights', array[$$impôt$$, $$impôt sur le revenu$$, $$impôt sur la consommation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'impôt est une contribution obligatoire versée par les citoyens à l'État en fonction de leurs revenus, de leur consommation ou de leurs biens, sous des formes variées (revenu, consommation, capital).$$),
        'example', jsonb_build_object('statement', $$Une commerçante paie une taxe lors de l'achat de marchandises importées. À quel type d'impôt cela correspond-il ?$$, 'solution', $$Cela correspond à un impôt sur la consommation, prélevé sur les biens achetés.$$)
      ),
      jsonb_build_object(
        'heading', $$Qui collecte les impôts ?$$,
        'body', $$Le recouvrement des impôts aux frontières du territoire (terrestres, maritimes, aériennes) relève de la Direction générale des douanes. À l'intérieur du territoire, c'est la Direction générale des impôts (DGI) qui s'en charge, notamment à travers des centres d'impôts installés dans les communes pour faciliter le paiement et contrôler les contribuables.$$,
        'highlights', array[$$Direction générale des douanes$$, $$Direction générale des impôts$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Structure$$, $$Zone de compétence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Direction générale des douanes$$, $$Frontières du territoire$$),
            jsonb_build_array($$Direction générale des impôts$$, $$Intérieur du territoire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle structure est chargée de collecter les impôts à l'intérieur du pays ?$$, 'solution', $$La Direction générale des impôts (DGI).$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi l'impôt est-il important ?$$,
        'body', $$Sur le plan socio-économique, les recettes fiscales permettent à l'État de payer ses dettes, les salaires des fonctionnaires, et d'assurer la sécurité et le bien-être de la population. Sur le plan politique, l'impôt aide l'État à réduire les inégalités entre les régions, à orienter le développement et à protéger la production nationale.$$,
        'highlights', array[$$recettes fiscales$$, $$développement$$]::text[],
        'example', jsonb_build_object('statement', $$Grâce aux recettes fiscales collectées, l'État construit une nouvelle route dans une région isolée. Quel rôle de l'impôt cela illustre-t-il ?$$, 'solution', $$Cela illustre le rôle politique de l'impôt, qui permet de réduire les disparités régionales en finançant le développement des zones moins desservies.$$)
      ),
      jsonb_build_object(
        'heading', $$Les responsabilités fiscales du citoyen$$,
        'body', $$Chaque citoyen a la responsabilité de déclarer avec sincérité les revenus ou les biens sur lesquels l'impôt est dû, et de s'en acquitter dans les délais légaux. En agissant ainsi, il contribue directement au développement économique et social de son pays.$$,
        'highlights', array[$$responsabilité fiscale$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux obligations principales d'un citoyen envers l'impôt ?$$, 'solution', $$Déclarer sincèrement ce qui est imposable, et payer l'impôt correspondant dans les délais légaux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le directeur général des impôts appelle les contribuables à payer leurs impôts dans les délais. Un commerçant estime que son activité ne lui rapporte pas assez pour s'en acquitter et refuse de payer.$$,
      'questions', array[
        $$Identifie le problème posé par l'attitude de ce commerçant.$$,
        $$Cite deux conséquences possibles de son refus de payer l'impôt.$$,
        $$Explique en quoi le paiement de l'impôt est une responsabilité de tout citoyen.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que l'impôt ?$$,
      'hint', $$Pense à une somme versée à l'État selon les revenus ou les biens.$$,
      'expected', $$Une somme d'argent que chaque citoyen verse à l'État selon ce qu'il gagne ou possède.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux types d'impôts.$$,
      'hint', $$Pense au revenu, à la consommation et au capital.$$,
      'expected', $$L'impôt sur le revenu, l'impôt sur la consommation et l'impôt sur le capital (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelle structure collecte les impôts aux frontières du territoire ?$$,
      'hint', $$Pense aux douanes.$$,
      'expected', $$La Direction générale des douanes.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les responsabilités fiscales d'un citoyen ?$$,
      'hint', $$Pense à la déclaration et au paiement dans les délais.$$,
      'expected', $$Déclarer avec sincérité l'impôt à payer et s'en acquitter dans le délai légal.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-impot-responsabilites-fiscales';
