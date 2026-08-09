-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806570000_fr_resume_texte_argumentatif_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql)
-- and "EXP. ECRITE: LE RÉSUMÉ DU TEXTE INFORMATIF" (course id 2167) is one
-- of only 3 populated Français 4ème courses with a "Je lis le résumé de la
-- leçon" resource — but that resource (mod/resource id=18254) resolves to
-- "3e_EDHC_C5_L12_protection_parcs_nationaux.pdf" (pluginfile/55260), an
-- unrelated EDHC 3ème document, not a Français text. The other two
-- populated Expression Écrite courses serve the exact same wrong PDF under
-- different pluginfile ids, so this is a site-side content-linking bug,
-- not a one-off. No usable grounding text was available. Falling back to
-- original content, from the lesson title/topic and the standard Ivorian
-- 4ème Français programme (compétence expression écrite — résumé du texte
-- informatif).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur d'histoire-géographie te demande de résumer en dix lignes un long article informatif sur l'électrification des villages en Côte d'Ivoire, pour le présenter à la classe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Comprendre le texte informatif à résumer$$,
        'body', $$Un texte informatif transmet des faits, des chiffres et des données sur un sujet précis, en suivant en général l'ordre chronologique ou logique des informations.$$,
        'highlights', array[$$une information$$, $$une donnée chiffrée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Avant de résumer un texte informatif, il faut le lire plusieurs fois pour identifier le sujet général, les informations essentielles (qui, quoi, où, quand, pourquoi) et les données chiffrées importantes.$$),
        'example', jsonb_build_object('statement', $$Quelles questions te poser pour identifier les informations essentielles d'un article sur un projet d'électrification ?$$, 'solution', $$Qui a lancé le projet ? Quoi (que fait-il exactement) ? Où et quand ? Pourquoi (quel est l'objectif) ?$$),
        'fixation', jsonb_build_object('question', $$Pourquoi faut-il lire un texte informatif plusieurs fois avant de le résumer ?$$, 'solution', $$Pour bien distinguer les informations essentielles des détails secondaires et ne rien oublier d'important dans le résumé.$$)
      ),
      jsonb_build_object(
        'heading', $$Sélectionner et hiérarchiser les informations$$,
        'body', $$Résumer, ce n'est pas raccourcir chaque phrase : c'est choisir les informations essentielles et éliminer les exemples, répétitions et détails secondaires.$$,
        'highlights', array[$$une information essentielle$$, $$un détail secondaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$À garder$$, $$À supprimer$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Les faits et chiffres principaux$$, $$Les exemples et anecdotes$$),
            jsonb_build_array($$Les causes et conséquences majeures$$, $$Les répétitions et reformulations$$),
            jsonb_build_array($$Les noms et dates clés$$, $$Les détails secondaires non essentiels$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour hiérarchiser les informations, on distingue l'idée essentielle de chaque paragraphe des exemples et détails qui l'illustrent, puis on ne garde que l'essentiel dans le résumé.$$),
        'example', jsonb_build_object('statement', $$Résume l'idée essentielle de ce passage : « Le village de Kokoti a été électrifié en 2023 grâce à un projet national. Les habitants racontent qu'avant, ils utilisaient des lampes à pétrole, souvent dangereuses. »$$, 'solution', $$Le village de Kokoti a été électrifié en 2023 grâce à un projet national.$$),
        'fixation', jsonb_build_object('question', $$Quelle information supprimerais-tu dans ce passage pour un résumé : « Le projet a coûté 2 milliards de francs CFA, une somme énorme, presque impossible à imaginer pour la plupart des villageois. » ?$$, 'solution', $$On supprimerait le commentaire « une somme énorme, presque impossible à imaginer », en gardant seulement le chiffre : le projet a coûté 2 milliards de francs CFA.$$)
      ),
      jsonb_build_object(
        'heading', $$Reformuler avec ses propres mots$$,
        'body', $$Un bon résumé n'est pas une suite de phrases copiées : il reformule les idées du texte avec un vocabulaire personnel, plus court et plus synthétique.$$,
        'highlights', array[$$reformuler$$, $$un mot générique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Reformuler consiste à remplacer une longue explication par un mot ou une expression plus générale (un mot générique) qui résume la même idée en moins de mots.$$),
        'example', jsonb_build_object('statement', $$Reformule en un mot générique : « des écoles, des dispensaires et des routes ont été construits »$$, 'solution', $$Des infrastructures ont été construites.$$),
        'fixation', jsonb_build_object('question', $$Reformule en une phrase courte : « Le projet a permis d'installer l'électricité, de construire un château d'eau et de goudronner la route principale du village. »$$, 'solution', $$Le projet a doté le village de plusieurs infrastructures essentielles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu dois résumer en dix lignes maximum un article informatif sur l'électrification des villages en Côte d'Ivoire, en respectant le nombre d'informations essentielles.$$,
      'questions', array[
        $$Identifie le sujet général et trois informations essentielles du texte source.$$,
        $$Supprime les exemples et détails secondaires que tu repères.$$,
        $$Reformule au moins une phrase avec un mot générique.$$,
        $$Vérifie que ton résumé respecte la limite de dix lignes et l'ordre logique du texte.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Résume l'idée essentielle de ce passage en une phrase : « Le gouvernement a lancé en 2022 un programme d'accès à l'eau potable. Plus de 300 villages ont déjà été raccordés, selon le ministère. »$$,
      'hint', $$Garde uniquement l'action principale et le chiffre clé.$$,
      'expected', $$Depuis 2022, un programme gouvernemental a raccordé plus de 300 villages à l'eau potable.$$
    ),
    jsonb_build_object(
      'question', $$Quelle information supprimerais-tu dans ce passage pour un résumé : « L'école a été rénovée, ce qui a beaucoup ému les anciens élèves venus assister à l'inauguration en larmes. » ?$$,
      'hint', $$Distingue le fait principal du détail émotionnel.$$,
      'expected', $$On supprimerait le détail sur l'émotion des anciens élèves ; le résumé garderait seulement le fait que l'école a été rénovée.$$
    ),
    jsonb_build_object(
      'question', $$Reformule en un mot générique : « des médecins, des infirmiers et des sages-femmes ont été envoyés dans la région »$$,
      'hint', $$Cherche un mot qui regroupe ces trois professions.$$,
      'expected', $$Du personnel médical a été envoyé dans la région.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi un résumé ne doit-il pas reprendre les phrases du texte source telles quelles ?$$,
      'hint', $$Pense au but du résumé : synthétiser, pas copier.$$,
      'expected', $$Parce que résumer suppose de reformuler les idées avec ses propres mots, de façon plus courte, et non de recopier le texte original.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-resume-texte-informatif';
