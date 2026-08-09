-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). The only ecole-ci.org page
-- found for this topic (id 2346) is a single "conclusion" H5P activity with
-- no extractable text, too thin to build a full lesson on -- so this
-- content is written as the general methodology for studying any
-- full-length literary work, matching the catalog's own note that the
-- official programme leaves the specific work to each teacher's choice.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur de français a choisi un roman que toute la classe doit lire cette année. Avant de commencer, il vous explique comment aborder méthodiquement l'étude d'une œuvre intégrale, du début à la fin.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Avant la lecture : se repérer dans l'œuvre$$,
        'body', $$Avant même de lire le texte, il est utile de rassembler des informations sur l'œuvre et son contexte, pour mieux comprendre ce qu'on va lire.$$,
        'highlights', array[$$le paratexte$$, $$l'auteur$$, $$le contexte$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le paratexte (titre, couverture, quatrième de couverture, préface) donne de précieux indices sur le genre, l'époque et le sujet de l'œuvre. Se renseigner sur l'auteur et le contexte historique de l'écriture aide aussi à mieux comprendre certains choix narratifs.$$),
        'example', jsonb_build_object('statement', $$Que peut-on apprendre en lisant la quatrième de couverture d'un roman avant de le lire ?$$, 'solution', $$On peut apprendre le genre de l'histoire, ses personnages principaux, et parfois le début de l'intrigue, ce qui prépare la lecture.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi est-il utile de connaître l'époque à laquelle un roman a été écrit ?$$, 'solution', $$Parce que le contexte historique éclaire souvent les événements, les valeurs ou les préoccupations des personnages dans l'œuvre.$$)
      ),
      jsonb_build_object(
        'heading', $$Pendant la lecture : suivre l'intrigue et les personnages$$,
        'body', $$Lire une œuvre intégrale demande de suivre plusieurs éléments en même temps : l'histoire qui avance, mais aussi l'évolution des personnages et les grandes étapes du récit.$$,
        'highlights', array[$$le schéma narratif$$, $$le point de vue$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Élément à suivre$$, $$Question à se poser$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Le schéma narratif$$, $$À quelle étape de l'histoire suis-je (situation initiale, élément perturbateur, péripéties, dénouement) ?$$),
            jsonb_build_array($$Les personnages$$, $$Comment ce personnage évolue-t-il au fil des chapitres ?$$),
            jsonb_build_array($$Le point de vue$$, $$Qui raconte l'histoire, et que sait-il ou ne sait-il pas ?$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Tenir un carnet de lecture pendant la lecture -- en notant les événements clés, les personnages et les citations marquantes -- facilite grandement l'étude de l'œuvre une fois la lecture terminée.$$),
        'example', jsonb_build_object('statement', $$Donne un exemple de note qu'on pourrait écrire dans un carnet de lecture après un chapitre important.$$, 'solution', $$« Chapitre 5 : le personnage principal découvre un secret sur sa famille, ce qui change sa relation avec son père. »$$),
        'fixation', jsonb_build_object('question', $$Pourquoi est-il utile de noter le point de vue narratif dès le début d'une œuvre ?$$, 'solution', $$Parce que cela permet de savoir si le narrateur connaît toute l'histoire ou seulement ce que vit un personnage, ce qui influence notre confiance dans son récit.$$)
      ),
      jsonb_build_object(
        'heading', $$Après la lecture : analyser et interpréter$$,
        'body', $$Une fois l'œuvre terminée, il s'agit de prendre du recul pour dégager les thèmes principaux et comprendre le message ou la vision de l'auteur.$$,
        'highlights', array[$$un thème$$, $$une interprétation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Analyser une œuvre, c'est identifier ses thèmes principaux (l'amour, la guerre, la famille...), comprendre l'évolution des personnages sur l'ensemble du récit, et formuler une interprétation personnelle appuyée sur des exemples précis tirés du texte.$$),
        'example', jsonb_build_object('statement', $$Donne un exemple de thème qu'on pourrait dégager d'un roman qui raconte l'histoire d'un enfant qui quitte son village pour la ville.$$, 'solution', $$On pourrait dégager le thème du passage à l'âge adulte, ou celui de l'exode rural et de la découverte d'un monde nouveau.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi une interprétation doit-elle toujours s'appuyer sur des exemples précis tirés du texte ?$$, 'solution', $$Parce qu'une interprétation sans exemple reste une simple opinion, alors qu'un exemple précis la rend démontrable et convaincante.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À la fin de l'année, ta classe doit présenter une fiche de lecture complète sur l'œuvre intégrale étudiée.$$,
      'questions', array[
        $$Présente en quelques lignes le contexte de l'œuvre (auteur, époque, genre).$$,
        $$Résume brièvement l'intrigue en identifiant les grandes étapes du schéma narratif.$$,
        $$Dégage un thème principal de l'œuvre et justifie-le avec un exemple précis.$$,
        $$Donne ton interprétation personnelle du message de l'auteur.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Explique ce qu'est le paratexte d'un livre et donne deux exemples.$$,
      'hint', $$Pense à ce qui entoure le texte lui-même.$$,
      'expected', $$Le paratexte regroupe tous les éléments qui entourent le texte, comme le titre, la couverture ou la quatrième de couverture.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi tenir un carnet de lecture pendant la lecture d'une œuvre intégrale ?$$,
      'hint', $$Pense à ce qui aide ensuite pour l'analyse.$$,
      'expected', $$Un carnet de lecture permet de noter les événements et personnages importants au fur et à mesure, ce qui facilite l'analyse une fois le livre terminé.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que le schéma narratif d'un récit ?$$,
      'hint', $$Pense aux grandes étapes d'une histoire.$$,
      'expected', $$Le schéma narratif est l'organisation d'un récit en plusieurs étapes : situation initiale, élément perturbateur, péripéties, élément de résolution et situation finale.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi doit-on toujours justifier une interprétation par un exemple tiré du texte ?$$,
      'hint', $$Pense à la différence entre une opinion et une analyse.$$,
      'expected', $$Parce qu'un exemple précis rend l'interprétation crédible et démontrable, plutôt qu'une simple impression personnelle.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-oeuvre-integrale';
