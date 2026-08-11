-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3237: "EE 6: Production-écrite Organiser idées"
-- (https://lyc.ecole-ci.org/course/view.php?id=3237)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Prdtion-écrite_S8_Organiser_idées.pdf" (4 pages, séance 8 :
-- organiser l'argumentation, sur le même sujet que la séance précédente
-- (comportements exposant l'homme aux maladies), avec un second exemple de
-- sujet sur les limites de la tradition orale face à l'écrit).
-- Rewritten/paraphrased from the source PDF: the method of classifying
-- brainstormed ideas by affinity into "plans" (domaines) such as le plan
-- alimentaire or le plan intellectuel, each becoming a paragraph of the
-- développement, illustrated with the source's own worked groupings.
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee6-production-ecrite-organiser-idees',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : la production écrite — organiser les idées$$,
  23,
  '2nde-a-fr-ee5-production-ecrite-analyser-sujet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir recherché en vrac de nombreuses idées pour traiter leur sujet sur les comportements exposant l'homme aux maladies, les élèves de seconde A se retrouvent avec une liste désordonnée d'idées et d'exemples. Ils s'organisent pour apprendre à classer ces idées selon leurs affinités, afin de construire un plan cohérent pour leur développement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Classer les idées selon leurs affinités$$,
        'body', $$Une fois les idées recherchées en vrac, il s'agit de les classer selon leurs affinités, c'est-à-dire de regrouper ensemble les idées qui se rapportent à un même domaine ou à un même aspect du sujet. Chaque regroupement forme alors ce qu'on appelle un « plan » (par exemple le plan alimentaire, le plan environnemental, le plan intellectuel), qui deviendra une partie du développement.$$,
        'highlights', array[$$classer$$, $$affinités$$, $$plan$$]::text[],
        'fixation', jsonb_build_object('question', $$Que fait-on des idées trouvées en vrac lors de l'étape d'organisation ?$$, 'solution', $$On les classe selon leurs affinités, en regroupant celles qui se rapportent à un même domaine.$$)
      ),
      jsonb_build_object(
        'heading', $$Un exemple de regroupement : le plan alimentaire$$,
        'body', $$Pour le sujet sur les comportements qui exposent l'homme aux maladies, plusieurs idées peuvent être regroupées sous un même plan alimentaire : le fait de ne pas contrôler ce que l'on mange, une alimentation déséquilibrée, l'utilisation abusive de produits chimiques dans les mets, ou encore la prolifération d'aliments chimiques au détriment des aliments biologiques ou naturels. Chacune de ces idées peut être illustrée par un exemple précis.$$,
        'highlights', array[$$plan alimentaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Idée regroupée$$, $$Exemple associé$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nous ne contrôlons pas ce que nous mangeons$$, $$Manger trop gras, trop salé ou trop sucré, grignoter entre les repas$$),
            jsonb_build_array($$Une alimentation déséquilibrée$$, $$Absence prolongée de certains nutriments$$),
            jsonb_build_array($$Utilisation abusive de produits chimiques$$, $$Consommation excessive de bouillons et cubes d'assaisonnement$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi regrouper ces trois idées sous un même plan « alimentaire » plutôt que de les traiter séparément ?$$, 'solution', $$Parce qu'elles portent toutes sur la même dimension du sujet (l'alimentation), ce qui permet de construire un paragraphe cohérent plutôt que des remarques éparpillées.$$),
        'fixation', jsonb_build_object('question', $$Que devient, dans la rédaction finale, chaque plan constitué à cette étape ?$$, 'solution', $$Une partie (un paragraphe) du développement.$$)
      ),
      jsonb_build_object(
        'heading', $$Un autre exemple : le plan intellectuel$$,
        'body', $$Sur un sujet portant sur les limites de la tradition orale face à l'écrit, on peut par exemple regrouper sous un plan intellectuel l'idée que la transmission orale entraîne une perte d'information historique, la quantité et la diversité des savoirs ne pouvant être entièrement retenues et conservées par la seule mémoire humaine.$$,
        'highlights', array[$$plan intellectuel$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel type de perte le plan intellectuel met-il en avant concernant la tradition orale ?$$, 'solution', $$La perte d'information historique, car la mémoire humaine ne peut conserver la totalité des savoirs transmis oralement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève a trouvé en vrac les idées suivantes pour un sujet sur les dangers d'internet chez les jeunes : perte de temps sur les réseaux sociaux, exposition à des contenus violents, difficulté à se concentrer sur les études, addiction aux jeux en ligne, désinformation par de fausses nouvelles.$$,
      'questions', array[
        $$Propose deux plans (regroupements) pertinents pour organiser ces idées.$$,
        $$Classe chacune des cinq idées données sous l'un des deux plans proposés.$$,
        $$Pour l'une des idées, propose un exemple concret qui l'illustre.$$,
        $$Explique pourquoi il est utile de regrouper les idées en plans avant de rédiger.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie « classer les idées selon leurs affinités » ?$$,
      'hint', $$On regroupe ce qui se ressemble.$$,
      'expected', $$Regrouper ensemble les idées qui se rapportent à un même domaine ou aspect du sujet.$$
    ),
    jsonb_build_object(
      'question', $$À quoi correspond un « plan » dans cette méthode d'organisation ?$$,
      'hint', $$Un regroupement d'idées proches.$$,
      'expected', $$Un regroupement d'idées de même domaine, qui deviendra une partie du développement.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de plan pouvant regrouper des idées sur l'alimentation.$$,
      'hint', $$Un domaine lié à ce que l'on mange.$$,
      'expected', $$Le plan alimentaire.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi ne faut-il pas laisser les idées en vrac au moment de rédiger ?$$,
      'hint', $$Le développement doit être structuré.$$,
      'expected', $$Parce que le développement doit être organisé et cohérent, et non une suite d'idées éparpillées.$$
    )
  ),
  now()
);
