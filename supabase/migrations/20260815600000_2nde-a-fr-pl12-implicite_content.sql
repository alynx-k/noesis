-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3227: "PL12: L'implicite"
-- (https://lyc.ecole-ci.org/course/view.php?id=3227)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "12 PL 2nde l'implicite.pdf" (3 pages, Leçon 6 : l'implicite, séance :
-- l'implicite, le présupposé et le sous-entendu).
-- Rewritten/paraphrased from the source PDF: the definition of implicit
-- meaning, and the distinction between "présupposé" (non-contestable,
-- carried by the words/structure themselves) and "sous-entendu"
-- (contestable, depending on context), illustrated with the source's own
-- example sentences (classe calme, devoir oublié, ponctualité inhabituelle,
-- devoir repris). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl12-implicite',
  '2nde',
  'A',
  'francais',
  $$L'implicite : le présupposé et le sous-entendu$$,
  11,
  '2nde-a-fr-pl11-versification-sonorites',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'occasion d'une journée de sensibilisation, les organisateurs remettent aux élèves une brochure contenant une série de textes. En la lisant, les élèves de seconde sont émerveillés par la subtilité du message véhiculé, qui ne dit pas tout directement. Ils décident d'en savoir plus sur ce non-dit et s'exercent, à partir d'un corpus de phrases, à dégager les présupposés et les sous-entendus, à en analyser la valeur et à les utiliser en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un message implicite ?$$,
        'body', $$On dit d'un message qu'il est implicite quand il est voilé : il ne se laisse pas saisir automatiquement, à la simple lecture littérale des mots. Contrairement au message explicite, clairement énoncé, le message implicite doit être déduit, reconstruit par celui qui reçoit l'énoncé, à partir d'indices présents dans les mots eux-mêmes ou dans la situation de communication.$$,
        'highlights', array[$$implicite$$, $$explicite$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue un message implicite d'un message explicite ?$$, 'solution', $$Le message explicite est clairement énoncé, tandis que le message implicite doit être déduit par le destinataire à partir d'indices.$$)
      ),
      jsonb_build_object(
        'heading', $$Le présupposé$$,
        'body', $$Le présupposé est un contenu implicite porté par les mots ou la structure même de la phrase : il est automatiquement compris dès que l'énoncé est prononcé, et il ne souffre d'aucune contestation possible. Ainsi, la phrase « J'ai repris mon devoir » présuppose de façon certaine qu'un devoir avait déjà été fait auparavant : ce fait n'est pas discutable, il découle directement du verbe « reprendre ».$$,
        'highlights', array[$$présupposé$$]::text[],
        'example', jsonb_build_object('statement', $$Que présuppose la phrase « Comment encourager les élèves à la lecture ? »$$, 'solution', $$Elle présuppose, de façon certaine et non contestable, qu'il faut encourager les élèves à la lecture.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que le présupposé ne souffre d'aucune contestation possible ?$$, 'solution', $$Parce qu'il est directement porté par les mots ou la structure de la phrase, indépendamment du contexte.$$)
      ),
      jsonb_build_object(
        'heading', $$Le sous-entendu$$,
        'body', $$Le sous-entendu, lui, est un contenu implicite qui dépend du contexte ou de la situation de communication : contrairement au présupposé, il peut être contesté ou discuté, car il n'est pas automatiquement porté par les mots eux-mêmes. Ainsi, dire à quelqu'un « Vous êtes ponctuels aujourd'hui ! » peut sous-entendre « vous traînez le pas d'habitude », mais cette interprétation reste discutable : elle dépend de ce que l'on sait des habitudes de la personne.$$,
        'highlights', array[$$sous-entendu$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Énoncé$$, $$Type de contenu implicite$$, $$Ce qui est visé$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$« Il a oublié son devoir. »$$, $$Sous-entendu$$, $$Suggère, selon le contexte, une négligence discutable$$),
            jsonb_build_array($$« Les jeunes se réveillent ! »$$, $$Présupposé$$, $$Implique, de façon certaine, qu'ils dormaient auparavant$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dire d'une salle de classe « Cette classe est calme à présent » peut sous-entendre quoi ?$$, 'solution', $$Cela peut sous-entendre qu'elle ne bavarde plus, ou qu'elle a arrêté de bavarder, une interprétation qui dépend du contexte et reste discutable.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence essentielle entre présupposé et sous-entendu ?$$, 'solution', $$Le présupposé est certain et non contestable car porté par les mots eux-mêmes, tandis que le sous-entendu dépend du contexte et peut être contesté ou discuté.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une réunion de classe, le professeur principal déclare : « Certains élèves sont enfin arrivés à l'heure aujourd'hui. » Un délégué de classe ajoute : « J'ai encore corrigé mon exposé avant de le présenter. »$$,
      'questions', array[
        $$Relève dans la phrase du professeur un contenu sous-entendu et explique pourquoi il est discutable.$$,
        $$Relève dans la phrase du délégué un contenu présupposé et explique pourquoi il n'est pas contestable.$$,
        $$Construis une phrase contenant un présupposé sur la vie scolaire.$$,
        $$Construis une phrase contenant un sous-entendu sur la vie scolaire.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un présupposé ?$$,
      'hint', $$Il est porté par les mots eux-mêmes.$$,
      'expected', $$Un contenu implicite porté par les mots ou la structure de la phrase, non contestable.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un sous-entendu ?$$,
      'hint', $$Il dépend du contexte.$$,
      'expected', $$Un contenu implicite qui dépend du contexte et qui peut être contesté ou discuté.$$
    ),
    jsonb_build_object(
      'question', $$Que présuppose la phrase « J'ai repris mon devoir » ?$$,
      'hint', $$Le verbe « reprendre » implique une action antérieure.$$,
      'expected', $$Qu'un devoir avait déjà été fait auparavant.$$
    ),
    jsonb_build_object(
      'question', $$Peut-on contester un présupposé aussi facilement qu'un sous-entendu ?$$,
      'hint', $$L'un dépend du contexte, l'autre non.$$,
      'expected', $$Non : le présupposé n'est pas contestable, alors que le sous-entendu, qui dépend du contexte, peut l'être.$$
    )
  ),
  now()
);
