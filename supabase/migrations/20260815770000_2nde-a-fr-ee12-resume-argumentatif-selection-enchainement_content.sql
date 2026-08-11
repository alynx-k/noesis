-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3243: "EE 12: Résumé_Texte_Argu_Sélection_IE_Enchai_logique"
-- (https://lyc.ecole-ci.org/course/view.php?id=3243)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Résumé_Texte_Argu_S3_Sélection_IE_Enchai_logique.pdf" (3 pages,
-- séance 3 : sélectionner les idées essentielles et établir un
-- enchaînement logique). Textes support : Stella et Joël de Rosnay,
-- "Savoir s'alimenter" ; Venance Konan, "La Côte d'Ivoire un beau pays !" ;
-- Francis Bebey, avant-propos de la revue Recherche Pédagogie et Culture,
-- n°29-30, 1977 (citations publiques déjà présentes dans les intitulés,
-- non développées ici).
-- Rewritten/paraphrased from the source PDF: the "RETENONS" rule listing
-- what to strip out of each paragraph to isolate its essential idea, and
-- the practice of linking the selected ideas with logical connectors,
-- illustrated with the source's own worked example (idea-by-idea
-- selection and chaining). 100% original wording; no sentence copied from
-- the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee12-resume-argumentatif-selection-enchainement',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le résumé du texte argumentatif — sélectionner les idées et les enchaîner logiquement$$,
  28,
  '2nde-a-fr-ee11-resume-argumentatif-situation-argumentation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir identifié la structure du texte en séquences, les élèves de seconde A doivent apprendre à extraire, dans chaque paragraphe, l'idée essentielle qu'il porte, puis à relier entre elles les idées ainsi sélectionnées par des connecteurs logiques, en vue de préparer la rédaction du résumé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Sélectionner l'idée essentielle d'un paragraphe$$,
        'body', $$Pour dégager l'idée essentielle d'un paragraphe, il faut en retirer tout ce qui n'est pas indispensable à la compréhension de l'argument : les exemples qui illustrent, les commentaires personnels, les informations placées entre parenthèses, les répétitions et les insistances, les citations, ainsi que les développements secondaires.$$,
        'highlights', array[$$idée essentielle$$, $$exemples illustratifs$$, $$répétitions$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$À supprimer$$, $$Raison$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Exemples illustratifs$$, $$Ils ne font qu'illustrer une idée déjà énoncée$$),
            jsonb_build_array($$Commentaires et insistances$$, $$Ils n'ajoutent pas d'information nouvelle$$),
            jsonb_build_array($$Informations entre parenthèses$$, $$Elles sont secondaires par rapport à l'idée principale$$),
            jsonb_build_array($$Citations et expansions$$, $$Elles développent l'idée sans la modifier$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Que faut-il retirer d'un paragraphe pour en dégager l'idée essentielle ?$$, 'solution', $$Les exemples illustratifs, les commentaires, les informations entre parenthèses, les répétitions, les citations et les expansions.$$)
      ),
      jsonb_build_object(
        'heading', $$Une idée par paragraphe ou groupe de paragraphes$$,
        'body', $$Chaque paragraphe, ou chaque groupe de paragraphes formant une séquence, doit être réduit à une seule idée essentielle formulée en une phrase courte. Un texte de plusieurs paragraphes donne ainsi une liste ordonnée d'idées essentielles, numérotées dans l'ordre du texte.$$,
        'highlights', array[$$une idée par paragraphe$$, $$liste ordonnée$$]::text[],
        'example', jsonb_build_object('statement', $$Si un paragraphe affirme, avec de nombreux exemples médicaux, qu'une mauvaise alimentation cause des maladies, quelle est son idée essentielle ?$$, 'solution', $$Il existe une relation entre les mauvaises habitudes alimentaires et les maladies du monde moderne.$$),
        'fixation', jsonb_build_object('question', $$Combien d'idées essentielles retient-on, en principe, par paragraphe ou séquence ?$$, 'solution', $$Une seule idée essentielle par paragraphe ou groupe de paragraphes.$$)
      ),
      jsonb_build_object(
        'heading', $$Enchaîner logiquement les idées sélectionnées$$,
        'body', $$Une fois les idées essentielles sélectionnées, il faut les relier entre elles par des connecteurs logiques (comme « et pourtant », « cependant », « c'est pourquoi ») qui traduisent le lien de sens entre elles : opposition, conséquence, cause, etc. Cet enchaînement doit respecter l'ordre dans lequel les idées apparaissent dans le texte.$$,
        'highlights', array[$$connecteurs logiques$$, $$enchaînement$$]::text[],
        'example', jsonb_build_object('statement', $$Quel connecteur logique peut relier l'idée que le monde souffre de malnutrition à l'idée que, pourtant, on s'intéresse peu à la question ?$$, 'solution', $$Un connecteur d'opposition comme « et pourtant ».$$),
        'fixation', jsonb_build_object('question', $$Que traduisent les connecteurs logiques utilisés pour enchaîner les idées essentielles ?$$, 'solution', $$Le lien de sens qui unit les idées entre elles, comme l'opposition, la cause ou la conséquence.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte comprend quatre paragraphes : le premier décrit longuement, exemples à l'appui, la pollution plastique des océans ; le deuxième affirme que malgré cela, peu de pays agissent réellement ; le troisième cite des associations qui proposent des solutions ; le quatrième conclut qu'il est urgent de changer les comportements individuels.$$,
      'questions', array[
        $$Formule l'idée essentielle du premier paragraphe, débarrassée de ses exemples.$$,
        $$Formule l'idée essentielle du deuxième paragraphe.$$,
        $$Relie ces deux idées par un connecteur logique adapté.$$,
        $$Formule et enchaîne les idées essentielles des paragraphes 3 et 4 à la suite des précédentes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que faut-il retirer d'un paragraphe pour en dégager l'idée essentielle ?$$,
      'hint', $$Tout ce qui illustre ou répète sans ajouter de sens.$$,
      'expected', $$Les exemples illustratifs, les commentaires, les informations entre parenthèses, les répétitions et les citations.$$
    ),
    jsonb_build_object(
      'question', $$Combien d'idées essentielles retient-on par paragraphe ou séquence ?$$,
      'hint', $$Un nombre précis.$$,
      'expected', $$Une seule idée essentielle par paragraphe ou groupe de paragraphes.$$
    ),
    jsonb_build_object(
      'question', $$À quoi servent les connecteurs logiques dans l'enchaînement des idées essentielles ?$$,
      'hint', $$Ils indiquent une relation de sens.$$,
      'expected', $$Ils traduisent le lien de sens qui unit les idées, comme l'opposition, la cause ou la conséquence.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel ordre doit-on enchaîner les idées essentielles sélectionnées ?$$,
      'hint', $$Celui du texte d'origine.$$,
      'expected', $$Dans l'ordre où elles apparaissent dans le texte.$$
    )
  ),
  now()
);
