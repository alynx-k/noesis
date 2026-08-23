-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Expression Orale (categoryid=59).
-- Cours combinés : "6e_Fr-EO-L1_S1_obtenir_information" (id 2141),
-- "6e_Fr-EO-L1_S2_demander_information" (id 1841, contenu réel : VIH-SIDA),
-- "6e_Fr-EO-L1_S3_expliquer_situation" (id 1850).
-- Contenu réécrit à partir des PDF sources ; situation d'apprentissage,
-- définitions et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Admis en 6ème, un élève se rend pour la première fois dans son nouveau collège. Il y rencontre un ancien élève et engage un dialogue avec lui pour obtenir des informations sur les conditions d'inscription.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Obtenir une information$$,
        'body', $$Le dialogue oral est une conversation orale entre deux ou plusieurs personnes sur un sujet donné. Pour obtenir une information (par exemple sur les conditions d'inscription des nouveaux élèves : inscription en ligne obligatoire, paiement des frais de COGES, dossier complet à déposer chez l'éducateur), on utilise le lexique relatif au thème et des phrases déclaratives et interrogatives.$$,
        'highlights', array[$$dialogue oral = conversation orale entre 2 ou plusieurs personnes sur un sujet donné$$, $$phrases déclaratives et interrogatives pour obtenir une information$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la définition du dialogue oral ?$$, 'solution', $$Une conversation orale entre deux ou plusieurs personnes sur un sujet donné.$$)
      ),
      jsonb_build_object(
        'heading', $$Donner une information sur un problème de santé$$,
        'body', $$Pour donner une information sur un sujet précis (par exemple les modes de transmission du VIH-SIDA : rapports sexuels sans préservatif, partage de matériel comme une brosse à dent ou une seringue, grossesse ou allaitement d'une mère séropositive), on utilise les mêmes outils : lexique du thème, phrases déclaratives/interrogatives, registre de langue adapté à la situation (familier avec tutoiement, soutenu avec vouvoiement et formules de politesse), et une bonne articulation.$$,
        'highlights', array[$$adapter le registre de langue : familier (tutoiement) / soutenu (vouvoiement, politesse)$$, $$articuler, utiliser un débit adéquat, parler d'une voix audible$$]::text[],
        'example', jsonb_build_object('statement', $$Quel registre de langue utiliser en s'adressant à son professeur ?$$, 'solution', $$Le registre soutenu : vouvoiement et formules de politesse.$$),
        'fixation', jsonb_build_object('question', $$Le VIH est responsable de quelle maladie ?$$, 'solution', $$Le SIDA.$$)
      ),
      jsonb_build_object(
        'heading', $$Expliquer une situation$$,
        'body', $$Expliquer une situation, c'est faire connaître quelque chose à quelqu'un, lui faire comprendre clairement un fait qui lui paraît méconnu (par exemple l'importance de l'école : lieu de culturalisation, transmission de savoir-faire et savoir-être, lieu de sociabilisation, préparation des acteurs de demain). Au cours d'une discussion, il faut : donner son opinion, la justifier par des exemples précis, tenir compte des réactions de l'autre, être constructif, varier le vocabulaire, formuler des phrases correctes, être courtois, prendre la parole au bon moment.$$,
        'highlights', array[$$expliquer une situation = faire comprendre clairement un fait méconnu$$, $$donner son opinion + la justifier par des exemples précis$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux raisons pour lesquelles l'école est importante.$$, 'solution', $$L'école transmet des savoirs et savoir-faire, et prépare les acteurs de demain (présidents, ministres, ingénieurs, enseignants...).$$),
        'fixation', jsonb_build_object('question', $$Que faut-il faire quand on ne comprend pas quelque chose pendant une discussion ?$$, 'solution', $$Poser des questions.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Régulièrement absente aux cours de Français, une élève de 6ème décide de rencontrer sa voisine pour comprendre les raisons de ses absences répétées. Elle découvre que les parents de celle-ci n'accordent aucun intérêt à ses études. Elle décide de leur expliquer l'importance de la scolarisation de la jeune fille.$$,
      'questions', array[
        $$Identifie la situation de communication (qui parle à qui, et pourquoi).$$,
        $$Donne au moins trois arguments pour expliquer l'importance de la scolarisation d'une jeune fille.$$,
        $$Rédige les grandes lignes du dialogue en utilisant un registre de langue adapté et des phrases correctes.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels types de phrases utilise-t-on principalement dans un dialogue oral pour obtenir une information ?$$,
      'hint', $$Pense à la question et à l'affirmation.$$,
      'expected', $$Des phrases déclaratives et interrogatives.$$
    ),
    jsonb_build_object(
      'question', $$Quelle différence fait-on entre le tutoiement et le vouvoiement ?$$,
      'hint', $$L'un est familier, l'autre est soutenu.$$,
      'expected', $$Le tutoiement correspond au registre familier, le vouvoiement au registre soutenu (avec formules de politesse).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux modes de transmission du VIH mentionnés dans la leçon.$$,
      'hint', $$Pense aux rapports sexuels et au matériel partagé.$$,
      'expected', $$Rapports sexuels sans préservatif, partage de matériel d'usage (brosse à dents, seringue), ou grossesse/allaitement d'une mère séropositive.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie "expliquer une situation" ?$$,
      'hint', $$C'est faire comprendre quelque chose à quelqu'un.$$,
      'expected', $$Faire connaître quelque chose à quelqu'un, lui faire comprendre clairement un fait qui lui paraît méconnu.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-dialogue-oral';
