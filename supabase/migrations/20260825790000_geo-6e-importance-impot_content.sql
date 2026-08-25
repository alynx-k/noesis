-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 3 : L'importance de l'impôt dans le développement de
-- ma région" (Thème 2 : L'homme et son milieu local en Côte d'Ivoire).
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En lisant la facture d'électricité que son père vient de recevoir, un élève de 6ème découvre une rubrique mentionnant « TVA ». Son père lui explique qu'il s'agit d'un impôt. Curieux, l'élève et ses camarades mènent une enquête auprès de la Direction Générale des Impôts de leur localité afin d'identifier les différentes formes d'impôt, comprendre son rôle dans le développement local, et encourager son paiement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les deux formes d'impôt$$,
        'body', $$L'impôt est une somme d'argent obligatoire que chaque citoyen (le contribuable) verse à l'État selon ce qu'il gagne ou possède. On distingue l'impôt direct, payé directement par le contribuable à l'État (l'Impôt Général sur le Revenu, l'impôt sur les bénéfices des sociétés, l'impôt foncier pour les propriétaires, l'impôt sur les salaires, les patentes des transporteurs...), et l'impôt indirect, perçu par les entreprises et répercuté sur les consommateurs (la TVA, les taxes spécifiques sur les boissons ou la cigarette).$$,
        'highlights', array[$$impôt direct = payé directement à l'État (impôt sur le revenu, impôt foncier, impôt sur les salaires...)$$, $$impôt indirect = perçu par les entreprises, répercuté sur le consommateur (TVA, taxes spécifiques)$$]::text[],
        'fixation', jsonb_build_object('question', $$La TVA est-elle un impôt direct ou indirect ?$$, 'solution', $$Un impôt indirect.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle de l'impôt dans le développement local$$,
        'body', $$L'impôt finance les réalisations de l'État : construction de collèges, d'écoles, de routes, d'hôpitaux ; paiement des salaires des fonctionnaires ; adduction d'eau et électrification rurale ; éclairage public ; construction d'infrastructures (autoroutes, ports, aéroports) ; défense et sécurité des populations. Tous les citoyens, pauvres comme riches, doivent payer l'impôt ; celui qui ne s'en acquitte pas s'expose à des sanctions légales.$$,
        'highlights', array[$$l'impôt finance : écoles, routes, hôpitaux, salaires des fonctionnaires, infrastructures, sécurité$$, $$le paiement de l'impôt est obligatoire pour tous, sous peine de sanctions$$]::text[],
        'example', jsonb_build_object('statement', $$Une commune construit un nouvel hôpital grâce aux recettes fiscales. Quel principe cela illustre-t-il ?$$, 'solution', $$Le rôle de l'impôt dans le financement des réalisations et infrastructures de l'État au service du développement local.$$),
        'fixation', jsonb_build_object('question', $$Cite deux réalisations de l'État financées par l'impôt.$$, 'solution', $$Par exemple : la construction d'écoles et de routes (deux parmi : hôpitaux, adduction d'eau, électrification, sécurité).$$)
      ),
      jsonb_build_object(
        'heading', $$Encourager le paiement de l'impôt$$,
        'body', $$Pour inciter les populations à payer l'impôt, des campagnes de sensibilisation diffusent des slogans tels que : « Payer l'impôt, c'est remplir son devoir de citoyen », « L'impôt est obligatoire et s'impose à tous », ou « Sans impôt, il n'y a pas de développement dans le pays ». Ces messages rappellent que l'impôt est une contribution civique indispensable au bien-être collectif.$$,
        'highlights', array[$$sensibilisation par des slogans pour encourager le civisme fiscal$$]::text[],
        'fixation', jsonb_build_object('question', $$Propose un slogan encourageant le paiement de l'impôt.$$, 'solution', $$Par exemple : « Payer l'impôt, c'est remplir son devoir de citoyen. »$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une commerçante ayant construit des maisons qu'elle met en location reçoit un courrier des services des impôts lui demandant de payer 50 000 FCFA. Elle refuse, estimant que ces maisons ne sont pas la propriété de l'État. Un agent des impôts lui explique que l'impôt est obligatoire car il permet à l'État de financer ses réalisations et de contribuer au développement des localités.$$,
      'questions', array[
        $$Identifie la nature de l'impôt que doit payer cette commerçante.$$,
        $$Relève dans la situation l'utilité de l'impôt.$$,
        $$Formule un slogan en faveur du paiement de l'impôt.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on une personne qui paie ses impôts ?$$,
      'hint', $$C'est le terme officiel utilisé par l'administration fiscale.$$,
      'expected', $$Un contribuable.$$
    ),
    jsonb_build_object(
      'question', $$L'impôt foncier concerne-t-il les propriétaires de maisons/terrains ou les commerçants du marché ?$$,
      'hint', $$Il porte sur la propriété immobilière.$$,
      'expected', $$Les propriétaires de maisons et de terrains.$$
    ),
    jsonb_build_object(
      'question', $$Le paiement de l'impôt est-il obligatoire pour tous les citoyens ?$$,
      'hint', $$Riches comme pauvres.$$,
      'expected', $$Oui, il est obligatoire pour tous.$$
    ),
    jsonb_build_object(
      'question', $$Cite une infrastructure économique financée grâce à l'impôt.$$,
      'hint', $$Pense aux grands travaux publics.$$,
      'expected', $$Par exemple : une autoroute, un port, ou un aéroport.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-importance-impot';
