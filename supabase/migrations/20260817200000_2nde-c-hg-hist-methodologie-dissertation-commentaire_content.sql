-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3650: "2nde H3-les
-- techniques de devoirs" (https://lyc.ecole-ci.org/course/view.php?id=3650).
-- Resource "Je lis le résumé de la leçon", mod_resource id 37003, redirecting
-- to pluginfile "2nde H3-les techniques de devoirs.pdf". Cross-checked
-- against the already-sourced Seconde A lesson for this exact same
-- title/filename (categoryid=102): identical PDF filename and, on page-1
-- inspection of the situation d'apprentissage, identical wording, confirming
-- this Histoire-Géographie lesson is common-trunk content shared by Seconde A
-- and Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 1, Leçon 3). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-hist-methodologie-dissertation-commentaire',
  '2nde',
  'C',
  'histoire',
  $$La méthodologie de la dissertation et du commentaire de document$$,
  3,
  '2nde-c-hg-hist-methodes-etude-histoire',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au début de l'année, des élèves de première préviennent des élèves de seconde qu'ils seront bientôt évalués sur deux nouveaux types d'exercices en histoire-géographie : la dissertation et le commentaire de document. Pour ne pas être pris au dépourvu, les élèves de seconde décident de rechercher, avec l'aide de leur professeur, la méthode à suivre pour réussir ces deux exercices.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La dissertation : un exercice de réflexion structuré$$,
        'body', $$La dissertation est un exercice rédigé qui consiste à organiser méthodiquement ses connaissances sur un sujet donné, afin de mesurer la capacité de réflexion et de construction de la pensée. Elle comprend toujours trois grandes parties : l'introduction, qui présente le sujet et annonce la démarche suivie ; le développement, qui constitue le corps du devoir en deux ou trois parties argumentées ; et la conclusion, qui referme la réflexion. Réussir cet exercice suppose une bonne connaissance des leçons, une culture générale solide et une maîtrise des techniques de rédaction.$$,
        'highlights', array[$$introduction$$, $$développement$$, $$conclusion$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La dissertation est un exercice rédigé qui consiste à organiser avec méthode des connaissances sur un sujet donné, afin de mesurer la capacité de réflexion de l'élève.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois grandes parties d'une dissertation ?$$, 'solution', $$L'introduction, le développement et la conclusion.$$)
      ),
      jsonb_build_object(
        'heading', $$Le contenu précis de l'introduction et de la conclusion$$,
        'body', $$L'introduction comporte trois éléments : la présentation du sujet (qui le situe dans le temps et dans l'espace et en précise les termes), la problématique (la question centrale que pose le sujet, de préférence formulée sous forme interrogative) et l'annonce du plan (qui présente clairement les grandes parties du développement). La conclusion, elle, comprend le bilan (rappel des points forts de la démonstration), la réponse à la problématique posée en introduction, et une ouverture qui élargit la réflexion vers une question connexe.$$,
        'highlights', array[$$problématique$$, $$annonce du plan$$, $$bilan$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois éléments attendus dans la conclusion d'une dissertation ?$$, 'solution', $$Le bilan, la réponse à la problématique, et l'ouverture.$$)
      ),
      jsonb_build_object(
        'heading', $$Les principaux types de sujets et leurs plans$$,
        'body', $$Le type de sujet détermine largement le plan à adopter. Un sujet comparatif (par exemple comparer deux organisations sociales) appelle un plan en deux parties : ressemblances puis différences. Un sujet évolutif ou chronologique se traite en suivant les grandes étapes dans le temps. Un sujet dialectique (souvent formulé comme une question fermée) invite à examiner d'abord les aspects positifs, puis les limites de l'idée. Un sujet analytique ou thématique se découpe généralement en conditions, apports et limites/problèmes d'un phénomène.$$,
        'highlights', array[$$sujet comparatif$$, $$sujet chronologique$$, $$sujet dialectique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type de sujet$$, $$Plan possible$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Comparatif$$, $$I. Ressemblances — II. Différences$$),
            jsonb_build_array($$Chronologique$$, $$Découpage en grandes périodes successives$$),
            jsonb_build_array($$Dialectique$$, $$I. Aspects positifs — II. Limites de l'idée$$),
            jsonb_build_array($$Analytique/thématique$$, $$I. Conditions — II. Apports — III. Limites$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Un sujet demande : « La colonisation a-t-elle été un mal nécessaire pour l'Afrique ? ». À quel type de sujet correspond-il, et quel plan pourrait-on adopter ?$$, 'solution', $$C'est un sujet dialectique. Un plan possible : I. Les aspects qui vont dans le sens de l'idée (les apports de la colonisation) — II. Les limites de cette idée (les aspects négatifs de la colonisation).$$),
        'fixation', jsonb_build_object('question', $$Quel plan convient généralement à un sujet de type chronologique ou évolutif ?$$, 'solution', $$Un découpage en grandes périodes ou étapes successives dans le temps.$$)
      ),
      jsonb_build_object(
        'heading', $$La démarche pratique pour traiter une dissertation$$,
        'body', $$Trois grandes phases structurent le travail. D'abord, la compréhension du sujet : le recopier, le lire attentivement, souligner et expliquer les mots clés, puis le reformuler avec ses propres mots. Ensuite, l'analyse du sujet : mobiliser ses connaissances, dégager la problématique, classer les idées par thème pour aboutir à un plan détaillé. Enfin, la rédaction : rédiger entièrement l'introduction et la conclusion au brouillon, rédiger directement le développement sur la copie à partir du plan détaillé, en reliant chaque partie par des phrases de transition.$$,
        'highlights', array[$$compréhension du sujet$$, $$plan détaillé$$]::text[],
        'fixation', jsonb_build_object('question', $$Que faut-il rédiger entièrement au brouillon avant de composer le devoir sur la copie ?$$, 'solution', $$L'introduction et la conclusion.$$)
      ),
      jsonb_build_object(
        'heading', $$Le commentaire de document : structure et types de questions$$,
        'body', $$Le commentaire de document est un exercice dirigé qui consiste à exploiter un document pour l'expliquer, en répondant précisément à des questions posées. Après un travail préliminaire (numéroter les lignes, lire attentivement, dégager le thème central), trois types de questions se succèdent généralement. La question introductive porte sur la présentation du document : sa nature, son origine, son auteur, sa date, son contexte historique et son idée générale. La question de compréhension demande d'expliquer, de commenter ou de discuter un passage précis. La question d'ouverture, enfin, invite à dégager la portée du document (son impact sur la suite de l'histoire) et à prendre position sur le débat qu'il soulève.$$,
        'highlights', array[$$question introductive$$, $$question de compréhension$$, $$question d'ouverture$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels éléments doit-on identifier dans la présentation d'un document historique ?$$, 'solution', $$Sa nature, son origine, son destinataire, sa date, son auteur, son contexte historique et son idée générale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de seconde doit rédiger le commentaire d'un texte d'un historien africain sur la place de la tradition orale, et doit aussi savoir bâtir le plan d'une dissertation sur un sujet dialectique. Il doit mobiliser tout ce qu'il sait sur la méthode de ces deux exercices.$$,
      'questions', array[
        $$Cite les trois parties obligatoires d'une dissertation.$$,
        $$Donne un exemple de plan adapté à un sujet comparatif.$$,
        $$Cite les trois grandes phases de la démarche à suivre pour traiter une dissertation.$$,
        $$Cite les trois types de questions que l'on trouve généralement dans un commentaire de document.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on la question essentielle soulevée par un sujet de dissertation ?$$,
      'hint', $$C'est le fil directeur du devoir.$$,
      'expected', $$La problématique.$$
    ),
    jsonb_build_object(
      'question', $$Quel plan convient à un sujet dialectique comme « La colonisation a-t-elle été un mal nécessaire pour l'Afrique ? » ?$$,
      'hint', $$On examine d'abord un sens, puis les limites de ce sens.$$,
      'expected', $$Un plan en deux parties : les aspects positifs, puis les limites de cette idée (aspects négatifs).$$
    ),
    jsonb_build_object(
      'question', $$Dans un commentaire de document, quel élément de la présentation retranscrit les circonstances ayant mené à l'événement décrit ?$$,
      'hint', $$Ce n'est ni l'auteur, ni la date, mais ce qui entoure l'événement.$$,
      'expected', $$Le contexte historique.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les trois éléments attendus dans la conclusion d'une dissertation ?$$,
      'hint', $$On fait le point, on répond, puis on élargit.$$,
      'expected', $$Le bilan, la réponse à la problématique, et l'ouverture.$$
    )
  ),
  now()
);
