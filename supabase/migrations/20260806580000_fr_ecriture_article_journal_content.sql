-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No matching ecole-ci.org
-- source page was found for this writing lesson, so this content is
-- original, from the lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club journalisme de ton collège prépare un nouveau numéro du journal de l'école. On te confie la rédaction d'un article sur un événement récent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Choisir et rédiger un bon titre$$,
        'body', $$Le titre est la première chose que lit le lecteur : il doit donner envie de lire la suite tout en résumant fidèlement l'information.$$,
        'highlights', array[$$accrocheur$$, $$informatif$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un bon titre de journal est court, informatif, et souvent accrocheur : il peut jouer sur les mots ou créer une attente, mais il ne doit jamais déformer ou exagérer l'information.$$),
        'example', jsonb_build_object('statement', $$Propose un titre pour un article sur la victoire de l'équipe de football du collège.$$, 'solution', $$« Les Lions du collège remportent le championnat régional »$$),
        'fixation', jsonb_build_object('question', $$Pourquoi un titre ne doit-il jamais exagérer ou déformer les faits ?$$, 'solution', $$Parce qu'un titre trompeur donnerait une fausse idée de l'article et nuirait à la crédibilité du journal.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger le chapeau et respecter le QQOQCP$$,
        'body', $$Le chapeau, ce court paragraphe qui suit le titre, doit répondre le plus vite possible aux questions essentielles que se pose le lecteur.$$,
        'highlights', array[$$le chapeau$$, $$QQOQCP$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Question$$, $$Exemple de réponse$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Qui ?$$, $$les élèves de troisième$$),
            jsonb_build_array($$Quoi ?$$, $$une sortie scolaire au musée$$),
            jsonb_build_array($$Où ?$$, $$au musée national$$),
            jsonb_build_array($$Quand ?$$, $$le mois dernier$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le chapeau doit répondre en quelques phrases aux questions Qui, Quoi, Où, Quand, pour que le lecteur comprenne l'essentiel même s'il ne lit pas la suite de l'article.$$),
        'example', jsonb_build_object('statement', $$Rédige un chapeau pour un article sur une kermesse organisée par l'école.$$, 'solution', $$« Samedi dernier, l'école a organisé sa kermesse annuelle dans la cour principale, réunissant élèves, parents et enseignants autour de nombreux stands. »$$),
        'fixation', jsonb_build_object('question', $$Quelle information manque dans ce chapeau : « Les élèves ont participé à un concours de dessin. » ?$$, 'solution', $$Il manque le lieu et la date précise (Où et Quand).$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser le corps de l'article$$,
        'body', $$Le corps de l'article développe l'information selon un ordre logique, souvent du plus important au moins important, pour que le lecteur puisse s'arrêter à tout moment sans perdre l'essentiel.$$,
        'highlights', array[$$ordre décroissant d'importance$$, $$une citation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le corps de l'article présente d'abord les informations les plus importantes, puis les détails secondaires. Il peut inclure des citations de témoins ou de personnes concernées, toujours rapportées entre guillemets.$$),
        'example', jsonb_build_object('statement', $$Pourquoi place-t-on souvent une citation dans le corps d'un article ?$$, 'solution', $$Une citation apporte un témoignage direct qui rend l'article plus vivant et donne de la crédibilité à l'information.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi organise-t-on un article du plus important au moins important, plutôt que dans l'ordre chronologique ?$$, 'solution', $$Parce qu'un lecteur pressé doit pouvoir comprendre l'essentiel dès les premières lignes, même s'il ne lit pas l'article en entier.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club journalisme de ton collège te confie la rédaction d'un article sur un événement scolaire récent (sortie, compétition, fête...).$$,
      'questions', array[
        $$Rédige un titre court et informatif pour ton article.$$,
        $$Rédige un chapeau qui répond au QQOQCP.$$,
        $$Développe le corps de l'article en au moins deux paragraphes, du plus important au moins important.$$,
        $$Ajoute une citation imaginaire d'un témoin ou d'un participant.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Propose un titre pour un article sur l'ouverture d'une nouvelle bibliothèque au collège.$$,
      'hint', $$Reste court et informatif.$$,
      'expected', $$« Le collège inaugure sa nouvelle bibliothèque »$$
    ),
    jsonb_build_object(
      'question', $$Rédige un chapeau répondant à Qui, Quoi, Où pour cet événement : une exposition de sciences organisée par les élèves de troisième dans le hall du collège.$$,
      'hint', $$Réponds aux trois questions en une phrase.$$,
      'expected', $$« Les élèves de troisième ont organisé une exposition de sciences dans le hall du collège. »$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi une citation doit-elle toujours être rapportée entre guillemets dans un article ?$$,
      'hint', $$Pense à la différence entre les mots du journaliste et ceux d'un témoin.$$,
      'expected', $$Pour montrer clairement qu'il s'agit des mots exacts d'une personne, et non de ceux du journaliste.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel ordre doit-on présenter les informations dans le corps d'un article ?$$,
      'hint', $$Pense au lecteur pressé.$$,
      'expected', $$Du plus important au moins important, pour que l'essentiel soit compris même par un lecteur pressé.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-ecriture-article-journal';
