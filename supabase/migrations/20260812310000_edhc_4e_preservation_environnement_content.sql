-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 12 : "LA PRESERVATION DE L'ENVIRONNEMENT ET LE BIEN-ÊTRE DE
-- LA POPULATION" (course/view.php?id=1425, mod/resource id=9524,
-- pluginfile 45092). Rewritten entirely in original wording from the
-- real lesson content (definition, causes and consequences of
-- degradation, preservation measures, importance); no sentence copied
-- verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une excursion au bord du cours d'eau qui traverse leur ville, des élèves découvrent que l'eau est devenue jaunâtre et dégage une mauvaise odeur. Troublés par ce constat, ils décident de s'informer sur les causes de la dégradation de l'environnement et sur les moyens de le préserver.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'environnement et pourquoi se dégrade-t-il ?$$,
        'body', $$L'environnement est l'ensemble des éléments naturels et artificiels de notre milieu : l'eau, l'air, le sol, la flore et la faune. Il se dégrade essentiellement à cause des activités humaines : défrichements agricoles, abattage excessif du bois, exploitation minière, feux de brousse, pollution des eaux par des déchets industriels, pollution de l'air par les fumées, et chasse pratiquée à des fins commerciales.$$,
        'highlights', array[$$environnement$$, $$dégradation de l'environnement$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'environnement regroupe les éléments naturels et artificiels de notre milieu (eau, air, sol, flore, faune) ; sa dégradation résulte principalement des activités humaines qui modifient les écosystèmes.$$),
        'example', jsonb_build_object('statement', $$L'eau d'un cours d'eau devient jaunâtre et malodorante à cause de rejets industriels. Quelle cause de dégradation de l'environnement cela illustre-t-il ?$$, 'solution', $$Cela illustre la pollution des eaux par les déchets industriels, l'une des causes reconnues de dégradation de l'environnement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la dégradation de l'environnement$$,
        'body', $$La dégradation de l'environnement entraîne le réchauffement climatique, la disparition d'espèces animales et végétales, la réduction des ressources en eau, l'aridité des sols, la baisse de la productivité agricole et des revenus des agriculteurs, ainsi que des maladies de peau ; toutes ces conséquences affectent gravement la qualité de vie des populations.$$,
        'highlights', array[$$réchauffement climatique$$, $$aridité des sols$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Cause$$, $$Conséquence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Feux de brousse, déboisement$$, $$Aridité des sols, disparition d'espèces$$),
            jsonb_build_array($$Pollution des eaux et de l'air$$, $$Maladies, réduction des ressources en eau$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle conséquence la disparition progressive des forêts peut-elle avoir sur les sols ?$$, 'solution', $$Elle peut entraîner l'aridité des sols et la baisse de leur productivité agricole.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mesures de préservation de l'environnement$$,
        'body', $$Pour protéger la flore et la faune, on peut utiliser des pare-feux, moderniser les techniques agricoles, réglementer l'exploitation du bois et de la chasse, ou favoriser l'élevage d'espèces animales plutôt que le braconnage. Pour protéger l'air et l'eau, il faut épurer les eaux usées avant leur rejet et renforcer la réglementation contre les engins polluants.$$,
        'highlights', array[$$mesures de préservation$$, $$épuration des eaux$$]::text[],
        'example', jsonb_build_object('statement', $$Une usine installe un système d'épuration pour traiter ses eaux usées avant de les rejeter dans la nature. Quelle mesure de préservation applique-t-elle ?$$, 'solution', $$Elle applique une mesure de protection de l'eau, en épurant ses rejets avant de les déverser dans la nature.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi préserver l'environnement ?$$,
        'body', $$Respecter les mesures de préservation de l'environnement permet de maintenir l'équilibre de l'écosystème et de freiner l'avancée du désert, de favoriser une meilleure pluviométrie utile aux productions agricoles, et de préserver des espaces naturels importants pour la vie des populations.$$,
        'highlights', array[$$équilibre de l'écosystème$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi la préservation de l'environnement profite-t-elle à l'agriculture ?$$, 'solution', $$Elle favorise une meilleure pluviométrie et préserve la fertilité des sols, ce qui améliore les productions agricoles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un cousin, en vacances au village, explique qu'il utilise des produits chimiques pour pêcher afin d'augmenter ses revenus, et propose à son jeune parent de venir l'aider le lendemain.$$,
      'questions', array[
        $$Identifie le problème posé par cette pratique.$$,
        $$Cite deux conséquences possibles de la dégradation de l'environnement liée à cette pratique.$$,
        $$Explique pourquoi il vaudrait mieux refuser de participer à cette activité.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on l'environnement ?$$,
      'hint', $$Pense aux éléments naturels et artificiels du milieu.$$,
      'expected', $$L'ensemble des éléments naturels et artificiels de notre milieu : l'eau, l'air, le sol, la flore et la faune.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes de la dégradation de l'environnement.$$,
      'hint', $$Pense aux feux de brousse et à la pollution.$$,
      'expected', $$Les feux de brousse, le déboisement, l'exploitation minière ou la pollution des eaux et de l'air par des rejets industriels (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conséquences de la dégradation de l'environnement.$$,
      'hint', $$Pense au climat et aux sols.$$,
      'expected', $$Le réchauffement climatique, la disparition d'espèces, l'aridité des sols ou la baisse de la productivité agricole (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mesures permettant de préserver l'environnement.$$,
      'hint', $$Pense aux pare-feux et à l'épuration des eaux.$$,
      'expected', $$L'utilisation de pare-feux, la modernisation des techniques agricoles, la réglementation de la chasse et du bois, ou l'épuration des eaux usées (deux exemples suffisent).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-preservation-environnement';
