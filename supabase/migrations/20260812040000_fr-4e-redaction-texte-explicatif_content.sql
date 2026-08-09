-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806560000_fr_ecriture_texte_argumentatif_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql),
-- but no course matching "rédaction d'un texte explicatif" exists anywhere
-- under Français 4ème: Expression Écrite (categoryid=70) holds only 3
-- populated courses (lettre officielle, compte rendu de réunion, résumé du
-- texte informatif), and a site search for "rediger texte explicatif"
-- returns zero results. Falling back to original content, from the lesson
-- title/topic and the standard Ivorian 4ème Français programme (compétence
-- expression écrite — rédaction d'un texte explicatif). Companion writing
-- lesson to 20260812020000_fr-4e-lecture-texte-explicatif_content.sql.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club scientifique de ton collège prépare un panneau d'exposition sur le cycle de l'eau. On te confie la rédaction du texte explicatif qui accompagnera les images.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Choisir et délimiter le sujet$$,
        'body', $$Avant de rédiger, il faut délimiter précisément le phénomène à expliquer et se poser les questions auxquelles le texte devra répondre (quoi, pourquoi, comment).$$,
        'highlights', array[$$délimiter le sujet$$, $$une question directrice$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Rédiger un texte explicatif commence par une question directrice claire (« Pourquoi... ? », « Comment... ? ») à laquelle tout le texte doit répondre, sans s'écarter du sujet.$$),
        'example', jsonb_build_object('statement', $$Formule une question directrice pour un texte expliquant la formation des marées.$$, 'solution', $$Pourquoi le niveau de la mer varie-t-il au cours de la journée ?$$),
        'fixation', jsonb_build_object('question', $$Formule une question directrice pour un texte expliquant pourquoi les feuilles changent de couleur en saison sèche.$$, 'solution', $$Pourquoi les feuilles de certains arbres changent-elles de couleur en saison sèche ?$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser l'explication en paragraphes$$,
        'body', $$Un texte explicatif bien construit suit un plan logique : une courte introduction qui pose la question, un développement organisé en étapes causales, et une brève conclusion.$$,
        'highlights', array[$$une introduction$$, $$le développement$$, $$une conclusion$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Partie$$, $$Contenu$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Introduction$$, $$présente le phénomène et la question directrice$$),
            jsonb_build_array($$Développement$$, $$explique les causes et le mécanisme, étape par étape$$),
            jsonb_build_array($$Conclusion$$, $$résume l'explication ou ouvre sur une conséquence$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le développement d'un texte explicatif s'organise en étapes reliées par des connecteurs logiques (d'abord, ensuite, enfin, parce que, donc), pour que le lecteur suive facilement le raisonnement.$$),
        'example', jsonb_build_object('statement', $$Rédige une phrase d'introduction pour un texte expliquant pourquoi il pleut davantage en saison des pluies.$$, 'solution', $$Chaque année, entre juin et septembre, les pluies deviennent plus fréquentes et plus abondantes : mais pourquoi la saison des pluies existe-t-elle ?$$),
        'fixation', jsonb_build_object('question', $$Rédige une phrase de conclusion pour un texte qui vient d'expliquer le cycle de l'eau.$$, 'solution', $$Ainsi, grâce à ce cycle continu d'évaporation et de précipitation, l'eau ne cesse jamais de circuler entre le sol, l'air et les océans.$$)
      ),
      jsonb_build_object(
        'heading', $$Employer le registre et le vocabulaire adaptés$$,
        'body', $$Le texte explicatif utilise le présent de vérité générale, un vocabulaire précis, et évite les marques de subjectivité (je pense, à mon avis) qui appartiennent au texte argumentatif.$$,
        'highlights', array[$$le présent de vérité générale$$, $$la neutralité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour rester objectif, un texte explicatif emploie le présent de vérité générale, la troisième personne, et un vocabulaire technique reformulé si nécessaire, sans jamais exprimer d'opinion personnelle.$$),
        'example', jsonb_build_object('statement', $$Corrige cette phrase pour la rendre objective : « Je trouve que le soleil chauffe la terre. »$$, 'solution', $$Le soleil chauffe la terre grâce aux rayons qu'il émet.$$),
        'fixation', jsonb_build_object('question', $$Corrige cette phrase pour la rendre plus objective : « À mon avis, les volcans sont dangereux car ils entrent en éruption. »$$, 'solution', $$Les volcans peuvent être dangereux car ils entrent en éruption en projetant lave et cendres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club scientifique te demande de rédiger un court texte explicatif sur le thème : « Pourquoi la forêt est-elle appelée le poumon de la planète ? »$$,
      'questions', array[
        $$Formule la question directrice de ton texte.$$,
        $$Rédige une introduction et un développement organisés en deux ou trois étapes causales.$$,
        $$Utilise au moins deux connecteurs logiques différents.$$,
        $$Vérifie que ton texte reste objectif, sans expression d'opinion personnelle.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Formule une question directrice pour un texte expliquant pourquoi le sel fait fondre la neige.$$,
      'hint', $$Utilise « Pourquoi » ou « Comment ».$$,
      'expected', $$Pourquoi le sel fait-il fondre la neige ?$$
    ),
    jsonb_build_object(
      'question', $$Rédige une phrase d'explication utilisant le connecteur « donc » sur le thème de la déforestation.$$,
      'hint', $$Relie une cause à une conséquence.$$,
      'expected', $$Les arbres retiennent l'eau dans le sol, donc la déforestation favorise l'érosion et les inondations.$$
    ),
    jsonb_build_object(
      'question', $$Corrige cette phrase pour qu'elle soit objective : « Je pense que les abeilles sont indispensables à la nature. »$$,
      'hint', $$Supprime la marque d'opinion personnelle.$$,
      'expected', $$Les abeilles sont indispensables à la nature, car elles assurent la pollinisation de nombreuses plantes.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi un texte explicatif doit-il éviter les expressions comme « je trouve » ou « à mon avis » ?$$,
      'hint', $$Pense au but du texte explicatif : informer, pas convaincre.$$,
      'expected', $$Parce que le texte explicatif vise à informer objectivement, sans exprimer une opinion personnelle qui appartient plutôt au texte argumentatif.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-redaction-texte-explicatif';
