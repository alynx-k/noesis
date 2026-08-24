-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Grammaire (categoryid=61).
-- Cours : "6e_Gr_L5_S1-GV_être_substituts" (id 2210). Contenu réécrit à
-- partir du PDF source ; définitions et exemples reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre de la Journée de l'Excellence organisée par le Lycée G.A.F. de Touba, un groupe d'élèves de 6ème prépare un dossier sur la promotion de l'excellence en Côte d'Ivoire. Ils s'organisent pour connaître le groupe verbal attribut du sujet afin de l'utiliser correctement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le groupe verbal attribut du sujet$$,
        'body', $$On parle de groupe verbal attribut du sujet lorsque le complément du verbe est introduit par le verbe "être" ou un de ses substituts (verbes d'état). Les verbes d'état donnent une information sur l'état d'une chose, d'un animal ou d'une personne. On en distingue sept : être, devenir, avoir l'air, demeurer, rester, paraître, ressembler. D'autres verbes (se faire, tomber, appeler, juger, nommer) deviennent verbes d'état s'ils peuvent être remplacés par "être" : "Cet homme se nomme Koffi" = "Cet homme est Koffi."$$,
        'highlights', array[$$7 verbes d'état : être, devenir, avoir l'air, demeurer, rester, paraître, ressembler$$, $$test : un verbe d'état peut être remplacé par "être"$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite trois verbes d'état.$$, 'solution', $$Par exemple : être, devenir, paraître (trois parmi les sept).$$)
      ),
      jsonb_build_object(
        'heading', $$La nature de l'attribut du sujet$$,
        'body', $$L'attribut du sujet peut avoir plusieurs natures : un nom propre ("Cet enfant s'appelle Emmanuel"), un groupe nominal ("Ce garçon est un grand bavard"), un nom commun ("Cet homme est pilote"), un adjectif qualificatif ("Cet hôpital est populaire"), un verbe à l'infinitif ("Son seul but était de détruire"), un pronom personnel ("C'est lui qui est élu"), un adverbe ("Ces jeunes sont ensemble"), ou une proposition subordonnée ("Il semble qu'il soit malade").$$,
        'highlights', array[$$attribut du sujet : nom propre, GN, nom commun, adjectif, infinitif, pronom, adverbe, ou subordonnée$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la nature de l'attribut dans "Son seul but est de se dépenser" ?$$, 'solution', $$Un verbe à l'infinitif ("de se dépenser").$$),
        'fixation', jsonb_build_object('question', $$Quelle est la nature de l'attribut dans "Ce stylo est le mien" ?$$, 'solution', $$Un pronom (possessif).$$)
      ),
      jsonb_build_object(
        'heading', $$Distinction entre attribut du sujet et épithète$$,
        'body', $$L'attribut du sujet appartient au groupe verbal et est séparé du nom qu'il qualifie par un verbe d'état : "Cet élève est intelligent." L'épithète, elle, est directement rattachée au nom qu'elle qualifie et appartient au groupe nominal : "L'élève intelligent étudie toujours ses leçons." Le même adjectif ("intelligent") peut donc être attribut ou épithète selon sa position dans la phrase.$$,
        'highlights', array[$$attribut = séparé du nom par un verbe d'état, appartient au GV$$, $$épithète = collée au nom, appartient au GN$$]::text[],
        'example', jsonb_build_object('statement', $$"Ce maigre chat fait des misères" — "maigre" est-il attribut ou épithète ?$$, 'solution', $$Épithète : il est directement collé au nom "chat", sans verbe d'état.$$),
        'fixation', jsonb_build_object('question', $$Dans "Ce chat est maigre", "maigre" est-il attribut ou épithète ?$$, 'solution', $$Attribut : il est séparé du nom "chat" par le verbe d'état "être".$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le dossier sur la promotion de l'excellence, tu dois rédiger des phrases décrivant des élèves modèles à l'aide d'attributs du sujet variés.$$,
      'questions', array[
        $$Écris une phrase où l'attribut du sujet est un nom commun.$$,
        $$Écris une phrase où l'attribut du sujet est un adjectif qualificatif, puis transforme l'adjectif en épithète dans une nouvelle phrase.$$,
        $$Écris une phrase utilisant un verbe d'état autre que "être" (devenir, paraître, rester...).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Souligne l'attribut du sujet et donne sa nature : "Notre école est belle."$$,
      'hint', $$C'est un mot qui qualifie l'école.$$,
      'expected', $$"Belle" — un adjectif qualificatif.$$
    ),
    jsonb_build_object(
      'question', $$"Il s'appelle Koffi." — donne la nature de l'attribut du sujet.$$,
      'hint', $$C'est le nom d'une personne.$$,
      'expected', $$"Koffi" — un nom propre.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi "se nommer" peut-il être considéré comme un verbe d'état ?$$,
      'hint', $$Applique le test de substitution.$$,
      'expected', $$Parce qu'on peut le remplacer par "être" sans changer le sens ("il se nomme Koffi" = "il est Koffi").$$
    ),
    jsonb_build_object(
      'question', $$"L'élève intelligent étudie toujours" : "intelligent" est-il attribut ou épithète ? Pourquoi ?$$,
      'hint', $$Regarde s'il est séparé du nom par un verbe d'état.$$,
      'expected', $$Épithète, car il est directement rattaché au nom "élève" sans verbe d'état.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-groupe-verbal';
