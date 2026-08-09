-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806560000_fr_ecriture_texte_argumentatif_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql),
-- but no course matching "rédaction d'un dialogue argumentatif" exists
-- anywhere under Français 4ème: Expression Écrite (categoryid=70) holds
-- only 3 populated courses (lettre officielle, compte rendu de réunion,
-- résumé du texte informatif), and a site search for "redaction dialogue"
-- returns zero results. Falling back to original content, from the lesson
-- title/topic and the standard Ivorian 4ème Français programme (compétence
-- expression écrite — rédaction d'un dialogue argumentatif). Companion
-- writing lesson to 20260812030000_fr-4e-lecture-dialogue-argumentatif_content.sql.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour le concours d'écriture du collège, tu dois inventer un court dialogue où deux personnages s'opposent sur un sujet de société. Il faut apprendre à construire un vrai échange argumentatif.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mettre en place la situation d'échange$$,
        'body', $$Avant d'écrire les répliques, il faut définir les deux personnages, leur lien, le sujet du désaccord et la thèse de chacun.$$,
        'highlights', array[$$les interlocuteurs$$, $$le sujet du désaccord$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un dialogue argumentatif réussi part d'une situation claire : deux personnages identifiés, un sujet précis de désaccord, et une thèse opposée pour chacun d'eux dès le début de l'échange.$$),
        'example', jsonb_build_object('statement', $$Présente en une phrase la situation d'un dialogue entre un élève et son grand frère sur l'utilité des études.$$, 'solution', $$Un collégien découragé par ses notes discute avec son grand frère, qui est convaincu que la persévérance dans les études finit toujours par payer.$$),
        'fixation', jsonb_build_object('question', $$Présente la situation d'un dialogue entre deux amies qui ne sont pas d'accord sur l'utilité des réseaux sociaux.$$, 'solution', $$Deux amies discutent après les cours : l'une pense que les réseaux sociaux sont une perte de temps, l'autre estime qu'ils permettent de rester informé et de garder le contact.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire des répliques argumentées$$,
        'body', $$Chaque réplique importante doit contenir un argument justifié, et non une simple opinion isolée, pour faire progresser l'échange.$$,
        'highlights', array[$$une réplique$$, $$un argument justifié$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape de la réplique$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Opinion$$, $$« Je pense que le travail manuel vaut autant que les études. »$$),
            jsonb_build_array($$Justification$$, $$« ...car il permet aussi de gagner sa vie avec dignité. »$$),
            jsonb_build_array($$Exemple$$, $$« Regarde notre oncle menuisier, il a bien réussi. »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une réplique argumentée suit le même schéma qu'un argument écrit : une opinion, une justification introduite par « car » ou « parce que », et si possible un exemple qui l'illustre.$$),
        'example', jsonb_build_object('statement', $$Rédige une réplique argumentée défendant l'idée que la lecture est importante.$$, 'solution', $$« Je pense que la lecture est essentielle, car elle enrichit notre vocabulaire. Regarde comme tu t'exprimes mieux depuis que tu lis chaque soir ! »$$),
        'fixation', jsonb_build_object('question', $$Rédige une réplique argumentée défendant l'idée que le sport est bénéfique.$$, 'solution', $$« À mon avis, le sport est indispensable, car il garde le corps en bonne santé. D'ailleurs, depuis que je cours chaque matin, je me sens bien plus énergique. »$$)
      ),
      jsonb_build_object(
        'heading', $$Employer les marques du dialogue et de l'opposition$$,
        'body', $$Le dialogue argumentatif respecte la ponctuation du dialogue (tirets, guillemets, verbes de parole) et emploie des connecteurs d'opposition pour marquer le désaccord.$$,
        'highlights', array[$$un verbe de parole$$, $$un connecteur d'opposition$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Chaque prise de parole commence par un tiret, peut être introduite par un verbe de parole varié (répliqua, objecta, rétorqua), et utilise des connecteurs d'opposition (mais, pourtant, cependant) pour marquer clairement le désaccord.$$),
        'example', jsonb_build_object('statement', $$Ponctue correctement cet échange : Je crois que oui dit Awa Moi je pense le contraire répondit Aya$$, 'solution', $$— Je crois que oui, dit Awa.\n— Moi, je pense le contraire, répondit Aya.$$),
        'fixation', jsonb_build_object('question', $$Remplace le verbe « dit » par un verbe de parole plus précis dans : « Tu as tort, dit-il. »$$, 'solution', $$« Tu as tort, objecta-t-il. » (ou « rétorqua-t-il »)$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le concours d'écriture, rédige un dialogue argumentatif entre deux camarades qui ne sont pas d'accord sur l'utilité des devoirs à la maison.$$,
      'questions', array[
        $$Présente en une phrase la situation et la thèse de chaque personnage.$$,
        $$Rédige au moins quatre répliques argumentées (opinion, justification, exemple).$$,
        $$Utilise deux verbes de parole différents et deux connecteurs d'opposition.$$,
        $$Respecte la ponctuation du dialogue (tirets, guillemets si besoin).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Présente en une phrase la situation d'un dialogue entre un élève et son enseignant sur l'utilité des interrogations surprises.$$,
      'hint', $$Identifie les deux personnages et leurs thèses opposées.$$,
      'expected', $$Un élève se plaint des interrogations surprises auprès de son enseignant, qui explique qu'elles permettent de vérifier que les leçons sont apprises régulièrement.$$
    ),
    jsonb_build_object(
      'question', $$Rédige une réplique argumentée (opinion + justification) défendant l'idée que les langues locales devraient être enseignées à l'école.$$,
      'hint', $$Utilise « car » pour justifier l'opinion.$$,
      'expected', $$« Je pense que les langues locales devraient être enseignées à l'école, car elles font partie de notre identité culturelle. »$$
    ),
    jsonb_build_object(
      'question', $$Ponctue correctement cet échange : Tu devrais réviser plus dit sa mère J'ai déjà beaucoup travaillé répondit-il$$,
      'hint', $$Utilise un tiret pour chaque prise de parole.$$,
      'expected', $$— Tu devrais réviser plus, dit sa mère.\n— J'ai déjà beaucoup travaillé, répondit-il.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi varier les verbes de parole (répliqua, objecta, rétorqua) rend-il un dialogue argumentatif plus vivant ?$$,
      'hint', $$Pense à la répétition du verbe « dire ».$$,
      'expected', $$Parce que cela évite la répétition monotone du verbe « dire » et précise en plus le ton ou l'intention de chaque personnage.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-redaction-dialogue-argumentatif';
