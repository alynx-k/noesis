-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 10 : Combustion d'un gaz dans l'air" (id 2086). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Depuis quelques jours, des élèves de 6ème constatent que les casseroles de la cantine noircissent pendant la cuisson, ce qui n'était pas le cas auparavant. Avec leur professeur, ils décident de réaliser la combustion du butane et d'identifier les produits formés.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La combustion complète du butane$$,
        'body', $$Quand la virole est ouverte, l'air (et donc le gaz oxygène) arrive en quantité suffisante : la flamme est bleue, très chaude, sans fumée. De la buée se forme sur les parois d'un verre à pied (formation d'eau), et l'eau de chaux se trouble (formation de dioxyde de carbone). La combustion complète du butane produit donc du dioxyde de carbone et de l'eau — c'est une réaction chimique dont l'équation littérale s'écrit : "butane + gaz oxygène → dioxyde de carbone + eau".$$,
        'highlights', array[$$combustion complète = suffisamment de gaz oxygène → flamme bleue, sans fumée$$, $$produits : dioxyde de carbone + eau$$]::text[],
        'fixation', jsonb_build_object('question', $$De quelle couleur est la flamme lors d'une combustion complète du butane ?$$, 'solution', $$Bleue.$$)
      ),
      jsonb_build_object(
        'heading', $$La combustion incomplète du butane$$,
        'body', $$Quand la virole est fermée, le gaz oxygène n'arrive pas en quantité suffisante : la flamme devient jaune fuligineuse, peu chaude, avec fumée noire. La combustion incomplète du butane produit du dioxyde de carbone, de l'eau, mais aussi du carbone (qui noircit les casseroles) et du monoxyde de carbone.$$,
        'highlights', array[$$combustion incomplète = manque de gaz oxygène → flamme jaune fuligineuse, fumée noire$$, $$produits supplémentaires : carbone (noircit) + monoxyde de carbone$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les casseroles noircissent-elles quand la combustion est incomplète ?$$, 'solution', $$Parce que la combustion incomplète produit du carbone, qui se dépose et noircit les casseroles.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les quatre produits d'une combustion incomplète du butane ?$$, 'solution', $$Le dioxyde de carbone, l'eau, le carbone, et le monoxyde de carbone.$$)
      ),
      jsonb_build_object(
        'heading', $$Dangers de la combustion incomplète$$,
        'body', $$Le dioxyde de carbone est un gaz à effet de serre, responsable du réchauffement climatique, et peut causer l'asphyxie. Le monoxyde de carbone est un gaz polluant très toxique, pouvant entraîner asphyxie et arrêt cardiaque. Pour éviter la combustion incomplète, il faut réaliser la combustion dans un endroit bien aéré et régler correctement l'appareil (virole ouverte, apport d'air suffisant).$$,
        'highlights', array[$$dioxyde de carbone : effet de serre, asphyxie$$, $$monoxyde de carbone : très toxique, asphyxie, arrêt cardiaque$$, $$solution : aération suffisante + bon réglage de la virole$$]::text[],
        'example', jsonb_build_object('statement', $$Une cuisinière à gaz produit une flamme jaune qui noircit les casseroles. Que faut-il faire ?$$, 'solution', $$Réaliser la combustion dans un endroit bien aéré, ou régler la cuisinière pour obtenir une combustion complète (flamme bleue).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le monoxyde de carbone est-il particulièrement dangereux ?$$, 'solution', $$C'est un gaz très toxique qui peut entraîner l'asphyxie et l'arrêt cardiaque.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une maman allume la cuisinière à gaz de la maison. Son enfant remarque que le gaz brûle avec une flamme jaune qui noircit la casserole utilisée — une situation inhabituelle.$$,
      'questions', array[
        $$Donne le nom du gaz utilisé à la maison, et le type de combustion réalisée.$$,
        $$Explique le noircissement de la casserole.$$,
        $$Indique comment remédier à la situation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Pour obtenir une flamme bleue lors de la combustion du butane, faut-il plus ou moins de gaz oxygène ?$$,
      'hint', $$La flamme bleue correspond à la combustion complète.$$,
      'expected', $$Plus de gaz oxygène (combustion complète).$$
    ),
    jsonb_build_object(
      'question', $$Complète : "butane + gaz oxygène → ______ + ______" (combustion complète)$$,
      'hint', $$Les deux produits de la combustion complète.$$,
      'expected', $$"...→ dioxyde de carbone + eau."$$
    ),
    jsonb_build_object(
      'question', $$La combustion du butane dans l'air est-elle une réaction chimique ou une transformation physique ?$$,
      'hint', $$De nouveaux corps apparaissent.$$,
      'expected', $$Une réaction chimique.$$
    ),
    jsonb_build_object(
      'question', $$Cite un danger du monoxyde de carbone pour la santé.$$,
      'hint', $$Pense à sa toxicité.$$,
      'expected', $$Il peut entraîner l'asphyxie ou l'arrêt cardiaque.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-combustion-gaz';
