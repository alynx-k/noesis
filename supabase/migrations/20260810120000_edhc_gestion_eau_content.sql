-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- rational water management and the safeguarding of social peace, in 100%
-- original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le village de Tanoh, un seul forage fournit l'eau potable à la population et sert aussi à arroser certains champs voisins. Pendant la saison sèche, des disputes éclatent chaque matin entre les familles qui viennent puiser l'eau et les cultivateurs qui en prélèvent de grandes quantités. Les anciens du village cherchent une solution.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'eau, une ressource vitale et limitée$$,
        'body', $$L'eau est indispensable à la vie, à la santé, à l'agriculture et à de nombreuses activités économiques. Pourtant, l'eau potable disponible n'est pas illimitée, surtout en saison sèche ou dans les zones où les points d'eau sont peu nombreux.$$,
        'highlights', array[$$ressource vitale$$, $$ressource limitée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une ressource limitée partagée par plusieurs usages (boisson, hygiène, agriculture) doit être gérée avec organisation, sinon les besoins des uns entrent en concurrence avec ceux des autres.$$),
        'example', jsonb_build_object('statement', $$Pourquoi le forage du village de Tanoh devient-il source de tension en saison sèche ?$$, 'solution', $$Parce que la quantité d'eau disponible diminue alors que les besoins (boisson et irrigation) restent les mêmes, ce qui crée une concurrence entre les usagers.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conflits liés à une mauvaise gestion de l'eau$$,
        'body', $$Quand l'accès à l'eau n'est pas organisé, des tensions peuvent naître entre usagers domestiques et agricoles, entre villages voisins partageant un même point d'eau, ou entre générations sur les priorités d'usage.$$,
        'highlights', array[$$conflits liés à l'eau$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Situation$$, $$Risque de conflit$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Un seul point d'eau pour plusieurs usages$$, $$Concurrence entre familles et cultivateurs$$),
            jsonb_build_array($$Point d'eau partagé entre deux villages$$, $$Tensions sur les horaires ou les quantités prélevées$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi un point d'eau partagé entre plusieurs usages est-il une source potentielle de conflit ?$$, 'solution', $$Parce que les besoins domestiques et agricoles entrent en concurrence pour une même ressource limitée, surtout en période de rareté.$$)
      ),
      jsonb_build_object(
        'heading', $$Les principes d'une gestion rationnelle de l'eau$$,
        'body', $$Gérer rationnellement l'eau, c'est l'économiser au quotidien, organiser des horaires ou des priorités d'usage clairs et acceptés par tous, entretenir les points d'eau, et impliquer la communauté dans les décisions sur son partage.$$,
        'highlights', array[$$gestion rationnelle$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle solution les anciens du village de Tanoh pourraient-ils proposer pour réduire les tensions au forage ?$$, 'solution', $$Établir des horaires distincts pour l'usage domestique et l'irrigation agricole, décidés et acceptés collectivement par les habitants.$$)
      ),
      jsonb_build_object(
        'heading', $$Gestion de l'eau et sauvegarde de la paix sociale$$,
        'body', $$Une gestion équitable et organisée de l'eau évite les tensions et les conflits entre usagers ou entre communautés voisines. Elle contribue ainsi directement à préserver la paix sociale, en particulier dans les zones où l'eau est rare.$$,
        'highlights', array[$$paix sociale$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi une bonne gestion de l'eau contribue-t-elle à la paix sociale ?$$, 'solution', $$Elle évite les conflits liés à la concurrence pour une ressource rare, en assurant un partage équitable et accepté par tous les usagers.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux villages voisins se disputent régulièrement l'accès à la même rivière, l'un l'utilisant pour l'eau potable, l'autre pour l'irrigation intensive de ses champs.$$,
      'questions', array[
        $$Explique pourquoi cette situation présente un risque pour la paix sociale entre les deux villages.$$,
        $$Propose deux mesures de gestion rationnelle de l'eau qui pourraient réduire ce risque.$$,
        $$Explique en quoi l'implication des deux communautés dans la décision est importante pour que la solution soit durable.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Pourquoi dit-on que l'eau est une ressource à la fois vitale et limitée ?$$,
      'hint', $$Pense à son importance et à sa disponibilité en saison sèche.$$,
      'expected', $$Parce qu'elle est indispensable à la vie et aux activités humaines, mais sa quantité disponible n'est pas illimitée, surtout en saison sèche ou dans les zones peu pourvues en points d'eau.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de conflit qui peut naître d'une mauvaise gestion de l'eau.$$,
      'hint', $$Pense à un point d'eau partagé entre plusieurs usages ou communautés.$$,
      'expected', $$Par exemple : une tension entre familles et cultivateurs autour d'un même forage, ou entre deux villages partageant un même cours d'eau.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux principes d'une gestion rationnelle de l'eau.$$,
      'hint', $$Pense à l'économie, aux horaires d'usage et à l'entretien des points d'eau.$$,
      'expected', $$Par exemple : économiser l'eau au quotidien et organiser des horaires ou priorités d'usage acceptés par tous (ou entretenir les points d'eau).$$
    ),
    jsonb_build_object(
      'question', $$Explique le lien entre la gestion rationnelle de l'eau et la sauvegarde de la paix sociale.$$,
      'hint', $$Pense à ce qui se passe quand le partage de l'eau n'est pas organisé.$$,
      'expected', $$Une gestion équitable et organisée de l'eau évite la concurrence entre usagers et les conflits qui en découlent, ce qui préserve la paix sociale entre familles ou communautés.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-gestion-eau';
