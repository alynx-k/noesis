-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806650000_fr_coordination_content.sql). ecole-ci.org is
-- reachable now (see 20260812000000_fr-4e-debat_content.sql) — opened
-- Français 4ème > Grammaire > "Leçon 4: S1 Grammaire_Étude de quelques
-- propositions subordonnées_La proposition subordonnée relative" (course
-- id 744): "Activités : 0", no résumé/exercise uploaded. Falling back to
-- original content, from the lesson title/topic and the standard Ivorian
-- 4ème Français programme (compétence grammaire — l'étude de quelques
-- propositions subordonnées).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans ta rédaction sur les changements de ton village, ton professeur souligne des phrases trop courtes et te demande de les relier avec des propositions subordonnées pour exprimer les causes et les conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La proposition subordonnée relative$$,
        'body', $$La proposition subordonnée relative complète un nom ou un pronom (son antécédent) et est introduite par un pronom relatif (qui, que, dont, où, lequel...).$$,
        'highlights', array[$$l'antécédent$$, $$le pronom relatif$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La proposition subordonnée relative apporte une information sur son antécédent et est introduite par un pronom relatif dont le choix dépend de sa fonction dans la relative (sujet : qui ; COD : que ; complément introduit par « de » : dont ; lieu ou temps : où).$$),
        'example', jsonb_build_object('statement', $$Relie ces deux phrases avec une relative : « Le fleuve traverse le village. Le fleuve déborde chaque année. »$$, 'solution', $$Le fleuve qui traverse le village déborde chaque année.$$),
        'fixation', jsonb_build_object('question', $$Relie ces deux phrases avec une relative : « Voici la maison. Mon grand-père est né dans cette maison. »$$, 'solution', $$Voici la maison où mon grand-père est né.$$)
      ),
      jsonb_build_object(
        'heading', $$La proposition subordonnée conjonctive complétive$$,
        'body', $$Introduite par « que », la complétive complète un verbe (je pense que, je crains que) en fonction de complément d'objet.$$,
        'highlights', array[$$la complétive$$, $$que$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La proposition subordonnée complétive, introduite par « que », occupe généralement la fonction de complément d'objet direct du verbe principal (je constate que le village a changé) et se met au subjonctif après un verbe exprimant un souhait, un doute ou une crainte.$$),
        'example', jsonb_build_object('statement', $$Construis une phrase avec une complétive après le verbe « espérer ».$$, 'solution', $$J'espère que le village retrouvera bientôt son calme.$$),
        'fixation', jsonb_build_object('question', $$Construis une phrase avec une complétive au subjonctif après le verbe « craindre ».$$, 'solution', $$Je crains que la rivière ne déborde cette année.$$)
      ),
      jsonb_build_object(
        'heading', $$Les propositions subordonnées circonstancielles de cause et de conséquence$$,
        'body', $$Certaines propositions subordonnées précisent la cause ou la conséquence d'un fait exprimé dans la proposition principale.$$,
        'highlights', array[$$la cause$$, $$la conséquence$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type$$, $$Connecteurs$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cause$$, $$parce que, puisque, comme, étant donné que$$, $$Le pont s'est effondré parce que les pluies ont été violentes.$$),
            jsonb_build_array($$Conséquence$$, $$si bien que, de sorte que, si... que, tellement... que$$, $$Les pluies ont été si violentes que le pont s'est effondré.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La subordonnée de cause répond à « pourquoi ? » (parce que, puisque, comme), tandis que la subordonnée de conséquence exprime le résultat d'un fait (si bien que, de sorte que, si... que).$$),
        'example', jsonb_build_object('statement', $$Transforme en une phrase avec une subordonnée de conséquence : « Il a beaucoup plu. Le fleuve a débordé. »$$, 'solution', $$Il a tellement plu que le fleuve a débordé.$$),
        'fixation', jsonb_build_object('question', $$Transforme en une phrase avec une subordonnée de cause : « Les récoltes ont été bonnes. Il a plu régulièrement. »$$, 'solution', $$Les récoltes ont été bonnes parce qu'il a plu régulièrement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu améliores ta rédaction sur les changements de ton village en reliant des phrases courtes par des propositions subordonnées variées.$$,
      'questions', array[
        $$Relie deux phrases de ton texte avec une proposition subordonnée relative.$$,
        $$Construis une phrase avec une complétive après un verbe d'opinion ou de sentiment.$$,
        $$Construis une phrase avec une subordonnée de cause et une autre de conséquence.$$,
        $$Explique la différence entre une subordonnée de cause et une subordonnée de conséquence.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Relie ces deux phrases avec une relative : « Le vieux pont est fermé. Ce pont reliait les deux quartiers du village. »$$,
      'hint', $$Le pronom relatif reprend un COD.$$,
      'expected', $$Le vieux pont, que le village utilisait pour relier les deux quartiers, est fermé.$$
    ),
    jsonb_build_object(
      'question', $$Construis une phrase avec une complétive après le verbe « souhaiter ».$$,
      'hint', $$« que » + subjonctif.$$,
      'expected', $$Je souhaite que la route soit bientôt réparée.$$
    ),
    jsonb_build_object(
      'question', $$Transforme avec une subordonnée de cause : « La récolte a été mauvaise. La sécheresse a duré trois mois. »$$,
      'hint', $$Utilise « parce que » ou « puisque ».$$,
      'expected', $$La récolte a été mauvaise parce que la sécheresse a duré trois mois.$$
    ),
    jsonb_build_object(
      'question', $$Transforme avec une subordonnée de conséquence : « Le vent a soufflé très fort. Le toit de l'école s'est envolé. »$$,
      'hint', $$Utilise « si bien que » ou « si... que ».$$,
      'expected', $$Le vent a soufflé si fort que le toit de l'école s'est envolé.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-propositions-subordonnees';
