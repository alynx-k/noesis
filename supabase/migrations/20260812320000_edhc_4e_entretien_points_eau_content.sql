-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 13 : "L'ENTRETIEN DES POINTS D'EAU ET LA PRESERVATION DE LA
-- SANTE DES POPULATIONS" (course/view.php?id=1424, mod/resource
-- id=9512, pluginfile 45079). Rewritten entirely in original wording
-- from the real lesson content (definition and types of water points,
-- causes and consequences of pollution, preservation measures); no
-- sentence copied verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En visite chez un camarade souffrant de diarrhées fréquentes, des élèves remarquent que les abords du point d'eau non protégé du quartier servent aussi à faire la lessive et la vaisselle. Surpris, ils décident de s'informer sur l'entretien des points d'eau et son importance pour la santé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un point d'eau ?$$,
        'body', $$Un point d'eau est un endroit ou un dispositif où l'on s'approvisionne en eau pour satisfaire ses besoins. On distingue les points d'eau naturels, comme le marigot, la rivière ou le fleuve, et les points d'eau artificiels, comme le puits, la borne-fontaine, le robinet ou la pompe hydraulique.$$,
        'highlights', array[$$point d'eau$$, $$point d'eau naturel$$, $$point d'eau artificiel$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un point d'eau est tout endroit ou dispositif, naturel (marigot, rivière, fleuve) ou artificiel (puits, pompe, borne-fontaine), où une population s'approvisionne en eau.$$),
        'example', jsonb_build_object('statement', $$Un village s'approvisionne en eau grâce à une pompe hydraulique installée par une ONG. À quel type de point d'eau appartient cette installation ?$$, 'solution', $$Il s'agit d'un point d'eau artificiel, puisqu'il résulte d'un aménagement réalisé par l'homme.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes et les conséquences de la pollution des points d'eau$$,
        'body', $$La pollution des points d'eau provient principalement des rejets domestiques, des rejets agricoles et des rejets industriels. Elle affecte gravement la santé des populations et favorise des maladies comme la bilharziose, l'onchocercose ou l'ulcère de Buruli.$$,
        'highlights', array[$$pollution des points d'eau$$, $$maladies hydriques$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Source de pollution$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Rejets domestiques$$, $$Lessive, vaisselle près du point d'eau$$),
            jsonb_build_array($$Rejets industriels$$, $$Déchets d'usine$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite une maladie liée à la pollution des points d'eau.$$, 'solution', $$La bilharziose, l'onchocercose ou l'ulcère de Buruli.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mesures de préservation des points d'eau$$,
        'body', $$Pour préserver les points d'eau, on peut construire des ouvrages de protection comme des barrières ou des margelles autour du point d'eau, épurer les rejets des usines avant leur déversement, élaborer un code de conduite pour une gestion rationnelle de l'eau, et prévoir des sanctions contre les personnes qui polluent ces points d'eau.$$,
        'highlights', array[$$ouvrages de protection$$, $$sanctions$$]::text[],
        'example', jsonb_build_object('statement', $$Un village décide de construire une margelle autour de son puits et d'interdire la lessive à proximité. Ces actions relèvent-elles de la préservation des points d'eau ?$$, 'solution', $$Oui, la construction d'ouvrages de protection comme une margelle fait partie des mesures reconnues pour préserver la qualité des points d'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$Un enjeu de santé pour toute la population$$,
        'body', $$L'entretien des points d'eau concerne toute la population, car une eau non protégée devient rapidement une source de maladies pour tous ceux qui l'utilisent. Préserver ces points d'eau, c'est donc directement préserver la santé de la communauté.$$,
        'highlights', array[$$santé de la population$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi l'entretien des points d'eau est-il l'affaire de toute la population et non d'une seule personne ?$$, 'solution', $$Parce qu'un point d'eau pollué peut rendre malade tous ceux qui l'utilisent ; sa préservation profite donc à l'ensemble de la communauté.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pendant les vacances au village, un cousin invite un élève à se baigner et à faire sa toilette dans une rivière où de nombreux jeunes viennent aussi se soulager, sans aucune protection du point d'eau.$$,
      'questions', array[
        $$Identifie le problème posé par cette pratique.$$,
        $$Cite deux mesures qui permettraient de préserver ce point d'eau.$$,
        $$Explique pourquoi il vaudrait mieux refuser cette invitation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un point d'eau ?$$,
      'hint', $$Pense aux endroits où l'on s'approvisionne en eau.$$,
      'expected', $$Un endroit ou un dispositif où l'on s'approvisionne en eau pour satisfaire ses besoins, comme un puits, une rivière ou une pompe.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes de la pollution des points d'eau.$$,
      'hint', $$Pense aux rejets domestiques, agricoles et industriels.$$,
      'expected', $$Les rejets domestiques, les rejets agricoles ou les rejets industriels (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite une maladie pouvant résulter de la pollution des points d'eau.$$,
      'hint', $$Pense à la bilharziose ou à l'onchocercose.$$,
      'expected', $$La bilharziose, l'onchocercose ou l'ulcère de Buruli.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mesures permettant de préserver un point d'eau.$$,
      'hint', $$Pense aux ouvrages de protection et à l'épuration des eaux.$$,
      'expected', $$Construire des ouvrages de protection (barrières, margelles), épurer les rejets des usines, ou sanctionner les pollueurs (deux exemples suffisent).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-entretien-points-eau';
