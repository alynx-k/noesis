-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1854: "EE 9: Prdtion-écrite_Analyser_sujet-Rech_idées"
-- (https://lyc.ecole-ci.org/course/view.php?id=1854), resource id 15710 —
-- "Séances 6, 7, 8 : la production écrite — analyser le sujet et
-- rechercher les idées". Contenu méthodologique réécrit à partir du PDF
-- source (composition du sujet, mots-clés, reformulation, recherche
-- d'idées en variant les domaines, illustration par des exemples réels
-- non-littéraires). Le sujet d'exemple du PDF (football) est remplacé par
-- un sujet ENTIÈREMENT ORIGINAL sur la téléphonie mobile en Afrique, avec
-- des exemples factuels réels et vérifiables (M-Pesa, Orange Money), en
-- cohérence avec la politique « 100% contenu original » de l'application.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-production-ecrite-analyser-rechercher',
  '1ere',
  'A',
  'francais',
  $$La production écrite : analyser le sujet et rechercher les idées$$,
  9,
  '1ere-a-fr-dissertation-introduction-conclusion',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Contrairement au commentaire composé ou à la dissertation littéraire, la production écrite porte souvent sur un sujet de société ou d'actualité, à étayer avec des exemples tirés de la culture générale plutôt que d'œuvres littéraires. Des élèves de 1ère A découvrent un tel sujet et s'organisent pour apprendre à l'analyser et à rechercher des idées.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La composition et la compréhension du sujet$$,
        'body', $$Comme pour la dissertation littéraire, un sujet de production écrite comporte deux parties : l'opinion de l'auteur, donnée dans une phrase affirmative, et la consigne (par exemple « étayez cette assertion »). Pour comprendre le sujet, on identifie et on analyse les mots-clés en cherchant leurs différents sens, puis on reformule l'opinion de l'auteur avec ses propres mots, afin de vérifier qu'on l'a bien comprise avant de chercher des idées.$$,
        'highlights', array[$$opinion + consigne$$, $$mots-clés$$, $$reformulation$$]::text[],
        'example', jsonb_build_object('statement', $$Sujet : « Dans le domaine de la téléphonie mobile, l'Afrique n'a plus rien à envier aux autres continents. » Étayez cette assertion. Identifie l'opinion et la consigne, puis explique le mot-clé « n'a plus rien à envier ».$$, 'solution', $$Opinion : « Dans le domaine de la téléphonie mobile, l'Afrique n'a plus rien à envier aux autres continents. » Consigne : « Étayez cette assertion. » « N'a plus rien à envier » signifie : n'est plus en retard, a rattrapé, est devenue au moins aussi performante.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi reformule-t-on l'opinion de l'auteur avant de chercher des idées ?$$, 'solution', $$Pour vérifier qu'on a bien compris le sens exact du sujet avant de se lancer dans la recherche d'arguments.$$)
      ),
      jsonb_build_object(
        'heading', $$Rechercher des idées en variant les domaines$$,
        'body', $$Pour un sujet de production écrite, la recherche d'idées se fait souvent en variant les domaines concernés par le thème (par exemple, pour un sujet technologique : les usages, les infrastructures, l'innovation locale, l'impact économique). Chaque argument doit être illustré par un exemple précis et vérifiable, tiré de l'actualité ou de la culture générale plutôt que d'une œuvre littéraire.$$,
        'highlights', array[$$varier les domaines$$, $$exemples tirés de l'actualité/culture générale$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le sujet sur la téléphonie mobile, propose un argument sur le domaine « innovation locale », avec un exemple précis.$$, 'solution', $$L'Afrique a été pionnière dans certains usages du mobile plutôt que simplement suiveuse : le service M-Pesa, lancé au Kenya en 2007, a permis à des millions de personnes sans compte bancaire d'envoyer et de recevoir de l'argent par téléphone, une innovation qui a ensuite inspiré des services similaires ailleurs dans le monde.$$),
        'fixation', jsonb_build_object('question', $$Dans un sujet de production écrite, les exemples doivent-ils venir uniquement d'œuvres littéraires ?$$, 'solution', $$Non : contrairement à la dissertation littéraire, les exemples viennent surtout de l'actualité, de la culture générale ou de l'expérience personnelle.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de recherche d'idées organisée$$,
        'body', $$Pour le sujet sur la téléphonie mobile, plusieurs arguments peuvent être organisés par domaine : au niveau des usages financiers, le mobile money (Orange Money, MTN Mobile Money) permet à des millions d'Ivoiriens sans compte bancaire de payer et d'épargner ; au niveau des infrastructures, la couverture réseau s'est fortement étendue même dans les zones rurales ; au niveau économique, le secteur du numérique crée des emplois et des start-ups, notamment autour d'Abidjan ou de Nairobi (surnommée « Silicon Savannah »).$$,
        'highlights', array[$$usages financiers$$, $$infrastructures$$, $$impact économique$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi organiser les idées par domaines (usages, infrastructures, économie) plutôt que de les lister au hasard ?$$, 'solution', $$Parce que cela structure la réflexion et évite de répéter des idées proches ; chaque domaine devient un argument distinct et développable.$$)
      ),
      jsonb_build_object(
        'heading', $$Vérifier la pertinence des idées trouvées$$,
        'body', $$Une fois les idées trouvées, il faut vérifier qu'elles répondent bien à la consigne et à l'opinion de l'auteur, et écarter celles qui sont hors sujet ou trop vagues. Une idée pertinente doit pouvoir être formulée en une phrase claire, puis développée et illustrée par un exemple concret et vérifiable.$$,
        'highlights', array[$$vérifier la pertinence$$, $$écarter le hors-sujet$$]::text[],
        'fixation', jsonb_build_object('question', $$Que faire d'une idée qui semble intéressante mais ne répond pas directement à la consigne du sujet ?$$, 'solution', $$L'écarter, même si elle est intéressante en soi : toutes les idées retenues doivent répondre directement à la consigne et à l'opinion de l'auteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un sujet de production écrite : « L'agriculture n'est plus, en Côte d'Ivoire, une activité réservée aux zones rurales. » Étayez cette assertion.$$,
      'questions', array[
        $$Identifie l'opinion et la consigne de ce sujet, puis explique le mot-clé « n'est plus réservée ».$$,
        $$Propose deux domaines dans lesquels chercher des idées pour ce sujet (par exemple : agriculture urbaine, formation, technologie...).$$,
        $$Pour l'un de ces domaines, propose un argument illustré par un exemple précis et vérifiable.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux parties d'un sujet de production écrite ?$$,
      'hint', $$C'est la même structure que pour la dissertation littéraire.$$,
      'expected', $$L'opinion de l'auteur (une phrase affirmative) et la consigne.$$
    ),
    jsonb_build_object(
      'question', $$D'où viennent principalement les exemples utilisés dans une production écrite, à la différence d'une dissertation littéraire ?$$,
      'hint', $$Ce n'est généralement pas la même source d'exemples.$$,
      'expected', $$De l'actualité, de la culture générale ou de l'expérience personnelle, plutôt que d'œuvres littéraires.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi doit-on reformuler l'opinion de l'auteur avant de chercher des idées ?$$,
      'hint', $$C'est une vérification.$$,
      'expected', $$Pour s'assurer d'avoir bien compris le sujet avant de commencer la recherche d'arguments.$$
    ),
    jsonb_build_object(
      'question', $$Que doit-on faire d'une idée qui ne répond pas directement à la consigne ?$$,
      'hint', $$Même si elle semble intéressante.$$,
      'expected', $$L'écarter, car elle serait hors sujet.$$
    )
  ),
  now()
);
