-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 3 : "LES INSTRUMENTS ET LES MÉCANISMES ET LA LUTTE CONTRE
-- LES DISCRIMINATIONS" (course/view.php?id=1448, mod/resource id=9788,
-- pluginfile 45380). Rewritten entirely in original wording from the real
-- lesson content (forms of discrimination, international/national
-- instruments and mechanisms, legal recourse, importance); no sentence
-- copied verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un camarade menace de s'en prendre à un élève en situation de handicap qui l'a vexé. Pour l'aider à comprendre pourquoi une telle réaction est inacceptable, ses camarades décident de s'informer sur les textes et les organismes qui protègent les personnes contre les discriminations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la discrimination ?$$,
        'body', $$La discrimination est un traitement inégal et défavorable qu'on impose à une personne à cause de ce qui la différencie des autres : son origine, son sexe, son âge, sa religion, la couleur de sa peau, sa position sociale, son ethnie, son état de santé, son état physique ou mental, ou encore son statut juridique, comme celui de réfugié.$$,
        'highlights', array[$$discrimination$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Constitue une discrimination tout traitement inégal et défavorable appliqué à une personne en raison d'une différence qui la caractérise, quelle qu'elle soit.$$),
        'example', jsonb_build_object('statement', $$Un élève en situation de handicap est mis à l'écart par ses camarades à cause de sa différence physique. S'agit-il d'une discrimination ?$$, 'solution', $$Oui, car il subit un traitement défavorable en raison de son état physique, ce qui correspond à une forme de discrimination.$$)
      ),
      jsonb_build_object(
        'heading', $$Les instruments de protection des droits de l'Homme$$,
        'body', $$Les instruments de protection sont des textes, internationaux ou nationaux, qui ont un caractère obligatoire pour les États qui les ratifient. Au niveau international, on trouve la Déclaration universelle des droits de l'Homme de 1948, la Convention sur l'élimination de toutes les formes de discrimination raciale de 1966, ou encore la convention protégeant les femmes contre les discriminations. Au niveau national, la Constitution ivoirienne et des lois spécifiques, comme celle interdisant les mutilations génitales ou celle rendant la scolarisation obligatoire entre cinq et seize ans, jouent ce rôle.$$,
        'highlights', array[$$instruments internationaux$$, $$instruments nationaux$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau$$, $$Exemple d'instrument$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$International$$, $$Déclaration universelle des droits de l'Homme (1948)$$),
            jsonb_build_array($$National$$, $$Constitution ivoirienne, loi sur la scolarisation obligatoire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite un instrument national de protection contre les discriminations.$$, 'solution', $$La Constitution ivoirienne, ou la loi rendant la scolarisation obligatoire entre cinq et seize ans.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mécanismes et les voies de recours$$,
        'body', $$Les mécanismes sont les structures chargées de faire respecter ces instruments : au niveau international, le Conseil des droits de l'Homme des Nations Unies ou la Cour africaine des droits de l'Homme ; au niveau national, le Conseil national des droits de l'Homme de Côte d'Ivoire ou le ministère chargé de la Famille et de l'Enfant. En cas de discrimination, une victime peut porter plainte à la police ou à la gendarmerie, ou saisir le tribunal compétent.$$,
        'highlights', array[$$mécanismes$$, $$voies de recours$$]::text[],
        'example', jsonb_build_object('statement', $$Une élève victime de discrimination liée à son genre souhaite faire valoir ses droits. Vers quel mécanisme national peut-elle se tourner ?$$, 'solution', $$Elle peut saisir le Conseil national des droits de l'Homme de Côte d'Ivoire ou le ministère chargé de la Famille et de l'Enfant, ou porter plainte auprès de la police ou de la gendarmerie.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi ces instruments et mécanismes sont-ils importants ?$$,
        'body', $$Ces instruments et mécanismes permettent de lutter contre toutes les formes de discrimination, de restaurer la dignité des personnes qui en sont victimes, et de construire une société plus juste et plus égalitaire pour tous.$$,
        'highlights', array[$$dignité$$, $$égalité$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi les instruments de protection des droits de l'Homme contribuent-ils à une société plus égalitaire ?$$, 'solution', $$Parce qu'ils permettent de sanctionner les discriminations et de restaurer la dignité des victimes, ce qui rapproche la société de l'égalité entre tous ses membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une élève est élue déléguée de sa classe, mais certains camarades refusent d'obéir à ses consignes uniquement parce que c'est une fille, et cherchent à pousser les autres à la contester.$$,
      'questions', array[
        $$Identifie la forme de discrimination illustrée par cette situation.$$,
        $$Cite un mécanisme national que cette élève pourrait saisir pour faire valoir ses droits.$$,
        $$Explique pourquoi ce refus n'est pas justifié.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on la discrimination ?$$,
      'hint', $$Pense au traitement inégal fondé sur une différence.$$,
      'expected', $$Un traitement inégal et défavorable appliqué à une personne en raison d'une différence qui la caractérise (origine, sexe, âge, religion, etc.).$$
    ),
    jsonb_build_object(
      'question', $$Cite un instrument international de protection des droits de l'Homme.$$,
      'hint', $$Pense à un texte adopté par les Nations Unies.$$,
      'expected', $$La Déclaration universelle des droits de l'Homme de 1948, ou la Convention sur l'élimination de toutes les formes de discrimination raciale.$$
    ),
    jsonb_build_object(
      'question', $$Cite un mécanisme national qui protège les droits de l'Homme en Côte d'Ivoire.$$,
      'hint', $$Pense à un conseil ou à un ministère.$$,
      'expected', $$Le Conseil national des droits de l'Homme de Côte d'Ivoire, ou le ministère chargé de la Famille et de l'Enfant.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance des instruments et mécanismes de protection contre les discriminations ?$$,
      'hint', $$Pense à la dignité et à l'égalité.$$,
      'expected', $$Ils permettent de lutter contre les discriminations, de restaurer la dignité des victimes et de construire une société plus juste et égalitaire.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-instruments-protection-discriminations';
