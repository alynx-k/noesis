-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 1 : "LA PROMOTION DES DROITS DE L'ENFANT ET SON
-- ÉPANOUISSEMENT" (course/view.php?id=1454, mod/resource id=9860,
-- pluginfile 45458). Rewritten entirely in original wording from the real
-- lesson content (actions of promotion, resource persons/institutions,
-- importance for the child and the community); no sentence copied
-- verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la journée mondiale de l'enfant, les élèves de ton établissement veulent organiser des activités de sensibilisation. Avant de choisir lesquelles, ils décident de s'informer sur ce que signifie « promouvoir les droits de l'enfant » et sur qui peut les y aider.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Comment fait-on la promotion des droits de l'enfant ?$$,
        'body', $$Promouvoir les droits de l'enfant consiste à organiser des actions qui font connaître ces droits au plus grand nombre : conférences, projections de films, débats, témoignages, pièces de théâtre ou expositions, affichages, brochures, création de clubs de défense des droits de l'enfant, et diffusion de messages en langues nationales pour toucher toutes les couches de la population.$$,
        'highlights', array[$$promotion des droits de l'enfant$$, $$sensibilisation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Faire la promotion des droits de l'enfant, c'est mettre en œuvre des actions variées de sensibilisation et d'information destinées à faire connaître et respecter ces droits au sein de la population.$$),
        'example', jsonb_build_object('statement', $$Un club scolaire décide de créer des affiches et d'organiser une causerie-débat sur les droits de l'enfant. Ces actions relèvent-elles de la promotion des droits de l'enfant ?$$, 'solution', $$Oui, l'affichage et la causerie-débat sont deux moyens reconnus de sensibiliser la population aux droits de l'enfant.$$)
      ),
      jsonb_build_object(
        'heading', $$Qui contribue à cette promotion ?$$,
        'body', $$Certaines personnes, du fait de leur métier, sont des personnes ressources pour la promotion des droits de l'enfant : les juristes, les parlementaires, les travailleurs sociaux et le personnel de l'éducation. Des institutions spécialisées, comme les ONG de défense des droits de l'enfant (par exemple Save The Children) ou l'UNICEF, jouent aussi un rôle de référence dans ce domaine.$$,
        'highlights', array[$$personnes ressources$$, $$UNICEF$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type d'acteur$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Personne ressource$$, $$Juriste, travailleur social, enseignant$$),
            jsonb_build_array($$Institution$$, $$UNICEF, ONG de défense des droits de l'enfant$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi un enseignant peut-il être considéré comme une personne ressource pour la promotion des droits de l'enfant ?$$, 'solution', $$Parce que sa fonction auprès des élèves lui permet d'informer et de sensibiliser directement les enfants sur leurs droits.$$)
      ),
      jsonb_build_object(
        'heading', $$Ce que la promotion apporte à l'enfant$$,
        'body', $$La promotion des droits de l'enfant favorise l'épanouissement de sa personnalité, sa reconnaissance en tant que sujet de droit, le développement de ses aptitudes et le respect des valeurs de sa propre communauté comme de celles des autres, ainsi qu'une insertion harmonieuse dans la société.$$,
        'highlights', array[$$épanouissement$$, $$reconnaissance juridique$$]::text[],
        'example', jsonb_build_object('statement', $$Un enfant participe régulièrement à des clubs de droits de l'enfant où il apprend à connaître ses droits et à les faire respecter. En quoi cela contribue-t-il à son épanouissement ?$$, 'solution', $$Cela renforce sa confiance en lui, développe ses aptitudes et l'aide à mieux s'insérer dans sa communauté en connaissant et en faisant valoir ses droits.$$)
      ),
      jsonb_build_object(
        'heading', $$Ce que la promotion apporte à la famille et à la communauté$$,
        'body', $$Au niveau de la famille et de la communauté, la promotion des droits de l'enfant favorise l'entente entre les membres, renforce la cohésion sociale et contribue à la préservation de la paix, car une communauté qui respecte les droits de ses enfants prévient de nombreuses tensions.$$,
        'highlights', array[$$cohésion sociale$$, $$préservation de la paix$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi le respect des droits de l'enfant peut-il contribuer à la paix dans une communauté ?$$, 'solution', $$Parce qu'une communauté qui protège et respecte ses enfants réduit les frustrations et les conflits, ce qui favorise l'entente et la paix sociale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une ONG organise une campagne de sensibilisation sur les droits de l'enfant dans un quartier, mais certains jeunes refusent d'y participer, estimant que cela ne les concerne pas directement.$$,
      'questions', array[
        $$Identifie le problème posé par le refus de ces jeunes.$$,
        $$Cite deux actions concrètes de promotion des droits de l'enfant que l'ONG pourrait mener.$$,
        $$Explique pourquoi il serait important pour ces jeunes de participer à cette campagne.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite trois actions permettant de faire la promotion des droits de l'enfant.$$,
      'hint', $$Pense aux conférences, aux affiches, aux clubs...$$,
      'expected', $$Organiser des conférences, des projections de films, des causeries-débats, des expositions, des campagnes d'affichage, ou créer des clubs de droits de l'enfant (trois exemples cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on une « personne ressource » pour la promotion des droits de l'enfant ?$$,
      'hint', $$Pense à des métiers qui touchent au droit, au social ou à l'éducation.$$,
      'expected', $$Une personne qui, par sa fonction (juriste, parlementaire, travailleur social, personnel de l'éducation...), est bien placée pour informer et défendre les droits de l'enfant.$$
    ),
    jsonb_build_object(
      'question', $$Cite une institution qui œuvre pour la promotion des droits de l'enfant.$$,
      'hint', $$Pense à une organisation internationale ou à une ONG.$$,
      'expected', $$L'UNICEF ou une ONG de défense des droits de l'enfant comme Save The Children.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance de la promotion des droits de l'enfant pour la communauté ?$$,
      'hint', $$Pense à l'entente et à la paix.$$,
      'expected', $$Elle favorise l'entente entre les membres, renforce la cohésion sociale et contribue à la préservation de la paix au sein de la communauté.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-droits-enfant';
