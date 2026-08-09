-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). Matching ecole-ci.org
-- sources exist (ids 2333-2338, categoryid=77, split across six
-- sub-sessions covering cause/consequence/but/temps/comparaison/
-- condition/opposition) but could not be fetched in this session (the
-- Claude-in-Chrome browser extension disconnected and did not reconnect).
-- Given the breadth of the official topic, this lesson focuses on the four
-- circumstance types most commonly assessed at this level -- cause,
-- consequence, but (purpose), condition, and opposition/concession --
-- each in both the simple and the complex sentence, written from general
-- knowledge of the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans ta prochaine rédaction, ton professeur te demande d'expliquer clairement pourquoi les choses arrivent, dans quel but on agit, à quelles conditions, et malgré quels obstacles. Il te propose de réviser l'expression des circonstances, dans la phrase simple et dans la phrase complexe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Exprimer la cause et la conséquence$$,
        'body', $$La cause explique pourquoi un fait se produit ; la conséquence indique ce qui en résulte. Dans une phrase simple, on utilise souvent une préposition ; dans une phrase complexe, une conjonction introduit une proposition subordonnée.$$,
        'highlights', array[$$la cause$$, $$la conséquence$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Circonstance$$, $$Phrase simple$$, $$Phrase complexe$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cause$$, $$à cause de, grâce à, en raison de + nom$$, $$parce que, car, comme + proposition$$),
            jsonb_build_array($$Conséquence$$, $$d'où, de là + nom$$, $$si bien que, de sorte que + proposition$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La cause répond à la question « Pourquoi ? » et précède souvent le fait qu'elle explique. La conséquence répond à « Qu'est-ce qui en résulte ? » et suit le fait qui la provoque.$$),
        'example', jsonb_build_object('statement', $$Exprime la cause de cette conséquence, en phrase complexe : « Il a réussi son examen. »$$, 'solution', $$Il a réussi son examen parce qu'il a beaucoup travaillé.$$),
        'fixation', jsonb_build_object('question', $$Exprime la conséquence de cette cause, en phrase complexe : « Il pleuvait très fort. »$$, 'solution', $$Il pleuvait si fort que le match a été annulé.$$)
      ),
      jsonb_build_object(
        'heading', $$Exprimer le but$$,
        'body', $$Le but indique l'objectif recherché par une action ; il répond à la question « Dans quel but ? » ou « Pour quoi faire ? ».$$,
        'highlights', array[$$le but$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En phrase simple, le but s'exprime avec « pour + infinitif » ou « en vue de + nom ». En phrase complexe, on utilise « pour que » ou « afin que » suivis du subjonctif.$$),
        'example', jsonb_build_object('statement', $$Exprime le but en phrase simple : « Elle étudie. » (réussir son examen)$$, 'solution', $$Elle étudie pour réussir son examen.$$),
        'fixation', jsonb_build_object('question', $$Exprime le but en phrase complexe : « Il parle doucement. » (ne pas réveiller le bébé)$$, 'solution', $$Il parle doucement pour que le bébé ne se réveille pas.$$)
      ),
      jsonb_build_object(
        'heading', $$Exprimer la condition$$,
        'body', $$La condition indique ce qui doit se réaliser pour qu'un fait soit possible ; elle répond à la question « À quelle condition ? ».$$,
        'highlights', array[$$la condition$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En phrase complexe, la condition s'exprime le plus souvent avec « si + présent, ... futur » (condition réalisable) ou « si + imparfait, ... conditionnel » (condition moins probable). En phrase simple, on peut utiliser « avec, sans, en cas de + nom ».$$),
        'example', jsonb_build_object('statement', $$Exprime une condition réalisable : « Tu réussiras ton examen. »$$, 'solution', $$Si tu travailles régulièrement, tu réussiras ton examen.$$),
        'fixation', jsonb_build_object('question', $$Exprime cette même idée en phrase simple, avec une préposition.$$, 'solution', $$Avec un travail régulier, tu réussiras ton examen.$$)
      ),
      jsonb_build_object(
        'heading', $$Exprimer l'opposition et la concession$$,
        'body', $$L'opposition marque un contraste entre deux faits ; la concession admet un fait tout en maintenant une autre idée malgré cela.$$,
        'highlights', array[$$l'opposition$$, $$la concession$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En phrase complexe, l'opposition s'exprime avec « alors que » ou « tandis que », et la concession avec « bien que » ou « quoique » suivis du subjonctif. En phrase simple, on utilise souvent « malgré + nom ».$$),
        'example', jsonb_build_object('statement', $$Exprime une concession en phrase complexe : « Il fait beau. » / « Elle reste chez elle. »$$, 'solution', $$Bien qu'il fasse beau, elle reste chez elle.$$),
        'fixation', jsonb_build_object('question', $$Exprime cette même idée en phrase simple, avec « malgré ».$$, 'solution', $$Malgré le beau temps, elle reste chez elle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour ta rédaction, tu dois raconter un projet que tu as mené à bien, en expliquant ses causes, son but, ses conditions de réussite, et les obstacles surmontés.$$,
      'questions', array[
        $$Exprime la cause de ton projet, en phrase complexe.$$,
        $$Exprime le but de ton projet, en phrase simple et en phrase complexe.$$,
        $$Exprime une condition nécessaire à sa réussite.$$,
        $$Exprime un obstacle surmonté, en utilisant une concession (bien que / malgré).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Relie ces deux phrases avec une conjonction de cause : « Le match a été annulé. » / « Il y avait trop de vent. »$$,
      'hint', $$Utilise « parce que » ou « car ».$$,
      'expected', $$Le match a été annulé parce qu'il y avait trop de vent.$$
    ),
    jsonb_build_object(
      'question', $$Relie ces deux phrases avec une conjonction de conséquence : « Elle a beaucoup ri. » / « Elle en avait mal au ventre. »$$,
      'hint', $$Utilise « si bien que » ou « tellement...que ».$$,
      'expected', $$Elle a tellement ri qu'elle en avait mal au ventre.$$
    ),
    jsonb_build_object(
      'question', $$Exprime le but en phrase simple : « Il économise de l'argent. » (acheter une voiture)$$,
      'hint', $$pour + infinitif.$$,
      'expected', $$Il économise de l'argent pour acheter une voiture.$$
    ),
    jsonb_build_object(
      'question', $$Relie avec une concession : « Il n'a pas beaucoup révisé. » / « Il a réussi son examen. »$$,
      'hint', $$« Bien que » est suivi du subjonctif.$$,
      'expected', $$Bien qu'il n'ait pas beaucoup révisé, il a réussi son examen.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-expression-circonstances';
