-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 862: "EE 3: Com_composé_rédiger_intro_et_conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=862), resource id 3993 —
-- "Séance 5 : Rédiger une introduction et une conclusion".
-- Contenu méthodologique (composantes de l'introduction et de la
-- conclusion d'un commentaire composé) réécrit à partir du PDF source.
-- Comme pour les deux leçons précédentes, les extraits littéraires réels
-- utilisés par le PDF (Sembène Ousmane, Denise Jallais, Senghor) sont
-- remplacés par un texte support ENTIÈREMENT ORIGINAL pour illustrer la
-- méthode, en cohérence avec la politique « 100% contenu original » de
-- l'application. Structure méthodologique fidèle au programme.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-introduction-conclusion',
  '1ere',
  'A',
  'francais',
  $$Rédiger l'introduction et la conclusion$$,
  3,
  '1ere-a-fr-rediger-centre-interet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à organiser et rédiger les centres d'intérêt d'un commentaire composé, les élèves de 1ère A se demandent comment « encadrer » leur devoir : comment amener le sujet dans une introduction convaincante, et comment le clore par une conclusion qui ne se contente pas de répéter ce qui a déjà été dit.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois composantes de l'introduction$$,
        'body', $$L'introduction du commentaire composé comporte trois étapes, rédigées en un seul paragraphe (un seul alinéa) : la contextualisation (ou généralité), qui situe le texte à partir de son thème, de son genre littéraire ou du contexte de l'auteur ; la présentation du texte, qui indique le titre, l'auteur, l'œuvre (et sa date si connue), puis dégage l'idée générale du texte ; et l'annonce du plan, qui énumère brièvement les centres d'intérêt qui structureront le développement.$$,
        'highlights', array[$$contextualisation$$, $$présentation du texte$$, $$annonce du plan$$, $$un seul paragraphe$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$L'introduction tient en un seul paragraphe et suit l'ordre : généralité → présentation du texte (auteur, œuvre, idée générale) → annonce du plan.$$),
        'fixation', jsonb_build_object('question', $$Quelles informations doit contenir la « présentation du texte » dans une introduction ?$$, 'solution', $$Le titre du texte, le nom de l'auteur, l'œuvre dont il est extrait, et l'idée générale du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple d'introduction rédigée$$,
        'body', $$Prenons un texte support fictif : un poème intitulé « Racines » d'un auteur imaginaire, Boubacar Diomandé, extrait du recueil Saisons, dans lequel le poète oppose les souvenirs joyeux de son enfance au village aux difficultés de sa vie d'adulte en ville. Voici comment une introduction pourrait être construite à partir des trois composantes vues plus haut.$$,
        'highlights', array[$$généralité → présentation → annonce du plan$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige une introduction pour un commentaire composé de « Racines », avec le libellé : « Étudiez d'abord le bonheur de l'enfance au village, puis les difficultés de la vie adulte en ville. »$$, 'solution', $$L'enfance est souvent perçue comme un âge d'insouciance, dont le souvenir accompagne l'adulte tout au long de sa vie (généralité). C'est dans cette perspective que s'inscrit le poème « Racines », extrait du recueil Saisons de Boubacar Diomandé, dans lequel le poète oppose les souvenirs heureux de son enfance villageoise aux difficultés de sa vie d'adulte en ville (présentation du texte). Dans ce commentaire, nous montrerons d'abord le bonheur de l'enfance au village, avant d'étudier les difficultés de la vie adulte en ville (annonce du plan).$$),
        'fixation', jsonb_build_object('question', $$Dans l'exemple ci-dessus, quelle phrase correspond à l'annonce du plan ?$$, 'solution', $$« Dans ce commentaire, nous montrerons d'abord le bonheur de l'enfance au village, avant d'étudier les difficultés de la vie adulte en ville. »$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois composantes de la conclusion$$,
        'body', $$La conclusion, elle aussi rédigée en un seul paragraphe, comporte : le bilan, qui résume la réflexion menée sur le sens et l'intérêt du texte ; la prise de position (ou jugement personnel), qui répond aux questions soulevées par l'introduction ; et une ouverture facultative, qui élargit la réflexion (par exemple un rapprochement avec un autre texte ou un intérêt plus large du texte étudié).$$,
        'highlights', array[$$bilan$$, $$prise de position$$, $$ouverture (facultative)$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$La conclusion tient en un seul paragraphe et suit l'ordre : bilan → prise de position → ouverture facultative.$$),
        'fixation', jsonb_build_object('question', $$L'ouverture est-elle une étape obligatoire de la conclusion ?$$, 'solution', $$Non, elle est facultative — contrairement au bilan et à la prise de position.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de conclusion rédigée$$,
        'body', $$En reprenant le même texte support fictif « Racines », voici comment une conclusion pourrait être construite à partir des trois composantes vues plus haut.$$,
        'highlights', array[$$bilan → prise de position → ouverture$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige une conclusion pour le commentaire composé de « Racines ».$$, 'solution', $$En somme, ce poème retrace le contraste entre l'insouciance de l'enfance villageoise et les épreuves de la vie adulte en ville (bilan). Ce contraste rappelle que le souvenir de l'enfance reste, pour beaucoup, un refuge face aux difficultés du présent (prise de position). Ce texte peut être rapproché d'autres œuvres de la littérature africaine qui, elles aussi, opposent la nostalgie du village natal aux réalités de l'exode vers la ville (ouverture).$$),
        'fixation', jsonb_build_object('question', $$Que doit faire la « prise de position » dans une conclusion ?$$, 'solution', $$Elle répond aux questions ou à la problématique soulevées dans l'introduction, en exprimant un point de vue personnel sur le texte.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un texte support : « Le vieux Koffi regardait le fleuve depuis son banc, comme chaque soir. Les enfants du quartier passaient en courant, insouciants, sans un regard pour lui. Il se souvenait d'un temps où ce même banc était toujours entouré de voisins venus écouter ses histoires. » Le libellé associé est : « Étudiez d'abord la solitude du vieux Koffi, puis le contraste entre le présent et le passé. »$$,
      'questions', array[
        $$Rédige une introduction complète pour ce commentaire, en respectant les trois composantes vues dans ce cours.$$,
        $$Rédige une conclusion complète, en incluant au moins le bilan et la prise de position.$$,
        $$Propose une ouverture possible pour cette conclusion.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans quel ordre se succèdent les trois composantes d'une introduction de commentaire composé ?$$,
      'hint', $$On part du général pour aller vers le particulier, puis on annonce la suite.$$,
      'expected', $$Généralité (contextualisation), puis présentation du texte, puis annonce du plan.$$
    ),
    jsonb_build_object(
      'question', $$Combien de paragraphes comporte une introduction de commentaire composé ?$$,
      'hint', $$C'est la même règle que pour la conclusion.$$,
      'expected', $$Un seul paragraphe (un seul alinéa).$$
    ),
    jsonb_build_object(
      'question', $$Quelle composante de la conclusion est facultative ?$$,
      'hint', $$Les deux autres (bilan et prise de position) sont obligatoires.$$,
      'expected', $$L'ouverture.$$
    ),
    jsonb_build_object(
      'question', $$Que fait le « bilan » dans une conclusion de commentaire composé ?$$,
      'hint', $$C'est la première étape de la conclusion.$$,
      'expected', $$Il résume la réflexion menée sur le sens et l'intérêt du texte étudié.$$
    )
  ),
  now()
);
