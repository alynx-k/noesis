-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=163 ("Etude de l'œuvre intégrale").
-- Moodle course id 3740: "EOI 2: Roman_LM_1"
-- (https://lyc.ecole-ci.org/course/view.php?id=3740)
-- Resource "Je lis le résumé de la leçon", mod_resource id 38054,
-- redirecting to pluginfile "2nde_EOI_Roman_LM_1.pdf" (2 pages): étude de
-- l'œuvre intégrale "Petit Bodiel" d'Amadou Hampâté Bâ (éd. NEI, 1993),
-- séance de lecture méthodique n°1, sur l'extrait pp. 13-16 mettant en
-- scène une violente altercation entre Petit Bodiel et sa mère, étudié
-- selon deux axes de lecture : les types/formes de phrases traduisant la
-- déception de la mère, et le portrait péjoratif de Petit Bodiel.
-- Rewritten/paraphrased from the source PDF: the définition of the
-- lecture méthodique's two reading axes and what each grammatical/lexical
-- device reveals, without reproducing the novel's actual dialogue lines.
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-eoi2-petit-bodiel-lecture-methodique',
  '2nde',
  'A',
  'francais',
  $$Étude de l'œuvre intégrale : « Petit Bodiel » — la lecture méthodique$$,
  16,
  '2nde-a-fr-eoi1-petit-bodiel-lecture-dirigee',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Poursuivant l'étude de l'œuvre « Petit Bodiel » d'Amadou Hampâté Bâ, en vue du Festival du Livre et des Arts du Denguélé, les élèves de seconde A abordent cette fois l'extrait des pages 13 à 16, qui met en scène une violente altercation entre Petit Bodiel et sa mère, avant que le jeune garçon ne parte en quête d'une transformation. Ils s'organisent pour étudier ce passage par une lecture méthodique, en dégageant deux axes de lecture complémentaires.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Situer l'extrait étudié$$,
        'body', $$Le texte étudié est extrait de l'œuvre « Petit Bodiel » d'Amadou Hampâté Bâ. Il est situé aux pages 13 à 16 et met en scène une violente altercation entre Petit Bodiel et sa mère. L'extrait sera étudié selon l'axe d'étude retenu pour l'ensemble de l'œuvre : le récit de l'initiation ratée du personnage principal.$$,
        'highlights', array[$$altercation$$, $$Petit Bodiel$$]::text[],
        'fixation', jsonb_build_object('question', $$Entre qui et qui se produit l'altercation racontée dans cet extrait ?$$, 'solution', $$Entre Petit Bodiel et sa mère.$$)
      ),
      jsonb_build_object(
        'heading', $$Premier axe de lecture : les types de phrases et la déception de la mère$$,
        'body', $$Le premier axe de lecture étudie les types de phrases employés par la mère de Petit Bodiel. Les phrases exclamatives expriment sa déception face au comportement de son fils. Les phrases interrogatives, elles, traduisent son doute : elle s'interroge sur les qualités réelles de son fils et le compare, de façon implicite, aux autres enfants de sa génération.$$,
        'highlights', array[$$phrases exclamatives$$, $$phrases interrogatives$$, $$déception$$]::text[],
        'example', jsonb_build_object('statement', $$Quel effet produit l'emploi d'une phrase interrogative par une mère mécontente du comportement de son enfant ?$$, 'solution', $$Elle traduit son doute et son inquiétude, en remettant en question les qualités réelles de l'enfant.$$),
        'fixation', jsonb_build_object('question', $$Que traduisent les phrases exclamatives prononcées par la mère de Petit Bodiel ?$$, 'solution', $$Sa déception face au comportement de son fils.$$)
      ),
      jsonb_build_object(
        'heading', $$Second axe de lecture : le portrait péjoratif de Petit Bodiel$$,
        'body', $$Le second axe de lecture étudie le portrait péjoratif dressé de Petit Bodiel à travers trois procédés. Le lexique d'abord : des verbes dépréciatifs (dormir, manger, digérer...) énumèrent les défauts du personnage, tandis que des mots à connotation négative (comme « vaurien ») renforcent ce portrait honteux, aux yeux de sa mère comme de toute la communauté. Les formes de phrases, ensuite : des phrases négatives (par exemple « tu ne fais rien de la journée ») mettent en évidence ce portrait déprécié et révèlent que le personnage est perçu comme un bon à rien.$$,
        'highlights', array[$$portrait péjoratif$$, $$verbes dépréciatifs$$, $$connotation négative$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Procédé$$, $$Ce qu'il révèle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Verbes dépréciatifs$$, $$Énumèrent les défauts quotidiens du personnage$$),
            jsonb_build_array($$Mots à connotation négative$$, $$Renforcent la honte associée au personnage$$),
            jsonb_build_array($$Phrases négatives$$, $$Révèlent l'image d'un « bon à rien »$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi l'auteur choisit-il d'énumérer plusieurs verbes dépréciatifs à la suite pour décrire Petit Bodiel ?$$, 'solution', $$Pour accumuler les défauts du personnage et renforcer l'effet du portrait péjoratif dressé par sa mère.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les trois procédés utilisés pour dresser le portrait péjoratif de Petit Bodiel ?$$, 'solution', $$Les verbes dépréciatifs, les mots à connotation négative, et les formes de phrases négatives.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit présenter à la classe une analyse de l'altercation entre Petit Bodiel et sa mère, en s'appuyant sur les deux axes de lecture étudiés.$$,
      'questions', array[
        $$Rappelle où se situe l'extrait étudié dans l'œuvre et ce qu'il raconte.$$,
        $$Explique ce que révèlent les phrases exclamatives et interrogatives prononcées par la mère.$$,
        $$Présente les trois procédés utilisés pour dresser le portrait péjoratif de Petit Bodiel.$$,
        $$Selon toi, pourquoi l'auteur choisit-il de commencer le récit par un portrait aussi négatif du personnage principal ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Où se situe, dans l'œuvre, l'extrait étudié en lecture méthodique ?$$,
      'hint', $$Entre les pages 13 et 16.$$,
      'expected', $$Aux pages 13 à 16 de « Petit Bodiel ».$$
    ),
    jsonb_build_object(
      'question', $$Que traduisent les phrases interrogatives de la mère de Petit Bodiel ?$$,
      'hint', $$Elle n'est pas sûre des qualités de son fils.$$,
      'expected', $$Son doute quant aux qualités réelles de son fils.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de procédé lexical utilisé pour dresser un portrait péjoratif.$$,
      'hint', $$Des mots qui portent un jugement négatif.$$,
      'expected', $$Des mots à connotation négative, ou des verbes dépréciatifs.$$
    ),
    jsonb_build_object(
      'question', $$Que révèlent les phrases négatives employées dans cet extrait ?$$,
      'hint', $$Elles renforcent une image très défavorable.$$,
      'expected', $$Elles révèlent l'image d'un personnage perçu comme un « bon à rien ».$$
    )
  ),
  now()
);
