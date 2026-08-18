-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 807: "EE 6: Dissert_littér_Elaborer_plan"
-- (https://lyc.ecole-ci.org/course/view.php?id=807), resource id 3333 —
-- "Séance 3 : élaborer le plan du développement" (Leçon 3 : la
-- dissertation littéraire). Explications méthodologiques réécrites à
-- partir du PDF source (plan dialectique/antithétique, ordre de
-- présentation des parties, exigence d'une illustration précise — pas
-- seulement le titre et l'auteur, mais l'élément du texte qui illustre le
-- propos). Les références d'œuvres et d'auteurs réels sont des faits
-- bibliographiques réels, réutilisés comme dans la leçon précédente.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-dissertation-elaborer-plan',
  '1ere',
  'A',
  'francais',
  $$La dissertation littéraire : élaborer le plan$$,
  6,
  '1ere-a-fr-dissertation-rechercher-idees',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir trouvé des idées et des exemples pour leur sujet de dissertation, les élèves de 1ère A doivent maintenant les organiser en un plan détaillé, structuré et bien ordonné, avant de passer à la rédaction proprement dite.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le plan dialectique (ou antithétique)$$,
        'body', $$Le plan doit être adapté à la problématique du sujet, à laquelle il permet, dans son cheminement, de trouver une réponse. Quand un sujet propose une thèse à « expliquer et discuter », on utilise souvent un plan dialectique (ou antithétique) : une première partie qui explique et confirme la thèse proposée, puis une seconde partie qui l'élargit ou la nuance en montrant d'autres aspects du problème.$$,
        'highlights', array[$$plan dialectique$$, $$1ère partie : la thèse$$, $$2ème partie : l'élargir/la nuancer$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le plan dialectique confirme la thèse du sujet dans une première partie, puis la nuance ou l'élargit dans une seconde partie.$$),
        'fixation', jsonb_build_object('question', $$Dans quel cas utilise-t-on typiquement un plan dialectique ?$$, 'solution', $$Quand la consigne demande d'« expliquer et discuter » une thèse ou une opinion donnée dans le sujet.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ordre de présentation des parties et des arguments$$,
        'body', $$Les grandes parties, comme les arguments à l'intérieur de chaque partie, obéissent à un ordre de présentation qui va du plus évident au moins évident, ou du moins important au plus important. Cet ordre n'est pas figé : il dépend de ce que l'auteur du devoir juge le plus pertinent, et peut donc varier d'un candidat à un autre — l'essentiel est que la progression soit cohérente et que le devoir se termine sur l'argument le plus fort.$$,
        'highlights', array[$$du plus évident au moins évident$$, $$se termine sur l'argument le plus fort$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi vaut-il mieux terminer une partie par son argument le plus fort plutôt que par le plus évident ?$$, 'solution', $$Parce que cela laisse une impression de progression et de profondeur de réflexion chez le correcteur, plutôt que de retomber sur une idée trop attendue.$$)
      ),
      jsonb_build_object(
        'heading', $$Illustrer précisément un argument$$,
        'body', $$Un plan détaillé classe les idées directrices, les arguments et les exemples à utiliser. Mais il ne suffit pas, au niveau des exemples, de citer le titre d'une œuvre et son auteur : il faut relever l'élément précis du texte (un personnage, une scène, un procédé) qui illustre concrètement l'argument. Un exemple bien exploité montre au correcteur que le candidat connaît vraiment l'œuvre, et pas seulement son titre.$$,
        'highlights', array[$$pas seulement titre + auteur$$, $$l'élément précis qui illustre le propos$$]::text[],
        'example', jsonb_build_object('statement', $$Pour l'argument « la littérature dénonce des coutumes jugées rétrogrades », comment illustrer précisément avec l'œuvre Rebelle de Fatou Keïta ?$$, 'solution', $$Il ne suffit pas d'écrire « Rebelle de Fatou Keïta » : il faut préciser, par exemple, que la fuite de l'héroïne Malimouna la nuit de ses noces forcées est une dénonciation directe du mariage forcé.$$),
        'fixation', jsonb_build_object('question', $$Que doit contenir un exemple bien construit, en plus du titre de l'œuvre et du nom de l'auteur ?$$, 'solution', $$L'élément précis du texte (personnage, scène, procédé) qui illustre concrètement l'argument avancé.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de plan détaillé (extrait)$$,
        'body', $$Pour un sujet sur « littérature et société », un plan dialectique détaillé peut se présenter ainsi : 1ère partie (thèse) — La littérature est le reflet de la société, avec pour argument 1 le plan politique (une œuvre qui dénonce un abus de pouvoir précis) et pour argument 2 le plan culturel (une œuvre qui dénonce une coutume précise) ; 2ème partie (antithèse) — La littérature a d'autres aspects, avec pour argument l'expression de sentiments personnels (un poème précis évoquant un deuil ou une nostalgie) ou la recherche du beau (un procédé d'écriture particulier).$$,
        'highlights', array[$$argument 1, argument 2 par partie$$, $$chaque argument = un exemple précis$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien d'arguments principaux comporte en général chaque grande partie d'un plan dialectique ?$$, 'solution', $$En général deux ou trois arguments, chacun illustré par au moins un exemple précis.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le sujet « expliquez et discutez l'idée selon laquelle la lecture d'une œuvre littéraire transforme durablement celui qui la lit », un élève a déjà trouvé deux parties : 1) la lecture transforme le lecteur (identification aux personnages, prise de conscience de ses travers) ; 2) la lecture apporte d'autres bénéfices (découverte d'autres cultures, divertissement).$$,
      'questions', array[
        $$Ce plan est-il un plan dialectique ? Justifie en identifiant la thèse et l'antithèse/l'élargissement.$$,
        $$Pour l'argument « prise de conscience de ses propres travers », propose un exemple précis (œuvre + élément du texte, pas seulement le titre).$$,
        $$Dans quel ordre proposerais-tu les deux arguments de la première partie, et pourquoi ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que confirme la première partie d'un plan dialectique ?$$,
      'hint', $$C'est la thèse proposée par le sujet.$$,
      'expected', $$La thèse (le point de vue) proposée par le sujet.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel ordre classe-t-on en général les arguments d'une partie ?$$,
      'hint', $$On progresse dans la réflexion.$$,
      'expected', $$Du plus évident (ou moins important) au moins évident (ou plus important).$$
    ),
    jsonb_build_object(
      'question', $$Que reproche-t-on à un exemple qui se limite à citer un titre d'œuvre et un auteur, sans plus ?$$,
      'hint', $$Ce n'est pas suffisant pour prouver la connaissance de l'œuvre.$$,
      'expected', $$Il manque l'élément précis du texte (personnage, scène, procédé) qui illustre concrètement l'argument.$$
    ),
    jsonb_build_object(
      'question', $$Un plan dialectique peut-il varier d'un candidat à un autre pour un même sujet ?$$,
      'hint', $$Pense à ce qui détermine l'ordre des arguments.$$,
      'expected', $$Oui, car l'organisation dépend de ce que chaque candidat juge le plus important ou le plus pertinent.$$
    )
  ),
  now()
);
