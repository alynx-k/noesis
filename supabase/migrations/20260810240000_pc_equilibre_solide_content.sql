-- Physique-Chimie 3ème — Équilibre d'un solide soumis à deux forces.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème mechanics competency (conditions
-- d'équilibre : même droite d'action, sens opposés, même valeur ; corps
-- posé sur un plan, corps suspendu). Original wording throughout, not
-- copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'un TP, un professeur suspend une pierre à un dynamomètre fixé au plafond. La pierre reste parfaitement immobile. Elle est pourtant soumise à deux forces : son poids, qui l'attire vers le bas, et la tension du fil, qui la retient. Pourquoi ces deux forces ne mettent-elles pas la pierre en mouvement ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mise en évidence expérimentale$$,
        'body', $$On accroche un solide immobile à un fil vertical relié à un support fixe. Ce solide, immobile, est donc en équilibre. Il est soumis à deux forces : son poids, exercé par la Terre, et la tension du fil, exercée par le support. L'étude de leur direction, de leur sens et de leur valeur permet d'établir les conditions d'équilibre.$$,
        'highlights', array[$$équilibre$$, $$poids$$, $$tension du fil$$]::text[],
        'property', jsonb_build_object('label', $$Observation$$, 'text', $$Un solide immobile, suspendu à un fil vertical, est soumis à deux forces : son poids P, vertical vers le bas, et la tension T du fil, verticale vers le haut. Ces deux forces ont la même droite d'action, des sens opposés et la même valeur.$$),
        'example', jsonb_build_object('statement', $$Un solide de poids 12 N est suspendu à un fil et reste immobile. Quelle est la valeur de la tension du fil ?$$, 'solution', $$Le solide est en équilibre sous l'effet du poids et de la tension : ces deux forces sont égales en valeur, donc T=12 N.$$),
        'fixation', jsonb_build_object('question', $$Un solide en équilibre est suspendu à un fil vertical. Quelle est la direction de la tension du fil ?$$, 'solution', $$La tension a la même droite d'action que le poids, donc elle est verticale.$$)
      ),
      jsonb_build_object(
        'heading', $$Conditions d'équilibre d'un solide soumis à deux forces$$,
        'body', $$Un solide immobile soumis à seulement deux forces est en équilibre si, et seulement si, ces deux forces ont la même droite d'action, des sens opposés, et la même valeur.$$,
        'highlights', array[$$même droite d'action$$, $$sens opposés$$, $$même valeur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un solide soumis à deux forces F1 et F2 est en équilibre si : F1 et F2 ont la même droite d'action ; F1 et F2 ont des sens opposés ; F1 et F2 ont la même valeur (F1=F2).$$),
        'example', jsonb_build_object('statement', $$Un solide est soumis à deux forces de même droite d'action et de sens opposés, l'une de 18 N, l'autre de 15 N. Ce solide est-il en équilibre ?$$, 'solution', $$Non, car les deux forces n'ont pas la même valeur (18 N ≠ 15 N) : le solide n'est pas en équilibre.$$),
        'fixation', jsonb_build_object('question', $$Un solide est soumis à deux forces horizontales de sens opposés et de valeurs égales à 10 N chacune, mais dont les droites d'action sont parallèles et distinctes (non confondues). Ce solide est-il en équilibre ?$$, 'solution', $$Non : les trois conditions doivent être réunies. Comme les droites d'action ne sont pas confondues, le solide n'est pas en équilibre.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(100, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 50, 'y', 80, 'label', $$O$$),
            jsonb_build_object('x', 50, 'y', 20, 'label', $$T$$),
            jsonb_build_object('x', 50, 'y', 140, 'label', $$P$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2))
        )
      ),
      jsonb_build_object(
        'heading', $$Corps posé sur un plan horizontal$$,
        'body', $$Un objet posé, immobile, sur une table horizontale est soumis à deux forces : son poids P, exercé par la Terre, et la réaction R du support, exercée par la table. Puisque l'objet est en équilibre, ces deux forces sont directement opposées.$$,
        'highlights', array[$$réaction du support$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour un solide posé sur un plan horizontal et en équilibre, la réaction R du support est verticale, dirigée vers le haut, et de même valeur que le poids P : R=P.$$),
        'example', jsonb_build_object('statement', $$Un livre de poids 6 N est posé sur une table et reste immobile. Quelle est la valeur de la réaction de la table sur le livre ?$$, 'solution', $$Le livre est en équilibre sous l'effet de son poids et de la réaction du support : R=P=6 N.$$),
        'fixation', jsonb_build_object('question', $$Une caisse de poids 150 N repose, immobile, sur le sol. Quelle est la valeur de la réaction du sol sur la caisse ?$$, 'solution', $$R=P=150 N.$$)
      ),
      jsonb_build_object(
        'heading', $$Corps suspendu à un ressort$$,
        'body', $$Un objet accroché à un ressort vertical et immobile est soumis à son poids et à la force de rappel exercée par le ressort. À l'équilibre, ces deux forces se compensent exactement, ce qui permet d'utiliser un ressort gradué, comme le dynamomètre, pour mesurer un poids.$$,
        'highlights', array[$$force de rappel$$, $$dynamomètre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un solide suspendu à un ressort et en équilibre est soumis à deux forces opposées de même valeur : son poids P et la force de rappel du ressort F. Le dynamomètre exploite cette égalité pour afficher directement la valeur du poids.$$),
        'example', jsonb_build_object('statement', $$Un dynamomètre affiche 8 N lorsqu'on y suspend un objet immobile. Quel est le poids de cet objet ?$$, 'solution', $$À l'équilibre, la force de rappel du ressort est égale au poids, donc l'objet a un poids de 8 N.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi peut-on utiliser un dynamomètre pour mesurer directement le poids d'un objet suspendu et immobile ?$$, 'solution', $$Parce qu'à l'équilibre, la force de rappel du ressort est exactement égale et opposée au poids de l'objet, donc sa graduation indique directement la valeur du poids.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un TP, un professeur suspend une pierre de poids inconnu à un dynamomètre fixé au plafond. La pierre reste parfaitement immobile, et le dynamomètre affiche 22 N.$$,
      'questions', array[
        $$Cite les deux forces qui s'exercent sur la pierre à l'équilibre.$$,
        $$Ces deux forces vérifient trois conditions pour que la pierre soit en équilibre : lesquelles ?$$,
        $$Quelle est la valeur du poids de la pierre ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un vase de poids 9 N est posé sur une étagère horizontale et reste immobile. Quelle est la valeur de la réaction de l'étagère sur le vase ?$$,
      'hint', $$À l'équilibre, la réaction R est égale au poids P.$$,
      'expected', $$R=9 N.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois conditions que doivent vérifier deux forces pour qu'un solide soumis à elles soit en équilibre.$$,
      'hint', $$Pense à la droite d'action, au sens, et à la valeur des deux forces.$$,
      'expected', $$Les deux forces doivent avoir la même droite d'action, des sens opposés, et la même valeur.$$
    ),
    jsonb_build_object(
      'question', $$Un solide est soumis à deux forces de même droite d'action et de même valeur (14 N chacune), mais de même sens (toutes deux vers le haut). Ce solide est-il en équilibre ? Justifie.$$,
      'hint', $$Revois la condition portant sur le sens des deux forces.$$,
      'expected', $$Non, car les deux forces doivent avoir des sens opposés ; ayant le même sens, elles ne se compensent pas, donc le solide n'est pas en équilibre.$$
    ),
    jsonb_build_object(
      'question', $$Une lampe de poids 4 N est suspendue à un fil et reste immobile. Quelle est la valeur et la direction de la tension du fil ?$$,
      'hint', $$Pense à la droite d'action commune avec le poids.$$,
      'expected', $$La tension est verticale, dirigée vers le haut, et de valeur 4 N (égale au poids).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-equilibre-solide';
