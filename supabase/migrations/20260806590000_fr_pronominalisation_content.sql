-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No matching ecole-ci.org
-- source page was found for this grammar lesson (absent from the
-- "Grammaire-Orthographe" category listing), so this content is original,
-- from the lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur remarque que tes rédactions répètent souvent les mêmes noms. Il te propose une séance sur la pronominalisation pour rendre tes textes plus fluides.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rôle du pronom$$,
        'body', $$Un pronom remplace un nom ou un groupe nominal déjà mentionné, pour éviter les répétitions et alléger la phrase.$$,
        'highlights', array[$$un pronom$$, $$l'antécédent$$, $$une répétition$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un pronom reprend un élément déjà cité, appelé antécédent. La pronominalisation consiste à remplacer un groupe nominal par un pronom qui le reprend, sans changer le sens de la phrase.$$),
        'example', jsonb_build_object('statement', $$Remplace la répétition dans cette phrase : « Awa aime les mangues. Awa mange une mangue chaque matin. »$$, 'solution', $$Awa aime les mangues. Elle en mange une chaque matin.$$),
        'fixation', jsonb_build_object('question', $$Remplace la répétition : « Le professeur a corrigé les copies. Le professeur a rendu les copies aux élèves. »$$, 'solution', $$Le professeur a corrigé les copies. Il les a rendues aux élèves.$$)
      ),
      jsonb_build_object(
        'heading', $$Les différents pronoms de reprise$$,
        'body', $$Selon la fonction du groupe nominal qu'il remplace, on choisit un pronom personnel, un pronom relatif, ou un pronom démonstratif.$$,
        'highlights', array[$$COD$$, $$COI$$, $$en$$, $$y$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pronom$$, $$Usage$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$le, la, les$$, $$reprend un COD$$, $$« Je vois le chat. Je le caresse. »$$),
            jsonb_build_array($$lui, leur$$, $$reprend un COI$$, $$« Je parle à Awa. Je lui parle. »$$),
            jsonb_build_array($$en$$, $$reprend un complément introduit par « de »$$, $$« Il a des livres. Il en a beaucoup. »$$),
            jsonb_build_array($$y$$, $$reprend un complément de lieu ou introduit par « à »$$, $$« Il va à l'école. Il y va. »$$),
            jsonb_build_array($$qui, que, dont$$, $$relie une proposition relative à son antécédent$$, $$« Le livre que je lis est passionnant. »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le choix du pronom dépend de la fonction grammaticale du groupe nominal remplacé : complément d'objet direct, complément d'objet indirect, complément de lieu, ou antécédent d'une relative.$$),
        'example', jsonb_build_object('statement', $$Quel pronom faut-il utiliser dans : « Il pense ... son voyage » pour reprendre « à son voyage » ?$$, 'solution', $$Il y pense, car « y » reprend un complément introduit par « à ».$$),
        'fixation', jsonb_build_object('question', $$Quel pronom faut-il utiliser pour reprendre « de ce projet » dans : « Elle parle beaucoup ... » ?$$, 'solution', $$Elle en parle beaucoup, car « en » reprend un complément introduit par « de ».$$)
      ),
      jsonb_build_object(
        'heading', $$Éviter les pronoms ambigus$$,
        'body', $$Un pronom mal placé ou trop éloigné de son antécédent peut rendre une phrase confuse, car le lecteur ne sait plus à qui ou à quoi il renvoie.$$,
        'highlights', array[$$une ambiguïté$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un pronom doit toujours renvoyer clairement à un seul antécédent possible. Si plusieurs noms pourraient correspondre au pronom, la phrase est ambiguë et doit être reformulée.$$),
        'example', jsonb_build_object('statement', $$Explique pourquoi cette phrase est ambiguë : « Awa a rencontré Fatou après son cours. Elle était contente. »$$, 'solution', $$Le pronom « Elle » pourrait renvoyer aussi bien à Awa qu'à Fatou, ce qui rend la phrase ambiguë.$$),
        'fixation', jsonb_build_object('question', $$Reformule cette phrase pour éviter l'ambiguïté : « Le chat a poursuivi la souris jusqu'à ce qu'elle disparaisse. »$$, 'solution', $$Le chat a poursuivi la souris jusqu'à ce que celle-ci disparaisse.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu relis ta dernière rédaction et remarques plusieurs répétitions à corriger avant de la rendre.$$,
      'questions', array[
        $$Réécris un passage de ton texte en remplaçant les répétitions par des pronoms adaptés.$$,
        $$Vérifie qu'aucun pronom utilisé n'est ambigu.$$,
        $$Explique le choix d'un des pronoms que tu as utilisés (COD, COI, lieu...).$$,
        $$Donne un exemple de phrase où un pronom relatif relie deux idées.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Remplace la répétition : « Kouassi a acheté un vélo. Kouassi utilise le vélo tous les jours. »$$,
      'hint', $$Remplace le second groupe nominal par un pronom COD.$$,
      'expected', $$Kouassi a acheté un vélo. Il l'utilise tous les jours.$$
    ),
    jsonb_build_object(
      'question', $$Quel pronom reprend « à ses amis » dans : « Elle écrit ... chaque semaine » ?$$,
      'hint', $$« à » + personne se reprend par lui/leur.$$,
      'expected', $$Elle leur écrit chaque semaine.$$
    ),
    jsonb_build_object(
      'question', $$Quel pronom reprend « de ses vacances » dans : « Il se souvient encore ... » ?$$,
      'hint', $$« de » se reprend par « en ».$$,
      'expected', $$Il s'en souvient encore.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi cette phrase est-elle ambiguë : « Le directeur a convoqué le professeur car il était en retard. » ?$$,
      'hint', $$Cherche les deux noms auxquels « il » pourrait renvoyer.$$,
      'expected', $$Parce que le pronom « il » pourrait désigner aussi bien le directeur que le professeur.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-pronominalisation';
