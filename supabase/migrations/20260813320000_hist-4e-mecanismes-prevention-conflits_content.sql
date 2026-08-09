-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the standard
-- Ivorian 4ème Histoire programme on traditional conflict-prevention and
-- resolution mechanisms (palabre, alliance à plaisanterie, rôle des
-- anciens, sociétés d'initiation). 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un différend éclate entre deux familles voisines à propos d'un champ. Au lieu de se battre, les deux familles se rendent sous l'arbre à palabre du village, où les anciens les écoutent avant de proposer une solution. Comment les peuples de Côte d'Ivoire prévenaient-ils et réglaient-ils traditionnellement leurs conflits ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La palabre, une institution de dialogue$$,
        'body', $$La palabre est une assemblée traditionnelle, souvent tenue sous un arbre à palabre au centre du village, où les protagonistes d'un différend exposent leur point de vue devant les anciens et les notables. Après avoir écouté toutes les parties, les sages proposent une solution acceptée par tous, dans le but de rétablir la paix plutôt que de désigner un seul coupable.$$,
        'highlights', array[$$palabre$$, $$arbre à palabre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La palabre est une assemblée traditionnelle de dialogue au cours de laquelle les anciens et notables écoutent les parties en conflit et proposent une solution acceptée de tous, afin de rétablir la paix sociale.$$),
        'example', jsonb_build_object('statement', $$Pourquoi la palabre privilégie-t-elle le dialogue plutôt que la sanction d'un seul responsable ?$$, 'solution', $$Parce que son but premier est de rétablir la paix et la cohésion sociale du village, plus que de désigner un coupable unique.$$),
        'fixation', jsonb_build_object('question', $$Où se tient traditionnellement une palabre dans de nombreux villages ?$$, 'solution', $$Sous l'arbre à palabre, au centre du village.$$)
      ),
      jsonb_build_object(
        'heading', $$L'alliance à plaisanterie (cousinage à plaisanterie)$$,
        'body', $$L'alliance à plaisanterie, aussi appelée cousinage à plaisanterie, est un pacte traditionnel entre deux peuples, ethnies ou familles : ils se considèrent comme des cousins pouvant se taquiner librement, sans jamais entrer en conflit grave l'un contre l'autre. En cas de tension, les « cousins à plaisanterie » interviennent pour apaiser les esprits par l'humour et rappeler le pacte ancestral.$$,
        'highlights', array[$$alliance à plaisanterie$$, $$cousinage$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'alliance à plaisanterie est un pacte traditionnel de parenté symbolique entre deux groupes, qui leur interdit tout conflit grave et les oblige à s'entraider et à apaiser les tensions par le dialogue et la plaisanterie.$$),
        'example', jsonb_build_object('statement', $$Un désaccord éclate entre deux familles issues de peuples alliés par la plaisanterie. Comment la tradition veut-elle qu'il se règle ?$$, 'solution', $$Par le dialogue et l'humour plutôt que par la confrontation, car l'alliance leur interdit traditionnellement d'entrer en conflit grave.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle des anciens, des chefs et des sociétés d'initiation$$,
        'body', $$Les anciens et les chefs de terre ou de village jouent un rôle central de médiateurs, respectés pour leur sagesse et leur connaissance des coutumes. Les sociétés d'initiation (comme le poro chez certains peuples) transmettent également aux jeunes des valeurs de respect, de solidarité et de retenue, qui contribuent à prévenir les conflits au sein de la communauté.$$,
        'highlights', array[$$médiation$$, $$sociétés d'initiation$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel rôle jouent les anciens dans la résolution des conflits ?$$, 'solution', $$Ils agissent comme médiateurs respectés, qui écoutent les parties et proposent des solutions fondées sur la coutume et la sagesse.$$)
      ),
      jsonb_build_object(
        'heading', $$D'autres mécanismes traditionnels de prévention$$,
        'body', $$D'autres pratiques renforcent la paix entre groupes voisins : les mariages inter-ethniques qui créent des liens de parenté entre familles, les pactes de sang scellant une amitié durable entre deux personnes ou groupes, et le recours à des symboles sacrés (masques, objets rituels) dont l'autorité morale est reconnue par tous et dissuade la violence.$$,
        'highlights', array[$$mariages inter-ethniques$$, $$pactes de sang$$]::text[],
        'example', jsonb_build_object('statement', $$Comment un mariage entre deux familles de villages différents peut-il contribuer à prévenir les conflits ?$$, 'solution', $$Il crée des liens de parenté entre les deux familles, ce qui rend un conflit grave entre elles beaucoup plus difficile et incite à la solidarité.$$),
        'fixation', jsonb_build_object('question', $$Cite un mécanisme traditionnel de prévention des conflits autre que la palabre et l'alliance à plaisanterie.$$, 'solution', $$Les mariages inter-ethniques, ou les pactes de sang, ou le recours à des symboles sacrés reconnus par tous.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conflit foncier menace de dégénérer entre deux villages voisins, historiquement liés par une alliance à plaisanterie et par plusieurs mariages entre leurs familles.$$,
      'questions', array[
        $$Explique ce qu'est la palabre et où elle se tient traditionnellement.$$,
        $$Explique ce qu'est une alliance à plaisanterie entre deux peuples.$$,
        $$Explique comment les mariages inter-ethniques peuvent aider à apaiser ce conflit.$$,
        $$Cite le rôle des anciens dans le règlement de ce type de différend.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la palabre ?$$,
      'hint', $$Pense à une assemblée de dialogue sous un arbre.$$,
      'expected', $$Une assemblée traditionnelle où les anciens et notables écoutent les parties en conflit et proposent une solution acceptée de tous, pour rétablir la paix.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une alliance (ou cousinage) à plaisanterie ?$$,
      'hint', $$Pense à une parenté symbolique qui interdit le conflit.$$,
      'expected', $$Un pacte traditionnel entre deux peuples qui se considèrent comme cousins, peuvent se taquiner librement, et ne peuvent, selon la tradition, entrer en conflit grave l'un contre l'autre.$$
    ),
    jsonb_build_object(
      'question', $$Quel rôle jouent les sociétés d'initiation dans la prévention des conflits ?$$,
      'hint', $$Pense aux valeurs transmises aux jeunes.$$,
      'expected', $$Elles transmettent aux jeunes des valeurs de respect, de solidarité et de retenue, qui contribuent à prévenir les conflits dans la communauté.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mécanismes traditionnels de prévention des conflits, autres que la palabre.$$,
      'hint', $$Pense aux alliances entre familles ou groupes.$$,
      'expected', $$L'alliance à plaisanterie et les mariages inter-ethniques, ou encore les pactes de sang.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-mecanismes-prevention-conflits';
