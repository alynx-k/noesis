-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the Ivorian
-- 4ème Géographie programme on the shortcomings of the deconcentrated/
-- decentralized administrative organization and their impact on
-- development, building directly on the two previous lessons (see
-- 20260813370000 and 20260813380000). Kept qualitative, no invented
-- statistics. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une commune rurale, le conseil municipal souhaite construire un nouveau centre de santé, mais le projet est bloqué depuis deux ans faute de budget suffisant et de personnel qualifié pour le gérer. Pendant ce temps, une grande ville voisine multiplie les infrastructures. Pourquoi l'organisation administrative, censée rapprocher les décisions des populations, connaît-elle de telles limites ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Des moyens financiers et matériels insuffisants$$,
        'body', $$De nombreuses collectivités territoriales, notamment les petites communes rurales, disposent de ressources financières limitées : les recettes fiscales locales sont souvent faibles, et les subventions de l'État ne suffisent pas toujours à financer les infrastructures nécessaires (routes, écoles, centres de santé, adduction d'eau). Ce manque de moyens ralentit fortement la réalisation des projets de développement local.$$,
        'highlights', array[$$moyens financiers insuffisants$$, $$recettes fiscales locales$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Beaucoup de collectivités territoriales, en particulier les communes rurales, manquent de ressources financières suffisantes pour financer leurs projets de développement, ce qui freine la réalisation des infrastructures locales.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le manque de recettes fiscales locales freine-t-il le développement d'une commune ?$$, 'solution', $$Parce qu'il limite les moyens dont dispose la commune pour financer ses infrastructures et ses services (écoles, santé, routes, eau).$$)
      ),
      jsonb_build_object(
        'heading', $$Un manque de personnel qualifié$$,
        'body', $$Certaines collectivités, surtout dans les zones rurales ou éloignées, manquent de personnel administratif et technique suffisamment formé pour gérer efficacement leur budget, planifier les projets et assurer le suivi des services publics locaux, ce qui nuit à la qualité de la gestion locale.$$,
        'highlights', array[$$personnel qualifié$$, $$gestion locale$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le manque de personnel qualifié peut-il retarder un projet communal, même si le budget existe ?$$, 'solution', $$Parce qu'il faut des compétences techniques pour bien planifier, exécuter et suivre le projet ; sans personnel formé, même des fonds disponibles peuvent être mal utilisés ou le projet mal géré.$$),
        'fixation', jsonb_build_object('question', $$Quelle conséquence a le manque de personnel qualifié sur la gestion d'une collectivité ?$$, 'solution', $$Une gestion locale moins efficace des projets et des services publics.$$)
      ),
      jsonb_build_object(
        'heading', $$Un chevauchement des compétences entre l'État et les collectivités$$,
        'body', $$La coexistence de représentants déconcentrés de l'État (préfets, sous-préfets) et d'autorités décentralisées élues (maires, présidents de conseil régional) entraîne parfois des confusions ou des conflits de compétence sur certains dossiers, ce qui peut ralentir la prise de décision et créer des tensions entre les deux niveaux d'administration.$$,
        'highlights', array[$$chevauchement de compétences$$, $$conflits de compétence$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi peut-il y avoir des conflits de compétence entre un préfet et un maire ?$$, 'solution', $$Parce que leurs domaines d'intervention se recoupent parfois sur un même territoire, ce qui peut créer des confusions sur qui doit décider.$$)
      ),
      jsonb_build_object(
        'heading', $$Des disparités régionales de développement$$,
        'body', $$Les insuffisances de l'organisation administrative contribuent à des inégalités de développement entre les régions : les grandes villes et certaines régions bénéficient davantage d'infrastructures et d'investissements, tandis que des zones rurales ou reculées restent moins bien équipées, ce qui freine leur développement économique et social.$$,
        'highlights', array[$$disparités régionales$$, $$développement inégal$$]::text[],
        'example', jsonb_build_object('statement', $$Comment les insuffisances de l'organisation administrative peuvent-elles renforcer les inégalités entre régions ?$$, 'solution', $$Les régions et communes disposant de plus de ressources et de personnel qualifié parviennent à mieux se développer, tandis que les zones plus pauvres en moyens restent à la traîne, ce qui accentue les écarts entre elles.$$),
        'fixation', jsonb_build_object('question', $$Cite une conséquence des insuffisances administratives sur le développement du pays.$$, 'solution', $$Des disparités de développement entre les régions et les communes, certaines étant mieux équipées que d'autres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une ONG constate que deux communes voisines de Côte d'Ivoire n'ont pas le même niveau d'équipement en écoles et en centres de santé, malgré des besoins comparables.$$,
      'questions', array[
        $$Cite deux insuffisances de l'organisation administrative qui limitent le développement local.$$,
        $$Explique pourquoi le manque de personnel qualifié peut ralentir un projet communal.$$,
        $$Explique en quoi le chevauchement de compétences entre l'État et les collectivités peut poser problème.$$,
        $$Explique comment ces insuffisances peuvent expliquer la différence observée entre les deux communes.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux insuffisances de l'organisation administrative en Côte d'Ivoire.$$,
      'hint', $$Pense aux moyens financiers et au personnel.$$,
      'expected', $$Le manque de moyens financiers et matériels des collectivités, et le manque de personnel qualifié.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le manque de recettes fiscales locales freine-t-il le développement d'une commune ?$$,
      'hint', $$Pense au financement des infrastructures.$$,
      'expected', $$Il limite les moyens disponibles pour financer les infrastructures et les services publics locaux.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on chevauchement de compétences entre l'État et les collectivités territoriales ?$$,
      'hint', $$Pense aux domaines d'intervention qui se recoupent.$$,
      'expected', $$Une situation où les domaines d'intervention des représentants de l'État (préfets) et des autorités élues (maires) se recoupent, créant des confusions ou des conflits.$$
    ),
    jsonb_build_object(
      'question', $$Quelle conséquence les insuffisances de l'organisation administrative ont-elles sur le développement du pays ?$$,
      'hint', $$Pense aux différences entre régions.$$,
      'expected', $$Elles créent des disparités de développement entre les régions et les communes.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-4e-insuffisances-organisation-administrative';
