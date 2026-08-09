-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 11 : "LES COMPORTEMENTS RESPONSABLES DE L'ADOLESCENT(E) ET
-- L'INTEGRATION SOCIALE HARMONIEUSE" (course/view.php?id=1427,
-- mod/resource id=9548, pluginfile 45118). Rewritten entirely in
-- original wording from the real lesson content (definition and
-- manifestations of adolescence, dangers, responsible behaviours,
-- importance); no sentence copied verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves refusent de participer à l'anniversaire d'un camarade organisé dans un bar où l'on sert de l'alcool en abondance, malgré l'insistance des autres. Pour convaincre l'organisateur de changer de lieu, ils décident de s'informer sur les comportements responsables à adopter durant l'adolescence.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'adolescence ?$$,
        'body', $$L'adolescence est la période de croissance et de développement située entre l'enfance et l'âge adulte, généralement entre dix et dix-neuf ans. Elle se caractérise par d'importantes transformations physiques (comme le développement de la poitrine ou l'apparition de poils), physiologiques (comme les premières règles ou éjaculations) et psychologiques (besoin d'affirmation de soi, attachement au groupe d'amis, humeurs instables).$$,
        'highlights', array[$$adolescence$$, $$transformations$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'adolescence est une période de transition, comprise entre dix et dix-neuf ans, marquée par des transformations physiques, physiologiques et psychologiques profondes du jeune homme ou de la jeune fille.$$),
        'example', jsonb_build_object('statement', $$Un adolescent ressent un fort besoin de s'affirmer et d'appartenir à un groupe d'amis. De quel type de transformation s'agit-il ?$$, 'solution', $$D'une transformation psychologique, caractéristique de la période de l'adolescence.$$)
      ),
      jsonb_build_object(
        'heading', $$Les dangers de l'adolescence$$,
        'body', $$Le désir de s'affirmer peut exposer l'adolescent à plusieurs dangers : les mauvaises fréquentations, l'envie de vivre de nouvelles expériences comme la consommation d'alcool, de tabac ou de drogue, le désintérêt pour les études, ou encore le refus de l'autorité des aînés.$$,
        'highlights', array[$$mauvaises fréquentations$$, $$consommation d'alcool$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Danger$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nouvelles expériences$$, $$Alcool, tabac, drogue$$),
            jsonb_build_array($$Rejet de l'autorité$$, $$Braver les aînés, désintérêt scolaire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi la consommation d'alcool est-elle considérée comme un danger de l'adolescence ?$$, 'solution', $$Parce qu'elle fait partie des nouvelles expériences recherchées par certains adolescents en quête d'affirmation, mais qui peuvent nuire gravement à leur santé et à leur avenir.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables à adopter$$,
        'body', $$Pour éviter les erreurs qui pourraient compromettre son avenir, l'adolescent devrait avoir de bonnes fréquentations, s'habiller de manière décente, s'abstenir de consommer alcool et tabac, respecter les aînés, écouter les conseils de ses parents, et adopter des comportements sexuels responsables.$$,
        'highlights', array[$$comportements responsables$$]::text[],
        'example', jsonb_build_object('statement', $$Face à l'insistance de ses camarades à fêter un anniversaire dans un bar, un élève propose plutôt d'organiser la fête dans un lieu sans alcool. Ce choix illustre-t-il un comportement responsable ?$$, 'solution', $$Oui, il illustre l'abstinence face à l'alcool, l'un des comportements responsables recommandés à l'adolescence.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de ces comportements pour l'intégration sociale$$,
        'body', $$Adopter des comportements responsables à l'adolescence permet de vivre sainement cette période de transition, de réussir ses études, d'entretenir de bonnes relations avec ses parents et les autres adultes, et de s'insérer de manière harmonieuse dans sa communauté.$$,
        'highlights', array[$$intégration sociale harmonieuse$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi de bons comportements à l'adolescence favorisent-ils une intégration sociale harmonieuse ?$$, 'solution', $$Parce qu'ils permettent de préserver de bonnes relations avec l'entourage et de réussir sa scolarité, ce qui facilite ensuite une bonne insertion dans la communauté.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En vacances chez son oncle, un adolescent constate que son cousin et ses amis boivent de l'alcool et fument régulièrement, prétendant que c'est le seul moyen de s'occuper pendant les vacances, et l'invitent à faire de même.$$,
      'questions', array[
        $$Identifie le problème posé par le comportement de ce cousin et de ses amis.$$,
        $$Cite deux comportements responsables que cet adolescent pourrait leur opposer.$$,
        $$Explique pourquoi il devrait refuser de les imiter.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on l'adolescence ?$$,
      'hint', $$Pense à la période entre l'enfance et l'âge adulte.$$,
      'expected', $$La période de croissance et de développement située entre l'enfance et l'âge adulte, environ entre dix et dix-neuf ans, marquée par des transformations physiques, physiologiques et psychologiques.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux dangers auxquels un adolescent peut être exposé.$$,
      'hint', $$Pense aux mauvaises fréquentations et aux substances nocives.$$,
      'expected', $$Les mauvaises fréquentations, la consommation d'alcool, de tabac ou de drogue, ou le désintérêt pour les études (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux comportements responsables à adopter à l'adolescence.$$,
      'hint', $$Pense au respect des aînés et à l'abstinence face à l'alcool.$$,
      'expected', $$Respecter les aînés, écouter les conseils des parents, s'abstenir de consommer alcool et tabac, ou avoir de bonnes fréquentations (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance de l'adoption de comportements responsables à l'adolescence ?$$,
      'hint', $$Pense à la scolarité et à l'intégration sociale.$$,
      'expected', $$Elle permet de vivre sainement cette période, de réussir ses études, d'avoir de bonnes relations avec les adultes, et de s'insérer harmonieusement dans sa communauté.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-adolescent-integration-sociale';
