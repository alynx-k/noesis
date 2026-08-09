-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on the
-- rational use of public goods and community well-being, in 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le quartier de Brou, les robinets publics coulent en permanence car personne ne pense à les fermer, et les bancs du jardin public sont cassés par des jeunes qui s'y amusent. Les factures d'eau de la commune augmentent, et le jardin devient inutilisable. La classe s'interroge sur l'usage des biens publics.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un bien public ?$$,
        'body', $$Un bien public est un bien ou un service financé par l'État ou une collectivité, mis à la disposition de tous les citoyens : routes, écoles, hôpitaux, points d'eau, éclairage public, jardins et bâtiments administratifs.$$,
        'highlights', array[$$bien public$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Bien public$$, $$Utilité pour la communauté$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$École publique$$, $$Permet l'instruction de tous les enfants$$),
            jsonb_build_array($$Route$$, $$Facilite les déplacements et le commerce$$),
            jsonb_build_array($$Point d'eau public$$, $$Donne accès à l'eau potable$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite deux exemples de biens publics présents dans ton quartier.$$, 'solution', $$Par exemple : une école publique et une route (ou un point d'eau, un dispensaire, un jardin public).$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements qui nuisent aux biens publics$$,
        'body', $$Le vandalisme, le gaspillage, l'occupation illégale ou le détournement d'un bien public à des fins personnelles abîment ou privent la communauté d'un service utile à tous.$$,
        'highlights', array[$$vandalisme$$, $$gaspillage$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un bien public appartient à tous ; l'abîmer ou le gaspiller prive l'ensemble de la communauté, pas seulement son auteur.$$),
        'example', jsonb_build_object('statement', $$Des jeunes cassent les bancs du jardin public pour s'amuser. Qui en subit finalement les conséquences ?$$, 'solution', $$Toute la communauté, car le jardin devient inutilisable pour tous les habitants du quartier, pas seulement pour les jeunes fautifs.$$)
      ),
      jsonb_build_object(
        'heading', $$Utiliser rationnellement les biens publics$$,
        'body', $$Utiliser rationnellement un bien public, c'est l'employer avec mesure et respect : fermer un robinet public après usage, ne pas surcharger un service, signaler une dégradation, et entretenir les espaces communs.$$,
        'highlights', array[$$utilisation rationnelle$$]::text[],
        'example', jsonb_build_object('statement', $$Que devraient faire les habitants du quartier de Brou pour éviter le gaspillage d'eau aux robinets publics ?$$, 'solution', $$Fermer systématiquement les robinets après usage et signaler ceux qui fuient afin qu'ils soient réparés.$$)
      ),
      jsonb_build_object(
        'heading', $$Conséquences sur le bien-être de la communauté$$,
        'body', $$Un bien public bien entretenu profite durablement à tous : moins de dépenses de réparation pour la collectivité, des services disponibles plus longtemps, et un cadre de vie agréable pour la communauté.$$,
        'highlights', array[$$bien-être de la communauté$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle conséquence positive peut-on attendre si tous les habitants prennent soin des biens publics ?$$, 'solution', $$Les biens publics durent plus longtemps, coûtent moins cher à réparer, et améliorent la qualité de vie de tous.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans une école publique, des élèves cassent régulièrement les tables-bancs et laissent les lumières allumées en permanence, ce qui oblige la direction à demander plus de budget chaque année.$$,
      'questions', array[
        $$Explique en quoi ce comportement nuit à la communauté scolaire.$$,
        $$Cite deux gestes simples que ces élèves pourraient adopter pour préserver les biens de l'école.$$,
        $$Explique quel serait le bénéfice, pour toute l'école, d'une utilisation plus rationnelle de ces biens.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un bien public ? Donne deux exemples.$$,
      'hint', $$Pense à ce qui est financé pour être utilisé par tous.$$,
      'expected', $$Un bien financé par l'État ou une collectivité et mis à la disposition de tous ; par exemple une école publique et une route (ou un point d'eau, un hôpital).$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de comportement qui nuit aux biens publics et explique pourquoi.$$,
      'hint', $$Pense au vandalisme ou au gaspillage.$$,
      'expected', $$Par exemple, casser un banc public ou laisser couler un robinet inutilement ; cela abîme ou gaspille un bien qui appartient à toute la communauté.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie utiliser rationnellement un bien public ? Donne un exemple concret.$$,
      'hint', $$Pense à un usage mesuré et respectueux.$$,
      'expected', $$C'est l'utiliser avec mesure et respect ; par exemple fermer un robinet public après usage ou signaler une dégradation au lieu de l'ignorer.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le lien entre l'entretien des biens publics et le bien-être de la communauté ?$$,
      'hint', $$Pense à la durée de vie des services et à leur disponibilité pour tous.$$,
      'expected', $$Des biens publics bien entretenus durent plus longtemps, coûtent moins cher à réparer et restent disponibles pour tous, ce qui améliore le cadre de vie collectif.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-biens-publics';
