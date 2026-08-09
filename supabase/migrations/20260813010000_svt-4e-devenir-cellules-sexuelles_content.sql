-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 1 : le devenir des cellules sexuelles
-- chez l'Homme — spermatogenèse, ovulation, cycle menstruel,
-- fécondation). Sensitive but standard reproductive-biology topic: kept
-- factual and clinical, no invented statistics. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En cours de sciences, le professeur demande : "Depuis la puberté, le corps produit des cellules sexuelles en permanence. Mais que deviennent ces cellules si aucune fécondation n'a lieu ?" Les élèves cherchent à comprendre ce qui se passe, chez la fille comme chez le garçon.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La production des cellules sexuelles$$,
        'body', $$Dès la puberté, les testicules du garçon produisent en permanence des spermatozoïdes, par un phénomène continu appelé spermatogenèse. Chez la fille, les ovaires libèrent, en principe, une cellule reproductrice (l'ovule) environ une fois par mois : c'est l'ovulation, qui se répète de façon cyclique jusqu'à la ménopause.$$,
        'highlights', array[$$spermatogenèse$$, $$ovulation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dès la puberté, les testicules produisent en continu des spermatozoïdes (spermatogenèse), tandis que les ovaires libèrent cycliquement un ovule (ovulation), environ une fois par mois.$$),
        'example', jsonb_build_object('statement', $$Quelle différence existe-t-il entre la production des spermatozoïdes et celle des ovules ?$$, 'solution', $$La production de spermatozoïdes est continue, alors que la libération d'un ovule par les ovaires est cyclique, environ une fois par mois seulement.$$),
        'fixation', jsonb_build_object('question', $$Quel est le nom du phénomène de production continue des spermatozoïdes ?$$, 'solution', $$La spermatogenèse.$$)
      ),
      jsonb_build_object(
        'heading', $$Le devenir de l'ovule non fécondé$$,
        'body', $$Après l'ovulation, l'ovule survit environ une journée dans les voies génitales de la femme. S'il n'est pas fécondé, il dégénère et est éliminé. La muqueuse utérine, préparée à recevoir un éventuel embryon, se détache alors à son tour : c'est l'origine des règles, qui surviennent environ quatorze jours après l'ovulation et marquent le début d'un nouveau cycle menstruel.$$,
        'highlights', array[$$cycle menstruel$$, $$règles$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En l'absence de fécondation, l'ovule dégénère après environ une journée, et la muqueuse utérine se détache : ce sont les règles, qui marquent le début d'un nouveau cycle menstruel.$$),
        'example', jsonb_build_object('statement', $$Pourquoi les règles surviennent-elles chaque mois en l'absence de grossesse ?$$, 'solution', $$Parce qu'à chaque cycle, si l'ovule libéré n'est pas fécondé, la muqueuse utérine préparée pour accueillir un embryon n'est plus utile et se détache, provoquant les règles ; un nouveau cycle recommence ensuite.$$),
        'fixation', jsonb_build_object('question', $$Combien de temps l'ovule reste-t-il fécondable après l'ovulation ?$$, 'solution', $$Environ une journée (24 heures).$$)
      ),
      jsonb_build_object(
        'heading', $$Le devenir des spermatozoïdes$$,
        'body', $$Des millions de spermatozoïdes sont produits en permanence et libérés lors de l'éjaculation. Une fois dans les voies génitales féminines, la plupart meurent rapidement ou sont éliminés ; seuls quelques-uns parviennent jusqu'aux trompes, et un seul spermatozoïde peut féconder l'ovule, à condition que le rapport sexuel ait lieu pendant la période féconde du cycle.$$,
        'highlights', array[$$survie des spermatozoïdes$$, $$période féconde$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Parmi les millions de spermatozoïdes libérés lors de l'éjaculation, la grande majorité meurent ou sont éliminés dans les voies génitales féminines ; un seul peut féconder l'ovule, s'il est présent pendant la période féconde du cycle.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un rapport sexuel ne conduit-il pas toujours à une fécondation ?$$, 'solution', $$Parce que la fécondation n'est possible que si un ovule est présent dans les voies génitales, c'est-à-dire pendant la période féconde du cycle ; en dehors de cette période, il n'y a pas d'ovule à féconder.$$),
        'fixation', jsonb_build_object('question', $$Que devient la majorité des spermatozoïdes libérés lors d'un rapport sexuel ?$$, 'solution', $$Ils meurent ou sont éliminés dans les voies génitales féminines sans atteindre ou féconder l'ovule.$$)
      ),
      jsonb_build_object(
        'heading', $$La fécondation, rencontre des deux cellules sexuelles$$,
        'body', $$La fécondation est la fusion d'un spermatozoïde et d'un ovule, qui se produit dans les trompes de la femme. Elle donne naissance à une nouvelle cellule, la cellule-œuf, point de départ du développement d'un embryon. Elle ne peut avoir lieu que si les deux cellules sexuelles sont présentes en même temps dans les voies génitales féminines.$$,
        'highlights', array[$$fécondation$$, $$cellule-œuf$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La fécondation est la fusion d'un spermatozoïde et d'un ovule dans les trompes, donnant naissance à une cellule-œuf, à l'origine d'un embryon.$$),
        'example', jsonb_build_object('statement', $$Où a lieu la fécondation dans le corps de la femme ?$$, 'solution', $$Dans les trompes utérines (trompes de Fallope).$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la cellule issue de la fusion du spermatozoïde et de l'ovule ?$$, 'solution', $$La cellule-œuf.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un couple souhaite comprendre pourquoi une grossesse ne débute pas à chaque rapport sexuel, alors que des spermatozoïdes sont libérés et que la femme a des cycles menstruels réguliers.$$,
      'questions', array[
        $$Explique la différence entre la production des spermatozoïdes et celle des ovules.$$,
        $$Que devient l'ovule s'il n'est pas fécondé, et quelle en est la conséquence pour l'utérus ?$$,
        $$Pourquoi seule une petite période du cycle permet-elle une fécondation ?$$,
        $$Définis la fécondation et précise où elle a lieu.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la spermatogenèse ?$$,
      'hint', $$Pense aux testicules et à la continuité de la production.$$,
      'expected', $$C'est la production continue de spermatozoïdes par les testicules, à partir de la puberté.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'ovulation ?$$,
      'hint', $$Pense à la fréquence, environ une fois par mois.$$,
      'expected', $$C'est la libération d'un ovule par un ovaire, qui survient de façon cyclique, environ une fois par mois, à partir de la puberté.$$
    ),
    jsonb_build_object(
      'question', $$Que deviennent les règles chaque mois en l'absence de fécondation ?$$,
      'hint', $$Pense à la muqueuse utérine.$$,
      'expected', $$L'ovule non fécondé dégénère, et la muqueuse utérine, devenue inutile, se détache : ce sont les règles, qui marquent le début d'un nouveau cycle.$$
    ),
    jsonb_build_object(
      'question', $$Où et comment se produit la fécondation ?$$,
      'hint', $$Pense à la fusion des deux cellules sexuelles et au lieu.$$,
      'expected', $$La fécondation se produit dans les trompes utérines, par la fusion d'un spermatozoïde et d'un ovule, formant une cellule-œuf.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-devenir-cellules-sexuelles';
