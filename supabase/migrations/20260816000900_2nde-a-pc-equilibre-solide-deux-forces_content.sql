-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3297: "LEÇON 2: ÉQUILIBRE D'UN SOLIDE SOUMIS A DEUX
-- FORCES" (Thème 1: Mécanique)
-- (https://lyc.ecole-ci.org/course/view.php?id=3297)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32803, redirecting
-- to pluginfile "PC 2nd A - P3 Equilibre dun solide soumis à deux puis à
-- trois forces.pdf" (série-A-specific document, header "2nde A", 7 pages;
-- despite its filename mentioning "trois forces" too, the Moodle lesson
-- itself is titled and scoped to two forces, so this content focuses on the
-- two-force equilibrium condition and its worked examples).
-- Rewritten/paraphrased from the source PDF: the two-spring experimental
-- setup showing that at equilibrium the two forces share the same support
-- and have opposite senses, the equilibrium condition (same direction,
-- opposite senses, equal intensity, F1 + F2 = 0), and three worked examples
-- (solid on a horizontal plane: P + R = 0 ; solid suspended by a wire:
-- P + T = 0 ; solid on an inclined plane, with the support reaction
-- decomposed into a normal reaction and a tangential friction force,
-- R = RN + f, and P + R = 0 at equilibrium). 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-equilibre-solide-deux-forces',
  '2nde',
  'A',
  'physique-chimie',
  $$L'équilibre d'un solide soumis à deux forces$$,
  10,
  '2nde-a-pc-le-mouvement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant les congés scolaires passés dans son village, une élève de seconde observe à la fontaine une femme arrêtée sous un arbre, un seau d'eau posé sur la tête, sans qu'elle le retienne avec les mains. De retour en classe, elle rapporte cette observation à ses camarades : comment un seau peut-il rester immobile sur la tête sans être tenu ? Avec leur professeur de Physique-Chimie, ils décident de déterminer les conditions d'équilibre d'un solide soumis à deux forces et d'apprendre à représenter ces forces.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mise en évidence expérimentale des conditions d'équilibre$$,
        'body', $$On peut étudier l'équilibre d'un solide soumis à deux forces à l'aide d'un dispositif simple : un petit anneau A, relié de part et d'autre à deux ressorts eux-mêmes fixés à des supports fixes. À l'équilibre, on observe deux faits marquants : les deux forces F1 et F2 exercées par les ressorts sur l'anneau ont le même support (elles agissent selon la même droite d'action), et ces deux forces sont de sens opposés.$$,
        'highlights', array[$$même support$$, $$sens opposés$$]::text[],
        'fixation', jsonb_build_object('question', $$Que constate-t-on, dans l'expérience des deux ressorts, à propos du support des deux forces à l'équilibre ?$$, 'solution', $$Les deux forces ont le même support : elles agissent selon la même droite d'action.$$)
      ),
      jsonb_build_object(
        'heading', $$La condition d'équilibre d'un solide soumis à deux forces$$,
        'body', $$Un solide soumis à deux forces F1 et F2 est en équilibre si ces deux forces vérifient simultanément trois conditions : elles ont la même direction, des sens opposés, et la même intensité (la même valeur). Cette triple condition se traduit par une seule relation vectorielle très simple : F1 + F2 = 0, ce qui revient à dire que F2 est l'opposé de F1 (F2 = -F1).$$,
        'highlights', array[$$même direction$$, $$sens opposés$$, $$même intensité$$, $$F1 + F2 = 0$$]::text[],
        'property', jsonb_build_object('label', $$Condition d'équilibre à deux forces$$, 'text', $$Un solide soumis à deux forces F1 et F2 est en équilibre si et seulement si F1 + F2 = 0, c'est-à-dire si les deux forces ont même direction, même intensité et des sens opposés.$$),
        'fixation', jsonb_build_object('question', $$Écris la relation vectorielle traduisant l'équilibre d'un solide soumis à deux forces F1 et F2.$$, 'solution', $$F1 + F2 = 0.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple 1 : solide posé sur un plan horizontal$$,
        'body', $$Un solide simplement posé sur un support horizontal est soumis à deux forces : son poids P, vertical et dirigé vers le bas, et la réaction R du support, qui s'exerce perpendiculairement à la surface de contact (donc verticale et dirigée vers le haut dans ce cas). Le solide étant en équilibre, ces deux forces vérifient P + R = 0 : elles ont donc la même direction (verticale), la même intensité, et des sens opposés.$$,
        'highlights', array[$$poids P$$, $$réaction R$$, $$P + R = 0$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux forces qui s'exercent sur un solide simplement posé sur un plan horizontal ?$$, 'solution', $$Son poids P et la réaction R du support.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple 2 : solide suspendu par un fil$$,
        'body', $$Un solide suspendu à un fil inextensible et de masse négligeable est également soumis à deux forces : son poids P, vertical vers le bas, et la tension T du fil, verticale vers le haut. À l'équilibre, ces deux forces vérifient P + T = 0. Ainsi, dans le cas d'une petite sphère de masse m suspendue par un fil, l'intensité du poids et celle de la tension sont égales : par exemple, pour une sphère de 100 g, le poids vaut environ 1 N (avec g ≈ 10 N/kg), et la tension du fil vaut donc, elle aussi, environ 1 N.$$,
        'highlights', array[$$tension T du fil$$, $$P + T = 0$$]::text[],
        'example', jsonb_build_object('statement', $$Une petite sphère de masse m = 100 g est suspendue à une ficelle inextensible de masse négligeable et reste en équilibre. Quelles sont les deux forces en jeu, et que peut-on dire de leurs intensités ?$$, 'solution', $$Les deux forces sont le poids de la sphère et la tension du fil ; à l'équilibre, elles ont la même intensité, soit environ 1 N chacune (P = m×g ≈ 0,100×10 = 1 N).$$),
        'fixation', jsonb_build_object('question', $$Dans le cas d'un solide suspendu à un fil en équilibre, quelle relation existe-t-il entre le poids et la tension du fil ?$$, 'solution', $$Elles sont égales en intensité, de même direction (verticale) et de sens opposés : P + T = 0.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple 3 : solide posé sur un plan incliné$$,
        'body', $$Sur un plan incliné, l'équilibre d'un solide n'est possible que si la surface est suffisamment rugueuse (non parfaitement lisse). Dans ce cas, la réaction R du support ne se réduit plus à une simple force perpendiculaire à la surface : elle se décompose en une réaction normale RN, orthogonale au plan incliné, et une réaction tangentielle appelée force de frottement f, tangente au plan incliné et opposée au sens dans lequel le solide tendrait à glisser, telle que R = RN + f. Lorsque le solide est en équilibre sur ce plan incliné, on a toujours P + R = 0, la force de frottement f jouant alors un rôle essentiel puisque sans elle, le solide glisserait sous l'effet de la composante du poids parallèle au plan.$$,
        'highlights', array[$$réaction normale RN$$, $$force de frottement f$$, $$R = RN + f$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi un solide posé sur un plan incliné parfaitement lisse (sans aucun frottement) ne peut-il pas rester en équilibre ?$$, 'solution', $$Parce que sans force de frottement, la réaction du support se limiterait à sa composante normale RN, incapable à elle seule de compenser la composante du poids parallèle au plan incliné : le solide glisserait donc sous l'effet de cette composante non compensée.$$),
        'fixation', jsonb_build_object('question', $$En quoi se décompose la réaction R du support d'un solide en équilibre sur un plan incliné rugueux ?$$, 'solution', $$En une réaction normale RN (perpendiculaire au plan) et une force de frottement f (tangente au plan, opposée à la tendance au glissement) : R = RN + f.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une lampe suspendue par un fil au plafond d'une salle de classe reste parfaitement immobile. Un autre solide, posé sur une planche inclinée légèrement rugueuse, reste également immobile sans glisser.$$,
      'questions', array[
        $$Énonce la condition d'équilibre d'un solide soumis à deux forces.$$,
        $$Identifie les deux forces qui s'exercent sur la lampe suspendue, et écris la relation vectorielle traduisant son équilibre.$$,
        $$Explique pourquoi le solide posé sur la planche inclinée ne glisse pas, en mentionnant la force qui l'en empêche.$$,
        $$Explique ce qui se passerait si la planche inclinée était parfaitement lisse (sans aucun frottement).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois conditions que doivent vérifier deux forces pour qu'un solide qui leur est soumis soit en équilibre ?$$,
      'hint', $$Direction, sens, intensité.$$,
      'expected', $$Elles doivent avoir la même direction, des sens opposés et la même intensité.$$
    ),
    jsonb_build_object(
      'question', $$Écris la relation vectorielle d'équilibre d'un solide posé sur un plan horizontal, soumis à son poids P et à la réaction R du support.$$,
      'hint', $$C'est la même forme que F1 + F2 = 0.$$,
      'expected', $$P + R = 0.$$
    ),
    jsonb_build_object(
      'question', $$Quelle force empêche un solide de glisser sur un plan incliné rugueux ?$$,
      'hint', $$Elle est tangente au plan incliné.$$,
      'expected', $$La force de frottement f, composante tangentielle de la réaction du support.$$
    ),
    jsonb_build_object(
      'question', $$Une sphère de 200 g est suspendue à un fil et reste en équilibre. Quelle est l'intensité de la tension du fil (g ≈ 10 N/kg) ?$$,
      'hint', $$La tension est égale au poids à l'équilibre.$$,
      'expected', $$T = P = m×g = 0,200×10 = 2 N.$$
    )
  ),
  now()
);
