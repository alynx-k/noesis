-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806580000_fr_ecriture_article_journal_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql)
-- and "EXP. ECRITE: LE COMPTE RENDU DE RÉUNION" (course id 2244) is one of
-- only 3 populated Français 4ème courses with a "Je lis le résumé de la
-- leçon" resource — but that resource (mod/resource id=19178) resolves to
-- "3e_EDHC_C5_L12_protection_parcs_nationaux.pdf" (pluginfile/56286), an
-- unrelated EDHC 3ème document, not a Français text. The other two
-- populated Expression Écrite courses serve the exact same wrong PDF under
-- different pluginfile ids, so this is a site-side content-linking bug,
-- not a one-off. No usable grounding text was available. Falling back to
-- original content, from the lesson title/topic and the standard Ivorian
-- 4ème Français programme (compétence expression écrite — compte rendu de
-- réunion).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Tu es le secrétaire élu du club d'élèves de ton collège. Après la réunion sur l'organisation de la fête de fin d'année, tu dois rédiger le compte rendu à afficher sur le panneau d'information.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rôle et les principes du compte rendu$$,
        'body', $$Le compte rendu de réunion rapporte fidèlement et objectivement ce qui a été dit et décidé, sans ajouter d'opinion personnelle du rédacteur.$$,
        'highlights', array[$$objectif$$, $$fidèle$$, $$le secrétaire de séance$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un compte rendu doit être objectif (il rapporte les faits sans les commenter), fidèle (il respecte ce qui a réellement été dit) et rédigé le plus souvent à la troisième personne ou au passé composé/passé simple.$$),
        'example', jsonb_build_object('statement', $$Cette phrase est-elle correcte dans un compte rendu : « Je trouve que l'idée de Awa était excellente. » ?$$, 'solution', $$Non, car elle exprime une opinion personnelle du rédacteur. Il faudrait écrire objectivement : « Awa a proposé une idée qui a été approuvée par la majorité. »$$),
        'fixation', jsonb_build_object('question', $$Pourquoi un compte rendu ne doit-il pas contenir d'opinion personnelle du secrétaire ?$$, 'solution', $$Parce que son rôle est de rapporter fidèlement les échanges et décisions de la réunion, pas de donner son propre avis.$$)
      ),
      jsonb_build_object(
        'heading', $$La structure du compte rendu$$,
        'body', $$Un compte rendu de réunion suit toujours la même structure : un en-tête avec les informations pratiques, puis les points abordés, et enfin les décisions prises.$$,
        'highlights', array[$$l'en-tête$$, $$l'ordre du jour$$, $$une décision$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Partie$$, $$Contenu$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$En-tête$$, $$date, lieu, heure, participants, absents, ordre du jour$$),
            jsonb_build_array($$Déroulement$$, $$résumé des points discutés, dans l'ordre de l'ordre du jour$$),
            jsonb_build_array($$Décisions$$, $$liste claire des décisions prises et des responsables désignés$$),
            jsonb_build_array($$Clôture$$, $$heure de fin et date de la prochaine réunion si prévue$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'en-tête d'un compte rendu précise la date, le lieu, les participants et l'ordre du jour ; le corps résume les échanges point par point ; la fin liste les décisions prises et les responsables.$$),
        'example', jsonb_build_object('statement', $$Rédige un en-tête de compte rendu pour une réunion du club de lecture tenue le 12 mars à 15h en salle 4.$$, 'solution', $$Compte rendu de la réunion du club de lecture — 12 mars, 15h, salle 4. Présents : les membres du bureau. Ordre du jour : choix du prochain livre à étudier.$$),
        'fixation', jsonb_build_object('question', $$Que doit-on indiquer obligatoirement à la fin d'un compte rendu ?$$, 'solution', $$Les décisions prises pendant la réunion, avec si possible les responsables désignés pour les mettre en œuvre.$$)
      ),
      jsonb_build_object(
        'heading', $$Un registre de langue formel$$,
        'body', $$Le compte rendu emploie un registre soutenu ou courant, des phrases claires et un vocabulaire précis, en évitant les tournures familières.$$,
        'highlights', array[$$le registre formel$$, $$un verbe de décision$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le compte rendu utilise des verbes précis pour exprimer les décisions (le bureau a décidé de, il a été convenu que, les membres ont approuvé) et évite tout langage familier.$$),
        'example', jsonb_build_object('statement', $$Reformule dans un registre formel : « Tout le monde était d'accord pour faire la fête le 20. »$$, 'solution', $$Il a été convenu à l'unanimité d'organiser la fête le 20.$$),
        'fixation', jsonb_build_object('question', $$Reformule dans un registre formel : « Les élèves ont dit que c'était une bonne idée d'inviter les parents. »$$, 'solution', $$Les élèves ont approuvé la proposition d'inviter les parents à la manifestation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En tant que secrétaire du club d'élèves, rédige le compte rendu de la réunion sur l'organisation de la fête de fin d'année, tenue le 15 mai à 16h en salle des professeurs.$$,
      'questions', array[
        $$Rédige l'en-tête complet (date, lieu, participants, ordre du jour).$$,
        $$Résume en style objectif au moins deux points discutés pendant la réunion.$$,
        $$Liste au moins deux décisions prises, avec les responsables désignés.$$,
        $$Vérifie que ton compte rendu utilise un registre formel, sans opinion personnelle.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Corrige cette phrase pour la rendre objective dans un compte rendu : « Je pense que la proposition de Kader était la meilleure. »$$,
      'hint', $$Supprime l'opinion personnelle et rapporte simplement le fait.$$,
      'expected', $$La proposition de Kader a été retenue par les membres présents.$$
    ),
    jsonb_build_object(
      'question', $$Que doit contenir l'en-tête d'un compte rendu de réunion ? Cite trois éléments.$$,
      'hint', $$Pense aux informations pratiques nécessaires.$$,
      'expected', $$La date, le lieu et l'heure de la réunion, ainsi que la liste des participants et l'ordre du jour.$$
    ),
    jsonb_build_object(
      'question', $$Reformule dans un registre formel : « Tout le monde a dit oui pour changer la date de la sortie. »$$,
      'hint', $$Utilise « il a été convenu que » ou « les membres ont approuvé ».$$,
      'expected', $$Il a été convenu à l'unanimité de modifier la date de la sortie.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi doit-on toujours préciser un responsable pour chaque décision inscrite dans un compte rendu ?$$,
      'hint', $$Pense à l'utilité pratique du compte rendu après la réunion.$$,
      'expected', $$Pour que chacun sache clairement qui doit exécuter la décision, ce qui permet un suivi efficace après la réunion.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-compte-rendu-reunion';
