-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- alliances between Mandé and Gour peoples and social cohesion (notably the
-- "alliance/cousinage à plaisanterie" tradition), in 100% original wording.
-- Kept deliberately general on specific sub-group pairings to avoid
-- asserting details not reliably known.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une fête de village dans le Nord de la Côte d'Ivoire, N'Golo, d'un peuple Mandé, se fait chambrer avec bonne humeur par son ami Yeo, d'un peuple Gour : ils échangent des taquineries traditionnelles au lieu de se fâcher. Les anciens expliquent que leurs deux peuples sont liés par une très vieille alliance qui empêche les conflits entre eux.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les peuples Mandé et les peuples Gour$$,
        'body', $$Les peuples Mandé et les peuples Gour font partie des grands groupes ethniques présents notamment dans le Nord et le Nord-Ouest de la Côte d'Ivoire. Voisins depuis des siècles, ils ont développé des relations d'échanges, de commerce, mais aussi des liens de parenté symbolique pour vivre en harmonie.$$,
        'highlights', array[$$peuples Mandé$$, $$peuples Gour$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi des peuples voisins ont-ils intérêt à nouer des alliances entre eux ?$$, 'solution', $$Pour éviter les conflits liés au voisinage (terres, ressources) et pour favoriser les échanges et l'entraide.$$)
      ),
      jsonb_build_object(
        'heading', $$L'alliance à plaisanterie, un pacte de paix$$,
        'body', $$L'alliance à plaisanterie, aussi appelée cousinage à plaisanterie, est un pacte traditionnel entre deux peuples ou familles : ils se considèrent comme des cousins qui peuvent se taquiner librement, sans jamais pouvoir entrer en conflit grave l'un contre l'autre. Cette parenté symbolique interdit la guerre entre les groupes alliés.$$,
        'highlights', array[$$alliance à plaisanterie$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Deux peuples liés par une alliance à plaisanterie se doivent assistance mutuelle et ne peuvent, selon la tradition, se faire la guerre : toute tension entre eux doit se résoudre par le dialogue ou la plaisanterie, jamais par la violence.$$),
        'example', jsonb_build_object('statement', $$Un désaccord éclate entre deux familles issues de peuples alliés par la plaisanterie. Comment la tradition veut-elle qu'il se règle ?$$, 'solution', $$Par le dialogue et l'humour plutôt que par la confrontation, car l'alliance leur interdit traditionnellement d'entrer en conflit grave.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle de ces alliances dans la prévention des conflits$$,
        'body', $$Ces alliances servent de mécanisme traditionnel de règlement des différends : en cas de tension, les « cousins à plaisanterie » interviennent pour apaiser les esprits, rappeler le pacte ancestral et restaurer le dialogue entre les communautés.$$,
        'highlights', array[$$règlement des différends$$]::text[],
        'example', jsonb_build_object('statement', $$Une dispute autour d'un champ oppose deux villages issus de peuples alliés. Quel rôle les anciens peuvent-ils jouer ?$$, 'solution', $$Ils peuvent rappeler le pacte d'alliance qui les unit et médier le conflit pour éviter qu'il ne dégénère.$$)
      ),
      jsonb_build_object(
        'heading', $$Un patrimoine de cohésion sociale à préserver$$,
        'body', $$Ces alliances constituent un patrimoine culturel important pour la cohésion sociale ivoirienne : elles rappellent que des peuples différents peuvent vivre en paix durable, se respecter, et se soutenir dans les moments difficiles.$$,
        'highlights', array[$$cohésion sociale$$, $$patrimoine culturel$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi est-il important de transmettre ces traditions d'alliance aux jeunes générations ?$$, 'solution', $$Parce qu'elles favorisent la paix et le respect entre communautés différentes, et contribuent à préserver la cohésion sociale du pays.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conflit foncier menace de dégénérer entre deux communautés voisines, historiquement liées par une alliance traditionnelle à plaisanterie.$$,
      'questions', array[
        $$Rappelle en quoi consiste une alliance à plaisanterie entre deux peuples.$$,
        $$Explique comment cette alliance peut aider à apaiser ce conflit foncier.$$,
        $$Explique pourquoi préserver de telles alliances est utile pour la cohésion sociale du pays.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une alliance (ou cousinage) à plaisanterie entre deux peuples ?$$,
      'hint', $$Pense à une parenté symbolique qui interdit le conflit.$$,
      'expected', $$Un pacte traditionnel entre deux peuples qui se considèrent comme cousins, peuvent se taquiner librement, et ne peuvent, selon la tradition, entrer en conflit grave l'un contre l'autre.$$
    ),
    jsonb_build_object(
      'question', $$Quel rôle jouent ces alliances dans la prévention des conflits entre communautés voisines ?$$,
      'hint', $$Pense à la médiation et au dialogue.$$,
      'expected', $$Elles servent de mécanisme traditionnel de règlement des différends : les cousins à plaisanterie interviennent pour apaiser les tensions et rappeler le pacte de paix qui unit les groupes.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi peut-on dire que ces alliances sont un patrimoine culturel important pour la Côte d'Ivoire ?$$,
      'hint', $$Pense à la paix durable entre communautés différentes.$$,
      'expected', $$Parce qu'elles montrent que des peuples différents peuvent vivre en paix, se respecter et se soutenir, ce qui renforce la cohésion sociale du pays.$$
    ),
    jsonb_build_object(
      'question', $$Que devrait faire une personne liée par une alliance à plaisanterie face à une tension avec son « peuple cousin » ?$$,
      'hint', $$Pense au dialogue plutôt qu'à la violence.$$,
      'expected', $$Elle devrait privilégier le dialogue, l'humour et le rappel du pacte ancestral plutôt que la confrontation ou la violence.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-alliances-peuples';
