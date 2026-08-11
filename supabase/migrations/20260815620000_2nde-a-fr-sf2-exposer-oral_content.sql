-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3743: "SF 2: Apprendre à présenter un exposé oral 1 et 2"
-- (https://lyc.ecole-ci.org/course/view.php?id=3743)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "15 et 16 SF apprendre à présenter un exposé oral 1 et 2.pdf" (2 pages,
-- Leçon 2 (savoir-faire) : les techniques de communication, séance 1 :
-- préparer un exposé / présenter un exposé oral).
-- Rewritten/paraphrased from the source PDF: the definition of an exposé,
-- its preparation steps (documentation, plan, répartition des tâches en
-- équipe), the three-part plan (introduction, développement, conclusion),
-- the rules for a successful oral presentation, and the source's own
-- worked exercise on "les formes de la tricherie en milieu scolaire".
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-sf2-exposer-oral',
  '2nde',
  'A',
  'francais',
  $$Savoir-faire : préparer et présenter un exposé oral$$,
  13,
  '2nde-a-fr-sf1-prise-de-notes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors du lancement des activités du club littéraire, les élèves de la classe de seconde A ont assisté à l'intervention du président du club. Séduits par la cohérence de sa présentation et par son éloquence, ils décident d'acquérir les techniques d'élaboration et de présentation d'un exposé oral. Ils s'organisent pour rechercher la documentation nécessaire en bibliothèque, sur internet et auprès de personnes ressources, élaborer le plan de leur exposé, rédiger en équipe l'essentiel à retenir, répartir les différentes parties à chaque exposant, s'exercer à présenter oralement un exposé en public et appliquer les techniques de communication orale.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un exposé ?$$,
        'body', $$Un exposé est un exercice oral ou écrit qui consiste à présenter, de façon ordonnée et développée, des informations sur un sujet donné.$$,
        'highlights', array[$$exposé$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment définit-on un exposé ?$$, 'solution', $$Un exercice oral ou écrit qui consiste à présenter de façon ordonnée et développée des informations sur un sujet donné.$$)
      ),
      jsonb_build_object(
        'heading', $$Préparer un exposé$$,
        'body', $$La préparation d'un exposé, souvent réalisée en équipe, comprend plusieurs étapes : rechercher la documentation nécessaire (en bibliothèque, sur internet, auprès de personnes ressources), élaborer le plan de l'exposé, rédiger collectivement l'essentiel des informations à retenir, puis répartir les différentes parties du plan entre les membres de l'équipe, chacun devenant responsable d'une partie qu'il présentera.$$,
        'highlights', array[$$préparation$$, $$documentation$$, $$plan$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les principales étapes de la préparation d'un exposé en équipe ?$$, 'solution', $$Rechercher la documentation, élaborer le plan, rédiger l'essentiel, puis répartir les parties entre les membres de l'équipe.$$)
      ),
      jsonb_build_object(
        'heading', $$Le plan de l'exposé$$,
        'body', $$Un exposé s'organise généralement en trois grandes parties. L'introduction présente le sujet et annonce le plan qui sera suivi. Le développement présente, de façon organisée, les informations, les arguments ou les résultats de l'étude. La conclusion, enfin, fait le bilan de l'étude et sert à présenter l'intérêt de cette étude.$$,
        'highlights', array[$$introduction$$, $$développement$$, $$conclusion$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Partie$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Introduction$$, $$Présente le sujet et annonce le plan$$),
            jsonb_build_array($$Développement$$, $$Présente les informations et les arguments$$),
            jsonb_build_array($$Conclusion$$, $$Fait le bilan et présente l'intérêt de l'étude$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Que doit faire la conclusion d'un exposé ?$$, 'solution', $$Faire le bilan de l'étude et présenter l'intérêt de cette étude.$$)
      ),
      jsonb_build_object(
        'heading', $$Réussir la présentation orale$$,
        'body', $$Pour réussir la présentation d'un exposé, il faut être présentable et bien vêtu, bien articuler les mots et avoir une bonne diction, être courtois envers ceux qui demandent la parole (par exemple pour poser une question), et respecter le temps imparti.$$,
        'highlights', array[$$diction$$, $$courtoisie$$, $$temps imparti$$]::text[],
        'example', jsonb_build_object('statement', $$Un exposant dépasse largement le temps qui lui était accordé. Quelle règle de la présentation orale n'a-t-il pas respectée ?$$, 'solution', $$Il n'a pas respecté le temps imparti.$$),
        'fixation', jsonb_build_object('question', $$Cite deux règles à respecter pour réussir la présentation orale d'un exposé.$$, 'solution', $$Par exemple bien articuler et avoir une bonne diction, et respecter le temps imparti.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une équipe d'élèves doit préparer un exposé sur le sujet suivant : « les formes de la tricherie en milieu scolaire ». Un premier argument déjà trouvé par l'équipe explique que certains élèves préfèrent la facilité au travail et privilégient les jeux et le divertissement par rapport aux études, ce qui les pousse à tricher plutôt qu'à réviser.$$,
      'questions', array[
        $$Propose un second argument sur les formes de la tricherie en milieu scolaire, en t'appuyant par exemple sur l'usage du téléphone portable.$$,
        $$Rédige une courte introduction pour cet exposé, en présentant le sujet et en annonçant le plan.$$,
        $$Que devrait contenir la conclusion de cet exposé ?$$,
        $$Cite deux règles à respecter par les élèves qui présenteront cet exposé à l'oral.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un exposé ?$$,
      'hint', $$Il présente des informations sur un sujet.$$,
      'expected', $$Un exercice oral ou écrit qui consiste à présenter de façon ordonnée et développée des informations sur un sujet donné.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois grandes parties du plan d'un exposé ?$$,
      'hint', $$Comme pour une dissertation.$$,
      'expected', $$L'introduction, le développement et la conclusion.$$
    ),
    jsonb_build_object(
      'question', $$Où peut-on rechercher la documentation nécessaire à un exposé ?$$,
      'hint', $$Plusieurs sources sont possibles.$$,
      'expected', $$En bibliothèque, sur internet, ou auprès de personnes ressources.$$
    ),
    jsonb_build_object(
      'question', $$Cite une règle à respecter pour bien présenter un exposé à l'oral.$$,
      'hint', $$Pense à la diction ou au temps.$$,
      'expected', $$Par exemple bien articuler et avoir une bonne diction, ou respecter le temps imparti.$$
    )
  ),
  now()
);
