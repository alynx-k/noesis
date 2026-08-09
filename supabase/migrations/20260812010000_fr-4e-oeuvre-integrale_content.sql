-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806530000_fr_oeuvre_integrale_content.sql). ecole-ci.org is
-- reachable now (see 20260812000000_fr-4e-debat_content.sql) — opened
-- Français 4ème > Étude d'Oeuvre Intégrale > "Leçon 2: S1 Etude de l'œuvre
-- intégrale n°1_Introduction..." (course id 757): "Activités : 0", same
-- empty shell as every other séance course checked in this category.
-- Falling back to original content, from the lesson title/topic and the
-- standard Ivorian 4ème Français programme (étude suivie d'une œuvre
-- intégrale).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur de français annonce que la classe va étudier une œuvre intégrale pendant tout le trimestre. Pour bien suivre ce travail, il faut savoir repérer les éléments clés d'un roman ou d'une pièce de théâtre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Identifier le paratexte$$,
        'body', $$Avant même de lire le texte, la couverture, le titre, le nom de l'auteur, la préface ou la quatrième de couverture donnent déjà des indices sur l'œuvre : c'est le paratexte.$$,
        'highlights', array[$$le paratexte$$, $$la quatrième de couverture$$, $$une préface$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le paratexte regroupe tous les éléments qui entourent le texte principal (titre, couverture, préface, table des matières) et permettent de formuler des hypothèses de lecture avant de commencer.$$),
        'example', jsonb_build_object('statement', $$Que peux-tu déduire du titre « Sous l'orage » avant de lire l'œuvre ?$$, 'solution', $$Le titre suggère une atmosphère de tension ou de conflit, comme si les personnages allaient traverser une période difficile, une « tempête » au sens propre ou figuré.$$),
        'fixation', jsonb_build_object('question', $$Cite deux éléments du paratexte que l'on peut observer avant de lire un livre.$$, 'solution', $$Le titre et la couverture (ou l'illustration), ainsi que le résumé en quatrième de couverture.$$)
      ),
      jsonb_build_object(
        'heading', $$Suivre la structure du récit$$,
        'body', $$Un roman ou une pièce s'organise en grandes étapes : la situation initiale, l'élément perturbateur, les péripéties, le dénouement et parfois une situation finale.$$,
        'highlights', array[$$la situation initiale$$, $$l'élément perturbateur$$, $$le dénouement$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Rôle dans le récit$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Situation initiale$$, $$présente les personnages et le cadre avant que tout ne commence$$),
            jsonb_build_array($$Élément perturbateur$$, $$brise l'équilibre initial et lance l'action$$),
            jsonb_build_array($$Péripéties$$, $$enchaînement d'événements qui font progresser l'histoire$$),
            jsonb_build_array($$Dénouement$$, $$résout le problème posé par l'élément perturbateur$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Repérer la structure d'une œuvre (situation initiale, élément perturbateur, péripéties, dénouement) aide à comprendre la logique du récit et à anticiper les enjeux de chaque chapitre.$$),
        'example', jsonb_build_object('statement', $$Dans un roman, un incendie détruit soudain le village où vivait paisiblement le héros. Quelle étape du récit cela représente-t-il ?$$, 'solution', $$C'est l'élément perturbateur : il rompt l'équilibre de la situation initiale et déclenche l'action du roman.$$),
        'fixation', jsonb_build_object('question', $$À quelle étape du récit correspond le moment où le conflit principal se résout enfin ?$$, 'solution', $$C'est le dénouement.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractériser un personnage$$,
        'body', $$Un personnage se caractérise par son portrait physique et moral, ses paroles, ses actions, et son évolution au fil de l'œuvre.$$,
        'highlights', array[$$un portrait$$, $$le caractère$$, $$l'évolution du personnage$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$On caractérise un personnage à partir de son portrait (traits physiques et moraux), de ses paroles et de ses actes, et en observant comment il change au cours de l'histoire.$$),
        'example', jsonb_build_object('statement', $$Un personnage timide au début du roman finit par prendre la parole en public. Comment nomme-t-on ce changement ?$$, 'solution', $$C'est l'évolution du personnage : son caractère se transforme sous l'effet des événements vécus.$$),
        'fixation', jsonb_build_object('question', $$Cite deux moyens par lesquels un auteur fait connaître le caractère d'un personnage.$$, 'solution', $$Par la description physique et morale qu'il en fait, et par les paroles et actions du personnage lui-même.$$)
      ),
      jsonb_build_object(
        'heading', $$Dégager le thème et le message de l'œuvre$$,
        'body', $$Au-delà de l'histoire racontée, une œuvre porte souvent un ou plusieurs thèmes (l'amitié, l'injustice, la tradition...) et un message que l'auteur souhaite transmettre au lecteur.$$,
        'highlights', array[$$un thème$$, $$le message de l'auteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le thème est le sujet général traité par l'œuvre (l'amitié, la guerre, la tradition), tandis que le message est l'idée ou la leçon que l'auteur veut faire passer à travers son récit.$$),
        'example', jsonb_build_object('statement', $$Une œuvre raconte le conflit entre les valeurs des anciens et celles des jeunes générations dans un village. Quel thème peut-on en dégager ?$$, 'solution', $$Le thème de la tradition face à la modernité, ou le conflit des générations.$$),
        'fixation', jsonb_build_object('question', $$Quelle différence fais-tu entre le thème d'une œuvre et son message ?$$, 'solution', $$Le thème est le sujet abordé (par exemple l'injustice), tandis que le message est la leçon ou l'opinion que l'auteur exprime à ce sujet.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ta classe termine la lecture d'une œuvre intégrale et prépare une fiche de synthèse pour l'exposé final.$$,
      'questions', array[
        $$Présente le paratexte de l'œuvre étudiée (titre, auteur, indices de couverture).$$,
        $$Résume la structure du récit en identifiant la situation initiale, l'élément perturbateur et le dénouement.$$,
        $$Caractérise le personnage principal à partir de son portrait et de son évolution.$$,
        $$Dégage le thème principal et le message de l'œuvre.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux éléments du paratexte qui permettent de formuler des hypothèses avant de lire un roman.$$,
      'hint', $$Pense à ce que l'on observe avant même d'ouvrir le livre.$$,
      'expected', $$Le titre et l'illustration de couverture, ainsi que le résumé figurant en quatrième de couverture.$$
    ),
    jsonb_build_object(
      'question', $$Dans un récit, le héros perd son emploi du jour au lendemain. À quelle étape de la structure du récit cela correspond-il ?$$,
      'hint', $$C'est ce qui rompt l'équilibre initial.$$,
      'expected', $$C'est l'élément perturbateur, qui rompt la situation initiale et déclenche l'action.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux moyens qui permettent de connaître le caractère d'un personnage dans une œuvre.$$,
      'hint', $$Pense au portrait et aux actes du personnage.$$,
      'expected', $$Le portrait physique et moral dressé par le narrateur, et les paroles ou actions du personnage lui-même.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre le thème et le message d'une œuvre ?$$,
      'hint', $$Le thème est un sujet, le message est une idée défendue.$$,
      'expected', $$Le thème est le sujet général de l'œuvre (par exemple l'amitié), tandis que le message est la leçon ou l'opinion que l'auteur veut transmettre à ce sujet.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-oeuvre-integrale';
