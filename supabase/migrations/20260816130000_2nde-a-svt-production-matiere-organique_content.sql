-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3706: "SVT 2nd A_L6_La production de la matière organique"
-- (https://lyc.ecole-ci.org/course/view.php?id=3706)
-- Resource "Je lis le résumé de la leçon", pluginfile "SVT 2nd A_L6_La
-- production de la matière organique.pdf" (7 pages; internally "Leçon 4").
-- Rewritten/paraphrased from the source PDF: the three starch-test
-- experiments on geranium leaves (light vs darkness, presence vs absence of
-- CO2, variegated leaf with/without chlorophyll) revealing the conditions
-- of photosynthesis, the interpretation and global equation of
-- photosynthesis, and the reciprocal exchanges between green plants and
-- the four environmental spheres (CO2/light/heat from the atmosphere,
-- mineral salts from the lithosphere, water from the hydrosphere, oxygen
-- released to the atmosphere). 100% original wording; no sentence copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-production-matiere-organique',
  '2nde',
  'A',
  'svt',
  $$La production de la matière organique$$,
  6,
  '2nde-a-svt-grands-ensembles-environnementaux',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une sortie dans le jardin de leur établissement, accompagnés de leur professeur de SVT, des élèves de seconde A déterrent des tubercules de manioc. Interrogé, le professeur leur explique que ces tubercules sont des organes de réserve de matière organique produite au niveau des feuilles du manioc. Intrigués, les élèves décident de déterminer les conditions de production de cette matière organique et d'établir les relations entre les grands ensembles environnementaux et cette production.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La production d'amidon exige de la lumière, du CO2 et de la chlorophylle$$,
        'body', $$Trois expériences sur des feuilles de géranium, testées à l'eau iodée après décoloration à l'alcool bouillant, permettent d'identifier les conditions de la production de matière organique. Une feuille éclairée pendant 24 heures se colore en bleu violacé (présence d'amidon), alors qu'une feuille maintenue à l'obscurité ne se colore pas : la lumière est donc nécessaire. Deux lots de feuilles également éclairées, dont l'un reçoit de l'air privé de CO2 grâce à une solution de potasse, montrent que seul le lot ayant reçu du CO2 produit de l'amidon : le dioxyde de carbone est donc nécessaire. Enfin, une feuille panachée éclairée en présence de CO2 ne se colore en bleu violacé qu'au niveau de ses zones vertes : la chlorophylle est donc elle aussi indispensable. La production d'amidon ne se fait donc qu'en présence simultanée de lumière, de dioxyde de carbone et de chlorophylle.$$,
        'highlights', array[$$chlorophylle$$, $$dioxyde de carbone$$, $$lumière$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi une feuille panachée testée à l'eau iodée ne se colore-t-elle qu'au niveau de ses parties vertes ?$$, 'solution', $$Parce que seules les parties vertes contiennent de la chlorophylle, indispensable à la production d'amidon.$$)
      ),
      jsonb_build_object(
        'heading', $$La photosynthèse transforme l'eau et le CO2 en matière organique$$,
        'body', $$La chlorophylle, pigment vert des végétaux, capte l'énergie lumineuse et devient ainsi active. Cette activation permet la décomposition de l'eau apportée à la feuille par les racines, ce qui libère du dioxygène rejeté dans l'atmosphère. L'hydrogène issu de cette décomposition se combine alors au dioxyde de carbone absorbé par la feuille pour former un glucide, qui constitue la matière organique. Une partie de cette matière organique est utilisée directement par la plante pour sa croissance, tandis que l'autre est mise en réserve dans des organes spécialisés comme les fruits ou les tubercules. Cette fabrication de matière organique par les feuilles vertes, en présence de lumière et avec dégagement de dioxygène, porte le nom de photosynthèse.$$,
        'highlights', array[$$photosynthèse$$, $$glucide$$, $$organe de réserve$$]::text[],
        'property', jsonb_build_object('label', $$Équation globale de la photosynthèse$$, 'text', $$6 CO2 + 6 H2O --(chlorophylle, énergie lumineuse)--> C6H12O6 (glucose) + 6 O2$$),
        'fixation', jsonb_build_object('question', $$Où la plante met-elle en réserve la partie de la matière organique qu'elle n'utilise pas immédiatement pour sa croissance ?$$, 'solution', $$Dans des organes de réserve, comme les fruits ou les tubercules.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grands ensembles environnementaux fournissent les conditions de la photosynthèse$$,
        'body', $$L'observation des interactions entre les végétaux et leur milieu montre que chacun des grands ensembles environnementaux apporte à la plante une ressource indispensable à la photosynthèse : l'atmosphère lui fournit le dioxyde de carbone, la lumière et la température nécessaires, la lithosphère lui fournit les sels minéraux puisés dans le sol, et l'hydrosphère lui fournit l'eau absorbée par les racines. En retour, la biosphère (représentée ici par les végétaux verts) restitue du dioxygène à l'atmosphère. La matière organique ainsi produite par les végétaux ne profite pas qu'à eux seuls : elle est aussi consommée par les autres êtres vivants, ce qui en fait la base de toute la chaîne alimentaire.$$,
        'highlights', array[$$sels minéraux$$, $$interactions$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Grand ensemble environnemental$$, $$Ce qu'il apporte à la plante$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Atmosphère$$, $$Dioxyde de carbone, lumière, température$$),
            jsonb_build_array($$Lithosphère$$, $$Sels minéraux$$),
            jsonb_build_array($$Hydrosphère$$, $$Eau$$),
            jsonb_build_array($$Biosphère (végétaux)$$, $$Restitue du dioxygène à l'atmosphère$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel grand ensemble environnemental fournit les sels minéraux indispensables à la plante ?$$, 'solution', $$La lithosphère.$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : un échange réciproque entre la plante et son environnement$$,
        'body', $$La plante ne produit de la matière organique que dans certaines conditions précises : présence de chlorophylle, de lumière et de dioxyde de carbone, ces deux dernières ressources étant fournies par les grands ensembles environnementaux. En retour, l'activité photosynthétique des végétaux verts purifie l'atmosphère du dioxyde de carbone et l'enrichit en dioxygène. La plante joue ainsi un double rôle : elle dépend des grands ensembles environnementaux pour produire sa matière organique, et elle sert de base au réseau trophique en fournissant cette matière organique aux autres êtres vivants.$$,
        'highlights', array[$$réseau trophique$$, $$échange réciproque$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi la photosynthèse profite-t-elle à l'atmosphère ?$$, 'solution', $$Elle la débarrasse du dioxyde de carbone et l'enrichit en dioxygène.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$De retour de leur sortie dans le jardin de l'école, les élèves veulent expliquer à un camarade absent comment les tubercules de manioc qu'ils ont déterrés ont pu se former, en s'appuyant sur le rôle des feuilles vertes et des grands ensembles environnementaux.$$,
      'questions', array[
        $$Explique quel pigment capte la lumière dans les feuilles vertes et pourquoi il est indispensable à la formation des tubercules.$$,
        $$Nomme les deux substances absorbées par la feuille qui se combinent pour former le glucide lors de la photosynthèse.$$,
        $$Explique comment la matière organique produite dans les feuilles peut se retrouver stockée dans les tubercules de manioc.$$,
        $$Cite les rôles joués par l'atmosphère, la lithosphère et l'hydrosphère dans la production de cette matière organique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel pigment vert, présent dans les feuilles, capte l'énergie lumineuse nécessaire à la photosynthèse ?$$,
      'hint', $$On le trouve dans les chloroplastes des cellules chlorophylliennes.$$,
      'expected', $$La chlorophylle.$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation globale de la photosynthèse.$$,
      'hint', $$Elle fait intervenir le dioxyde de carbone, l'eau, la lumière, le glucose et le dioxygène.$$,
      'expected', $$6 CO2 + 6 H2O, en présence de chlorophylle et de lumière, donnent C6H12O6 (glucose) + 6 O2.$$
    ),
    jsonb_build_object(
      'question', $$Quel grand ensemble environnemental fournit les sels minéraux utilisés par la plante ?$$,
      'hint', $$C'est la partie solide de la Terre, composée de roches et de sols.$$,
      'expected', $$La lithosphère.$$
    ),
    jsonb_build_object(
      'question', $$Dans quels organes la plante stocke-t-elle la matière organique qu'elle n'utilise pas immédiatement ?$$,
      'hint', $$Le manioc en est un exemple bien connu.$$,
      'expected', $$Dans des organes de réserve, comme les fruits et les tubercules.$$
    )
  ),
  now()
);
