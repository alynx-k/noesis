-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3205: "PL4: La sémantique 1"
-- (https://lyc.ecole-ci.org/course/view.php?id=3205)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "4 PL 2nde La sémantique 1.pdf" (2 pages, Leçon 3 : la sémantique,
-- séance 1 : étudier les mots et leurs significations).
-- Rewritten/paraphrased from the source PDF: the definition of semantics,
-- monosemy vs polysemy, literal vs figurative meaning, and denotation vs
-- connotation, each illustrated with the source's own example words
-- (encéphalogramme, kilomètre, carburateur, chemin, table ronde, mouton).
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl4-semantique',
  '2nde',
  'A',
  'francais',
  $$La sémantique : étudier les mots et leurs significations$$,
  4,
  '2nde-a-fr-pl3-connecteurs-logiques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En lisant des textes variés, les élèves de seconde A remarquent qu'un même mot peut changer de sens selon la phrase dans laquelle il apparaît, ce qui leur pose parfois des difficultés de compréhension. Pour surmonter cet obstacle, ils s'exercent à dégager les différents sens des mots, à en analyser la valeur et à les utiliser correctement en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la sémantique ?$$,
        'body', $$La sémantique est l'étude qui s'intéresse au sens des mots. C'est la science qui permet d'étudier les mots à travers leurs significations et leurs créations, c'est-à-dire la manière dont un mot acquiert un ou plusieurs sens au fil de son usage.$$,
        'highlights', array[$$sémantique$$, $$sens des mots$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie le terme « sémantique » ?$$, 'solution', $$C'est l'étude qui s'intéresse au sens des mots, à leurs significations et à leurs créations.$$)
      ),
      jsonb_build_object(
        'heading', $$Monosémie et polysémie$$,
        'body', $$Un mot est dit monosémique lorsqu'il n'a qu'une seule signification : c'est le cas de mots appartenant généralement au vocabulaire scientifique ou technique, comme « encéphalogramme », « kilomètre » ou « carburateur ». À l'inverse, un mot est dit polysémique lorsqu'il possède plusieurs sens différents selon le contexte dans lequel il est employé.$$,
        'highlights', array[$$monosémie$$, $$polysémie$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Notion$$, $$Définition$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Monosémie$$, $$Le mot n'a qu'un seul sens$$, $$encéphalogramme, kilomètre, carburateur$$),
            jsonb_build_array($$Polysémie$$, $$Le mot a plusieurs sens selon le contexte$$, $$« feuille » : feuille d'un arbre ou feuille de papier$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Le mot « carburateur » a-t-il un ou plusieurs sens ?$$, 'solution', $$Il n'a qu'un seul sens : c'est un mot monosémique, propre au vocabulaire technique.$$),
        'fixation', jsonb_build_object('question', $$À quel type de vocabulaire appartiennent le plus souvent les mots monosémiques ?$$, 'solution', $$Au vocabulaire scientifique ou technique.$$)
      ),
      jsonb_build_object(
        'heading', $$Sens propre et sens figuré$$,
        'body', $$Le sens propre d'un mot est son sens premier, concret et habituel : ainsi, le mot « chemin » désigne d'abord une voie, une route. Le sens figuré, lui, est un sens imagé du mot, souvent créé par une métaphore : on parle par exemple du « chemin du bonheur » pour désigner la période heureuse d'une vie, ou du « chemin de la vie » pour désigner les années passées sur terre.$$,
        'highlights', array[$$sens propre$$, $$sens figuré$$]::text[],
        'example', jsonb_build_object('statement', $$Dans l'expression « le chemin de la vie », le mot « chemin » est-il employé au sens propre ou au sens figuré ?$$, 'solution', $$Au sens figuré, car il désigne de façon imagée les années passées sur terre, et non une route concrète.$$),
        'fixation', jsonb_build_object('question', $$Quel est le sens propre du mot « chemin » ?$$, 'solution', $$Une voie, une route.$$)
      ),
      jsonb_build_object(
        'heading', $$Dénotation et connotation$$,
        'body', $$La dénotation, c'est faire correspondre un mot à une réalité donnée : c'est le sens propre, objectif, du mot, celui que l'on trouve dans le dictionnaire (une « table ronde » désigne un objet, un meuble ; un « mouton » désigne un animal). La connotation, elle, c'est le sens que prend le mot selon le contexte dans lequel il est employé, un sens subjectif souvent chargé d'une valeur affective ou sociale : ainsi, un « mouton » peut désigner, par connotation, une personne insouciante ou influençable, et une « table ronde » peut désigner une réunion de discussion plutôt qu'un simple meuble.$$,
        'highlights', array[$$dénotation$$, $$connotation$$]::text[],
        'example', jsonb_build_object('statement', $$Quand on dit d'un migrant imprudent qu'il se comporte « comme un mouton », le mot « mouton » est-il utilisé par dénotation ou par connotation ?$$, 'solution', $$Par connotation : il ne désigne plus l'animal, mais évoque, selon le contexte, l'insouciance ou le manque de discernement.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence essentielle entre dénotation et connotation ?$$, 'solution', $$La dénotation est le sens objectif et stable d'un mot (celui du dictionnaire), tandis que la connotation est le sens subjectif qu'il prend selon le contexte.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une réunion organisée à la sous-préfecture pour discuter de l'émigration irrégulière des jeunes, un intervenant déclare : « Beaucoup de nos jeunes suivent le troupeau sans réfléchir, comme des moutons, au lieu de choisir leur propre chemin. »$$,
      'questions', array[
        $$Explique le sens propre et le sens figuré du mot « chemin » dans cette phrase.$$,
        $$Le mot « moutons » est-il ici employé par dénotation ou par connotation ? Justifie ta réponse.$$,
        $$Le mot « chemin » est-il monosémique ou polysémique ? Justifie.$$,
        $$Propose une phrase où le mot « mouton » serait employé par simple dénotation.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un mot monosémique ?$$,
      'hint', $$Pense au nombre de sens qu'il possède.$$,
      'expected', $$Un mot qui n'a qu'une seule signification.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de mot polysémique.$$,
      'hint', $$Un mot qui change de sens selon le contexte, comme « feuille ».$$,
      'expected', $$Par exemple « feuille » (feuille d'arbre ou feuille de papier) ou « chemin ».$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre le sens propre et le sens figuré d'un mot ?$$,
      'hint', $$L'un est concret, l'autre est imagé.$$,
      'expected', $$Le sens propre est le sens premier et concret du mot, le sens figuré est un sens imagé, souvent créé par une métaphore.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la connotation d'un mot ?$$,
      'hint', $$Elle dépend du contexte, contrairement à la dénotation.$$,
      'expected', $$C'est le sens subjectif que prend un mot selon le contexte dans lequel il est employé.$$
    )
  ),
  now()
);
