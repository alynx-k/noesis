-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 864: "EE 1: Com_composé_analyser_const_organiser_CI"
-- (https://lyc.ecole-ci.org/course/view.php?id=864), resource id 4017.
-- Contenu méthodologique (analyse du libellé, construction du sens et
-- organisation des centres d'intérêt en commentaire composé) réécrit à
-- partir du PDF source. Le PDF source illustre la méthode à l'aide d'un
-- extrait littéraire réel (Sembène Ousmane) sous droits d'auteur : plutôt
-- que de le reproduire, la méthode est illustrée ici par un court texte
-- support ENTIÈREMENT ORIGINAL (composé pour ce cours), pour rester
-- fidèle à la politique « 100% contenu original » de l'application.
-- Structure méthodologique (consigne/centres d'intérêt, grille
-- indices/analyse/interprétation) fidèle au programme ivoirien.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-commentaire-compose-methode',
  '1ere',
  'A',
  'francais',
  $$Le commentaire composé : méthode$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au CDI, des élèves de 1ère découvrent un ancien sujet de commentaire composé. N'ayant jamais pratiqué cet exercice, ils s'organisent pour comprendre comment analyser le libellé, dégager les centres d'intérêt d'un texte, puis organiser leurs idées avant de rédiger.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Généralités et analyse du libellé$$,
        'body', $$Le commentaire composé porte sur un texte en prose ou en vers choisi pour sa qualité littéraire : le candidat rend compte de sa lecture personnelle en montrant les qualités stylistiques et les richesses thématiques du texte. Le libellé comporte deux parties : la consigne (ce qui doit être fait, par exemple « Faites un commentaire composé de ce texte ») et l'information, qui indique les centres d'intérêt — deux ou trois pistes de lecture proposées pour orienter l'analyse (elles ne sont ni exhaustives ni obligatoires).$$,
        'highlights', array[$$consigne$$, $$centres d'intérêt$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le libellé d'un commentaire composé se compose de la consigne (la tâche à accomplir) et de l'information (les centres d'intérêt proposés comme pistes de lecture).$$),
        'fixation', jsonb_build_object('question', $$Que désigne-t-on par « centres d'intérêt » dans le libellé d'un commentaire composé ?$$, 'solution', $$Les deux ou trois pistes de lecture proposées par le libellé pour orienter l'analyse du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier le thème, la nature du texte et la tonalité$$,
        'body', $$Avant d'organiser les centres d'intérêt, il faut cerner l'identité du texte : son thème (le sujet traité), sa nature (récit, poème, texte argumentatif...), sa tonalité (comique, tragique, lyrique, pathétique...) et son idée générale (l'idée centrale résumée en une phrase). Ces éléments éclairent le sens global avant l'analyse détaillée.$$,
        'highlights', array[$$thème$$, $$nature du texte$$, $$tonalité$$, $$idée générale$$]::text[],
        'example', jsonb_build_object('statement', $$Voici un texte support : « Depuis que Awa a quitté le village pour la capitale, elle écrit chaque mois à sa mère. Sous les néons de la ville, elle se surprend à rêver du grand fromager de la cour familiale, du bruit du pilon à l'aube, des rires de ses sœurs autour du feu. » Identifie le thème et la tonalité de cet extrait.$$, 'solution', $$Thème : la nostalgie du village natal depuis la ville. Tonalité : nostalgique/lyrique (le texte exprime une émotion intime liée au souvenir).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi identifier la tonalité d'un texte avant de l'analyser en détail ?$$, 'solution', $$Parce que la tonalité oriente l'interprétation des procédés d'écriture : un même mot n'a pas le même effet dans un texte tragique ou dans un texte comique.$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser les centres d'intérêt en sous-centres$$,
        'body', $$Organiser un centre d'intérêt consiste à le décomposer en sous-centres (des aspects plus précis), puis à relever pour chacun des indices textuels (mots, phrases, procédés d'écriture), à les analyser (identifier le procédé : champ lexical, figure de style, temps verbal...) et à en dégager l'interprétation (ce que cela révèle du sens du texte). Cette démarche se présente souvent sous forme de grille : sous-centre → indices relevés → analyse → interprétation.$$,
        'highlights', array[$$sous-centres$$, $$indices textuels$$, $$analyse$$, $$interprétation$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le texte support ci-dessus, propose un sous-centre du centre d'intérêt « la nostalgie du village », avec un indice et son interprétation.$$, 'solution', $$Sous-centre : les souvenirs sensoriels du village. Indice : « le bruit du pilon à l'aube », « les rires de ses sœurs ». Interprétation : Awa garde une mémoire vivante et sensorielle de son enfance, qui contraste avec l'anonymat de la ville (« les néons »).$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les quatre colonnes typiques d'une grille d'organisation des centres d'intérêt ?$$, 'solution', $$Sous-centre, indices textuels relevés, analyse (le procédé identifié), interprétation (le sens dégagé).$$)
      ),
      jsonb_build_object(
        'heading', $$Des centres d'intérêt au plan détaillé$$,
        'body', $$Une fois les centres d'intérêt organisés en sous-centres, on obtient un plan détaillé : chaque centre d'intérêt devient une grande partie du commentaire, chaque sous-centre un paragraphe, et les indices relevés fournissent les citations qui viendront appuyer l'analyse dans la rédaction. Les centres d'intérêt sont souvent liés par un rapport logique (causalité, opposition, progression) qu'il est utile d'expliciter avant de rédiger.$$,
        'highlights', array[$$centre d'intérêt → grande partie$$, $$sous-centre → paragraphe$$, $$rapport logique entre les centres$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi correspond, dans le plan détaillé final, un sous-centre identifié lors de l'organisation des centres d'intérêt ?$$, 'solution', $$Il correspond en général à un paragraphe du développement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un texte support : « Le vieux Koffi regardait le fleuve depuis son banc, comme chaque soir. Les enfants du quartier passaient en courant, insouciants, sans un regard pour lui. Il se souvenait d'un temps où ce même banc était toujours entouré de voisins venus écouter ses histoires. » Le libellé associé est : « Faites un commentaire composé de ce texte. Étudiez d'abord la solitude du vieux Koffi, puis le contraste entre le présent et le passé. »$$,
      'questions', array[
        $$Identifie la consigne et les centres d'intérêt proposés par ce libellé.$$,
        $$Propose un sous-centre pour le premier centre d'intérêt (« la solitude du vieux Koffi »), avec un indice textuel à l'appui.$$,
        $$Quel rapport logique relie les deux centres d'intérêt proposés dans ce libellé ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans un libellé de commentaire composé, quelle partie indique ce qui doit être fait ?$$,
      'hint', $$Ce n'est pas la partie qui propose des pistes de lecture.$$,
      'expected', $$La consigne (par exemple « Faites un commentaire composé de ce texte »).$$
    ),
    jsonb_build_object(
      'question', $$Un texte évoque la peur et l'angoisse d'un personnage face à un danger. Quelle tonalité peut-on lui attribuer ?$$,
      'hint', $$Pense aux tonalités qui expriment une émotion forte et oppressante.$$,
      'expected', $$Une tonalité pathétique ou dramatique.$$
    ),
    jsonb_build_object(
      'question', $$Dans une grille d'organisation des centres d'intérêt, que place-t-on dans la colonne « indices textuels » ?$$,
      'hint', $$Ce sont des éléments directement issus du texte.$$,
      'expected', $$Des mots, expressions ou phrases précises relevés dans le texte, qui serviront de citations.$$
    ),
    jsonb_build_object(
      'question', $$À quoi sert d'identifier un rapport logique entre deux centres d'intérêt avant de rédiger ?$$,
      'hint', $$Pense à la cohérence du plan et des transitions.$$,
      'expected', $$Cela permet d'organiser le plan de façon cohérente et de préparer des transitions claires entre les grandes parties du commentaire.$$
    )
  ),
  now()
);
